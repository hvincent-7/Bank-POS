import type { FastifyInstance } from "fastify";
import { Prisma } from "@prisma/client";
import { CreateOrderRequest, type Order } from "@bank-pos/shared";
import { authGuard, requireRole } from "../auth.js";
import { prisma } from "../prisma.js";
import { manualTillAdapter } from "../fulfilment/manual-till.js";
import { publishOrderEvent } from "../events.js";

const orderInclude = {
  staff: true,
  table: { include: { area: true } },
  rungInBy: true,
  items: {
    include: {
      menuItem: true,
      modifiers: { include: { modifier: true } },
    },
  },
} satisfies Prisma.OrderInclude;

type OrderWithRelations = Prisma.OrderGetPayload<{ include: typeof orderInclude }>;

function toDto(o: OrderWithRelations): Order {
  const items = o.items.map((it) => ({
    id: it.id,
    menuItemId: it.menuItemId,
    name: it.menuItem.name,
    tillCode: it.menuItem.tillCode,
    qty: it.qty,
    unitPricePence: it.unitPricePence,
    note: it.note,
    modifiers: it.modifiers.map((m) => ({
      id: m.id,
      modifierId: m.modifierId,
      name: m.modifier.name,
      priceDeltaPence: m.priceDeltaPence,
    })),
  }));
  const totalPence = items.reduce((sum, it) => {
    const mods = it.modifiers.reduce((s, m) => s + m.priceDeltaPence, 0);
    return sum + (it.unitPricePence + mods) * it.qty;
  }, 0);
  return {
    id: o.id,
    clientUuid: o.clientUuid,
    staffId: o.staffId,
    staffName: o.staff.name,
    tableId: o.tableId,
    tableLabel: o.table.label,
    areaName: o.table.area.name,
    status: o.status,
    createdAt: o.createdAt.toISOString(),
    syncedAt: o.syncedAt?.toISOString() ?? null,
    rungInAt: o.rungInAt?.toISOString() ?? null,
    rungInBy: o.rungInBy?.name ?? null,
    items,
    totalPence,
  };
}

export async function orderRoutes(app: FastifyInstance) {
  /**
   * Idempotent create. The PWA always generates a clientUuid and retries on
   * failure; the unique constraint on clientUuid dedupes duplicates, so an
   * offline sync storm can't double-book the same order.
   */
  app.post("/orders", { preHandler: authGuard }, async (req, reply) => {
    const body = CreateOrderRequest.parse(req.body);
    const staffId = req.user.sub;

    const existing = await prisma.order.findUnique({
      where: { clientUuid: body.clientUuid },
      include: orderInclude,
    });
    if (existing) {
      return reply.status(200).send(toDto(existing));
    }

    // Snapshot current prices and modifier deltas so the ticket doesn't shift
    // if an admin edits the menu between order creation and ring-in.
    const menuItems = await prisma.menuItem.findMany({
      where: { id: { in: body.items.map((i) => i.menuItemId) } },
    });
    const modifierIds = body.items.flatMap((i) => i.modifierIds);
    const modifiers = modifierIds.length
      ? await prisma.modifier.findMany({ where: { id: { in: modifierIds } } })
      : [];
    const mById = new Map(menuItems.map((m) => [m.id, m]));
    const modById = new Map(modifiers.map((m) => [m.id, m]));

    for (const it of body.items) {
      if (!mById.has(it.menuItemId)) {
        return reply.status(400).send({ error: `Unknown menu item ${it.menuItemId}` });
      }
      for (const mid of it.modifierIds) {
        if (!modById.has(mid)) {
          return reply.status(400).send({ error: `Unknown modifier ${mid}` });
        }
      }
    }

    let created: OrderWithRelations;
    try {
      created = await prisma.order.create({
        data: {
          clientUuid: body.clientUuid,
          staffId,
          tableId: body.tableId,
          status: "PENDING",
          items: {
            create: body.items.map((it) => {
              const mi = mById.get(it.menuItemId)!;
              return {
                menuItemId: it.menuItemId,
                qty: it.qty,
                unitPricePence: mi.pricePence,
                note: it.note,
                modifiers: {
                  create: it.modifierIds.map((mid) => {
                    const mod = modById.get(mid)!;
                    return { modifierId: mid, priceDeltaPence: mod.priceDeltaPence };
                  }),
                },
              };
            }),
          },
        },
        include: orderInclude,
      });
    } catch (e: unknown) {
      // Race: two concurrent retries with same clientUuid arrive at once.
      if (
        e instanceof Prisma.PrismaClientKnownRequestError &&
        e.code === "P2002"
      ) {
        const dup = await prisma.order.findUnique({
          where: { clientUuid: body.clientUuid },
          include: orderInclude,
        });
        if (dup) return reply.status(200).send(toDto(dup));
      }
      throw e;
    }

    publishOrderEvent({ type: "order.created", orderId: created.id });
    const dto = toDto(created);
    // Hand off to the fulfilment adapter; manual-till path just marks SENT and
    // publishes to the Bar Display SSE stream. Fire-and-forget is fine — the
    // client has already been told the order is accepted.
    manualTillAdapter.send(dto).catch((err) => {
      app.log.error({ err, orderId: created.id }, "fulfilment failed");
    });
    return reply.status(201).send(dto);
  });

  app.get("/orders/mine", { preHandler: authGuard }, async (req) => {
    const staffId = req.user.sub;
    const since = new Date();
    since.setHours(0, 0, 0, 0);
    const orders = await prisma.order.findMany({
      where: { staffId, createdAt: { gte: since } },
      orderBy: { createdAt: "desc" },
      include: orderInclude,
    });
    return orders.map(toDto);
  });

  /** Bar-display queue: orders that still need to be rung in on the till. */
  app.get(
    "/orders/pending",
    { preHandler: requireRole("BAR", "MANAGER") },
    async () => {
      const orders = await prisma.order.findMany({
        where: { status: { in: ["PENDING", "SENT"] } },
        orderBy: { createdAt: "asc" },
        include: orderInclude,
      });
      return orders.map(toDto);
    },
  );

  app.post(
    "/orders/:id/rung-in",
    { preHandler: requireRole("BAR", "MANAGER") },
    async (req, reply) => {
      const { id } = req.params as { id: string };
      const updated = await prisma.order.update({
        where: { id },
        data: {
          status: "RUNG_IN",
          rungInAt: new Date(),
          rungInById: req.user.sub,
        },
        include: orderInclude,
      });
      publishOrderEvent({ type: "order.rung_in", orderId: updated.id });
      return reply.send(toDto(updated));
    },
  );

  app.post(
    "/orders/:id/void",
    { preHandler: requireRole("MANAGER") },
    async (req, reply) => {
      const { id } = req.params as { id: string };
      const updated = await prisma.order.update({
        where: { id },
        data: { status: "VOID" },
        include: orderInclude,
      });
      return reply.send(toDto(updated));
    },
  );
}
