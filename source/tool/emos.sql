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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `param_key` varchar(200) NOT NULL COMMENT '?????????',
  `param_value` varchar(200) DEFAULT NULL COMMENT '?????????',
  `status` tinyint(3) unsigned NOT NULL COMMENT '??????',
  `remark` varchar(200) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_param_key` (`param_key`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'attendanceStartTime','8:30',1,'????????????????????????'),(2,'attendanceTime','8:30',1,'????????????'),(3,'attendanceEndTime','17:30',1,'????????????????????????'),(4,'closingStartTime','17:30',1,'????????????????????????'),(5,'closingTime','17:30',1,'????????????'),(6,'closingEndTime','17:30',1,'????????????????????????');

/*Table structure for table `tb_action` */

DROP TABLE IF EXISTS `tb_action`;

CREATE TABLE `tb_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `action_code` varchar(200) NOT NULL COMMENT '????????????',
  `action_name` varchar(200) NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_action_name` (`action_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????';

/*Data for the table `tb_action` */

/*Table structure for table `tb_checkin` */

DROP TABLE IF EXISTS `tb_checkin`;

CREATE TABLE `tb_checkin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `user_id` int(10) unsigned NOT NULL COMMENT '??????ID',
  `address` varchar(255) DEFAULT NULL COMMENT '????????????',
  `country` varchar(255) DEFAULT NULL COMMENT '??????',
  `province` varchar(255) DEFAULT NULL COMMENT '??????',
  `city` varchar(255) DEFAULT NULL COMMENT '??????',
  `district` varchar(255) DEFAULT NULL COMMENT '??????',
  `status` tinyint(3) unsigned NOT NULL COMMENT '????????????',
  `risk` int(10) unsigned DEFAULT '0' COMMENT '????????????',
  `date` date NOT NULL COMMENT '????????????',
  `create_time` datetime NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_user_id` (`user_id`,`date`) USING BTREE,
  KEY `idx_date` (`date`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????';

/*Data for the table `tb_checkin` */

/*Table structure for table `tb_city` */

DROP TABLE IF EXISTS `tb_city`;

CREATE TABLE `tb_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `city` varchar(200) NOT NULL COMMENT '????????????',
  `code` varchar(200) NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_city` (`city`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='??????????????????';

/*Data for the table `tb_city` */

insert  into `tb_city`(`id`,`city`,`code`) values (1,'?????????','hf'),(2,'?????????','sh'),(3,'?????????','bj'),(4,'?????????','chuzhou'),(5,'??????','la');

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `dept_name` varchar(200) NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_dept_name` (`dept_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`id`,`dept_name`) values (1111,'?????????');

/*Table structure for table `tb_employee` */

DROP TABLE IF EXISTS `tb_employee`;

CREATE TABLE `tb_employee` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '?????????',
  `name` varchar(20) NOT NULL COMMENT '??????',
  `tel` char(11) NOT NULL COMMENT '??????',
  `email` varchar(200) NOT NULL COMMENT '??????',
  `hiredate` date NOT NULL COMMENT '????????????',
  `role` json NOT NULL COMMENT '??????',
  `dept_id` int(11) NOT NULL COMMENT '??????id',
  `sex` enum('???','???') DEFAULT '???' COMMENT '??????',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '??????',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table `tb_employee` */

insert  into `tb_employee`(`code`,`name`,`tel`,`email`,`hiredate`,`role`,`dept_id`,`sex`,`state`) values (1000,'?????????','17368837302','398305246@qq.com','2022-05-02','1',1111,'???',1);

/*Table structure for table `tb_face_model` */

DROP TABLE IF EXISTS `tb_face_model`;

CREATE TABLE `tb_face_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '?????????',
  `user_id` int(10) unsigned NOT NULL COMMENT '??????ID',
  `face_model` text NOT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_face_model` */

/*Table structure for table `tb_holidays` */

DROP TABLE IF EXISTS `tb_holidays`;

CREATE TABLE `tb_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `date` date NOT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='????????????';

/*Data for the table `tb_holidays` */

/*Table structure for table `tb_meeting` */

DROP TABLE IF EXISTS `tb_meeting`;

CREATE TABLE `tb_meeting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `uuid` varchar(200) DEFAULT NULL COMMENT 'UUID',
  `title` varchar(200) NOT NULL COMMENT '????????????',
  `creator_id` bigint(20) NOT NULL COMMENT '?????????ID',
  `date` date NOT NULL COMMENT '??????',
  `place` varchar(200) DEFAULT NULL COMMENT '????????????',
  `start` time NOT NULL COMMENT '????????????',
  `end` time NOT NULL COMMENT '????????????',
  `type` smallint(6) NOT NULL COMMENT '???????????????1???????????????2???????????????',
  `members` json NOT NULL COMMENT '?????????',
  `desc` varchar(200) NOT NULL COMMENT '????????????',
  `instance_id` varchar(200) DEFAULT NULL COMMENT '???????????????ID',
  `status` smallint(6) NOT NULL COMMENT '?????????1????????????2????????????3????????????',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_creator_id` (`creator_id`) USING BTREE,
  KEY `idx_date` (`date`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????';

/*Data for the table `tb_meeting` */

/*Table structure for table `tb_meeting_approval` */

DROP TABLE IF EXISTS `tb_meeting_approval`;

CREATE TABLE `tb_meeting_approval` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) NOT NULL COMMENT 'uuid',
  `last_user` bigint(20) DEFAULT NULL COMMENT '???????????????',
  `members` json NOT NULL COMMENT '???????????????????????????',
  `approvals` json DEFAULT NULL COMMENT '???????????????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_meeting_approval` */

/*Table structure for table `tb_module` */

DROP TABLE IF EXISTS `tb_module`;

CREATE TABLE `tb_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `module_code` varchar(200) NOT NULL COMMENT '????????????',
  `module_name` varchar(200) NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_module_id` (`module_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='???????????????';

/*Data for the table `tb_module` */

/*Table structure for table `tb_permission` */

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `permission_name` varchar(200) NOT NULL COMMENT '??????',
  `module_id` int(10) unsigned NOT NULL COMMENT '??????ID',
  `action_id` int(10) unsigned NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_permission` (`permission_name`) USING BTREE,
  UNIQUE KEY `unq_complex` (`module_id`,`action_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_permission` */

insert  into `tb_permission`(`id`,`permission_name`,`module_id`,`action_id`) values (1,'????????????',1,1);

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `role_name` varchar(200) NOT NULL COMMENT '????????????',
  `permissions` json NOT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????';

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`role_name`,`permissions`) values (1,'???????????????','[1]');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
  `open_id` varchar(200) DEFAULT NULL COMMENT '?????????????????????',
  `nickname` varchar(200) DEFAULT NULL COMMENT '??????',
  `photo` varchar(200) DEFAULT NULL COMMENT '????????????',
  `name` varchar(20) DEFAULT NULL COMMENT '??????',
  `sex` enum('???','???') DEFAULT NULL COMMENT '??????',
  `tel` char(11) DEFAULT NULL COMMENT '????????????',
  `email` varchar(200) DEFAULT NULL COMMENT '??????',
  `hiredate` date DEFAULT NULL COMMENT '????????????',
  `role` json NOT NULL COMMENT '??????',
  `root` tinyint(1) NOT NULL COMMENT '????????????????????????',
  `dept_id` int(10) unsigned DEFAULT NULL COMMENT '????????????',
  `status` tinyint(4) NOT NULL COMMENT '??????',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_open_id` (`open_id`) USING BTREE,
  KEY `unq_email` (`email`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????';

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`open_id`,`nickname`,`photo`,`name`,`sex`,`tel`,`email`,`hiredate`,`role`,`root`,`dept_id`,`status`,`create_time`) values (102,'oIGHs5BmHK2ZzVP5brSMo9Er8fIw','????????????','https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132','?????????','???','17368837302','398305246@qq.com','2022-05-02','[1]',1,1111,1,'2022-05-07 14:43:14');

/*Table structure for table `tb_workday` */

DROP TABLE IF EXISTS `tb_workday`;

CREATE TABLE `tb_workday` (
  `id` int(11) NOT NULL COMMENT '??????',
  `date` date DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_workday` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
