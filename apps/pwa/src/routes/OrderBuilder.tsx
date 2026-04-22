import { useEffect, useMemo, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { v4 as uuid } from "uuid";
import type { Menu, MenuItem, ModifierGroup, Tables as TablesDto } from "@bank-pos/shared";
import { api } from "../lib/api.js";
import {
  cacheMenu,
  cacheTables,
  getCachedMenu,
  getCachedTables,
  queueOrder,
} from "../lib/outbox.js";

type LineModifier = { modifierId: string; name: string; priceDeltaPence: number };
type Line = {
  lineId: string;
  menuItemId: string;
  name: string;
  unitPricePence: number;
  qty: number;
  note?: string;
  modifiers: LineModifier[];
};

function formatGBP(pence: number): string {
  return `£${(pence / 100).toFixed(2)}`;
}

export function OrderBuilder() {
  const { tableId = "" } = useParams();
  const navigate = useNavigate();
  const [menu, setMenu] = useState<Menu | null>(null);
  const [tables, setTables] = useState<TablesDto | null>(null);
  const [activeCat, setActiveCat] = useState<string | null>(null);
  const [lines, setLines] = useState<Line[]>([]);
  const [picker, setPicker] = useState<MenuItem | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const [err, setErr] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      const [cachedMenu, cachedTables] = await Promise.all([getCachedMenu(), getCachedTables()]);
      if (cachedMenu) {
        setMenu(cachedMenu);
        setActiveCat(cachedMenu.categories[0]?.id ?? null);
      }
      if (cachedTables) setTables(cachedTables);
      try {
        const [m, t] = await Promise.all([api.menu(), api.tables()]);
        setMenu(m);
        setActiveCat((prev) => prev ?? m.categories[0]?.id ?? null);
        setTables(t);
        await Promise.all([cacheMenu(m), cacheTables(t)]);
      } catch {
        if (!cachedMenu) setErr("No menu available. Go online once to load it.");
      }
    })();
  }, []);

  const table = useMemo(
    () => tables?.tables.find((t) => t.id === tableId),
    [tables, tableId],
  );
  const area = useMemo(
    () => tables?.areas.find((a) => a.id === table?.areaId),
    [tables, table],
  );

  const total = lines.reduce((sum, l) => {
    const mods = l.modifiers.reduce((s, m) => s + m.priceDeltaPence, 0);
    return sum + (l.unitPricePence + mods) * l.qty;
  }, 0);

  const addLine = (item: MenuItem, modifiers: LineModifier[]) => {
    setLines((prev) => [
      ...prev,
      {
        lineId: uuid(),
        menuItemId: item.id,
        name: item.name,
        unitPricePence: item.pricePence,
        qty: 1,
        modifiers,
      },
    ]);
    setPicker(null);
  };

  const adjustQty = (lineId: string, delta: number) => {
    setLines((prev) =>
      prev
        .map((l) => (l.lineId === lineId ? { ...l, qty: Math.max(0, l.qty + delta) } : l))
        .filter((l) => l.qty > 0),
    );
  };

  const submit = async () => {
    if (!lines.length || submitting) return;
    setSubmitting(true);
    setErr(null);
    try {
      const payload = {
        clientUuid: uuid(),
        tableId,
        items: lines.map((l) => ({
          menuItemId: l.menuItemId,
          qty: l.qty,
          note: l.note,
          modifierIds: l.modifiers.map((m) => m.modifierId),
        })),
      };
      if (navigator.onLine) {
        try {
          await api.createOrder(payload);
        } catch {
          await queueOrder(payload);
        }
      } else {
        await queueOrder(payload);
      }
      navigate("/my-orders");
    } finally {
      setSubmitting(false);
    }
  };

  if (!menu) {
    return (
      <div className="p-6 text-slate-400">
        {err ?? "Loading menu…"}
      </div>
    );
  }

  const itemsInCat = menu.items.filter((i) => i.categoryId === activeCat);

  return (
    <div className="flex flex-col h-[calc(100vh-57px)]">
      <div className="px-4 py-2 border-b border-slate-800 text-sm text-slate-400">
        {area?.name ?? "—"} · <span className="text-slate-100 font-semibold">{table?.label ?? tableId}</span>
      </div>

      <div className="flex gap-2 overflow-x-auto px-2 py-2 border-b border-slate-800">
        {menu.categories.map((c) => (
          <button
            key={c.id}
            onClick={() => setActiveCat(c.id)}
            className={`px-3 py-1.5 rounded-full text-sm whitespace-nowrap ${
              activeCat === c.id ? "bg-amber-500 text-slate-950" : "bg-slate-800 text-slate-200"
            }`}
          >
            {c.name}
          </button>
        ))}
      </div>

      <div className="flex-1 overflow-y-auto p-2 grid grid-cols-2 gap-2 content-start">
        {itemsInCat.map((item) => (
          <button
            key={item.id}
            onClick={() => {
              if (item.modifierGroups.length === 0) {
                addLine(item, []);
              } else {
                setPicker(item);
              }
            }}
            className="text-left p-3 rounded-xl bg-slate-800 hover:bg-slate-700 flex flex-col gap-1"
          >
            <span className="font-semibold">{item.name}</span>
            <span className="text-slate-400 text-sm">{formatGBP(item.pricePence)}</span>
            <span className="text-slate-500 text-xs">{item.tillCode}</span>
          </button>
        ))}
      </div>

      <div className="border-t border-slate-800 bg-slate-950">
        {lines.length > 0 && (
          <ul className="max-h-48 overflow-y-auto">
            {lines.map((l) => (
              <li key={l.lineId} className="flex items-center gap-2 px-3 py-2 border-b border-slate-900">
                <div className="flex-1">
                  <div className="font-medium">{l.name}</div>
                  {l.modifiers.length > 0 && (
                    <div className="text-xs text-slate-400">
                      {l.modifiers.map((m) => m.name).join(", ")}
                    </div>
                  )}
                </div>
                <button onClick={() => adjustQty(l.lineId, -1)} className="w-8 h-8 rounded bg-slate-800">−</button>
                <span className="w-6 text-center">{l.qty}</span>
                <button onClick={() => adjustQty(l.lineId, +1)} className="w-8 h-8 rounded bg-slate-800">+</button>
                <span className="w-16 text-right font-mono">
                  {formatGBP((l.unitPricePence + l.modifiers.reduce((s, m) => s + m.priceDeltaPence, 0)) * l.qty)}
                </span>
              </li>
            ))}
          </ul>
        )}
        <div className="p-3 flex items-center gap-3">
          <div className="flex-1">
            <div className="text-slate-400 text-xs">Total</div>
            <div className="text-xl font-bold">{formatGBP(total)}</div>
          </div>
          <button
            onClick={submit}
            disabled={!lines.length || submitting}
            className="px-5 py-3 rounded-xl bg-amber-500 hover:bg-amber-400 text-slate-950 font-bold disabled:opacity-40"
          >
            {submitting ? "Sending…" : "Send order"}
          </button>
        </div>
      </div>

      {picker && (
        <ModifierSheet
          item={picker}
          onCancel={() => setPicker(null)}
          onConfirm={(mods) => addLine(picker, mods)}
        />
      )}
    </div>
  );
}

function ModifierSheet({
  item,
  onCancel,
  onConfirm,
}: {
  item: MenuItem;
  onCancel: () => void;
  onConfirm: (mods: LineModifier[]) => void;
}) {
  const [selected, setSelected] = useState<Record<string, string[]>>(() => {
    const init: Record<string, string[]> = {};
    for (const g of item.modifierGroups) init[g.id] = [];
    return init;
  });

  const toggle = (g: ModifierGroup, modId: string) => {
    setSelected((s) => {
      const cur = s[g.id] ?? [];
      if (cur.includes(modId)) return { ...s, [g.id]: cur.filter((x) => x !== modId) };
      if (g.max === 1) return { ...s, [g.id]: [modId] };
      if (cur.length >= g.max) return s;
      return { ...s, [g.id]: [...cur, modId] };
    });
  };

  const valid = item.modifierGroups.every((g) => (selected[g.id]?.length ?? 0) >= g.min);

  const confirm = () => {
    const flat: LineModifier[] = [];
    for (const g of item.modifierGroups) {
      for (const id of selected[g.id] ?? []) {
        const m = g.modifiers.find((x) => x.id === id)!;
        flat.push({ modifierId: m.id, name: m.name, priceDeltaPence: m.priceDeltaPence });
      }
    }
    onConfirm(flat);
  };

  return (
    <div className="fixed inset-0 bg-black/60 flex items-end z-30">
      <div className="bg-slate-900 w-full rounded-t-2xl p-4 max-h-[80vh] overflow-y-auto">
        <div className="flex items-center mb-3">
          <h2 className="text-lg font-semibold flex-1">{item.name}</h2>
          <button onClick={onCancel} className="text-slate-400 px-2">Close</button>
        </div>
        {item.modifierGroups.map((g) => (
          <div key={g.id} className="mb-4">
            <div className="text-slate-400 text-sm mb-2">
              {g.name} {g.min > 0 && <span className="text-amber-400">(required)</span>}
            </div>
            <div className="grid grid-cols-2 gap-2">
              {g.modifiers.map((m) => {
                const on = (selected[g.id] ?? []).includes(m.id);
                return (
                  <button
                    key={m.id}
                    onClick={() => toggle(g, m.id)}
                    className={`p-3 rounded-lg text-left ${on ? "bg-amber-500 text-slate-950" : "bg-slate-800"}`}
                  >
                    <div className="font-medium">{m.name}</div>
                    {m.priceDeltaPence !== 0 && (
                      <div className="text-xs">
                        {m.priceDeltaPence > 0 ? "+" : ""}
                        {(m.priceDeltaPence / 100).toFixed(2)}
                      </div>
                    )}
                  </button>
                );
              })}
            </div>
          </div>
        ))}
        <button
          disabled={!valid}
          onClick={confirm}
          className="w-full py-3 rounded-xl bg-amber-500 text-slate-950 font-bold disabled:opacity-40"
        >
          Add to order
        </button>
      </div>
    </div>
  );
}
