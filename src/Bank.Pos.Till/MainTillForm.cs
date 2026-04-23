namespace Bank.Pos.Till;

using Bank.Pos.Core.Domain;
using Bank.Pos.Core.Repositories;
using Bank.Pos.Core.Services;
using Bank.Pos.Core.Kitchen;
using Bank.Pos.Till.Layout;

public sealed class MainTillForm : Form
{
    private readonly ClerkSession _session;
    private readonly ClerkService _clerkService;
    private readonly CheckService _checkService;
    private readonly KitchenRouter _kitchenRouter;
    private readonly IPluRepository _plus;
    private readonly IPrinterGroupRepository _printerGroups;
    private readonly ICheckRepository _checks;

    private Check? _activeCheck;

    // UI refs
    private Label _clerkLabel = null!;
    private Label _modeLabel  = null!;
    private ListBox _lineList = null!;
    private Label _totalLabel = null!;
    private Label _checkLabel = null!;
    private Label _statusLabel = null!;

    public MainTillForm(
        ClerkSession session,
        ClerkService clerkService,
        CheckService checkService,
        KitchenRouter kitchenRouter,
        ICheckRepository checks,
        IPluRepository plus,
        IPrinterGroupRepository printerGroups,
        string layoutXml,
        string assetsFolder)
    {
        _session = session;
        _clerkService = clerkService;
        _checkService = checkService;
        _kitchenRouter = kitchenRouter;
        _checks = checks;
        _plus = plus;
        _printerGroups = printerGroups;

        BuildUi(layoutXml, assetsFolder);
        RefreshTopBar();
    }

    private void BuildUi(string layoutXml, string assetsFolder)
    {
        Text = "Bank POS — Till";
        Size = new Size(1024, 768);
        StartPosition = FormStartPosition.CenterScreen;
        BackColor = Color.FromArgb(0x0d, 0x0d, 0x1a);

        // ── Top bar ──────────────────────────────────────────────────────────
        var topBar = new Panel
        {
            Dock = DockStyle.Top,
            Height = 48,
            BackColor = Color.FromArgb(0x16, 0x16, 0x2e),
            Padding = new Padding(8, 0, 8, 0),
        };

        _clerkLabel = new Label
        {
            AutoSize = true, ForeColor = Color.White,
            Font = new Font("Segoe UI", 11f, FontStyle.Bold),
            Dock = DockStyle.Left,
            TextAlign = ContentAlignment.MiddleLeft,
        };
        _modeLabel = new Label
        {
            AutoSize = true, ForeColor = Color.FromArgb(0x2e, 0xcc, 0x71),
            Font = new Font("Segoe UI", 11f, FontStyle.Bold),
            Dock = DockStyle.Left,
            TextAlign = ContentAlignment.MiddleLeft,
            Margin = new Padding(16, 0, 0, 0),
        };
        var signOffBtn = new Button
        {
            Text = "Sign Off", Dock = DockStyle.Right,
            Width = 90, FlatStyle = FlatStyle.Flat,
            ForeColor = Color.White,
            BackColor = Color.FromArgb(0x7f, 0x8c, 0x8d),
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
        };
        signOffBtn.FlatAppearance.BorderSize = 0;
        signOffBtn.Click += (_, _) => SignOff();

        topBar.Controls.Add(_clerkLabel);
        topBar.Controls.Add(_modeLabel);
        topBar.Controls.Add(signOffBtn);

        // ── Main split ───────────────────────────────────────────────────────
        var body = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 3,
            RowCount = 1,
        };
        body.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50f));   // keyboard
        body.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 30f));   // check
        body.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20f));   // actions

        // Left — keyboard
        var layout = XmlKeyboardLoader.Load(layoutXml);
        var keyboard = new KeyboardControl(layout, _session.Clerk.Role, assetsFolder);
        keyboard.PluPressed     += OnPluPressed;
        keyboard.ModePressed    += OnModePressed;
        keyboard.FunctionPressed += OnFunctionPressed;

        // Center — check display
        var checkPanel = new Panel { Dock = DockStyle.Fill, BackColor = Color.FromArgb(0x12, 0x12, 0x28), Padding = new Padding(8) };
        _checkLabel = new Label { Dock = DockStyle.Top, Height = 28, ForeColor = Color.FromArgb(0xaa, 0xaa, 0xcc), Font = new Font("Segoe UI", 9f) };
        _lineList   = new ListBox
        {
            Dock = DockStyle.Fill, BackColor = Color.FromArgb(0x12, 0x12, 0x28),
            ForeColor = Color.White, Font = new Font("Courier New", 10f),
            BorderStyle = BorderStyle.None, SelectionMode = SelectionMode.One,
        };
        _totalLabel = new Label
        {
            Dock = DockStyle.Bottom, Height = 34,
            ForeColor = Color.FromArgb(0x2e, 0xcc, 0x71),
            Font = new Font("Segoe UI", 13f, FontStyle.Bold),
            TextAlign = ContentAlignment.MiddleRight,
        };
        checkPanel.Controls.Add(_lineList);
        checkPanel.Controls.Add(_checkLabel);
        checkPanel.Controls.Add(_totalLabel);

        // Right — action buttons
        var actionPanel = BuildActionPanel();

        body.Controls.Add(keyboard, 0, 0);
        body.Controls.Add(checkPanel, 1, 0);
        body.Controls.Add(actionPanel, 2, 0);

        _statusLabel = new Label
        {
            Dock = DockStyle.Bottom, Height = 24,
            ForeColor = Color.FromArgb(0x95, 0xa5, 0xa6),
            Font = new Font("Segoe UI", 8f),
            Padding = new Padding(8, 0, 0, 0),
        };

        Controls.Add(body);
        Controls.Add(topBar);
        Controls.Add(_statusLabel);
    }

    private Panel BuildActionPanel()
    {
        var panel = new Panel { Dock = DockStyle.Fill, Padding = new Padding(6), BackColor = Color.FromArgb(0x10, 0x10, 0x22) };
        var vbox  = new FlowLayoutPanel { Dock = DockStyle.Fill, FlowDirection = FlowDirection.TopDown, WrapContents = false };

        ActionButton(vbox, "NEW CHECK",   Color.FromArgb(0x16, 0xa0, 0x85), () => NewCheck());
        ActionButton(vbox, "VOID LINE",   Color.FromArgb(0xe7, 0x4c, 0x3c), () => VoidSelectedLine());
        ActionButton(vbox, "SEND KITCHEN",Color.FromArgb(0x27, 0xae, 0x60), () => SendKitchen());
        ActionButton(vbox, "PARK",        Color.FromArgb(0x29, 0x80, 0xb9), () => ParkCheck());
        ActionButton(vbox, "RESUME",      Color.FromArgb(0x16, 0xa0, 0x85), () => ResumeCheck());
        ActionButton(vbox, "CLOSE",       Color.FromArgb(0x8e, 0x44, 0xad), () => CloseCheck());

        panel.Controls.Add(vbox);
        return panel;
    }

    private static void ActionButton(FlowLayoutPanel parent, string text, Color color, Action onClick)
    {
        var btn = new Button
        {
            Text = text,
            Width = 140, Height = 55,
            Margin = new Padding(4),
            FlatStyle = FlatStyle.Flat,
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
            ForeColor = Color.White,
            BackColor = color,
        };
        btn.FlatAppearance.BorderSize = 0;
        btn.Click += (_, _) => onClick();
        parent.Controls.Add(btn);
    }

    // ── Event handlers ───────────────────────────────────────────────────────

    private void OnPluPressed(string code)
    {
        if (_activeCheck is null) NewCheck();
        var plu = _plus.Find(code);
        if (plu is null) { SetStatus($"PLU {code} not found."); return; }
        _checkService.AddLine(_activeCheck!, _session, plu);
        RefreshCheck();
    }

    private void OnModePressed(TillMode mode)
    {
        try
        {
            _clerkService.SetMode(_session, mode);
            RefreshTopBar();
        }
        catch (Exception ex) { SetStatus(ex.Message); }
    }

    private void OnFunctionPressed(string func)
    {
        switch (func)
        {
            case "Send":    SendKitchen(); break;
            case "Park":    ParkCheck();   break;
            case "Resume":  ResumeCheck(); break;
            case "Close":   CloseCheck();  break;
            case "SignOff": SignOff();      break;
        }
    }

    private void NewCheck()
    {
        _activeCheck = _checkService.Open(_session);
        RefreshCheck();
        SetStatus($"Opened check #{_activeCheck.Number}");
    }

    private void VoidSelectedLine()
    {
        if (_activeCheck is null || _lineList.SelectedIndex < 0) return;
        var line = _activeCheck.Lines.Where(l => !l.IsVoid).ElementAtOrDefault(_lineList.SelectedIndex);
        if (line is null) return;
        try { _checkService.VoidLine(line); RefreshCheck(); }
        catch (Exception ex) { SetStatus(ex.Message); }
    }

    private void SendKitchen()
    {
        if (_activeCheck is null) return;
        try
        {
            _kitchenRouter.SendCheck(_activeCheck, _printerGroups);
            SetStatus("Sent to kitchen.");
            RefreshCheck();
        }
        catch (Exception ex) { SetStatus(ex.Message); }
    }

    private void ParkCheck()
    {
        if (_activeCheck is null) return;
        try { _checkService.Park(_activeCheck); SetStatus($"Check #{_activeCheck.Number} parked."); _activeCheck = null; RefreshCheck(); }
        catch (Exception ex) { SetStatus(ex.Message); }
    }

    private void ResumeCheck()
    {
        var parked = _checks.GetOpen().Where(c => c.State == CheckState.Parked).OrderBy(c => c.Number).ToList();
        if (parked.Count == 0)
        {
            SetStatus("No parked checks to resume.");
            return;
        }

        var selected = parked[0];
        _checkService.Resume(selected);
        _activeCheck = _checks.Get(selected.Id) ?? selected;
        RefreshCheck();
        SetStatus($"Resumed check #{_activeCheck.Number}.");
    }

    private void CloseCheck()
    {
        if (_activeCheck is null) return;
        try
        {
            _checkService.Close(_activeCheck);
            SetStatus($"Check #{_activeCheck.Number} closed. Total: £{_activeCheck.Total:0.00}");
            _activeCheck = null;
            RefreshCheck();
        }
        catch (Exception ex) { SetStatus(ex.Message); }
    }

    private void SignOff()
    {
        _clerkService.SignOff(_session);
        Close();
    }

    // ── Refresh helpers ──────────────────────────────────────────────────────

    private void RefreshTopBar()
    {
        _clerkLabel.Text = $"  {_session.Clerk.Name}  ({_session.Clerk.Role})";
        _modeLabel.Text  = $"[ {_session.CurrentMode} ]";
    }

    private void RefreshCheck()
    {
        _lineList.Items.Clear();
        if (_activeCheck is null)
        {
            _checkLabel.Text = "No active check";
            _totalLabel.Text = "";
            return;
        }

        _checkLabel.Text = $"Check #{_activeCheck.Number}  Table: {_activeCheck.TableLabel}  ({_activeCheck.State})";
        foreach (var l in _activeCheck.Lines.Where(x => !x.IsVoid))
        {
            var sent = l.Sent ? "✓" : " ";
            _lineList.Items.Add($"{sent} {l.Qty,2}x {l.Description,-22} £{l.LineTotal,7:0.00}");
        }
        _totalLabel.Text = $"TOTAL  £{_activeCheck.Total:0.00}";
    }

    private void SetStatus(string msg)
    {
        _statusLabel.Text = msg;
    }
}
