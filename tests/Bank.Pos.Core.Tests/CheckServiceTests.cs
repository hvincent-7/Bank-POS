namespace Bank.Pos.Core.Tests;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Services;
using Bank.Pos.Core.Tests.Fakes;

public sealed class CheckServiceTests
{
    private static ClerkSession Session(TillMode mode = TillMode.Sales) => new()
    {
        Id = 1,
        ClerkId = 1,
        Clerk = new Clerk { Id = 1, Name = "Alice", Role = ClerkRole.Manager, SignOnCode = "1234", Active = true },
        SignedOnAt = DateTime.UtcNow,
        CurrentMode = mode,
    };

    private static Plu SamplePlu() => new()
    {
        Code = "LAG-PT",
        Description = "Lager Pint",
        UnitPrice = 5.20m,
        DepartmentId = 1,
    };

    [Fact]
    public void Open_CreatesOpenCheck()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);

        var check = svc.Open(Session(), "A1");

        Assert.Equal(CheckState.Open, check.State);
        Assert.Equal("A1", check.TableLabel);
        Assert.True(check.Number > 0);
    }

    [Fact]
    public void AddLine_TrainingMode_SetsTrainingFlag()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);
        var check = svc.Open(Session(TillMode.Training));

        var line = svc.AddLine(check, Session(TillMode.Training), SamplePlu());

        Assert.True(line.IsTraining);
        Assert.False(line.IsRefund);
    }

    [Fact]
    public void AddLine_RefundMode_SetsRefundFlag()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);
        var check = svc.Open(Session(TillMode.Refund));

        var line = svc.AddLine(check, Session(TillMode.Refund), SamplePlu());

        Assert.True(line.IsRefund);
        Assert.False(line.IsTraining);
    }

    [Fact]
    public void VoidLine_SentLine_Throws()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);
        var check = svc.Open(Session());
        var line = svc.AddLine(check, Session(), SamplePlu());
        line.Sent = true;

        Assert.Throws<InvalidOperationException>(() => svc.VoidLine(line));
    }

    [Fact]
    public void ParkResume_TransitionsState()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);
        var check = svc.Open(Session());

        svc.Park(check);
        Assert.Equal(CheckState.Parked, check.State);

        svc.Resume(check);
        Assert.Equal(CheckState.Open, check.State);
    }

    [Fact]
    public void Close_EmptyCheck_Throws()
    {
        var repo = new FakeCheckRepository();
        var svc = new CheckService(repo);
        var check = svc.Open(Session());

        Assert.Throws<InvalidOperationException>(() => svc.Close(check));
    }

    [Fact]
    public void Total_IgnoresVoid_AndSubtractsRefund()
    {
        var check = new Check
        {
            Id = 1,
            Number = 1,
            OpenedAt = DateTime.UtcNow,
            OpenedByClerkId = 1,
            State = CheckState.Open,
            Lines =
            {
                new CheckLine { Id = 1, CheckId = 1, Sequence = 1, Description = "Beer", Qty = 2, UnitPrice = 5.00m, DepartmentId = 1 },
                new CheckLine { Id = 2, CheckId = 1, Sequence = 2, Description = "Void", Qty = 1, UnitPrice = 9.00m, DepartmentId = 1, IsVoid = true },
                new CheckLine { Id = 3, CheckId = 1, Sequence = 3, Description = "Refund", Qty = 1, UnitPrice = 3.00m, DepartmentId = 1, IsRefund = true },
            }
        };

        Assert.Equal(7.00m, check.Total);
    }
}
