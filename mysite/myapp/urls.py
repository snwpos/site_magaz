from django.urls import path
from django.contrib.auth import views as auth_views
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
    path('news/', views.news, name='news'),
    path('sellerbas/', views.get_all_clothes, name='sellerbas'),
    path('cart/', views.basket, name='cart_info'),
    path('cart/add/<int:id>', views.add_to_basket, name='cart_add' ),
    path('cart/remove/<int:id>', views.basket_remove, name='cart_remove'),
    
    path('fav/', views.favorite, name='favorite'),
    path('favorite/ad/<int:id>', views.add_favorite_cloth, name='favorite_add' ),
    path('favorite/remove/<int:id>', views.favorite_remove, name='favorite_remove'),

    path('newclothes/', views.add_new_clothes, name='new_cloth'),
    

    path('login/', views.CustomLogin.as_view(), name='login'),
    path('logout/', views.CustomLogout.as_view(), name='logout'),
    path('<slug:slug>/', views.ClothDetailView.as_view(), name="cloth_detail"),
    path('reset_password/', auth_views.PasswordResetView.as_view(), name="reset_password"),

    path('reset_password_sent/', auth_views.PasswordResetDoneView.as_view(), name="password_reset_done"),

    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(), name="password_reset_confirm"),

    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(), name="password_reset_complete"),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
