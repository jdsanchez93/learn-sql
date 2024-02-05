## Instructions

1. Run SQL Server in docker: `docker-compose up -d`
2. Run setup script from:

```
Invoke-Sqlcmd -InputFile ".\setup_lol_db.sql" -ConnectionString "Data Source=localhost;User Id=sa;Password=example_123;"
```

3. Run queries:

```
Invoke-Sqlcmd -InputFile ".\lol_queries.sql" -ConnectionString "Data Source=localhost;User Id=sa;Password=example_123;" |Format-Table
```

4. `docker-compose down`