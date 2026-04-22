import { useEffect, useState } from "react";
import type { Order } from "@bank-pos/shared";
import { api } from "../lib/api.js";

function formatGBP(p: number): string {
  return `£${(p / 100).toFixed(2)}`;
}

export function BarDisplay() {
  const [orders, setOrders] = useState<Order[]>([]);
  const [err, setErr] = useState<string | null>(null);

  const refresh = async () => {
    try {
      setOrders(await api.pendingOrders());
      setErr(null);
    } catch (e) {
      setErr(e instanceof Error ? e.message : "Failed to load queue");
    }
  };

  useEffect(() => {
    refresh();
    const es = new EventSource(api.sseUrl());
    es.addEventListener("order.created", () => refresh());
    es.addEventListener("order.sent", () => refresh());
    es.addEventListener("order.rung_in", () => refresh());
    es.onerror = () => {
      // EventSource auto-reconnects; we just keep the queue fresh via the
      // fallback interval below.
    };
    const id = setInterval(refresh, 15_000);
    return () => {
      es.close();
      clearInterval(id);
    };
  }, []);

  const markRungIn = async (id: string) => {
    await api.markRungIn(id);
    refresh();
  };

  return (
    <div className="p-4 max-w-5xl mx-auto">
      <h1 className="text-xl font-bold mb-3">Bar Display — ring these in on the till</h1>
      {err && <div className="text-red-400 mb-3">{err}</div>}
      {orders.length === 0 && <div className="text-slate-400">Queue empty.</div>}
      <div className="grid md:grid-cols-2 gap-3">
        {orders.map((o) => (
          <article key={o.id} className="rounded-lg bg-slate-800 p-4 border-l-4 border-amber-500">
            <header className="flex items-baseline gap-2 mb-2">
              <span className="text-lg font-bold">{o.areaName} · {o.tableLabel}</span>
              <span className="text-sm text-slate-400">{o.staffName}</span>
              <span className="ml-auto text-xs text-slate-500">
                {new Date(o.createdAt).toLocaleTimeString()}
              </span>
            </header>
            <table className="w-full text-sm">
              <thead>
                <tr className="text-slate-400 text-left">
                  <th className="font-normal w-8">Qty</th>
                  <th className="font-normal">Item</th>
                  <th className="font-normal w-20">Till</th>
                  <th className="font-normal w-20 text-right">Price</th>
                </tr>
              </thead>
              <tbody>
                {o.items.map((it) => (
                  <tr key={it.id} className="border-t border-slate-700">
                    <td className="py-1.5 font-bold">{it.qty}</td>
                    <td>
                      {it.name}
                      {it.modifiers.length > 0 && (
                        <div className="text-xs text-slate-400">
                          {it.modifiers.map((m) => m.name).join(", ")}
                        </div>
                      )}
                      {it.note && <div className="text-xs text-amber-300">note: {it.note}</div>}
                    </td>
                    <td className="font-mono text-amber-300">{it.tillCode}</td>
                    <td className="text-right font-mono">
                      {formatGBP(
                        (it.unitPricePence +
                          it.modifiers.reduce((s, m) => s + m.priceDeltaPence, 0)) *
                          it.qty,
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
            <footer className="flex items-center mt-3">
              <span className="font-bold">Total {formatGBP(o.totalPence)}</span>
              <button
                onClick={() => markRungIn(o.id)}
                className="ml-auto px-4 py-2 rounded-lg bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold"
              >
                Rung in ✓
              </button>
            </footer>
          </article>
        ))}
      </div>
    </div>
  );
}
