namespace Bank.Pos.Core.Repositories;

using Domain;

public interface IClerkRepository
{
    Clerk? FindByCode(string code);
    Clerk? Get(int id);
}

public interface ISessionRepository
{
    ClerkSession? GetActive(int clerkId);
    ClerkSession Save(ClerkSession session);
    void Update(ClerkSession session);
}

public interface IDepartmentRepository
{
    Department? Get(int id);
    IReadOnlyList<Department> All();
}

public interface IPrinterGroupRepository
{
    PrinterGroup? Get(int id);
}

public interface IPluRepository
{
    Plu? Find(string code);
    IReadOnlyList<Plu> All();
}

public interface ICheckRepository
{
    Check? Get(int id);
    Check? GetByNumber(int number);
    IReadOnlyList<Check> GetOpen();
    Check Save(Check check);
    void Update(Check check);
    CheckLine SaveLine(CheckLine line);
    void UpdateLine(CheckLine line);
    int NextCheckNumber();
}
