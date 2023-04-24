from rest_framework import serializers
from . import models


class PublisherSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.CustomUser
        fields = 'all'

class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Type
        fields = '__all__'

class ClothSerializer(serializers.ModelSerializer):
    type = TypeSerializer()
    class Meta:
        model = models.Cloth
        fields = '__all__'
        
# class ClothListSerializer(serializers.ModelSerializer):
#     """Список фильмов"""
#     rating_user = serializers.BooleanField()
#     middle_star = serializers.IntegerField()

#     class Meta:
#         model = Cloth
#         fields = ("id", "title", "tagline", "category", "rating_user", "middle_star")

