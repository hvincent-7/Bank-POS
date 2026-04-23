namespace Bank.Pos.Core.Tests;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Services;
using Bank.Pos.Core.Tests.Fakes;

public sealed class ClerkServiceTests
{
    private static readonly Clerk Manager = new() { Id = 1, Name = "Alice", SignOnCode = "1234", Role = ClerkRole.Manager, Active = true };
    private static readonly Clerk Staff   = new() { Id = 2, Name = "Ben",   SignOnCode = "2222", Role = ClerkRole.Staff,   Active = true };

    private static ClerkService Build(params Clerk[] clerks)
    {
        var clerkRepo   = new FakeClerkRepository(clerks);
        var sessionRepo = new FakeSessionRepository();
        return new ClerkService(clerkRepo, sessionRepo);
    }

    [Fact]
    public void SignOn_ValidCode_ReturnsActiveSession()
    {
        var svc = Build(Manager);
        var session = svc.SignOn("1234");

        Assert.Equal(Manager.Id, session.ClerkId);
        Assert.True(session.IsActive);
        Assert.Equal(TillMode.Sales, session.CurrentMode);
    }

    [Fact]
    public void SignOn_InvalidCode_Throws()
    {
        var svc = Build(Manager);
        Assert.Throws<InvalidOperationException>(() => svc.SignOn("9999"));
    }

    [Fact]
    public void SignOn_AlreadySignedOn_Throws()
    {
        var svc = Build(Manager);
        svc.SignOn("1234");
        Assert.Throws<InvalidOperationException>(() => svc.SignOn("1234"));
    }

    [Fact]
    public void SignOff_ClosesSession()
    {
        var svc = Build(Manager);
        var session = svc.SignOn("1234");
        svc.SignOff(session);
        Assert.False(session.IsActive);
    }

    [Fact]
    public void SetMode_Manager_CanSetManagerMode()
    {
        var svc = Build(Manager);
        var session = svc.SignOn("1234");
        svc.SetMode(session, TillMode.Manager);
        Assert.Equal(TillMode.Manager, session.CurrentMode);
    }

    [Fact]
    public void SetMode_Staff_CannotSetManagerMode()
    {
        var svc = Build(Staff);
        var session = svc.SignOn("2222");
        Assert.Throws<UnauthorizedAccessException>(() => svc.SetMode(session, TillMode.Manager));
    }

    [Fact]
    public void SetMode_Staff_CannotSetRefundMode()
    {
        var svc = Build(Staff);
        var session = svc.SignOn("2222");
        Assert.Throws<UnauthorizedAccessException>(() => svc.SetMode(session, TillMode.Refund));
    }

    [Fact]
    public void SetMode_Staff_CanSetSalesMode()
    {
        var svc = Build(Staff);
        var session = svc.SignOn("2222");
        svc.SetMode(session, TillMode.Sales);
        Assert.Equal(TillMode.Sales, session.CurrentMode);
    }
}
