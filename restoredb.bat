
set PGUSER=postgres
set PGPASSWORD=abcd
set PGDATABASE=insurance
set PGHOST=localhost
set PGPORT=5432
set BACKUP_DIR=.
set BACKUP_FILE=backup.sql

"C:\Program Files\PostgreSQL\16\bin\pg_restore" -U %PGUSER% -h %PGHOST% -p %PGPORT% -d %PGDATABASE% %BACKUP_FILE%