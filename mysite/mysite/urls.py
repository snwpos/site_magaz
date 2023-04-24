from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
# from myapp.views import MyappAPIView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    # path('api/v1/myapplist', MyappAPIView.as_view()),
    path('main/', include('myapp.urls')),
    # path('api/', include('myapp.urls_api')),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
