import type { FastifyInstance } from "fastify";
import bcrypt from "bcryptjs";
import { LoginRequest } from "@bank-pos/shared";
import { prisma } from "../prisma.js";

export async function authRoutes(app: FastifyInstance) {
  app.post("/auth/login", async (req, reply) => {
    const body = LoginRequest.parse(req.body);
    // PIN collisions are rare but possible in practice; we check against all
    // active staff. For a venue with dozens of staff this is fine; at scale
    // swap for a (staff_id, pin) login.
    const staff = await prisma.staff.findMany({ where: { active: true } });
    for (const s of staff) {
      if (await bcrypt.compare(body.pin, s.pinHash)) {
        const token = app.jwt.sign(
          { sub: s.id, name: s.name, role: s.role },
          { expiresIn: "12h" },
        );
        return { token, staff: { id: s.id, name: s.name, role: s.role } };
      }
    }
    return reply.status(401).send({ error: "Invalid PIN" });
  });
}
