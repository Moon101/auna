from __future__ import absolute_import, unicode_literals
import os
from celery import Celery

# Establecer la configuración predeterminada de Django para Celery
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'auna.settings')

app = Celery('auna')

# Leer la configuración de Celery desde settings.py
app.config_from_object('django.conf:settings', namespace='CELERY')

# Descubrir automáticamente tareas en aplicaciones registradas
app.autodiscover_tasks()

@app.task(bind=True)
def debug_task(self):
    print(f'Request: {self.request!r}')