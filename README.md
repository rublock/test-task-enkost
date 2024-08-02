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
Напишите Python скрипт который будет писать в базу данных client следующую информацию:
1) Добавить 3 станка: “Сварочный аппарат №1”, “Пильный аппарат №2”, “Фрезер №3”, сделать их активными:
```python
from mainapp.models import Endpoints

endpoints_to_add = [
    Endpoints(name='Сварочный аппарат №1', active=True),
    Endpoints(name='Пильный аппарат №2', active=True),
    Endpoints(name='Фрезер №3', active=True),
]

Endpoints.objects.bulk_create(endpoints_to_add)
```
