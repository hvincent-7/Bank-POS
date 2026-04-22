# Bank POS

Mobile-first Point-of-Sale PWA for beer-garden service, designed to replace the
paper checkpads.

**Order flow (MVP):**

1. Waiter logs in with a 4-digit PIN on their phone.
2. Picks a table in the beer garden (or the "Bar / Takeaway" tile).
3. Builds an order (categories → items → modifiers), sees a running total.
4. Hits **Send order**. If online, it goes to the server immediately. If the
   Wi-Fi is flaky, the order is queued in IndexedDB and syncs when back online.
5. The order appears live on the **Bar Display** (tablet at the bar) with
   till codes for the operator to re-ring into the existing ICRTouch till.
6. Operator taps **Rung in ✓** to close the ticket.

Each order carries a client-generated UUID and the API treats it as an
idempotency key — retries, duplicates and offline replays can never double-book.

## Why we're not yet hitting ICRTouch directly

ICRTouch exposes a POS API via its partner programme (used by e.g. Deliveroo
and TouchTakeaway). Until partner access is secured, the fulfilment seam
(`apps/api/src/fulfilment/adapter.ts`) uses the **manual-till adapter**, which
just marks the order `SENT` and pushes it to the Bar Display. Swapping in a
real `ICRTouchAdapter` later is a drop-in — no other code has to change.

## Stack

| Layer   | Tech |
|---------|------|
| PWA     | React + Vite + TypeScript, Tailwind, React Router, Dexie (IndexedDB), vite-plugin-pwa (Workbox) |
| API     | Fastify + TypeScript, Prisma, PostgreSQL, JWT (PIN login), Server-Sent Events |
| Shared  | Zod schemas + types used on both sides, in `packages/shared` |
| Infra   | `docker-compose` for Postgres; Dockerfile for the API |

## Running locally

Prereqs: Node 20+, pnpm 9+, Docker.

```bash
# 1. start Postgres
docker compose up -d db

# 2. install + set env
pnpm install
cp .env.example apps/api/.env
cp .env.example apps/pwa/.env.local

# 3. migrate + seed (creates test staff, tables, menu)
pnpm --filter @bank-pos/api prisma migrate dev --name init
pnpm db:seed

# 4. run both apps
pnpm dev
# PWA:  http://localhost:5173
# API:  http://localhost:4000
```

Seeded staff PINs:

| PIN  | Role    | Name             |
|------|---------|------------------|
| 1234 | MANAGER | Alice (Manager)  |
| 2345 | WAITER  | Ben (Waiter)     |
| 3456 | WAITER  | Cara (Waiter)    |
| 4567 | BAR     | Dan (Bar)        |

Open two browser windows to see the full loop: one logged in as a waiter (take
orders from a phone-sized window), one as Bar/Manager on `/bar`.

## Offline behaviour

- The PWA shell, menu and tables are cached locally.
- Order submission always goes via an IndexedDB outbox; a background loop drains
  it when `navigator.onLine` flips true.
- The header shows a live indicator: 🟢 online / 🟡 N queued / 🔴 offline.

## Roadmap

See `/root/.claude/plans/i-would-like-to-agile-seal.md` for the approved plan.
Headline milestones still to do:

- Admin UI (menu CRUD + CSV import, staff PINs, tables). API is ready; UI
  hasn't been built yet.
- Playwright end-to-end test, including the offline → online sync scenario.
- `ICRTouchAdapter` — gated on securing POS API partner access.
- Optional: Bluetooth ESC/POS receipt printer support at the bar.
