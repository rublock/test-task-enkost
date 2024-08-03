import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

django.setup()

from mainapp.models import Endpoints, EndpointReasons

new_endpoints = ['Сварочный аппарат №1', 'Пильный аппарат №2', 'Фрезер №3']

for new_endpoint in new_endpoints:
    new_endpoint = Endpoints.objects.create(name=new_endpoint, active=True)
    new_endpoint.save()
