import type { FastifyInstance } from "fastify";
import { subscribeOrderEvents } from "../events.js";

/**
 * Server-Sent Events stream for the Bar Display. Browsers natively reconnect
 * on drop, which is exactly what we want on flaky venue Wi-Fi.
 *
 * Auth: token is passed as a query param because EventSource can't set headers.
 * Scope is limited to BAR/MANAGER roles.
 */
export async function sseRoutes(app: FastifyInstance) {
  app.get("/events/orders", async (req, reply) => {
    const token =
      (req.query as Record<string, string | undefined>).token ?? "";
    try {
      const payload = app.jwt.verify<{ role: string }>(token);
      if (!["BAR", "MANAGER"].includes(payload.role)) {
        return reply.status(403).send({ error: "Forbidden" });
      }
    } catch {
      return reply.status(401).send({ error: "Unauthorized" });
    }

    reply.raw.writeHead(200, {
      "Content-Type": "text/event-stream",
      "Cache-Control": "no-cache, no-transform",
      Connection: "keep-alive",
      "X-Accel-Buffering": "no",
    });
    reply.raw.write(`: connected\n\n`);

    const unsubscribe = subscribeOrderEvents((event) => {
      reply.raw.write(`event: ${event.type}\n`);
      reply.raw.write(`data: ${JSON.stringify(event)}\n\n`);
    });

    const keepAlive = setInterval(() => {
      reply.raw.write(`: ping\n\n`);
    }, 20_000);

    req.raw.on("close", () => {
      clearInterval(keepAlive);
      unsubscribe();
    });

    // Tell Fastify not to finalise the response.
    return reply;
  });
}
