namespace Bank.Pos.Core.Kitchen;

using Domain;
using Repositories;

public interface IKitchenPrinter
{
    void Print(PrinterGroup group, IReadOnlyList<CheckLine> lines);
}

public sealed class KitchenRouter
{
    private readonly IDepartmentRepository _departments;
    private readonly ICheckRepository _checks;
    private readonly IKitchenPrinter _printer;

    public KitchenRouter(
        IDepartmentRepository departments,
        ICheckRepository checks,
        IKitchenPrinter printer)
    {
        _departments = departments;
        _checks = checks;
        _printer = printer;
    }

    /// <summary>
    /// Sends all unsent, non-training/void/refund lines in the check to the appropriate kitchen printers,
    /// grouped by printer group. Marks each line Sent on success.
    /// </summary>
    public void SendCheck(Check check, IPrinterGroupRepository printerGroups)
    {
        var eligible = check.Lines
            .Where(l => !l.Sent && !l.IsVoid && !l.IsTraining && !l.IsRefund)
            .ToList();

        if (eligible.Count == 0) return;

        var grouped = eligible.GroupBy(l => l.DepartmentId);

        foreach (var grp in grouped)
        {
            var dept = _departments.Get(grp.Key)
                ?? throw new InvalidOperationException($"Department {grp.Key} not found.");

            var pg = printerGroups.Get(dept.PrinterGroupId)
                ?? throw new InvalidOperationException($"PrinterGroup {dept.PrinterGroupId} not found.");

            _printer.Print(pg, grp.ToList());

            foreach (var line in grp)
            {
                line.Sent = true;
                _checks.UpdateLine(line);
            }
        }
    }
}
