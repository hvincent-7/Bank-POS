# Bank POS (TouchPoint-style Till)

Bank POS is being rebuilt as a Windows desktop till inspired by ICRTouch TouchPoint.
This repository now contains the .NET solution for the till core, data, kitchen routing,
and WinForms host.

## Solution Layout

```text
src/
  Bank.Pos.Core/      Domain model + services (no UI)
  Bank.Pos.Data/      SQLite schema/init + Dapper repositories
  Bank.Pos.Kitchen/   ESC/POS formatter + console/network printer routing
  Bank.Pos.Till/      WinForms host (SignOn + MainTill + XML keyboard)
tests/
  Bank.Pos.Core.Tests/ xUnit tests for ClerkService, CheckService, KitchenRouter
```

## Current Capabilities

- Clerk sign-on using code-based sessions.
- Till mode switching: Sales, Training, Refund, Void, Manager.
- Check lifecycle: open, add lines, park, resume, close.
- XML keyboard layout (`src/Bank.Pos.Till/layouts/main.xml`) with mode/PLU/function buttons.
- Kitchen routing by department to printer groups.
- ESC/POS ticket formatting with network printer attempt and console fallback.
- Embedded SQLite persistence with seed data.

## Seed Data

Clerks:

- `1234` Alice (Manager)
- `2222` Ben (Staff)
- `3333` Cara (Staff)
- `4444` Dan (Supervisor)

Departments and printer groups:

- Drinks -> Bar (`console`)
- Food -> Kitchen (`console`)

Sample PLUs include `LAG-PT`, `ALE-PT`, `WINE-GL`, `COKE`, `BURG`, `CHIP`, `PIZZA`.

## Build and Test

Prerequisite: .NET SDK 10 installed.

```bash
dotnet build -p:EnableWindowsTargeting=true
dotnet test tests/Bank.Pos.Core.Tests/Bank.Pos.Core.Tests.csproj
```

## Run Till (Windows)

The WinForms UI targets `net10.0-windows`. Run on Windows:

```bash
dotnet run --project src/Bank.Pos.Till/Bank.Pos.Till.csproj
```

On first run, SQLite is created under `%LOCALAPPDATA%/BankPos/bank-pos.sqlite`.

## Notes

- The previous web PWA/API implementation remains in the repository history/branches.
- Extracted ICRTouch installer artifacts under `reference/icrtouch2024` are used only
  as behavior and deployment reference for clean-room implementation.
