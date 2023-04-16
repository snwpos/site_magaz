import django_filters
from myapp import models


class ClothFilter(django_filters.FilterSet):
    # price = django_filters.NumberFilter()
    price_gt = django_filters.NumberFilter(field_name='price', lookup_expr='gt')
    price__lt = django_filters.NumberFilter(field_name='price', lookup_expr='lt')

    # genre = django_filters.CharFilter(lookup_expr='genre', label='Жанр')
    
    class Meta:
        model = models.Cloth
        fields = ['brand', 'type', 'color', 'price']


class Search(django_filters.FilterSet):
    
    class Meta:
        model = models.Cloth
        fields = ['name']