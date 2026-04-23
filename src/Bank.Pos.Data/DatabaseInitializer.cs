namespace Bank.Pos.Data;

using Microsoft.Data.Sqlite;

public static class DatabaseInitializer
{
    public static void Initialize(string connectionString)
    {
        using var conn = new SqliteConnection(connectionString);
        conn.Open();
        using var cmd = conn.CreateCommand();
        cmd.CommandText = Schema.CreateTables;
        cmd.ExecuteNonQuery();
        cmd.CommandText = Schema.SeedData;
        cmd.ExecuteNonQuery();
    }
}
