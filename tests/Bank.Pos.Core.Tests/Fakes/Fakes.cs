namespace Bank.Pos.Core.Tests.Fakes;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Repositories;
using Bank.Pos.Core.Kitchen;

// ── In-memory fakes for all repositories ─────────────────────────────────────

public sealed class FakeClerkRepository : IClerkRepository
{
    private readonly List<Clerk> _clerks;
    public FakeClerkRepository(IEnumerable<Clerk> seed) => _clerks = seed.ToList();

    public Clerk? FindByCode(string code) =>
        _clerks.FirstOrDefault(c => c.SignOnCode == code && c.Active);

    public Clerk? Get(int id) =>
        _clerks.FirstOrDefault(c => c.Id == id);
}

public sealed class FakeSessionRepository : ISessionRepository
{
    private readonly List<ClerkSession> _sessions = new();
    private int _nextId = 1;

    public ClerkSession? GetActive(int clerkId) =>
        _sessions.FirstOrDefault(s => s.ClerkId == clerkId && s.SignedOffAt is null);

    public ClerkSession Save(ClerkSession session)
    {
        session.Id = _nextId++;
        _sessions.Add(session);
        return session;
    }

    public void Update(ClerkSession session)
    {
        var idx = _sessions.FindIndex(s => s.Id == session.Id);
        if (idx >= 0) _sessions[idx] = session;
    }
}

public sealed class FakeCheckRepository : ICheckRepository
{
    private readonly List<Check> _checks = new();
    private readonly List<CheckLine> _lines = new();
    private int _nextCheckId = 1;
    private int _nextLineId  = 1;
    private int _nextNumber  = 1;

    public Check? Get(int id)
    {
        var c = _checks.FirstOrDefault(x => x.Id == id);
        if (c is null) return null;
        c.Lines.Clear();
        c.Lines.AddRange(_lines.Where(l => l.CheckId == c.Id));
        return c;
    }

    public Check? GetByNumber(int number)
    {
        var c = _checks.FirstOrDefault(x => x.Number == number);
        if (c is null) return null;
        c.Lines.Clear();
        c.Lines.AddRange(_lines.Where(l => l.CheckId == c.Id));
        return c;
    }

    public IReadOnlyList<Check> GetOpen() =>
        _checks.Where(c => c.State is CheckState.Open or CheckState.Parked).ToList();

    public Check Save(Check c)
    {
        c.Id = _nextCheckId++;
        _checks.Add(c);
        return c;
    }

    public void Update(Check c)
    {
        var idx = _checks.FindIndex(x => x.Id == c.Id);
        if (idx >= 0) _checks[idx] = c;
    }

    public CheckLine SaveLine(CheckLine l)
    {
        l.Id = _nextLineId++;
        _lines.Add(l);
        return l;
    }

    public void UpdateLine(CheckLine l)
    {
        var idx = _lines.FindIndex(x => x.Id == l.Id);
        if (idx >= 0) _lines[idx] = l;
    }

    public int NextCheckNumber() => _nextNumber++;
}

public sealed class FakeDepartmentRepository : IDepartmentRepository
{
    private readonly List<Department> _depts;
    public FakeDepartmentRepository(IEnumerable<Department> seed) => _depts = seed.ToList();
    public Department? Get(int id) => _depts.FirstOrDefault(d => d.Id == id);
    public IReadOnlyList<Department> All() => _depts;
}

public sealed class FakePrinterGroupRepository : IPrinterGroupRepository
{
    private readonly List<PrinterGroup> _groups;
    public FakePrinterGroupRepository(IEnumerable<PrinterGroup> seed) => _groups = seed.ToList();
    public PrinterGroup? Get(int id) => _groups.FirstOrDefault(g => g.Id == id);
}

public sealed class SpyKitchenPrinter : IKitchenPrinter
{
    public List<(PrinterGroup Group, IReadOnlyList<CheckLine> Lines)> Calls { get; } = new();
    public void Print(PrinterGroup group, IReadOnlyList<CheckLine> lines) => Calls.Add((group, lines));
}
