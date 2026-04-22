import type { Order } from "@bank-pos/shared";
import { prisma } from "../prisma.js";
import { publishOrderEvent } from "../events.js";
import type { OrderFulfilmentAdapter } from "./adapter.js";

/**
 * Manual-till adapter: marks the order SENT and broadcasts to the Bar Display,
 * where a human operator will re-ring it on the existing ICRTouch till and
 * confirm it as RUNG_IN.
 */
export const manualTillAdapter: OrderFulfilmentAdapter = {
  name: "manual-till",
  async send(order: Order) {
    const updated = await prisma.order.update({
      where: { id: order.id },
      data: { status: "SENT", syncedAt: new Date() },
    });
    publishOrderEvent({ type: "order.sent", orderId: updated.id });
  },
};
