import { useEffect, useState } from "react";
import { Navigate, Route, Routes, useLocation } from "react-router-dom";
import { getSession, type Session } from "./lib/session.js";
import { startOutboxLoop } from "./lib/outbox.js";
import { Login } from "./routes/Login.js";
import { Tables } from "./routes/Tables.js";
import { OrderBuilder } from "./routes/OrderBuilder.js";
import { MyOrders } from "./routes/MyOrders.js";
import { BarDisplay } from "./routes/BarDisplay.js";
import { TopBar } from "./components/TopBar.js";

export function App() {
  const [session, setSession] = useState<Session | null>(() => getSession());

  useEffect(() => {
    startOutboxLoop();
  }, []);

  useEffect(() => {
    const tick = () => setSession(getSession());
    window.addEventListener("storage", tick);
    return () => window.removeEventListener("storage", tick);
  }, []);

  return (
    <div className="min-h-full flex flex-col">
      <TopBar session={session} onLogout={() => setSession(null)} />
      <main className="flex-1">
        <Routes>
          <Route path="/login" element={<Login onLogin={(s) => setSession(s)} />} />
          <Route
            path="/"
            element={session ? <Tables /> : <Navigate to="/login" replace />}
          />
          <Route
            path="/order/:tableId"
            element={session ? <OrderBuilder /> : <Navigate to="/login" replace />}
          />
          <Route
            path="/my-orders"
            element={session ? <MyOrders /> : <Navigate to="/login" replace />}
          />
          <Route
            path="/bar"
            element={
              session && (session.staff.role === "BAR" || session.staff.role === "MANAGER") ? (
                <BarDisplay />
              ) : (
                <NoAccess />
              )
            }
          />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </main>
    </div>
  );
}

function NoAccess() {
  const loc = useLocation();
  return (
    <div className="p-6">
      <h1 className="text-xl font-bold">No access</h1>
      <p className="text-slate-400 mt-2">
        You need a Bar or Manager role to view {loc.pathname}.
      </p>
    </div>
  );
}
