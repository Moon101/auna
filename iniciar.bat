@echo off
:: Activar el entorno virtual
call ..\venv\Scripts\activate

:: Iniciar Redis en una nueva ventana
start cmd /k "redis-server.exe" "C:\Program Files\Redis\redis.conf"

:: Iniciar Celery en una nueva ventana
start cmd /k "celery -A auna worker --loglevel=info"

:: Actualizar el repositorio con git pull
git pull

:: Ejecutar el script de backup
call db_backups.bat

:: Iniciar el servidor de Django
python manage.py runserver

:: Pausar para evitar que la ventana se cierre
pause