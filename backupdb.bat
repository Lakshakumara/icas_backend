@echo off
set PGUSER=postgres
set PGPASSWORD=abcd
set PGDATABASE=insurance
set PGHOST=localhost
set PGPORT=5432
set BACKUP_DIR=.
set BACKUP_FILE=%BACKUP_DIR%\backup_%date:~10,4%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2%%time:~6,2%.sql

"C:\Program Files\PostgreSQL\16\bin\pg_dump" --inserts -U %PGUSER% -h %PGHOST% -p %PGPORT% -d %PGDATABASE% -f %BACKUP_FILE%
