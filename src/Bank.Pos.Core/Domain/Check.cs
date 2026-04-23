namespace Bank.Pos.Core.Domain;

public sealed class Check
{
    public int Id { get; set; }
    public int Number { get; set; }
    public int OpenedByClerkId { get; set; }
    public DateTime OpenedAt { get; set; }
    public DateTime? ClosedAt { get; set; }
    public CheckState State { get; set; } = CheckState.Open;
    public string TableLabel { get; set; } = "";
    public List<CheckLine> Lines { get; set; } = new();

    public decimal Total => Lines
        .Where(l => !l.IsVoid)
        .Sum(l => l.IsRefund ? -l.LineTotal : l.LineTotal);
}

public sealed class CheckLine
{
    public int Id { get; set; }
    public int CheckId { get; set; }
    public int Sequence { get; set; }
    public string Plu { get; set; } = "";
    public string Description { get; set; } = "";
    public int Qty { get; set; }
    public decimal UnitPrice { get; set; }
    public int DepartmentId { get; set; }
    public bool IsRefund { get; set; }
    public bool IsTraining { get; set; }
    public bool IsVoid { get; set; }
    public bool Sent { get; set; }
    public DateTime AddedAt { get; set; }
    public int AddedByClerkId { get; set; }

    public decimal LineTotal => UnitPrice * Qty;
}
