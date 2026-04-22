import { describe, it, expect } from "vitest";
import { computeOrderTotalPence, type OrderItem } from "./order.js";

describe("computeOrderTotalPence", () => {
  it("sums unit prices times qty", () => {
    const items: OrderItem[] = [
      { id: "a", menuItemId: "m1", name: "Lager", tillCode: "D001", qty: 2, unitPricePence: 540, note: null, modifiers: [] },
      { id: "b", menuItemId: "m2", name: "Chips", tillCode: "F001", qty: 1, unitPricePence: 400, note: null, modifiers: [] },
    ];
    expect(computeOrderTotalPence(items)).toBe(540 * 2 + 400);
  });

  it("applies modifier deltas (including negative) per unit", () => {
    const items: OrderItem[] = [
      {
        id: "a",
        menuItemId: "m1",
        name: "Lager (half)",
        tillCode: "D001",
        qty: 3,
        unitPricePence: 540,
        note: null,
        modifiers: [{ id: "x", modifierId: "mod-half", name: "Half", priceDeltaPence: -270 }],
      },
    ];
    expect(computeOrderTotalPence(items)).toBe((540 - 270) * 3);
  });
});
