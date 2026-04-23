namespace Bank.Pos.Core.Tests;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Kitchen;
using Bank.Pos.Core.Tests.Fakes;

public sealed class KitchenRouterTests
{
    [Fact]
    public void SendCheck_GroupsByDepartment_AndMarksSent()
    {
        var checkRepo = new FakeCheckRepository();
        var deptRepo = new FakeDepartmentRepository(new[]
        {
            new Department { Id = 1, Name = "Drinks", PrinterGroupId = 10 },
            new Department { Id = 2, Name = "Food", PrinterGroupId = 20 },
        });
        var pgRepo = new FakePrinterGroupRepository(new[]
        {
            new PrinterGroup { Id = 10, Name = "Bar", Device = "console" },
            new PrinterGroup { Id = 20, Name = "Kitchen", Device = "console" },
        });
        var spy = new SpyKitchenPrinter();
        var router = new KitchenRouter(deptRepo, checkRepo, spy);

        var check = new Check
        {
            Id = 1,
            Number = 1,
            OpenedAt = DateTime.UtcNow,
            OpenedByClerkId = 1,
            State = CheckState.Open,
            Lines =
            {
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 1, Description = "Beer", Qty = 1, UnitPrice = 5m, DepartmentId = 1, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 2, Description = "Burger", Qty = 1, UnitPrice = 10m, DepartmentId = 2, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
            }
        };

        router.SendCheck(check, pgRepo);

        Assert.Equal(2, spy.Calls.Count);
        Assert.All(check.Lines, l => Assert.True(l.Sent));
    }

    [Fact]
    public void SendCheck_SkipsTrainingRefundVoidAndAlreadySent()
    {
        var checkRepo = new FakeCheckRepository();
        var deptRepo = new FakeDepartmentRepository(new[] { new Department { Id = 1, Name = "Drinks", PrinterGroupId = 10 } });
        var pgRepo = new FakePrinterGroupRepository(new[] { new PrinterGroup { Id = 10, Name = "Bar", Device = "console" } });
        var spy = new SpyKitchenPrinter();
        var router = new KitchenRouter(deptRepo, checkRepo, spy);

        var check = new Check
        {
            Id = 1,
            Number = 1,
            OpenedAt = DateTime.UtcNow,
            OpenedByClerkId = 1,
            State = CheckState.Open,
            Lines =
            {
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 1, Description = "Training", Qty = 1, UnitPrice = 1m, DepartmentId = 1, IsTraining = true, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 2, Description = "Refund", Qty = 1, UnitPrice = 1m, DepartmentId = 1, IsRefund = true, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 3, Description = "Void", Qty = 1, UnitPrice = 1m, DepartmentId = 1, IsVoid = true, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 4, Description = "Sent", Qty = 1, UnitPrice = 1m, DepartmentId = 1, Sent = true, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
            }
        };

        router.SendCheck(check, pgRepo);

        Assert.Empty(spy.Calls);
    }

    [Fact]
    public void SendCheck_Throws_WhenDepartmentMissing()
    {
        var checkRepo = new FakeCheckRepository();
        var deptRepo = new FakeDepartmentRepository(Array.Empty<Department>());
        var pgRepo = new FakePrinterGroupRepository(new[] { new PrinterGroup { Id = 10, Name = "Bar", Device = "console" } });
        var spy = new SpyKitchenPrinter();
        var router = new KitchenRouter(deptRepo, checkRepo, spy);

        var check = new Check
        {
            Id = 1,
            Number = 1,
            OpenedAt = DateTime.UtcNow,
            OpenedByClerkId = 1,
            State = CheckState.Open,
            Lines =
            {
                checkRepo.SaveLine(new CheckLine { CheckId = 1, Sequence = 1, Description = "Beer", Qty = 1, UnitPrice = 5m, DepartmentId = 99, AddedAt = DateTime.UtcNow, AddedByClerkId = 1 }),
            }
        };

        Assert.Throws<InvalidOperationException>(() => router.SendCheck(check, pgRepo));
    }
}
