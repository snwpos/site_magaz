from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.contrib import messages
from django.contrib.auth.views import LoginView, LogoutView
from .forms import UserRegistrationForm
from .models import Cinema, CityLocation
from django.shortcuts import resolve_url
from django.views.generic import View
from django.http.request import HttpRequest
from django.utils.decorators import method_decorator
from .decorators import *
# from rest_framework import generics
from .models import Cinema
from myapp import models
from myapp import forms
# from .serializers import CinemaSerializer


# class MyappAPIView(generics.ListAPIView):
#     queryset = Cinema.objects.all()
#     serializer_class = CinemaSerializer


def index(request: HttpRequest) -> HttpRequest:
    """index view."""

    context  = {
            'title': 'Заголовок - сайт',
            'cinemas': Cinema.objects.all(),
            'citys': CityLocation.objects.all(),
    }
    return render(
        request,
        template_name='myapp/index.html',
        context=context
    )

def basket(request):
    print("basket")
    return render(request, 'myapp/basket.html', {"title": "basket"})

def sellerbas(request):
    print("sellerbas")
    return render(request, 'myapp/sellerbas.html', {"title": "sellerbas"})

def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            password = form.cleaned_data.get('password1')
            user.set_password(password)
            user.save()

            user = authenticate(username = user.username, password = password)
        
            messages.success(request, 'Вы успешно зарегистрировались!')
            return redirect('index')
    else:
        form = UserRegistrationForm()

    context = {'form': form}
    return render(request, 'myapp/registration.html', context)


@method_decorator(unauthenticated_user(), name="dispatch")
class CustomLogin(LoginView):
    template_name = 'myapp/login.html'

    def get_success_url(self):
        print("YA ZDES NASRAL")
        return resolve_url('index')

class CustomLogout(LogoutView):
    template_name = 'myapp/logout.html'

    def get_success_url(self):
        return resolve_url('login')

def add_new_clothes(request):
    form = forms.NewClothesForm()
    result = ""

    if request.method == "POST":
        form = forms.NewClothesForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            result = "Одежда успешно добавлена!"

    return render(request, 'myapp/sellers/newclothes.html', context={'form': form, 'result': result})

