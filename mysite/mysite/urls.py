from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
# from myapp.views import MyappAPIView

urlpatterns = [
    path('admin/', admin.site.urls),
    # path('api/v1/myapplist', MyappAPIView.as_view()),
    path('main/', include('myapp.urls')),
]
