## Instructions

1. Run SQL Server in docker: `docker-compose up -d`
2. Run script from this folder: 

```
Invoke-Sqlcmd -InputFile ".\setup_lol_db.sql" -ConnectionString "Data Source=localhost;User Id=sa;Password=example_123;"
```

```
Invoke-Sqlcmd -InputFile ".\lol_queries.sql" -ConnectionString "Data Source=localhost;User Id=sa;Password=example_123;" |Format-Table
```