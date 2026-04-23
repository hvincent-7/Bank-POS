namespace Bank.Pos.Till;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Services;

public sealed class SignOnForm : Form
{
    private readonly ClerkService _clerkService;
    private readonly Func<ClerkSession, Form> _mainFormFactory;

    private TextBox _codeBox = null!;
    private Label _errorLabel = null!;

    public SignOnForm(ClerkService clerkService, Func<ClerkSession, Form> mainFormFactory)
    {
        _clerkService = clerkService;
        _mainFormFactory = mainFormFactory;
        BuildUi();
    }

    private void BuildUi()
    {
        Text = "Bank POS — Sign On";
        Size = new Size(340, 540);
        StartPosition = FormStartPosition.CenterScreen;
        FormBorderStyle = FormBorderStyle.FixedSingle;
        MaximizeBox = false;
        BackColor = Color.FromArgb(0x0d, 0x0d, 0x1a);

        var outer = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            RowCount = 4,
            ColumnCount = 1,
            Padding = new Padding(20),
        };
        outer.RowStyles.Add(new RowStyle(SizeType.AutoSize));   // title
        outer.RowStyles.Add(new RowStyle(SizeType.AutoSize));   // code box
        outer.RowStyles.Add(new RowStyle(SizeType.Percent, 100)); // pad grid
        outer.RowStyles.Add(new RowStyle(SizeType.AutoSize));   // error

        var title = new Label
        {
            Text = "BANK POS",
            Font = new Font("Segoe UI", 22f, FontStyle.Bold),
            ForeColor = Color.White,
            AutoSize = true,
            Margin = new Padding(0, 10, 0, 20),
            Anchor = AnchorStyles.None,
        };

        _codeBox = new TextBox
        {
            Font = new Font("Courier New", 28f, FontStyle.Bold),
            TextAlign = HorizontalAlignment.Center,
            MaxLength = 6,
            UseSystemPasswordChar = true,
            BackColor = Color.FromArgb(0x1a, 0x1a, 0x2e),
            ForeColor = Color.White,
            Dock = DockStyle.Fill,
            Margin = new Padding(0, 0, 0, 12),
        };

        var padPanel = BuildNumpad();

        _errorLabel = new Label
        {
            ForeColor = Color.FromArgb(0xff, 0x55, 0x55),
            AutoSize = true,
            Font = new Font("Segoe UI", 9f),
            Margin = new Padding(0, 8, 0, 0),
        };

        outer.Controls.Add(title, 0, 0);
        outer.Controls.Add(_codeBox, 0, 1);
        outer.Controls.Add(padPanel, 0, 2);
        outer.Controls.Add(_errorLabel, 0, 3);
        Controls.Add(outer);
    }

    private Panel BuildNumpad()
    {
        var grid = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            RowCount = 4,
            ColumnCount = 3,
        };
        for (int i = 0; i < 3; i++) grid.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.3f));
        for (int i = 0; i < 4; i++) grid.RowStyles.Add(new RowStyle(SizeType.Percent, 25f));

        string[] labels = { "1","2","3","4","5","6","7","8","9","⌫","0","↵" };
        for (int i = 0; i < labels.Length; i++)
        {
            var lbl = labels[i];
            var btn = new Button
            {
                Text = lbl,
                Dock = DockStyle.Fill,
                Font = new Font("Segoe UI", 16f, FontStyle.Bold),
                FlatStyle = FlatStyle.Flat,
                ForeColor = Color.White,
                BackColor = lbl == "↵" ? Color.FromArgb(0x27, 0xae, 0x60) : Color.FromArgb(0x2c, 0x3e, 0x50),
                Margin = new Padding(3),
            };
            btn.FlatAppearance.BorderSize = 0;
            btn.Click += (_, _) => NumpadClick(lbl);
            grid.Controls.Add(btn, i % 3, i / 3);
        }

        return grid;
    }

    private void NumpadClick(string key)
    {
        _errorLabel.Text = "";
        switch (key)
        {
            case "⌫":
                if (_codeBox.Text.Length > 0)
                    _codeBox.Text = _codeBox.Text[..^1];
                break;
            case "↵":
                AttemptSignOn();
                break;
            default:
                _codeBox.Text += key;
                if (_codeBox.Text.Length >= 4) AttemptSignOn();
                break;
        }
    }

    private void AttemptSignOn()
    {
        try
        {
            var session = _clerkService.SignOn(_codeBox.Text);
            _codeBox.Text = "";
            var main = _mainFormFactory(session);
            main.Show();
            Hide();
            main.FormClosed += (_, _) => { Show(); };
        }
        catch (Exception ex)
        {
            _errorLabel.Text = ex.Message;
            _codeBox.Text = "";
        }
    }
}
