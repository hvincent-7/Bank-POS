namespace Bank.Pos.Core.Services;

using Domain;
using Repositories;

public sealed class ClerkService
{
    private readonly IClerkRepository _clerks;
    private readonly ISessionRepository _sessions;

    public ClerkService(IClerkRepository clerks, ISessionRepository sessions)
    {
        _clerks = clerks;
        _sessions = sessions;
    }

    /// <summary>Signs a clerk on by 4-digit code. Returns the new active session.</summary>
    public ClerkSession SignOn(string code)
    {
        var clerk = _clerks.FindByCode(code)
            ?? throw new InvalidOperationException("Invalid sign-on code.");

        if (!clerk.Active)
            throw new InvalidOperationException("Clerk account is inactive.");

        if (_sessions.GetActive(clerk.Id) is not null)
            throw new InvalidOperationException($"{clerk.Name} is already signed on.");

        var session = new ClerkSession
        {
            ClerkId = clerk.Id,
            Clerk = clerk,
            SignedOnAt = DateTime.UtcNow,
            CurrentMode = TillMode.Sales,
        };
        return _sessions.Save(session);
    }

    /// <summary>Signs off the currently active session for a clerk.</summary>
    public void SignOff(ClerkSession session)
    {
        session.SignedOffAt = DateTime.UtcNow;
        _sessions.Update(session);
    }

    /// <summary>Changes the till mode for a session. Managers can set any mode; Staff cannot set Manager or Refund.</summary>
    public void SetMode(ClerkSession session, TillMode mode)
    {
        if (session.Clerk.Role == ClerkRole.Staff && mode is TillMode.Manager or TillMode.Refund)
            throw new UnauthorizedAccessException($"Clerk role {session.Clerk.Role} cannot set mode {mode}.");

        session.CurrentMode = mode;
        _sessions.Update(session);
    }
}
