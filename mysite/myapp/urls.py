from django.urls import path

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from myapp import views
from django.conf import settings
from django.conf.urls.static import static
from .views import CustomLogin, CustomLogout
from django.conf import settings
from .api_views import PublisherView


urlpatterns = [
    # path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'), 
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/publishers', PublisherView.as_view(), name='publisher_api'),

    path('index', views.index, name='index'),
    path('register/', views.register, name='register'),
    path('basket/', views.basket, name='basket'),
    path('sellerbas/', views.sellerbas, name='sellerbas'),
    path('newclothes/', views.add_new_clothes, name='newclothes'),

    path('login/', views.CustomLogin.as_view(), name='login'),
    path('logout/', views.CustomLogout.as_view(), name='logout'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
