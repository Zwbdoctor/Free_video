from django.conf.urls import url,include
from django.contrib import admin
from . import views
from django.views.generic import TemplateView
app_name = "home_temp"

urlpatterns = [
    url(r'^check/$',views.check,name="check"),
    url(r'^archive',views.archive,name="archive"),
    url(r'^single',views.single,name="single"),
    url(r'^regist/$',views.regist,name="regist"),
    url(r'^login/$',views.login,name="login"),
    url(r'^login_out/$',views.login_out,name="login_out"),
    url(r'^contact/$',views.contact,name="contact"),
    url(r'^comment/$',views.comment,name="comment"),
	url(r"^personal/$",views.personal,name="personal"),
    url(r"^update_info/$",views.update_info,name="update_info"),
    url(r"^update_pwd/$",views.update_pwd,name="update_pwd"),
    url(r'^upload_header/$',views.upload_header,name="upload_header"),
    url(r'^upload_video/$',views.upload_video,name="upload_video"),
    url(r"^show_have/$",views.show_have,name="show_have"),
    url(r'^.*$',views.index,name="index")
]

