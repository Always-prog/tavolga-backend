# Generated by Django 3.1.13 on 2021-12-05 09:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_auto_20211205_0817'),
    ]

    operations = [
        migrations.AddField(
            model_name='scores',
            name='comment',
            field=models.TextField(blank=True, default='', max_length=512, null=True),
        ),
    ]
