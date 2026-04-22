import { EventEmitter } from "node:events";

export type OrderEvent =
  | { type: "order.created"; orderId: string }
  | { type: "order.sent"; orderId: string }
  | { type: "order.rung_in"; orderId: string };

const bus = new EventEmitter();
bus.setMaxListeners(100);

export function publishOrderEvent(event: OrderEvent) {
  bus.emit("order", event);
}

export function subscribeOrderEvents(listener: (e: OrderEvent) => void) {
  bus.on("order", listener);
  return () => bus.off("order", listener);
}
