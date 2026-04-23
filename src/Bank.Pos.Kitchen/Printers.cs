namespace Bank.Pos.Kitchen;

using System.Net.Sockets;
using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Kitchen;

/// <summary>Prints to the system console (stdout) — used as a fallback and in tests.</summary>
public sealed class ConsolePrinter : IKitchenPrinter
{
    public void Print(PrinterGroup group, IReadOnlyList<CheckLine> lines)
    {
        Console.WriteLine($"[KITCHEN:{group.Name}] ----- TICKET -----");
        foreach (var l in lines)
            Console.WriteLine($"  {l.Qty}x {l.Description,-24} £{l.LineTotal:0.00}");
        Console.WriteLine($"[KITCHEN:{group.Name}] ------------------");
    }
}

/// <summary>Sends ESC/POS bytes over a TCP socket to host:port.</summary>
public sealed class NetworkPrinter : IKitchenPrinter
{
    public void Print(PrinterGroup group, IReadOnlyList<CheckLine> lines)
    {
        // device format: "host:port"
        var parts = group.Device.Split(':');
        if (parts.Length != 2 || !int.TryParse(parts[1], out var port))
            throw new FormatException($"Invalid printer device address: {group.Device}");

        // Build a dummy check stub just for formatting purposes
        var stub = new Check { Number = 0, TableLabel = "?" };
        var bytes = EscPosFormatter.Format(stub, lines);

        using var tcp = new TcpClient(parts[0], port);
        using var stream = tcp.GetStream();
        stream.Write(bytes, 0, bytes.Length);
    }
}

/// <summary>
/// Routes to a network printer first; falls back to console on any network error.
/// </summary>
public sealed class RoutingKitchenPrinter : IKitchenPrinter
{
    private readonly NetworkPrinter _network;
    private readonly ConsolePrinter _console;

    public RoutingKitchenPrinter()
    {
        _network = new NetworkPrinter();
        _console = new ConsolePrinter();
    }

    public void Print(PrinterGroup group, IReadOnlyList<CheckLine> lines)
    {
        if (group.Device == "console")
        {
            _console.Print(group, lines);
            return;
        }

        try
        {
            _network.Print(group, lines);
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"[WARN] Network print failed ({ex.Message}), falling back to console.");
            _console.Print(group, lines);
        }
    }
}
