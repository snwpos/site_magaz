from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from django.contrib import messages
from django.contrib.auth.views import LoginView, LogoutView
from .forms import UserRegistrationForm
from . import models
from .models import Cloth, Basket, Favorite
from django.views.generic import View
from django.shortcuts import resolve_url
from django.http import JsonResponse
from django.views.generic import ListView
from django.http.request import HttpRequest
from django.utils.decorators import method_decorator
from .decorators import *
from rest_framework import generics
from myapp import models
from myapp import forms
from .forms import ClothFilterForm
from django.contrib.auth.decorators import user_passes_test, login_required
from .serializers import ClothSerializer
from . import filters
from django.views.decorators.csrf import csrf_exempt
from django_filters.rest_framework import DjangoFilterBackend
# class MyappAPIView(generics.ListAPIView):
#     queryset = Cloth.objects.all()
#     serializer_class = CinemaSerializer

# class MovieListView(generics.ListAPIView):
#     """Вывод списка """
#     serializer_class = ClothListSerializer
#     filter_backends = (DjangoFilterBackend,)
#     filterset_class = ClothFilter

#     def get_queryset(self):
#         movies = Cloth.objects.filter(draft=False).annotate(
#             rating_user=models.Count("ratings",
#                                      filter=models.Q(ratings__ip=get_client_ip(self.request)))
#         ).annotate(
#             middle_star=models.Sum(models.F('ratings__star')) / models.Count(models.F('ratings'))
#         )
#         return movies

# class ClothDetailView(generics.RetrieveAPIView):
#     """Вывод """
#     queryset = Cloth.objects.filter(draft=False)
#     serializer_class = ClothDetailSerializer

def index(request: HttpRequest) -> HttpRequest:
    print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")
    # search_query = request.GET.get('q', '')

    # if search_query:
    #     clothes = Cloth.objects.filter(name__icontains=search_query)
    # else:
    #     clothes = Cloth.objects.all()

    name = request.GET.get('name')   
    clothes = Cloth.objects.all()



    if name:
        clothes = Cloth.objects.filter(name__icontains=name)
    context  = {
        'form': ClothFilterForm(),
        'title': 'Заголовок - сайт',
        'clothes': clothes,
        'brands': models.Brand.objects.all(),
    }
    return render(
        request,
        template_name='myapp/index.html',
        context=context
    )

def news(request):
    print("news")
    return render(request, 'myapp/news.html', {"title": "news"})

def sellerbas(request):
    print("sellerbas")
    return render(request, 'myapp/sellers/sellerbas.html', {"title": "sellerbas"})

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

def check_admin(user):
    is_saler = False
    print("FFFFFF:", dir(user))
    if user.is_saler().name == 'Продавец':
        is_saler = True

    return is_saler

@login_required
@user_passes_test(check_admin)
def add_new_clothes(request):
    form = forms.NewClothesForm()
    result = ""

    if request.method == "POST":
        form = forms.NewClothesForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            result = "Одежда успешно добавлена!"

    return render(request, 'myapp/sellers/newclothes.html', context={'form': form, 'result': result})

def get_all_clothes(request):
    # request.session.pop("filter")
    filter_parameters = request.GET

    clothes = filters.ClothFilter(request.GET, queryset=Cloth.objects.all())

    print("FFFFFFFFF: ", clothes.qs)
    return render(request, 'myapp/sellers/sellerbas.html', {'filter': clothes, 'clothes': clothes.qs})

class ClothDetailView(View):

    def get(self, request, slug):
        cloth = Cloth.objects.get(url=slug)

        cloth_id = slug

        return render(request, 'myapp/cloth_detail.html', {"cloth": cloth, 'cloth_id': cloth_id})
                                                        #    'cart_product_form': cart_product_form})
# def ClothDetailView(request, slug):
#     cloth = get_object_or_404(Cloth, slug=slug, available=True)
#     return render(request, 'myapp/cloth_detail.html', {'cloth': cloth})

def SearchCloth(request):
    # request.session.pop("filter")
    search_query = request.GET.get('search_query')

    # clothes = models.Cloth.objects.filter(string__icontains='pattern')
    clothes = models.Cloth.objects.filter(name__icontains=search_query)
    if search_query:
            clothes = models.Cloth.objects.filter(name__icontains=search_query)
        
    else:
            return render(request, 'myapp/index.html')

# class SearchClot(generics.ListAPIView):
#     queryset = Cloth.objects.all()
#     serializer_class = ClothSerializer
#     filter_backends = [filters.SearchFilter]
#     search_fields = ['name']

def basket(request):
    items = Basket.objects.filter(user=request.user).all()
    form = forms.Basket()

    return render(request, 'myapp/cart/cart_info.html', context={'form': form, 'items': items})


@csrf_exempt
def add_to_basket(request, id):
    cloth =  Cloth.objects.get(url=id)
    print(cloth)
    basket = Basket.objects.filter(user=request.user, cloth=cloth)
    price = cloth.price
    print("fsdfsefsefsefsefsefsefsefsef", price)

    if not basket.exists():
        Basket.objects.create(user = request.user, cloth=cloth, price=price, quantity_buying=1)
    else:
        basket=basket.first()
        basket.quantity_buying += 1
        basket.save()

    return render(request, 'myapp/cart/add.html')

def basket_remove(request, id):
    basket = Basket.objects.get(id=id)
    basket.delete()
    return redirect('cart_info')

def favorite(request):
    items = Favorite.objects.all()
    form = forms.Favorite()
    return render(request, 'myapp/favorite/fav.html', context={'form': form, 'items': items})

@csrf_exempt
def add_favorite_cloth(request, id):
    
    cloth =  Cloth.objects.get(url=id)
    favorite = Favorite.objects.filter(user=request.user, cloth=cloth)
    print("DDDDD: ", favorite)

    if not favorite.exists():
        Favorite.objects.create(user = request.user, cloth=cloth)
        
    else:
        favorite = favorite.first()
        favorite.save()
        

    return render(request, 'myapp/favorite/ad.html')

def favorite_remove(request, id):
    favorite = Favorite.objects.get(id=id)
    favorite.delete()
    return redirect("favorite")
