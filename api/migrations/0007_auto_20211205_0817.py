# Generated by Django 3.1.13 on 2021-12-05 04:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_auto_20211205_0815'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scores',
            name='score',
            field=models.IntegerField(blank=True, null=True, verbose_name='Баллы участника в текущем критерии'),
        ),
    ]
