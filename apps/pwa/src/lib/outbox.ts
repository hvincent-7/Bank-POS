import Dexie, { type Table } from "dexie";
import type { CreateOrderRequest, Menu, Order, Tables } from "@bank-pos/shared";
import { api, ApiError } from "./api.js";

export interface OutboxItem {
  clientUuid: string;
  payload: CreateOrderRequest;
  createdAt: string;
  attempts: number;
  lastError?: string;
  syncedOrderId?: string;
}

export interface CachedMenu {
  id: "current";
  menu: Menu;
  fetchedAt: string;
}

export interface CachedTables {
  id: "current";
  tables: Tables;
  fetchedAt: string;
}

class BankPosDB extends Dexie {
  outbox!: Table<OutboxItem, string>;
  menuCache!: Table<CachedMenu, string>;
  tablesCache!: Table<CachedTables, string>;

  constructor() {
    super("bank-pos");
    this.version(1).stores({
      outbox: "clientUuid, createdAt",
      menuCache: "id",
      tablesCache: "id",
    });
  }
}

export const db = new BankPosDB();

export async function queueOrder(payload: CreateOrderRequest) {
  await db.outbox.put({
    clientUuid: payload.clientUuid,
    payload,
    createdAt: new Date().toISOString(),
    attempts: 0,
  });
  void drainOutbox();
}

export async function pendingOutboxCount(): Promise<number> {
  return db.outbox.count();
}

let draining = false;

export async function drainOutbox(): Promise<void> {
  if (draining) return;
  draining = true;
  try {
    if (!navigator.onLine) return;
    const items = await db.outbox.orderBy("createdAt").toArray();
    for (const item of items) {
      try {
        const order = await api.createOrder(item.payload);
        await db.outbox.delete(item.clientUuid);
        emitOutboxEvent({ type: "synced", clientUuid: item.clientUuid, order });
      } catch (err) {
        if (err instanceof ApiError && err.status >= 400 && err.status < 500 && err.status !== 409) {
          // Hard rejection (bad data, stale menu id). Drop from outbox but
          // surface so the waiter knows this one didn't go through.
          await db.outbox.delete(item.clientUuid);
          emitOutboxEvent({
            type: "failed",
            clientUuid: item.clientUuid,
            error: err.message,
          });
        } else {
          await db.outbox.update(item.clientUuid, {
            attempts: item.attempts + 1,
            lastError: err instanceof Error ? err.message : String(err),
          });
          // Stop on first transient failure; we'll retry on next online tick.
          break;
        }
      }
    }
  } finally {
    draining = false;
    emitOutboxEvent({ type: "tick" });
  }
}

type OutboxEvent =
  | { type: "tick" }
  | { type: "synced"; clientUuid: string; order: Order }
  | { type: "failed"; clientUuid: string; error: string };

const listeners = new Set<(e: OutboxEvent) => void>();

export function subscribeOutbox(fn: (e: OutboxEvent) => void) {
  listeners.add(fn);
  return () => listeners.delete(fn);
}

function emitOutboxEvent(e: OutboxEvent) {
  listeners.forEach((l) => l(e));
}

export function startOutboxLoop() {
  void drainOutbox();
  window.addEventListener("online", () => void drainOutbox());
  setInterval(() => {
    if (navigator.onLine) void drainOutbox();
  }, 15_000);
}

export async function cacheMenu(menu: Menu) {
  await db.menuCache.put({ id: "current", menu, fetchedAt: new Date().toISOString() });
}
export async function getCachedMenu(): Promise<Menu | null> {
  const row = await db.menuCache.get("current");
  return row?.menu ?? null;
}
export async function cacheTables(tables: Tables) {
  await db.tablesCache.put({ id: "current", tables, fetchedAt: new Date().toISOString() });
}
export async function getCachedTables(): Promise<Tables | null> {
  const row = await db.tablesCache.get("current");
  return row?.tables ?? null;
}
