/*
Navicat MySQL Data Transfer

Source Server         : pos
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : posmaintenance

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2016-09-08 23:25:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
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

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('2', '0', '权限管理', '0', '0', '2', '/perm/', '2000', 'fa fa-eye', '权限管理');
INSERT INTO `permission` VALUES ('1', '0', '功能管理', '0', '0', '1', '/sys/', '1000', 'fa fa-magic', '功能管理');
INSERT INTO `permission` VALUES ('3', '0', '系统监控', '0', '0', '3', '/monitor/', '3000', 'fa fa-bar-chart-o', '系统监控');
INSERT INTO `permission` VALUES ('4', '0', '操作日志', '0', '0', '4', '/log/', '4000', 'fa fa-bug', '操作日志');
INSERT INTO `permission` VALUES ('11', '1', '发送邮件测试', '0', '0', '1', '/sys/mail/send.html', '1001', null, '发送邮件测试');
INSERT INTO `permission` VALUES ('12', '1', 'Echarts 测试', '0', '0', '2', '/sys/echarts/map.html', '1002', null, '暂无2');
INSERT INTO `permission` VALUES ('21', '2', '用户管理', '0', '0', '1', '/perm/user/list.html', '2001', null, '用户管理');
INSERT INTO `permission` VALUES ('22', '2', '角色管理', '0', '0', '2', '/perm/role/list.html', '2002', null, '角色管理');
INSERT INTO `permission` VALUES ('23', '2', '权限管理', '0', '0', '3', '/perm/permission/list.html', '2003', null, '权限管理');
INSERT INTO `permission` VALUES ('31', '3', '警告列表', '0', '0', '1', 'abc.html', '3001', null, '警告列表');
INSERT INTO `permission` VALUES ('32', '3', '实时监控', '0', '0', '2', '/monitor/realTime.html', '3002', null, '实时监控');
INSERT INTO `permission` VALUES ('41', '4', '日志列表', '0', '0', '1', '/log/list.html', '4001', null, '日志列表');
INSERT INTO `permission` VALUES ('100', '0', '移动端维护', '0', '0', '0', '/mobileservice', 'mobileservice', 'fa fa-bug', '移动端维护');
INSERT INTO `permission` VALUES ('101', '100', '移动端维护', '0', '0', '0', '/mobileservice/index', 'mobileservice', 'fa fa-bug', '移动端维护');

-- ----------------------------
-- Table structure for pos_company
-- ----------------------------
DROP TABLE IF EXISTS `pos_company`;
CREATE TABLE `pos_company` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `address` varchar(100) NOT NULL COMMENT '公司地址',
  `phone` varchar(100) NOT NULL COMMENT '座机',
  `mobile` varchar(100) NOT NULL COMMENT '手机',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(100) NOT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机商家';

-- ----------------------------
-- Records of pos_company
-- ----------------------------
INSERT INTO `pos_company` VALUES ('16db09e28b394e15927780b1517d22b8', '商家8', '地址8', '座机8', '电话8', '商家备注8', '0');
INSERT INTO `pos_company` VALUES ('3543669a419d438396f9621bdb7cf92e', '商家5', '地址5', '座机5', '电话5', '商家备注5', '0');
INSERT INTO `pos_company` VALUES ('4f8d269f89cb4c3487f1685809a40b07', '商家0', '地址0', '座机0', '电话0', '商家备注0', '0');
INSERT INTO `pos_company` VALUES ('50c6c1f7a9f64c938ef81d2f9b2c41a1', '商家6', '地址6', '座机6', '电话6', '商家备注6', '0');
INSERT INTO `pos_company` VALUES ('656bfb5442044321a1adfe22fb03df63', '商家2', '地址2', '座机2', '电话2', '商家备注2', '0');
INSERT INTO `pos_company` VALUES ('9b40215895a8486288189e427a1a187c', '商家4', '地址4', '座机4', '电话4', '商家备注4', '0');
INSERT INTO `pos_company` VALUES ('b6faa25e222c43a984f1d7a06ab84ed5', '商家7', '地址7', '座机7', '电话7', '商家备注7', '0');
INSERT INTO `pos_company` VALUES ('bd707bc576354757bc683a3c41c4e31f', '商家1', '地址1', '座机1', '电话1', '商家备注1', '0');
INSERT INTO `pos_company` VALUES ('c0bf058a3fbc41b68f2abdd48d30c692', '商家9', '地址9', '座机9', '电话9', '商家备注9', '0');
INSERT INTO `pos_company` VALUES ('c4780c57dc2b48809e726e6db2cba6c9', '商家3', '地址3', '座机3', '电话3', '商家备注3', '0');

-- ----------------------------
-- Table structure for pos_machine
-- ----------------------------
DROP TABLE IF EXISTS `pos_machine`;
CREATE TABLE `pos_machine` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `company_id` varchar(64) NOT NULL COMMENT '所属公司id',
  `code` varchar(100) NOT NULL COMMENT 'pos机编码',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机';

-- ----------------------------
-- Records of pos_machine
-- ----------------------------
INSERT INTO `pos_machine` VALUES ('023dbe200b294be8885f9aa085130e5a', '656bfb5442044321a1adfe22fb03df63', '2', '备注', '0');
INSERT INTO `pos_machine` VALUES ('1b4ddea221c94ac0b4eb4cdd39ca807c', 'c0bf058a3fbc41b68f2abdd48d30c692', '9', '备注', '0');
INSERT INTO `pos_machine` VALUES ('332c4a37323b4707a1c18689c47171ab', 'b6faa25e222c43a984f1d7a06ab84ed5', '7', '备注', '0');
INSERT INTO `pos_machine` VALUES ('3afa5e01ed564db89862f06e61a9f92f', '9b40215895a8486288189e427a1a187c', '4', '备注', '0');
INSERT INTO `pos_machine` VALUES ('3eb2323c1b284eebb71eaba15dd6c881', 'bd707bc576354757bc683a3c41c4e31f', '1', '备注', '0');
INSERT INTO `pos_machine` VALUES ('59f7794167f54bdab9244ed6a870f523', '3543669a419d438396f9621bdb7cf92e', '5', '备注', '0');
INSERT INTO `pos_machine` VALUES ('6d391e2cb08e4d7a8a7319381c8d1e15', '50c6c1f7a9f64c938ef81d2f9b2c41a1', '6', '备注', '0');
INSERT INTO `pos_machine` VALUES ('6f69ed05c975443b83d6d60bfcd0e9ef', '16db09e28b394e15927780b1517d22b8', '8', '备注', '0');
INSERT INTO `pos_machine` VALUES ('784ce5386baf4776924a5b2dc5c0835e', 'c4780c57dc2b48809e726e6db2cba6c9', '3', '备注', '0');
INSERT INTO `pos_machine` VALUES ('d4cc2d44e69049b4a65a5a883638e4fd', '4f8d269f89cb4c3487f1685809a40b07', '0', '备注', '0');

-- ----------------------------
-- Table structure for pos_service_log
-- ----------------------------
DROP TABLE IF EXISTS `pos_service_log`;
CREATE TABLE `pos_service_log` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `machine_id` varchar(64) NOT NULL COMMENT 'pos机id',
  `service_date` datetime NOT NULL COMMENT '维护时间',
  `is_normal` int(11) NOT NULL COMMENT '是否正常,0正常，1故障',
  `msg` varchar(1024) DEFAULT NULL COMMENT '维护情况',
  `user_id` bigint(20) DEFAULT NULL COMMENT '维护工作人员id',
  `feed_back` varchar(1024) DEFAULT NULL COMMENT '用户反馈',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos机维护记录';

-- ----------------------------
-- Records of pos_service_log
-- ----------------------------
INSERT INTO `pos_service_log` VALUES ('39a14e76f7374f2ea3f772e98bc18011', '3eb2323c1b284eebb71eaba15dd6c881', '2016-09-08 23:09:34', '1', '我还差一个王土大木工', '1', null);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
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

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
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
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('schedulerFactory', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactory', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactory', 'user-PC1473347747290', '1473348138616', '7500');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
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

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '角色',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(60) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '1', '系统管理员');
INSERT INTO `role` VALUES ('2', '普通会员', '2', '普通会员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  `pid` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '1', '4');
INSERT INTO `role_permission` VALUES ('5', '1', '11');
INSERT INTO `role_permission` VALUES ('6', '1', '12');
INSERT INTO `role_permission` VALUES ('7', '1', '21');
INSERT INTO `role_permission` VALUES ('8', '1', '22');
INSERT INTO `role_permission` VALUES ('9', '1', '23');
INSERT INTO `role_permission` VALUES ('10', '1', '31');
INSERT INTO `role_permission` VALUES ('11', '1', '32');
INSERT INTO `role_permission` VALUES ('12', '1', '41');
INSERT INTO `role_permission` VALUES ('13', '2', '2');
INSERT INTO `role_permission` VALUES ('14', '2', '21');
INSERT INTO `role_permission` VALUES ('15', '2', '3');
INSERT INTO `role_permission` VALUES ('16', '2', '31');
INSERT INTO `role_permission` VALUES ('17', '2', '32');
INSERT INTO `role_permission` VALUES ('18', '1', '100');
INSERT INTO `role_permission` VALUES ('19', '1', '101');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `content` varchar(600) NOT NULL DEFAULT '' COMMENT '日志内容',
  `operation` varchar(250) DEFAULT NULL COMMENT '用户操作',
  `crTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=468058626452357121 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('423827573609332736', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=abc&,[IP]:10.10.10.10', '登录', '2016-05-09 21:55:10');
INSERT INTO `sys_log` VALUES ('423827889272651776', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 21:56:23');
INSERT INTO `sys_log` VALUES ('423828945075437568', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=acbbb&repassword=acbbb&loginName=acbbb&,[IP]:10.10.10.10', '登录', '2016-05-09 22:00:37');
INSERT INTO `sys_log` VALUES ('423828960116211712', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:insertSelective,[参数]:password=acbbb&repassword=acbbb&loginName=acbbb&,[IP]:10.10.10.10', '添加用户', '2016-05-09 22:00:40');
INSERT INTO `sys_log` VALUES ('423829494923526144', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:02:48');
INSERT INTO `sys_log` VALUES ('423829536409387008', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:02:58');
INSERT INTO `sys_log` VALUES ('423829555678019584', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-09 22:03:02');
INSERT INTO `sys_log` VALUES ('423829597029662720', '1', '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:deleteUser,[参数]:null,[IP]:10.10.10.10', '删除用户', '2016-05-09 22:03:12');
INSERT INTO `sys_log` VALUES ('423829597029662721', '1', '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:deleteUser,[参数]:null,[IP]:10.10.10.10', '删除用户', '2016-05-09 22:03:12');
INSERT INTO `sys_log` VALUES ('424204895713755136', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:30');
INSERT INTO `sys_log` VALUES ('424204946615828480', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:42');
INSERT INTO `sys_log` VALUES ('424204971169284096', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 22:54:48');
INSERT INTO `sys_log` VALUES ('424212917953495040', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 23:26:23');
INSERT INTO `sys_log` VALUES ('424213509627183104', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-10 23:28:44');
INSERT INTO `sys_log` VALUES ('424213551029157888', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-10 23:28:54');
INSERT INTO `sys_log` VALUES ('424538597211766784', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=abc&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:31');
INSERT INTO `sys_log` VALUES ('424538650328432640', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:44');
INSERT INTO `sys_log` VALUES ('424538669534150656', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=abc&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:48');
INSERT INTO `sys_log` VALUES ('424538690912518144', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&loginName=admin&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:53');
INSERT INTO `sys_log` VALUES ('424538709661057024', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-11 21:00:58');
INSERT INTO `sys_log` VALUES ('424538725716852736', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:password=123&,[IP]:10.10.10.10', '登录', '2016-05-11 21:01:02');
INSERT INTO `sys_log` VALUES ('468054708267778048', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=8xbk&password=123&ctoken=66adc4fe8627440b847b76fd54d4db30&loginName=admin&,[IP]:192.168.1.109', '登录', '2016-09-08 22:58:00');
INSERT INTO `sys_log` VALUES ('468057886224809984', null, '[类名]:com.baomidou.springwind.service.impl.UserServiceImpl,[方法]:selectByLoginName,[参数]:captcha=ed8d&password=123&ctoken=1fe9ade41222476fa945ecc5d163ea25&loginName=admin&,[IP]:192.168.1.110', '登录', '2016-09-08 23:10:38');
INSERT INTO `sys_log` VALUES ('468058611352862720', '1', '[类名]:com.baomidou.springwind.service.impl.RolePermissionServiceImpl,[方法]:selecPermissionIdsByRoleId,[参数]:roleId=2&,[IP]:192.168.1.110', '角色关联菜单查询', '2016-09-08 23:13:31');
INSERT INTO `sys_log` VALUES ('468058626452357120', '1', '[类名]:com.baomidou.springwind.service.impl.RolePermissionServiceImpl,[方法]:selecPermissionIdsByRoleId,[参数]:roleId=1&,[IP]:192.168.1.110', '角色关联菜单查询', '2016-09-08 23:13:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'b9140469ac5d2a70d86a583e9095ad6f', null, '0', '1', '2016-04-17 18:52:26', '2016-04-17 18:52:26');
INSERT INTO `user` VALUES ('2', 'test', 'd227f9edb541169068b11221869a014a', null, '0', '1', '2016-04-14 18:22:58', '2016-04-14 18:22:58');
INSERT INTO `user` VALUES ('415112286823251968', 'abc', 'c4c99e1a5bd140d138ad0863bf59acb3', null, '0', '1', '2016-04-15 20:43:43', '2016-04-15 20:43:43');
INSERT INTO `user` VALUES ('415112325381488640', 'def', '94e5398201cd9452b1e667044debcd10', null, '0', '1', '2016-04-15 20:43:53', '2016-04-15 20:43:53');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
