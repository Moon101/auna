@echo off
:: Configuración de variables
set FECHA=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
set BACKUP_DIR=db_backups
set DB_NAME=db_auna
set DB_USER=auna_user
set DB_HOST=localhost
set DB_PORT=5432
set DB_PASSWORD=MoonPassword

:: Crear el directorio de backups si no existe
if not exist %BACKUP_DIR% mkdir %BACKUP_DIR%

:: Realizar el backup con codificación UTF8
set PGPASSWORD=%DB_PASSWORD%
pg_dump -U %DB_USER% -h %DB_HOST% -p %DB_PORT% -d %DB_NAME% -F c -b -v --encoding=UTF8 -f "%BACKUP_DIR%\%DB_NAME%_%FECHA%.backup"

:: Mensaje de confirmación
echo Backup completado: %BACKUP_DIR%\%DB_NAME%_%FECHA%.backup
pause