namespace Bank.Pos.Core.Domain;

public enum ClerkRole { Staff, Supervisor, Manager }
public enum TillMode   { Sales, Training, Refund, Void, Manager }
public enum OrderStatus { Pending, Sent, Closed, Voided }
public enum CheckState  { Open, Parked, Closed, Voided }
