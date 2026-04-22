import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { api } from "../lib/api.js";
import { setSession, type Session } from "../lib/session.js";

export function Login({ onLogin }: { onLogin: (s: Session) => void }) {
  const [pin, setPin] = useState("");
  const [err, setErr] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);
  const navigate = useNavigate();

  const push = (d: string) => setPin((p) => (p.length >= 8 ? p : p + d));
  const back = () => setPin((p) => p.slice(0, -1));

  const submit = async () => {
    if (pin.length < 4) return;
    setBusy(true);
    setErr(null);
    try {
      const res = await api.login({ pin });
      setSession(res);
      onLogin(res);
      navigate("/");
    } catch (e) {
      setErr(e instanceof Error ? e.message : "Login failed");
      setPin("");
    } finally {
      setBusy(false);
    }
  };

  return (
    <div className="max-w-xs mx-auto p-6 flex flex-col items-center">
      <h1 className="text-2xl font-bold mb-2">Staff PIN</h1>
      <p className="text-slate-400 mb-6 text-sm">Enter your 4-digit PIN to start taking orders.</p>
      <div className="w-full h-14 rounded-lg bg-slate-800 flex items-center justify-center text-3xl tracking-[0.5em] mb-4">
        {pin.replace(/./g, "•") || <span className="text-slate-600 tracking-normal text-base">PIN</span>}
      </div>
      {err && <div className="text-red-400 text-sm mb-3">{err}</div>}
      <div className="grid grid-cols-3 gap-3 w-full">
        {["1","2","3","4","5","6","7","8","9"].map((d) => (
          <button
            key={d}
            onClick={() => push(d)}
            className="aspect-square rounded-xl bg-slate-800 hover:bg-slate-700 text-2xl font-semibold"
          >
            {d}
          </button>
        ))}
        <button onClick={back} className="aspect-square rounded-xl bg-slate-800 hover:bg-slate-700 text-lg">⌫</button>
        <button onClick={() => push("0")} className="aspect-square rounded-xl bg-slate-800 hover:bg-slate-700 text-2xl font-semibold">0</button>
        <button
          onClick={submit}
          disabled={pin.length < 4 || busy}
          className="aspect-square rounded-xl bg-amber-500 hover:bg-amber-400 text-slate-950 text-lg font-bold disabled:opacity-40"
        >
          {busy ? "…" : "OK"}
        </button>
      </div>
    </div>
  );
}
