namespace Bank.Pos.Core.Services;

using Domain;
using Repositories;

public sealed class CheckService
{
    private readonly ICheckRepository _checks;

    public CheckService(ICheckRepository checks) => _checks = checks;

    public Check Open(ClerkSession session, string tableLabel = "")
    {
        var check = new Check
        {
            Number = _checks.NextCheckNumber(),
            OpenedByClerkId = session.ClerkId,
            OpenedAt = DateTime.UtcNow,
            TableLabel = tableLabel,
            State = CheckState.Open,
        };
        return _checks.Save(check);
    }

    public CheckLine AddLine(Check check, ClerkSession session, Plu plu, int qty = 1)
    {
        if (check.State != CheckState.Open)
            throw new InvalidOperationException("Can only add lines to an open check.");

        var line = new CheckLine
        {
            CheckId = check.Id,
            Sequence = check.Lines.Count + 1,
            Plu = plu.Code,
            Description = plu.Description,
            Qty = qty,
            UnitPrice = plu.UnitPrice,
            DepartmentId = plu.DepartmentId,
            IsTraining = session.CurrentMode == TillMode.Training,
            IsRefund = session.CurrentMode == TillMode.Refund,
            AddedAt = DateTime.UtcNow,
            AddedByClerkId = session.ClerkId,
        };
        var saved = _checks.SaveLine(line);
        check.Lines.Add(saved);
        return saved;
    }

    public void VoidLine(CheckLine line)
    {
        if (line.Sent)
            throw new InvalidOperationException("Cannot void a line that has already been sent to the kitchen.");

        line.IsVoid = true;
        _checks.UpdateLine(line);
    }

    public void Park(Check check)
    {
        if (check.State != CheckState.Open)
            throw new InvalidOperationException("Only open checks can be parked.");

        check.State = CheckState.Parked;
        _checks.Update(check);
    }

    public void Resume(Check check)
    {
        if (check.State != CheckState.Parked)
            throw new InvalidOperationException("Only parked checks can be resumed.");

        check.State = CheckState.Open;
        _checks.Update(check);
    }

    public void Close(Check check)
    {
        if (check.Lines.Count == 0 || check.Lines.All(l => l.IsVoid))
            throw new InvalidOperationException("Cannot close an empty check.");

        if (check.State != CheckState.Open)
            throw new InvalidOperationException("Only open checks can be closed.");

        check.State = CheckState.Closed;
        check.ClosedAt = DateTime.UtcNow;
        _checks.Update(check);
    }
}
