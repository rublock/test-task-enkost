# test-task-enkost
выполнение вот этого тестового https://disk.yandex.ru/d/3mQwBAz1We6EPQ

Написать запрос, который выводит причины простоя только активных станков:
```sql
SELECT DISTINCT er.reason_name
FROM endpoint_reasons AS er
INNER JOIN endpoints AS e ON er.endpoint_id = e.id
WHERE e.active = 'true';
```
Написать запрос, который выводит количество причин простоев для каждой неактивной точки:
```sql
SELECT e.name, COUNT(er.reason_name) AS reason_count
FROM endpoints e
LEFT JOIN endpoint_reasons er ON e.id = er.endpoint_id
WHERE e.active = 'false'
GROUP BY e.name;
```
Написать запрос, который выведет для каждого активного оборудования, количество причины простоя “ Перебои напряжения”:
```sql
SELECT e.name, COUNT(er.reason_name) AS reason_count
FROM endpoints e
LEFT JOIN endpoint_reasons er ON e.id = er.endpoint_id AND er.reason_name = 'Перебои напряжения'
GROUP BY e.name;
```
Напишите Python скрипт который будет писать в базу данных client следующую информацию (для выполнения заданий использован фреймворк Django):
1) Добавить 3 станка: “Сварочный аппарат №1”, “Пильный аппарат №2”, “Фрезер №3”, сделать их активными:
```python
from mainapp.models import Endpoints, EndpointReasons

new_endpoints = ['Сварочный аппарат №1', 'Пильный аппарат №2', 'Фрезер №3']

for new_endpoint in new_endpoints:
    new_endpoint = Endpoints.objects.create(name=new_endpoint, active=True)
    new_endpoint.save()
```
Скопировать причины простоя (reason_name, reason_hierarchy) со старых станков на новые, ниже соотнесение станков (старый станок -> новый станок):
```python
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
```
