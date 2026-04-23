namespace Bank.Pos.Till.Layout;

using System.Xml.Linq;

public static class XmlKeyboardLoader
{
    public static KeyboardLayout Load(string xmlPath)
    {
        var doc = XDocument.Load(xmlPath);
        var root = doc.Root!;
        int rows = (int)root.Attribute("rows")!;
        int cols  = (int)root.Attribute("cols")!;

        var grid = root.Elements("row").Select(row =>
        {
            var idx = (int)row.Attribute("index")!;
            var buttons = row.Elements("button").Select(b => new KeyboardButton(
                Col: (int)b.Attribute("col")!,
                W: (int)(b.Attribute("w") ?? new XAttribute("w", 1)),
                H: (int)(b.Attribute("h") ?? new XAttribute("h", 1)),
                Kind: Enum.Parse<ButtonKind>((string)b.Attribute("kind")!, ignoreCase: true),
                Value: (string)b.Attribute("value")!,
                Caption: ((string?)b.Attribute("caption") ?? "").Replace("&#10;", "\n"),
                Color: (string?)b.Attribute("color") ?? "#555555",
                ManagerOnly: (bool?)b.Attribute("managerOnly") ?? false
            )).ToList();
            return new KeyboardRow(idx, buttons);
        }).ToList();

        return new KeyboardLayout(rows, cols, grid);
    }
}
