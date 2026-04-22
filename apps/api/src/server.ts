import Fastify from "fastify";
import jwt from "@fastify/jwt";
import cors from "@fastify/cors";
import { ZodError } from "zod";
import { env } from "./env.js";
import { authRoutes } from "./routes/auth.js";
import { menuRoutes } from "./routes/menu.js";
import { orderRoutes } from "./routes/orders.js";
import { sseRoutes } from "./routes/sse.js";

export async function buildApp() {
  const app = Fastify({ logger: true });

  await app.register(cors, {
    origin: env.CORS_ORIGIN.split(","),
    credentials: true,
  });
  await app.register(jwt, { secret: env.JWT_SECRET });

  app.setErrorHandler((error, _req, reply) => {
    if (error instanceof ZodError) {
      return reply.status(400).send({ error: "ValidationError", details: error.issues });
    }
    const status = error.statusCode ?? 500;
    reply.log.error(error);
    reply.status(status).send({ error: error.message });
  });

  app.get("/healthz", async () => ({ ok: true }));

  await app.register(authRoutes);
  await app.register(menuRoutes);
  await app.register(orderRoutes);
  await app.register(sseRoutes);

  return app;
}

const app = await buildApp();
await app.listen({ port: env.API_PORT, host: "0.0.0.0" }).catch((err) => {
  app.log.error(err);
  process.exit(1);
});
