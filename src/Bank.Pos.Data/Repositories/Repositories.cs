namespace Bank.Pos.Data.Repositories;

using Dapper;
using Microsoft.Data.Sqlite;
using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Repositories;

public sealed class ClerkRepository : IClerkRepository
{
    private readonly string _cs;
    public ClerkRepository(string connectionString) => _cs = connectionString;

    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public Clerk? FindByCode(string code)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<ClerkRow>(
            "SELECT * FROM clerks WHERE sign_on_code = @code AND active = 1", new { code });
        return row is null ? null : Map(row);
    }

    public Clerk? Get(int id)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<ClerkRow>("SELECT * FROM clerks WHERE id = @id", new { id });
        return row is null ? null : Map(row);
    }

    private static Clerk Map(ClerkRow r) => new()
    {
        Id = r.id, Name = r.name, SignOnCode = r.sign_on_code,
        Role = Enum.Parse<ClerkRole>(r.role), Active = r.active == 1,
    };

    private sealed record ClerkRow(int id, string name, string sign_on_code, string role, int active);
}

public sealed class SessionRepository : ISessionRepository
{
    private readonly string _cs;
    private readonly IClerkRepository _clerks;
    public SessionRepository(string connectionString, IClerkRepository clerks)
    { _cs = connectionString; _clerks = clerks; }

    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public ClerkSession? GetActive(int clerkId)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<SessionRow>(
            "SELECT * FROM sessions WHERE clerk_id = @clerkId AND signed_off_at IS NULL", new { clerkId });
        return row is null ? null : Map(row);
    }

    public ClerkSession Save(ClerkSession s)
    {
        using var conn = Open();
        var id = conn.ExecuteScalar<int>(
            @"INSERT INTO sessions (clerk_id, signed_on_at, signed_off_at, current_mode)
              VALUES (@ClerkId, @SignedOnAt, @SignedOffAt, @CurrentMode);
              SELECT last_insert_rowid();",
            new { s.ClerkId, SignedOnAt = s.SignedOnAt.ToString("O"), s.SignedOffAt, CurrentMode = s.CurrentMode.ToString() });
                s.Id = id;
                return s;
    }

    public void Update(ClerkSession s)
    {
        using var conn = Open();
        conn.Execute(
            "UPDATE sessions SET signed_off_at = @SignedOffAt, current_mode = @CurrentMode WHERE id = @Id",
            new { s.Id, SignedOffAt = s.SignedOffAt?.ToString("O"), CurrentMode = s.CurrentMode.ToString() });
    }

    private ClerkSession Map(SessionRow r)
    {
        var clerk = _clerks.Get(r.clerk_id)!;
        return new ClerkSession
        {
            Id = r.id, ClerkId = r.clerk_id, Clerk = clerk,
            SignedOnAt = DateTime.Parse(r.signed_on_at),
            SignedOffAt = r.signed_off_at is null ? null : DateTime.Parse(r.signed_off_at),
            CurrentMode = Enum.Parse<TillMode>(r.current_mode),
        };
    }

    private sealed record SessionRow(int id, int clerk_id, string signed_on_at, string? signed_off_at, string current_mode);
}

public sealed class DepartmentRepository : IDepartmentRepository
{
    private readonly string _cs;
    public DepartmentRepository(string cs) => _cs = cs;
    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public Department? Get(int id)
    {
        using var conn = Open();
        return conn.QuerySingleOrDefault<Department>(
            "SELECT id Id, name Name, printer_group_id PrinterGroupId FROM departments WHERE id = @id", new { id });
    }

    public IReadOnlyList<Department> All()
    {
        using var conn = Open();
        return conn.Query<Department>("SELECT id Id, name Name, printer_group_id PrinterGroupId FROM departments").ToList();
    }
}

public sealed class PrinterGroupRepository : IPrinterGroupRepository
{
    private readonly string _cs;
    public PrinterGroupRepository(string cs) => _cs = cs;
    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public PrinterGroup? Get(int id)
    {
        using var conn = Open();
        return conn.QuerySingleOrDefault<PrinterGroup>(
            "SELECT id Id, name Name, device Device FROM printer_groups WHERE id = @id", new { id });
    }
}

public sealed class PluRepository : IPluRepository
{
    private readonly string _cs;
    public PluRepository(string cs) => _cs = cs;
    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public Plu? Find(string code)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<PluRow>(
            "SELECT * FROM plus WHERE code = @code", new { code });
        return row is null ? null : Map(row);
    }

    public IReadOnlyList<Plu> All()
    {
        using var conn = Open();
        return conn.Query<PluRow>("SELECT * FROM plus").Select(Map).ToList();
    }

    private static Plu Map(PluRow r) => new() { Code = r.code, Description = r.description, UnitPrice = (decimal)r.unit_price, DepartmentId = r.department_id };
    private sealed record PluRow(string code, string description, double unit_price, int department_id);
}

public sealed class CheckRepository : ICheckRepository
{
    private readonly string _cs;
    public CheckRepository(string cs) => _cs = cs;
    private SqliteConnection Open() { var c = new SqliteConnection(_cs); c.Open(); return c; }

    public Check? Get(int id)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<CheckRow>("SELECT * FROM checks WHERE id = @id", new { id });
        if (row is null) return null;
        var check = MapCheck(row);
        check.Lines.AddRange(LoadLines(conn, id));
        return check;
    }

    public Check? GetByNumber(int number)
    {
        using var conn = Open();
        var row = conn.QuerySingleOrDefault<CheckRow>("SELECT * FROM checks WHERE number = @number", new { number });
        if (row is null) return null;
        var check = MapCheck(row);
        check.Lines.AddRange(LoadLines(conn, check.Id));
        return check;
    }

    public IReadOnlyList<Check> GetOpen()
    {
        using var conn = Open();
        var rows = conn.Query<CheckRow>("SELECT * FROM checks WHERE state IN ('Open','Parked') ORDER BY opened_at").ToList();
        return rows.Select(r => { var c = MapCheck(r); c.Lines.AddRange(LoadLines(conn, c.Id)); return c; }).ToList();
    }

    public Check Save(Check c)
    {
        using var conn = Open();
        var id = conn.ExecuteScalar<int>(
            @"INSERT INTO checks (number, opened_by_clerk_id, opened_at, closed_at, state, table_label)
              VALUES (@Number, @OpenedByClerkId, @OpenedAt, @ClosedAt, @State, @TableLabel);
              SELECT last_insert_rowid();",
            new { c.Number, c.OpenedByClerkId, OpenedAt = c.OpenedAt.ToString("O"), ClosedAt = c.ClosedAt?.ToString("O"), State = c.State.ToString(), c.TableLabel });
                c.Id = id;
                return c;
    }

    public void Update(Check c)
    {
        using var conn = Open();
        conn.Execute(
            "UPDATE checks SET state = @State, closed_at = @ClosedAt, table_label = @TableLabel WHERE id = @Id",
            new { State = c.State.ToString(), ClosedAt = c.ClosedAt?.ToString("O"), c.TableLabel, c.Id });
    }

    public CheckLine SaveLine(CheckLine l)
    {
        using var conn = Open();
        var id = conn.ExecuteScalar<int>(
            @"INSERT INTO check_lines (check_id,sequence,plu,description,qty,unit_price,department_id,is_refund,is_training,is_void,sent,added_at,added_by_clerk_id)
              VALUES (@CheckId,@Sequence,@Plu,@Description,@Qty,@UnitPrice,@DepartmentId,@IsRefund,@IsTraining,@IsVoid,@Sent,@AddedAt,@AddedByClerkId);
              SELECT last_insert_rowid();",
            new { l.CheckId, l.Sequence, l.Plu, l.Description, l.Qty, UnitPrice = (double)l.UnitPrice, l.DepartmentId,
                  IsRefund = l.IsRefund ? 1 : 0, IsTraining = l.IsTraining ? 1 : 0, IsVoid = l.IsVoid ? 1 : 0,
                  Sent = l.Sent ? 1 : 0, AddedAt = l.AddedAt.ToString("O"), l.AddedByClerkId });
                l.Id = id;
                return l;
    }

    public void UpdateLine(CheckLine l)
    {
        using var conn = Open();
        conn.Execute(
            "UPDATE check_lines SET is_void = @IsVoid, sent = @Sent, qty = @Qty WHERE id = @Id",
            new { IsVoid = l.IsVoid ? 1 : 0, Sent = l.Sent ? 1 : 0, l.Qty, l.Id });
    }

    public int NextCheckNumber()
    {
        using var conn = Open();
        return conn.ExecuteScalar<int>("SELECT COALESCE(MAX(number),0)+1 FROM checks");
    }

    private static IEnumerable<CheckLine> LoadLines(SqliteConnection conn, int checkId) =>
        conn.Query<LineRow>("SELECT * FROM check_lines WHERE check_id = @checkId ORDER BY sequence", new { checkId })
            .Select(MapLine);

    private static Check MapCheck(CheckRow r) => new()
    {
        Id = r.id, Number = r.number, OpenedByClerkId = r.opened_by_clerk_id,
        OpenedAt = DateTime.Parse(r.opened_at),
        ClosedAt = r.closed_at is null ? null : DateTime.Parse(r.closed_at),
        State = Enum.Parse<CheckState>(r.state), TableLabel = r.table_label,
    };

    private static CheckLine MapLine(LineRow r) => new()
    {
        Id = r.id, CheckId = r.check_id, Sequence = r.sequence, Plu = r.plu,
        Description = r.description, Qty = r.qty, UnitPrice = (decimal)r.unit_price,
        DepartmentId = r.department_id, IsRefund = r.is_refund == 1, IsTraining = r.is_training == 1,
        IsVoid = r.is_void == 1, Sent = r.sent == 1, AddedAt = DateTime.Parse(r.added_at),
        AddedByClerkId = r.added_by_clerk_id,
    };

    private sealed record CheckRow(int id, int number, int opened_by_clerk_id, string opened_at, string? closed_at, string state, string table_label);
    private sealed record LineRow(int id, int check_id, int sequence, string plu, string description, int qty, double unit_price, int department_id, int is_refund, int is_training, int is_void, int sent, string added_at, int added_by_clerk_id);
}
