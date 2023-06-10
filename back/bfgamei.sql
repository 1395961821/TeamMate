/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.26 : Database - gamepp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gamepp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gamepp`;

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'t_user','App用户','','','TAppUser','crud','com.ruoyi.system','app','user','用户','蔡永琪','0','/','{\"parentMenuId\":2000}','admin','2023-05-14 14:34:46','','2023-05-14 14:40:20',NULL),(2,'t_resources','App资源',NULL,NULL,'TAppResources','crud','com.ruoyi.system','app','resources','资源','蔡永琪','0','/','{\"parentMenuId\":2000}','admin','2023-05-14 14:52:21','','2023-05-14 14:54:04',NULL),(3,'t_teamup','App组队','','','TAppTeamup','crud','com.ruoyi.system','app','teamup','发起游戏管理','蔡永琪','0','/','{\"parentMenuId\":\"2000\"}','admin','2023-05-15 09:14:57','','2023-05-15 16:07:38',NULL),(4,'t_teamperson','申请表',NULL,NULL,'TAppTeamperson','crud','com.ruoyi.system','app','teamperson','组队申请','蔡永琪','0','/','{\"parentMenuId\":2000}','admin','2023-05-15 09:22:42','','2023-05-15 16:52:45',NULL),(5,'t_classification','App分类',NULL,NULL,'TAppClassification','crud','com.ruoyi.system','app','classification','分类','蔡永琪','0','/','{\"parentMenuId\":2000}','admin','2023-05-15 09:43:17','','2023-05-15 09:44:57',NULL),(6,'t_msg','app消息',NULL,NULL,'TAppMsg','crud','com.ruoyi.system','app','msg','消息','蔡永琪','0','/','{\"parentMenuId\":\"2000\"}','admin','2023-05-15 11:47:31','','2023-05-16 09:10:28',NULL),(7,'t_wheelseeding','App轮播图',NULL,NULL,'TAppWheelseeding','crud','com.ruoyi.system','app','wheelseeding','轮播图','蔡永琪','0','/','{\"parentMenuId\":2000}','admin','2023-05-15 17:29:49','','2023-05-15 17:31:53',NULL),(8,'t_report','App举报','','','TAppReport','crud','com.ruoyi.system','app','report','举报','蔡永琪','0','/','{\"parentMenuId\":\"2000\"}','admin','2023-05-15 19:33:26','','2023-05-15 19:36:50',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,'1','id','id','bigint','Long','id','1','0',NULL,'0',NULL,'1','1','EQ','input','',1,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(2,'1','nickname','名称','varchar(255)','String','nickname','0','0','1','0','1','1','1','LIKE','input','',2,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(3,'1','title','个性签名','varchar(255)','String','title','0','0','1','0','1','1','1','LIKE','input','',3,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(4,'1','bepraised','获赞次数','bigint','Long','bepraised','0','0','1','0','0','1','0','EQ','input','',4,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(5,'1','initiationtimes','发起次数','int','Long','initiationtimes','0','0','1','0','0','1','0','EQ','input','',5,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(6,'1','appid','微信ID','varchar(255)','String','appid','0','0',NULL,'0','0','1','1','EQ','input','',6,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(7,'1','gender','0男  1女','int','Long','gender','0','0','1','0','1','1','1','EQ','input','',7,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(8,'1','age','年龄','int','Long','age','0','0','1','0','1','1','0','EQ','input','',8,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(9,'1','birthday','生日','datetime','Date','birthday','0','0',NULL,'0','1','1','0','EQ','datetime','',9,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(10,'1','state','0 限制操作,只能登录  1 正常','int','Long','state','0','0','1','0','1','1','1','EQ','input','',10,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(11,'1','audio_imgid','音频','bigint','Long','audioImgid','0','0',NULL,'0','0','1','0','EQ','imageUpload','',11,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(12,'1','plot_imgid','背景图','bigint','Long','plotImgid','0','0',NULL,'0','0','1','0','EQ','imageUpload','',12,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(13,'1','avatar_imgid','头像','bigint','Long','avatarImgid','0','0',NULL,'0','0','1','0','EQ','imageUpload','',13,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(14,'1','create_time','创建时间','datetime','Date','createTime','0','0','1','0',NULL,'1','0','EQ','datetime','',14,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(15,'1','update_time','修改时间','datetime','Date','updateTime','0','0','0','0','0','0','0','EQ','datetime','',15,'admin','2023-05-14 14:34:46','','2023-05-14 14:40:20'),(16,'2','id','id','bigint','Long','id','1','1',NULL,'0',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(17,'2','url','资源地址','text','String','url','0','0','1','0','0','1','1','EQ','textarea','',2,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(18,'2','state','资源状态0 正常 1未使用','int','Long','state','0','0','1','0','1','1','1','EQ','input','',3,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(19,'2','user_id','创建者','bigint','Long','userId','0','0','1','0','1','1','1','EQ','input','',4,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(20,'2','create_time','创建时间','datetime','Date','createTime','0','0','1','0','0','1',NULL,'EQ','datetime','',5,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(21,'2','update_time','修改时间','datetime','Date','updateTime','0','0','1','0','0','1',NULL,'EQ','datetime','',6,'admin','2023-05-14 14:52:21','','2023-05-14 14:54:04'),(22,'3','id','id','bigint','Long','id','1','1',NULL,'0',NULL,'1',NULL,'EQ','input','',1,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(23,'3','user_id','用户ID','bigint','Long','userId','0','0','1','0','0','1','1','EQ','input','',2,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(24,'3','audio_imgid','音频图片id','bigint','Long','audioImgid','0','0','1','0','0','1','0','EQ','input','',3,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(25,'3','classification_id','分类ID','bigint','Long','classificationId','0','0','1','0','0','1','1','EQ','input','',4,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(26,'3','largeregion','大区','varchar(255)','String','largeregion','0','0','1','0','0','1','0','EQ','input','',5,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(27,'3','platooncount','组队数量','int','Long','platooncount','0','0','1','0','0','1','0','EQ','input','',6,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(28,'3','title','简介','varchar(255)','String','title','0','0','1','0','0','1','1','LIKE','input','',7,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(29,'3','forwardcount','转发数量','bigint','Long','forwardcount','0','0','1','0','0','1','0','EQ','input','',8,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(30,'3','imageids','图片ids','varchar(255)','String','imageids','0','0','1','0','0','1','0','EQ','input','',9,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(31,'3','likecount','点赞数','bigint','Long','likecount','0','0','1','0','0','1','0','EQ','input','',10,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(32,'3','commentcount','评论数','bigint','Long','commentcount','0','0','1','0','0','1','0','EQ','input','',11,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(33,'3','state','0不显示 1匹配中 2游戏中 3结束 4违规','int','Long','state','0','0','1','0','1','1','1','EQ','input','',12,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(34,'3','create_time','创建时间','datetime','Date','createTime','0','0','1','0',NULL,'1',NULL,'EQ','datetime','',13,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(35,'3','update_time','修改时间','datetime','Date','updateTime','0','0','1','0','0',NULL,NULL,'EQ','datetime','',14,'admin','2023-05-15 09:14:57','','2023-05-15 16:07:38'),(36,'4','id','ID','bigint','Long','id','1','1',NULL,'0',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(37,'4','teamup_id','组队ID','bigint','Long','teamupId','0','0','1','0','1','1','1','EQ','input','',2,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(38,'4','user_id','用户ID','bigint','Long','userId','0','0','1','0','1','1','1','EQ','input','',3,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(39,'4','msguuid','消息id','varchar(255)','String','msguuid','0','0','1','0','1','1','1','EQ','input','',4,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(40,'4','state','0为处理 1通过 2拒绝','int','Long','state','0','0','1','0','1','1','1','EQ','input','',5,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(41,'4','create_time','创建时间','datetime','Date','createTime','0','0','1','0',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(42,'4','update_time','修改时间','datetime','Date','updateTime','0','0','1','0','0',NULL,NULL,'EQ','datetime','',7,'admin','2023-05-15 09:22:42','','2023-05-15 16:52:45'),(43,'5','id','id','bigint','Long','id','1','1',NULL,'0',NULL,'1',NULL,'EQ','input','',1,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(44,'5','name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(45,'5','typevalue','类型0 端游 1手游','int','Long','typevalue','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(46,'5','plot_imgid','背景图','bigint','Long','plotImgid','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(47,'5','state','0关闭 1显示','int','Long','state','0','0','1','1','1','1','1','EQ','input','',5,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(48,'5','create_time','创建时间','datetime','Date','createTime','0','0','1','0',NULL,'1',NULL,'EQ','datetime','',6,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(49,'5','update_time','修改时间','datetime','Date','updateTime','0','0','1','0','0',NULL,NULL,'EQ','datetime','',7,'admin','2023-05-15 09:43:17','','2023-05-15 09:44:57'),(50,'6','id','id','bigint','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(51,'6','user_id','谁发的','bigint','Long','userId','0','0','1','1','1','1','0','EQ','input','',2,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(52,'6','touser_id','发给谁','bigint','Long','touserId','0','0','1','1','1','1','0','EQ','input','',3,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(53,'6','msg','消息','varchar(255)','String','msg','0','0','1','1','1','1','0','EQ','input','',4,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(54,'6','state','0未读 1已读','int','Long','state','0','0','1','1','1','1','1','EQ','input','',5,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(55,'6','create_time','创建时间','datetime','Date','createTime','0','0','1','1','1','1','0','EQ','datetime','',6,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(56,'6','update_time','修改时间','datetime','Date','updateTime','0','0','1','1','1','1','0','EQ','datetime','',7,'admin','2023-05-15 11:47:31','','2023-05-16 09:10:28'),(57,'7','id','id','bigint','Long','id','1','1',NULL,'1',NULL,'1',NULL,'EQ','input','',1,'admin','2023-05-15 17:29:49','','2023-05-15 17:31:53'),(58,'7','sort','排序','int','Long','sort','0','0','1','1','1','1','0','EQ','input','',2,'admin','2023-05-15 17:29:49','','2023-05-15 17:31:53'),(59,'7','plot_imgid','图片id','bigint','Long','plotImgid','0','0','1','1','1','1','0','EQ','input','',4,'admin','2023-05-15 17:29:49','','2023-05-15 17:31:53'),(60,'7','create_time','创建时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-05-15 17:29:49','','2023-05-15 17:31:53'),(61,'7','update_time','修改时间','datetime','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',6,'admin','2023-05-15 17:29:49','','2023-05-15 17:31:53'),(62,'7','url','跳转','text','String','url','0','0','1','1','1','1','0','EQ','textarea','',3,'','2023-05-15 17:30:50','','2023-05-15 17:31:53'),(63,'8','id','id','bigint','Long','id','1','1',NULL,'0',NULL,'1',NULL,'EQ','input','',1,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(64,'8','msg','举报内容','text','String','msg','0','0','1','0','0','1','0','EQ','textarea','',2,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(65,'8','user_id','谁举报的','bigint','Long','userId','0','0','1','0','0','1','1','EQ','input','',3,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(66,'8','touser_id','被举报的用户id','bigint','Long','touserId','0','0','1','0','0','1','1','EQ','input','',6,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(67,'8','teamup_id','被举报的组队id','bigint','Long','teamupId','0','0','1','0','0','1','1','EQ','input','',7,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(68,'8','create_time','创建时间','datetime','Date','createTime','0','0','1','0',NULL,'1',NULL,'EQ','datetime','',8,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(69,'8','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'0','1',NULL,NULL,'EQ','datetime','',9,'admin','2023-05-15 19:33:26','','2023-05-15 19:36:50'),(70,'8','msgid','发送消息id','varchar(255)','String','msgid','0','0',NULL,'0','0','1','0','EQ','input','',4,'','2023-05-15 19:35:41','','2023-05-15 19:36:50'),(71,'8','state','0未处理 1处理','int','Long','state','0','0','1','0','1','1','1','EQ','select','',5,'','2023-05-15 19:35:41','','2023-05-15 19:36:50');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-05-14 14:11:56','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-05-14 14:11:56','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-05-14 14:11:56','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-05-14 14:11:56','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-05-14 14:11:56','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-05-14 14:11:56','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-05-14 14:11:32','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-05-14 14:11:53','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-05-14 14:11:53','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-05-14 14:11:53','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-05-14 14:11:53','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-05-14 14:11:53','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-05-14 14:11:53','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-05-14 14:11:54','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-05-14 14:11:54','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-05-14 14:11:54','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-05-14 14:11:54','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-05-14 14:11:54','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-05-14 14:11:54','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-05-14 14:11:54','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-05-14 14:11:54','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-05-14 14:11:54','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-05-14 14:11:54','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-05-14 14:11:54','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-05-14 14:11:54','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-05-14 14:11:54','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-05-14 14:11:54','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-05-14 14:11:54','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-05-14 14:11:54','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2023-05-14 14:11:51','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-05-14 14:11:51','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-05-14 14:11:51','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-05-14 14:11:51','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-05-14 14:11:51','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-05-14 14:11:51','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-05-14 14:11:51','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-05-14 14:11:51','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-05-14 14:11:51','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-05-14 14:11:51','',NULL,'登录状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-05-14 14:11:59','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-05-14 14:11:59','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-05-14 14:11:59','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-14 14:31:23'),(101,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-05-14 14:49:49'),(102,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-05-14 15:16:22'),(103,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-14 15:16:42'),(104,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 09:13:45'),(105,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 11:47:03'),(106,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 16:05:52'),(107,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 19:12:47'),(108,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 19:33:11'),(109,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-15 20:52:58'),(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-16 08:54:20'),(111,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-05-16 09:30:13'),(112,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-05-16 09:30:24');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2049 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-05-14 14:11:38','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-05-14 14:11:38','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-05-14 14:11:38','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2023-05-14 14:11:38','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-05-14 14:11:38','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-05-14 14:11:38','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-05-14 14:11:38','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-05-14 14:11:38','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-05-14 14:11:38','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-05-14 14:11:38','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-05-14 14:11:38','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-05-14 14:11:38','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-05-14 14:11:38','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-05-14 14:11:39','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-05-14 14:11:39','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-05-14 14:11:39','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-05-14 14:11:39','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-05-14 14:11:39','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-05-14 14:11:39','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-05-14 14:11:39','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-05-14 14:11:39','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2023-05-14 14:11:39','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-05-14 14:11:39','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-05-14 14:11:39','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-05-14 14:11:39','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-05-14 14:11:39','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-05-14 14:11:39','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-05-14 14:11:39','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-05-14 14:11:39','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-05-14 14:11:39','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-05-14 14:11:39','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-05-14 14:11:39','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-05-14 14:11:39','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-05-14 14:11:39','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-05-14 14:11:39','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-05-14 14:11:39','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-05-14 14:11:39','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-05-14 14:11:39','',NULL,''),(2000,'App管理',0,0,'manager',NULL,NULL,1,0,'M','0','0',NULL,'build','admin','2023-05-14 14:34:20','',NULL,''),(2001,'用户',2000,1,'user','app/user/index',NULL,1,0,'C','0','0','app:user:list','#','admin','2023-05-14 14:41:29','',NULL,'用户菜单'),(2002,'用户查询',2001,1,'#','',NULL,1,0,'F','0','0','app:user:query','#','admin','2023-05-14 14:41:29','',NULL,''),(2003,'用户新增',2001,2,'#','',NULL,1,0,'F','0','0','app:user:add','#','admin','2023-05-14 14:41:29','',NULL,''),(2004,'用户修改',2001,3,'#','',NULL,1,0,'F','0','0','app:user:edit','#','admin','2023-05-14 14:41:29','',NULL,''),(2005,'用户删除',2001,4,'#','',NULL,1,0,'F','0','0','app:user:remove','#','admin','2023-05-14 14:41:29','',NULL,''),(2006,'用户导出',2001,5,'#','',NULL,1,0,'F','0','0','app:user:export','#','admin','2023-05-14 14:41:29','',NULL,''),(2007,'资源',2000,1,'resources','app/resources/index',NULL,1,0,'C','0','0','app:resources:list','#','admin','2023-05-14 14:54:46','',NULL,'资源菜单'),(2008,'资源查询',2007,1,'#','',NULL,1,0,'F','0','0','app:resources:query','#','admin','2023-05-14 14:54:46','',NULL,''),(2009,'资源新增',2007,2,'#','',NULL,1,0,'F','0','0','app:resources:add','#','admin','2023-05-14 14:54:46','',NULL,''),(2010,'资源修改',2007,3,'#','',NULL,1,0,'F','0','0','app:resources:edit','#','admin','2023-05-14 14:54:46','',NULL,''),(2011,'资源删除',2007,4,'#','',NULL,1,0,'F','0','0','app:resources:remove','#','admin','2023-05-14 14:54:46','',NULL,''),(2012,'资源导出',2007,5,'#','',NULL,1,0,'F','0','0','app:resources:export','#','admin','2023-05-14 14:54:46','',NULL,''),(2013,'分类',2000,1,'classification','app/classification/index',NULL,1,0,'C','0','0','app:classification:list','#','admin','2023-05-15 09:45:32','',NULL,'分类菜单'),(2014,'分类查询',2013,1,'#','',NULL,1,0,'F','0','0','app:classification:query','#','admin','2023-05-15 09:45:32','',NULL,''),(2015,'分类新增',2013,2,'#','',NULL,1,0,'F','0','0','app:classification:add','#','admin','2023-05-15 09:45:32','',NULL,''),(2016,'分类修改',2013,3,'#','',NULL,1,0,'F','0','0','app:classification:edit','#','admin','2023-05-15 09:45:32','',NULL,''),(2017,'分类删除',2013,4,'#','',NULL,1,0,'F','0','0','app:classification:remove','#','admin','2023-05-15 09:45:32','',NULL,''),(2018,'分类导出',2013,5,'#','',NULL,1,0,'F','0','0','app:classification:export','#','admin','2023-05-15 09:45:32','',NULL,''),(2019,'发起游戏管理',2000,1,'teamup','app/teamup/index',NULL,1,0,'C','0','0','app:teamup:list','#','admin','2023-05-15 16:08:15','',NULL,'发起游戏管理菜单'),(2020,'发起游戏管理查询',2019,1,'#','',NULL,1,0,'F','0','0','app:teamup:query','#','admin','2023-05-15 16:08:15','',NULL,''),(2021,'发起游戏管理新增',2019,2,'#','',NULL,1,0,'F','0','0','app:teamup:add','#','admin','2023-05-15 16:08:15','',NULL,''),(2022,'发起游戏管理修改',2019,3,'#','',NULL,1,0,'F','0','0','app:teamup:edit','#','admin','2023-05-15 16:08:15','',NULL,''),(2023,'发起游戏管理删除',2019,4,'#','',NULL,1,0,'F','0','0','app:teamup:remove','#','admin','2023-05-15 16:08:15','',NULL,''),(2024,'发起游戏管理导出',2019,5,'#','',NULL,1,0,'F','0','0','app:teamup:export','#','admin','2023-05-15 16:08:15','',NULL,''),(2025,'组队申请',2000,1,'teamperson','app/teamperson/index',NULL,1,0,'C','0','0','app:teamperson:list','#','admin','2023-05-15 16:58:52','',NULL,'组队申请菜单'),(2026,'组队申请查询',2025,1,'#','',NULL,1,0,'F','0','0','app:teamperson:query','#','admin','2023-05-15 16:58:52','',NULL,''),(2027,'组队申请新增',2025,2,'#','',NULL,1,0,'F','0','0','app:teamperson:add','#','admin','2023-05-15 16:58:52','',NULL,''),(2028,'组队申请修改',2025,3,'#','',NULL,1,0,'F','0','0','app:teamperson:edit','#','admin','2023-05-15 16:58:52','',NULL,''),(2029,'组队申请删除',2025,4,'#','',NULL,1,0,'F','0','0','app:teamperson:remove','#','admin','2023-05-15 16:58:52','',NULL,''),(2030,'组队申请导出',2025,5,'#','',NULL,1,0,'F','0','0','app:teamperson:export','#','admin','2023-05-15 16:58:52','',NULL,''),(2031,'轮播图',2000,1,'wheelseeding','app/wheelseeding/index',NULL,1,0,'C','0','0','app:wheelseeding:list','#','admin','2023-05-15 17:32:37','',NULL,'轮播图菜单'),(2032,'轮播图查询',2031,1,'#','',NULL,1,0,'F','0','0','app:wheelseeding:query','#','admin','2023-05-15 17:32:37','',NULL,''),(2033,'轮播图新增',2031,2,'#','',NULL,1,0,'F','0','0','app:wheelseeding:add','#','admin','2023-05-15 17:32:37','',NULL,''),(2034,'轮播图修改',2031,3,'#','',NULL,1,0,'F','0','0','app:wheelseeding:edit','#','admin','2023-05-15 17:32:37','',NULL,''),(2035,'轮播图删除',2031,4,'#','',NULL,1,0,'F','0','0','app:wheelseeding:remove','#','admin','2023-05-15 17:32:37','',NULL,''),(2036,'轮播图导出',2031,5,'#','',NULL,1,0,'F','0','0','app:wheelseeding:export','#','admin','2023-05-15 17:32:37','',NULL,''),(2037,'举报',2000,1,'report','app/report/index',NULL,1,0,'C','0','0','app:report:list','#','admin','2023-05-15 19:42:18','',NULL,'举报菜单'),(2038,'举报查询',2037,1,'#','',NULL,1,0,'F','0','0','app:report:query','#','admin','2023-05-15 19:42:18','',NULL,''),(2039,'举报新增',2037,2,'#','',NULL,1,0,'F','0','0','app:report:add','#','admin','2023-05-15 19:42:18','',NULL,''),(2040,'举报修改',2037,3,'#','',NULL,1,0,'F','0','0','app:report:edit','#','admin','2023-05-15 19:42:18','',NULL,''),(2041,'举报删除',2037,4,'#','',NULL,1,0,'F','0','0','app:report:remove','#','admin','2023-05-15 19:42:18','',NULL,''),(2042,'举报导出',2037,5,'#','',NULL,1,0,'F','0','0','app:report:export','#','admin','2023-05-15 19:42:18','',NULL,''),(2043,'消息',2000,1,'msg','app/msg/index',NULL,1,0,'C','0','0','app:msg:list','#','admin','2023-05-16 09:11:15','',NULL,'消息菜单'),(2044,'消息查询',2043,1,'#','',NULL,1,0,'F','0','0','app:msg:query','#','admin','2023-05-16 09:11:15','',NULL,''),(2045,'消息新增',2043,2,'#','',NULL,1,0,'F','0','0','app:msg:add','#','admin','2023-05-16 09:11:15','',NULL,''),(2046,'消息修改',2043,3,'#','',NULL,1,0,'F','0','0','app:msg:edit','#','admin','2023-05-16 09:11:15','',NULL,''),(2047,'消息删除',2043,4,'#','',NULL,1,0,'F','0','0','app:msg:remove','#','admin','2023-05-16 09:11:15','',NULL,''),(2048,'消息导出',2043,5,'#','',NULL,1,0,'F','0','0','app:msg:export','#','admin','2023-05-16 09:11:15','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2023-05-14 14:12:02','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2023-05-14 14:12:02','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"App管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"manager\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 14:34:20',52),(101,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_user\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 14:34:46',222),(102,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"user\",\"className\":\"TAppUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:34:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"名称\",\"columnId\":2,\"columnName\":\"nickname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:34:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"个性签名\",\"columnId\":3,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:34:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Bepraised\",\"columnComment\":\"获赞次数\",\"columnId\":4,\"columnName\":\"bepraised\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:34:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"be','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 14:40:20',83),(103,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_user\"}',NULL,0,NULL,'2023-05-14 14:40:25',512),(104,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_resources\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 14:52:21',107),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"resources\",\"className\":\"TAppResources\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:52:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"资源地址\",\"columnId\":17,\"columnName\":\"url\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:52:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"State\",\"columnComment\":\"资源状态0 正常 1未使用\",\"columnId\":18,\"columnName\":\"state\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:52:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"state\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"创建者\",\"columnId\":19,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-14 14:52:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"param','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 14:54:04',46),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_resources\"}',NULL,0,NULL,'2023-05-14 14:54:07',293),(107,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"age\":19,\"appid\":\"o7fdH5ViuK-WvZKW89mbbpXUS5VU\",\"avatarImgid\":66,\"avatarimg\":\"/profile/upload/2023/05/e9b1b3f2-031f-4d21-a4de-a68d9d4d4ea6.jpg\",\"bepraised\":2,\"createTime\":\"2023-05-13 14:34:58\",\"gender\":0,\"id\":1206514955,\"initiationtimes\":2,\"nickname\":\"Adrian\",\"params\":{},\"state\":1,\"title\":\"爱生活，爱冒险，勇敢追求自己的梦想\",\"updateTime\":\"2023-05-14 15:17:13\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:17:13',35),(108,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 15:33:27\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-05-14 15:33:27',50),(109,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:33:33\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-05-14 15:33:33',11),(110,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 15:36:16\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-05-14 15:36:17',114),(111,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:36:17\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-05-14 15:36:17',4),(112,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"updateTime\":\"2023-05-14 15:36:29\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:36:29',85),(113,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"updateTime\":\"2023-05-14 15:36:31\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:36:31',15),(114,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":1850984702,\"params\":{},\"updateTime\":\"2023-05-14 15:36:51\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:36:51',11),(115,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:03',34),(116,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 15:47:03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:03',13),(117,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:07\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:07',8),(118,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:09\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:09',10),(119,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:10\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:11',9),(120,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:21\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:21',18),(121,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:47:32\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:47:32',11),(122,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:48:17\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:48:17',14),(123,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:49:21\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:49:21',11),(124,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:50:41\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:50:41',12),(125,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:50:44\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:50:44',7),(126,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:52:16\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:52:16',34),(127,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 15:52:49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:52:49',15),(128,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":243016228,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-14 15:52:59\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:52:59',10),(129,'用户',2,'com.ruoyi.system.controller.TAppUserController.edit()','PUT',1,'admin',NULL,'/app/user','127.0.0.1','内网IP','{\"id\":1850984702,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 15:53:50\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 15:53:50',7),(130,'资源',2,'com.ruoyi.system.controller.TAppResourcesController.edit()','PUT',1,'admin',NULL,'/app/resources','127.0.0.1','内网IP','{\"createTime\":\"2023-05-13 14:16:01\",\"id\":57,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-14 16:01:06\",\"url\":\"/profile/upload/2023/05/7f1f9065-4c73-44fb-9eb7-ca235acb10c7.jpg\",\"userId\":1850984702}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-14 16:01:06',77),(131,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_teamup\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:14:58',202),(132,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teamup\",\"className\":\"TAppTeamup\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":23,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AudioImgid\",\"columnComment\":\"音频图片id\",\"columnId\":24,\"columnName\":\"audio_imgid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"audioImgid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassificationId\",\"columnComment\":\"分类ID\",\"columnId\":25,\"columnName\":\"classification_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classificationI','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:22:22',84),(133,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_teamperson\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:22:42',31),(134,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teamperson\",\"className\":\"TAppTeamperson\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":36,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeamupId\",\"columnComment\":\"组队ID\",\"columnId\":37,\"columnName\":\"teamup_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teamupId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":38,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Msguuid\",\"columnComment\":\"消息id\",\"columnId\":39,\"columnName\":\"msguuid\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"msguuid\",\"javaType\":\"String\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:24:39',50),(135,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teamup\",\"className\":\"TAppTeamup\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:22:22\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":23,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:22:22\",\"usableColumn\":false},{\"capJavaField\":\"AudioImgid\",\"columnComment\":\"音频图片id\",\"columnId\":24,\"columnName\":\"audio_imgid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"audioImgid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:22:22\",\"usableColumn\":false},{\"capJavaField\":\"ClassificationId\",\"columnComment\":\"分类ID\",\"columnId\":25,\"columnName\":\"classification_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:26:44',66),(136,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_teamup\"}',NULL,0,NULL,'2023-05-15 09:27:33',63),(137,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_classification\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:43:17',256),(138,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"classification\",\"className\":\"TAppClassification\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:43:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":44,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:43:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Typevalue\",\"columnComment\":\"类型0 端游 1手游\",\"columnId\":45,\"columnName\":\"typevalue\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:43:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typevalue\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlotImgid\",\"columnComment\":\"背景图\",\"columnId\":46,\"columnName\":\"plot_imgid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:43:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"plo','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 09:44:57',51),(139,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_classification\"}',NULL,0,NULL,'2023-05-15 09:45:05',345),(140,'分类',2,'com.ruoyi.system.controller.TAppClassificationController.edit()','PUT',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"id\":7,\"params\":{},\"typevalue\":0,\"updateTime\":\"2023-05-15 10:02:51\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 10:02:51',65),(141,'分类',2,'com.ruoyi.system.controller.TAppClassificationController.edit()','PUT',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"id\":7,\"params\":{},\"typevalue\":1,\"updateTime\":\"2023-05-15 10:02:52\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 10:02:52',6),(142,'分类',2,'com.ruoyi.system.controller.TAppClassificationController.edit()','PUT',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"id\":-1,\"params\":{},\"plotImgid\":73,\"updateTime\":\"2023-05-15 10:44:40\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-05-15 10:44:40',50),(143,'分类',2,'com.ruoyi.system.controller.TAppClassificationController.edit()','PUT',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"id\":1,\"params\":{},\"plotImgid\":74,\"updateTime\":\"2023-05-15 10:45:35\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 10:45:35',16),(144,'分类',1,'com.ruoyi.system.controller.TAppClassificationController.add()','POST',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 10:55:47\",\"name\":\"12312312\",\"params\":{},\"plotImgid\":75,\"state\":0,\"typevalue\":1}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\gamepp\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\app\\TAppClassificationMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TAppClassificationMapper.insertTAppClassification-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_classification          ( name,             typevalue,             plot_imgid,             state,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value','2023-05-15 10:55:47',310),(145,'分类',1,'com.ruoyi.system.controller.TAppClassificationController.add()','POST',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 10:57:52\",\"name\":\"324567\",\"params\":{},\"plotImgid\":76,\"state\":0,\"typevalue\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\gamepp\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\app\\TAppClassificationMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TAppClassificationMapper.insertTAppClassification-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_classification          ( name,             typevalue,             plot_imgid,             state,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value','2023-05-15 10:57:52',157),(146,'分类',1,'com.ruoyi.system.controller.TAppClassificationController.add()','POST',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 11:00:07\",\"id\":9,\"name\":\"永劫无间\",\"params\":{},\"plotImgid\":77,\"state\":0,\"typevalue\":0,\"updateTime\":\"2023-05-15 11:00:07\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 11:00:07',46),(147,'分类',2,'com.ruoyi.system.controller.TAppClassificationController.edit()','PUT',1,'admin',NULL,'/app/classification','127.0.0.1','内网IP','{\"createTime\":\"2023-05-10 15:12:34\",\"id\":1,\"name\":\"英雄联盟\",\"params\":{},\"plotImgid\":78,\"state\":1,\"typevalue\":0,\"updateTime\":\"2023-05-15 11:00:45\",\"url\":\"/profile/upload/2023/05/83fd550d-3dcf-4365-9881-b39c60d28d14.png\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 11:00:46',1),(148,'资源',3,'com.ruoyi.system.controller.TAppResourcesController.remove()','DELETE',1,'admin',NULL,'/app/resources/78','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 11:02:01',17),(149,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_msg\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 11:47:31',160),(150,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"msg\",\"className\":\"TAppMsg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"谁发的\",\"columnId\":51,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TouserId\",\"columnComment\":\"发给谁\",\"columnId\":52,\"columnName\":\"touser_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"touserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Msg\",\"columnComment\":\"消息\",\"columnId\":53,\"columnName\":\"msg\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"msg\",\"javaType\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 11:49:21',84),(151,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_msg\"}',NULL,0,NULL,'2023-05-15 11:49:25',531),(152,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teamup\",\"className\":\"TAppTeamup\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:26:44\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":23,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:26:44\",\"usableColumn\":false},{\"capJavaField\":\"AudioImgid\",\"columnComment\":\"音频图片id\",\"columnId\":24,\"columnName\":\"audio_imgid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"audioImgid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:26:44\",\"usableColumn\":false},{\"capJavaField\":\"ClassificationId\",\"columnComment\":\"分类ID\",\"columnId\":25,\"columnName\":\"classification_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:14:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isE','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 16:07:38',78),(153,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_teamup\"}',NULL,0,NULL,'2023-05-15 16:07:43',125),(154,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teamperson\",\"className\":\"TAppTeamperson\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":36,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:24:39\",\"usableColumn\":false},{\"capJavaField\":\"TeamupId\",\"columnComment\":\"组队ID\",\"columnId\":37,\"columnName\":\"teamup_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teamupId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:24:39\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":38,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 09:24:39\",\"usableColumn\":false},{\"capJavaField\":\"Msguuid\",\"columnComment\":\"消息id\",\"columnId\":39,\"columnName\":\"msguuid\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 09:22:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 16:52:45',184),(155,'发起游戏管理',2,'com.ruoyi.system.controller.TAppTeamupController.edit()','PUT',1,'admin',NULL,'/app/teamup','127.0.0.1','内网IP','{\"id\":10,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-15 16:57:49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 16:57:49',175),(156,'发起游戏管理',2,'com.ruoyi.system.controller.TAppTeamupController.edit()','PUT',1,'admin',NULL,'/app/teamup','127.0.0.1','内网IP','{\"id\":10,\"params\":{},\"state\":3,\"updateTime\":\"2023-05-15 16:57:54\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 16:57:54',7),(157,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_teamperson\"}',NULL,0,NULL,'2023-05-15 16:58:23',410),(158,'组队申请',2,'com.ruoyi.system.controller.TAppTeampersonController.edit()','PUT',1,'admin',NULL,'/app/teamperson','127.0.0.1','内网IP','{\"id\":12,\"params\":{},\"state\":2,\"updateTime\":\"2023-05-15 17:17:07\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:17:07',99),(159,'组队申请',2,'com.ruoyi.system.controller.TAppTeampersonController.edit()','PUT',1,'admin',NULL,'/app/teamperson','127.0.0.1','内网IP','{\"id\":12,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-15 17:17:09\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:17:09',8),(160,'组队申请',2,'com.ruoyi.system.controller.TAppTeampersonController.edit()','PUT',1,'admin',NULL,'/app/teamperson','127.0.0.1','内网IP','{\"id\":16,\"params\":{},\"state\":1,\"updateTime\":\"2023-05-15 17:20:02\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:20:02',19),(161,'组队申请',2,'com.ruoyi.system.controller.TAppTeampersonController.edit()','PUT',1,'admin',NULL,'/app/teamperson','127.0.0.1','内网IP','{\"id\":16,\"params\":{},\"state\":0,\"updateTime\":\"2023-05-15 17:20:04\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:20:04',5),(162,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_wheelseeding\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:29:49',98),(163,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/t_wheelseeding','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:30:50',51),(164,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"wheelseeding\",\"className\":\"TAppWheelseeding\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 17:29:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 17:30:50\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":58,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 17:29:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 17:30:50\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"跳转\",\"columnId\":62,\"columnName\":\"url\",\"columnType\":\"text\",\"createBy\":\"\",\"createTime\":\"2023-05-15 17:30:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlotImgid\",\"columnComment\":\"图片id\",\"columnId\":59,\"columnName\":\"plot_imgid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 17:29:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:31:53',48),(165,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_wheelseeding\"}',NULL,0,NULL,'2023-05-15 17:31:56',354),(166,'轮播图',1,'com.ruoyi.system.controller.TAppWheelseedingController.add()','POST',1,'admin',NULL,'/app/wheelseeding','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 17:39:07\",\"params\":{},\"plotImgid\":79,\"sort\":0,\"url\":\"12312\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\gamepp\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\app\\TAppWheelseedingMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TAppWheelseedingMapper.insertTAppWheelseeding-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_wheelseeding          ( sort,             url,             plot_imgid,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value','2023-05-15 17:39:07',171),(167,'轮播图',1,'com.ruoyi.system.controller.TAppWheelseedingController.add()','POST',1,'admin',NULL,'/app/wheelseeding','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 17:39:18\",\"id\":1,\"params\":{},\"plotImgid\":79,\"sort\":0,\"url\":\"12312\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:39:18',12),(168,'轮播图',2,'com.ruoyi.system.controller.TAppWheelseedingController.edit()','PUT',1,'admin',NULL,'/app/wheelseeding','127.0.0.1','内网IP','{\"createTime\":\"2023-05-15 17:39:18\",\"id\":1,\"params\":{},\"plotImg\":\"/profile/upload/2023/05/307d99ae-5e84-4524-8072-a86ad6c1433c.png\",\"plotImgid\":80,\"sort\":0,\"updateTime\":\"2023-05-15 17:42:12\",\"url\":\"12312\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 17:42:13',50),(169,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_report\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 19:33:26',198),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"report\",\"className\":\"TAppReport\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":63,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Msg\",\"columnComment\":\"举报内容\",\"columnId\":64,\"columnName\":\"msg\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"msg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"谁举报的\",\"columnId\":65,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TouserId\",\"columnComment\":\"被举报的用户id\",\"columnId\":66,\"columnName\":\"touser_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"touserId\",\"javaType\":\"Long\",\"list\":true,\"params\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 19:34:20',84),(171,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/t_report','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 19:35:41',63),(172,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"report\",\"className\":\"TAppReport\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":63,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 19:35:41\",\"usableColumn\":false},{\"capJavaField\":\"Msg\",\"columnComment\":\"举报内容\",\"columnId\":64,\"columnName\":\"msg\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"msg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 19:35:41\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"谁举报的\",\"columnId\":65,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 19:33:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 19:35:41\",\"usableColumn\":false},{\"capJavaField\":\"Msgid\",\"columnComment\":\"发送消息id\",\"columnId\":70,\"columnName\":\"msgid\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-05-15 19:35:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-15 19:36:50',42),(173,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_report\"}',NULL,0,NULL,'2023-05-15 19:36:54',389),(174,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"msg\",\"className\":\"TAppMsg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 11:49:21\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"谁发的\",\"columnId\":51,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 11:49:21\",\"usableColumn\":false},{\"capJavaField\":\"TouserId\",\"columnComment\":\"发给谁\",\"columnId\":52,\"columnName\":\"touser_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"touserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-05-15 11:49:21\",\"usableColumn\":false},{\"capJavaField\":\"Msg\",\"columnComment\":\"消息\",\"columnId\":53,\"columnName\":\"msg\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:47:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 09:10:28',99),(175,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_msg\"}',NULL,0,NULL,'2023-05-16 09:10:34',449),(176,'举报',5,'com.ruoyi.system.controller.TAppReportController.export()','POST',1,'admin',NULL,'/app/report/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"state\":\"0\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-05-16 09:44:52',3542);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2023-05-14 14:11:35','',NULL,''),(2,'se','项目经理',2,'0','admin','2023-05-14 14:11:35','',NULL,''),(3,'hr','人力资源',3,'0','admin','2023-05-14 14:11:35','',NULL,''),(4,'user','普通员工',4,'0','admin','2023-05-14 14:11:35','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-05-14 14:11:37','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-05-14 14:11:37','',NULL,'普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-05-16 09:30:25','admin','2023-05-14 14:11:34','','2023-05-16 09:30:24','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-05-14 14:11:34','admin','2023-05-14 14:11:34','',NULL,'测试员');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1),(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2);

/*Table structure for table `t_classification` */

DROP TABLE IF EXISTS `t_classification`;

CREATE TABLE `t_classification` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `typevalue` int NOT NULL DEFAULT '0' COMMENT '类型0 端游 1手游',
  `plot_imgid` bigint NOT NULL COMMENT '背景图',
  `state` int NOT NULL DEFAULT '1' COMMENT '0关闭 1显示',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_classification` */

insert  into `t_classification`(`id`,`name`,`typevalue`,`plot_imgid`,`state`,`create_time`,`update_time`) values (1,'英雄联盟',0,78,1,'2023-05-10 15:12:34','2023-05-15 11:00:46'),(2,'穿越火线',0,17,1,'2023-05-10 15:12:56','2023-05-10 15:13:00'),(3,'CSGO',0,18,1,'2023-06-22 15:23:53','2023-05-11 15:23:59'),(4,'GTA5',0,19,1,'2023-05-11 15:24:20','2023-05-11 15:24:26'),(5,'守望先锋',0,20,1,'2023-05-11 15:24:59','2023-05-11 15:25:01'),(6,'刺激战场',0,21,1,'2023-05-11 15:25:15','2023-05-11 15:25:21'),(7,'王者荣耀',1,22,1,'2023-05-03 15:25:32','2023-05-15 10:02:52'),(8,'和平精英',1,23,1,'2023-03-02 15:25:53','2023-04-26 15:26:02'),(9,'永劫无间',0,77,0,'2023-05-15 11:00:08','2023-05-15 11:00:08');

/*Table structure for table `t_gz` */

DROP TABLE IF EXISTS `t_gz`;

CREATE TABLE `t_gz` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关注',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `touser_id` bigint NOT NULL COMMENT '关注用户id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` date NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_gz` */

/*Table structure for table `t_like` */

DROP TABLE IF EXISTS `t_like`;

CREATE TABLE `t_like` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞',
  `user_id` bigint NOT NULL COMMENT '用户',
  `teamup_id` bigint NOT NULL COMMENT '组队id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_like` */

/*Table structure for table `t_msg` */

DROP TABLE IF EXISTS `t_msg`;

CREATE TABLE `t_msg` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '谁发的消息',
  `touser_id` bigint NOT NULL COMMENT '发给谁的消息',
  `msg` varchar(255) NOT NULL COMMENT '消息',
  `state` int NOT NULL COMMENT '0未读 1已读',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_msg` */

/*Table structure for table `t_photowall` */

DROP TABLE IF EXISTS `t_photowall`;

CREATE TABLE `t_photowall` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '所属用户',
  `url_id` bigint NOT NULL COMMENT '对应资源id',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` date NOT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_photowall` */

insert  into `t_photowall`(`id`,`user_id`,`url_id`,`create_time`,`update_time`) values (4,1726313841,85,'2023-05-24 20:17:31','2023-05-24'),(5,1726313841,86,'2023-05-24 20:18:50','2023-05-24'),(6,1726313841,87,'2023-05-24 20:19:06','2023-05-24'),(7,1726313841,88,'2023-05-24 20:19:15','2023-05-24'),(8,1726313841,89,'2023-05-24 20:19:21','2023-05-24');

/*Table structure for table `t_report` */

DROP TABLE IF EXISTS `t_report`;

CREATE TABLE `t_report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `msg` text NOT NULL COMMENT '举报内容',
  `user_id` bigint NOT NULL COMMENT '谁举报的',
  `msgid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送消息id',
  `state` int NOT NULL COMMENT '0未处理 1处理',
  `touser_id` bigint NOT NULL COMMENT '被举报的用户id',
  `teamup_id` bigint DEFAULT NULL COMMENT '被举报的组队id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_report` */

/*Table structure for table `t_resources` */

DROP TABLE IF EXISTS `t_resources`;

CREATE TABLE `t_resources` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` text NOT NULL COMMENT '资源地址',
  `state` int NOT NULL DEFAULT '0' COMMENT '资源状态0 正常 1未使用',
  `user_id` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_resources` */

insert  into `t_resources`(`id`,`url`,`state`,`user_id`,`create_time`,`update_time`) values (83,'/profile/upload/2023/05/ba3da41a-e44b-4632-aed3-c11e2fff2aad.jpg',0,1726313841,'2023-05-24 20:06:01','2023-05-24 20:06:01'),(84,'/profile/upload/2023/05/3581c776-052d-4e82-a4eb-5ae95895d92a.jpg',0,1726313841,'2023-05-24 20:07:03','2023-05-24 20:07:03'),(85,'/profile/upload/2023/05/8a9920d7-2386-4468-a15d-5a38611b1398.png',0,1726313841,'2023-05-24 20:17:31','2023-05-24 20:17:31'),(86,'/profile/upload/2023/05/e1b9eef5-3508-43cb-9cf8-ff744f7e6658.jpg',0,1726313841,'2023-05-24 20:18:50','2023-05-24 20:18:50'),(87,'/profile/upload/2023/05/d3418460-c19d-495d-b125-e9a1a6d8830d.mp4',0,1726313841,'2023-05-24 20:19:06','2023-05-24 20:19:06'),(88,'/profile/upload/2023/05/e25c8c5e-626e-4ea7-a462-2c3328529a13.jpg',0,1726313841,'2023-05-24 20:19:15','2023-05-24 20:19:15'),(89,'/profile/upload/2023/05/070f1956-19f5-494a-92ba-8d279926eaf9.jpg',0,1726313841,'2023-05-24 20:19:21','2023-05-24 20:19:21'),(90,'/profile/upload/2023/05/a4a1d5a6-6d02-4983-9d3f-544d3cbcff95.jpg',0,1726313841,'2023-05-24 20:20:28','2023-05-24 20:20:28'),(91,'/profile/upload/2023/05/96d9c840-b184-4509-b6e7-858922261288.mp3',0,1726313841,'2023-05-24 20:50:27','2023-05-24 20:50:27'),(92,'/profile/upload/2023/05/61e3c4c0-1053-40b3-b781-09bf7f90e8b0.mp3',0,1726313841,'2023-05-24 20:52:41','2023-05-24 20:52:41'),(93,'/profile/upload/2023/05/6367873a-5ebb-405f-90fa-6300a57af0d3.mp3',0,1726313841,'2023-05-24 20:52:44','2023-05-24 20:52:44'),(94,'/profile/upload/2023/05/0d58ce82-cfab-4a07-a846-0d485c3bca11.mp3',0,1726313841,'2023-05-24 20:55:01','2023-05-24 20:55:01'),(95,'/profile/upload/2023/05/16ecd920-c574-43b0-9188-75c5cd3f0a80.mp3',0,1726313841,'2023-05-24 20:55:15','2023-05-24 20:55:15'),(96,'/profile/upload/2023/05/5e43c289-2d83-45e4-9a68-b9e1a979c87d.mp3',0,1726313841,'2023-05-24 20:55:21','2023-05-24 20:55:21'),(97,'/profile/upload/2023/05/f0f655c5-00d9-48e1-9e1f-881e6d2efef7.mp3',0,1726313841,'2023-05-24 20:55:26','2023-05-24 20:55:26'),(98,'/profile/upload/2023/05/d2ae9d65-e4c4-47f2-9b86-7f27c060ea4c.mp3',0,1726313841,'2023-05-24 20:55:32','2023-05-24 20:55:32'),(99,'/profile/upload/2023/05/b89f2480-ff2d-4cce-a127-00dc10c22d65.mp3',0,1726313841,'2023-05-24 20:56:11','2023-05-24 20:56:11'),(100,'/profile/upload/2023/05/4356ea55-7177-48aa-834a-c47e5df6ed5b.mp3',0,1726313841,'2023-05-24 20:56:48','2023-05-24 20:56:48'),(101,'/profile/upload/2023/05/9bab76b4-d96f-454b-8a22-f1bd2e2b024e.mp3',0,1726313841,'2023-05-24 20:56:52','2023-05-24 20:56:52'),(102,'/profile/upload/2023/05/6a80e306-fe81-484e-9f24-8632eee6a68f.mp3',0,1726313841,'2023-05-24 20:56:56','2023-05-24 20:56:56'),(103,'/profile/upload/2023/05/079e48ba-060e-475f-a50e-b57cdf88d319.mp3',0,1726313841,'2023-05-24 20:57:01','2023-05-24 20:57:01'),(104,'/profile/upload/2023/05/7e5efa96-e3d5-4476-8ef4-05257a93b892.mp3',0,1726313841,'2023-05-24 21:22:59','2023-05-24 21:22:59'),(105,'/profile/upload/2023/05/15404263-dec5-477d-8e04-1c8bdc0dc553.mp3',0,1726313841,'2023-05-24 21:27:39','2023-05-24 21:27:39'),(106,'/profile/upload/2023/05/8674dbe8-2440-4dea-bc6b-d764e1e55e44.mp3',0,1726313841,'2023-05-24 21:30:22','2023-05-24 21:30:22');

/*Table structure for table `t_teamperson` */

DROP TABLE IF EXISTS `t_teamperson`;

CREATE TABLE `t_teamperson` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `teamup_id` bigint NOT NULL COMMENT '组队ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `msguuid` varchar(255) NOT NULL COMMENT '消息id',
  `state` int NOT NULL COMMENT '0为处理 1通过 2拒绝',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_teamperson` */

/*Table structure for table `t_teamup` */

DROP TABLE IF EXISTS `t_teamup`;

CREATE TABLE `t_teamup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `audio_imgid` bigint DEFAULT NULL COMMENT '音频图片id',
  `classification_id` bigint NOT NULL COMMENT '分类ID',
  `largeregion` varchar(255) NOT NULL COMMENT '大区',
  `platooncount` int NOT NULL COMMENT '组队数量',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `forwardcount` bigint NOT NULL DEFAULT '0' COMMENT '转发数量',
  `imageids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片ids',
  `likecount` bigint NOT NULL DEFAULT '0' COMMENT '点赞数',
  `commentcount` bigint NOT NULL DEFAULT '0' COMMENT '评论数',
  `associativegroup` varchar(255) DEFAULT NULL COMMENT '联系群聊',
  `state` int NOT NULL DEFAULT '1' COMMENT '0不显示 1匹配中 2游戏中 3结束 4违规',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_teamup` */

insert  into `t_teamup`(`id`,`user_id`,`audio_imgid`,`classification_id`,`largeregion`,`platooncount`,`title`,`forwardcount`,`imageids`,`likecount`,`commentcount`,`associativegroup`,`state`,`create_time`,`update_time`) values (17,1726313841,NULL,2,'无畏先锋',2,'集美们让我们嗨起来好嘛',0,'',0,0,'phone: 13137908063',1,'2023-05-24 20:21:33','2023-05-24 20:21:44');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint NOT NULL COMMENT 'id',
  `nickname` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '个性签名',
  `bepraised` bigint NOT NULL DEFAULT '0' COMMENT '获赞次数',
  `initiationtimes` int NOT NULL DEFAULT '0' COMMENT '发起次数',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信ID',
  `gender` int NOT NULL COMMENT '0男  1女',
  `age` int NOT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `state` int NOT NULL DEFAULT '1' COMMENT '0 限制操作,只能登录  1 正常',
  `audio_imgid` bigint DEFAULT NULL COMMENT '音频',
  `plot_imgid` bigint DEFAULT NULL COMMENT '背景图',
  `avatar_imgid` bigint DEFAULT NULL COMMENT '头像',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`nickname`,`title`,`bepraised`,`initiationtimes`,`appid`,`gender`,`age`,`birthday`,`state`,`audio_imgid`,`plot_imgid`,`avatar_imgid`,`create_time`,`update_time`) values (1,'系统','系统用户',0,0,NULL,1,1,NULL,1,NULL,NULL,NULL,'2023-04-01 09:14:09','2023-04-08 09:14:16'),(1726313841,'大白菜鸡毛菜','爱生活，爱冒险，勇敢追求自己的梦想',0,4,'o7fdH5SEok4x8Qc78-CEXXSGYARY',0,21,'2002-01-24 00:00:00',1,NULL,90,NULL,'2023-05-24 17:09:06','2023-05-24 20:48:31');

/*Table structure for table `t_wheelseeding` */

DROP TABLE IF EXISTS `t_wheelseeding`;

CREATE TABLE `t_wheelseeding` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `url` text NOT NULL COMMENT '跳转',
  `plot_imgid` bigint NOT NULL COMMENT '图片id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_wheelseeding` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
