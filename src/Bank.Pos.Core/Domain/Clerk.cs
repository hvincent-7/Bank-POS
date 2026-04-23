namespace Bank.Pos.Core.Domain;

public sealed class Clerk
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public string SignOnCode { get; set; } = "";
    public ClerkRole Role { get; set; }
    public bool Active { get; set; } = true;
}

public sealed class ClerkSession
{
    public int Id { get; set; }
    public int ClerkId { get; set; }
    public Clerk Clerk { get; set; } = null!;
    public DateTime SignedOnAt { get; set; }
    public DateTime? SignedOffAt { get; set; }
    public TillMode CurrentMode { get; set; } = TillMode.Sales;

    public bool IsActive => SignedOffAt is null;
}
