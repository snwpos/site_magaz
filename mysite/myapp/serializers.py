
from rest_framework import serializers
from django.contrib.auth.models import User
from .models import CustomUser, Cloth
from rest_framework.authtoken.models import Token
from rest_framework.validators import UniqueTogetherValidator


class PublisherSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = 'all'

class ClothSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cloth
        fields = 'all'
# class ClothListSerializer(serializers.ModelSerializer):
#     """Список фильмов"""
#     rating_user = serializers.BooleanField()
#     middle_star = serializers.IntegerField()

#     class Meta:
#         model = Cloth
#         fields = ("id", "title", "tagline", "category", "rating_user", "middle_star")

