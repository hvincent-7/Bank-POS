using Bank.Pos.Data;
using Bank.Pos.Data.Repositories;
using Bank.Pos.Core.Services;
using Bank.Pos.Core.Kitchen;
using Bank.Pos.Kitchen;
using Bank.Pos.Till;

// ── Data directory & SQLite path ─────────────────────────────────────────────
var dataDir = Path.Combine(
    Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
    "BankPos");
Directory.CreateDirectory(dataDir);
var dbPath = Path.Combine(dataDir, "bank-pos.sqlite");
var cs = $"Data Source={dbPath}";

// ── Init & seed database ──────────────────────────────────────────────────────
DatabaseInitializer.Initialize(cs);

// ── Compose services ──────────────────────────────────────────────────────────
var clerkRepo   = new ClerkRepository(cs);
var sessionRepo = new SessionRepository(cs, clerkRepo);
var deptRepo    = new DepartmentRepository(cs);
var pgRepo      = new PrinterGroupRepository(cs);
var checkRepo   = new CheckRepository(cs);
var plusRepo    = new PluRepository(cs);

var clerkSvc  = new ClerkService(clerkRepo, sessionRepo);
var checkSvc  = new CheckService(checkRepo);
var printer   = new RoutingKitchenPrinter();
var router    = new KitchenRouter(deptRepo, checkRepo, printer);

// ── Layout paths ──────────────────────────────────────────────────────────────
var baseDir     = AppContext.BaseDirectory;
var layoutXml   = Path.Combine(baseDir, "layouts", "main.xml");
var assetsDir   = Path.Combine(baseDir, "layouts", "assets");

// ── Launch WinForms ───────────────────────────────────────────────────────────
Application.EnableVisualStyles();
Application.SetCompatibleTextRenderingDefault(false);
Application.SetHighDpiMode(HighDpiMode.PerMonitorV2);

var signOn = new SignOnForm(clerkSvc, session =>
    new MainTillForm(session, clerkSvc, checkSvc, router, checkRepo, plusRepo, pgRepo, layoutXml, assetsDir));

Application.Run(signOn);
