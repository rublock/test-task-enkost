from mainapp.models import Endpoints

endpoints_to_add = [
    Endpoints(name='Сварочный аппарат №1', active=True),
    Endpoints(name='Пильный аппарат №2', active=True),
    Endpoints(name='Фрезер №3', active=True),
]

Endpoints.objects.bulk_create(endpoints_to_add)
