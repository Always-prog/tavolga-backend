from django.urls import path, include
from .views import get_user_information, get_user_nominations_scores, user_photo
urlpatterns = [
    path('user/', get_user_information),
    path('user/participant/', get_user_nominations_scores),
    path(r'user/<str:username>/', user_photo),

]
