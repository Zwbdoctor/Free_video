# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("这是一个主页，可以放一个介绍我们公司的动态视频（例如qq安装时！）")