import { z } from "zod";

export const OrderStatus = z.enum(["PENDING", "SENT", "RUNG_IN", "VOID"]);
export type OrderStatus = z.infer<typeof OrderStatus>;

export const OrderItemInput = z.object({
  menuItemId: z.string(),
  qty: z.number().int().min(1).max(99),
  note: z.string().max(140).optional(),
  modifierIds: z.array(z.string()).default([]),
});
export type OrderItemInput = z.infer<typeof OrderItemInput>;

export const CreateOrderRequest = z.object({
  clientUuid: z.string().uuid(),
  tableId: z.string(),
  items: z.array(OrderItemInput).min(1),
});
export type CreateOrderRequest = z.infer<typeof CreateOrderRequest>;

export const OrderItemModifier = z.object({
  id: z.string(),
  modifierId: z.string(),
  name: z.string(),
  priceDeltaPence: z.number().int(),
});
export type OrderItemModifier = z.infer<typeof OrderItemModifier>;

export const OrderItem = z.object({
  id: z.string(),
  menuItemId: z.string(),
  name: z.string(),
  tillCode: z.string(),
  qty: z.number().int(),
  unitPricePence: z.number().int(),
  note: z.string().optional().nullable(),
  modifiers: z.array(OrderItemModifier),
});
export type OrderItem = z.infer<typeof OrderItem>;

export const Order = z.object({
  id: z.string(),
  clientUuid: z.string(),
  staffId: z.string(),
  staffName: z.string(),
  tableId: z.string(),
  tableLabel: z.string(),
  areaName: z.string(),
  status: OrderStatus,
  createdAt: z.string(),
  syncedAt: z.string().nullable(),
  rungInAt: z.string().nullable(),
  rungInBy: z.string().nullable(),
  items: z.array(OrderItem),
  totalPence: z.number().int(),
});
export type Order = z.infer<typeof Order>;

/** Sum (unit + sum(modifiers)) * qty, in pence. */
export function computeOrderTotalPence(items: OrderItem[]): number {
  return items.reduce((sum, it) => {
    const mods = it.modifiers.reduce((s, m) => s + m.priceDeltaPence, 0);
    return sum + (it.unitPricePence + mods) * it.qty;
  }, 0);
}
