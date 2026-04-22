import type { FastifyRequest } from "fastify";
import type { StaffRole } from "@prisma/client";

declare module "@fastify/jwt" {
  interface FastifyJWT {
    payload: { sub: string; name: string; role: StaffRole };
    user: { sub: string; name: string; role: StaffRole };
  }
}

export async function authGuard(req: FastifyRequest) {
  await req.jwtVerify();
}

export function requireRole(...roles: StaffRole[]) {
  return async (req: FastifyRequest) => {
    await req.jwtVerify();
    if (!roles.includes(req.user.role)) {
      const err: Error & { statusCode?: number } = new Error("Forbidden");
      err.statusCode = 403;
      throw err;
    }
  };
}

export function currentStaff(req: FastifyRequest) {
  return req.user;
}
