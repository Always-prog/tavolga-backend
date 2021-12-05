# tavolga-backend

Репозиторий для организации <<Таволга>>.<br>
Backend часть, написанная на Django Rest Framework.<br>

Для запуска проекта нужно выполнить следующие шаги:<br>
1. Откройте порты компьютера для Django. Для этого сле https://stackoverflow.com/questions/17116718/how-to-access-my-127-0-0-18000-from-android-tablet
<br>
2. Скачайте pgAdmin4, запустите базу на PostgreSQL. Ссылка на скачивание: https://www.pgadmin.org/download/<br>
3. В <code>settings.py</code> приложения Django, укажите доступы к запущенной базой данных PostgreSQL:<br>

![image](https://user-images.githubusercontent.com/66589759/144742317-0ef481da-f8ae-4828-aa54-eb6f1f0f4afa.png)

<br>
Пример:<br>

![image](https://user-images.githubusercontent.com/66589759/144742336-c58a3c9e-3e61-47eb-856e-fd6c8c8cea5d.png)


<br>
4. Выполните команды: <br>
<code>py manage.py makemigrations</code><br>
<code>py manage.py migrate</code><br>
5. Запустите сервер<br>
<code>py manage.py runserver:8000</code>








