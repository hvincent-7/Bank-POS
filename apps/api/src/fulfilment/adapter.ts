import type { Order } from "@bank-pos/shared";

/**
 * Seam for pushing a confirmed order onwards — either to a human-driven "ring it
 * in on the till" workflow (MVP) or, in future, directly to ICRTouch via the
 * POS API. Keeping this behind an interface means the order-creation path never
 * has to change when we flip implementations.
 */
export interface OrderFulfilmentAdapter {
  readonly name: string;
  send(order: Order): Promise<void>;
}
