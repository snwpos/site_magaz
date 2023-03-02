"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path, include
from myapp import views
from django.conf import settings
from django.conf.urls.static import static
from .views import CustomLogin, CustomLogout
from django.conf import settings

urlpatterns = [
    path('index', views.index, name='index'),
    path('register/', views.register, name='register'),
    path('basket/', views.basket, name='basket'),
    path('sellerbas/', views.sellerbas, name='sellerbas'),

    path('login/', views.CustomLogin.as_view(), name='login'),
    path('logout/', views.CustomLogout.as_view(), name='logout'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
