namespace Bank.Pos.Till.Layout;

public enum ButtonKind { Plu, Mode, Function }

public sealed record KeyboardButton(
    int Col, int W, int H,
    ButtonKind Kind, string Value, string Caption,
    string Color, bool ManagerOnly = false);

public sealed record KeyboardRow(int Index, IReadOnlyList<KeyboardButton> Buttons);

public sealed record KeyboardLayout(int Rows, int Cols, IReadOnlyList<KeyboardRow> Grid);
