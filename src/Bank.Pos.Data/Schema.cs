namespace Bank.Pos.Data;

public static class Schema
{
    public const string CreateTables = @"
PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;

CREATE TABLE IF NOT EXISTS clerks (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    name          TEXT    NOT NULL,
    sign_on_code  TEXT    NOT NULL UNIQUE,
    role          TEXT    NOT NULL DEFAULT 'Staff',
    active        INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sessions (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    clerk_id       INTEGER NOT NULL REFERENCES clerks(id),
    signed_on_at   TEXT    NOT NULL,
    signed_off_at  TEXT,
    current_mode   TEXT    NOT NULL DEFAULT 'Sales'
);

CREATE TABLE IF NOT EXISTS printer_groups (
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name   TEXT    NOT NULL,
    device TEXT    NOT NULL DEFAULT 'console'
);

CREATE TABLE IF NOT EXISTS departments (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    name             TEXT    NOT NULL,
    printer_group_id INTEGER NOT NULL REFERENCES printer_groups(id)
);

CREATE TABLE IF NOT EXISTS plus (
    code          TEXT    PRIMARY KEY,
    description   TEXT    NOT NULL,
    unit_price    REAL    NOT NULL,
    department_id INTEGER NOT NULL REFERENCES departments(id)
);

CREATE TABLE IF NOT EXISTS checks (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    number              INTEGER NOT NULL UNIQUE,
    opened_by_clerk_id  INTEGER NOT NULL REFERENCES clerks(id),
    opened_at           TEXT    NOT NULL,
    closed_at           TEXT,
    state               TEXT    NOT NULL DEFAULT 'Open',
    table_label         TEXT    NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS check_lines (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    check_id         INTEGER NOT NULL REFERENCES checks(id),
    sequence         INTEGER NOT NULL,
    plu              TEXT    NOT NULL,
    description      TEXT    NOT NULL,
    qty              INTEGER NOT NULL DEFAULT 1,
    unit_price       REAL    NOT NULL,
    department_id    INTEGER NOT NULL REFERENCES departments(id),
    is_refund        INTEGER NOT NULL DEFAULT 0,
    is_training      INTEGER NOT NULL DEFAULT 0,
    is_void          INTEGER NOT NULL DEFAULT 0,
    sent             INTEGER NOT NULL DEFAULT 0,
    added_at         TEXT    NOT NULL,
    added_by_clerk_id INTEGER NOT NULL REFERENCES clerks(id)
);
";

    public const string SeedData = @"
INSERT OR IGNORE INTO printer_groups (id, name, device) VALUES
    (1, 'Bar',     'console'),
    (2, 'Kitchen', 'console');

INSERT OR IGNORE INTO departments (id, name, printer_group_id) VALUES
    (1, 'Drinks', 1),
    (2, 'Food',   2);

INSERT OR IGNORE INTO clerks (id, name, sign_on_code, role, active) VALUES
    (1, 'Alice', '1234', 'Manager',    1),
    (2, 'Ben',   '2222', 'Staff',      1),
    (3, 'Cara',  '3333', 'Staff',      1),
    (4, 'Dan',   '4444', 'Supervisor', 1);

INSERT OR IGNORE INTO plus (code, description, unit_price, department_id) VALUES
    ('LAG-PT',  'Lager Pint',        5.20, 1),
    ('ALE-PT',  'Ale Pint',          5.50, 1),
    ('WINE-GL', 'House Wine (Glass)', 6.50, 1),
    ('COKE',    'Coke',              2.50, 1),
    ('BURG',    'Burger',            12.00, 2),
    ('CHIP',    'Chips',              4.00, 2),
    ('PIZZA',   'Pizza',             13.00, 2);
";
}
