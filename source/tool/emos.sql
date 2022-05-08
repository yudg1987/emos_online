/*
SQLyog Enterprise - MySQL GUI v6.16 b1
MySQL - 5.7.36 : Database - emos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `emos`;

USE `emos`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_key` varchar(200) NOT NULL COMMENT '参数名',
  `param_value` varchar(200) DEFAULT NULL COMMENT '参数值',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_param_key` (`param_key`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'attendanceStartTime','8:30',1,'上班考勤开始时间'),(2,'attendanceTime','8:30',1,'上班时间'),(3,'attendanceEndTime','17:30',1,'上班考勤结束时间'),(4,'closingStartTime','17:30',1,'下班考勤开始时间'),(5,'closingTime','17:30',1,'下班时间'),(6,'closingEndTime','17:30',1,'下班考勤结束时间');

/*Table structure for table `tb_action` */

DROP TABLE IF EXISTS `tb_action`;

CREATE TABLE `tb_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_code` varchar(200) NOT NULL COMMENT '行为编号',
  `action_name` varchar(200) NOT NULL COMMENT '行为名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_action_name` (`action_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行为表';

/*Data for the table `tb_action` */

/*Table structure for table `tb_checkin` */

DROP TABLE IF EXISTS `tb_checkin`;

CREATE TABLE `tb_checkin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `address` varchar(255) DEFAULT NULL COMMENT '签到地址',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `district` varchar(255) DEFAULT NULL COMMENT '区划',
  `status` tinyint(3) unsigned NOT NULL COMMENT '考勤结果',
  `risk` int(10) unsigned DEFAULT '0' COMMENT '风险等级',
  `date` date NOT NULL COMMENT '签到日期',
  `create_time` datetime NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_user_id` (`user_id`,`date`) USING BTREE,
  KEY `idx_date` (`date`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='签到表';

/*Data for the table `tb_checkin` */

/*Table structure for table `tb_city` */

DROP TABLE IF EXISTS `tb_city`;

CREATE TABLE `tb_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city` varchar(200) NOT NULL COMMENT '城市名称',
  `code` varchar(200) NOT NULL COMMENT '拼音简称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_city` (`city`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='疫情城市列表';

/*Data for the table `tb_city` */

insert  into `tb_city`(`id`,`city`,`code`) values (1,'合肥市','hf'),(2,'上海市','sh'),(3,'北京市','bj'),(4,'滁州市','chuzhou'),(5,'六安','la');

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_name` varchar(200) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_dept_name` (`dept_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`id`,`dept_name`) values (1111,'技术部');

/*Table structure for table `tb_employee` */

DROP TABLE IF EXISTS `tb_employee`;

CREATE TABLE `tb_employee` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '注册码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `tel` char(11) NOT NULL COMMENT '电话',
  `email` varchar(200) NOT NULL COMMENT '邮箱',
  `hiredate` date NOT NULL COMMENT '入职日期',
  `role` json NOT NULL COMMENT '角色',
  `dept_id` int(11) NOT NULL COMMENT '部门id',
  `sex` enum('男','女') DEFAULT '男' COMMENT '性别',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table `tb_employee` */

insert  into `tb_employee`(`code`,`name`,`tel`,`email`,`hiredate`,`role`,`dept_id`,`sex`,`state`) values (1000,'俞登刚','17368837302','398305246@qq.com','2022-05-02','1',1111,'男',1);

/*Table structure for table `tb_face_model` */

DROP TABLE IF EXISTS `tb_face_model`;

CREATE TABLE `tb_face_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键值',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `face_model` text NOT NULL COMMENT '用户人脸模型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_face_model` */

/*Table structure for table `tb_holidays` */

DROP TABLE IF EXISTS `tb_holidays`;

CREATE TABLE `tb_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='节假日表';

/*Data for the table `tb_holidays` */

/*Table structure for table `tb_meeting` */

DROP TABLE IF EXISTS `tb_meeting`;

CREATE TABLE `tb_meeting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(200) DEFAULT NULL COMMENT 'UUID',
  `title` varchar(200) NOT NULL COMMENT '会议题目',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `date` date NOT NULL COMMENT '日期',
  `place` varchar(200) DEFAULT NULL COMMENT '开会地点',
  `start` time NOT NULL COMMENT '开始时间',
  `end` time NOT NULL COMMENT '结束时间',
  `type` smallint(6) NOT NULL COMMENT '会议类型（1在线会议，2线下会议）',
  `members` json NOT NULL COMMENT '参与者',
  `desc` varchar(200) NOT NULL COMMENT '会议内容',
  `instance_id` varchar(200) DEFAULT NULL COMMENT '工作流实例ID',
  `status` smallint(6) NOT NULL COMMENT '状态（1未开始，2进行中，3已结束）',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_creator_id` (`creator_id`) USING BTREE,
  KEY `idx_date` (`date`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会议表';

/*Data for the table `tb_meeting` */

/*Table structure for table `tb_meeting_approval` */

DROP TABLE IF EXISTS `tb_meeting_approval`;

CREATE TABLE `tb_meeting_approval` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) NOT NULL COMMENT 'uuid',
  `last_user` bigint(20) DEFAULT NULL COMMENT '最后审批人',
  `members` json NOT NULL COMMENT '需要审批的人元列表',
  `approvals` json DEFAULT NULL COMMENT '已经审批的人员列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_meeting_approval` */

/*Table structure for table `tb_module` */

DROP TABLE IF EXISTS `tb_module`;

CREATE TABLE `tb_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module_code` varchar(200) NOT NULL COMMENT '模块编号',
  `module_name` varchar(200) NOT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_module_id` (`module_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块资源表';

/*Data for the table `tb_module` */

/*Table structure for table `tb_permission` */

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_name` varchar(200) NOT NULL COMMENT '权限',
  `module_id` int(10) unsigned NOT NULL COMMENT '模块ID',
  `action_id` int(10) unsigned NOT NULL COMMENT '行为ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_permission` (`permission_name`) USING BTREE,
  UNIQUE KEY `unq_complex` (`module_id`,`action_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_permission` */

insert  into `tb_permission`(`id`,`permission_name`,`module_id`,`action_id`) values (1,'员工维护',1,1);

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(200) NOT NULL COMMENT '角色名称',
  `permissions` json NOT NULL COMMENT '权限集合',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`role_name`,`permissions`) values (1,'超级管理员','[1]');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `open_id` varchar(200) DEFAULT NULL COMMENT '长期授权字符串',
  `nickname` varchar(200) DEFAULT NULL COMMENT '昵称',
  `photo` varchar(200) DEFAULT NULL COMMENT '头像网址',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` enum('男','女') DEFAULT NULL COMMENT '性别',
  `tel` char(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `hiredate` date DEFAULT NULL COMMENT '入职日期',
  `role` json NOT NULL COMMENT '角色',
  `root` tinyint(1) NOT NULL COMMENT '是否是超级管理员',
  `dept_id` int(10) unsigned DEFAULT NULL COMMENT '部门编号',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_open_id` (`open_id`) USING BTREE,
  KEY `unq_email` (`email`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`open_id`,`nickname`,`photo`,`name`,`sex`,`tel`,`email`,`hiredate`,`role`,`root`,`dept_id`,`status`,`create_time`) values (102,'oIGHs5BmHK2ZzVP5brSMo9Er8fIw','微信用户','https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132','俞登刚','男','17368837302','398305246@qq.com','2022-05-02','[1]',1,1111,1,'2022-05-07 14:43:14');

/*Table structure for table `tb_workday` */

DROP TABLE IF EXISTS `tb_workday`;

CREATE TABLE `tb_workday` (
  `id` int(11) NOT NULL COMMENT '主键',
  `date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_workday` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
