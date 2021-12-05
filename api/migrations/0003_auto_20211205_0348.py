# Generated by Django 3.1.13 on 2021-12-04 23:48

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0002_foouserprofile'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='foouserprofile',
            options={'verbose_name_plural': 'Профили пользователей'},
        ),
        migrations.CreateModel(
            name='Scores',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('jury_priority', models.CharField(choices=[('ВЫСОКИЙ', 'top'), ('ВСЕ ВЕРНО', 'okay'), ('НИЗКИЙ', 'bad')], default='JANUARY', max_length=128)),
                ('score', models.IntegerField(blank=True, null=True, verbose_name='Баллы участника в текущей номинации')),
                ('asessor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.asessor', verbose_name='Оценивнший Асессор')),
                ('nomination', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.nomination', verbose_name='Номинация')),
                ('participant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Участник номинации')),
            ],
        ),
    ]