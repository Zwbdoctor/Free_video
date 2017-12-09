from __future__ import unicode_literals

from django.db import models

from . import model_manager

from datetime import datetime

'''
    项目描述：在线视频播放网站
'''


# Create your models here.

class User(models.Model):
    '''
        创建用户类
    '''
    # id
    id = models.AutoField(primary_key=True)
    # 用户名
    username = models.CharField(max_length=50, unique=True)
    # 用户密码
    password = models.CharField(max_length=150)
    # 用户头像
    headerImg = models.ImageField(default='/static/images/video_img/user.jpg', upload_to='static/images/video_img/')
    # 用户邮箱
    email = models.EmailField()
    # 用户联系方式
    phone = models.CharField(max_length=11)
    # 判断用户是否是会员字段
    isVip = models.NullBooleanField()
    # 判断该用户是否被删除
    isDelete = models.NullBooleanField()
    # 用户年龄，默认为0
    age = models.IntegerField(default=0)
    # 用户性别
    gender = models.CharField(max_length=50)
    # 创建管理器对象
    u_m = model_manager.UserManager()
    # 注册时间
    regist_date = models.DateTimeField(default=datetime.now())


class VideoCategory(models.Model):
    '''
        创建影视类（一级列表），如电影，动漫，电视，综艺等
    '''
    id = models.AutoField(primary_key=True)
    # 影视名称
    vc_name = models.CharField(max_length=50)
    # 影视备注
    remark = models.TextField()
    # 创建管理器对象
    vc_m = model_manager.VideoCategoryManager()


class VideoType(models.Model):
    '''
        创建影视类别类，如动作，热血，惊悚，恐怖，警匪等
    '''
    id = models.AutoField(primary_key=True)
    # 类型名称
    vt_name = models.CharField(max_length=50)
    # 创建逻辑外键，与VideoCategory类建立联系，
    # 即VideoType.videocategory_id = VideoCategory.id
    videocategory_id = models.IntegerField()
    # 创建管理器对象
    vt_m = model_manager.VideoTypeManager()


class VideoResource(models.Model):
    '''
        视频资源类
    '''
    # id
    id = models.AutoField(primary_key=True)
    # 资源名称
    vr_name = models.CharField(max_length=50)
    # 资源封面
    vr_img = models.ImageField()
    # 视频资源
    vr_resource = models.FileField(upload_to='static/resource')
    # 描述
    vr_description = models.TextField()
    # 评分
    vr_score = models.CharField(max_length=10)
    # 导演
    vr_director = models.CharField(max_length=50)
    # 演员
    vr_actor = models.CharField(max_length=100)
    # 上映时间
    vr_release_time = models.CharField(max_length=50)
    # 播放量
    vr_play_view = models.CharField(max_length=10)
    # 备注
    vr_remark = models.CharField(max_length=50)
    # 地区
    vr_zone = models.CharField(max_length=20)
    # 视频标签
    vr_tag = models.CharField(max_length=20)
    # 创建逻辑外键
    VideoType_id = models.IntegerField()
    # 创建管理器对象
    vr_m = model_manager.VideoResourceManager()


class MessageBoard(models.Model):
    '''
        留言板类
    '''
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    email = models.EmailField()
    message = models.TextField()
    user = models.ForeignKey(User)
    # 创建管理器对象
    mb_m = model_manager.MessageBoardManager()


class VideoLove(models.Model):
    """
        视频浏览收藏类
    """
    # 创建属性
    id = models.AutoField(primary_key=True)
    # 资源id
    vl_video_id = models.IntegerField()
    # 用户名
    vl_user = models.CharField(max_length=50)
    # 是否被浏览
    vl_isBrower = models.NullBooleanField(default=False)
    # 是否被收藏
    vl_isLike = models.NullBooleanField(default=False)
    # 创建管理器对象
    vl_m = model_manager.VideoLoveManger()


class LeaveWord(models.Model):
    '''
        视频评论类
    '''
    # 创建属性
    id = models.AutoField(primary_key=True)
    video_name = models.CharField(max_length=50,default='未知')
    name = models.CharField(max_length=50)
    email = models.EmailField()
    content = models.TextField()
    comment_time = models.DateTimeField(default=datetime.now())
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    # 创建管理器对象
    lw_m = model_manager.ContentManger()


class VideoUp(models.Model):
    '''
        视频上传类
    '''
    id = models.AutoField(primary_key=True)
    # 上传的视频名称
    video_name = models.CharField(max_length=50)
    # 视频上传时间
    video_up_time = models.DateTimeField(default=datetime.now())
    # 上传的视频资源
    video_resource = models.FileField(upload_to='static/video/')
    # 上传视频的用户名
    video_owner_name = models.CharField(max_length=50)

    # 创建管理器对象
    vu_m = model_manager.VideoUpManager()
