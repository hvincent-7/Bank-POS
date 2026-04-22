import { useEffect, useState } from "react";
import type { Order } from "@bank-pos/shared";
import { api } from "../lib/api.js";
import { db, subscribeOutbox, type OutboxItem } from "../lib/outbox.js";

function formatGBP(p: number): string {
  return `£${(p / 100).toFixed(2)}`;
}

export function MyOrders() {
  const [orders, setOrders] = useState<Order[]>([]);
  const [outbox, setOutbox] = useState<OutboxItem[]>([]);
  const [err, setErr] = useState<string | null>(null);

  const refresh = async () => {
    setOutbox(await db.outbox.orderBy("createdAt").toArray());
    if (navigator.onLine) {
      try {
        setOrders(await api.myOrders());
        setErr(null);
      } catch (e) {
        setErr(e instanceof Error ? e.message : "Failed to load orders");
      }
    }
  };

  useEffect(() => {
    refresh();
    const unsub = subscribeOutbox(() => refresh());
    const id = setInterval(refresh, 10_000);
    return () => {
      unsub();
      clearInterval(id);
    };
  }, []);

  return (
    <div className="p-4 max-w-xl mx-auto space-y-3">
      {outbox.length > 0 && (
        <div className="rounded-lg border border-amber-600/40 bg-amber-500/10 p-3 text-sm">
          {outbox.length} order{outbox.length > 1 ? "s" : ""} queued offline — will sync when back online.
        </div>
      )}
      {err && <div className="text-red-400 text-sm">{err}</div>}
      {orders.length === 0 && outbox.length === 0 && (
        <div className="text-slate-400">No orders yet today.</div>
      )}
      {orders.map((o) => (
        <article key={o.id} className="rounded-lg bg-slate-800 p-3">
          <header className="flex items-center gap-2 mb-2">
            <span className="font-semibold">{o.areaName} · {o.tableLabel}</span>
            <StatusChip status={o.status} />
            <span className="ml-auto font-mono">{formatGBP(o.totalPence)}</span>
          </header>
          <ul className="text-sm text-slate-300 space-y-0.5">
            {o.items.map((it) => (
              <li key={it.id}>
                {it.qty} × {it.name}
                {it.modifiers.length > 0 && (
                  <span className="text-slate-400"> ({it.modifiers.map((m) => m.name).join(", ")})</span>
                )}
                <span className="text-slate-500"> · {it.tillCode}</span>
              </li>
            ))}
          </ul>
          <footer className="text-xs text-slate-500 mt-2">
            {new Date(o.createdAt).toLocaleTimeString()}
            {o.rungInAt && ` · rung in by ${o.rungInBy} at ${new Date(o.rungInAt).toLocaleTimeString()}`}
          </footer>
        </article>
      ))}
    </div>
  );
}

function StatusChip({ status }: { status: Order["status"] }) {
  const cls = {
    PENDING: "bg-slate-600",
    SENT: "bg-amber-500 text-slate-950",
    RUNG_IN: "bg-emerald-500 text-slate-950",
    VOID: "bg-red-600",
  }[status];
  return <span className={`text-[10px] uppercase tracking-wider px-2 py-0.5 rounded ${cls}`}>{status.replace("_", " ")}</span>;
}
