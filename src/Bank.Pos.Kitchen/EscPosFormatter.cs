namespace Bank.Pos.Kitchen;

using Bank.Pos.Core.Domain;

/// <summary>Formats check lines into an ESC/POS byte sequence.</summary>
public static class EscPosFormatter
{
    private const byte ESC = 0x1B;
    private const byte GS  = 0x1D;
    private const byte LF  = 0x0A;

    public static byte[] Format(Check check, IReadOnlyList<CheckLine> lines)
    {
        var buf = new List<byte>();

        // Initialize
        buf.AddRange(new byte[] { ESC, 0x40 });

        // Bold on
        buf.AddRange(new byte[] { ESC, 0x45, 0x01 });
        buf.AddRange(Encode($"CHECK #{check.Number}  TABLE: {check.TableLabel}"));
        buf.Add(LF);
        // Bold off
        buf.AddRange(new byte[] { ESC, 0x45, 0x00 });

        buf.AddRange(Encode("--------------------------------"));
        buf.Add(LF);

        foreach (var line in lines)
        {
            var desc = $"{line.Qty}x {line.Description}";
            var price = $"£{line.LineTotal:0.00}";
            var padding = Math.Max(1, 32 - desc.Length - price.Length);
            buf.AddRange(Encode(desc + new string(' ', padding) + price));
            buf.Add(LF);
        }

        buf.AddRange(Encode("--------------------------------"));
        buf.Add(LF);

        // Cut
        buf.AddRange(new byte[] { GS, 0x56, 0x00 });

        return buf.ToArray();
    }

    private static byte[] Encode(string s) => System.Text.Encoding.ASCII.GetBytes(s);
}
