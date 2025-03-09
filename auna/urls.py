from django.contrib import admin
from django.urls import path, include
from django.conf.urls.i18n import i18n_patterns
from django.conf import settings
from django.conf.urls.static import static

# Rutas con soporte de internacionalización
urlpatterns = i18n_patterns(
    path('admin/', admin.site.urls),  # Panel de administración
    # path('auna/', include('auna.urls')),  # Rutas de tu aplicación
)

# Ruta para cambiar el idioma
urlpatterns += [
    path('i18n/', include('django.conf.urls.i18n')),
]

# Servir archivos estáticos y multimedia en modo de desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
