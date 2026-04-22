import { z } from "zod";

export const LoginRequest = z.object({
  pin: z.string().regex(/^\d{4,8}$/, "PIN must be 4-8 digits"),
});
export type LoginRequest = z.infer<typeof LoginRequest>;

export const StaffRole = z.enum(["WAITER", "BAR", "MANAGER"]);
export type StaffRole = z.infer<typeof StaffRole>;

export const LoginResponse = z.object({
  token: z.string(),
  staff: z.object({
    id: z.string(),
    name: z.string(),
    role: StaffRole,
  }),
});
export type LoginResponse = z.infer<typeof LoginResponse>;
