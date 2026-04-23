namespace Bank.Pos.Till.Layout;

using Bank.Pos.Core.Domain;

public sealed class KeyboardControl : TableLayoutPanel
{
    public event Action<string>? PluPressed;
    public event Action<TillMode>? ModePressed;
    public event Action<string>? FunctionPressed;

    private readonly ClerkRole _role;

    public KeyboardControl(KeyboardLayout layout, ClerkRole role, string assetsFolder)
    {
        _role = role;

        RowCount = layout.Rows;
        ColumnCount = layout.Cols;
        Dock = DockStyle.Fill;
        BackColor = Color.FromArgb(0x1a, 0x1a, 0x2e);
        Padding = new Padding(4);

        for (int i = 0; i < layout.Cols; i++)
            ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100f / layout.Cols));
        for (int i = 0; i < layout.Rows; i++)
            RowStyles.Add(new RowStyle(SizeType.Percent, 100f / layout.Rows));

        foreach (var row in layout.Grid)
        {
            foreach (var btn in row.Buttons)
            {
                if (btn.ManagerOnly && role != ClerkRole.Manager)
                    continue;

                var button = BuildButton(btn, assetsFolder);
                SetCellPosition(button, new TableLayoutPanelCellPosition(btn.Col, row.Index));
                if (btn.W > 1) SetColumnSpan(button, btn.W);
                if (btn.H > 1) SetRowSpan(button, btn.H);
                Controls.Add(button);
            }
        }
    }

    private Button BuildButton(KeyboardButton def, string assetsFolder)
    {
        var btn = new Button
        {
            Text = def.Caption.Replace("&#10;", "\n"),
            Tag  = def,
            Dock = DockStyle.Fill,
            FlatStyle = FlatStyle.Flat,
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
            ForeColor = Color.White,
            Margin = new Padding(2),
            TextAlign = ContentAlignment.MiddleCenter,
        };

        if (ColorTranslator.FromHtml(def.Color) is Color c)
        {
            btn.BackColor = c;
            btn.FlatAppearance.BorderColor = ControlPaint.Dark(c, 0.3f);
            btn.FlatAppearance.BorderSize = 1;
        }

        // Load BMP icon if available
        var bmpPath = Path.Combine(assetsFolder, $"plu-{def.Value}.bmp");
        if (File.Exists(bmpPath))
        {
            btn.Image = Image.FromFile(bmpPath);
            btn.ImageAlign = ContentAlignment.TopCenter;
            btn.TextAlign  = ContentAlignment.BottomCenter;
            btn.Text = def.Caption;
        }

        btn.Click += (_, _) =>
        {
            switch (def.Kind)
            {
                case ButtonKind.Plu:
                    PluPressed?.Invoke(def.Value);
                    break;
                case ButtonKind.Mode when Enum.TryParse<TillMode>(def.Value, out var mode):
                    ModePressed?.Invoke(mode);
                    break;
                case ButtonKind.Function:
                    FunctionPressed?.Invoke(def.Value);
                    break;
            }
        };

        return btn;
    }
}
