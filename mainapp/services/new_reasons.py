import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

django.setup()

from mainapp.models import Endpoints, EndpointReasons

new_endpoints = ['Сварочный аппарат №1', 'Пильный аппарат №2', 'Фрезер №3']

old_endpoints = ['Фрезерный станок', 'Сварка', 'Старый ЧПУ']

for new_endpoint, old_endpoint in zip(new_endpoints, old_endpoints):
    try:
        old_endpoint = Endpoints.objects.get(name=old_endpoint)
        old_endpoint_id = old_endpoint.id

        new_endpoint = Endpoints.objects.get(name=new_endpoint)
        new_endpoint_id = new_endpoint.id

        updated_count = EndpointReasons.objects.filter(endpoint_id=old_endpoint_id).update(endpoint_id=new_endpoint_id)

    except Endpoints.DoesNotExist:
        print(f'Не найден endpoint с именем: {old_endpoint}')