-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.14-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 posmaintenance 的数据库结构
CREATE DATABASE IF NOT EXISTS `posmaintenance` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `posmaintenance`;


-- 导出  表 posmaintenance.permission 结构
CREATE TABLE IF NOT EXISTS `permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `title` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '类型 0、菜单 1、功能',
  `state` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0、正常 1、禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `permCode` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '权限编码',
  `icon` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `description` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限表';

-- 正在导出表  posmaintenance.permission 的数据：16 rows
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`id`, `pid`, `title`, `type`, `state`, `sort`, `url`, `permCode`, `icon`, `description`) VALUES
	(2, 0, '权限管理', 0, 0, 2, '/perm/', '2000', 'fa fa-eye', '权限管理'),
	(1, 0, '功能管理', 0, 0, 1, '/sys/', '1000', 'fa fa-magic', '功能管理'),
	(3, 0, '系统监控', 0, 0, 3, '/monitor/', '3000', 'fa fa-bar-chart-o', '系统监控'),
	(4, 0, '操作日志', 0, 0, 4, '/log/', '4000', 'fa fa-bug', '操作日志'),
	(11, 1, '发送邮件测试', 0, 0, 1, '/sys/mail/send.html', '1001', NULL, '发送邮件测试'),
	(12, 1, 'Echarts 测试', 0, 0, 2, '/sys/echarts/map.html', '1002', NULL, '暂无2'),
	(21, 2, '用户管理', 0, 0, 1, '/perm/user/list.html', '2001', NULL, '用户管理'),
	(22, 2, '角色管理', 0, 0, 2, '/perm/role/list.html', '2002', NULL, '角色管理'),
	(23, 2, '权限管理', 0, 0, 3, '/perm/permission/list.html', '2003', NULL, '权限管理'),
	(31, 3, '警告列表', 0, 0, 1, 'abc.html', '3001', NULL, '警告列表'),
	(32, 3, '实时监控', 0, 0, 2, '/monitor/realTime.html', '3002', NULL, '实时监控'),
	(41, 4, '日志列表', 0, 0, 1, '/log/list.html', '4001', NULL, '日志列表'),
	(100, 0, '移动端维护', 0, 0, 0, '/mobileservice', 'mobileservice', 'fa fa-bug', '移动端维护'),
	(101, 100, '移动端维护', 0, 0, 0, '/mobileservice/index', 'mobileservice', 'fa fa-bus', '移动端维护'),
	(200, 0, 'PC端维护', 0, 0, 0, NULL, 'machine', 'fa fa-car', 'PC端维护'),
	(201, 200, 'pos机列表', 0, 0, 0, '/machine/list', 'machine', 'fa fa-cc', 'pos机列表'),
	(202, 200, '商家列表', 0, 0, 0, '/company/list', 'company', 'fa fa-hover', '商家列表'),
	(203, 200, 'pos机维护记录列表', 0, 0, 0, '/servicelog/list', 'servicelog', 'fa fa-venus-mars', 'pos机维护记录列表'),
	(204, 100, '维护服务评价', 0, 0, 0, '/mobileservice/list', 'comment', NULL, '维护服务评价');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- 导出  表 posmaintenance.pos_company 结构
CREATE TABLE IF NOT EXISTS `pos_company` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '所属用户的id',
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `address` varchar(100) NOT NULL COMMENT '公司地址',
  `phone` varchar(100) NOT NULL COMMENT '座机',
  `mobile` varchar(100) NOT NULL COMMENT '手机',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(100) NOT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机商家';

-- 正在导出表  posmaintenance.pos_company 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `pos_company` DISABLE KEYS */;
INSERT INTO `pos_company` (`id`, `user_id`, `name`, `address`, `phone`, `mobile`, `remarks`, `del_flag`) VALUES
	('16db09e28b394e15927780b1517d22b8', 0, '商家8', '地址8', '座机8', '电话8', '商家备注8', '0'),
	('3543669a419d438396f9621bdb7cf92e', 0, '商家5', '地址5', '座机5', '电话5', '商家备注5', '0'),
	('4f8d269f89cb4c3487f1685809a40b07', 2, '商家test', '地址test', '座机test', '电话test', '商家备注test', '0'),
	('50c6c1f7a9f64c938ef81d2f9b2c41a1', 0, '商家6', '地址6', '座机6', '电话6', '商家备注6', '0'),
	('656bfb5442044321a1adfe22fb03df63', 0, '商家2', '地址2', '座机2', '电话2', '商家备注2', '0'),
	('9b40215895a8486288189e427a1a187c', 0, '商家4', '地址4', '座机4', '电话4', '商家备注4', '0'),
	('b6faa25e222c43a984f1d7a06ab84ed5', 0, '商家7', '地址7', '座机7', '电话7', '商家备注7', '0'),
	('bd707bc576354757bc683a3c41c4e31f', 0, '商家1', '地址1', '座机1', '电话1', '商家备注1', '0'),
	('c0bf058a3fbc41b68f2abdd48d30c692', 0, '商家9', '地址9', '座机9', '电话9', '商家备注9', '0'),
	('c4780c57dc2b48809e726e6db2cba6c9', 0, '商家3', '地址3', '座机3', '电话3', '商家备注3', '0');
/*!40000 ALTER TABLE `pos_company` ENABLE KEYS */;


-- 导出  表 posmaintenance.pos_machine 结构
CREATE TABLE IF NOT EXISTS `pos_machine` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `company_id` varchar(64) NOT NULL COMMENT '所属公司id',
  `code` varchar(100) NOT NULL COMMENT 'pos机编码',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机';

-- 正在导出表  posmaintenance.pos_machine 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `pos_machine` DISABLE KEYS */;
INSERT INTO `pos_machine` (`id`, `company_id`, `code`, `remarks`, `del_flag`) VALUES
	('023dbe200b294be8885f9aa085130e5a', '656bfb5442044321a1adfe22fb03df63', '2', '备注', '0'),
	('1b4ddea221c94ac0b4eb4cdd39ca807c', 'c0bf058a3fbc41b68f2abdd48d30c692', '9', '备注', '0'),
	('332c4a37323b4707a1c18689c47171ab', 'b6faa25e222c43a984f1d7a06ab84ed5', '7', '备注', '0'),
	('3afa5e01ed564db89862f06e61a9f92f', '9b40215895a8486288189e427a1a187c', '4', '备注', '0'),
	('3eb2323c1b284eebb71eaba15dd6c881', 'bd707bc576354757bc683a3c41c4e31f', '1', '备注', '0'),
	('56d2e7a6cfa64be8a26e0c27540b3fea', '16db09e28b394e15927780b1517d22b8', '123', '13', '0'),
	('59f7794167f54bdab9244ed6a870f523', '3543669a419d438396f9621bdb7cf92e', '5', '备注', '0'),
	('5dd8cedc0cda495d837ebaa75df0545b', '16db09e28b394e15927780b1517d22b8', '123', '13', '0'),
	('6d391e2cb08e4d7a8a7319381c8d1e15', '50c6c1f7a9f64c938ef81d2f9b2c41a1', '6', '备注', '0'),
	('6f69ed05c975443b83d6d60bfcd0e9ef', '16db09e28b394e15927780b1517d22b8', '8', '备注', '0'),
	('784ce5386baf4776924a5b2dc5c0835e', 'c4780c57dc2b48809e726e6db2cba6c9', '3', '备注', '0'),
	('87838af2b4bb4cffad84f0cd809984e4', '9b40215895a8486288189e427a1a187c', '1111111111', '3111111111111', '0'),
	('bd373e288cfa4628bcb43c20689ded1b', '656bfb5442044321a1adfe22fb03df63', '132', '123', '0'),
	('c88ed804cf174488a794f84d59ed00cb', '16db09e28b394e15927780b1517d22b8', '123', '123', '0'),
	('d4cc2d44e69049b4a65a5a883638e4fd', '4f8d269f89cb4c3487f1685809a40b07', 'test', '备test', '0');
/*!40000 ALTER TABLE `pos_machine` ENABLE KEYS */;


-- 导出  表 posmaintenance.pos_service_log 结构
CREATE TABLE IF NOT EXISTS `pos_service_log` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `machine_id` varchar(64) NOT NULL COMMENT 'pos机id',
  `service_date` datetime NOT NULL COMMENT '维护时间',
  `is_normal` int(11) NOT NULL COMMENT '是否正常,0正常，1故障',
  `msg` varchar(1024) DEFAULT NULL COMMENT '维护情况',
  `user_id` bigint(20) DEFAULT NULL COMMENT '维护工作人员id',
  `feed_back` varchar(1024) DEFAULT NULL COMMENT '用户反馈',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机维护记录';

-- 正在导出表  posmaintenance.pos_service_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `pos_service_log` DISABLE KEYS */;
INSERT INTO `pos_service_log` (`id`, `machine_id`, `service_date`, `is_normal`, `msg`, `user_id`, `feed_back`) VALUES
	('39a14e76f7374f2ea3f772e98bc18011', '3eb2323c1b284eebb71eaba15dd6c881', '2016-09-08 23:09:34', 1, '我还差一个王土大木工', 1, NULL);
/*!40000 ALTER TABLE `pos_service_log` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_blob_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_blob_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_calendars 结构
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_calendars 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_cron_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_cron_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_fired_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_fired_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_job_details 结构
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
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
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_job_details 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_locks 结构
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_locks 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES
	('schedulerFactory', 'STATE_ACCESS'),
	('schedulerFactory', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_paused_trigger_grps 结构
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_paused_trigger_grps 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_scheduler_state 结构
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_scheduler_state 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES
	('schedulerFactory', 'dell-PC1474291709051', 1474292062183, 7500);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_simple_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_simple_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_simprop_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_simprop_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.qrtz_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  posmaintenance.qrtz_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;


-- 导出  表 posmaintenance.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '角色',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(60) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  posmaintenance.role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `sort`, `description`) VALUES
	(1, '管理员', 1, '系统管理员'),
	(2, '普通会员', 2, '普通会员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 posmaintenance.role_permission 结构
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  `pid` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限表';

-- 正在导出表  posmaintenance.role_permission 的数据：21 rows
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`id`, `rid`, `pid`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 11),
	(6, 1, 12),
	(7, 1, 21),
	(8, 1, 22),
	(9, 1, 23),
	(10, 1, 31),
	(11, 1, 32),
	(12, 1, 41),
	(13, 2, 2),
	(14, 2, 21),
	(15, 2, 3),
	(16, 2, 31),
	(17, 2, 32),
	(18, 1, 100),
	(19, 1, 101),
	(20, 1, 200),
	(21, 1, 201),
	(22, 1, 202),
	(23, 1, 203),
	(34, 1, 204);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;


-- 导出  表 posmaintenance.sys_log 结构
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `content` varchar(600) NOT NULL DEFAULT '' COMMENT '日志内容',
  `operation` varchar(250) DEFAULT NULL COMMENT '用户操作',
  `crTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=472019868061794305 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- 正在导出表  posmaintenance.sys_log 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `uid`, `content`, `operation`, `crTime`) VALUES
	(423827573609332736, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=abc&,[IP]:10.10.10.10', '登录', '2016-05-09 21:55:10'),
	(423827889272651776, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 21:56:23'),
	(423828945075437568, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=acbbb&repassword=acbbb&loginName=acbbb&,[IP]:10.10.10.10', '登录', '2016-05-09 22:00:37'),
	(423828960116211712, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:insertSelective,[参数]:password=acbbb&repassword=acbbb&loginName=acbbb&,[IP]:10.10.10.10', '添加用户', '2016-05-09 22:00:40'),
	(423829494923526144, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:02:48'),
	(423829536409387008, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:02:58'),
	(423829555678019584, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:03:02'),
	(423829597029662720, 1, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:deleteUser,[参数]:null,[IP]:10.10.10.10', '删除用户', '2016-05-09 22:03:12'),
	(423829597029662721, 1, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:deleteUser,[参数]:null,[IP]:10.10.10.10', '删除用户', '2016-05-09 22:03:12'),
	(424204895713755136, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:30'),
	(424204946615828480, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:42'),
	(424204971169284096, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:48'),
	(424212917953495040, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 23:26:23'),
	(424213509627183104, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 23:28:44'),
	(424213551029157888, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 23:28:54'),
	(424538597211766784, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=abc&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:31'),
	(424538650328432640, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:44'),
	(424538669534150656, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:48'),
	(424538690912518144, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:53'),
	(424538709661057024, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:58'),
	(424538725716852736, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-11 21:01:02'),
	(468054708267778048, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=8xbk&password=123&ctoken=66adc4fe8627440b847b76fd54d4db30&loginName=admin&,[IP]:192.168.1.109', '登录', '2016-09-08 22:58:00'),
	(468057886224809984, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=ed8d&password=123&ctoken=1fe9ade41222476fa945ecc5d163ea25&loginName=admin&,[IP]:192.168.1.110', '登录', '2016-09-08 23:10:38'),
	(468058611352862720, 1, '[类名]:com.baomidou.springwind.service.impl.RolePermissionServiceImpl,[方法]:selecPermissionIdsByRoleId,[参数]:roleId=2&,[IP]:192.168.1.110', '角色关联菜单查询', '2016-09-08 23:13:31'),
	(468058626452357120, 1, '[类名]:com.baomidou.springwind.service.impl.RolePermissionServiceImpl,[方法]:selecPermissionIdsByRoleId,[参数]:roleId=1&,[IP]:192.168.1.110', '角色关联菜单查询', '2016-09-08 23:13:34'),
	(469501099598938112, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=2n6p&password=123&ctoken=72ee157a1aa641efa4d6d44d6f042299&loginName=admin&,[IP]:192.168.1.110', '登录', '2016-09-12 22:45:27'),
	(469503870251302912, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:192.168.1.110', '登录', '2016-09-12 22:56:27'),
	(469504245213691904, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:192.168.1.110', '登录', '2016-09-12 22:57:57'),
	(471556454160007168, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=d9g7&password=123&ctoken=c1d5d83963bb45b59755c70291433bca&loginName=admin&,[IP]:192.168.10.111', '登录', '2016-09-18 14:52:42'),
	(472002563252682752, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=2ebp&password=123&ctoken=e613100992e248cd871d06f2fc1642d9&loginName=admin&,[IP]:192.168.10.111', '登录', '2016-09-19 20:25:22'),
	(472019772293251072, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:192.168.10.111', '登录', '2016-09-19 21:33:45'),
	(472019868061794304, NULL, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:192.168.10.111', '登录', '2016-09-19 21:34:08');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;


-- 导出  表 posmaintenance.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `loginName` varchar(30) NOT NULL COMMENT '登录名称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0、普通用户 1、管理员',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '0、禁用 1、正常',
  `crTime` datetime NOT NULL COMMENT '创建时间',
  `lastTime` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 正在导出表  posmaintenance.user 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `loginName`, `password`, `email`, `type`, `status`, `crTime`, `lastTime`) VALUES
	(1, 'admin', 'b9140469ac5d2a70d86a583e9095ad6f', NULL, 0, 1, '2016-04-17 18:52:26', '2016-04-17 18:52:26'),
	(2, 'test', 'b9140469ac5d2a70d86a583e9095ad6f', NULL, 0, 1, '2016-04-14 18:22:58', '2016-04-14 18:22:58');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 posmaintenance.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- 正在导出表  posmaintenance.user_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `uid`, `rid`) VALUES
	(1, 1, 1),
	(2, 2, 2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
