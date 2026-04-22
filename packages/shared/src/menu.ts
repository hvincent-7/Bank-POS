import { z } from "zod";

export const Modifier = z.object({
  id: z.string(),
  name: z.string(),
  priceDeltaPence: z.number().int(),
});
export type Modifier = z.infer<typeof Modifier>;

export const ModifierGroup = z.object({
  id: z.string(),
  name: z.string(),
  min: z.number().int().min(0),
  max: z.number().int().min(1),
  modifiers: z.array(Modifier),
});
export type ModifierGroup = z.infer<typeof ModifierGroup>;

export const MenuItem = z.object({
  id: z.string(),
  categoryId: z.string(),
  name: z.string(),
  pricePence: z.number().int().nonnegative(),
  tillCode: z.string(),
  active: z.boolean(),
  modifierGroups: z.array(ModifierGroup),
});
export type MenuItem = z.infer<typeof MenuItem>;

export const MenuCategory = z.object({
  id: z.string(),
  name: z.string(),
  sortOrder: z.number().int(),
});
export type MenuCategory = z.infer<typeof MenuCategory>;

export const Menu = z.object({
  categories: z.array(MenuCategory),
  items: z.array(MenuItem),
});
export type Menu = z.infer<typeof Menu>;

export const Area = z.object({
  id: z.string(),
  name: z.string(),
});
export type Area = z.infer<typeof Area>;

export const Table = z.object({
  id: z.string(),
  areaId: z.string(),
  label: z.string(),
});
export type Table = z.infer<typeof Table>;

export const Tables = z.object({
  areas: z.array(Area),
  tables: z.array(Table),
});
export type Tables = z.infer<typeof Tables>;
