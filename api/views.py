import json
from django.contrib.auth import authenticate, login
from django.shortcuts import render
from django.http.response import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from api.common import get_user_info_from_username, get_user_event_scores, get_users_and_events_asessor, \
    get_users_and_events_jury, get_user_photo


@csrf_exempt
def ping(request):
    return JsonResponse(status=200, data={'test_username': 'Nick'})


@csrf_exempt
def get_user_information(request):
    data = json.loads(request.body)
    username = data.get('username')
    try:
        user = User.objects.get(username=username)
    except Exception:
        return HttpResponse(status=404)
    return JsonResponse(status=200, data=get_user_info_from_username(user))


@csrf_exempt
def get_user_nominations_scores(request):
    data = json.loads(request.body)
    username = data.get('username')
    try:
        user = User.objects.get(username=username)
    except Exception:
        return HttpResponse(status=404)

    return JsonResponse(status=200, data=get_users_and_events_asessor(user))


def profile(request):
    if not request.user.username:
        html = """
        Перейдите на страницу авторизации 
        <form action="/accounts/login/" class="inline"><button>Войти в систему</button></form>"""
        return HttpResponse(html)

    if request.POST:
        print(request.POST)


    info = get_user_info_from_username(request.user)
    url = get_user_photo(request.user)
    if url:
        url = 'http://192.168.56.65:8000/' + url
    html = f"""
    <center>

    <h2>{info.get('role')}<br></h2>
    <img src="{url}" height="200" alt="Фотография пользователя не выбрана"></img><br><input type="file">
    <h3>
    Пользователь: {info.get('username')}<br>
    Имя: {info.get('first_name')}<br>
    Фамилия: {info.get('last_name')}<br>
    Обо мне: <br>
    {info.get('about_text')}<br>
    </h3>
    </center>
    """

    html += """<style>table, th, td {border: 1px solid black;}</style>"""
    if info.get('role') == 'Участник':
        event_scores = get_user_event_scores(request.user)
        for event in event_scores:
            html += '<table>'
            html += f"""
            <th>{event}</th>
            """
            for nomination in event_scores[event]:
                nomination_name = list(nomination.items())[0][0]
                nomination_score = list(nomination.items())[0][1]
                if nomination_score is None:
                    nomination_score = 'Не проставлены'
                html += f"""
                <tr><td>{nomination_name}</td><td>Баллы: {nomination_score}</td></tr>
                """
            html += '</table>'

    elif info.get('role') == 'Асессор':
        events = get_users_and_events_asessor(request.user)
        for event in events:
            html += '<table>'
            html += f'<caption>{event}</caption>'
            html += f"""
            """

            html += '<tr>'
            html += f"""<td>   </td>"""
            for user_ in events[event]['users']:
                html += f"""<td>{user_}</td>"""
            html += '</tr>'

            for index, nomination in enumerate(events[event]['nominations']):
                html += f"""<td>{nomination}</td>"""
                for user_ in events[event]['users']:
                    html += f"""<td><input maxlength=1 size=4 placeholder="{events[event]['users'][user_][index]}"></td>"""

                html += '</tr>'
            html += '</table>'

            html += '<form action="/profile" class="inline" method="POST">'
            html += '<button>Сохранить изменения</button>'
            html += '</form>'
    elif info.get('role') == 'Жюри':
        events = get_users_and_events_jury(request.user)
        for event in events:
            html += '<table>'
            html += f'<caption>{event}</caption>'
            html += f"""
            """

            html += '<tr>'
            html += f"""<td>Н\П</td>"""
            for user_ in events[event]['users']:
                html += f"""<td>{user_}</td>"""
            html += '</tr>'

            for index, nomination in enumerate(events[event]['nominations']):
                html += f"""<td>{nomination}</td>"""
                for user_ in events[event]['users']:
                    html += f"""<td>{events[event]['users'][user_][index]}</td>"""
                # html += ''

                html += '</tr>'
            html += '<tr><td>О\Ж</td>'

            for user_ in events[event]['users']:
                html += f"""
                <td>
                    <select>
                        <option value="top">Высокий</option>
                        <option value="okay" selected>Верно</option>
                        <option value="bad">Низкий</option>
                    </select>
                </td>
                """
            html += '</tr>'
            html += '</table>'




    html += """
    <center>
    <form action="/accounts/logout/" class="inline">
    <button>Выйти из системы</button>
    </form>
    </center>
    """

    return HttpResponse(html)


@csrf_exempt
def user_photo(request, username):
    try:
        user = User.objects.get(username=username)
    except Exception:
        return HttpResponse(status=404)
    print('user: ',user)
    url = 'http://192.168.56.65:8000/'+get_user_photo(user)
    return HttpResponse(status=200, content=url)

