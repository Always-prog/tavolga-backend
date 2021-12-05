# tavolga-backend

Репозиторий для организации <<Таволга>>.<br>
Backend часть, написанная на Django Rest Framework.<br>

Для запуска проекта нужно выполнить следующие шаги:<br>
1. Откройте порты компьютера для Django. Для этого сле https://stackoverflow.com/questions/17116718/how-to-access-my-127-0-0-18000-from-android-tablet
<br>
2. Скачайте pgAdmin4, запустите базу на PostgreSQL. Ссылка на скачивание: https://www.pgadmin.org/download/
3. В <code>settings.py</code> приложения Django, укажите доступы к запущенной базой данных PostgreSQL:
<code language="python">
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': '<название базы данных>',
        'USER': '<пользотватель PostgreSQL>',
        'PASSWORD': '<Пороль PostgreSQL>',
        'HOST': '<хост>',
        'PORT': '<порт>',
    }
}
</code>
Пример:
  <code language="python">
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'tavolga',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

</code>
5. Выполните команды: <br>
<code>py manage.py makemigrations</code>
<code>py manage.py migrate</code>








