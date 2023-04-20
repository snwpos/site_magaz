from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import CustomUser
from myapp import models

class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'phone_number', 'password1', 'password2']

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if CustomUser.objects.filter(email=email).exists():
            raise forms.ValidationError("Пользователь с таким email уже существует.")
        return email
    
    def clean_phone_number(self):
        phone_number = self.cleaned_data.get('phone_number')
        if not phone_number.isdigit():
            raise forms.ValidationError("Номер телефона может содержать только цифры.")
        elif CustomUser.objects.filter(phone_number=phone_number).exists():
            raise forms.ValidationError("Пользователь с таким номером телефона уже существует.")
        
        return phone_number
    

class NewClothesForm(forms.ModelForm):
    class Meta:
        model = models.Cloth
        fields = '__all__'
    

class ClothFilterForm(forms.Form):
    name = forms.CharField()

class Basket(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(Basket, self).__init__(*args, **kwargs)
        self.fields['cloth'].required = False
        self.fields['user'].required = False
        self.fields['quantity_buying'].required = False
        self.fields['price'].required = False

    class Meta:
        model = models.Basket
        fields = "__all__"

class Favorite(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(Favorite, self).__init__(*args, **kwargs)
        self.fields['cloth'].required = False
        self.fields['user'].required = False

    class Meta:
        model = models.Favorite
        fields = "__all__"

class Order(forms.ModelForm):
    class Meta:
        model = models.Buy
        fields = '__all__'