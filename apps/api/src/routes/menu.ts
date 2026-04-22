import type { FastifyInstance } from "fastify";
import { authGuard } from "../auth.js";
import { prisma } from "../prisma.js";

export async function menuRoutes(app: FastifyInstance) {
  app.get("/menu", { preHandler: authGuard }, async () => {
    const [categories, items] = await Promise.all([
      prisma.menuCategory.findMany({ orderBy: { sortOrder: "asc" } }),
      prisma.menuItem.findMany({
        where: { active: true },
        include: {
          modifierGroupLinks: {
            include: {
              modifierGroup: { include: { modifiers: true } },
            },
          },
        },
      }),
    ]);

    return {
      categories: categories.map((c) => ({
        id: c.id,
        name: c.name,
        sortOrder: c.sortOrder,
      })),
      items: items.map((i) => ({
        id: i.id,
        categoryId: i.categoryId,
        name: i.name,
        pricePence: i.pricePence,
        tillCode: i.tillCode,
        active: i.active,
        modifierGroups: i.modifierGroupLinks.map((l) => ({
          id: l.modifierGroup.id,
          name: l.modifierGroup.name,
          min: l.modifierGroup.min,
          max: l.modifierGroup.max,
          modifiers: l.modifierGroup.modifiers.map((m) => ({
            id: m.id,
            name: m.name,
            priceDeltaPence: m.priceDeltaPence,
          })),
        })),
      })),
    };
  });

  app.get("/tables", { preHandler: authGuard }, async () => {
    const [areas, tables] = await Promise.all([
      prisma.area.findMany({ orderBy: { name: "asc" } }),
      prisma.table.findMany({ orderBy: { label: "asc" } }),
    ]);
    return {
      areas: areas.map((a) => ({ id: a.id, name: a.name })),
      tables: tables.map((t) => ({ id: t.id, areaId: t.areaId, label: t.label })),
    };
  });
}
