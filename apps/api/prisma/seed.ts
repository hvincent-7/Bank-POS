import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  // Staff
  const staffSeed = [
    { name: "Alice (Manager)", pin: "1234", role: "MANAGER" as const },
    { name: "Ben (Waiter)", pin: "2345", role: "WAITER" as const },
    { name: "Cara (Waiter)", pin: "3456", role: "WAITER" as const },
    { name: "Dan (Bar)", pin: "4567", role: "BAR" as const },
  ];
  for (const s of staffSeed) {
    const pinHash = await bcrypt.hash(s.pin, 10);
    await prisma.staff.upsert({
      where: { id: s.name },
      update: {},
      create: { id: s.name, name: s.name, pinHash, role: s.role },
    });
  }

  // Areas + tables
  const bg = await prisma.area.upsert({
    where: { name: "Beer Garden" },
    update: {},
    create: { name: "Beer Garden" },
  });
  const bar = await prisma.area.upsert({
    where: { name: "Bar" },
    update: {},
    create: { name: "Bar" },
  });
  for (let n = 1; n <= 16; n++) {
    const label = `BG-${n}`;
    await prisma.table.upsert({
      where: { areaId_label: { areaId: bg.id, label } },
      update: {},
      create: { label, areaId: bg.id },
    });
  }
  await prisma.table.upsert({
    where: { areaId_label: { areaId: bar.id, label: "Bar / Takeaway" } },
    update: {},
    create: { label: "Bar / Takeaway", areaId: bar.id },
  });

  // Menu categories
  const drinks = await prisma.menuCategory.upsert({
    where: { name: "Drinks" },
    update: { sortOrder: 1 },
    create: { name: "Drinks", sortOrder: 1 },
  });
  const food = await prisma.menuCategory.upsert({
    where: { name: "Food" },
    update: { sortOrder: 2 },
    create: { name: "Food", sortOrder: 2 },
  });

  // A simple pint-size modifier group
  const sizeGroup = await prisma.modifierGroup.upsert({
    where: { id: "grp-size" },
    update: {},
    create: { id: "grp-size", name: "Size", min: 1, max: 1 },
  });
  await prisma.modifier.upsert({
    where: { id: "mod-half" },
    update: {},
    create: { id: "mod-half", groupId: sizeGroup.id, name: "Half", priceDeltaPence: -270 },
  });
  await prisma.modifier.upsert({
    where: { id: "mod-pint" },
    update: {},
    create: { id: "mod-pint", groupId: sizeGroup.id, name: "Pint", priceDeltaPence: 0 },
  });

  const items: Array<{
    id: string;
    name: string;
    categoryId: string;
    pricePence: number;
    tillCode: string;
    withSize?: boolean;
  }> = [
    { id: "itm-lager", name: "House Lager", categoryId: drinks.id, pricePence: 540, tillCode: "D001", withSize: true },
    { id: "itm-ale", name: "Local Ale", categoryId: drinks.id, pricePence: 560, tillCode: "D002", withSize: true },
    { id: "itm-cider", name: "Cider", categoryId: drinks.id, pricePence: 550, tillCode: "D003", withSize: true },
    { id: "itm-coke", name: "Coca-Cola", categoryId: drinks.id, pricePence: 300, tillCode: "D010" },
    { id: "itm-wine-red", name: "Red Wine 175ml", categoryId: drinks.id, pricePence: 650, tillCode: "D020" },
    { id: "itm-chips", name: "Chips", categoryId: food.id, pricePence: 400, tillCode: "F001" },
    { id: "itm-burger", name: "Beef Burger", categoryId: food.id, pricePence: 1200, tillCode: "F010" },
    { id: "itm-fish", name: "Fish & Chips", categoryId: food.id, pricePence: 1400, tillCode: "F011" },
  ];

  for (const it of items) {
    await prisma.menuItem.upsert({
      where: { id: it.id },
      update: {
        name: it.name,
        categoryId: it.categoryId,
        pricePence: it.pricePence,
        tillCode: it.tillCode,
      },
      create: {
        id: it.id,
        name: it.name,
        categoryId: it.categoryId,
        pricePence: it.pricePence,
        tillCode: it.tillCode,
      },
    });
    if (it.withSize) {
      await prisma.menuItemModifierGroup.upsert({
        where: {
          menuItemId_modifierGroupId: {
            menuItemId: it.id,
            modifierGroupId: sizeGroup.id,
          },
        },
        update: {},
        create: { menuItemId: it.id, modifierGroupId: sizeGroup.id },
      });
    }
  }

  console.log("Seed complete. PINs: 1234 (Manager), 2345/3456 (Waiter), 4567 (Bar).");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
