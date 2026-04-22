import { Link, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { clearSession, type Session } from "../lib/session.js";
import { pendingOutboxCount, subscribeOutbox } from "../lib/outbox.js";

export function TopBar({ session, onLogout }: { session: Session | null; onLogout: () => void }) {
  const navigate = useNavigate();
  const [online, setOnline] = useState(navigator.onLine);
  const [pending, setPending] = useState(0);

  useEffect(() => {
    const on = () => setOnline(true);
    const off = () => setOnline(false);
    window.addEventListener("online", on);
    window.addEventListener("offline", off);
    return () => {
      window.removeEventListener("online", on);
      window.removeEventListener("offline", off);
    };
  }, []);

  useEffect(() => {
    let cancelled = false;
    const refresh = async () => {
      const n = await pendingOutboxCount();
      if (!cancelled) setPending(n);
    };
    refresh();
    const unsub = subscribeOutbox(() => refresh());
    const id = setInterval(refresh, 5000);
    return () => {
      cancelled = true;
      unsub();
      clearInterval(id);
    };
  }, []);

  const dot = !online
    ? "bg-red-500"
    : pending > 0
      ? "bg-amber-400"
      : "bg-emerald-400";

  return (
    <header className="sticky top-0 z-20 bg-slate-950/95 backdrop-blur border-b border-slate-800 px-4 py-3 flex items-center gap-3">
      <Link to="/" className="font-bold text-amber-400">Bank POS</Link>
      <div className="ml-auto flex items-center gap-3 text-sm">
        <span className="flex items-center gap-2" title={online ? "Online" : "Offline"}>
          <span className={`inline-block w-2.5 h-2.5 rounded-full ${dot}`} />
          {online ? (pending > 0 ? `${pending} queued` : "Online") : "Offline"}
        </span>
        {session && (
          <>
            <Link to="/my-orders" className="text-slate-300 hover:text-white">My orders</Link>
            {(session.staff.role === "BAR" || session.staff.role === "MANAGER") && (
              <Link to="/bar" className="text-slate-300 hover:text-white">Bar</Link>
            )}
            <button
              className="text-slate-300 hover:text-white"
              onClick={() => {
                clearSession();
                onLogout();
                navigate("/login");
              }}
            >
              Logout
            </button>
          </>
        )}
      </div>
    </header>
  );
}
