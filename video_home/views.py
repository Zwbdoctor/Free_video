# from __future__ import unicode_literals
import hashlib,http.client,random,urllib,re
from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.views.decorators.csrf import csrf_exempt
from . import models
from datetime import datetime
from django.conf import settings
# Create your views here.
'''
视图函数中请在每个跳转页面前添加 try 获取会话中的登录信息/
如果获取成功执行 则 显示登录的一些视图或权限/
如果 except 则视图函数按未登录显示相应信息
'''

# #####################################数据库管理对象区域#################################
# 创建用户管理器类对象
User = models.User.u_m
# 定义一级列表管理器类对象
vc_m = models.VideoCategory.vc_m
# 定义二级列表管理器类对象
vt_m = models.VideoType.vt_m
# 定义三级列表管理器对象
vr_m = models.VideoResource.vr_m
# 定义留言板管理器对象
mb_m = models.MessageBoard.mb_m
# 定义评论管理器对象
lw_m = models.LeaveWord.lw_m
# 定义视频浏览管理器对象
vl_m = models.VideoLove.vl_m
#定义视频上传管理器对象
vu_m = models.VideoUp.vu_m
# ##################################数据库管理对象区域结束#################################


# #################################检测函数区域###################################
# 登录检测   /    获取当前登录对象
def check_login(request):
    try:
        login_user = request.session.get("login_user").username
        return login_user
    except:
        return False


# 账号验证
def aconcheck(account):
    '''
    以字母开头，字母数字下划线组成的4-14位字符串
    '''
    patten = re.compile('^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,14}$')
    match = patten.findall(account)
    if match:
        return account
    else:
        return False


# 密码验证
def pswdcheck(password):
    '''
    6-18位字母数字或下划线组合字符串
    '''
    patten = re.compile('^(\w){6,18}$')
    match = patten.findall(password)
    if match:
        return password
    else:
        return False


# 加密函数
def sock(password):

    m = hashlib.md5()
    m.update(password.encode("utf-8"))
    password = m.hexdigest()
    return password


# 邮箱验证
def email_check(email):
    '''
    本网站仅支持qq邮箱
    '''
    pattern = re.compile("^(\w){6,18}@qq\.com$")
    match = pattern.findall(email)
    if match:
        return email
    else:
        return False

# ##################################检测函数区域结束###################################


# #################################  导航栏相关函数 ##################################
# 影视中列表数据获取
def atype(id):

    moviceobjectlist = []
    movice_type_list = vr_m.getMulti_obj(VideoType_id=id)
    for movice_object in movice_type_list:
        moviceobjectlist.append(movice_object)
    return moviceobjectlist


# 类别列表获取类
def ctype(a):

    objectlist = []
    #类型中的类别对象
    type_list = vt_m.getMulti_obj(videocategory_id=a)
    #获取类别下的所有视频对象
    for type_object in type_list:
        #获取此类别下的所有类型对象列表
        a = atype(type_object.id)
        objectlist.extend(a)
    return objectlist


# 视频数据获取
def tv_list():

    video_category = vc_m.all()         # 导航栏‘影视’数据
    video_type = vt_m.all()             # 导航栏中的‘类别’数据
    allrow = []
    for i in range(5):
        row = video_type[i*7:i*7+7]
        allrow.append(row)
    return video_category,allrow

# ####################################导航栏相关函数结束###############################


# #################################### 视频主页页面 ##################################
def index(request):

    # 从数据库中获取轮播图的数据，并返回
    carousels = vr_m.all()[:7]
    video_category, allrow=tv_list()
    # 随机推荐（五部视频）
    video_random = vr_m.exclude(vr_tag='音乐').order_by('?')[:5]
    video_random_left = video_random[:1]
    video_random_right1 = video_random[1:3]
    video_random_right2 = video_random[3:]
    # 导航栏中的‘影视’数据
    video_category = vc_m.all()
    # 获取'高分电影'数据
    movies_scoreful = vr_m.filter(vr_tag__contains='电影').order_by('vr_score')[:8]
    movies_first = movies_scoreful[:1]
    movies_second = movies_scoreful[1:2]
    movies_left = movies_scoreful[2:5]
    movies_right = movies_scoreful[5:8]
    # 获取‘热血动漫’数据
    cartons = vr_m.filter(vr_tag__contains='动漫')[:6]
    cartons_row1 = cartons[0:2]
    cartons_row2 = cartons[2:4]
    cartons_row3 = cartons[4:6]
    # 获取’综艺栏目‘
    varieties = vr_m.filter(vr_tag__contains='综艺')[:5]
    variety_first = varieties[:1]
    variety_others = varieties[1:]
    # 获取MV视频
    mvs = vr_m.filter(vr_tag__contains='MV')[:3]
    # 右侧边栏新闻资讯、最新mv
    news = vr_m.filter(vr_tag__contains='资讯')[:3]
    mv_last = vr_m.filter(vr_tag__contains='MV').order_by('-vr_release_time')[:3]
    # 获取登录状态
    res = check_login(request)
    if res == False:
        return render(request, "video_home/index.html",
                      {"msg": "未登录", 'carousels': carousels, 'video_category': video_category,"allrow":allrow,'video_random_left':video_random_left,'video_random_right1':video_random_right1
                       ,'video_random_right2':video_random_right2,'movies_first':movies_first,'movies_second':movies_second
                       ,'movies_left':movies_left,'movies_right':movies_right,'cartons_row1':cartons_row1,'cartons_row2':cartons_row2
                       ,'cartons_row3':cartons_row3,'variety_first':variety_first,'variety_others':variety_others,'mvs':mvs,'news':news,'mv_last':mv_last})
    return render(request, "video_home/index.html",
                        {"msg": res,'carousels':carousels,'video_category':video_category,"allrow":allrow,'video_random_left':video_random_left,'video_random_right1':video_random_right1
                       ,'video_random_right2':video_random_right2,'movies_first':movies_first,'movies_second':movies_second
                       ,'movies_left':movies_left,'movies_right':movies_right,'cartons_row1':cartons_row1,'cartons_row2':cartons_row2
                       ,'cartons_row3':cartons_row3,'variety_first':variety_first,'variety_others':variety_others,'mvs':mvs,'news':news,'mv_last':mv_last})


# #################################### 联系我们页面 #############################
def contact(request):

    list1=vr_m.getMulti_obj()[0:3]
    list2=vr_m.getMulti_obj()[0:2]
    video_category, allrow = tv_list()
    res = check_login(request)
    if res == False:
        return render(request, "video_home/contact.html", {"msg": "未登录",'video_category':video_category,"allrow":allrow,"list1":list1,"list2":list2})
    return render(request, "video_home/contact.html", {"msg": res,'video_category':video_category,"allrow":allrow,"list1":list1,"list2":list2})


# ##################################### 视频列表详情页 ###############################
def archive(request):

    video_category, allrow = tv_list()
    try:
        kw = request.GET["video"]
        allmovice = ctype(kw)
        ac = "video"      # 传回页面表示类型，根据类型选择相应处理代码
    except:
        kw = request.GET["video_type"]
        allmovice = atype(kw)
        ac = "video_type"
    # 分页数
    long = len(allmovice)/5
    if int(long) == long:
        pages = int(long)
    else:
        pages = int(long+1)
    pages = [i for i in range(1,pages+1)]

    # 页面下方页码导航栏
    try:                                        #-#
        p_satrt = int(request.GET["np"])         # 页脚导航栏点击跳转
    except:                                      # 首页直接跳转
        p_satrt = 0                             #-#
    try:                                        #-#
        incident = request.GET["incident"]       #
        if incident == "left":                   #
            if p_satrt-7 >= 0:                   # 页脚导航栏
                p_satrt = p_satrt - 7            # 向左翻页
            else:                                #
                p_satrt = 0                     #-#
        if incident == "right":                 #-#
            if p_satrt+5 <= long-5:              #
                p_satrt = p_satrt + 5            # 页脚导航栏
            else:                                # 向右翻页
                p_satrt = long-5                 #
        spage = p_satrt+1                       #-#
    except:
        spage = 0
    p_end = p_satrt+6
    pages = pages[p_satrt:p_end]                # 页脚导航栏显示页码范围
    # 分页内容
    try:
        page = int(request.GET["page"])
    except:
        page = spage
    start = 5*page
    stop = 5*page+5
    sendmovice = allmovice[start:stop]
    num1 = random.randint(0, len(allmovice))
    num2 = random.randint(0, len(allmovice))
    all_2=allmovice[num1:num1+2]
    all_3=allmovice[num2:num2+3]
    res = check_login(request)
    if res == False:
        return render(request, "video_home/archive.html",
                  {"msg":"未登录","ac":ac,"movices":sendmovice,"music":all_2,"video":all_3,"kw":kw,"pages":pages,'video_category':video_category,"allrow":allrow,"sp":pages[0]})
    return render(request, "video_home/archive.html",
                   {"msg":res,"ac":ac,"movices":sendmovice,"music":all_2,"video":all_3,"kw":kw,"pages": pages, 'video_category': video_category, "allrow": allrow, "sp": pages[0]})


# ##################################### 播放页 ################################
def single(request):
    '''
    介绍:这里是播放页面，用于播放每个视频，以及评论
    作用:展示点击播放页面及评论页面提交
    '''
    res = check_login(request)
    video_category, allrow = tv_list()
    kw = request.GET["v_id"]
    movie = vr_m.getOne_obj(id=kw)
    m_name=movie.vr_name
    hot = lw_m.getMulti_obj(video_name=m_name).order_by("id")
    actor= movie.vr_actor
    actor1=actor.split(" ")
    tag = movie.vr_tag
    movie_tag =vr_m.getMulti_obj(vr_tag=tag).order_by("?")[0:3]
    top_mv = vr_m.getMulti_obj(vr_tag="音乐[MV]").order_by("?")[0:3]
    top_news = vr_m.getMulti_obj(vr_tag__contains="资讯").order_by("?")[0:3]

    # 添加浏览记录
    vl=vl_m.getMulti_obj(vl_video_id=int(kw))
    if len(vl) == 0 and res != False:
        user_id = User.find_user(username=res).id
        video = vl_m.create_obj(vl_video_id=int(kw), vl_user=user_id, vl_isBrower=True, vl_isLike=False)

    # 选择播放源
    url = str(movie.vr_resource)
    t_url = url[9:13]
    if t_url == "pptv":
        video_y = "http://api.1008net.com/v.php?url="+url
    else:
        video_y = "http://api.pu.tn/qq1/?url="+url
    if res == False:
        return render(request, "video_home/single.html",
                      {"msg": "未登录", "hot": hot, "movie": movie, "video_y": video_y, "actor": actor1, 'movie_tag': movie_tag, 'video_category': video_category, "allrow": allrow, "MV": top_mv, "News": top_news, "kw": kw})
    return render(request, "video_home/single.html",
                  {"msg": res, "hot": hot, "movie": movie, "video_y": video_y, "actor": actor1, 'movie_tag': movie_tag, 'video_category': video_category, "allrow": allrow,"MV": top_mv, "News": top_news, "kw": kw})


# ######################################## 登录函数 ##############################
@csrf_exempt
def login(request):
    '''
    介绍:这里是登录函数的处理以及数据提交并且还有数据检测是否合法
    作用:1.检测登录账号密码是否合法
        2.数据库检测账号密码是否在数据库存在
        3.将前台数据传递到后台处理后再将相应信息展示给前端
    '''
    # 判断是否为手机号登录
    try:
        bcheckcode = request.POST['checkcode']  # 获取浏览器端发送的验证码
        scheckcode = request.session.get("checkcode")  # 获取本地保存的验证码
        phone = request.POST['phone']
        if bcheckcode == scheckcode:
            try:
                author = User.find_user(phone=phone)
                # 登录成功，登录用户加入session 会话
                request.session["login_user"] = author
                return HttpResponse("登录成功！")
            except:
                return HttpResponse("请仔细检查手机号！你是否还未注册？")
        return HttpResponse("验证码错误！")
    except:
        # 获取传递的账号密码
        account = request.POST["laccount"]
        passwd = request.POST["lpasswd"]
        # 检测账号密码合法性
        account = aconcheck(account)
        passwd = pswdcheck(passwd)
        if account == False:
            return HttpResponse("账号不符合规范，请检查重新输入！")
        if passwd == False:
            return HttpResponse("密码不符合规范，请检查并重新输入！")

        # 对通过检测的数据进行加密准备比对
        passwd_sock = sock(passwd)
        try:
            author = User.find_user(username=account, password=passwd_sock)
            request.session["login_user"] = author  # 登录成功，登录用户加入session 会话
            return HttpResponse("登录成功！")
        except:
            return HttpResponse("该账号或密码不存在，请重新输入!")


# #################################### 检测登录状态 #################################
# 用户退出时清除session
def login_out(request):

    try:
        del request.session['login_user']
    except KeyError:
        pass
    return redirect("http://localhost:8000/video_home/")
# ########################################## 短信随机验证码  #########################

# 短信验证码初始化
# 服务地址
sms_host = "sms.yunpian.com"
voice_host = "voice.yunpian.com"
port = 443      # 端口号
version = "v2"  # 版本号
user_get_uri = "/" + version + "/user/get.json"     # 查账户信息的URI
sms_send_uri = "/" + version + "/sms/single_send.json"      # 智能匹配模板短信接口的URI
sms_tpl_send_uri = "/" + version + "/sms/tpl_single_send.json"  # 模板短信接口的URI


# 本地随机生成验证码，验证码内容和长度可自由设置
def check_code():

    chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    s = ""
    for i in range(6):
        x = random.choice(chars)
        s = s + "".join(x)
    return s


def get_user_info(apikey):

    conn = http.client.HTTPSConnection(sms_host, port=port)
    headers = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "text/plain"
    }
    conn.request('POST', user_get_uri, urllib.parse.urlencode({'apikey': apikey}))
    response = conn.getresponse()
    response_str = response.read()
    conn.close()
    return response_str


# 通用接口发短信
def send_sms(apikey, text, mobile):

    params = urllib.parse.urlencode({'apikey': apikey, 'text': text, 'mobile': mobile})
    headers = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "text/plain"
    }
    conn = http.client.HTTPSConnection(sms_host, port=port, timeout=30)
    conn.request("POST", sms_send_uri, params, headers)
    response = conn.getresponse()
    response_str = response.read()
    conn.close()
    return response_str


# 模板接口发短信
def tpl_send_sms(apikey, tpl_id, tpl_value, mobile):

    params = urllib.parse.urlencode({
        'apikey': apikey,
        'tpl_id': tpl_id,
        'tpl_value': urllib.parse.urlencode(tpl_value),
        'mobile': mobile
    })
    headers = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "text/plain"
    }
    conn = http.client.HTTPSConnection(sms_host, port=port, timeout=30)
    conn.request("POST", sms_tpl_send_uri, params, headers)
    response = conn.getresponse()
    response_str = response.read()
    conn.close()
    return response_str


# 通用接口发短信
def send_voice_sms(apikey, code, mobile):

    params = urllib.parse.urlencode({'apikey': apikey, 'code': code, 'mobile': mobile})
    headers = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "text/plain"
    }
    conn = http.client.HTTPSConnection(voice_host, port=port, timeout=30)
    conn.request("POST", sms_voice_send_uri, params, headers)
    response = conn.getresponse()
    response_str = response.read()
    conn.close()
    return response_str


# 短信验证码发送
@csrf_exempt
def check(request):
    '''
    通过调用上面的函数来实现短信验证码的功能
    '''
    print("kaishifasong")
    phone = request.POST['phone']
    apikey = "eaf68b3daa9c0df77f789480df2ea90d"  # 短信平台用户api
    mobile = phone  # 发送目标手机号
    code = check_code()     # 发送内容
    request.session["checkcode"] = code   # 加入session会话
    tpl_id = 1  # 对应的模板内容为：您的验证码是#code#【#company#】
    tpl_value = {'#code#': code, '#company#': '云片网'}
    print(tpl_send_sms(apikey, tpl_id, tpl_value, mobile))
    return HttpResponse("验证码已成功发送！")


# ############################# 接收前端界面ajax登录传递的账户数据 ##################
@csrf_exempt
def regist(request):
    '''
    介绍:这是注册的信息处理
    功能:1.检测注册账号是否在数据库中存在
        2.检测注册账号密码的合法性
        3.将密码进行加密处理
        4.将用户的注册信息存入导数据库中
        5.将返回信息返回给前端页面
    :param request:
    :return:
    '''
    # 获取传递的账号密码
    account = request.POST["raccount"]
    rphone = request.POST["rphone"]
    passwd = request.POST["rpasswd"]
    rpasswd = request.POST["rrpasswd"]
    bcheckcode = request.POST['rcheckcode']  # 获取浏览器端发送的验证码
    scheckcode = request.session.get("checkcode")  # 获取本地保存的验证码
    # 检测账号密码合法性
    account = aconcheck(account)
    passwd = pswdcheck(passwd)
    if account == False:
        return HttpResponse("账号不符合规范，请检查重新输入！")
    if passwd == False:
        return HttpResponse("密码不符合规范，请检查并重新输入！")
    if passwd != rpasswd:
        return HttpResponse("两次密码不一致，请重新检查输入！")
    if bcheckcode != scheckcode:
        return HttpResponse("验证码错误！")
    else:
        # 对通过验证的密码进行加密准备入库
        passwd_sock = sock(passwd)
        print(passwd)
        print(passwd_sock)
        try:
            author = User.find_user(username=account)
            return HttpResponse("该账号已存在！")
        except:
            try:
                author = User.find_user(phone=rphone)
                return  HttpResponse("该手机号已注册过！")
            except:
                User.create_user(username=account, password=passwd_sock, phone=rphone)
            return HttpResponse("congratulation！注册成功^-^")


# ##################################### 上传头像 ################################
def upload_header(request):
    """
    介绍:用户上传头像功能
    作用:1.用户在个人中心中上传个人头像将信息传递给后端处理
        2.检测信息并处理
        3.进行数据库的操作比对
    """
    video_category, allrow = tv_list()
    res = check_login(request)
    if res != False:
        header = request.FILES["header"]
        f_path="static/images/video_img/"+res+".jpg"
        # 图片文件存入本地
        with open(settings.BASE_DIR+"/video_home/"+f_path,"wb") as f:
            for block in header.chunks():    # 将文件分割成小块，逐块写入
                f.write(block)
        # 图片信息入库
        User.updateinfo_user(username=res, headerImg=f_path)
        user = User.find_user(username=res)
        return render(request, "video_home/personal.html",{'msg': res, 'video_category': video_category, "allrow": allrow,"user":user,"header_img":user.headerImg,"upload_header": "上传成功！"})
    return render(request, "video_home/personal.html",{'msg': '未登录', 'video_category': video_category, "allrow": allrow,"header_img":"static/images/video_img/user.jpg"})


# ##################################### 更改密码 ##################################
def update_pwd(request):
    """
    介绍:用户修改密码
    作用:1.在用户个人中心来修改个人密码
        2.检测session中保存的对象来处理修改密码
        3.更改入库
    """
    user = request.session["login_user"]
    # 获取数据
    oldpass = request.POST['oldpass']
    newpass = request.POST['newpass']
    confirm = request.POST['confirm']
    if newpass != confirm:
        return HttpResponse("两次密码不一致")
    # 获取登录用户密码
    print(user.password)
    oldpass = sock(oldpass)
    print(oldpass)
    if user.password != oldpass:
        return HttpResponse("原始密码输入错误！")
    # 更改密码
    newpass = sock(newpass)
    User.updateinfo_user(username=user.username, password=newpass)
    return HttpResponse("修改成功！")


# ################################## 评论 ###################################
@csrf_exempt
def comment(request):
    '''
    介绍:视频下面的评论
    功能:1.将视频下面的评论内容和当前登录用户比对
        2.将内容存储到数据库
        3.如果用户没有登录不允许评论

    :param request:
    :return:
    '''
    video_id=int(request.POST["id"])
    name = request.POST["name"]
    email = request.POST['email']
    message = request.POST['information']
    video=vr_m.getOne_obj(id=video_id).vr_name
    if name and email and message == '':
        return HttpResponse("内容不能为空")
    try:
        u = request.session.get("login_user")
        if u !='':
            lw_m.create_obj(comment_time=datetime.now(),name=name,email=email,content=message,user_id=u.id,video_name=video)
            return HttpResponse("评论成功")
    except:
        return HttpResponse("尚未登录，请前往登录")


# ################################################################################
def personal(request):
    # 导航栏中的‘影视’数据
    video_category, allrow = tv_list()
    res = check_login(request)
    if res != False:
        # 浏览记录
        user = User.find_user(username=res)
        remark = set(vl_m.filter(vl_user=user.id, vl_isBrower=True).order_by("?")[0:5])
        relike=[]
        if remark != "":
            for r in remark:
                # 搜索电影
                video = vr_m.getMulti_obj(id=r.vl_video_id)
                relike.append(video)
        else:
            return render(request,
                          "video_home/personal.html",
                          {
                              'msg': res,
                              'video_category': video_category,
                              "allrow": allrow,
                              "user": user,
                              "infos":"暂无播放记录",
                              "likes": like
                          })

        # 收藏电影
        likes = set(vl_m.getMulti_obj(vl_user=user.id, vl_isLike=True))
        like = []
        if likes !="":
            for li in likes:
                # 搜索电影
                video = vr_m.getMulti_obj(id=li.vl_video_id)
                like.append(video)
        else:
            return render(request, "video_home/personal.html",
                          {'msg': res, 'video_category': video_category, "allrow": allrow, "user": user,"header_img":user.headerImg,"put": relike, "infos":"你还未收藏任何视频！"})
        return render(request, "video_home/personal.html",
                      {'msg': res, 'video_category': video_category, "allrow": allrow, "user": user,"header_img":user.headerImg,"put":relike,"likes":like})
    return render(request, "video_home/personal.html",
                  {'msg': '未登录', 'video_category': video_category, "allrow": allrow,"header_img":"static/images/video_img/user.jpg"})


# #########################   个人信息展示   ##############################
def update_info(request):
    """
    #个人信息的完善
    :param request:
    :return:
    """
    res = check_login(request)
    # 获取参数
    email=request.POST["email"]
    # 邮箱验证
    email=email_check(email)
    if email==False:
        return HttpResponse("邮箱格式不正确！")
    age = request.POST["age"]
    Gender = request.POST["gender"]
    user = User.updateinfo_user(username=res,email=email,age=age,gender=Gender)
    return HttpResponse("恭喜您，资料完善成功！")


def upload_video(request):
    """
    用户上传视频
    :param request:
    :return:
    """
    video_category, allrow = tv_list()
    res = check_login(request)
    if res == False:
        return render(request, "video_home/personal.html",
                      {'msg': '未登录', 'video_category': video_category, "allrow": allrow})
    user = User.find_user(username=res)
    # 获取数据
    f_name = request.FILES.get("f_name")
    v_name = request.GET.get("v_name")
    # 创建对象保存到数据库
    if f_name == None or v_name == None:
        vu_m.create_obj(video_name=v_name, video_resource=f_name, video_owner_name=user.username)
        return render(request, "video_home/personal.html",
                      {'msg': res, 'video_category': video_category, "allrow": allrow, "user": user,
                       "upload_video": "上传成功！"})
    else:
        return render(request, "video_home/personal.html",
                      {'msg': res, 'video_category': video_category, "allrow": allrow, "user": user,
                       "upload_video": "上传失败！"})


# ###############################################################
def col_mylove(request):
    try:
        # 获取登录用户
        user = request.session["login_user"]
        # 获取参数
        name = request.GET["kw"]
        print(name)
        #创建对象保存到数据库
        video_love = vl_m.create_obj(vl_video_id=name,vl_user=user.username)
        print("OK")
        return HttpResponse("ok!")
    except:
        return HttpResponse("error")


def show_userinfo(request):
    """
    个人中心展示用户信息
    :param request:
    :return:
    """
    try:
        # 获取登录用户
        user = request.session["login_user"]
        # 创建对象查询数据库中的数据
        user = User.find_user(username=user.username)
        return render(request,"video_home/personal/",{"user":user})
    except:
        return render(request,"video_home/personal/",{})


# ############################### 收藏视频 ############################
@csrf_exempt
def show_have(request):
    # 得到前端传的数据
    video_id=request.POST["video_id"]
    print("****************************************")
    print (type(video_id))
    # 得到登录的session对象
    u=request.session.get("login_user")
    video = vl_m.getMulti_obj(vl_video_id=int(video_id),vl_isLike=True)
    print(video)
    if u!="":
        if len(video) == 0:
            vl_m.create_obj(vl_video_id=int(video_id), vl_user=u.id,vl_isBrower=False,vl_isLike=True)
        # return HttpResponse("OK")
    return HttpResponse("未登录，请先前往登录！")
