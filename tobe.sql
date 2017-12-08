/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : tobe

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2017-11-22 14:36:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add leave word', '7', 'add_leaveword');
INSERT INTO `auth_permission` VALUES ('20', 'Can change leave word', '7', 'change_leaveword');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete leave word', '7', 'delete_leaveword');
INSERT INTO `auth_permission` VALUES ('22', 'Can add message board', '8', 'add_messageboard');
INSERT INTO `auth_permission` VALUES ('23', 'Can change message board', '8', 'change_messageboard');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete message board', '8', 'delete_messageboard');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '9', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '9', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '9', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can add video category', '10', 'add_videocategory');
INSERT INTO `auth_permission` VALUES ('29', 'Can change video category', '10', 'change_videocategory');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete video category', '10', 'delete_videocategory');
INSERT INTO `auth_permission` VALUES ('31', 'Can add video love', '11', 'add_videolove');
INSERT INTO `auth_permission` VALUES ('32', 'Can change video love', '11', 'change_videolove');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete video love', '11', 'delete_videolove');
INSERT INTO `auth_permission` VALUES ('34', 'Can add video resource', '12', 'add_videoresource');
INSERT INTO `auth_permission` VALUES ('35', 'Can change video resource', '12', 'change_videoresource');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete video resource', '12', 'delete_videoresource');
INSERT INTO `auth_permission` VALUES ('37', 'Can add video type', '13', 'add_videotype');
INSERT INTO `auth_permission` VALUES ('38', 'Can change video type', '13', 'change_videotype');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete video type', '13', 'delete_videotype');
INSERT INTO `auth_permission` VALUES ('40', 'Can add video up', '14', 'add_videoup');
INSERT INTO `auth_permission` VALUES ('41', 'Can change video up', '14', 'change_videoup');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete video up', '14', 'delete_videoup');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'video_home', 'leaveword');
INSERT INTO `django_content_type` VALUES ('8', 'video_home', 'messageboard');
INSERT INTO `django_content_type` VALUES ('9', 'video_home', 'user');
INSERT INTO `django_content_type` VALUES ('10', 'video_home', 'videocategory');
INSERT INTO `django_content_type` VALUES ('11', 'video_home', 'videolove');
INSERT INTO `django_content_type` VALUES ('12', 'video_home', 'videoresource');
INSERT INTO `django_content_type` VALUES ('13', 'video_home', 'videotype');
INSERT INTO `django_content_type` VALUES ('14', 'video_home', 'videoup');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-10-31 11:46:09');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-10-31 11:46:13');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-10-31 11:46:14');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-10-31 11:46:14');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-10-31 11:46:15');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-10-31 11:46:15');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-10-31 11:46:15');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-10-31 11:46:15');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-10-31 11:46:16');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-10-31 11:46:16');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-10-31 11:46:16');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-10-31 11:46:16');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2017-10-31 11:46:16');
INSERT INTO `django_migrations` VALUES ('14', 'video_home', '0001_initial', '2017-10-31 11:46:18');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('f8yx0ap3jjjfbml0l9tl928gxqfkl76d', 'MmEyMDY2ZjUyMGU2NzVlNDRlYzJhMjM4MGU3MGZmZGE0YTU4OTk4NDqABJUZAAAAAAAAAH2UjAljaGVja2NvZGWUjAYzMjM2MzaUcy4=', '2017-11-14 12:01:54');
INSERT INTO `django_session` VALUES ('k39lb7hskg5e1hyol56x2tod2ruxtex4', 'ZDE3NWIxODY5YjdkNWQ5OWJkNjFkZThjNThjZDZhM2I3OTNlYjNlMDqABJXaAQAAAAAAAH2UKIwKbG9naW5fdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAp2aWRlb19ob21llIwEVXNlcpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwCZGKUjAdkZWZhdWx0lIwGYWRkaW5nlIl1YowCaWSUSwGMCHVzZXJuYW1llIwJbGl3YW5wZW5nlIwIcGFzc3dvcmSUjCBmM2ZiNzc2YTBkNDUwZTJiZmJjMTY4ZWNkNTg2Y2I2MpSMCWhlYWRlckltZ5SMJXN0YXRpYy9pbWFnZXMvdmlkZW9faW1nL2xpd2FucGVuZy5qcGeUjAVlbWFpbJSMAJSMBXBob25llIwLMTc2MzgzMzA3NDGUjAVpc1ZpcJROjAhpc0RlbGV0ZZROjANhZ2WUSwCMBmdlbmRlcpRoG4wLcmVnaXN0X2RhdGWUjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH4QofEzQBAAAAlIwEcHl0epSMBF9VVEOUk5QpUpSGlFKUjA9fZGphbmdvX3ZlcnNpb26UjAYxLjExLjaUdWKMCWNoZWNrY29kZZSMBjc1NzUzNpR1Lg==', '2017-11-20 07:25:45');
INSERT INTO `django_session` VALUES ('mtr2isrgrwhtas7s7oaj615rqz8si4fh', 'NDIxYTJkZjAzYTQ4NWE0OTJiZDMwYTViZGVlMTlmMzA4MDliNjE2MDqABJXEAQAAAAAAAH2UjApsb2dpbl91c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMCnZpZGVvX2hvbWWUjARVc2VylIaUhZRSlH2UKIwGX3N0YXRllGgCjApNb2RlbFN0YXRllJOUKYGUfZQojAJkYpSMB2RlZmF1bHSUjAZhZGRpbmeUiXVijAJpZJRLAYwIdXNlcm5hbWWUjAlsaXdhbnBlbmeUjAhwYXNzd29yZJSMIGYzZmI3NzZhMGQ0NTBlMmJmYmMxNjhlY2Q1ODZjYjYylIwJaGVhZGVySW1nlIwlc3RhdGljL2ltYWdlcy92aWRlb19pbWcvbGl3YW5wZW5nLmpwZ5SMBWVtYWlslIwAlIwFcGhvbmWUjAsxNzYzODMzMDc0MZSMBWlzVmlwlE6MCGlzRGVsZXRllE6MA2FnZZRLAIwGZ2VuZGVylGgbjAtyZWdpc3RfZGF0ZZSMCGRhdGV0aW1llIwIZGF0ZXRpbWWUk5RDCgfhCh8TNAEAAACUjARweXR6lIwEX1VUQ5STlClSlIaUUpSMD19kamFuZ29fdmVyc2lvbpSMBjEuMTEuNpR1YnMu', '2017-11-17 09:10:22');
INSERT INTO `django_session` VALUES ('s8titvfkpbbv6kvnst9fg59lt2va1jk3', 'NDIxYTJkZjAzYTQ4NWE0OTJiZDMwYTViZGVlMTlmMzA4MDliNjE2MDqABJXEAQAAAAAAAH2UjApsb2dpbl91c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMCnZpZGVvX2hvbWWUjARVc2VylIaUhZRSlH2UKIwGX3N0YXRllGgCjApNb2RlbFN0YXRllJOUKYGUfZQojAJkYpSMB2RlZmF1bHSUjAZhZGRpbmeUiXVijAJpZJRLAYwIdXNlcm5hbWWUjAlsaXdhbnBlbmeUjAhwYXNzd29yZJSMIGYzZmI3NzZhMGQ0NTBlMmJmYmMxNjhlY2Q1ODZjYjYylIwJaGVhZGVySW1nlIwlc3RhdGljL2ltYWdlcy92aWRlb19pbWcvbGl3YW5wZW5nLmpwZ5SMBWVtYWlslIwAlIwFcGhvbmWUjAsxNzYzODMzMDc0MZSMBWlzVmlwlE6MCGlzRGVsZXRllE6MA2FnZZRLAIwGZ2VuZGVylGgbjAtyZWdpc3RfZGF0ZZSMCGRhdGV0aW1llIwIZGF0ZXRpbWWUk5RDCgfhCh8TNAEAAACUjARweXR6lIwEX1VUQ5STlClSlIaUUpSMD19kamFuZ29fdmVyc2lvbpSMBjEuMTEuNpR1YnMu', '2017-11-17 09:16:43');

-- ----------------------------
-- Table structure for video_home_leaveword
-- ----------------------------
DROP TABLE IF EXISTS `video_home_leaveword`;
CREATE TABLE `video_home_leaveword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `comment_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_home_leaveword_user_id_115d683e_fk_video_home_user_id` (`user_id`),
  CONSTRAINT `video_home_leaveword_user_id_115d683e_fk_video_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `video_home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_leaveword
-- ----------------------------
INSERT INTO `video_home_leaveword` VALUES ('1', '敌营芳翠', '电影', '12346679@qq.com', '这部电影很好看', '2017-11-06 15:33:29', '1');

-- ----------------------------
-- Table structure for video_home_messageboard
-- ----------------------------
DROP TABLE IF EXISTS `video_home_messageboard`;
CREATE TABLE `video_home_messageboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_home_messageboard_user_id_1d702c56_fk_video_home_user_id` (`user_id`),
  CONSTRAINT `video_home_messageboard_user_id_1d702c56_fk_video_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `video_home_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_messageboard
-- ----------------------------

-- ----------------------------
-- Table structure for video_home_user
-- ----------------------------
DROP TABLE IF EXISTS `video_home_user`;
CREATE TABLE `video_home_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `headerImg` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `isVip` tinyint(1) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `regist_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_user
-- ----------------------------
INSERT INTO `video_home_user` VALUES ('1', 'liwanpeng', 'f3fb776a0d450e2bfbc168ecd586cb62', 'static/images/video_img/liwanpeng.jpg', '1325612@qq.com', '17638330741', null, null, '18', '男', '2017-10-31 19:52:01');

-- ----------------------------
-- Table structure for video_home_videocategory
-- ----------------------------
DROP TABLE IF EXISTS `video_home_videocategory`;
CREATE TABLE `video_home_videocategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vc_name` varchar(50) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_videocategory
-- ----------------------------
INSERT INTO `video_home_videocategory` VALUES ('1', '电影', '无');
INSERT INTO `video_home_videocategory` VALUES ('2', 'MV', '无');
INSERT INTO `video_home_videocategory` VALUES ('3', '动漫', '无');
INSERT INTO `video_home_videocategory` VALUES ('4', '综艺', '无');
INSERT INTO `video_home_videocategory` VALUES ('5', '资讯', '无');

-- ----------------------------
-- Table structure for video_home_videolove
-- ----------------------------
DROP TABLE IF EXISTS `video_home_videolove`;
CREATE TABLE `video_home_videolove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vl_video_id` int(11) NOT NULL,
  `vl_user` varchar(50) NOT NULL,
  `vl_isBrower` tinyint(1) DEFAULT NULL,
  `vl_isLike` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_videolove
-- ----------------------------
INSERT INTO `video_home_videolove` VALUES ('1', '198', '1', '1', '0');
INSERT INTO `video_home_videolove` VALUES ('2', '457', '1', '1', '0');
INSERT INTO `video_home_videolove` VALUES ('3', '194', '1', '1', '0');
INSERT INTO `video_home_videolove` VALUES ('4', '231', '1', '1', '0');
INSERT INTO `video_home_videolove` VALUES ('5', '326', '1', '1', '0');
INSERT INTO `video_home_videolove` VALUES ('6', '326', '1', '0', '1');

-- ----------------------------
-- Table structure for video_home_videoresource
-- ----------------------------
DROP TABLE IF EXISTS `video_home_videoresource`;
CREATE TABLE `video_home_videoresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_name` varchar(50) NOT NULL,
  `vr_img` varchar(100) NOT NULL,
  `vr_resource` varchar(100) NOT NULL,
  `vr_description` longtext NOT NULL,
  `vr_score` varchar(10) NOT NULL,
  `vr_director` varchar(50) NOT NULL,
  `vr_actor` varchar(100) NOT NULL,
  `vr_release_time` varchar(50) NOT NULL,
  `vr_play_view` varchar(10) NOT NULL,
  `vr_remark` varchar(50) NOT NULL,
  `vr_zone` varchar(20) NOT NULL,
  `vr_tag` varchar(20) NOT NULL,
  `VideoType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_videoresource
-- ----------------------------
INSERT INTO `video_home_videoresource` VALUES ('194', '白蝴蝶', '/static/images/video_img/imgs194.jpg', 'http://v.pptv.com/show/N0wkowtx4RibCAGg.html?rcc_src=L1', '                     　　影片讲述了分别做着导演梦和演员梦的两个年轻人之间的爱情故事。                            ', '6.9', '金三历', '邰仁浩 崔妙建 金三历', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('195', '夜晚的游戏', '/static/images/video_img/imgs195.jpg', 'http://v.pptv.com/show/VaqKCXHXR4XoZs4.html?rcc_src=L1', '                     　　年幼时因为爸爸的暴行而导致双耳失聪的圣彩，现在在帮别人整理乐谱打零工。一次在旁观大提琴合奏彩排后回家的路上，...                            ', '7.7', '崔为安', '车恩宰 陈伍安 河熙京', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('196', '归乡', '/static/images/video_img/imgs196.jpg', 'http://v.pptv.com/show/FWpKyTGXB0WoJo4.html?rcc_src=L1', '                     被领养到澳洲的Lucas为了寻找当年抛弃自己的妈妈而重新回到韩国。虽然找到了自己曾经的痕迹，但是却无法找到父母。...                            ', '6.9', '安善京', '朴智娥 朴相旭 李花诗', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('197', '田禹治', '/static/images/video_img/imgs197.jpg', 'http://v.pptv.com/show/gicjYV78lldM2tBw.html?rcc_src=L1', '                     姜东元扮演主角田禹治来自于朝鲜文学作品《田禹治传》，是位有着真人原型的文人和道士，运用高超道术劫富济贫、为民除害...                            ', '8.7', '崔东勋', '姜东元 林秀晶 金允石', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('198', '铁道飞虎', '/static/images/video_img/imgs198.jpg', 'http://v.pptv.com/show/x4XubNQ6quhLyTE.html?rcc_src=L1', '                     　在抗战初期的鲁南地区，中国共产党组织一批煤矿工人八路军游击队汇合，坚持鲁南山区的抗日战争。为了配合山区八路军的...                            ', '8.4', '丁晟', '成龙 徐帆 黄子韬', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('199', '旅馆大堂对面', '/static/images/video_img/imgs199.jpg', 'http://v.pptv.com/show/QgDibfORKuvhb2UE.html?rcc_src=L1', '                     导演亚历克斯·梅金根据自己2005年的同名黑色惊悚短片改编，故事讲述特里得知他的未婚妻琼与一个男人在旅馆开房后，...                            ', '7.4', '亚历克斯·梅金', '迈克·沃格尔 布莱特妮·墨菲 Daniel Pino', '2009', '未知', '无', '未知', '悬疑[电影]', '7');
INSERT INTO `video_home_videoresource` VALUES ('200', '真爱效应', '/static/images/video_img/imgs200.jpg', 'http://v.pptv.com/show/p6ibHBGzSQoDjYck.html?rcc_src=L1', '                     　　妹妹被谋杀的噩耗让华特大受打击，终日沉浸在愤怒和悲哀中的他决定复仇。在小镇上，华特遇见了名为琳达的美丽女人，...                            ', '7.0', 'David Hollander', '米歇尔·菲佛 阿什顿·库彻 凯西·贝茨', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('201', '墨菲定律', '/static/images/video_img/imgs201.jpg', 'http://v.pptv.com/show/IzIcmwNp2Rd6ibGA.html?rcc_src=L1', '                     　　讲述了年轻人依莱亚斯，因为盗窃罪得到了为医院做两年紧急护士的判罚期间发生的故事。 原来盗窃犯奥尔特加兄弟偷走...                            ', '7.5', 'Christophe Campos', '皮奥·马麦 多米尼克·皮诺 芳妮·瓦莱特', '2009', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('202', '初吻', '/static/images/video_img/imgs202.jpg', 'http://v.pptv.com/show/8Zn6eOBGtvRX1T0.html?rcc_src=L1', '                     一名25岁的女人和一名高中生在公交上意外发生了亲吻，然后这位男孩迷恋这位比他大的女人。                            ', '8.4', 'Kirati Nakintan Nakintanon', 'Kaneungnich Jaksamithanon Pichasini Tanwiboon Songsitt Rungnoppakhunsri', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('203', '最后一站', '/static/images/video_img/imgs203.jpg', 'http://v.pptv.com/show/ibU01sxuB8SibSEHg.html?rcc_src=L1', '                     年轻的瓦伦汀（詹姆斯·麦卡沃伊 James McAvoy 饰）应聘成为大文豪列夫·托尔斯泰（克里斯托弗·普卢默...                            ', '7.5', '迈克尔·霍夫曼', '克里斯托弗·普卢默 海伦·米伦 詹姆斯·麦卡沃伊', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('204', '莱姆酒日记', '/static/images/video_img/imgs204.jpg', 'http://v.pptv.com/show/IN80shqA8C6RD3c.html?rcc_src=L1', '                     影片根据保罗·开普所写的在波多黎各做记者时期的自传小说改编而成。书籍写于1959年，但是因为种种问题，直到199...                            ', '8.5', '布鲁斯·罗宾逊', '约翰尼·德普 艾梅柏·希尔德 艾伦·艾克哈特', '2009', '未知', '无', '未知', '冒险[电影]', '2');
INSERT INTO `video_home_videoresource` VALUES ('205', '罗曼蒂克消亡史', 'http://img24.pplive.cn/2012/06/01/17494678399_230X306.jpg', 'http://v.pptv.com/show/FtUibvCSKibjiabGYE.html?rcc_src=L1', '                     　　该片讲述了1937年大动荡前夕，上海滩风云显赫的陆先生正面遭遇侵华日军施压，被卷入一场暗杀阴谋，当身边朋友一...                            ', '7.7', '程耳', '葛优 章子怡 浅野忠信', '2009', '未知', '无', '未知', '悬疑[电影]', '7');
INSERT INTO `video_home_videoresource` VALUES ('206', '神枪手', 'http://img24.pplive.cn/2011/11/10/16474291573_230X306.jpg', 'http://v.pptv.com/show/A0oppg505CKFA2s.html?rcc_src=L1', '                     邹辉是闻名世界的“神枪手”，因痴迷于射击事业，对家人照顾甚少，导致爱妻红杏出墙，因此悔恨不已，并发誓自己和后代不...                            ', '7.0', '黄家辉', '洪天明 梁琤 钟丽淇', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('207', '母亲', 'http://img24.pplive.cn/2011/03/23/15420369236_230X306.jpg', 'http://v.pptv.com/show/AoHUUrogkM4xrxc.html?rcc_src=L1', '                     守寡多年的母亲 ，一直与独子同住，儿子是个温顺不多话的人。一天，城里发生了严重的谋杀案。可怜的儿子不知道为何成了...                            ', '8.6', '奉俊昊', '元彬 秦久 尹宰文', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('208', '王牌逗王牌粤语版', 'http://img24.pplive.cn/2009/08/26/17015633596_230X306.jpg', 'http://v.pptv.com/show/yIbradE3pibVIxia4.html?rcc_src=L1', '                     电影讲述的是囧探宝爷（刘德华 饰）与侠盗洛家豪（黄晓明 饰）强强联手，在A梦（王祖蓝 饰）、洛家欣（欧阳娜娜 饰...                            ', '7.7', '王晶', '刘德华 黄晓明 沈腾', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('209', '摆渡人国语版', 'http://img24.pplive.cn/2009/08/26/17112929763_230X306.jpg', 'http://v.pptv.com/show/Ds0mpAxy4iaCDAWk.html?rcc_src=L1', '                     该片大致是讲述一个单恋的爱情故事，女主角阿玉是一个独立又充满侠气的都市痴情女孩，她对已婚画家马力情有独钟，每次阿...                            ', '7.8', '张嘉佳', '梁朝伟 鹿晗 金城武', '2009', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('210', '无姓之人', 'http://img24.pplive.cn/2017/03/23/16060575581_230X306.jpg', 'http://v.pptv.com/show/72Yppw915SOGBGw.html?rcc_src=L1', '                     尼莫•诺巴蒂（Nemo Nobody）是一个非常普通的男人。他和千千万万个男人一样，生活在一个规模不大的城市里，...                            ', '8.2', '雅克·范·多梅尔', '杰瑞德·莱托 萨拉·波莉 黛安·克鲁格', '2009', '未知', '无', '未知', '魔幻[电影]', '14');
INSERT INTO `video_home_videoresource` VALUES ('211', '回乡之旅', 'http://img24.pplive.cn/2011/04/19/16263141987_230X306.jpg', 'http://v.pptv.com/show/xM9q6FC2JmTHRa0.html?rcc_src=L1', '                     麦克带着新女友伊丽莎白，在数年后重返故里，受到了乡亲们的热烈欢迎。然而麦克高中时的女友谢尔比依旧对其余情未了，她...                            ', '7.2', '摩根·J·弗雷曼', '米莎·巴顿 马特·朗 杰西卡·斯特普', '2009', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('212', '反贪风暴2国语版', 'http://img24.pplive.cn/2009/12/09/14121550634_230X306.jpg', 'http://v.pptv.com/show/FdIicvSWLibzmcGoI.html?rcc_src=L1', '                     古天乐所饰演的帅气廉署执行官将和张智霖所饰演的警署高层展开一场激烈的较量，亦敌亦友的关系从起初的互相不配合到最后...                            ', '8.4', '林德禄', '古天乐 周渝民 张智霖', '2009', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('213', '三角铃', 'http://img24.pplive.cn/2011/04/07/18012545650_230X306.jpg', 'http://v.pptv.com/show/nic7iaYckvn91AviaY.html?rcc_src=L1', '                     财阀家的遗孀，盯上她的骗子，以及跟踪骗子的不明身份的女人！  美丽的财阀遗孀韩智英(李秀景 饰)在滑雪场邂逅美术...                            ', '7.5', '池永洙', '安在旭 姜惠贞 李秀景', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('214', '小石头的梦', 'http://img24.pplive.cn/2014/12/04/17333588820_230X306.jpg', 'http://v.pptv.com/show/kQzwb9c9retOzDQ.html?rcc_src=L1', '                     故事讲述一个三流的喜剧演员和一个失去父母的11岁小孩之间寻梦的故事。三流喜剧演员成贤靠在一个破旧的夜总会跑龙套逗...                            ', '6.9', '未知', '车仁表 金孝珍 2009', '2009', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('215', '霍元甲', 'http://img24.pplive.cn/2011/12/22/16265250072_230X306.jpg', 'http://v.pptv.com/show/Ef1W1DyiaElCzMZk.html?rcc_src=L1', '                     霍元甲自小醉心武术，但其父不想孩子成为一介武夫，遂不让他习武。元甲与玩伴农劲荪偷偷抄录霍家拳谱天天苦练，终以稚嫩...                            ', '9.0', '于仁泰', '李连杰 中村狮童 孙俪', '2009', '未知', '无', '未知', '蓝光[电影]', '12');
INSERT INTO `video_home_videoresource` VALUES ('216', '封神传奇', 'http://img24.pplive.cn/2012/05/04/16391847280_230X306.jpg', 'http://v.pptv.com/show/F9Q9uyOJibTeaGIA.html?rcc_src=L1', '                     三千年前，商末，昏君纣王（梁家辉 饰）受妖妃妲己（范冰冰 饰）蛊惑，联手申公豹（古天乐 饰），试图召唤黑暗力量降...                            ', '6.9', '许安', '李连杰 梁家辉 范冰冰', '2009', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('217', '情人眼里出西施', 'http://img24.pplive.cn/2011/04/18/18072346995_230X306.jpg', 'http://v.pptv.com/show/7qOhH4ftXZvibfOQ.html?rcc_src=L1', '                     帅气的外表加上出众的能力，国际建筑师江泰奉，有一天他经历了一起交通事故，而他的后遗症是“暂时性视觉障碍症”，也就...                            ', '8.2', '李长秀', '姜志焕 李智雅 黄静音', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('218', '乐园', 'http://img24.pplive.cn/2016/12/30/10494998955_230X306.jpg', 'http://v.pptv.com/show/FicvoZ881peNGxCw.html?rcc_src=L1', '                     《乐园》讲述了结束了十年戒毒所生活的女子，来到了被称为“女性的乐园”的小岛上，打破了岛上原有的平静生活，自己也找...                            ', '7.8', '李长秀', '金荷娜 池珍熙 金裕贞', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('219', '13家庭', 'http://img24.pplive.cn/2016/10/25/19021220171_230X306.jpg', 'http://v.pptv.com/show/D4tY1ziblFVO2NJw.html?rcc_src=L1', '                     　　科伦拜校园事件是1999年4月20日在美国科罗拉多州杰佛逊郡科伦拜中学发生的校园枪击事件。两名青少年学生—埃...                            ', '8.0', '尼克·科宾，马克·大卫', '尼克.科宾，马克.柯切，斯蒂夫.卢卡尼 尼克·科宾，马克·大卫 2009', '2009', '未知', '无', '未知', '纪实[资讯]', '32');
INSERT INTO `video_home_videoresource` VALUES ('220', '启蒙映画', 'http://img24.pplive.cn/2016/11/08/14322389063_230X306.jpg', 'http://v.pptv.com/show/gYBe3UWrG1m8OqI.html?rcc_src=L1', '                                                 ', '7.5', '朴东勋', '郑胜吉 吴友贞 朴东勋', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('221', '我的特工爷爷', 'http://img24.pplive.cn/2009/08/26/17311744915_230X306.jpg', 'http://v.pptv.com/show/CPZb2UGnF1W4Np4.html?rcc_src=L1', '                     电影讲述了退休军官老丁(洪金宝饰)因“健忘症”弄丢孙女，内疚回到老家。邻居小女孩春花(陈沛妍 饰)成为他的慰藉。...                            ', '8.7', '洪金宝', '洪金宝 刘德华 朱雨辰', '2009', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('222', '恶棍特工', 'http://img24.pplive.cn/2012/10/18/14534351665_230X306.jpg', 'http://v.pptv.com/show/AVsibvSWLibzmcGoI.html?rcc_src=L1', '                     故事发生在二战期间，一群犯了罪的美国士兵原本将要被处以死刑，但是非常时期采取非常政策，他们被允许戴罪立功——深入...                            ', '8.3', '昆汀·塔伦蒂诺', '布拉德·皮特 伊莱·罗斯 黛安·克鲁格', '2009', '未知', '无', '未知', '战争[电影]', '9');
INSERT INTO `video_home_videoresource` VALUES ('223', '倩女幽魂', 'http://img24.pplive.cn/2012/01/08/11441756015_230X306.jpg', 'http://v.pptv.com/show/Gd02tByC8jCTEXk.html?rcc_src=L1', '                     书生宁采臣赴郭北县收帐，逢大雨，躲入传说纷纭的兰若寺投宿，但为寺内道士燕赤霞所拒，宁偷偷潜入寺中，入夜，宁被一阵...                            ', '9.1', '程小东', '张国荣 王祖贤 午马', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('224', '女子跆拳群英会', 'http://img24.pplive.cn/2016/08/30/14354173592_230X306.jpg', 'http://v.pptv.com/show/nqEibvCSKibjiabGYE.html?rcc_src=L1', '                     中国青年范宗杰对武术有狂热的爱好，为了达到武术的更高境界，来到韩国找拳界老前辈申荣正比武。在一次抓小偷事件中，因...                            ', '7.5', '吴宇森', '黄家达 田俊 金昌淑', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('225', '叶问3', 'http://img24.pplive.cn/2011/12/21/14294974291_230X306.jpg', 'http://v.pptv.com/show/DconpQ1z4yGEAmo.html?rcc_src=L1', '                     　　1959年，叶问 （甄子丹饰）与张永成 （熊黛林饰）将大儿子叶准送回广东，小儿子叶正继续在香港读书。在与马鲸...                            ', '8.6', '叶伟信', '甄子丹 熊黛林 张晋', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('226', '烈火战车2极速传说', 'http://img24.pplive.cn/2009/08/26/17335816588_230X306.jpg', 'http://v.pptv.com/show/Issopg505CKFA2s.html?rcc_src=L1', '                     Sky，一个生于富裕之家的年青人，母亲阮文凤乃商界有名的女强人，继父朱大森亦在中港财经界有着一定地位，但恃才傲物...                            ', '8.8', '刘伟强', '郑伊健 张柏芝 林熙蕾', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('227', '驱魔警察', 'http://img24.pplive.cn/2008/09/17/09592329481_230X306.jpg', 'http://v.pptv.com/show/RGpz8VmicL23QTrY.html?rcc_src=L1', '                     饰演警察的是林俊贤与苗侨伟，两人在缉毒过程中误杀一名神秘女子，后来发现此女子已死去多时。重案组警司午马发现事态严...                            ', '9.0', '董玮', '林正英 Frankie Chin 周比利', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('228', '大内密探零零发', 'http://img24.pplive.cn/2009/08/26/16494521887_230X306.jpg', 'http://v.pptv.com/show/FNNAviaaMicDqdG4M.html?rcc_src=L1', '                     本片男主角的名字套用英国王牌特务007而取名为零零发，是保护皇上的保龙一族：恭、喜、发、财四大成员之一。他不懂武...                            ', '9.0', '周星驰', '刘嘉玲 李若彤 周星驰', '2009', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('229', '婚礼之后', 'http://img24.pplive.cn/2014/12/04/17312650175_230X306.jpg', 'http://v.pptv.com/show/nXTRTrYcjMotqxM.html?rcc_src=L1', '                     一辆高级大轿车在郊外某教堂外停稳。车上是七名大学时代某音乐俱乐部的成员，他们中的志宏和宥利即将在这里举行他们的结...                            ', '7.4', '金允哲', '申成宇 艺智苑 裴秀彬', '2009', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('230', '十亿韩元', 'http://img24.pplive.cn/2016/04/06/11214311138_230X306.jpg', 'http://v.pptv.com/show/cYVV0jqgEE6xL5c.html?rcc_src=L1', '                     关于8位年轻男女参加一个奖金为十亿韩元（百万美金）的生存真人秀节目的惊悚影片。D 宣– DAY：LIVE IN...                            ', '8.0', '赵民浩', '申敏儿 高恩雅 李民基', '2009', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('231', '敌营芳翠', 'http://img24.pplive.cn/2012/09/11/1528439861315284398613_230X306.jpg', 'http://v.pptv.com/show/K3Ft6lK4KGbJR68.html?rcc_src=L1', '                     在德军占领挪威期间，夜总会老板托尔•林德布罗姆依靠和德军的合作发了财，在党卫军克鲁格的帮助下，他为了自己的利益计...                            ', '7.7', 'Haakon Gundersen', '戈兹·奥托 Lene Nystrøm 英格丽德·波尔索·贝达尔', '2009', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('232', '恋爱中的维多利亚', 'http://img24.pplive.cn/2016/06/21/11541005786_230X306.jpg', 'http://v.pptv.com/show/kdQSkflfzw1w7lY.html?rcc_src=L1', '                     登基前，年轻的皇储维多利亚（艾米莉·布朗特 Emily Blunt 饰）不满母亲肯特—斯特拉森公爵夫人（米兰达·...                            ', '8.2', '让-马克·瓦雷', '艾米莉·布朗特 保罗·贝坦尼 米兰达·理查森', '2009', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('233', '辛亥革命', 'http://img24.pplive.cn/2012/01/08/11432178645_230X306.jpg', 'http://v.pptv.com/show/GNc8uiaKIibDaZF38.html?rcc_src=L1', '                     根据以孙中山、黄兴为首的同盟会，为推翻腐朽的清王朝，拯救中国，于1911年发动武装起义的史实创作，是一部全景展现...                            ', '9.0', '张黎', '赵文瑄 成龙 李冰冰', '2009', '未知', '无', '未知', '蓝光[电影]', '12');
INSERT INTO `video_home_videoresource` VALUES ('234', '寻龙诀', 'http://img24.pplive.cn/2011/12/08/17261943327_230X306.jpg', 'http://v.pptv.com/show/Ht02tByC8jCTEXk.html?rcc_src=L1', '                     本片讲述了摸金校尉为了彼岸花入墓倒斗的故事。上世纪80年代末，胡八一（陈坤饰）、王凯旋（黄渤饰）与Shirly杨...                            ', '8.5', '乌尔善', '陈坤 黄渤 舒淇', '2009', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('235', '鲨鱼城市', 'http://img24.pplive.cn/2015/01/29/17084765719_230X306.jpg', 'http://v.pptv.com/show/pS7AP6cNfbsenAQ.html?rcc_src=L1', '                     达根和肯尼是最好的朋友，两个人来到纽约寻找爱情。其中一人发现他梦想的女孩，恰好是该城中最大的黑帮头目的女儿，于是...                            ', '8.0', '丹·艾森', '杰斐逊·布朗 大卫·菲利普斯 卡尔洛·罗塔', '2009', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('236', '两个女人', 'http://img24.pplive.cn/2013/03/01/10123153947_230X306.jpg', 'http://v.pptv.com/show/nucAfuZMvPpd20M.html?rcc_src=L1', '                     素英（申恩庆 饰）是个产科医师，和做建筑师的丈夫智锡（郑俊浩 饰）庆祝结婚十周年纪念日时，偶然发现丈夫有了隐藏得...                            ', '6.9', '郑允秀', '申恩庆  郑俊浩 沈仁英', '2012', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('237', '嫌疑人X的献身', 'http://img24.pplive.cn/2017/04/06/13504996755_230X306.jpg', 'http://v.pptv.com/show/Cu58ibmLIOHbZV78.html?rcc_src=L1', '                     影片改编自日本推理作家东野圭吾的代表作《嫌疑人X的献身》，原名《完美的爱情》，后仍改为和原著接近的《嫌疑人X》。...                            ', '9.0', '方恩珍', '李瑶媛 柳承范 赵镇雄', '2012', '未知', '无', '未知', '悬疑[电影]', '7');
INSERT INTO `video_home_videoresource` VALUES ('238', '双枪男人', 'http://img24.pplive.cn/2012/11/15/10034674718_230X306.jpg', 'http://v.pptv.com/show/cZt18lrAMG7RT7c.html?rcc_src=L1', '                     影片讲述了8位遭遇中年危机的男人的故事，他们的名字都是一个单单的大写字母来代替。G(里卡杜·达林《谜一样的双眼》...                            ', '7.7', '塞斯科·盖', '里卡杜·达林 路伊斯·托沙 爱德华多·诺列加', '2012', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('239', '明日女优', 'http://img24.pplive.cn/2017/03/23/09581675693_230X306.jpg', 'http://v.pptv.com/show/3Cg3tR2D8zGUEno.html?rcc_src=L1', '                     Starlet是Jane的最爱兼唯一好友，一只芝娃娃。Jane想做明星，但拍的是小电影，入不敷支，有时靠捐血赚点...                            ', '7.6', '肖恩·贝克', '德丽·海明威 詹姆斯· 戴夫·比恩', '2012', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('240', '怒海劫运', 'http://img24.pplive.cn/2013/11/14/16382351092_230X306.jpg', 'http://v.pptv.com/show/xSYSkflfzw1w7lY.html?rcc_src=L1', '                     作为一个才华横溢的编剧，戛纳获奖片《狩猎》的剧本就出自托比亚斯之手，而他做起导演也毫不逊色，这部入选东京国际电影...                            ', '7.8', '托比亚斯·林道赫姆', '乔汗·菲利普·阿斯巴克 索伦·莫灵 达尔·萨利姆', '2012', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('241', '爱与荣耀', 'http://img24.pplive.cn/2013/04/07/15373031079_230X306.jpg', 'http://v.pptv.com/show/suSBic2fNPXveXMQ.html?rcc_src=L1', '                     利亚姆·海姆斯沃斯扮演奥斯汀的好友兼战友，两人并肩作战、出生入死。奥斯汀在美国本土的女朋友让他情绪失控。于是，两...                            ', '7.9', 'Danny Mooney', '泰莉莎·帕尔墨 利亚姆·海姆斯沃斯 艾米·缇加登', '2012', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('242', '白色严冬', 'http://img24.pplive.cn/2012/09/21/16123364036_230X306.jpg', 'http://v.pptv.com/show/TYXYVr4klNI1sxs.html?rcc_src=L1', '                     《战友》是一部反战题材影片。在严寒的挪威荒野的上空，英德双方的战机在一场激烈的空战中被彼此击落坠毁。在这与世隔绝...                            ', '9.0', '彼特·纳斯', '鲁伯特·格林特 大卫·克劳斯 斯蒂格·亨里克·霍夫', '2012', '未知', '无', '未知', '战争[电影]', '9');
INSERT INTO `video_home_videoresource` VALUES ('243', '牵牛花', 'http://img24.pplive.cn/2016/12/07/10271621582_230X306.jpg', 'http://v.pptv.com/show/cwicxbtY8rOpNyzM.html?rcc_src=L1', '                     　　音乐剧演员贤俊受到韩国音乐剧界的排挤，对韩国的音乐剧深感失望，决定去百老汇留学。素妍是贤俊的堂妹，自从贤俊离...                            ', '6.9', '黄哲民', '李惠真 宋震宇 黄哲民', '2012', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('244', '大门', 'http://img24.pplive.cn/2016/11/03/13523882930_230X306.jpg', 'http://v.pptv.com/show/mwLmZc0zoibFEwiao.html?rcc_src=L1', '                     　　年轻作家玛格达疲于应付家务，经朋友介绍，她雇佣了艾美瑞卡做管家。艾美瑞卡脾气古怪、性格顽固且满嘴脏话，更过分...                            ', '8.6', '伊斯特凡·萨博', '海伦·米伦 玛蒂娜·戈黛特 伊斯特凡·萨博', '2012', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('245', '湄公河行动', 'http://img24.pplive.cn/2015/08/16/13560674197_230X306.jpg', 'http://v.pptv.com/show/D0unJY3zY6EEguo.html?rcc_src=L1', '                     电影《湄公河行动》改编自2011年发生在湄公河金三角流域的中国商船遇袭案，当时13名中国船员全部遇难，船上却发现...                            ', '9.3', '林超贤', '张涵予 彭于晏 冯文娟', '2012', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('246', '从你的全世界路过', 'http://img24.pplive.cn/2012/12/10/15383298738_230X306.jpg', 'http://v.pptv.com/show/rZABfibdNvfte3EQ.html?rcc_src=L1', '                     陈末（邓超 饰）被称为全城最贱，每天和王牌DJ小容（杜鹃 饰）针锋相对，谁也不知道他们的仇恨从何而来。陈末的两个...                            ', '8.8', '张一白', '邓超 白百何 杨洋', '2012', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('247', '我老公不靠谱粤语版', 'http://img24.pplive.cn/2012/12/08/14305152234_230X306.jpg', 'http://v.pptv.com/show/R7GXFHziaUpDzcdk.html?rcc_src=L1', '                     十年前，念高中的Yoyo（蔡卓妍 饰）应父母的要求到英国与指腹为婚的张十三（郑伊健 饰）完婚，两人商议假结婚却在...                            ', '8.2', '阮世生', '蔡卓妍 郑伊健 张歆艺', '2012', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('248', '第七楼', 'http://img24.pplive.cn/2017/06/22/09520687769_230X306.jpg', 'http://v.pptv.com/show/s5xz8FiaibLmzPTbU.html?rcc_src=L1', '                     　　塞巴斯蒂安(里卡杜·达林 饰演)的两个女儿，卢娜和卢卡和她的前德利娅(贝伦·鲁艾达 饰演)住在一起。每次塞巴...                            ', '7.1', '派特克西·阿梅兹库阿', '里卡杜·达林 贝伦·鲁艾达 派特克西·阿梅兹库阿', '2013', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('249', '大事件', 'http://img24.pplive.cn/2017/06/22/10045244762_230X306.jpg', 'http://v.pptv.com/show/u5R7ibGDGNnTXVb0.html?rcc_src=L1', '                     　　在平静的小镇上因为总是没什么新闻发生，导致当地报纸陷入困境，报社编辑Leonard Crane为了拯救报纸，...                            ', '8.0', '丹尼尔·波尔马特', '亚伦·安什 埃尼斯·艾莫 克里斯汀·布斯', '2013', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('250', '鲨卷风', 'http://img24.pplive.cn/2013/09/03/14115266244_230X306.jpg', 'http://v.pptv.com/show/U3Ze3UWrG1m8OqI.html?rcc_src=L1', '                     所谓“鲨龙卷”，其实就是龙卷风袭过鲨鱼活跃的海域，将那里的海水和鲨鱼一同卷起带到别的地方，有点类似青蛙雨，只不过...                            ', '6.9', '安东尼·C·费兰特', '伊恩·齐林 塔拉·雷德 卡茜·瑟波', '2013', '未知', '无', '未知', '恐怖[电影]', '6');
INSERT INTO `video_home_videoresource` VALUES ('251', '绝地老冤家', 'http://img24.pplive.cn/2014/08/22/15332605886_230X306.jpg', 'http://v.pptv.com/show/3mvEQ6sRgb8iaoAg.html?rcc_src=L1', '                     一对已经离异的夫妻为了夺回属于他们的退休金又走到了一起，到底他们能成功吗？                            ', '7.8', '乔尔·霍普金斯', '皮尔斯·布鲁斯南 艾玛·汤普森 蒂莫西·斯波', '2013', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('252', '完美孕期', 'http://img24.pplive.cn/2014/02/19/16202933169_230X306.jpg', 'http://v.pptv.com/show/EuJKyTGXB0WoJo4.html?rcc_src=L1', '                     丽兹和丈夫彼得一直想组建一个大家庭，可惜事与愿违他们无法怀上孩子。丽兹最好的朋友安迪在一夜情后意外受孕，她提议把...                            ', '6.9', '杰茜·麦克考麦克', '米歇尔·莫娜汉 拉妲·米契尔 乔恩·多尔', '2013', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('253', '魔鬼小提琴家帕格尼尼', 'http://img24.pplive.cn/2017/05/09/15011268030_230X306.jpg', 'http://v.pptv.com/show/ib9yzMJjibbqwPjfU.html?rcc_src=L1', '                     讲述意大利小提琴演奏家和作曲家帕格尼尼的生活故事.                            ', '8.2', '伯纳德·罗斯', '大卫·葛瑞特 伯纳德·罗斯 2013', '2013', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('254', '海浪', 'http://img24.pplive.cn/2013/07/19/13570461516_230X306.jpg', 'http://v.pptv.com/show/LT6UEnrgUI7xb9c.html?rcc_src=L1', '                     　　位于挪威西部的Åknes与Hegguraksla山脉虽然景色怡人，但是山体的不稳定也留下了巨大的安全隐患。一...                            ', '7.8', 'Roar Uthaug', '克里斯托弗·琼勒 托玛斯·博·拉森 弗里迪夫·梭哈姆', '2013', '未知', '无', '未知', '灾难[电影]', '15');
INSERT INTO `video_home_videoresource` VALUES ('255', '大峡谷', 'http://img24.pplive.cn/2017/03/23/09361718791_230X306.jpg', 'http://v.pptv.com/show/3BFl4kqwIF7BP6c.html?rcc_src=L1', '                     《峡谷》的故事发生在美国洛杉矶，一群光鲜亮丽的二十多岁年轻人沉浸在荒淫无度及物质横流的生活中，当他们无比享受这种...                            ', '6.9', '保罗·施拉德', '琳赛·露安 詹姆斯·迪恩  诺兰·杰拉德·冯克', '2013', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('256', '宾馆', 'http://img24.pplive.cn/2017/03/21/10101406480_230X306.jpg', 'http://v.pptv.com/show/cZaCAWnPP33gXsY.html?rcc_src=L1', '                     Erika意外怀孕，此时的她完全没有做好迎接第一个孩子的准备。Erika是个出了名的控制狂，对临产各方面都考虑周...                            ', '7.3', '丽莎·朗塞斯', '艾丽西亚·维坎德 Margita Ahlin Simon J. Berger', '2013', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('257', '赤焰战场2', 'http://img24.pplive.cn/2013/10/24/15544497655_230X306.jpg', 'http://v.pptv.com/show/PHzmZMwyouBDwSk.html?rcc_src=L1', '                     　几位美国情报局(CIA)前特工组成的“夕阳特工队”将转战欧洲，期间，他们要搜寻一个在疯人院里制造大规模杀伤性武...                            ', '8.8', '迪恩·帕里索特', '布鲁斯·威利斯 玛丽·露易斯·帕克 海伦·米伦', '2013', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('258', '飞来横财', 'http://img24.pplive.cn/2016/11/03/14081784971_230X306.jpg', 'http://v.pptv.com/show/mQToZ881peNGxCw.html?rcc_src=L1', '                     　　一对多年的好友在结伴钓鱼时，发现一包十公斤的可卡因。为了改变生活，他们尝试卖出手中的毒品。影片以普通人贩毒引...                            ', '8.9', '阿加德·玛祖阿', '帕克·托斯 米格尔·德里瑞 阿加德·玛祖阿', '2013', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('259', '婚礼三个多', 'http://img24.pplive.cn/2016/11/03/13431026931_230X306.jpg', 'http://v.pptv.com/show/lwbqadE3pibVIxia4.html?rcc_src=L1', '                     　　露丝（茵玛·库艾斯塔饰）是个海洋生物学家，前男友佩德罗（叶贝·罗梅罗饰）的结婚让她倍受打击。阴沉的心情还没驱...                            ', '7.9', '哈维尔·鲁兹·卡尔德拉', '马丁·里瓦斯 萝西·德·帕尔马 奎姆·古铁雷兹', '2013', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('260', '侠探杰克', 'http://img24.pplive.cn/2013/01/17/14382592325_230X306.jpg', 'http://v.pptv.com/show/KtQ2tR2D8zGUEno.html?rcc_src=L1', '                     影片根据“英国惊悚小说天王”李查德的小说《完美嫌犯》改编。 　　六发子弹，五名死者，神秘枪手在闹市区制造了一起惨...                            ', '8.5', '克里斯托夫·迈考利', '汤姆·克鲁斯 罗莎曼德·派克 理查·詹金斯', '2013', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('261', '帕特里克', 'http://img24.pplive.cn/2016/12/30/10553445785_230X306.jpg', 'http://v.pptv.com/show/z6FCwSmPicz2gHoY.html?rcc_src=L1', '                     年轻漂亮的女护士凯西到一家偏僻的私人诊所工作，在那里她见到了处于深度昏迷中的帕特里克。她逐渐发现帕特里克可以通过...                            ', '7.1', '马克·哈特利', '瑞切尔·格里菲斯 沙妮·文森 理查德·格兰特', '2013', '未知', '无', '未知', '科幻[电影]', '33');
INSERT INTO `video_home_videoresource` VALUES ('262', '扫毒粤语版', 'http://img24.pplive.cn/2013/11/08/15235001117_230X306.jpg', 'http://v.pptv.com/show/Lc6tKpL4aKYJhib8.html?rcc_src=L1', '                     毒品调查科在执行任务中被毒犯巨头八面佛反埋伏，面对生死关头，三位主角为求活存，被迫命运扭转，展开一场残酷的人生战...                            ', '9.3', '陈木胜', '刘青云 古天乐 张家辉', '2013', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('263', '影人', 'http://img24.pplive.cn/2016/08/25/14244662873_230X306.jpg', 'http://v.pptv.com/show/m4Rw7la8LGrNS7M.html?rcc_src=L1', '                     他们的韶光年华，他们的苦乐喜悲，他们的靓丽容颜，他们的沧桑寂寞，都献给了荧幕，献给了荧幕后的我们，荧幕后的他们，...                            ', '7.8', '张昊', '未知', '2014', '未知', '无', '未知', '明星[电影]', '28');
INSERT INTO `video_home_videoresource` VALUES ('264', '眩晕', 'http://img24.pplive.cn/2017/06/20/18291143127_230X306.jpg', 'http://v.pptv.com/show/Y5h491icFNXPWVLw.html?rcc_src=L1', '                     　　“顺任”(金英爱)是“英姬”的大女儿和女婿)支援(“相互”(宋一国)以及学生的小女儿“花瓣》(金少将)和生活...                            ', '8.9', '李敦九', '金英爱 陶智媛 宋一国 ', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('265', '自由之丘', 'http://img24.pplive.cn/2017/06/20/18074166279_230X306.jpg', 'http://v.pptv.com/show/QbaeHYXrW5n8euI.html?rcc_src=L1', '                     　　影片讲述了日本男人在韩国首尔寻找爱情的故事。                            ', '8.0', '洪尚秀', '加濑亮 文素丽 金义城', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('266', '急速反击', 'http://img24.pplive.cn/2017/06/22/14480882590_230X306.jpg', 'http://v.pptv.com/show/g6uKCXHXR4XoZs4.html?rcc_src=L1', '                     　　亚历克斯，被困在一个重复循环的时间里，在曼谷的繁华街道被神秘的男子在他跟踪并试图杀死他。                            ', '6.9', '丹尼尔·泽瑞利', '迈克尔·阿斯顿 迪恩·亚历桑德罗 拜伦·吉布森', '2014', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('267', '鲨卷风2', 'http://img24.pplive.cn/2014/07/09/09325151414_230X306.jpg', 'http://v.pptv.com/show/NZx081vBMWicSULg.html?rcc_src=L1', '                     “鲨龙卷”再次来袭！ 本集的故事发生在纽约。它们回来了！那些大鲨鱼又「飞」回来了！在红遍网络的Syfy恶趣味电视...                            ', '6.9', 'Anthony C. Ferrante', '伊恩·齐林 塔拉·雷德 薇薇卡·福克斯', '2014', '未知', '无', '未知', '恐怖[电影]', '6');
INSERT INTO `video_home_videoresource` VALUES ('268', '可爱老女人', 'http://img24.pplive.cn/2017/07/25/16352268940_230X306.jpg', 'http://v.pptv.com/show/BayEA2vRQXiciaYMg.html?rcc_src=L1', '                     时运不济的纽约人马迪亚斯从父亲处继承了一间巴黎公寓，他来到巴黎准备将公寓卖掉，却意外发现房子里有两个“钉子户”—...                            ', '8.3', '以色列·霍罗维茨', '凯文·克莱恩 玛吉·史密斯 多米尼克·皮诺', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('269', '呼吸', 'http://img24.pplive.cn/2017/05/03/11193890652_230X306.jpg', 'http://v.pptv.com/show/MyIMiaicNZyQdq6FA.html?rcc_src=L1', '                     　　十七岁的查理乖巧懂事，是个十分讨人喜欢的女孩，和大部分同龄的姑娘们一样，查理对未来充满了美好而又光明的幻想。...                            ', '7.5', '梅拉尼·罗兰', '约瑟芬·约比 璐·德·拉格 伊莎贝尔·卡雷', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('270', '轻松自由', 'http://img24.pplive.cn/2017/05/03/13201546521_230X306.jpg', 'http://v.pptv.com/show/BRDibfeVLuiclc2kI.html?rcc_src=L1', '                     　　塞巴斯蒂安生命中只有一个野心：什么也不做。他的世界，就是他的沙发。他并不想维持生活，只想发呆。但今天，如果你...                            ', '7.9', 'Benjamin Guedj', 'Charlotte Le Bon 德尼·波达利德斯 伊莎贝尔·冈德列', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('271', '新包法利夫人', 'http://img24.pplive.cn/2017/05/03/11235237417_230X306.jpg', 'http://v.pptv.com/show/Vd64N58FdbMWlPw.html?rcc_src=L1', '                     　　故事发生在法国诺曼翠绿的田园风光中。年轻的英国女人杰玛与丈夫一起搬到法国一个小乡村，与此同时，一位名叫Mar...                            ', '7.6', '安妮·芳婷', '杰玛·阿特登 杰森·弗莱明  法布莱斯·鲁奇尼', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('272', '阿斯特里克斯历险记：诸神之宫殿（一）', 'http://img24.pplive.cn/2017/05/03/13462152611_230X306.jpg', 'http://v.pptv.com/show/5QrmZc0zoibFEwiao.html?rcc_src=L1', '                     　　凯撒为了淡化阿斯特里克斯村庄的团结，削弱当地的习俗，在高卢附近建立一个度假村。村民前方百计破坏这项工程，首先...                            ', '7.6', '亚历山德拉·阿斯提耶尔', 'Laurent Lafitte Géraldine Alain Chabat', '2014', '未知', '无', '未知', '冒险[电影]', '2');
INSERT INTO `video_home_videoresource` VALUES ('273', '弗兰克', 'http://img24.pplive.cn/2017/06/12/10185366244_230X306.jpg', 'http://v.pptv.com/show/hqUMiaicNZyQdq6FA.html?rcc_src=L1', '                     影片根据乔恩·强森(《以眼杀人》)的回忆录改编，他与《锅匠，裁缝，士兵，间谍》的编剧彼得·斯特劳汉一起负责影片的...                            ', '8.3', '兰纳德·阿伯拉罕森', '迈克尔·法斯宾德 多姆纳尔·格里森 玛吉·吉伦哈尔', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('274', '贝利叶一家', 'http://img24.pplive.cn/2017/06/12/10140011712_230X306.jpg', 'http://v.pptv.com/show/X0IurRV76ymMCnI.html?rcc_src=L1', '                     　　农场主贝利叶夫妇和他们的儿子都是听障，日常工作和生活都要依靠女儿宝拉充当手语翻译。宝拉的音乐老师发现了她的天...                            ', '8.9', '艾里克·拉缇戈', '露安·艾梅哈 嘉莲·维雅 弗朗索瓦·达密安', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('275', '电影魔术师：奥逊·威尔斯', 'http://img24.pplive.cn/2017/05/09/14413944399_230X306.jpg', 'http://v.pptv.com/show/uxn4d99FtfNW1Dw.html?rcc_src=L1', '                     威尔斯是一个罕见的多面手，广播剧、舞台剧、电影电视和广告，都干得非常好，他还懂魔术等杂七杂八的东西，这是一个深刻...                            ', '7.5', 'Chuck Workman', '未知', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('276', '油泵危机', 'http://img24.pplive.cn/2017/05/09/14160919056_230X306.jpg', 'http://v.pptv.com/show/R2VMyzOZCUeqKJA.html?rcc_src=L1', '                     A documentary that tells the story of America&apos;s add...                            ', '7.7', '乔什·提克尔', 'Adhemar Altieri Greg Anderson Edwin Black', '2014', '未知', '无', '未知', '纪实[资讯]', '32');
INSERT INTO `video_home_videoresource` VALUES ('277', '北极大冒险国语版', 'http://img24.pplive.cn/2016/12/22/17551913816_230X306.jpg', 'http://v.pptv.com/show/faGQD3fdTYvubNQ.html?rcc_src=L1', '                     讲述了喜欢冒险的少年卢克，穿雪海，跨冰川，风霜千里走冰原，护送小北极熊回家的故事。                            ', '8.0', '罗杰·斯波蒂伍德', '达科塔·高尤 高兰·维斯耶克 布丽姬·穆娜', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('278', '蜜糖的秘密', 'http://img24.pplive.cn/2017/04/25/16121296367_230X306.jpg', 'http://v.pptv.com/show/DdTCQakPf70gngY.html?rcc_src=L1', '                     \"《That Sugar Film 蜜糖的秘密》是一个把学术、教育、名人、科学和喜剧结合在一起的影片，将颠覆你对...                            ', '6.9', 'Damon Gameau', '斯蒂芬·弗雷 Damon Gameau 伊莎贝尔·卢卡斯', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('279', '北极大冒险', 'http://img24.pplive.cn/2016/12/22/17551913816_230X306.jpg', 'http://v.pptv.com/show/jib7MS7MZiaccqqBA.html?rcc_src=L1', '                     讲述了喜欢冒险的少年卢克，穿雪海，跨冰川，风霜千里走冰原，护送小北极熊回家的故事。                            ', '8.0', '罗杰·斯波蒂伍德', '达科塔·高尤 高兰·维斯耶克 布丽姬·穆娜', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('280', '美女与野兽', 'http://img24.pplive.cn/2014/12/10/17405475553_230X306.jpg', 'http://v.pptv.com/show/eGB9ib2PJOXfaWMA.html?rcc_src=L1', '                     《美女与野兽》的故事讲述的是某一村庄的商人，有六个孩子，其中小女儿贝儿最为纯洁美貌，受尽父亲宠爱。一次商人在回家...                            ', '8.7', '克里斯多夫·甘斯', '蕾雅·赛杜 文森·卡索 爱德华多·诺列加', '2014', '未知', '无', '未知', '魔幻[电影]', '14');
INSERT INTO `video_home_videoresource` VALUES ('281', '从你的全世界路过', 'http://img24.pplive.cn/2015/02/25/09353793621_230X306.jpg', 'http://v.pptv.com/show/66k2tByC8jCTEXk.html?rcc_src=L1', '                     陈末（邓超 饰）被称为全城最贱，每天和王牌DJ小容（杜鹃 饰）针锋相对，谁也不知道他们的仇恨从何而来。陈末的两个...                            ', '8.8', '张一白', '邓超 白百何 杨洋', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('282', '愈合', 'http://img24.pplive.cn/2017/03/21/10540076912_230X306.jpg', 'http://v.pptv.com/show/s9y4N58FdbMWlPw.html?rcc_src=L1', '                     维克多被判在一个低戒备的监狱农场服刑，他几乎放弃了人生。然而在这个毫无威胁的环境里，他仍然感觉这里的一些人可以做...                            ', '7.9', '柯瑞格·莫纳汉', '雨果·维文 泽维尔·塞缪尔 罗伯特·泰勒', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('283', '舞力假期', 'http://img24.pplive.cn/2014/11/21/13394337353_230X306.jpg', 'http://v.pptv.com/show/mEK4N58FdbMWlPw.html?rcc_src=L1', '                     玛蒂刚结束一段纠缠不清的恋情,疲惫的她决定闪电嫁给一个临时闯入她生活的极品天菜拉夫。玛蒂更邀请了她的妹妹泰勒丝,...                            ', '8.0', '丹尼亚·帕斯奎尼', '格雷·怀斯 利昂娜·刘易斯 安娜贝尔·斯考莉', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('284', '飞机和火山', 'http://img24.pplive.cn/2014/06/05/11412720762_230X306.jpg', 'http://v.pptv.com/show/IjyXFHziaUpDzcdk.html?rcc_src=L1', '                     　当一架客机困在一堆喷发的火山中时，乘客和机组人员必须设法求生——在不降落的情况下。但在岩浆和火山灰的持续打击下...                            ', '6.9', 'James Kondelik', '迪恩·凯恩 罗宾·吉文斯 Lawrence Hilton-Jacobs', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('285', '第二扇窗', 'http://img24.pplive.cn/2017/03/21/10395946435_230X306.jpg', 'http://v.pptv.com/show/R6uFAmrQQH7hX8c.html?rcc_src=L1', '                     被浩瀚大海所包围的奄美大岛，少年界人（村上虹郎 饰）和少女杏子（吉永淳 饰）各自经历着人生的波动时刻。月圆之夜，...                            ', '7.2', '河濑直美', '村上虹郎 吉永淳 杉本哲太', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('286', '晚餐', 'http://img24.pplive.cn/2016/11/03/13334360378_230X306.jpg', 'http://v.pptv.com/show/hxb6eeFHticVY1j4.html?rcc_src=L1', '                     一名警察在一次与斯戴弗诺的父亲的争执下，失手杀死他。男主在救治斯戴弗诺的过程中，得知其哥哥马西诺竟为警察辩护，他...                            ', '8.5', 'Ivano De Matteo', '乔凡娜·梅索兹殴诺 亚利桑德罗·加斯曼 巴博拉·伯布洛瓦', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('287', '大象之歌', 'http://img24.pplive.cn/2016/11/30/10570654222_230X306.jpg', 'http://v.pptv.com/show/9bCVEnrgUI7xb9c.html?rcc_src=L1', '                     　　精神科医师劳伦斯意外失踪，没有人知道他的去向，然而院里的精神病患麦克却似乎握有其失踪的线索。已为医院其他丑闻...                            ', '8.3', '尼古拉斯·比永', '布鲁斯·格林伍德 泽维尔·多兰 凯瑟琳·基纳', '2014', '未知', '无', '未知', '悬疑[电影]', '7');
INSERT INTO `video_home_videoresource` VALUES ('288', '晚餐', 'http://img24.pplive.cn/2016/11/03/14052694189_230X306.jpg', 'http://v.pptv.com/show/jRD0c9tBse9S0Dg.html?rcc_src=L1', '                     　　《晚餐》讲述了发生在一个生活十分窘迫的韩国社会底层家庭的故事。离婚后独自带着孩子的妹妹和靠做代理司机过活的哥...                            ', '8.6', '金东贤', '未知', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('289', '相对的幸福', 'http://img24.pplive.cn/2016/11/30/10563053142_230X306.jpg', 'http://v.pptv.com/show/555icicGTKOnjbWcE.html?rcc_src=L1', '                     　　三十多岁，身材肥胖的女生在一个小镇上经营着一家旅馆，小镇的生活单纯而又传统，她一直对家庭生活充满了希望，可在...                            ', '7.9', '丹尼·费利', '亚伦·普尔 米莉 丹尼·费利', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('290', '青春韶华', 'http://img24.pplive.cn/2016/11/30/10572442654_230X306.jpg', 'http://v.pptv.com/show/nUIjoAhu3hxicicWU.html?rcc_src=L1', '                     　　意大利著名诗人、哲学家贾科莫·莱帕尔德（GiacomoLeopardi）的传记片，由曾获得戛纳影帝的意大利男...                            ', '8.4', '马里奥·马尔托内', '埃里奥·杰曼诺 伊莎贝拉·拉贡内瑟 马里奥·马尔托内', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('291', '机械师2：复活英文版', 'http://img24.pplive.cn/2014/12/26/13394734970_230X306.jpg', 'http://v.pptv.com/show/fGFibicGTKOnjbWcE.html?rcc_src=L1', '                     故事时间则设定为前作的五年之后，亚瑟已然选择金盆洗手，与挚爱吉娜（杰西卡·阿尔芭 饰）隐姓埋名地共度美好人生。然...                            ', '9.1', '丹尼斯·甘塞尔', '杰森·斯坦森 杰西卡·阿尔芭 汤米·李·琼斯', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('292', '海洋之歌国语版', 'http://img24.pplive.cn/2017/01/13/11183296212_230X306.jpg', 'http://v.pptv.com/show/Q5R39FzCMnDTUbk.html?rcc_src=L1', '                     《海洋之歌》讲述了一个迷失和回家的故事。故事背景设置在了现代社会，是有关于一个塞尔奇小精灵的民间传说，她是最后一...                            ', '9.0', '汤姆·摩尔', '布莱丹·格里森 菲奥纽拉·弗拉纳根 帕特·绍特', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('293', '海洋之歌英文版', 'http://img24.pplive.cn/2015/01/19/10372554699_230X306.jpg', 'http://v.pptv.com/show/E0QnpAxy4iaCDAWk.html?rcc_src=L1', '                     《海洋之歌》讲述了一个迷失和回家的故事。故事背景设置在了现代社会，是有关于一个塞尔奇小精灵的民间传说，她是最后一...                            ', '9.1', '汤姆·摩尔', '布莱丹·格里森 菲奥纽拉·弗拉纳根 帕特·绍特', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('294', '过界男女粤语版', 'http://img24.pplive.cn/2014/03/18/10100141261_230X306.jpg', 'http://v.pptv.com/show/JU8tqhJ46CaJB28.html?rcc_src=L1', '                     富家太太Anna（刘嘉玲 饰）一直活在自己主宰的优哉游哉的都市上流社会生活中。丈夫能干、女儿出国留学，对内把家打...                            ', '7.2', '刘韵文', '刘嘉玲 陈坤 田原', '2014', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('295', '我盛大的西班牙婚礼', 'http://img24.pplive.cn/2016/09/18/18574786581_230X306.jpg', 'http://v.pptv.com/show/VTylIorwYJ4Bfibc.html?rcc_src=L1', '                     　　讲述了南非世界杯决赛时一个西班牙家庭发生的有趣故事。这个家庭有五个兄弟Adán (Antonio de la...                            ', '8.0', '丹尼尔·桑切斯·阿雷瓦洛', '安东尼奥·德拉托尔 奎姆·古特雷斯 丹尼尔·桑切斯·阿雷瓦洛', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('296', '圣芭芭拉', 'http://img24.pplive.cn/2016/09/18/18352476685_230X306.jpg', 'http://v.pptv.com/show/dRzFQqoQgL4hnwc.html?rcc_src=L1', '                     　　影片讲述了各自风格迥异的音乐导演和广告企划者为了进行同一个企划活动，远赴圣巴巴拉所发生的一系列故事                            ', '7.3', '曹圣奎', '李相仑 尹珍序 金太祐', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('297', '西班牙情事', 'http://img24.pplive.cn/2014/09/05/12152576052_230X306.jpg', 'http://v.pptv.com/show/oyePDHTaSojradE.html?rcc_src=L1', '                     拉法，土生土长的安达卢西亚人，从来没有想过离开他心爱的塞维利亚，为了去追求他人生中最重要的东西：红酒，编发和女人...                            ', '8.0', '埃米利奥·马丁内斯·拉萨罗', '克拉拉·拉戈 丹尼·罗维拉 卡勒梅·马奇', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('298', '盗马记粤语版', 'http://img24.pplive.cn/2014/03/03/11312468247_230X306.jpg', 'http://v.pptv.com/show/PTUUkicth0Q9y8Fg.html?rcc_src=L1', '                     电视台女主持夏梅到伦敦采访文物走私案，遇上千面大盗“九尾孤”和失意警官张浩。一个要揭露真相，一个要盗取“唐三彩”...                            ', '8.1', '李志毅', '陈慧琳 梁家辉 郑伊健', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('299', '临时同居粤语版', 'http://img24.pplive.cn/2014/12/11/17202986554_230X306.jpg', 'http://v.pptv.com/show/iaYFo50ib1JWPGRKw.html?rcc_src=L1', '                     勤奋努力的地产经纪项少龙（张家辉饰），求婚却因婚房太小而被拒。女友提出要在一年的时间里住上豪宅，对少龙来说简直就...                            ', '7.9', '卓韵芝', '郑秀文 张家辉 杨颖', '2014', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('300', '女人是老虎', 'http://img24.pplive.cn/2015/10/20/16313069166_230X306.jpg', 'http://v.pptv.com/show/q74xrhZ87CqNC3M.html?rcc_src=L1', '                     　　康烨，体育系毕业一年。通过好朋友介绍来到城市任职一名健美教练，通过网络与兼职模特Taylor合租房子。合租期...                            ', '7.8', '邓国庆', '张凯 阳蕾 黄一飞', '2015', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('301', '阴婚之鬼压床', 'http://img24.pplive.cn/2015/10/15/10071165949_230X306.jpg', 'http://v.pptv.com/show/01uXFHziaUpDzcdk.html?rcc_src=L1', '                     　　刚上大一的女生张静清纯漂亮，但是近来一段时间，每到十二点就会梦到自己被无形的力量控制在床上，任由摆布，醒过来...                            ', '6.9', '贾真', '完颜羽珊 唐伟鹏 贾真', '2015', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('302', '断蛇', 'http://img24.pplive.cn/2017/09/27/11071910271_230X306.jpg', 'http://v.pptv.com/show/wWtKyTGXB0WoJo4.html?rcc_src=L1', '                     　　年轻有魅力的、勤劳的sparra法瑞尔似乎是驶向一个快乐的、体面的生活。他有一个坚实的工作和一个可爱的未婚夫...                            ', '8.0', '托尼·艾尔斯', '沙利文·斯特普尔顿 杰西卡·德·古维 亚历克斯·罗素', '2015', '未知', '无', '未知', '悬疑[电影]', '7');
INSERT INTO `video_home_videoresource` VALUES ('303', '秘密特工', 'http://img24.pplive.cn/2017/06/20/17293213083_230X306.jpg', 'http://v.pptv.com/show/OxMCgelPvic1g3kY.html?rcc_src=L1', '                     　　阿道夫，一位30岁的保安，最近的日子很难过，不光长期的女友因为他没有抱负跟他分手，他自己也受到刚刚越狱的坏蛋...                            ', '7.7', '哈维尔·鲁兹·卡尔德拉', '奎姆·古铁雷兹 萝西·德·帕尔马 卡洛斯·阿雷塞斯', '2015', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('304', '万万没想到', 'http://img24.pplive.cn/2015/11/18/15240333272_230X306.jpg', 'http://v.pptv.com/show/yYRT0DiaeDkyvLZU.html?rcc_src=L1', '                     屌丝小妖王大锤（白客 饰），他生来便与常人不同，两耳尖尖，又有些小法力，总是自诩本地妖王。但让他万万没想到的是，...                            ', '8.1', '易小星', '白客 杨子珊 陈柏霖', '2015', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('305', '高中女生', 'http://img24.pplive.cn/2016/08/26/15485721963_230X306.jpg', 'http://v.pptv.com/show/UX5j4EiauHlyicPaU.html?rcc_src=L1', '                     　　洪金姝是班里新来的同学，在第一天的数学课上，金姝就帮恩英避免了同学的恶作剧，恩英很感激这名新同学。随后在汽车...                            ', '7.0', 'Jay Silverman', 'Taylor Spreitler Peter Coyote 孔艺智', '2015', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('306', '布兰卡', 'http://img24.pplive.cn/2017/06/08/13113148751_230X306.jpg', 'http://v.pptv.com/show/bXpX1DyiaElCzMZk.html?rcc_src=L1', '                     　　一个扒窃为生的小女孩，因为看到明星收养的新闻，于是和一位失明的街头艺人踏上“买母”的旅程。                            ', '8.6', '長谷井宏纪', '希德·盖比德诺 彼得·米勒 長谷井宏纪', '2015', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('307', '日长似岁', 'http://img24.pplive.cn/2017/09/15/20073329217_230X306.jpg', 'http://v.pptv.com/show/Y29EwyuRATibiaIIg.html?rcc_src=L1', '                     　　悲催的房地产经纪人弗兰克，他的生意失利，又家人的关系处于空前的低谷，在这时，偶然遇见了莎拉——这个让他想起他...                            ', '6.9', '马修·塞维尔', '安东尼·拉帕格利亚 朱丽娅·布莱克 Wayne Anthoney', '2015', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('308', '触火之恋', 'http://img24.pplive.cn/2017/06/08/13013399647_230X306.jpg', 'http://v.pptv.com/show/NaWODXXbS4nsatI.html?rcc_src=L1', '                     　　 两个精神病人在医院相遇，认识并相爱之后，跟随他们而来的不仅仅只有美好的爱情，这一切还伴随着深藏在两人精神疾...                            ', '8.0', 'Paul Dalio', '凯蒂·霍尔姆斯 卢克·科比 克里斯汀·拉蒂', '2015', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('309', '海上焰火', 'http://img24.pplive.cn/2017/09/15/20061916711_230X306.jpg', 'http://v.pptv.com/show/jxz1ctpAsO5Rzzc.html?rcc_src=L1', '                     这部纪录片拍摄的主体是意大利一座叫兰佩杜萨的小岛，这座小岛向来是非洲、中东难民登陆欧洲大陆的中转站。电影跟随一个...                            ', '8.1', '吉安弗兰科·罗西', '未知', '2015', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('310', '无罪杀手', 'http://img24.pplive.cn/2017/06/01/18104818413_230X306.jpg', 'http://v.pptv.com/show/01NBviaaMicDqdG4M.html?rcc_src=L1', '                     　　电影围绕着被挂科的心理学学生弗朗西斯科·哈维尔·加拉尔达和他的心理学教授埃斯皮诺萨之间展开，这部新式西班牙恐...                            ', '7.6', 'Gonzalo Bendala', '马克西·伊格莱西亚斯 路乔·费尔南德兹 奥拉·加里多', '2015', '未知', '无', '未知', '犯罪[电影]', '11');
INSERT INTO `video_home_videoresource` VALUES ('311', '封锁', 'http://img24.pplive.cn/2017/06/01/17410500461_230X306.jpg', 'http://v.pptv.com/show/g7GfHITqWpj7eeE.html?rcc_src=L1', '                     　　伊斯坦布尔受到政治暴力的控制。 Hamza, 是一名高级政治官员，他从监狱里释放了 Kadir，条件是Kad...                            ', '7.2', '埃敏·阿尔柏', '图林·奥曾 Berkay Ates Ozan Akbaba', '2015', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('312', '列车怎么办', 'http://img24.pplive.cn/2017/06/01/17374108333_230X306.jpg', 'http://v.pptv.com/show/Z9ib1MpoAcK4Rjicc.html?rcc_src=L1', '                     　　本片以新年夜最后一列从巴塞罗那开往马德里的火车为背景，讲述了在列车因故障停在半道上，一位老年乘客又意外离世之...                            ', '6.9', 'José', '萝西·德·帕尔马 劳拉·杜纳丝 艾妲·弗尔奇', '2015', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('313', '换头惊魂', 'http://img24.pplive.cn/2015/08/26/19253955018_230X306.jpg', 'http://v.pptv.com/show/t2Zu7VW7K2nMSrI.html?rcc_src=L1', '                     　　脑神经外科专家李伟杰博士在其助手玛丽的协助下，成功为一对猴子完成换头手术，引发全球轰动，评估为人换头成功率占...                            ', '6.9', '李三平', '大洋 赵雨浓 张林林', '2015', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('314', '铁道飞虎', 'http://img24.pplive.cn/2015/12/11/16545158875_230X306.jpg', 'http://v.pptv.com/show/7mWCAGjOPnzfXcU.html?rcc_src=L1', '                     　在抗战初期的鲁南地区，中国共产党组织一批煤矿工人八路军游击队汇合，坚持鲁南山区的抗日战争。为了配合山区八路军的...                            ', '8.4', '丁晟', '成龙 徐帆 黄子韬', '2015', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('315', '饭局女郎', 'http://img24.pplive.cn/2016/01/26/10084937390_230X306.jpg', 'http://v.pptv.com/show/g06dGoLoWJb5d98.html?rcc_src=L1', '                     　　杨颖、明明、曦曦是三个心怀梦想的女孩，她们同在合肥一家服务公司做饭局女郎，三人在工作中成为好姐妹，互帮互助。...                            ', '7.7', '刘宗伟', '王明茗 张世玉 史雨', '2015', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('316', '机械师2：复活英文版', 'http://img24.pplive.cn/2017/10/22/16533142161_230X306.jpg', 'http://v.pptv.com/show/dnll40uxIVicCQKg.html?rcc_src=L1', '                     故事时间则设定为前作的五年之后，亚瑟已然选择金盆洗手，与挚爱吉娜（杰西卡·阿尔芭 饰）隐姓埋名地共度美好人生。然...                            ', '9.1', '丹尼斯·甘塞尔', '杰森·斯坦森 杰西卡·阿尔芭 汤米·李·琼斯', '2017', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('317', '按摩侠', 'http://img24.pplive.cn/2017/07/13/16313726639_230X306.jpg', 'http://v.pptv.com/show/C9aqKZH3Z6UIhu4.html?rcc_src=L1', '                     　　青龙集团董事长过世后，给青龙集团太子爷留下了镇帮之宝：一支可以号令整个青龙集团所有人的大哥大手提电话。一日，...                            ', '7.0', '侯懿洋', '周明 姬天语（台湾） 句号', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('318', '铁道飞虎', 'http://img24.pplive.cn/2017/10/20/11511422681_230X306.jpg', 'http://v.pptv.com/show/Pa44th6E9DKVE3s.html?rcc_src=L1', '                     　在抗战初期的鲁南地区，中国共产党组织一批煤矿工人八路军游击队汇合，坚持鲁南山区的抗日战争。为了配合山区八路军的...                            ', '8.4', '丁晟', '成龙 徐帆 黄子韬', '2017', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('319', '巴霍巴利王：开端', 'http://img24.pplive.cn/2017/10/17/10435131776_230X306.jpg', 'http://v.pptv.com/show/oSuzMZnicb60QjvY.html?rcc_src=L1', '                     故事发生在一个名为摩喜施末底的王国之中，激烈的王位争夺之战正在巴霍巴利（帕拉巴斯 Prabhas 饰）和巴哈拉拉...                            ', '8.9', 'S·S·拉贾穆里', '帕拉巴斯 特曼娜·芭蒂亚 安努舒卡·谢蒂', '2017', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('320', '后青春之歌', 'http://img24.pplive.cn/2017/06/29/10190549494_230X306.jpg', 'http://v.pptv.com/show/72pIxyibVBUOmJIw.html?rcc_src=L1', '                     　　故事围绕四个即将步入青春末期的闺蜜，她们感情深厚却有着不同的价值观和人世观。在时代的驱动下她们爱慕虚荣，势利...                            ', '7.7', '黄伟贤', '何傲儿 李逸朗 蔡淇俊', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('321', '铁拳', 'http://img24.pplive.cn/2017/10/05/16295237185_230X306.jpg', 'http://v.pptv.com/show/A4df3UWrG1m8OqI.html?rcc_src=L1', '                     一个曾经辉煌的次中量级“左撇子”拳击手在跌落事业谷底后，经过对爱情和家庭的反省，重新努力返回拳台再次站上世界之巅...                            ', '8.3', '安东尼·福奎阿', '瑞秋·麦克亚当斯 杰克·吉伦哈尔 安东尼·福奎阿', '2017', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('322', '婚后进行时', 'http://img24.pplive.cn/2017/07/03/15510423672_230X306.jpg', 'http://v.pptv.com/show/DwnpZs40pOJFwys.html?rcc_src=L1', '                     　　婚前的脱单之夜，高飞约了几个好哥们儿举行派对，喝醉后和陌生女孩欣然开房。虽然紧要关头及时刹车，却被欣然拍下床...                            ', '8.0', '隗功杨', '秦浩 陈圆 陈弈霏', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('323', '极盗者', 'http://img24.pplive.cn/2017/09/30/17042489396_230X306.jpg', 'http://v.pptv.com/show/8vnlY8sxod9CwCg.html?rcc_src=L1', '                     年轻的FBI特工强尼·犹他（卢克·布雷西 Luke Bracey 饰），潜伏到一队喜欢寻找刺激挑战的盗匪里，该队...                            ', '8.7', '埃里克森·科尔', '卢克·布雷西 埃德加·拉米雷兹 泰莉莎·帕尔墨', '2017', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('324', '乒乓小将', 'http://img24.pplive.cn/2017/09/30/11291462214_230X306.jpg', 'http://v.pptv.com/show/Kp5Ixia6UBEKlI4s.html?rcc_src=L1', '                     网聚正能量，实现中国梦。                            ', '8.1', '未知', '未知', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('325', '我的UFO女友', 'http://img24.pplive.cn/2017/06/26/16391480739_230X306.jpg', 'http://v.pptv.com/show/ic3pY1ziblFVO2NJw.html?rcc_src=L1', '                     　　宅男张宇因为自己热爱电影而独自宅在家里进行为其半年的剧本创作，这让和他相处的女友向其提出分手。分手后的张宇一...                            ', '7.9', '饶阳', '闫昌 陈建新 饶阳', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('326', '心理罪', 'http://img24.pplive.cn/2017/09/29/16403076978_230X306.jpg', 'http://v.pptv.com/show/VWZU0zuhEUibyMJg.html?rcc_src=L1', '                     　　一杯人血牛奶，为何会对人产生致命诱惑？ 什么样的扭曲心理才会为之痴狂，甚至不惜接二连三，连环杀人？ 非同寻常...                            ', '8.6', '谢东燊', '廖凡 李易峰 万茜', '2017', '未知', '无', '未知', 'VIP尊享[电影]', '1');
INSERT INTO `video_home_videoresource` VALUES ('327', '我和校花换个身体', 'http://img24.pplive.cn/2017/06/21/18240631814_230X306.jpg', 'http://v.pptv.com/show/jibbMS7MZiaccqqBA.html?rcc_src=L1', '                     　　凯文与莫岚是校园内令人羡慕的情侣组合，而张小飞只是一个名不经传的暴躁小屌丝。阴差阳错之下，张小飞与莫岚发生了...                            ', '6.9', '汪东', '沈幸 曾萧婷 汪东', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('328', '迷路猫之死', 'http://img24.pplive.cn/2017/06/22/17285601523_230X306.jpg', 'http://v.pptv.com/show/ia3ha2UGnF1W4Np4.html?rcc_src=L1', '                     　　20年前，木戈因为替老大顶罪，失去了亲人和爱情。出狱后，一心想复仇的木戈，却离奇地爱上了仇人的女儿。一场展开...                            ', '6.9', '唐明智', '宁楠 于岩琴 唐明智', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('329', '绝世高手之特工前传', 'http://img24.pplive.cn/2017/06/14/15484947399_230X306.jpg', 'http://v.pptv.com/show/fZh6ibWHHN3XYVr4.html?rcc_src=L1', '                     　　本片讲述的是一个生长在乡村的小孩子，小时候，被人欺负，然后告诉爷爷说我要学武，历经磨难，拜师学艺，然后下山找...                            ', '6.9', '张家卫', '黄菜花 方树伟 王白菜', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('330', '破局', 'http://img24.pplive.cn/2017/06/14/17593820042_230X306.jpg', 'http://v.pptv.com/show/kywenQVr2xl8ibmI.html?rcc_src=L1', '                     　　这是高见翔警官生命中最艰难的一天：老母亲去世，疑似受贿被要求配合调查取证。在奔丧的路上，他又意外撞死了人。手...                            ', '8.0', '连奕琦', '郭富城 王千源 刘涛', '2017', '未知', '无', '未知', 'VIP尊享[电影]', '1');
INSERT INTO `video_home_videoresource` VALUES ('331', '情圣', 'http://img24.pplive.cn/2017/09/21/23264979976_230X306.jpg', 'http://v.pptv.com/show/rSK8OqIIeLYZlic8.html?rcc_src=L1', '                     　　好友突然离世，令生活安稳的肖瀚（肖央饰）开始唏嘘人生苦短。柳下惠自居的他，因为偶然邂逅性感美女模特yoyo（...                            ', '8.5', '宋晓飞', '肖央 闫妮 小沈阳', '2017', '未知', '无', '未知', '爱情[电影]', '10');
INSERT INTO `video_home_videoresource` VALUES ('332', '变脸女神', 'http://img24.pplive.cn/2017/06/23/18221542195_230X306.jpg', 'http://v.pptv.com/show/u0gqqRF35yWIBm4.html?rcc_src=L1', '                     　　两位职场女强人，凯希和莫菲，她们是世界五百强公司里两个针锋相对的竞争对手，离年终考核只剩最后一个月了，两个人...                            ', '6.9', '丁凤涛', '陈汪洋 谈千千 丁凤涛', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('333', '隐秘线索', 'http://img24.pplive.cn/2017/03/27/12590936475_230X306.jpg', 'http://v.pptv.com/show/RicDcW8Mpmdc6uCA.html?rcc_src=L1', '                     　　黑帮老大威爷遭人刺杀，派得力手下冷森 和 一条追查幕后主使。残酷的黑帮内斗带来无穷猜忌：威爷怀疑冷森和一条中...                            ', '8.2', '曹国峰', '蒋宇杨 余膑 陈梦', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('334', '这个杀手不太冷', 'http://img24.pplive.cn/2017/09/23/11135456912_230X306.jpg', 'http://v.pptv.com/show/oSeicPaULe7kcmgI.html?rcc_src=L1', '                     纽约贫民区住着一个意大利人，名叫里昂(Jean Reno饰)，职业杀手。一天，邻居家小姑娘马蒂尔达(Natali...                            ', '9.7', '吕克·贝松', '加里·奥德曼 让·雷诺 娜塔丽·波特曼', '2017', '未知', '无', '未知', '犯罪[电影]', '11');
INSERT INTO `video_home_videoresource` VALUES ('335', '拳头', 'http://img24.pplive.cn/2017/06/23/18174581341_230X306.jpg', 'http://v.pptv.com/show/n2xGxS2TA0GkIoo.html?rcc_src=L1', '                     　　军人胡浩明复员以后，虽有一身好功夫，生活却处处碰壁，一次公交车上的见义勇为让他顿时成为网红，并与解救的女主陈...                            ', '6.9', '丁凤涛', '龙道 石峯 陈汪洋', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('336', '征服之活有余罪', 'http://img24.pplive.cn/2017/03/21/13025182822_230X306.jpg', 'http://v.pptv.com/show/UdC8O6MJebcamAA.html?rcc_src=L1', '                     　　张柏林本是个傻小子进城创业的企业家，因为商业竞争其弟弟被打残，从此张开启了报复之旅。警局为查与张有关的案子派...                            ', '6.9', '张举', '陈俊希 苏晗 刘顾浩', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('337', '晚餐吃了爸爸', 'http://img24.pplive.cn/2017/03/21/12270412255_230X306.jpg', 'http://v.pptv.com/show/l2VPzDSaCkiarKZE.html?rcc_src=L1', '                     　　五年前，涂涂一心想考警校，可是父母不同意，涂涂幻想出有着天使般英俊面容并成功考上警校实现了理想的另一个自己，...                            ', '6.9', '李斌', '王丙冠 李斌 李泽睿', '2017', '未知', '无', '未知', '微电影[电影]', '5');
INSERT INTO `video_home_videoresource` VALUES ('338', '影人', 'http://img24.pplive.cn/2016/08/25/14244662873_230X306.jpg', 'http://v.pptv.com/show/m4Rw7la8LGrNS7M.html?rcc_src=L1', '                     他们的韶光年华，他们的苦乐喜悲，他们的靓丽容颜，他们的沧桑寂寞，都献给了荧幕，献给了荧幕后的我们，荧幕后的他们，...                            ', '7.8', '张昊', '未知', '2014', '未知', '无', '未知', '明星[电影]', '28');
INSERT INTO `video_home_videoresource` VALUES ('339', '眩晕', 'http://img24.pplive.cn/2017/06/20/18291143127_230X306.jpg', 'http://v.pptv.com/show/Y5h491icFNXPWVLw.html?rcc_src=L1', '                     　　“顺任”(金英爱)是“英姬”的大女儿和女婿)支援(“相互”(宋一国)以及学生的小女儿“花瓣》(金少将)和生活...                            ', '8.9', '李敦九', '金英爱 陶智媛 宋一国 ', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('340', '自由之丘', 'http://img24.pplive.cn/2017/06/20/18074166279_230X306.jpg', 'http://v.pptv.com/show/QbaeHYXrW5n8euI.html?rcc_src=L1', '                     　　影片讲述了日本男人在韩国首尔寻找爱情的故事。                            ', '8.0', '洪尚秀', '加濑亮 文素丽 金义城', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('341', '急速反击', 'http://img24.pplive.cn/2017/06/22/14480882590_230X306.jpg', 'http://v.pptv.com/show/g6uKCXHXR4XoZs4.html?rcc_src=L1', '                     　　亚历克斯，被困在一个重复循环的时间里，在曼谷的繁华街道被神秘的男子在他跟踪并试图杀死他。                            ', '6.9', '丹尼尔·泽瑞利', '迈克尔·阿斯顿 迪恩·亚历桑德罗 拜伦·吉布森', '2014', '未知', '无', '未知', '动作[电影]', '3');
INSERT INTO `video_home_videoresource` VALUES ('342', '鲨卷风2', 'http://img24.pplive.cn/2014/07/09/09325151414_230X306.jpg', 'http://v.pptv.com/show/NZx081vBMWicSULg.html?rcc_src=L1', '                     “鲨龙卷”再次来袭！ 本集的故事发生在纽约。它们回来了！那些大鲨鱼又「飞」回来了！在红遍网络的Syfy恶趣味电视...                            ', '6.9', 'Anthony C. Ferrante', '伊恩·齐林 塔拉·雷德 薇薇卡·福克斯', '2014', '未知', '无', '未知', '恐怖[电影]', '6');
INSERT INTO `video_home_videoresource` VALUES ('343', '可爱老女人', 'http://img24.pplive.cn/2017/07/25/16352268940_230X306.jpg', 'http://v.pptv.com/show/BayEA2vRQXiciaYMg.html?rcc_src=L1', '                     时运不济的纽约人马迪亚斯从父亲处继承了一间巴黎公寓，他来到巴黎准备将公寓卖掉，却意外发现房子里有两个“钉子户”—...                            ', '8.3', '以色列·霍罗维茨', '凯文·克莱恩 玛吉·史密斯 多米尼克·皮诺', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('344', '呼吸', 'http://img24.pplive.cn/2017/05/03/11193890652_230X306.jpg', 'http://v.pptv.com/show/MyIMiaicNZyQdq6FA.html?rcc_src=L1', '                     　　十七岁的查理乖巧懂事，是个十分讨人喜欢的女孩，和大部分同龄的姑娘们一样，查理对未来充满了美好而又光明的幻想。...                            ', '7.5', '梅拉尼·罗兰', '约瑟芬·约比 璐·德·拉格 伊莎贝尔·卡雷', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('345', '轻松自由', 'http://img24.pplive.cn/2017/05/03/13201546521_230X306.jpg', 'http://v.pptv.com/show/BRDibfeVLuiclc2kI.html?rcc_src=L1', '                     　　塞巴斯蒂安生命中只有一个野心：什么也不做。他的世界，就是他的沙发。他并不想维持生活，只想发呆。但今天，如果你...                            ', '7.9', 'Benjamin Guedj', 'Charlotte Le Bon 德尼·波达利德斯 伊莎贝尔·冈德列', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('346', '新包法利夫人', 'http://img24.pplive.cn/2017/05/03/11235237417_230X306.jpg', 'http://v.pptv.com/show/Vd64N58FdbMWlPw.html?rcc_src=L1', '                     　　故事发生在法国诺曼翠绿的田园风光中。年轻的英国女人杰玛与丈夫一起搬到法国一个小乡村，与此同时，一位名叫Mar...                            ', '7.6', '安妮·芳婷', '杰玛·阿特登 杰森·弗莱明  法布莱斯·鲁奇尼', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('347', '阿斯特里克斯历险记：诸神之宫殿（二）', 'http://img24.pplive.cn/2017/05/03/13462152611_230X306.jpg', 'http://v.pptv.com/show/5QrmZc0zoibFEwiao.html?rcc_src=L1', '                     　　凯撒为了淡化阿斯特里克斯村庄的团结，削弱当地的习俗，在高卢附近建立一个度假村。村民前方百计破坏这项工程，首先...                            ', '7.6', '亚历山德拉·阿斯提耶尔', 'Laurent Lafitte Géraldine Alain Chabat', '2014', '未知', '无', '未知', '冒险[电影]', '2');
INSERT INTO `video_home_videoresource` VALUES ('348', '弗兰克', 'http://img24.pplive.cn/2017/06/12/10185366244_230X306.jpg', 'http://v.pptv.com/show/hqUMiaicNZyQdq6FA.html?rcc_src=L1', '                     影片根据乔恩·强森(《以眼杀人》)的回忆录改编，他与《锅匠，裁缝，士兵，间谍》的编剧彼得·斯特劳汉一起负责影片的...                            ', '8.3', '兰纳德·阿伯拉罕森', '迈克尔·法斯宾德 多姆纳尔·格里森 玛吉·吉伦哈尔', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('349', '贝利叶一家', 'http://img24.pplive.cn/2017/06/12/10140011712_230X306.jpg', 'http://v.pptv.com/show/X0IurRV76ymMCnI.html?rcc_src=L1', '                     　　农场主贝利叶夫妇和他们的儿子都是听障，日常工作和生活都要依靠女儿宝拉充当手语翻译。宝拉的音乐老师发现了她的天...                            ', '8.9', '艾里克·拉缇戈', '露安·艾梅哈 嘉莲·维雅 弗朗索瓦·达密安', '2014', '未知', '无', '未知', '喜剧[电影]', '4');
INSERT INTO `video_home_videoresource` VALUES ('350', '电影魔术师：奥逊·威尔斯', 'http://img24.pplive.cn/2017/05/09/14413944399_230X306.jpg', 'http://v.pptv.com/show/uxn4d99FtfNW1Dw.html?rcc_src=L1', '                     威尔斯是一个罕见的多面手，广播剧、舞台剧、电影电视和广告，都干得非常好，他还懂魔术等杂七杂八的东西，这是一个深刻...                            ', '7.5', 'Chuck Workman', '未知', '2014', '未知', '无', '未知', '剧情[电影]', '16');
INSERT INTO `video_home_videoresource` VALUES ('351', '油泵危机', 'http://img24.pplive.cn/2017/05/09/14160919056_230X306.jpg', 'http://v.pptv.com/show/R2VMyzOZCUeqKJA.html?rcc_src=L1', '                     A documentary that tells the story of America&apos;s add...                            ', '7.7', '乔什·提克尔', 'Adhemar Altieri Greg Anderson Edwin Black', '2014', '未知', '无', '未知', '纪实[资讯]', '32');
INSERT INTO `video_home_videoresource` VALUES ('352', '北极大冒险国语版', 'http://img24.pplive.cn/2016/12/22/17551913816_230X306.jpg', 'http://v.pptv.com/show/faGQD3fdTYvubNQ.html?rcc_src=L1', '                     讲述了喜欢冒险的少年卢克，穿雪海，跨冰川，风霜千里走冰原，护送小北极熊回家的故事。                            ', '8.0', '罗杰·斯波蒂伍德', '达科塔·高尤 高兰·维斯耶克 布丽姬·穆娜', '2014', '未知', '无', '未知', '院线[电影]', '13');
INSERT INTO `video_home_videoresource` VALUES ('353', '影人', 'http://img24.pplive.cn/2016/08/25/14244662873_230X306.jpg', 'http://v.pptv.com/show/m4Rw7la8LGrNS7M.html?rcc_src=L1', '                     他们的韶光年华，他们的苦乐喜悲，他们的靓丽容颜，他们的沧桑寂寞，都献给了荧幕，献给了荧幕后的我们，荧幕后的他们，...                            ', '7.8', '张昊', '未知', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('354', '眩晕', 'http://img24.pplive.cn/2017/06/20/18291143127_230X306.jpg', 'http://v.pptv.com/show/Y5h491icFNXPWVLw.html?rcc_src=L1', '                     　　“顺任”(金英爱)是“英姬”的大女儿和女婿)支援(“相互”(宋一国)以及学生的小女儿“花瓣》(金少将)和生活...                            ', '8.9', '李敦九', '金英爱 陶智媛 宋一国 ', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('355', '自由之丘', 'http://img24.pplive.cn/2017/06/20/18074166279_230X306.jpg', 'http://v.pptv.com/show/QbaeHYXrW5n8euI.html?rcc_src=L1', '                     　　影片讲述了日本男人在韩国首尔寻找爱情的故事。                            ', '8.0', '洪尚秀', '加濑亮 文素丽 金义城', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('356', '急速反击', 'http://img24.pplive.cn/2017/06/22/14480882590_230X306.jpg', 'http://v.pptv.com/show/g6uKCXHXR4XoZs4.html?rcc_src=L1', '                     　　亚历克斯，被困在一个重复循环的时间里，在曼谷的繁华街道被神秘的男子在他跟踪并试图杀死他。                            ', '6.9', '丹尼尔·泽瑞利', '迈克尔·阿斯顿 迪恩·亚历桑德罗 拜伦·吉布森', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('357', '鲨卷风2', 'http://img24.pplive.cn/2014/07/09/09325151414_230X306.jpg', 'http://v.pptv.com/show/NZx081vBMWicSULg.html?rcc_src=L1', '                     “鲨龙卷”再次来袭！ 本集的故事发生在纽约。它们回来了！那些大鲨鱼又「飞」回来了！在红遍网络的Syfy恶趣味电视...                            ', '6.9', 'Anthony C. Ferrante', '伊恩·齐林 塔拉·雷德 薇薇卡·福克斯', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('358', '可爱老女人', 'http://img24.pplive.cn/2017/07/25/16352268940_230X306.jpg', 'http://v.pptv.com/show/BayEA2vRQXiciaYMg.html?rcc_src=L1', '                     时运不济的纽约人马迪亚斯从父亲处继承了一间巴黎公寓，他来到巴黎准备将公寓卖掉，却意外发现房子里有两个“钉子户”—...                            ', '8.3', '以色列·霍罗维茨', '凯文·克莱恩 玛吉·史密斯 多米尼克·皮诺', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('359', '呼吸', 'http://img24.pplive.cn/2017/05/03/11193890652_230X306.jpg', 'http://v.pptv.com/show/MyIMiaicNZyQdq6FA.html?rcc_src=L1', '                     　　十七岁的查理乖巧懂事，是个十分讨人喜欢的女孩，和大部分同龄的姑娘们一样，查理对未来充满了美好而又光明的幻想。...                            ', '7.5', '梅拉尼·罗兰', '约瑟芬·约比 璐·德·拉格 伊莎贝尔·卡雷', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('360', '轻松自由', 'http://img24.pplive.cn/2017/05/03/13201546521_230X306.jpg', 'http://v.pptv.com/show/BRDibfeVLuiclc2kI.html?rcc_src=L1', '                     　　塞巴斯蒂安生命中只有一个野心：什么也不做。他的世界，就是他的沙发。他并不想维持生活，只想发呆。但今天，如果你...                            ', '7.9', 'Benjamin Guedj', 'Charlotte Le Bon 德尼·波达利德斯 伊莎贝尔·冈德列', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('361', '新包法利夫人', 'http://img24.pplive.cn/2017/05/03/11235237417_230X306.jpg', 'http://v.pptv.com/show/Vd64N58FdbMWlPw.html?rcc_src=L1', '                     　　故事发生在法国诺曼翠绿的田园风光中。年轻的英国女人杰玛与丈夫一起搬到法国一个小乡村，与此同时，一位名叫Mar...                            ', '7.6', '安妮·芳婷', '杰玛·阿特登 杰森·弗莱明  法布莱斯·鲁奇尼', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('362', '阿斯特里克斯历险记：诸神之宫殿（三）', 'http://img24.pplive.cn/2017/05/03/13462152611_230X306.jpg', 'http://v.pptv.com/show/5QrmZc0zoibFEwiao.html?rcc_src=L1', '                     　　凯撒为了淡化阿斯特里克斯村庄的团结，削弱当地的习俗，在高卢附近建立一个度假村。村民前方百计破坏这项工程，首先...                            ', '7.6', '亚历山德拉·阿斯提耶尔', 'Laurent Lafitte Géraldine Alain Chabat', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('363', '弗兰克', 'http://img24.pplive.cn/2017/06/12/10185366244_230X306.jpg', 'http://v.pptv.com/show/hqUMiaicNZyQdq6FA.html?rcc_src=L1', '                     影片根据乔恩·强森(《以眼杀人》)的回忆录改编，他与《锅匠，裁缝，士兵，间谍》的编剧彼得·斯特劳汉一起负责影片的...                            ', '8.3', '兰纳德·阿伯拉罕森', '迈克尔·法斯宾德 多姆纳尔·格里森 玛吉·吉伦哈尔', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('364', '贝利叶一家', 'http://img24.pplive.cn/2017/06/12/10140011712_230X306.jpg', 'http://v.pptv.com/show/X0IurRV76ymMCnI.html?rcc_src=L1', '                     　　农场主贝利叶夫妇和他们的儿子都是听障，日常工作和生活都要依靠女儿宝拉充当手语翻译。宝拉的音乐老师发现了她的天...                            ', '8.9', '艾里克·拉缇戈', '露安·艾梅哈 嘉莲·维雅 弗朗索瓦·达密安', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('365', '电影魔术师：奥逊·威尔斯', 'http://img24.pplive.cn/2017/05/09/14413944399_230X306.jpg', 'http://v.pptv.com/show/uxn4d99FtfNW1Dw.html?rcc_src=L1', '                     威尔斯是一个罕见的多面手，广播剧、舞台剧、电影电视和广告，都干得非常好，他还懂魔术等杂七杂八的东西，这是一个深刻...                            ', '7.5', 'Chuck Workman', '未知', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('366', '油泵危机', 'http://img24.pplive.cn/2017/05/09/14160919056_230X306.jpg', 'http://v.pptv.com/show/R2VMyzOZCUeqKJA.html?rcc_src=L1', '                     A documentary that tells the story of America&apos;s add...                            ', '7.7', '乔什·提克尔', 'Adhemar Altieri Greg Anderson Edwin Black', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('367', '北极大冒险国语版', 'http://img24.pplive.cn/2016/12/22/17551913816_230X306.jpg', 'http://v.pptv.com/show/faGQD3fdTYvubNQ.html?rcc_src=L1', '                     讲述了喜欢冒险的少年卢克，穿雪海，跨冰川，风霜千里走冰原，护送小北极熊回家的故事。                            ', '8.0', '罗杰·斯波蒂伍德', '达科塔·高尤 高兰·维斯耶克 布丽姬·穆娜', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('368', '蜜糖的秘密', 'http://img24.pplive.cn/2017/04/25/16121296367_230X306.jpg', 'http://v.pptv.com/show/DdTCQakPf70gngY.html?rcc_src=L1', '                     \"《That Sugar Film 蜜糖的秘密》是一个把学术、教育、名人、科学和喜剧结合在一起的影片，将颠覆你对...                            ', '6.9', 'Damon Gameau', '斯蒂芬·弗雷 Damon Gameau 伊莎贝尔·卢卡斯', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('369', '北极大冒险', 'http://img24.pplive.cn/2016/12/22/17551913816_230X306.jpg', 'http://v.pptv.com/show/jib7MS7MZiaccqqBA.html?rcc_src=L1', '                     讲述了喜欢冒险的少年卢克，穿雪海，跨冰川，风霜千里走冰原，护送小北极熊回家的故事。                            ', '8.0', '罗杰·斯波蒂伍德', '达科塔·高尤 高兰·维斯耶克 布丽姬·穆娜', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('370', '美女与野兽', 'http://img24.pplive.cn/2014/12/10/17405475553_230X306.jpg', 'http://v.pptv.com/show/eGB9ib2PJOXfaWMA.html?rcc_src=L1', '                     《美女与野兽》的故事讲述的是某一村庄的商人，有六个孩子，其中小女儿贝儿最为纯洁美貌，受尽父亲宠爱。一次商人在回家...                            ', '8.7', '克里斯多夫·甘斯', '蕾雅·赛杜 文森·卡索 爱德华多·诺列加', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('371', '从你的全世界路过', 'http://img24.pplive.cn/2015/02/25/09353793621_230X306.jpg', 'http://v.pptv.com/show/66k2tByC8jCTEXk.html?rcc_src=L1', '                     陈末（邓超 饰）被称为全城最贱，每天和王牌DJ小容（杜鹃 饰）针锋相对，谁也不知道他们的仇恨从何而来。陈末的两个...                            ', '8.8', '张一白', '邓超 白百何 杨洋', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('372', '愈合', 'http://img24.pplive.cn/2017/03/21/10540076912_230X306.jpg', 'http://v.pptv.com/show/s9y4N58FdbMWlPw.html?rcc_src=L1', '                     维克多被判在一个低戒备的监狱农场服刑，他几乎放弃了人生。然而在这个毫无威胁的环境里，他仍然感觉这里的一些人可以做...                            ', '7.9', '柯瑞格·莫纳汉', '雨果·维文 泽维尔·塞缪尔 罗伯特·泰勒', '2014', '未知', '无', '未知', '惊悚[电影]', '8');
INSERT INTO `video_home_videoresource` VALUES ('373', '博人传 火影忍者新时代', 'http://r1.ykimg.com/0516000058DA1CB9ADBDD3AC9107E803', '//v.youku.com/v_show/id_XMzA5MDc4ODAyNA==.html', '暂无简介', '8.2', '未知', '三瓶由布子', '2017', '1,447', '更新至29集', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('374', '火影忍者 经典战役之卷', 'http://r1.ykimg.com/0516000059376766ADBDD388B9021CAA', '//v.youku.com/v_show/id_XMjgyODI4MDY3Mg==.html', '暂无简介', '7.9', '未知', '竹内顺子', '2017', '514.9', '168集全', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('375', '我的英雄学院 第二季', 'http://r1.ykimg.com/051600005911588CADBC09AA750E628E', '//v.youku.com/v_show/id_XMjY1OTc0NDUyNA==.html', '暂无简介', '8.7', '未知', '山下大辉', '2017', '203.2', '26集全', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('376', '欧布奥特曼剧场版:赐予我羁绊之力吧! 日配版', 'http://r1.ykimg.com/051600005975BEFBADBDD3A95009D6DC', '//v.youku.com/v_show/id_XMjkxNTQxMjIwNA==.html', '暂无简介', '5.5', '未知', '竹内顺子', '2017', '56.2', '1集全', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('377', '银魂 精选集', 'http://r1.ykimg.com/0516000058E77F98ADBAC365800F1380', '//v.youku.com/v_show/id_XMjY5MzAxMDMxNg==.html', '暂无简介', '8.1', '未知', '杉田智和', '2017', '13.8', '13集全', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('378', '火线传奇 第三季', 'http://r1.ykimg.com/0516000058F1982AADBDD3E39F0598DB', '//v.youku.com/v_show/id_XMjk0NDI2Njg5Mg==.html', '暂无简介', '7.6', '未知', '魅影之声', '2017', '11.2', '更新至13集', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('379', '怪物弹珠 第二季 消逝的宇宙篇', 'http://r1.ykimg.com/0516000059DD8D4EADBA1F1EE30CAB70', '//v.youku.com/v_show/id_XMzEwMDM0NTgzMg==.html', '暂无简介', '5.6', '未知', '小林裕介', '2017', '6.0', '更新至3集', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('380', '怪物弹珠 第二季', 'http://r1.ykimg.com/0516000059546629ADBC09B194025B94', '//v.youku.com/v_show/id_XMjg1NjUxNTg4MA==.html', '暂无简介', '8.9', '未知', '小林裕介', '2017', '3.8', '24集全', '日本', '热血[动漫]', '18');
INSERT INTO `video_home_videoresource` VALUES ('381', '非诚勿扰', 'http://img24.pplive.cn/2017/05/18/16441363829_230X306.jpg', 'http://v.pptv.com/show/aiaaLCXHXR4XoZs4.html?rcc_src=L1', '                     《非诚勿扰》是中国江苏卫视制作的一档大型生活服务类节目，由孟非担任主持，于2010年1月15日首播，每周六、日2...                            ', '8.0', '孟非', '无', '2016', '未知', '2017-10-21期', '未知', '江苏卫视[综艺]', '24');
INSERT INTO `video_home_videoresource` VALUES ('382', '相约星期六', 'http://img24.pplive.cn/2016/12/09/11403251316_230X306.jpg', 'http://v.pptv.com/show/SsUurBR66iaiaLCXE.html?rcc_src=L1', '                     它是一档每周一期、以爱情为主题的综艺节目，它是内地创办最早的电视婚恋节目。《相约星期六》创办至今已有七年的历史。...                            ', '9.0', '汪译男', '无', '2016', '未知', '2017-10-21期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('383', '下一站幸福', 'http://img24.pplive.cn/2013/08/28/15244777367_230X306.jpg', 'http://v.pptv.com/show/yj8Zlic9l1RN29Fw.html?rcc_src=L1', '                     四川电视台第二频道,川内首档直面困境人生选择节目《下一站幸福》2.18起周一至周五晚9点播出，选题、评论嘉宾征集...                            ', '8.3', '杨旭', '无', '2016', '未知', '2017-10-18期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('384', '爱情保卫战', 'http://img24.pplive.cn/2016/11/18/02000642735_230X306.jpg', 'http://v.pptv.com/show/ffVe3ESqGlia7OaE.html?rcc_src=L1', '                     天津卫视《爱情保卫战》每期选取三对有代表性的情侣，经“爱情初评判”、“丘比特问卷”、“旁观者清”、“黄金60秒”...                            ', '8.2', '赵川', '无', '2016', '未知', '2017-10-17期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('385', '幸福来敲门', 'http://img24.pplive.cn/2016/11/25/16161606725_230X306.jpg', 'http://v.pptv.com/show/74LvbdU7qiblMyjI.html?rcc_src=L1', '                     2012年天津卫视推出全国首档定制圆梦类栏目《幸福来敲门》，这是天津卫视新年推出的第一档全新节目，由周群和赵川主...                            ', '7.7', '周群', '无', '2016', '未知', '2017-10-17期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('386', '传奇故事', 'http://img24.pplive.cn/2014/05/13/14123962962_230X306.jpg', 'http://v.pptv.com/show/p2TNS7MZiaccqqBA.html?rcc_src=L1', '                     《传奇故事》每天22：00—22：30在江西卫视准时播出，周一至周日每天30分钟。节目口号为“每天一个故事，纵览...                            ', '9.1', '金飞', '无', '2016', '未知', '2017-10-19期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('387', '金牌调解', 'http://img24.pplive.cn/2016/11/18/02191536287_230X306.jpg', 'http://v.pptv.com/show/LcEysBhib7iayPDXU.html?rcc_src=L1', '                     《金牌调解》以调解纠纷、化解矛盾、促进和谐为宗旨，集最权威的金牌调解员和观察员队伍，集最独到的视角和观点，让观众...                            ', '8.6', '章亭', '无', '2016', '未知', '2017-10-16期', '未知', '婚恋情感[综艺]', '23');
INSERT INTO `video_home_videoresource` VALUES ('388', '非常完美', 'http://img24.pplive.cn/2016/11/17/22545964379_230X306.jpg', 'http://v.pptv.com/show/KNQ9uyOJibTeaGIA.html?rcc_src=L1', '                     由贵州卫视打造的大型时尚梦想秀，每周六22:10贵州卫视播出。                            ', '8.0', '陈怡', '无', '2016', '未知', '2017-10-11期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('389', '非常故事汇', 'http://img24.pplive.cn/2016/11/25/14300838583_230X306.jpg', 'http://v.pptv.com/show/NyWODHTaSojradE.html?rcc_src=L1', '                     《非常故事汇》是天择传媒旗下一档故事脱口秀，该节目有真实的故事为基础，是在纪实类专题节目的基础上再加工的脱口秀，...                            ', '8.0', '李锐', '无', '2016', '未知', '2017-09-22期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('390', '玫瑰之旅', 'http://img24.pplive.cn/2017/04/28/15250603482_230X306.jpg', 'http://v.pptv.com/show/51s1sxuB8SibSEHg.html?rcc_src=L1', '                     《玫瑰之旅》是一档恋爱交友观察类节目，该节目以相亲交友为纽带、以户外拍摄为载体、以中国传统婚恋观为依托，旨在为广...                            ', '8.0', '未知', '无', '2016', '未知', '2017-07-17期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('391', '歌从黄河来', 'http://img24.pplive.cn/2016/12/09/11325863079_230X306.jpg', 'http://v.pptv.com/show/ZOrGRKwSgsAjoQk.html?rcc_src=L1', '                     山西卫视《歌从黄河来》栏目，是全国省级卫视较少的民歌类音乐综艺栏目之一。全国首档专为老情歌爱好者搭建的一个平民化...                            ', '8.0', '雷璐', '无', '2016', '未知', '2017-10-21期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('392', '群英会', 'http://img24.pplive.cn/2015/02/04/16263333160_230X306.jpg', 'http://v.pptv.com/show/6kslowtx4RibCAGg.html?rcc_src=L1', '                     以讲述中国传统文化，普及中国传统文化知识为主要方向。每期两位主持人与生活在中国的六名各国青年将围绕一个有关于中国...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-18期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('393', '家庭幽默录像', 'http://img24.pplive.cn/2012/12/30/18061512454_230X306.jpg', 'http://v.pptv.com/show/9XDhX8ctndsibvCQ.html?rcc_src=L1', '                                                 ', '8.5', '刘仪伟', '无', '2016', '未知', '2017-10-16期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('394', '食鉴出真知', 'http://img24.pplive.cn/2016/01/06/16073927341_230X306.jpg', 'http://v.pptv.com/show/ZtTAPqYMfLodmwM.html?rcc_src=L1', '                     以美食为主题的生活实证服务类节目《食鉴出真知》模式介绍：在人们的日常生活中，关于吃的鉴别越来越成为关注的热点，更...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-05期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('395', '超强音浪第四季', 'http://img24.pplive.cn/2016/12/22/15092601526_230X306.jpg', 'http://v.pptv.com/show/vX5a2ECmFlS3NZ0.html?rcc_src=L1', '                     以“超强音浪 欢乐至上”为Slogan的《超强音浪》，肯定不会是传统的“明星唱歌”的歌友会形式，据爆料该节目可能...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-22期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('396', '家庭幽默录像', 'http://img24.pplive.cn/2012/12/30/18061512454_230X306.jpg', 'http://v.pptv.com/show/9XDhX8ctndsibvCQ.html?rcc_src=L1', '                                                 ', '8.5', '刘仪伟', '无', '2016', '未知', '2017-10-16期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('397', '脑残师兄第二季', 'http://img24.pplive.cn/2017/09/21/14502641241_230X306.jpg', 'http://v.pptv.com/show/0m1HxS2TA0GkIoo.html?rcc_src=L1', '                     脑残师兄第二季强势回归，作为公认暴走颜值最高节目，依然由变态男神pino和暴漫女神刘木子主持全局，新的一季，一大...                            ', '8.1', '未知', '无', '2016', '未知', '2017-10-19期', '未知', '搞笑幽默[综艺]', '25');
INSERT INTO `video_home_videoresource` VALUES ('398', '最强周边', 'http://img24.pplive.cn/2015/05/18/18170895055_230X306.jpg', 'http://v.pptv.com/show/NQicpZ881peNGxCw.html?rcc_src=L1', '                     《最强综艺》是PPTV聚力传媒出品的互联网综艺脱口秀。盘点上周综艺节目中的爆笑时刻，解析热门节目的最强看点。                            ', '8.1', '未知', '无', '2016', '未知', '2017-09-18期', '未知', '搞笑幽默[综艺]', '25');
INSERT INTO `video_home_videoresource` VALUES ('399', 'wuli实验室', 'http://img24.pplive.cn/2017/08/04/09545920267_230X306.jpg', 'http://v.pptv.com/show/TfTgXsYsnNo9uyM.html?rcc_src=L1', '                     《wuli实验室》是由龙珠直播出品的一档直播综艺实验秀，每周五播出。                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-13期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('400', '跨界喜剧王第二季', 'http://img24.pplive.cn/2017/07/31/14413524734_230X306.jpg', 'http://v.pptv.com/show/wHpW1DyiaElCzMZk.html?rcc_src=L1', '                     《跨界喜剧王》作为北京卫视第三季度的重榜节目，以“跨界，我为快乐而来”为核心，将继续引领“跨界”风潮，极致打造“...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-14期', '未知', '真人秀[综艺]', '26');
INSERT INTO `video_home_videoresource` VALUES ('401', '超级搞搞震', 'http://img24.pplive.cn/2013/01/12/11144112999_230X306.jpg', 'http://v.pptv.com/show/83rXVb0jk9E0sho.html?rcc_src=L1', '                     南方电视台综艺频道的《超级搞搞震》通过全新包装闪亮登场，重锤打造富有本土特色的《超级无敌奖门人》。                            ', '8.2', '曾志伟', '无', '2016', '未知', '2017-07-28期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('402', '年代秀2017', 'http://img24.pplive.cn/2017/05/27/15462048659_230X306.jpg', 'http://v.pptv.com/show/kaiaEAmrQQH7hX8c.html?rcc_src=L1', '                     该节目引进国外大热综艺节目《Generation show》的模式，不仅包含游戏竞赛，并且结合影像、实物、音乐表...                            ', '9.0', '赵屹鸥', '无', '2016', '未知', '2017-07-28期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('403', '喜乐街第二季', 'http://img24.pplive.cn/2017/05/12/14215598141_230X306.jpg', 'http://v.pptv.com/show/Oic7aWMAmltQ3tR0.html?rcc_src=L1', '                     《喜乐街》虽同为全明星的真人秀栏目，却不以明星间的搞怪耍宝、游戏竞技为主，而是明星根据导演指令进行即兴表演，展现...                            ', '8.0', '王雪纯', '无', '2016', '未知', '2015-09-20期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('404', '喜乐街第一季', 'http://img24.pplive.cn/2017/05/12/14184107126_230X306.jpg', 'http://v.pptv.com/show/OvicZV78lldM2tBw.html?rcc_src=L1', '                     《喜乐街》是中央电视台重磅打造的即兴喜剧真人秀节目，在《喜乐街》中，所有人物都以真名、真实个性出演是一档即兴表演...                            ', '8.0', '王雪纯', '无', '2016', '未知', '2014-09-12期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('405', 'CCTV家庭幽默大赛第二季', 'http://img24.pplive.cn/2017/05/12/14124716879_230X306.jpg', 'http://v.pptv.com/show/OQDsatI4qOZJxy8.html?rcc_src=L1', '                     《CCTV家庭幽默大赛》第二季是中央电视台第一套节目综合频道每年开年期间推出的一档季播幽默视频互动节目。首季节目...                            ', '8.0', '未知', '无', '2016', '未知', '2016-09-21期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('406', '王尼美快报第二季', 'http://img24.pplive.cn/2017/04/27/10182790872_230X306.jpg', 'http://v.pptv.com/show/0GhEwiaqQAD6hH4c.html?rcc_src=L1', '                     王尼玛的妹妹。生性懒散，学生时代曾经是“学霸”，因嫌找工作太麻烦，毕业后到哥哥王尼玛的公司入职。然而仗着与王尼玛...                            ', '8.0', '未知', '无', '2016', '未知', '2017-08-24期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('407', '今夜百乐门', 'http://img24.pplive.cn/2016/09/13/15320447930_230X306.jpg', 'http://v.pptv.com/show/MwTwbtY8rOpNyzM.html?rcc_src=L1', '                     今夜百乐门，周六最销魂！好看好玩好笑，使尽全身洪荒之力，只为让你开怀一笑！金句女王金星携手搭档百变星君王祖藍 ，...                            ', '8.2', '王祖蓝', '无', '2016', '未知', '2016-12-10期', '未知', '东方卫视[综艺]', '19');
INSERT INTO `video_home_videoresource` VALUES ('408', '跨界喜剧王', 'http://img24.pplive.cn/2016/11/09/17463612068_230X306.jpg', 'http://v.pptv.com/show/ADMdmwNp2Rd6ibGA.html?rcc_src=L1', '                     《跨界喜剧王》是中国首档原创明星跨界喜剧竞技秀，节目将聚集商界、文化界、体育界、音乐界、演艺界等各领域的代表人物...                            ', '8.0', '小沈阳', '无', '2016', '未知', '2016-12-03期', '未知', '北京卫视[综艺]', '20');
INSERT INTO `video_home_videoresource` VALUES ('409', '快乐三兄弟', 'http://img24.pplive.cn/2013/03/27/15033413386_230X306.jpg', 'http://v.pptv.com/show/Cgpn5U2zI2HEQqo.html?rcc_src=L1', '                                                 ', '8.0', '潘前卫', '无', '2016', '未知', '2016-02-05期', '未知', '大陆综艺[综艺]', '21');
INSERT INTO `video_home_videoresource` VALUES ('410', '非常欢乐', 'http://img24.pplive.cn/2014/02/11/18464236978_230X306.jpg', 'http://v.pptv.com/show/3D4amABm1hR39V0.html?rcc_src=L1', '                     《非常欢乐》是贵州卫视新推出的一档全民娱乐脱口秀节目。搜罗最搞怪的囧事、最欢喜的明星组合、最炫的幽默录像，每期节...                            ', '8.0', '方清平', '无', '2016', '未知', '2015-12-31期', '未知', '搞笑幽默[综艺]', '25');
INSERT INTO `video_home_videoresource` VALUES ('411', '东方电影报道', 'http://img24.pplive.cn/2014/06/10/19102891430_230X306.jpg', 'http://v.pptv.com/show/ePxV0zuhEUibyMJg.html?rcc_src=L1', '                     上海唯一一家全年日播的电影资讯类节目——《东方电影报道》。东方电影频道每晚23:30首播，次日中午12:00重播...                            ', '8.0', '楚天', '无', '2016', '未知', '2017-10-23期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('412', '新娱乐在线', 'http://img24.pplive.cn/2012/12/30/17011805415_230X306.jpg', 'http://v.pptv.com/show/YiaGSEHjeTozvbdU.html?rcc_src=L1', '                     全新的电视娱乐新闻杂志，让你在第一时间了解全球文化娱乐的热点动态，“一样的娱乐新闻，不一样的报道角度”。  　　...                            ', '7.4', '万蒂妮', '无', '2016', '未知', '2017-10-23期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('413', '娱乐乐翻天', 'http://img24.pplive.cn/2013/03/26/15215797181_230X306.jpg', 'http://v.pptv.com/show/SwFy8FiaibLmzPTbU.html?rcc_src=L1', '                     《娱乐乐翻天》是东南卫视娱乐新闻的拳头产品，是两岸三地娱乐界互动的娱乐资讯节目。                            ', '8.3', '古晓', '无', '2016', '未知', '2017-10-23期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('414', '来自星星的事', 'http://img24.pplive.cn/2014/06/04/17502024243_230X306.jpg', 'http://v.pptv.com/show/YvrWVLwiaktAzsRk.html?rcc_src=L1', '                     节目由庹宗康主持，来宾由冥界大师和资深专家构成。每周更有明星嘉宾参加，讲述自己或身边人经历的真人真事。                            ', '8.0', '庹宗康', '无', '2016', '未知', '2017-10-20期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('415', '精彩老朋友', 'http://img24.pplive.cn/2016/08/24/19200498761_230X306.jpg', 'http://v.pptv.com/show/y1UicvSWLibzmcGoI.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2017-10-14期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('416', '娱乐星天地', 'http://img24.pplive.cn/2012/08/24/15204903759_230X306.jpg', 'http://v.pptv.com/show/Hxp39V3DM3HUUro.html?rcc_src=L1', '                     《娱乐星天地》是一档全新的娱乐资讯节目，以及时迅捷报道娱乐新闻、深度挖掘娱乐事件、自由热情的播报分享为主要特色，...                            ', '7.1', '陈辰', '无', '2016', '未知', '2017-10-13期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('417', '陈辰全民星', 'http://img24.pplive.cn/2011/11/03/10195842196_230X306.jpg', 'http://v.pptv.com/show/GBJicicWXLO3ncWsI.html?rcc_src=L1', '                     　《陈辰全明星》是一档极具主持人个人特点的明星访谈栏目，也是一种全新的访谈方式与风格的尝试。与许多明星访谈不同，...                            ', '8.0', '陈辰', '无', '2016', '未知', '2017-04-03期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('418', '36.7明星听诊会', 'http://img24.pplive.cn/2012/02/17/15515238992_230X306.jpg', 'http://v.pptv.com/show/Sb8Ukvpg0A5x71c.html?rcc_src=L1', '                     健康与明星的近距离接触。                            ', '8.1', '未知', '无', '2016', '未知', '2017-03-16期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('419', '电影大事件', 'http://img24.pplive.cn/2012/03/27/10000593297_230X306.jpg', 'http://v.pptv.com/show/ibnPgXsYsnNo9uyM.html?rcc_src=L1', '                     2012年1月2日，电影明星娱乐事件的深度报道栏目——《电影大事件》正式登陆综艺频道TVS3黄金档。每期节目将对...                            ', '8.1', '朱天华', '无', '2016', '未知', '2016-12-21期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('420', '娱乐梦工厂', 'http://img24.pplive.cn/2013/07/30/18441540452_230X306.jpg', 'http://v.pptv.com/show/PzUfnQVr2xl8ibmI.html?rcc_src=L1', '                     全新的娱乐资讯类节目《娱乐梦工厂》正式登陆浙江卫视，于每天下午17点28分和观众见面。《娱乐梦工厂》由上海灿星制...                            ', '8.0', '长庚', '无', '2016', '未知', '2016-10-06期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('421', '娱乐星周刊', 'http://img24.pplive.cn/2014/04/24/15290096631_230X306.jpg', 'http://v.pptv.com/show/0Uslowtx4RibCAGg.html?rcc_src=L1', '                     这是一档全新的中国娱乐电视脱口秀，每周一次，对中国娱乐圈的大事、怪事、新鲜事，对明星们的好事、坏事、尴尬事，以电...                            ', '8.0', '未知', '无', '2016', '未知', '2014-12-28期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('422', '华娱米饭', 'http://img24.pplive.cn/2014/05/13/16122047185_230X306.jpg', 'http://v.pptv.com/show/cdFCwCiaOicjyfHYU.html?rcc_src=L1', '                                                 ', '8.2', '未知', '无', '2016', '未知', '2014-12-17期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('423', 'SNHello星萌学院', 'http://img24.pplive.cn/2014/09/05/13562517219_230X306.jpg', 'http://v.pptv.com/show/Gzchnwdt3RtibicGQ.html?rcc_src=L1', '                     一群来自全国的花季少女，如何怀抱逐梦舞台的美好理想，经历汗水与泪水的洗礼，终于成长为万众瞩目的青春偶像——备受期...                            ', '7.9', '未知', '无', '2016', '未知', '2014-10-17期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('424', '带你看星星', 'http://img24.pplive.cn/2014/05/06/10282458588_230X306.jpg', 'http://v.pptv.com/show/UsyoJo70ZKIFgibs.html?rcc_src=L1', '                     《带你看星星》江苏卫视即将推出一档纪实外拍的韩国文化探访节目，遍访韩国娱乐明星、制作人、作家和电视剧制播机构，探...                            ', '8.2', '张纯烨', '无', '2016', '未知', '2014-05-26期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('425', '娱乐加油赞', 'http://img24.pplive.cn/2013/07/11/16480522392_230X306.jpg', 'http://v.pptv.com/show/ZevFQ6sRgb8iaoAg.html?rcc_src=L1', '                     5月6日起每晚22点至22点30分，厦门卫视将为全国5亿观众倾情奉献一档全新的娱乐资讯类节目——《娱乐加油赞》。                            ', '8.0', '毛晓奕', '无', '2016', '未知', '2014-04-17期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('426', '我爱台魅', 'http://v.img.pplive.cn/sp121/1f/23/1f23075649990f7cf341aae2390e2b03/3.jpg', 'http://v.pptv.com/show/Chp39V3DM3HUUro.html?rcc_src=L1', '                                                 ', '8.6', '未知', '无', '2016', '未知', '2014-02-21期', '未知', '娱乐八卦[综艺]', '22');
INSERT INTO `video_home_videoresource` VALUES ('427', '美食好简单', 'http://img24.pplive.cn/2016/08/25/21002032359_230X306.jpg', 'http://v.pptv.com/show/6nbbWcEnl9U4th4.html?rcc_src=L1', '                     台湾一档美食栏目，节目主持郁芳、主厨温国智每期教你制作一种精品美食。                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-23期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('428', '蔚蓝的故乡', 'http://img24.pplive.cn/2016/12/20/17075489112_230X306.jpg', 'http://v.pptv.com/show/Q9C8OqIIeLYZlic8.html?rcc_src=L1', '                     《蔚蓝的故乡》是内蒙古电视台开办的一档以草原文化为核心，展现北方地区自然风貌及各民族人文风情和民族风情的文化类栏...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-20期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('429', '食来运转', 'http://img24.pplive.cn/2014/04/24/18064064871_230X306.jpg', 'http://v.pptv.com/show/cI9591icFNXPWVLw.html?rcc_src=L1', '                     一档家庭益智竞猜与饮食文化相结合的轻松节目，在介绍美食的同时，通过主持人与膳食专家的对话、家庭成员之间与饮食相关...                            ', '8.3', '项晖', '无', '2016', '未知', '2017-10-20期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('430', '旅游卫视行者', 'http://img24.pplive.cn/2014/07/24/19072255186_230X306.jpg', 'http://v.pptv.com/show/ROXPTbUbia8ksqhI.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2017-10-19期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('431', '唱响武汉', 'http://img24.pplive.cn/2016/12/16/17495300129_230X306.jpg', 'http://v.pptv.com/show/U82nJY3zY6EEguo.html?rcc_src=L1', '                     每期节目一个主题，围绕主题，从武汉题材的歌曲引入，以与武汉相关的知识普及和传播为诉求，融武汉的人文、历史、地理、...                            ', '8.0', '未知', '无', '2016', '未知', '2017-10-17期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('432', '食色生香', 'http://img24.pplive.cn/2017/06/30/14194618369_230X306.jpg', 'http://v.pptv.com/show/90ompAxy4iaCDAWk.html?rcc_src=L1', '                     “民以食为天”，谈到美食，每个人都会有不同的记忆，老百姓也越来越重视美食享受，眷恋茶饭时光。《食色生香》是一档集...                            ', '8.1', '未知', '无', '2016', '未知', '2017-10-21期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('433', '小荷的下午茶', 'http://img24.pplive.cn/2014/06/06/19264976119_230X306.jpg', 'http://v.pptv.com/show/cibvFQ6sRgb8iaoAg.html?rcc_src=L1', '                     《小荷的下午茶》是一档育儿谈话、美食、互动类节目，以“下午茶”的概念营造轻松活泼的谈话氛围，以解决育儿问题、增进...                            ', '8.0', '未知', '无', '2016', '未知', '2017-01-07期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('434', '疯狂的冰箱', 'http://img24.pplive.cn/2016/12/16/11143430471_230X306.jpg', 'http://v.pptv.com/show/NPicZV78lldM2tBw.html?rcc_src=L1', '                     《疯狂的冰箱》是一档美食综艺脱口秀节目。节目中邀请了多位中西餐以及甜品界的著名大厨作为嘉宾，其中有邱琼（中国顶级...                            ', '8.0', '万蒂妮', '无', '2016', '未知', '2016-10-14期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('435', '天天好生活', 'http://img24.pplive.cn/2014/05/26/16155406251_230X306.jpg', 'http://v.pptv.com/show/8WpGxCySAkCjIYk.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2016-07-14期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('436', '洋厨房', 'http://img24.pplive.cn/2014/04/24/17422568538_230X306.jpg', 'http://v.pptv.com/show/va4DgelPvic1g3kY.html?rcc_src=L1', '                     《洋厨房》是从2002年7月7日开始，推出的一档全新理念的时尚类服务性栏目，云集了上海一流的厨师，汇萃了世界各地...                            ', '8.2', 'Heidi Dugan', '无', '2016', '未知', '2016-02-18期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('437', '快乐旅行', 'http://img24.pplive.cn/2013/03/21/15594512216_230X306.jpg', 'http://v.pptv.com/show/Pia2GBGzSQoDjYck.html?rcc_src=L1', '                     《快乐旅行》节目简介：以“心灵视野、知性体验”为宗旨的全新旅行电视节目——《快乐旅行》于10月25日起在广州电视...                            ', '8.0', '未知', '无', '2016', '未知', '2016-01-09期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('438', '康宁心煮艺', 'http://img24.pplive.cn/2012/02/05/11545679726_230X306.jpg', 'http://v.pptv.com/show/Bv9U0jqgEE6xL5c.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2016-01-01期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('439', '天地长白', 'http://img24.pplive.cn/2014/09/15/11340282890_230X306.jpg', 'http://v.pptv.com/show/bcexL5f9basOjPQ.html?rcc_src=L1', '                     《天地长白》系列纪录片，是吉林电视台在2014年强势推出的一档精品栏目，按照吉林省委宣传部的要求，该纪录片要将长...                            ', '8.0', '未知', '无', '2016', '未知', '2015-12-27期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('440', '美食大王牌', 'http://img24.pplive.cn/2014/04/24/16583459284_230X306.jpg', 'http://v.pptv.com/show/belKyDCWBkSnJY0.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2015-09-26期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('441', '看今天', 'http://img24.pplive.cn/2012/02/08/14034600677_230X306.jpg', 'http://v.pptv.com/show/ffhZ1ziblFVO2NJw.html?rcc_src=L1', '                                                 ', '8.1', '未知', '无', '2016', '未知', '2015-09-06期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('442', '华夏厨道', 'http://img24.pplive.cn/2014/05/12/14105078728_230X306.jpg', 'http://v.pptv.com/show/LzAcmgJo2BZ5918.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2015-08-27期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('443', '大佬辉出街', 'http://img24.pplive.cn/2016/08/22/18484053675_230X306.jpg', 'http://v.pptv.com/show/ibHXeXMQqmtg7uSE.html?rcc_src=L1', '                     广州经济    20:00-20:30                            ', '8.0', '未知', '无', '2016', '未知', '2015-03-17期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('444', '带着爸妈去旅行', 'http://img24.pplive.cn/2014/12/15/16590223047_230X306.jpg', 'http://v.pptv.com/show/tZF7ibWHHN3XYVr4.html?rcc_src=L1', '                     《带着爸妈去旅行》是江西卫视打造的一档大型明星亲情孝道真人秀节目。[1] 是江西卫视围绕“情暖中国”新定位打响的...                            ', '8.1', '未知', '无', '2016', '未知', '2015-03-08期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('445', '天天家常菜', 'http://img24.pplive.cn/2014/05/26/16200443169_230X306.jpg', 'http://v.pptv.com/show/8m1HxS2TA0GkIoo.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2015-01-12期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('446', '生活接力棒', 'http://img24.pplive.cn/2014/05/13/15551756997_230X306.jpg', 'http://v.pptv.com/show/sLwVkicth0Q9y8Fg.html?rcc_src=L1', '                                                 ', '8.0', '未知', '无', '2016', '未知', '2014-12-26期', '未知', '美食旅游[综艺]', '27');
INSERT INTO `video_home_videoresource` VALUES ('457', '戚薇 - 回转木马的孤单', 'http://pic9.qiyipic.com/image/20171023/c0/db/v_113750232_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre1s29c.html', '暂无简介', '77.18', '戚薇', '无', '2017-10-23', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('458', '李荣浩 - 祝你幸福', 'http://pic4.qiyipic.com/image/20171016/83/f2/v_113703477_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre41q0w.html', '暂无简介', '65.05', '李荣浩', '无', '2017-10-16', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('459', '鹿晗 - 心率（Like a dream）', 'http://pic4.qiyipic.com/image/20170929/ae/85/v_113596477_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8rnmyc.html', '暂无简介', '61.5', '鹿晗', '无', '2017-09-29', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('460', 'PG ONE - 中二病 Remix', 'http://pic2.qiyipic.com/image/20171013/3c/47/v_113684527_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdvcrlc.html', '暂无简介', '59.71', 'PG ONE', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('461', '周笔畅 - Fascination', 'http://pic3.qiyipic.com/image/20170905/8a/56/v_113339211_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8wi1q0.html', '暂无简介', '59.38', '周笔畅', '无', '2017-09-05', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('462', '张艺兴 - SHEEP', 'http://pic4.qiyipic.com/image/20171007/f7/21/v_113641339_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdxs31o.html', '暂无简介', '57.28', '张艺兴', '无', '2017-10-07', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('463', '汪峰 - 那年我五岁', 'http://pic3.qiyipic.com/image/20171012/36/6a/v_113674996_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdw6704.html', '暂无简介', '56.22', '汪峰', '无', '2017-10-12', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('464', '李荣浩 - 我看着你的时候', 'http://pic3.qiyipic.com/image/20170926/24/bb/v_113562121_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8teq74.html', '暂无简介', '55.51', '李荣浩', '无', '2017-09-26', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('465', 'SNH48 - 绚丽时代', 'http://pic4.qiyipic.com/image/20171013/e6/c4/v_113682024_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdwgr40.html', '暂无简介', '54.2', 'SNH48', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('466', '鹿晗 - 追梦赤子心 电影《空天猎》片尾曲', 'http://pic3.qiyipic.com/image/20170907/38/fe/v_113359266_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr955xls.html', '暂无简介', '54.13', '鹿晗', '无', '2017-09-07', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('467', 'Alan Walker - The Spectre', 'http://pic4.qiyipic.com/image/20170915/de/db/v_113450560_m_601_m2_192_108.jpg', 'http://www.iqiyi.com/v_19rr8pbcl8.html', '暂无简介', '52.92', 'Alan Walker', '无', '2017-09-15', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('468', 'Maroon 5 & SZA - What Lovers Do', 'http://pic7.qiyipic.com/image/20170929/be/15/v_113594450_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8rhq1g.html', '暂无简介', '52.42', 'Maroon 5 & SZA', '无', '2017-09-29', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('469', 'Charli XCX - Boys', 'http://pic9.qiyipic.com/image/20170727/63/24/v_112942687_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8fm8l0.html', '暂无简介', '50.68', 'Charli XCX', '无', '2017-07-27', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('470', 'Imagine Dragons - Whatever It Takes', 'http://pic6.qiyipic.com/image/20171013/d3/fb/v_113681450_m_601_m1_192_108.jpg', 'http://www.iqiyi.com/v_19rrdvbios.html', '暂无简介', '50.46', 'Imagine Dragons', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('471', 'Sam Smith - Too Good At Goodbye', 'http://pic0.qiyipic.com/image/20170919/87/f9/v_113489218_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8nxxg0.html', '暂无简介', '50.46', 'Sam Smith', '无', '2017-09-19', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('472', 'Taylor Swift - Look What You Made Me Do', 'http://pic1.qiyipic.com/image/20170828/dd/5f/v_113258279_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr86i244.html', '暂无简介', '50.39', 'Taylor Swift', '无', '2017-08-28', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('473', 'Jessie J - Not My Ex', 'http://pic5.qiyipic.com/image/20171013/4b/5c/v_113685190_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdvh13w.html', '暂无简介', '50.37', 'Jessie J', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('474', 'P!nk - What About Us', 'http://pic3.qiyipic.com/image/20170817/e2/11/v_113146686_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr83u1yw.html', '暂无简介', '50.27', 'P!nk', '无', '2017-08-17', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('475', 'OneRepublic - Rich Love', 'http://pic4.qiyipic.com/image/20170930/cc/05/v_113605054_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8qzm78.html', '暂无简介', '50.23', 'OneRepublic', '无', '2017-09-30', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('476', 'GOT7 - You Are', 'http://pic9.qiyipic.com/image/20171011/27/37/v_113665471_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdwrh7c.html', '暂无简介', '50.57', 'GOT7', '无', '2017-10-11', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('477', 'UP10TION - Going Crazy', 'http://pic7.qiyipic.com/image/20171012/5b/3b/v_113678071_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdw8ak8.html', '暂无简介', '50.4', 'UP10TION', '无', '2017-10-12', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('478', '泫雅 - BABE', 'http://pic6.qiyipic.com/image/20170829/7e/e4/v_113275019_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr908o4g.html', '暂无简介', '50.23', '泫雅', '无', '2017-08-29', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('479', 'The Unit - Last one', 'http://pic2.qiyipic.com/image/20171022/48/f4/v_113745282_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre2q72g.html', '暂无简介', '50.23', 'The Unit', '无', '2017-10-22', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('480', '脸红的思春期 - Some', 'http://pic9.qiyipic.com/image/20170928/94/4d/v_113589672_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8r70rk.html', '暂无简介', '50.21', '脸红的思春期', '无', '2017-09-28', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('481', '防弹少年团 - DNA', 'http://pic0.qiyipic.com/image/20170918/87/54/v_113483537_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8nj94s.html', '暂无简介', '50.18', '防弹少年团', '无', '2017-09-18', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('482', 'GFRIEND - SUMMER RAIN', 'http://pic0.qiyipic.com/image/20170913/a8/99/v_113430447_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr90n6m0.html', '暂无简介', '50.17', 'GFRIEND', '无', '2017-09-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('483', 'Highlight - Can Be Better', 'http://pic0.qiyipic.com/image/20171017/f5/06/v_113710442_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre4g72c.html', '暂无简介', '50.14', 'Highlight', '无', '2017-10-17', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('484', '宣美 - Gashina', 'http://pic2.qiyipic.com/image/20170822/22/90/v_113198057_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rr8alv7s.html', '暂无简介', '50.11', '宣美', '无', '2017-08-22', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('485', 'Aimer - 花の唄', 'http://pic4.qiyipic.com/image/20171017/c8/75/v_113712754_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre4i5cc.html', '暂无简介', '50.09', 'Aimer', '无', '2017-10-17', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('486', '蒼井翔太 - 零', 'http://pic4.qiyipic.com/image/20171013/40/23/v_113684853_m_601_m3_192_108.jpg', 'http://www.iqiyi.com/v_19rrdvddd4.html', '暂无简介', '50.06', '蒼井翔太', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('487', '欅坂46 - 風に吹かれても', 'http://pic2.qiyipic.com/image/20171017/48/ce/v_113712783_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre4i11w.html', '暂无简介', '50.05', '欅坂46', '无', '2017-10-17', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('488', 'PORTUGAL.THE MAN - FEEL IT STILL', 'http://pic6.qiyipic.com/image/20171011/ba/54/v_113667818_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdwwxkg.html', '暂无简介', '50.05', 'PORTUGAL.THE MAN', '无', '2017-10-11', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('489', '宇多田光 - Forevermore', 'http://pic9.qiyipic.com/image/20171010/8b/d0/v_113656552_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdxhezw.html', '暂无简介', '50.05', '宇多田光', '无', '2017-10-10', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('490', 'TWICE - One More Time 日文版', 'http://pic4.qiyipic.com/image/20171011/4c/eb/v_113667753_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdwx51s.html', '暂无简介', '50.04', 'TWICE', '无', '2017-10-11', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('491', 'ゆず - 恋、弾けました', 'http://pic3.qiyipic.com/image/20171016/ee/f3/v_113704712_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre40jl0.html', '暂无简介', '50.03', 'ゆず', '无', '2017-10-16', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('492', '林青空 - だけど私 そんな私', 'http://pic6.qiyipic.com/image/20171017/a2/2b/v_113712761_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rre4i36o.html', '暂无简介', '50.02', '林青空', '无', '2017-10-17', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('493', '96猫 - Primitive emotion', 'http://pic6.qiyipic.com/image/20171013/5d/f4/v_113684857_m_601_192_108.jpg', 'http://www.iqiyi.com/v_19rrdvdnoc.html', '暂无简介', '50.02', '96猫', '无', '2017-10-13', '暂无', '无', '暂无', '音乐[MV]', '17');
INSERT INTO `video_home_videoresource` VALUES ('494', '社会新闻', 'http://pic7.qiyipic.com/image/20171024/88/8d/v_113757325_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre233iw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '成都商场土豪姐狂刷400万 结账拉警戒线', '无', '无', '无', '                2017-10-24        ', '    01:02', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('495', '社会新闻', 'http://pic9.qiyipic.com/image/20171024/4c/60/v_113757925_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y8dw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', 'C罗蝉联世界足球先生  皇马成大赢家', '无', '无', '无', '                2017-10-24        ', '    01:57', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('496', '社会新闻', 'http://pic9.qiyipic.com/image/20171024/33/1d/v_113757277_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22xog.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '糗！司仪婚礼说错话遭新娘扇耳光', '无', '无', '无', '                2017-10-24        ', '    01:02', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('497', '社会新闻', 'http://pic6.qiyipic.com/image/20171024/d8/b4/v_113755210_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre21jos.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '震撼!特警车队路口处集体礼让路人 网友点赞', '无', '无', '无', '                2017-10-24        ', '    01:30', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('498', '社会新闻', 'http://pic5.qiyipic.com/image/20171024/fc/41/v_113756430_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre23ksk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '鸵鸟伸头进车窗狂吃 女游客吓坏不停尖叫', '无', '无', '无', '                2017-10-24        ', '    01:01', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('499', '社会新闻', 'http://pic8.qiyipic.com/image/20171024/d2/22/v_113757948_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y9uw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '江苏:斑鸠窗台筑巢产子 居民拍下全过程', '无', '无', '无', '                2017-10-24        ', '    01:25', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('500', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/0e/a9/v_113758329_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0we8c.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '协警修路成网红', '无', '无', '无', '                2017-10-24        ', '    01:47', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('501', '社会新闻', 'http://pic9.qiyipic.com/image/20171024/00/67/v_113757677_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xbso.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '外地救护车顺道救人交警开道护送就医', '无', '无', '无', '                2017-10-24        ', '    02:43', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('502', '社会新闻', 'http://pic1.qiyipic.com/image/20171024/46/ff/v_113756050_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre201rs.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '不到六点起床排队上自习 考研党拼尽全力搏未来', '无', '无', '无', '                2017-10-24        ', '    01:01', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('503', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/78/9a/v_113757544_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xu6o.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '&quot;复兴号&rdquo;运营满月', '无', '无', '无', '                2017-10-24        ', '    00:22', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('504', '社会新闻', 'http://pic9.qiyipic.com/image/20171021/90/5c/v_113741852_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2i3u4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '珠江新闻眼20171021', '无', '无', '无', '                2017-10-24        ', '    43:54', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('505', '社会新闻', 'http://pic7.qiyipic.com/image/20171024/44/73/v_113758243_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0w9nk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '晚高峰孕妇遇险   特警打开生命通道', '无', '无', '无', '                2017-10-24        ', '    02:21', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('506', '社会新闻', 'http://pic8.qiyipic.com/image/20171024/6f/fb/v_113755665_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1z9hg.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国企业造出航空发动机核心部件', '无', '无', '无', '                2017-10-24        ', '    01:04', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('507', '社会新闻', 'http://pic1.qiyipic.com/image/20171023/ba/43/v_113751385_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1qv2c.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '法治进行时20171023', '无', '无', '无', '                2017-10-24        ', '    47:10', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('508', '社会新闻', 'http://pic4.qiyipic.com/image/20171024/35/9f/v_113757971_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0yb60.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '加油站员工反应迅速  成功处置险情', '无', '无', '无', '                2017-10-24        ', '    01:43', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('509', '社会新闻', 'http://pic2.qiyipic.com/image/20171024/a6/42/v_113757696_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xdlo.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '南京:警犬累到打盹 又萌又令人心疼', '无', '无', '无', '                2017-10-24        ', '    02:10', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('510', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/01/32/v_113758323_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0wep0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '大罐车行驶中突然着火 民警及时发现化险为夷', '无', '无', '无', '                2017-10-24        ', '    02:11', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('511', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/0f/b5/v_113757230_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre236qw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '20岁小伙力克20多国选手，成世界技能大赛冠军', '无', '无', '无', '                2017-10-24        ', '    01:26', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('512', '社会新闻', 'http://pic4.qiyipic.com/image/20171021/11/25/v_113741909_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2ghk0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '今日最新闻20171021', '无', '无', '无', '                2017-10-24        ', '    29:24', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('513', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/7e/c6/v_113755652_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre1z9zc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '坐着公交赏美景 观光2线逛遍北京中心区', '无', '无', '无', '                2017-10-24        ', '    03:28', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('514', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/75/75/v_113757483_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22py0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '孕妇挺着肚子进电梯 带着宝宝出来了', '无', '无', '无', '                2017-10-24        ', '    00:46', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('515', '社会新闻', 'http://pic3.qiyipic.com/image/20171020/37/f1/v_113738458_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre28i9g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '共青团新闻联播十九大特别报道', '无', '无', '无', '                2017-10-24        ', '    08:22', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('516', '社会新闻', 'http://pic0.qiyipic.com/image/20171024/2c/00/v_113757641_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xnlc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '行驶罐车突然着火  民警发现化险为夷', '无', '无', '无', '                2017-10-24        ', '    01:11', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('517', '社会新闻', 'http://pic8.qiyipic.com/image/20171021/ad/72/v_113741912_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2gh2o.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '军情解码20171021', '无', '无', '无', '                2017-10-24        ', '    57:25', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('518', '社会新闻', 'http://pic1.qiyipic.com/image/20171021/d7/3d/v_113742208_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2g1iw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '今日关注20171021', '无', '无', '无', '                2017-10-24        ', '    28:43', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('519', '社会新闻', 'http://pic9.qiyipic.com/image/20171024/47/8e/v_113757907_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0yj6g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '爱的手势舞 一对八旬老夫妻走红网络', '无', '无', '无', '                2017-10-24        ', '    00:54', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('520', '社会新闻', 'http://pic1.qiyipic.com/image/20171024/30/89/v_113757785_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0x7hc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '闹市街头藏酱油铺   怀旧方式引人回忆', '无', '无', '无', '                2017-10-24        ', '    02:26', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('521', '社会新闻', 'http://pic3.qiyipic.com/image/20171024/1a/bf/v_113757530_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xs9c.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '大会通过十八届中央委员会报告的决议', '无', '无', '无', '                2017-10-24        ', '    00:19', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('522', '社会新闻', 'http://pic9.qiyipic.com/image/20171024/1c/90/v_113756928_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22i6g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '空姐从2.7米高舱门摔骨折 或在开关舱门时失足', '无', '无', '无', '                2017-10-24        ', '    01:01', '无', '暂无', '社会[资讯]', '30');
INSERT INTO `video_home_videoresource` VALUES ('523', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/e1/4a/v_113756754_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre247zw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '最安全的无扇叶风扇，再也不用担心熊孩子了', '无', '无', '无', '                2017-10-24        ', '    01:52', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('524', '科技新闻', 'http://pic1.qiyipic.com/image/20171024/ba/f2/v_113755745_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1z39o.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '这是世界上首座3D打印的混凝土桥梁', '无', '无', '无', '                2017-10-24        ', '    01:38', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('525', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/ef/af/v_113758431_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0vzq0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '突尼斯期待中医本土化', '无', '无', '无', '                2017-10-24        ', '    01:17', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('526', '科技新闻', 'http://pic9.qiyipic.com/image/20171024/b3/8d/v_113758395_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0w9ew.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '金秋红柿又飘香', '无', '无', '无', '                2017-10-24        ', '    00:59', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('527', '科技新闻', 'http://pic2.qiyipic.com/image/20171024/70/73/v_113757487_m_601_m3_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xpgo.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大今日上午9时举行闭幕会', '无', '无', '无', '                2017-10-24        ', '    00:31', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('528', '科技新闻', 'http://pic9.qiyipic.com/image/20171024/f3/45/v_113759066_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre106fc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党第十九届中央委员会委员名单', '无', '无', '无', '                2017-10-24        ', '    07:05', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('529', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/8e/55/v_113757461_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre22o10.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '第十九届中央委员会和中央纪律检查委员会产生', '无', '无', '无', '                2017-10-24        ', '    00:25', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('530', '科技新闻', 'http://pic4.qiyipic.com/image/20171024/60/bd/v_113759081_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre107sk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党第十九届中央委员会候补委员名单', '无', '无', '无', '                2017-10-24        ', '    06:43', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('531', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/f7/16/v_113757625_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xlo0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '全球 首列智轨公交列车开跑', '无', '无', '无', '                2017-10-24        ', '    00:33', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('532', '科技新闻', 'http://pic2.qiyipic.com/image/20171024/d7/c4/v_113757896_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0ygkg.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党十九大胜利闭幕', '无', '无', '无', '                2017-10-24        ', '    01:31', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('533', '科技新闻', 'http://pic7.qiyipic.com/image/20171024/88/8d/v_113757325_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre233iw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '成都商场土豪姐狂刷400万 结账拉警戒线', '无', '无', '无', '                2017-10-24        ', '    01:02', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('534', '科技新闻', 'http://pic7.qiyipic.com/image/20171024/7e/a5/v_113757624_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xld8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '蔡英文与柯文哲同台零互动 竞合关系引猜想', '无', '无', '无', '                2017-10-24        ', '    01:50', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('535', '科技新闻', 'http://pic4.qiyipic.com/image/20171024/22/d0/v_113759166_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre1196s.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九届中共中央政治局常委25日同中外记者见面', '无', '无', '无', '                2017-10-24        ', '    00:33', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('536', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/d8/b4/v_113755210_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre21jos.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '震撼!特警车队路口处集体礼让路人 网友点赞', '无', '无', '无', '                2017-10-24        ', '    01:30', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('537', '科技新闻', 'http://pic6.qiyipic.com/image/20171024/4d/47/v_113757977_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0yb0g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '全球首列智轨列车湖南&quot;开跑&quot;', '无', '无', '无', '                2017-10-24        ', '    00:24', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('538', '科技新闻', 'http://pic1.qiyipic.com/image/20171024/f4/9e/v_113758269_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0wdpw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '天然气取暖  省内第一个天然气覆盖村', '无', '无', '无', '                2017-10-24        ', '    03:57', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('539', '科技新闻', 'http://pic2.qiyipic.com/image/20171024/f8/9a/v_113757957_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y918.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '国内首条内蒙至江苏输电线路正式投运', '无', '无', '无', '                2017-10-24        ', '    00:17', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('540', '科技新闻', 'http://pic9.qiyipic.com/image/20171024/c3/eb/v_113758021_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y154.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '兰州市及时发放取暖补贴确保困难群众温暖过冬', '无', '无', '无', '                2017-10-24        ', '    01:17', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('541', '科技新闻', 'http://pic1.qiyipic.com/image/20171024/13/4e/v_113757701_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xdkg.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '周六 西安部分路段及区域实行临时交通管制', '无', '无', '无', '                2017-10-24        ', '    02:24', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('542', '科技新闻', 'http://pic7.qiyipic.com/image/20171024/07/15/v_113757563_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xsyw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '用最高标准构建中国开放新格局', '无', '无', '无', '                2017-10-24        ', '    10:35', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('543', '科技新闻', 'http://pic3.qiyipic.com/image/20171024/48/e4/v_113757716_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xfq4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '长沙广电&middot;中广天择传媒全媒体受众实验室启动', '无', '无', '无', '                2017-10-24        ', '    01:00', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('544', '科技新闻', 'http://pic3.qiyipic.com/image/20171020/37/f1/v_113738458_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre28i9g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '共青团新闻联播十九大特别报道', '无', '无', '无', '                2017-10-24        ', '    08:22', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('545', '科技新闻', 'http://pic9.qiyipic.com/image/20171024/00/06/v_113757453_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22oss.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '复兴号动车组 按时速350公里运营满一个月', '无', '无', '无', '                2017-10-24        ', '    00:46', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('546', '科技新闻', 'http://pic9.qiyipic.com/image/20171024/9e/3f/v_113757435_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22mn4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '午间新鲜事:全球首列智轨列车开跑', '无', '无', '无', '                2017-10-24        ', '    02:54', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('547', '科技新闻', 'http://pic6.qiyipic.com/image/20171023/0a/66/v_113752406_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vtzc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大时光：重磅民生信息你最关注什么？', '无', '无', '无', '                2017-10-24        ', '    03:00', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('548', '科技新闻', 'http://pic7.qiyipic.com/image/20171024/53/62/v_113757761_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0x6i8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '山西省将集中清理货运车历史交通违法行为', '无', '无', '无', '                2017-10-24        ', '    00:14', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('549', '科技新闻', 'http://pic3.qiyipic.com/image/20171023/0b/86/v_113752296_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vrp4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '青春声音：新时代，如何与年轻人说理', '无', '无', '无', '                2017-10-24        ', '    14:00', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('550', '科技新闻', 'http://pic3.qiyipic.com/image/20171024/1a/bf/v_113757530_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xs9c.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '大会通过十八届中央委员会报告的决议', '无', '无', '无', '                2017-10-24        ', '    00:19', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('551', '科技新闻', 'http://pic8.qiyipic.com/image/20171019/9c/cd/v_113727730_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2u9nc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大时光：看总书记的十九大报告', '无', '无', '无', '                2017-10-24        ', '    02:08', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('552', '科技新闻', 'http://pic5.qiyipic.com/image/20171024/ae/2d/v_113756672_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre24ckk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '海马号  创我国深海作业多项纪录', '无', '无', '无', '                2017-10-24        ', '    01:01', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('553', '科技新闻', 'http://pic5.qiyipic.com/image/20171018/74/d5/v_113721805_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre3t3e4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '我维和部队官兵集中收看十九大开幕盛况', '无', '无', '无', '                2017-10-24        ', '    00:50', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('554', '科技新闻', 'http://pic5.qiyipic.com/image/20171023/66/c4/v_113752441_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vv9s.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '青年党代表徐岚：新时代，如何与年轻人说理', '无', '无', '无', '                2017-10-24        ', '    06:48', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('555', '科技新闻', 'http://pic2.qiyipic.com/image/20171024/1d/95/v_113755401_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre218d8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '国家统计局:9月份一线城市房价环比持续 下降', '无', '无', '无', '                2017-10-24        ', '    00:29', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('556', '科技新闻', 'http://pic7.qiyipic.com/image/20171024/1a/f9/v_113757738_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xh80.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '深山法官的为民四部曲', '无', '无', '无', '                2017-10-24        ', '    06:45', '无', '暂无', '科技[资讯]', '31');
INSERT INTO `video_home_videoresource` VALUES ('557', '国内新闻', 'http://pic2.qiyipic.com/image/20171024/70/73/v_113757487_m_601_m3_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xpgo.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大今日上午9时举行闭幕会', '无', '无', '无', '                2017-10-24        ', '    00:31', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('558', '国内新闻', 'http://pic9.qiyipic.com/image/20171024/f3/45/v_113759066_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre106fc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党第十九届中央委员会委员名单', '无', '无', '无', '                2017-10-24        ', '    07:05', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('559', '国内新闻', 'http://pic6.qiyipic.com/image/20171024/8e/55/v_113757461_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre22o10.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '第十九届中央委员会和中央纪律检查委员会产生', '无', '无', '无', '                2017-10-24        ', '    00:25', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('560', '国内新闻', 'http://pic4.qiyipic.com/image/20171024/60/bd/v_113759081_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre107sk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党第十九届中央委员会候补委员名单', '无', '无', '无', '                2017-10-24        ', '    06:43', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('561', '国内新闻', 'http://pic6.qiyipic.com/image/20171024/f7/16/v_113757625_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xlo0.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '全球 首列智轨公交列车开跑', '无', '无', '无', '                2017-10-24        ', '    00:33', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('562', '国内新闻', 'http://pic2.qiyipic.com/image/20171024/d7/c4/v_113757896_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0ygkg.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '中国共产党十九大胜利闭幕', '无', '无', '无', '                2017-10-24        ', '    01:31', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('563', '国内新闻', 'http://pic7.qiyipic.com/image/20171024/88/8d/v_113757325_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre233iw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '成都商场土豪姐狂刷400万 结账拉警戒线', '无', '无', '无', '                2017-10-24        ', '    01:02', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('564', '国内新闻', 'http://pic7.qiyipic.com/image/20171024/7e/a5/v_113757624_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xld8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '蔡英文与柯文哲同台零互动 竞合关系引猜想', '无', '无', '无', '                2017-10-24        ', '    01:50', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('565', '国内新闻', 'http://pic4.qiyipic.com/image/20171024/22/d0/v_113759166_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre1196s.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九届中共中央政治局常委25日同中外记者见面', '无', '无', '无', '                2017-10-24        ', '    00:33', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('566', '国内新闻', 'http://pic6.qiyipic.com/image/20171024/d8/b4/v_113755210_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre21jos.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '震撼!特警车队路口处集体礼让路人 网友点赞', '无', '无', '无', '                2017-10-24        ', '    01:30', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('567', '国内新闻', 'http://pic6.qiyipic.com/image/20171024/4d/47/v_113757977_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0yb0g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '全球首列智轨列车湖南&quot;开跑&quot;', '无', '无', '无', '                2017-10-24        ', '    00:24', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('568', '国内新闻', 'http://pic1.qiyipic.com/image/20171024/f4/9e/v_113758269_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0wdpw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '天然气取暖  省内第一个天然气覆盖村', '无', '无', '无', '                2017-10-24        ', '    03:57', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('569', '国内新闻', 'http://pic2.qiyipic.com/image/20171024/f8/9a/v_113757957_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y918.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '国内首条内蒙至江苏输电线路正式投运', '无', '无', '无', '                2017-10-24        ', '    00:17', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('570', '国内新闻', 'http://pic9.qiyipic.com/image/20171024/c3/eb/v_113758021_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0y154.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '兰州市及时发放取暖补贴确保困难群众温暖过冬', '无', '无', '无', '                2017-10-24        ', '    01:17', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('571', '国内新闻', 'http://pic1.qiyipic.com/image/20171024/13/4e/v_113757701_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xdkg.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '周六 西安部分路段及区域实行临时交通管制', '无', '无', '无', '                2017-10-24        ', '    02:24', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('572', '国内新闻', 'http://pic7.qiyipic.com/image/20171024/07/15/v_113757563_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xsyw.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '用最高标准构建中国开放新格局', '无', '无', '无', '                2017-10-24        ', '    10:35', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('573', '国内新闻', 'http://pic3.qiyipic.com/image/20171024/48/e4/v_113757716_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xfq4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '长沙广电&middot;中广天择传媒全媒体受众实验室启动', '无', '无', '无', '                2017-10-24        ', '    01:00', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('574', '国内新闻', 'http://pic3.qiyipic.com/image/20171020/37/f1/v_113738458_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre28i9g.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '共青团新闻联播十九大特别报道', '无', '无', '无', '                2017-10-24        ', '    08:22', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('575', '国内新闻', 'http://pic9.qiyipic.com/image/20171024/00/06/v_113757453_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22oss.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '复兴号动车组 按时速350公里运营满一个月', '无', '无', '无', '                2017-10-24        ', '    00:46', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('576', '国内新闻', 'http://pic9.qiyipic.com/image/20171024/9e/3f/v_113757435_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre22mn4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '午间新鲜事:全球首列智轨列车开跑', '无', '无', '无', '                2017-10-24        ', '    02:54', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('577', '国内新闻', 'http://pic6.qiyipic.com/image/20171023/0a/66/v_113752406_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vtzc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大时光：重磅民生信息你最关注什么？', '无', '无', '无', '                2017-10-24        ', '    03:00', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('578', '国内新闻', 'http://pic7.qiyipic.com/image/20171024/53/62/v_113757761_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre0x6i8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '山西省将集中清理货运车历史交通违法行为', '无', '无', '无', '                2017-10-24        ', '    00:14', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('579', '国内新闻', 'http://pic3.qiyipic.com/image/20171023/0b/86/v_113752296_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vrp4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '青春声音：新时代，如何与年轻人说理', '无', '无', '无', '                2017-10-24        ', '    14:00', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('580', '国内新闻', 'http://pic3.qiyipic.com/image/20171024/1a/bf/v_113757530_m_601_m2_180_101.jpg', 'http://www.iqiyi.com/v_19rre0xs9c.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '大会通过十八届中央委员会报告的决议', '无', '无', '无', '                2017-10-24        ', '    00:19', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('581', '国内新闻', 'http://pic8.qiyipic.com/image/20171019/9c/cd/v_113727730_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre2u9nc.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '十九大时光：看总书记的十九大报告', '无', '无', '无', '                2017-10-24        ', '    02:08', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('582', '国内新闻', 'http://pic5.qiyipic.com/image/20171024/ae/2d/v_113756672_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre24ckk.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '海马号  创我国深海作业多项纪录', '无', '无', '无', '                2017-10-24        ', '    01:01', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('583', '国内新闻', 'http://pic5.qiyipic.com/image/20171018/74/d5/v_113721805_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre3t3e4.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '我维和部队官兵集中收看十九大开幕盛况', '无', '无', '无', '                2017-10-24        ', '    00:50', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('584', '国内新闻', 'http://pic5.qiyipic.com/image/20171023/66/c4/v_113752441_m_601_180_101.jpg', 'http://www.iqiyi.com/v_19rre1vv9s.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '青年党代表徐岚：新时代，如何与年轻人说理', '无', '无', '无', '                2017-10-24        ', '    06:48', '无', '暂无', '国内[资讯]', '29');
INSERT INTO `video_home_videoresource` VALUES ('585', '国内新闻', 'http://pic2.qiyipic.com/image/20171024/1d/95/v_113755401_m_601_m1_180_101.jpg', 'http://www.iqiyi.com/v_19rre218d8.html#vfrm=2-4-0-1&rtgt=iqiyi&p2=9005', '国家统计局:9月份一线城市房价环比持续 下降', '无', '无', '无', '                2017-10-24        ', '    00:29', '无', '暂无', '国内[资讯]', '29');

-- ----------------------------
-- Table structure for video_home_videotype
-- ----------------------------
DROP TABLE IF EXISTS `video_home_videotype`;
CREATE TABLE `video_home_videotype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_name` varchar(50) NOT NULL,
  `videocategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_videotype
-- ----------------------------
INSERT INTO `video_home_videotype` VALUES ('1', 'VIP尊享', '1');
INSERT INTO `video_home_videotype` VALUES ('2', '冒险', '1');
INSERT INTO `video_home_videotype` VALUES ('3', '动作', '1');
INSERT INTO `video_home_videotype` VALUES ('4', '喜剧', '1');
INSERT INTO `video_home_videotype` VALUES ('5', '微电影', '1');
INSERT INTO `video_home_videotype` VALUES ('6', '恐怖', '1');
INSERT INTO `video_home_videotype` VALUES ('7', '悬疑', '1');
INSERT INTO `video_home_videotype` VALUES ('8', '惊悚', '1');
INSERT INTO `video_home_videotype` VALUES ('9', '战争', '1');
INSERT INTO `video_home_videotype` VALUES ('10', '爱情', '1');
INSERT INTO `video_home_videotype` VALUES ('11', '犯罪', '1');
INSERT INTO `video_home_videotype` VALUES ('12', '蓝光', '1');
INSERT INTO `video_home_videotype` VALUES ('13', '院线', '1');
INSERT INTO `video_home_videotype` VALUES ('14', '魔幻', '1');
INSERT INTO `video_home_videotype` VALUES ('15', '灾难', '1');
INSERT INTO `video_home_videotype` VALUES ('16', '剧情', '1');
INSERT INTO `video_home_videotype` VALUES ('17', '音乐', '2');
INSERT INTO `video_home_videotype` VALUES ('18', '热血', '3');
INSERT INTO `video_home_videotype` VALUES ('19', '东方卫视', '4');
INSERT INTO `video_home_videotype` VALUES ('20', '北京卫视', '4');
INSERT INTO `video_home_videotype` VALUES ('21', '大陆综艺', '4');
INSERT INTO `video_home_videotype` VALUES ('22', '娱乐八卦', '4');
INSERT INTO `video_home_videotype` VALUES ('23', '婚恋情感', '4');
INSERT INTO `video_home_videotype` VALUES ('24', '江苏卫视', '4');
INSERT INTO `video_home_videotype` VALUES ('25', '搞笑幽默', '4');
INSERT INTO `video_home_videotype` VALUES ('26', '真人秀', '4');
INSERT INTO `video_home_videotype` VALUES ('27', '美食旅游', '4');
INSERT INTO `video_home_videotype` VALUES ('28', '明星', '4');
INSERT INTO `video_home_videotype` VALUES ('29', '国内', '5');
INSERT INTO `video_home_videotype` VALUES ('30', '社会', '5');
INSERT INTO `video_home_videotype` VALUES ('31', '科技', '5');
INSERT INTO `video_home_videotype` VALUES ('32', '纪实', '5');
INSERT INTO `video_home_videotype` VALUES ('33', '科幻', '5');

-- ----------------------------
-- Table structure for video_home_videoup
-- ----------------------------
DROP TABLE IF EXISTS `video_home_videoup`;
CREATE TABLE `video_home_videoup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(50) NOT NULL,
  `video_up_time` datetime NOT NULL,
  `video_resource` varchar(100) NOT NULL,
  `video_owner_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_home_videoup
-- ----------------------------
