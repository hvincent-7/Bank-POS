import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import type { Tables as TablesDto } from "@bank-pos/shared";
import { api } from "../lib/api.js";
import { cacheTables, getCachedTables } from "../lib/outbox.js";

export function Tables() {
  const [data, setData] = useState<TablesDto | null>(null);
  const [err, setErr] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      const cached = await getCachedTables();
      if (cached) setData(cached);
      try {
        const fresh = await api.tables();
        setData(fresh);
        await cacheTables(fresh);
      } catch (e) {
        if (!cached) setErr(e instanceof Error ? e.message : "Failed to load tables");
      }
    })();
  }, []);

  if (err) return <div className="p-6 text-red-400">{err}</div>;
  if (!data) return <div className="p-6 text-slate-400">Loading tables…</div>;

  return (
    <div className="p-4 max-w-xl mx-auto">
      {data.areas.map((area) => {
        const tables = data.tables.filter((t) => t.areaId === area.id);
        return (
          <section key={area.id} className="mb-6">
            <h2 className="text-lg font-semibold text-slate-300 mb-2">{area.name}</h2>
            <div className="grid grid-cols-3 gap-3">
              {tables.map((t) => (
                <Link
                  key={t.id}
                  to={`/order/${t.id}`}
                  className="aspect-square rounded-xl bg-slate-800 hover:bg-slate-700 flex items-center justify-center text-lg font-semibold"
                >
                  {t.label}
                </Link>
              ))}
            </div>
          </section>
        );
      })}
    </div>
  );
}
