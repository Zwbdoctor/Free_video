from django.conf.urls import url,include
from django.contrib import admin
from . import views
from django.views.generic import TemplateView


app_name = "root_temp"

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^video_home/', include("video_home.urls")),
    url(r'^search/',include('haystack.urls')),
]
