# Generated by Django 3.1.13 on 2021-12-05 09:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_scores_comment'),
    ]

    operations = [
        migrations.AddField(
            model_name='scores',
            name='comment_jury',
            field=models.TextField(blank=True, default='', max_length=512, null=True, verbose_name='обратная связь Жюри'),
        ),
        migrations.AlterField(
            model_name='scores',
            name='comment',
            field=models.TextField(blank=True, default='', max_length=512, null=True, verbose_name='Комментарий Асессора'),
        ),
    ]
