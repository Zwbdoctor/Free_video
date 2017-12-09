'''
    项目：在线视频播放网站
    文件描述：管理器对象模块
'''
from django.db import models


class UserManager(models.Manager):
    # 添加用户
    def create_user(self, **kwargs):
        return self.create(**kwargs)

    # 删除用户
    def delete_user(self, **kwargs):
        return self.filter(**kwargs).update(isDelete=True)

    # 修改个人信息
    def updateinfo_user(self, username,**kwargs):
        return self.filter(username=username).update(**kwargs)

    # 查询用户
    def find_user(self, **kwargs):
        return self.get(**kwargs)


# 管理器类基类
class Base(models.Manager):
    # 创建对象
    def create_obj(self, **kwargs):
        return self.create(**kwargs)

    # 删除
    def delete_obj(self, **kwargs):
        return self.filter(**kwargs).delete()

    # 修改
    def change_obj(self, **kwargs):
        return self.filter(**kwargs).update(**kwargs)

    # 查询一条数据
    def getOne_obj(self, **kwargs):
        return self.get(**kwargs)

    # 查询多条数据
    def getMulti_obj(self, **kwargs):
        return self.filter(**kwargs)


# 一级列表管理器类
class VideoCategoryManager(Base):
    pass


# 二级列表管理器类
class VideoTypeManager(Base):
    pass


# 三级列表管理器类
class VideoResourceManager(Base):
    pass


# 留言板管理器类
class MessageBoardManager(Base):
    pass


# 视频收藏管理器
class VideoLoveManger(Base):
    pass


# 留言管理器
class ContentManger(Base):
    pass


# 视频上传类管理器
class VideoUpManager(Base):
    pass

