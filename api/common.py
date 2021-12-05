from django.contrib.auth.models import User
from api.models import Jury, Asessor, FooUserProfile, Event, Scores


def get_user_info_from_username(user):
    user_foo = FooUserProfile.objects.get_or_create(user=user)
    if isinstance(user_foo, tuple):
        user_foo = user_foo[0]
    user_data = {
        'about_text': user_foo.about_text,
        'first_name': user.first_name,
        'last_name': user.last_name,
        'username': user.username,
    }

    if Jury.objects.filter(user=user):
        user_role = 'Жюри'
    elif Asessor.objects.filter(user=user):
        user_role = 'Асессор'
    else:
        user_role = 'Участник'

    if user_role == 'Жюри':
        ...
    user_data.update({
        'role': user_role
    })
    return user_data


def get_user_event_scores(user):
    events = Event.objects.filter(participants=user)
    data = {}
    for event in events:
        nominations_scores = []
        for nomination in event.nominations.all():
            score = Scores.objects.filter(criterion__nomination__name=nomination, participant=user).first()
            if score:
                score = score.score
            nominations_scores.append(
                {nomination.name: score}
            )
        data.update(
            {event.name: nominations_scores}
        )

    return data


def get_users_and_events_jury(user):
    events = Event.objects.filter(jury=Jury.objects.get(user=user))
    data = {}
    for event in events:
        scores_map = {
            'nominations': [],
            'users': {}
        }

        for nomination in event.nominations.all():
            scores_map['nominations'].append(nomination.name)

        for user_ in event.participants.all():
            scores_map['users'].update({user_.username: ['-' for n in scores_map['nominations']]})
            for index, nomination in enumerate(scores_map['nominations']):
                for index_s, score in enumerate(Scores.objects.filter(criterion__nomination__name=nomination, participant=user_)):
                    if score:
                        score = score.score
                        scores_map['users'][user_.username][index_s] = score
                    else:
                        scores_map['users'][user_.username][index_s] = '-'

        data.update(
            {event.name: scores_map}
        )

    return data

def get_users_and_events_asessor(user):
    events = Event.objects.filter(asessors=Asessor.objects.get(user=user))
    data = {}
    for event in events:
        scores_map = {
            'nominations': [],
            'users': {}
        }


        for nomination in event.nominations.all():
            scores_map['nominations'].append(nomination.name)


        for user_ in event.participants.all():
            scores_map['users'].update({user_.username: []})
            for nomination in scores_map['nominations']:
                score = Scores.objects.filter(criterion__nomination__name=nomination, participant=user_).first()
                if score:
                    score = score.get_nomination_score()
                    scores_map['users'][user_.username].append(score)
                else:
                    scores_map['users'][user_.username].append('-')

        data.update(
            {event.name: scores_map}
        )
    print(data)
    return data

def get_user_photo(user):
    user_foo = FooUserProfile.objects.get_or_create(user=user)
    if isinstance(user_foo, tuple):
        user_foo = user_foo[0]
    try:
        return user_foo.user_image.url
    except Exception:
        return ''