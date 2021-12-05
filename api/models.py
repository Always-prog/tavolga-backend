from django.contrib.auth.models import User
from django.db import models


class FooUserProfile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    user_image = models.ImageField(blank=True, null=True)
    about_text = models.TextField(blank=True, null=True, default='')

    class Meta:
        verbose_name_plural = 'Профили пользователей'

    def __str__(self):
        return f'{self.user.username}'

class Asessor(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Пользователь')

    class Meta:
        verbose_name_plural = 'Асессоры'

    def __str__(self):
        return f'{self.user.username}'


class Jury(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Пользователь')

    class Meta:
        verbose_name_plural = 'Жюри'

    def __str__(self):
        return f'{self.user.username}'


class Criterion(models.Model):
    name = models.CharField(max_length=256, null=True, blank=True, verbose_name='Название критерия')
    options = models.TextField(
        blank=True,
        null=True,
        verbose_name='Возможные ответы и баллы за них'
    )
    max_score = models.IntegerField(verbose_name='Максимальное кол-во баллов за критерий', default=0, null=True,
                                    blank=True)

    class Meta:
        verbose_name_plural = 'Критерии'

    def __str__(self):
        return f'{self.name}'


class Nomination(models.Model):
    name = models.CharField(max_length=256, default='', verbose_name='Название номинации')
    members = models.ManyToManyField(User, verbose_name='Участники номинации')
    criterions = models.ManyToManyField(Criterion, verbose_name='Критерии')

    class Meta:
        verbose_name_plural = 'Номинации'

    def __str__(self):
        return f'{self.name}'


class Event(models.Model):
    name = models.CharField(max_length=256, default='', verbose_name='Название мероприятия')
    participants = models.ManyToManyField(User, verbose_name='Участники')
    asessors = models.ManyToManyField(Asessor, verbose_name='Асессоры')
    jury = models.ManyToManyField(Jury, verbose_name='Жюри')
    nominations = models.ManyToManyField(Nomination, verbose_name='Номинации')

    class Meta:
        verbose_name_plural = 'Мероприятия'

    def __str__(self):
        return f'{self.name}'


class Scores(models.Model):
    criterion = models.ForeignKey(Criterion, null=True, blank=True, on_delete=models.CASCADE, verbose_name='Критерий')
    asessor = models.ForeignKey(Asessor, on_delete=models.CASCADE, verbose_name='Оценивнший Асессор')
    participant = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Участник номинации')
    PRIORITY_CHOICES = (
        ('top', "ВЫСОКИЙ"),
        ('okay', "ВСЕ ВЕРНО"),
        ('bad', "НИЗКИЙ"),
    )
    jury_priority = models.CharField(max_length=128,choices=PRIORITY_CHOICES, default="okay")
    comment = models.TextField(max_length=512, default="", null=True, blank=True, verbose_name='Комментарий Асессора')
    comment_jury = models.TextField(max_length=512, default="", null=True, blank=True, verbose_name='обратная связь Жюри')
    score = models.IntegerField(null=True, blank=True, verbose_name='Баллы участника в текущем критерии')

    class Meta:
        verbose_name_plural = 'Оценки'

    def __str__(self):
        return f'{self.criterion.name}'

    def get_nomination_score(self):
        score = None
        nomination = Nomination.objects.get(criterions=self.criterion)
        for criterion in Scores.objects.filter(criterion__nomination__name=nomination, participant=self.participant):
            if criterion.score:
                if score:
                    score += criterion.score
                else:
                    score = criterion.score
        return score
