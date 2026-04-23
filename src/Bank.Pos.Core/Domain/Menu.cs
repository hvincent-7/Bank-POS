namespace Bank.Pos.Core.Domain;

public sealed class Department
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public int PrinterGroupId { get; set; }
}

public sealed class PrinterGroup
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    /// <summary>Device address: "console", "COM3", or "host:port".</summary>
    public string Device { get; set; } = "console";
}

public sealed class Plu
{
    public string Code { get; set; } = "";
    public string Description { get; set; } = "";
    public decimal UnitPrice { get; set; }
    public int DepartmentId { get; set; }
}
