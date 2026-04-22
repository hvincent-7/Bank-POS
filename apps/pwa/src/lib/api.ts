import type {
  CreateOrderRequest,
  LoginRequest,
  LoginResponse,
  Menu,
  Order,
  Tables,
} from "@bank-pos/shared";
import { getToken } from "./session.js";

const BASE = (import.meta.env.VITE_API_URL as string) ?? "http://localhost:4000";

async function request<T>(path: string, init: RequestInit = {}): Promise<T> {
  const headers = new Headers(init.headers);
  headers.set("Content-Type", "application/json");
  const token = getToken();
  if (token) headers.set("Authorization", `Bearer ${token}`);
  const res = await fetch(`${BASE}${path}`, { ...init, headers });
  if (!res.ok) {
    const body = await res.text().catch(() => "");
    throw new ApiError(res.status, body || res.statusText);
  }
  return (await res.json()) as T;
}

export class ApiError extends Error {
  constructor(public status: number, message: string) {
    super(message);
  }
}

export const api = {
  login: (body: LoginRequest) =>
    request<LoginResponse>("/auth/login", { method: "POST", body: JSON.stringify(body) }),
  menu: () => request<Menu>("/menu"),
  tables: () => request<Tables>("/tables"),
  createOrder: (body: CreateOrderRequest) =>
    request<Order>("/orders", { method: "POST", body: JSON.stringify(body) }),
  myOrders: () => request<Order[]>("/orders/mine"),
  pendingOrders: () => request<Order[]>("/orders/pending"),
  markRungIn: (id: string) =>
    request<Order>(`/orders/${id}/rung-in`, { method: "POST" }),
  health: () => request<{ ok: true }>("/healthz"),
  sseUrl: () => {
    const token = getToken();
    return `${BASE}/events/orders?token=${encodeURIComponent(token ?? "")}`;
  },
};
