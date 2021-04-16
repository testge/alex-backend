/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : platform

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-04-16 21:24:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_data_factory
-- ----------------------------
DROP TABLE IF EXISTS `t_data_factory`;
CREATE TABLE `t_data_factory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '数据工厂名称',
  `type` tinyint DEFAULT NULL COMMENT '类型 0SQL 1接口 2ui',
  `times` int DEFAULT NULL COMMENT '执行次数',
  `failed_stop` tinyint DEFAULT NULL COMMENT '遇到错误停止运行 0是1否',
  `sql_run_dev` tinyint DEFAULT NULL COMMENT '0dev1test2stg3prod4debug',
  `sql_db_id` int DEFAULT NULL COMMENT '数据源编号',
  `sql_str` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'sql语句',
  `interface_suite_id` int DEFAULT NULL COMMENT '接口用例编号',
  `ui_suite_id` int DEFAULT NULL COMMENT 'ui用例编号',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `execute_type` tinyint DEFAULT NULL COMMENT '执行方式 0并行1串行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_data_factory
-- ----------------------------
INSERT INTO `t_data_factory` VALUES ('1', '执行平台测试套件', '1', '1000', '1', null, null, null, '35', null, '2020-11-30 16:34:30', '2021-04-12 16:58:56', '0');

-- ----------------------------
-- Table structure for t_db
-- ----------------------------
DROP TABLE IF EXISTS `t_db`;
CREATE TABLE `t_db` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint DEFAULT NULL COMMENT '0mysql 1oracle 2SqlServer',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '连接url',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0启动 1禁用',
  `test_url` varchar(100) DEFAULT NULL COMMENT '测试环境url',
  `test_username` varchar(100) DEFAULT NULL COMMENT '测试环境username',
  `test_password` varchar(100) DEFAULT NULL COMMENT '测试环境password',
  `dev_url` varchar(100) DEFAULT NULL COMMENT '开发环境url',
  `dev_username` varchar(100) DEFAULT NULL COMMENT '开发环境username',
  `dev_password` varchar(100) DEFAULT NULL COMMENT '开发环境password',
  `stg_url` varchar(100) DEFAULT NULL COMMENT '预上线环境url',
  `stg_username` varchar(100) DEFAULT NULL COMMENT '预上线环境username',
  `stg_password` varchar(100) DEFAULT NULL COMMENT '预上线环境password',
  `prod_url` varchar(100) DEFAULT NULL COMMENT '生产环境url',
  `prod_username` varchar(100) DEFAULT NULL COMMENT '生产环境username',
  `prod_password` varchar(100) DEFAULT NULL COMMENT '生产环境password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_db
-- ----------------------------
INSERT INTO `t_db` VALUES ('1', 'platform', '0', '自动化平台库', 'jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8', 'root', 'root', '2020-09-02 15:40:50', '2020-10-21 11:31:11', '0', 'jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8', 'root', 'root', 'jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8', 'root', 'root', 'jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8', 'root', 'root', 'jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8', 'root', 'root');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate` tinyint DEFAULT NULL COMMENT '评分',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '反馈内容',
  `created_time` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0未读 1已读未回 2已回待阅  3已回已阅',
  `creator_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '反馈人昵称（real_name）',
  `creator_id` int DEFAULT NULL COMMENT '反馈人id（user_id）',
  `reply` varchar(200) DEFAULT NULL COMMENT '回复',
  `reply_time` datetime DEFAULT NULL,
  `solution` tinyint DEFAULT NULL COMMENT '解决方案 0暂不调整 1延期解决 2已解决 3未答复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('2', '5', '不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错', '2021-04-11 22:53:46', '3', '123', '1', '修复好了', '2021-04-11 23:07:01', '2');
INSERT INTO `t_feedback` VALUES ('3', '2', '123', '2021-04-11 23:23:18', '3', '123', '1', '123', '2021-04-12 16:32:52', '0');
INSERT INTO `t_feedback` VALUES ('4', '1', '123', '2021-04-15 11:26:18', '1', '123', '1', null, null, null);

-- ----------------------------
-- Table structure for t_http_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_http_setting`;
CREATE TABLE `t_http_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT COMMENT '配置编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置项名称',
  `value` varchar(50) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL COMMENT '配置项描述',
  `status` tinyint DEFAULT NULL COMMENT '状态 0启用1禁用',
  `type` tinyint DEFAULT NULL COMMENT '类型 0代理1公共头2邮箱3ConnectTimeout4ReadTimeout',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_http_setting
-- ----------------------------
INSERT INTO `t_http_setting` VALUES ('7', '本地代理', 'localhost:8888', '', '1', '0', '2020-10-02 16:14:57', '2021-04-15 13:38:06');
INSERT INTO `t_http_setting` VALUES ('11', 'qq', '1014759718@qq.com', '', '0', '2', '2020-10-02 18:57:14', '2021-04-13 18:01:46');
INSERT INTO `t_http_setting` VALUES ('12', '163', 'biexei@163.com', '', '0', '2', '2020-10-04 19:21:30', '2020-12-14 16:22:21');
INSERT INTO `t_http_setting` VALUES ('13', '126', 'biexei@126.com', '', '0', '2', '2020-10-04 21:10:46', '2020-12-14 16:22:22');
INSERT INTO `t_http_setting` VALUES ('20', '连接超时', '1', '', '1', '3', '2021-04-11 17:28:32', '2021-04-11 18:08:32');
INSERT INTO `t_http_setting` VALUES ('23', '读写超时', '1', '', '1', '4', '2021-04-11 17:46:36', '2021-04-11 18:08:33');

-- ----------------------------
-- Table structure for t_interface_assert
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_assert`;
CREATE TABLE `t_interface_assert` (
  `assert_id` int NOT NULL AUTO_INCREMENT COMMENT '断言编号',
  `assert_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '断言名称',
  `case_id` int DEFAULT NULL COMMENT '用例编号',
  `type` tinyint DEFAULT NULL COMMENT '提取数据类型   0json/1html/2header/3responsecode/4runtime',
  `expression` varchar(50) DEFAULT NULL COMMENT '提取表达式',
  `operator` tinyint DEFAULT NULL COMMENT '操作符0/=、1/< 、2/>、3/<=、4/>=、5/in、6/!=、7/re、8/isNull、9/notNull',
  `excepted_result` varchar(1000) DEFAULT NULL COMMENT '预期结果',
  `order` int DEFAULT NULL COMMENT '排序 执行断言时按照该字段排序',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_assert
-- ----------------------------
INSERT INTO `t_interface_assert` VALUES ('265', 'HTTP响应状态码', '277', '3', null, '0', '200', '0', '2021-03-08 15:25:56', '2021-04-09 22:04:58');
INSERT INTO `t_interface_assert` VALUES ('266', '接口状态码', '277', '0', '$..code', '0', '200', '1', '2021-03-08 15:25:56', '2021-04-09 22:04:58');
INSERT INTO `t_interface_assert` VALUES ('268', '接口状态码', '279', '0', '$..code', '0', '200', '0', '2021-03-08 15:33:36', '2021-03-08 15:33:36');
INSERT INTO `t_interface_assert` VALUES ('269', '接口状态码', '280', '0', '$..code', '0', '200', '0', '2021-03-08 15:34:20', '2021-03-13 15:48:55');
INSERT INTO `t_interface_assert` VALUES ('270', 'url', '280', '0', '$..data.url', '0', '${InterfaceCaseTable(\"$..url\",\"#{id}\")}', '1', '2021-03-08 15:36:25', '2021-03-13 15:48:55');
INSERT INTO `t_interface_assert` VALUES ('272', 'level', '280', '0', '$..data.level', '0', '${InterfaceCaseTable(\"$..level\",\"#{id}\")}', '2', '2021-03-08 16:12:12', '2021-03-13 15:48:55');
INSERT INTO `t_interface_assert` VALUES ('281', '执行耗时', '280', '4', null, '1', '5', '3', '2021-03-09 09:22:25', '2021-03-13 15:48:55');
INSERT INTO `t_interface_assert` VALUES ('282', 'content-type', '280', '2', 'Content-Type', '0', 'application/json', '4', '2021-03-13 15:48:55', '2021-03-13 15:48:55');
INSERT INTO `t_interface_assert` VALUES ('283', '接口状态码', '283', '0', '$..code', '0', '200', '0', '2021-03-30 14:03:41', '2021-04-05 14:06:58');
INSERT INTO `t_interface_assert` VALUES ('284', '接口状态码', '284', '0', '$..code', '0', '200', '0', '2021-04-05 15:12:13', '2021-04-06 16:08:54');
INSERT INTO `t_interface_assert` VALUES ('573', 'http code 不能为404', '429', '3', null, '6', '404', '1', '2021-04-15 13:28:48', '2021-04-15 14:42:22');

-- ----------------------------
-- Table structure for t_interface_assert_log
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_assert_log`;
CREATE TABLE `t_interface_assert_log` (
  `assert_log_id` int NOT NULL AUTO_INCREMENT COMMENT '断言日志id',
  `execute_log_id` int DEFAULT NULL COMMENT '执行日志id',
  `assert_id` int DEFAULT NULL COMMENT '断言id',
  `assert_name` varchar(100) DEFAULT NULL COMMENT '断言名称',
  `case_id` int DEFAULT NULL COMMENT '测试用例编号id',
  `type` tinyint DEFAULT NULL COMMENT '提取数据类型   0json/1html/2header/3responsecode/4runtime',
  `expression` varchar(50) DEFAULT NULL COMMENT '提取表达式',
  `operator` tinyint DEFAULT NULL COMMENT '操作符0/=、1/< 、2/>、3/<=、4/>=、5/in、6/!=、7/re、8/isNull、9/notNull',
  `excepted_result` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '预期结果',
  `raw_excepted_result` mediumtext COMMENT '未清洗前的预期结果',
  `order` int DEFAULT NULL COMMENT '排序 执行断言时按照该字段排序',
  `actual_result` mediumtext COMMENT '实际运行结果',
  `status` tinyint DEFAULT NULL COMMENT '是否通过 0通过 1失败 2错误',
  `error_message` mediumtext COMMENT '断言出错异常信息',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`assert_log_id`),
  KEY `case_id` (`case_id`),
  KEY `execute_log_id` (`execute_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_assert_log
-- ----------------------------
INSERT INTO `t_interface_assert_log` VALUES ('1', '1', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-11 17:54:16');
INSERT INTO `t_interface_assert_log` VALUES ('2', '1', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-11 17:54:16');
INSERT INTO `t_interface_assert_log` VALUES ('3', '2', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-11 17:57:55');
INSERT INTO `t_interface_assert_log` VALUES ('4', '2', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-11 17:57:55');
INSERT INTO `t_interface_assert_log` VALUES ('5', '5', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-11 18:14:50');
INSERT INTO `t_interface_assert_log` VALUES ('6', '5', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-11 18:14:50');
INSERT INTO `t_interface_assert_log` VALUES ('7', '6', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-11 18:16:39');
INSERT INTO `t_interface_assert_log` VALUES ('8', '6', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-11 18:16:39');
INSERT INTO `t_interface_assert_log` VALUES ('9', '7', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:15:35');
INSERT INTO `t_interface_assert_log` VALUES ('10', '7', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-12 16:15:35');
INSERT INTO `t_interface_assert_log` VALUES ('11', '8', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:15:35');
INSERT INTO `t_interface_assert_log` VALUES ('12', '9', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:16:00');
INSERT INTO `t_interface_assert_log` VALUES ('13', '9', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-12 16:16:00');
INSERT INTO `t_interface_assert_log` VALUES ('14', '10', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:16:00');
INSERT INTO `t_interface_assert_log` VALUES ('15', '10', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-12 16:16:00');
INSERT INTO `t_interface_assert_log` VALUES ('16', '11', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:16:00');
INSERT INTO `t_interface_assert_log` VALUES ('17', '12', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:26:08');
INSERT INTO `t_interface_assert_log` VALUES ('18', '12', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-12 16:26:08');
INSERT INTO `t_interface_assert_log` VALUES ('19', '13', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:26:08');
INSERT INTO `t_interface_assert_log` VALUES ('20', '14', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:26:14');
INSERT INTO `t_interface_assert_log` VALUES ('21', '14', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-12 16:26:14');
INSERT INTO `t_interface_assert_log` VALUES ('22', '15', '269', '接口状态码', '280', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-12 16:26:14');
INSERT INTO `t_interface_assert_log` VALUES ('23', '15', '270', 'url', '280', '0', '$..data.url', '0', '/user/login', '${InterfaceCaseTable(\"$..url\",\"#{id}\")}', '1', '/user/login', '0', null, '2021-04-12 16:26:15');
INSERT INTO `t_interface_assert_log` VALUES ('24', '15', '272', 'level', '280', '0', '$..data.level', '0', '0', '${InterfaceCaseTable(\"$..level\",\"#{id}\")}', '2', '0', '0', null, '2021-04-12 16:26:15');
INSERT INTO `t_interface_assert_log` VALUES ('25', '15', '281', '执行耗时', '280', '4', null, '1', '5', '5', '3', '12', '1', null, '2021-04-12 16:26:15');
INSERT INTO `t_interface_assert_log` VALUES ('26', '15', '282', 'content-type', '280', '2', 'Content-Type', '0', 'application/json', 'application/json', '4', 'application/json', '0', null, '2021-04-12 16:26:15');
INSERT INTO `t_interface_assert_log` VALUES ('27', '16', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:01:15');
INSERT INTO `t_interface_assert_log` VALUES ('28', '17', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:01:15');
INSERT INTO `t_interface_assert_log` VALUES ('29', '16', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:01:15');
INSERT INTO `t_interface_assert_log` VALUES ('30', '17', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:01:15');
INSERT INTO `t_interface_assert_log` VALUES ('31', '18', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:01:15');
INSERT INTO `t_interface_assert_log` VALUES ('32', '19', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('33', '22', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('34', '21', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('35', '20', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('36', '19', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('37', '21', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('38', '20', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('39', '22', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('40', '23', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('41', '23', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:21');
INSERT INTO `t_interface_assert_log` VALUES ('42', '25', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('43', '26', '284', '接口状态码', '284', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('44', '24', '269', '接口状态码', '280', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('45', '24', '270', 'url', '280', '0', '$..data.url', '0', '/user/login', '${InterfaceCaseTable(\"$..url\",\"#{id}\")}', '1', '/user/login', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('46', '24', '272', 'level', '280', '0', '$..data.level', '0', '0', '${InterfaceCaseTable(\"$..level\",\"#{id}\")}', '2', '0', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('47', '27', '283', '接口状态码', '283', '0', '$..code', '0', '200', '200', '0', '500', '1', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('48', '24', '281', '执行耗时', '280', '4', null, '1', '5', '5', '3', '18', '1', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('49', '24', '282', 'content-type', '280', '2', 'Content-Type', '0', 'application/json', 'application/json', '4', 'application/json', '0', null, '2021-04-13 18:42:22');
INSERT INTO `t_interface_assert_log` VALUES ('50', '28', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('51', '28', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('52', '29', '284', '接口状态码', '284', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('53', '30', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('54', '30', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('55', '31', '283', '接口状态码', '283', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('56', '32', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('57', '32', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('58', '33', '269', '接口状态码', '280', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('59', '33', '270', 'url', '280', '0', '$..data.url', '0', '/user/login', '${InterfaceCaseTable(\"$..url\",\"#{id}\")}', '1', '/user/login', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('60', '33', '272', 'level', '280', '0', '$..data.level', '0', '0', '${InterfaceCaseTable(\"$..level\",\"#{id}\")}', '2', '0', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('61', '33', '281', '执行耗时', '280', '4', null, '1', '5', '5', '3', '6', '1', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('62', '33', '282', 'content-type', '280', '2', 'Content-Type', '0', 'application/json', 'application/json', '4', 'application/json', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('63', '34', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('64', '34', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('65', '35', '268', '接口状态码', '279', '0', '$..code', '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('66', '36', '265', 'HTTP响应状态码', '277', '3', null, '0', '200', '200', '0', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('67', '36', '266', '接口状态码', '277', '0', '$..code', '0', '200', '200', '1', '200', '0', null, '2021-04-13 18:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('68', '38', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:28:49');
INSERT INTO `t_interface_assert_log` VALUES ('69', '39', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:29:31');
INSERT INTO `t_interface_assert_log` VALUES ('70', '40', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:29:58');
INSERT INTO `t_interface_assert_log` VALUES ('71', '41', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:31:11');
INSERT INTO `t_interface_assert_log` VALUES ('72', '42', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:31:21');
INSERT INTO `t_interface_assert_log` VALUES ('73', '43', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:31:41');
INSERT INTO `t_interface_assert_log` VALUES ('74', '44', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:32:00');
INSERT INTO `t_interface_assert_log` VALUES ('75', '45', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:32:42');
INSERT INTO `t_interface_assert_log` VALUES ('76', '46', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:34:13');
INSERT INTO `t_interface_assert_log` VALUES ('77', '47', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:38:16');
INSERT INTO `t_interface_assert_log` VALUES ('78', '48', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:38:36');
INSERT INTO `t_interface_assert_log` VALUES ('79', '49', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:39:19');
INSERT INTO `t_interface_assert_log` VALUES ('80', '50', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:39:24');
INSERT INTO `t_interface_assert_log` VALUES ('81', '51', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:40:11');
INSERT INTO `t_interface_assert_log` VALUES ('82', '52', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:40:18');
INSERT INTO `t_interface_assert_log` VALUES ('83', '53', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:40:24');
INSERT INTO `t_interface_assert_log` VALUES ('84', '54', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:47:55');
INSERT INTO `t_interface_assert_log` VALUES ('85', '55', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 13:48:23');
INSERT INTO `t_interface_assert_log` VALUES ('86', '56', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 13:48:28');
INSERT INTO `t_interface_assert_log` VALUES ('87', '57', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:41:23');
INSERT INTO `t_interface_assert_log` VALUES ('88', '58', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:41:30');
INSERT INTO `t_interface_assert_log` VALUES ('89', '59', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:41:45');
INSERT INTO `t_interface_assert_log` VALUES ('90', '60', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:41:48');
INSERT INTO `t_interface_assert_log` VALUES ('91', '61', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:41:55');
INSERT INTO `t_interface_assert_log` VALUES ('92', '62', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 14:42:14');
INSERT INTO `t_interface_assert_log` VALUES ('93', '63', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 14:42:15');
INSERT INTO `t_interface_assert_log` VALUES ('94', '64', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 14:42:23');
INSERT INTO `t_interface_assert_log` VALUES ('95', '65', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 15:59:38');
INSERT INTO `t_interface_assert_log` VALUES ('96', '66', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '404', '1', null, '2021-04-15 16:00:05');
INSERT INTO `t_interface_assert_log` VALUES ('97', '67', '573', 'http code 不能为404', '429', '3', null, '6', '404', '404', '1', '200', '0', null, '2021-04-15 16:01:31');

-- ----------------------------
-- Table structure for t_interface_case
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_case`;
CREATE TABLE `t_interface_case` (
  `project_id` int DEFAULT NULL COMMENT '项目名称',
  `module_id` int DEFAULT NULL COMMENT '模块编号',
  `case_id` int NOT NULL AUTO_INCREMENT COMMENT '用例编号',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `method` tinyint(1) DEFAULT NULL COMMENT '请求方式  0get,1post,2patch,3put,4delete',
  `desc` varchar(1000) DEFAULT NULL COMMENT '用例描述',
  `level` tinyint DEFAULT NULL COMMENT '用例级别0高，1中，2低',
  `doc` varchar(200) DEFAULT NULL COMMENT '接口文档地址',
  `headers` varchar(1000) DEFAULT NULL COMMENT '请求头',
  `params` varchar(1000) DEFAULT NULL COMMENT '请求参数',
  `data` varchar(1000) DEFAULT NULL COMMENT '请求formdata',
  `json` varchar(1000) DEFAULT NULL COMMENT '请求json',
  `creater` varchar(20) DEFAULT NULL COMMENT '用例创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `source` tinyint DEFAULT NULL COMMENT '来源0新增1excel导入2csv导入3json导入4yaml导入',
  `import_no` varchar(100) DEFAULT NULL COMMENT '导入编号',
  PRIMARY KEY (`case_id`),
  KEY `project_id` (`project_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_case
-- ----------------------------
INSERT INTO `t_interface_case` VALUES ('24', '14', '277', '/user/login', '1', '用户登录', '0', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '系统管理员', '2021-03-08 15:25:56', '2021-04-09 22:04:58', '0', null);
INSERT INTO `t_interface_case` VALUES ('24', '14', '279', '/interface/case/list', '0', '查看用例列表', '0', null, '{\"Token\":\"${Token}\"}', '', null, null, '超级管理员', '2021-03-08 15:33:36', '2021-03-08 15:33:36', '0', null);
INSERT INTO `t_interface_case` VALUES ('24', '14', '280', '/interface/case/info/{id}', '0', '查看用例详情', '0', null, '{\"Token\":\"${Token}\"}', '{\"id\":\"277\"}', null, null, '超级管理员', '2021-03-08 15:34:20', '2021-03-13 15:48:55', '0', null);
INSERT INTO `t_interface_case` VALUES ('24', '14', '283', '/user/info/{userId}', '0', '查看新增用户详情', '0', null, '{\"Token\":\"${Token}\"}', '{\"userId\": \"${select(\"1\", \"select username from t_user\", \"string\")}\"}', null, null, '123', '2021-03-30 14:03:41', '2021-04-05 14:06:58', '0', null);
INSERT INTO `t_interface_case` VALUES ('24', '14', '284', '/user/list?pageNum=1&pageSize=10', '0', '查看用户列表', '0', null, '{\"Token\":\"${Token}\"}', '{\"username\": \"${md5(\"123456\")}\"}', null, null, '123', '2021-04-05 15:12:13', '2021-04-06 16:08:54', '0', null);
INSERT INTO `t_interface_case` VALUES ('25', '15', '429', '/some/path', '1', 'test', '0', null, '', '', null, 'som', '123', '2021-04-15 13:27:56', '2021-04-15 14:42:22', '0', null);

-- ----------------------------
-- Table structure for t_interface_case_execute_log
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_case_execute_log`;
CREATE TABLE `t_interface_case_execute_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用例执行日志id',
  `case_id` int DEFAULT NULL COMMENT '用例id',
  `case_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用例描述',
  `case_url` varchar(300) DEFAULT NULL COMMENT '请求地址',
  `case_method` tinyint DEFAULT NULL COMMENT '0get,1post,2patch,3put,4delete',
  `request_headers` varchar(1000) DEFAULT NULL COMMENT '请求头',
  `request_params` varchar(1000) DEFAULT NULL COMMENT '请求参数',
  `request_data` varchar(1000) DEFAULT NULL COMMENT '请求formdata',
  `request_json` varchar(1000) DEFAULT NULL,
  `raw_request_headers` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '未清洗依赖数据前的原始header',
  `raw_request_params` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '未清洗依赖数据前的原始params',
  `raw_request_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '未清洗依赖数据前的原始data',
  `raw_request_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '未清洗依赖数据前的原始json',
  `response_code` int DEFAULT NULL COMMENT '响应状态码',
  `response_headers` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '响应头',
  `response_body` mediumtext COMMENT '响应正文',
  `run_time` int DEFAULT NULL COMMENT '运行时长ms',
  `executer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行人',
  `status` tinyint DEFAULT NULL COMMENT '运行结果 0成功 1失败 2错误',
  `created_time` datetime DEFAULT NULL COMMENT '执行时间',
  `error_message` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '执行失败异常错误信息',
  `suite_log_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '测试套件执行日志编号',
  `suite_log_detail_no` varchar(51) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '测试套件执行日志编号(可记录接口依赖的case)',
  `chain` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '日志执行调用链list',
  `is_failed_retry` tinyint DEFAULT NULL COMMENT '是否为失败重跑用例0是1否',
  `source` tinyint DEFAULT NULL COMMENT '来源（0用例调试 1依赖调试 2运行整个测试套件 3测试套件单个用例调试 4依赖解析 5综合用例-前置用例）',
  PRIMARY KEY (`id`),
  KEY `case_id` (`case_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_case_execute_log
-- ----------------------------
INSERT INTO `t_interface_case_execute_log` VALUES ('1', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Sun, 11 Apr 2021 09:54:15 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\"\n		],\n		\"userId\":1,\n		\"token\":\"18b4123b-c69d-4bb4-8f23-64db82b670e4\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '176', '123', '0', '2021-04-11 17:54:16', null, null, null, '[{\"date\":\"2021-04-11 17:54:15:685\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":13,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-11 17:54:16:477\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":1,\"time\":805,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('2', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Sun, 11 Apr 2021 09:57:55 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\"\n		],\n		\"userId\":1,\n		\"token\":\"033005bd-0293-49c7-8e8c-30dd0b3c7b67\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '2107', '123', '0', '2021-04-11 17:57:55', null, null, null, '[{\"date\":\"2021-04-11 17:57:53:003\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":11,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-11 17:57:55:397\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":2,\"time\":2405,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('3', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, null, null, null, '0', '123', '2', '2021-04-11 17:58:21', '请检查是否启用代理服务器', null, null, '[{\"date\":\"2021-04-11 17:58:20:316\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('4', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, null, null, null, '0', '123', '2', '2021-04-11 18:04:24', '请检查是否启用代理服务器', null, null, '[{\"date\":\"2021-04-11 18:04:23:894\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":16,\"type\":\"CASE_START\",\"desc\":\"开始执行\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('5', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Sun, 11 Apr 2021 10:14:49 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\"\n		],\n		\"userId\":1,\n		\"token\":\"a41214ca-8841-4f33-991b-3e49a93cea50\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '83', '定时任务', '0', '2021-04-11 18:14:50', null, 'SN20210411181450n5vsl86703', 'SND20210411181450n5vsl86703', '[{\"date\":\"2021-04-11 18:14:50:111\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":13,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-11 18:14:50:309\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":5,\"time\":211,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('6', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Sun, 11 Apr 2021 10:16:39 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\"\n		],\n		\"userId\":1,\n		\"token\":\"0ec3185e-6bf8-40af-877e-9bc0a7f3bf61\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '63', '定时任务', '0', '2021-04-11 18:16:39', null, 'SN20210411181639k6drf31595', 'SND20210411181639k6drf31595', '[{\"date\":\"2021-04-11 18:16:39:294\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":22,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-11 18:16:39:472\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":6,\"time\":200,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('7', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:15:34 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"236fdeca-e761-4ab0-8b36-b591e0706e42\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '163', '系统调度', '0', '2021-04-12 16:15:35', null, null, null, '[{\"date\":\"2021-04-12 16:15:34:227\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":6,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:15:34:277\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:15:34:625\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":7,\"time\":351,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('8', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"236fdeca-e761-4ab0-8b36-b591e0706e42\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:15:34 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '16', '123', '0', '2021-04-12 16:15:35', null, null, null, '[{\"date\":\"2021-04-12 16:15:34:227\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":6,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:15:34:277\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:15:34:625\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":7,\"time\":351,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-12 16:15:34:643\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":7,\"time\":372,\"type\":\"INTERFACE_JSON\",\"value\":\"236fdeca-e761-4ab0-8b36-b591e0706e42\",\"desc\":\"Json\"},{\"date\":\"2021-04-12 16:15:34:690\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":8,\"time\":469,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('9', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:16:00 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"7ecb997e-d02f-4ec4-ab4e-e6701d900fb7\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '17', '123', '0', '2021-04-12 16:16:00', null, 'SN20210412161600kvduc40230', 'SND20210412161600kvduc40230', '[{\"date\":\"2021-04-12 16:16:00:347\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:16:00:428\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":9,\"time\":84,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('10', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:16:00 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"ce206919-b584-457e-ab35-00a1838e09f2\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '17', '系统调度', '0', '2021-04-12 16:16:00', null, null, 'SND20210412161600kvduc40230', '[{\"date\":\"2021-04-12 16:16:00:347\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:16:00:361\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:16:00:445\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":10,\"time\":87,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('11', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"ce206919-b584-457e-ab35-00a1838e09f2\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:16:00 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '14', '123', '0', '2021-04-12 16:16:00', null, 'SN20210412161600kvduc40230', 'SND20210412161600kvduc40230', '[{\"date\":\"2021-04-12 16:16:00:347\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:16:00:361\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:16:00:445\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":10,\"time\":87,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-12 16:16:00:459\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":10,\"time\":103,\"type\":\"INTERFACE_JSON\",\"value\":\"ce206919-b584-457e-ab35-00a1838e09f2\",\"desc\":\"Json\"},{\"date\":\"2021-04-12 16:16:00:500\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":11,\"time\":156,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('12', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:26:08 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"b1885c59-fed5-4224-a69f-3230d22e0f99\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '15', '系统调度', '0', '2021-04-12 16:26:08', null, null, null, '[{\"date\":\"2021-04-12 16:26:08:217\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:08:227\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:08:284\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":12,\"time\":60,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('13', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"b1885c59-fed5-4224-a69f-3230d22e0f99\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:26:08 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '12', '123', '0', '2021-04-12 16:26:08', null, null, null, '[{\"date\":\"2021-04-12 16:26:08:217\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:08:227\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:08:284\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":12,\"time\":60,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-12 16:26:08:298\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":12,\"time\":76,\"type\":\"INTERFACE_JSON\",\"value\":\"b1885c59-fed5-4224-a69f-3230d22e0f99\",\"desc\":\"Json\"},{\"date\":\"2021-04-12 16:26:08:338\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":13,\"time\":124,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('14', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:26:13 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"a657558f-b968-4893-a962-1bb6a0f5658b\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '14', '系统调度', '0', '2021-04-12 16:26:14', null, null, null, '[{\"date\":\"2021-04-12 16:26:13:823\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:13:831\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:13:881\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":14,\"time\":53,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('15', '280', '查看用例详情', 'http://localhost:7777/interface/case/info/{id}', '0', '{\n	\"Token\":\"a657558f-b968-4893-a962-1bb6a0f5658b\"\n}', '{}', '', null, '{\"Token\":\"${Token}\"}', '{\"id\":\"277\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Mon, 12 Apr 2021 08:26:13 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"headers\":\"\",\n		\"preCases\":[],\n		\"postProcessors\":[],\n		\"method\":1,\n		\"data\":\"{\\\"username\\\":\\\"123\\\",\\\"password\\\":\\\"123\\\"}\",\n		\"level\":0,\n		\"source\":0,\n		\"params\":\"\",\n		\"url\":\"/user/login\",\n		\"asserts\":[\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":265,\n				\"expression\":null,\n				\"type\":3,\n				\"operator\":0,\n				\"assertName\":\"HTTP响应状态码\",\n				\"order\":0\n			},\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":266,\n				\"expression\":\"$..code\",\n				\"type\":0,\n				\"operator\":0,\n				\"assertName\":\"接口状态码\",\n				\"order\":1\n			}\n		],\n		\"importNo\":null,\n		\"caseId\":277,\n		\"creater\":\"系统管理员\",\n		\"doc\":null,\n		\"json\":null,\n		\"createdTime\":\"2021-03-08 15:25:56\",\n		\"moduleId\":14,\n		\"projectId\":24,\n		\"desc\":\"用户登录\"\n	}\n}', '12', '123', '1', '2021-04-12 16:26:14', null, null, null, '[{\"date\":\"2021-04-12 16:26:13:823\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:13:831\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-12 16:26:13:881\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":14,\"time\":53,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-12 16:26:13:894\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":14,\"time\":68,\"type\":\"INTERFACE_JSON\",\"value\":\"a657558f-b968-4893-a962-1bb6a0f5658b\",\"desc\":\"Json\"},{\"date\":\"2021-04-12 16:26:14:232\",\"typeDesc\":\"参数缓存\",\"expression\":\"$..id\",\"name\":\"id\",\"time\":315,\"type\":\"WRITE_PROCESSOR_REQUEST_PARAMS\",\"value\":\"277\",\"desc\":\"Params\"},{\"date\":\"2021-04-12 16:26:14:258\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":6,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-12 16:26:14:508\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..url\\\",\\\"277\\\")\",\"id\":41,\"time\":242,\"type\":\"SQL_SELECT\",\"value\":\"/user/login\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-12 16:26:14:594\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":2,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-12 16:26:14:624\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..level\\\",\\\"277\\\")\",\"id\":41,\"time\":24,\"type\":\"SQL_SELECT\",\"value\":\"0\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-12 16:26:14:723\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"id\":15,\"time\":905,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('16', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:01:15 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"73732a88-48d1-40a8-92bb-98262ee47587\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '132', '系统调度', '0', '2021-04-13 18:01:15', null, null, 'SND202104131801150w4hn83167', '[{\"date\":\"2021-04-13 18:01:15:113\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:01:15:142\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:01:15:372\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":16,\"time\":233,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('17', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:01:15 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"f335a939-e8e9-4d07-a0f1-ebc2cc9dcbd5\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '153', '定时任务', '0', '2021-04-13 18:01:15', null, 'SN202104131801150w4hn83167', 'SND202104131801150w4hn83167', '[{\"date\":\"2021-04-13 18:01:15:117\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:01:15:371\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":17,\"time\":256,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('18', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"73732a88-48d1-40a8-92bb-98262ee47587\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:01:15 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '9', '定时任务', '0', '2021-04-13 18:01:15', null, 'SN202104131801150w4hn83167', 'SND202104131801150w4hn83167', '[{\"date\":\"2021-04-13 18:01:15:113\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:01:15:142\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:01:15:372\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":16,\"time\":233,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:01:15:385\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":16,\"time\":249,\"type\":\"INTERFACE_JSON\",\"value\":\"73732a88-48d1-40a8-92bb-98262ee47587\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:01:15:421\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":18,\"time\":310,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('19', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"054bfc21-c7f5-4371-91e5-c7dbefc4915c\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '56', '系统调度', '0', '2021-04-13 18:42:21', null, null, 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"time\":6,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:359\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":7,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:486\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":19,\"time\":134,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('20', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"9eb4af28-290d-4884-a51a-01fe85ae5e13\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '65', '系统调度', '0', '2021-04-13 18:42:21', null, null, 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:357\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":5,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:493\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":20,\"time\":141,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('21', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"9e9e3c2d-bc2e-4699-b15f-bf25e2e97b39\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '74', '123', '0', '2021-04-13 18:42:21', null, 'SN20210413184221cb7eg49748', 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:345\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":8,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:490\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":21,\"time\":152,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('22', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"05523b46-d938-4276-b755-6a9187eb190e\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '67', '系统调度', '0', '2021-04-13 18:42:21', null, null, 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:357\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":5,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:493\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":22,\"time\":141,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('23', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"99bf0ba8-39ec-4386-ab50-782c216ea544\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '20', '系统调度', '0', '2021-04-13 18:42:21', null, null, 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:368\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"time\":21,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:427\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:510\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":23,\"time\":85,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('24', '280', '查看用例详情', 'http://localhost:7777/interface/case/info/{id}', '0', '{\n	\"Token\":\"9eb4af28-290d-4884-a51a-01fe85ae5e13\"\n}', '{}', '', null, '{\"Token\":\"${Token}\"}', '{\"id\":\"277\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"headers\":\"\",\n		\"preCases\":[],\n		\"postProcessors\":[],\n		\"method\":1,\n		\"data\":\"{\\\"username\\\":\\\"123\\\",\\\"password\\\":\\\"123\\\"}\",\n		\"level\":0,\n		\"source\":0,\n		\"params\":\"\",\n		\"url\":\"/user/login\",\n		\"asserts\":[\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":265,\n				\"expression\":null,\n				\"type\":3,\n				\"operator\":0,\n				\"assertName\":\"HTTP响应状态码\",\n				\"order\":0\n			},\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":266,\n				\"expression\":\"$..code\",\n				\"type\":0,\n				\"operator\":0,\n				\"assertName\":\"接口状态码\",\n				\"order\":1\n			}\n		],\n		\"importNo\":null,\n		\"caseId\":277,\n		\"creater\":\"系统管理员\",\n		\"doc\":null,\n		\"json\":null,\n		\"createdTime\":\"2021-03-08 15:25:56\",\n		\"moduleId\":14,\n		\"projectId\":24,\n		\"desc\":\"用户登录\"\n	}\n}', '18', '123', '1', '2021-04-13 18:42:22', null, 'SN20210413184221cb7eg49748', 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:357\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":5,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:493\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":20,\"time\":141,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:21:507\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":20,\"time\":160,\"type\":\"INTERFACE_JSON\",\"value\":\"9eb4af28-290d-4884-a51a-01fe85ae5e13\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:21:564\",\"typeDesc\":\"参数缓存\",\"expression\":\"$..id\",\"name\":\"id\",\"time\":10,\"type\":\"WRITE_PROCESSOR_REQUEST_PARAMS\",\"value\":\"277\",\"desc\":\"Params\"},{\"date\":\"2021-04-13 18:42:21:580\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":2,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-13 18:42:21:839\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..url\\\",\\\"277\\\")\",\"id\":41,\"time\":251,\"type\":\"SQL_SELECT\",\"value\":\"/user/login\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-13 18:42:21:876\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":1,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-13 18:42:21:933\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..level\\\",\\\"277\\\")\",\"id\":41,\"time\":35,\"type\":\"SQL_SELECT\",\"value\":\"0\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-13 18:42:21:982\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"id\":24,\"time\":645,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('25', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"05523b46-d938-4276-b755-6a9187eb190e\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '18', '123', '0', '2021-04-13 18:42:22', null, 'SN20210413184221cb7eg49748', 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":5,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:357\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":5,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:493\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":22,\"time\":141,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:21:507\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":22,\"time\":160,\"type\":\"INTERFACE_JSON\",\"value\":\"05523b46-d938-4276-b755-6a9187eb190e\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:21:570\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":25,\"time\":233,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('26', '284', '查看用户列表', 'http://localhost:7777/user/list?pageNum=1&pageSize=10', '0', '{\n	\"Token\":\"054bfc21-c7f5-4371-91e5-c7dbefc4915c\"\n}', '{\n	\"username\":\"e10adc3949ba59abbe56e057f20f883e\"\n}', '', null, '{\"Token\":\"${Token}\"}', '{\"username\": \"${md5(\"123456\")}\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":0,\n		\"navigatepageNums\":[],\n		\"lastPage\":0,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":0,\n		\"list\":[],\n		\"pageNum\":0,\n		\"navigatePages\":8,\n		\"total\":0,\n		\"navigateFirstPage\":0,\n		\"pages\":0,\n		\"size\":0,\n		\"firstPage\":0,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":0,\n		\"isFirstPage\":false\n	}\n}', '14', '123', '0', '2021-04-13 18:42:22', null, 'SN20210413184221cb7eg49748', 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:342\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"time\":6,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:359\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":7,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:486\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":19,\"time\":134,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:21:498\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":19,\"time\":151,\"type\":\"INTERFACE_JSON\",\"value\":\"054bfc21-c7f5-4371-91e5-c7dbefc4915c\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:21:520\",\"typeDesc\":\"反射方法\",\"name\":\"md5(\\\"123456\\\")\",\"id\":1,\"time\":18,\"type\":\"INVOKE\",\"value\":\"e10adc3949ba59abbe56e057f20f883e\",\"desc\":\"反射方法\"},{\"date\":\"2021-04-13 18:42:21:571\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"id\":26,\"time\":235,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('27', '283', '查看新增用户详情', 'http://localhost:7777/user/info/{userId}', '0', '{\n	\"Token\":\"99bf0ba8-39ec-4386-ab50-782c216ea544\"\n}', '{}', '', null, '{\"Token\":\"${Token}\"}', '{\"userId\": \"${select(\"1\", \"select username from t_user\", \"string\")}\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:21 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Integer\'; nested exception is java.lang.NumberFormatException: For input string: \\\"youke\\\"\",\n	\"code\":500,\n	\"data\":{}\n}', '49', '123', '1', '2021-04-13 18:42:22', null, 'SN20210413184221cb7eg49748', 'SND20210413184221cb7eg49748', '[{\"date\":\"2021-04-13 18:42:21:368\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"time\":21,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:427\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:21:510\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":23,\"time\":85,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:21:527\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":23,\"time\":149,\"type\":\"INTERFACE_JSON\",\"value\":\"99bf0ba8-39ec-4386-ab50-782c216ea544\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:21:863\",\"typeDesc\":\"反射方法\",\"name\":\"select(\\\"1\\\", \\\"select username from t_user\\\", \\\"string\\\")\",\"id\":48,\"time\":333,\"type\":\"INVOKE\",\"value\":\"youke\",\"desc\":\"反射方法\"},{\"date\":\"2021-04-13 18:42:21:973\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"id\":27,\"time\":626,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('28', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"585f8b0c-5c3f-42d5-8cc1-f8fa6d967e0d\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '13', '系统调度', '0', '2021-04-13 18:42:23', null, null, 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:606\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:614\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:668\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":28,\"time\":56,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('29', '284', '查看用户列表', 'http://localhost:7777/user/list?pageNum=1&pageSize=10', '0', '{\n	\"Token\":\"585f8b0c-5c3f-42d5-8cc1-f8fa6d967e0d\"\n}', '{\n	\"username\":\"e10adc3949ba59abbe56e057f20f883e\"\n}', '', null, '{\"Token\":\"${Token}\"}', '{\"username\": \"${md5(\"123456\")}\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":0,\n		\"navigatepageNums\":[],\n		\"lastPage\":0,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":0,\n		\"list\":[],\n		\"pageNum\":0,\n		\"navigatePages\":8,\n		\"total\":0,\n		\"navigateFirstPage\":0,\n		\"pages\":0,\n		\"size\":0,\n		\"firstPage\":0,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":0,\n		\"isFirstPage\":false\n	}\n}', '6', '123', '0', '2021-04-13 18:42:23', null, 'SN20210413184222hg9nw60378', 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:606\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:614\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:668\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":28,\"time\":56,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:22:677\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":28,\"time\":66,\"type\":\"INTERFACE_JSON\",\"value\":\"585f8b0c-5c3f-42d5-8cc1-f8fa6d967e0d\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:22:681\",\"typeDesc\":\"反射方法\",\"name\":\"md5(\\\"123456\\\")\",\"id\":1,\"time\":3,\"type\":\"INVOKE\",\"value\":\"e10adc3949ba59abbe56e057f20f883e\",\"desc\":\"反射方法\"},{\"date\":\"2021-04-13 18:42:22:706\",\"typeDesc\":\"执行用例\",\"name\":\"查看用户列表\",\"id\":29,\"time\":103,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('30', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"ab74cc7d-7618-4b91-9a2d-e7b2e3da9132\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '9', '系统调度', '0', '2021-04-13 18:42:23', null, null, 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:715\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:724\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":1,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:769\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":30,\"time\":47,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('31', '283', '查看新增用户详情', 'http://localhost:7777/user/info/{userId}', '0', '{\n	\"Token\":\"ab74cc7d-7618-4b91-9a2d-e7b2e3da9132\"\n}', '{}', '', null, '{\"Token\":\"${Token}\"}', '{\"userId\": \"${select(\"1\", \"select username from t_user\", \"string\")}\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":null\n}', '9', '123', '0', '2021-04-13 18:42:23', null, 'SN20210413184222hg9nw60378', 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:715\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:724\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":1,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:769\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":30,\"time\":47,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:22:779\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":30,\"time\":59,\"type\":\"INTERFACE_JSON\",\"value\":\"ab74cc7d-7618-4b91-9a2d-e7b2e3da9132\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:22:835\",\"typeDesc\":\"反射方法\",\"name\":\"select(\\\"1\\\", \\\"select username from t_user\\\", \\\"string\\\")\",\"id\":48,\"time\":54,\"type\":\"INVOKE\",\"value\":\"123\",\"desc\":\"反射方法\"},{\"date\":\"2021-04-13 18:42:22:876\",\"typeDesc\":\"执行用例\",\"name\":\"查看新增用户详情\",\"id\":31,\"time\":163,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('32', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"9f43b988-97d4-41ca-99ba-9c2843af65ed\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '10', '系统调度', '0', '2021-04-13 18:42:23', null, null, 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:888\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:897\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:942\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":32,\"time\":47,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('33', '280', '查看用例详情', 'http://localhost:7777/interface/case/info/{id}', '0', '{\n	\"Token\":\"9f43b988-97d4-41ca-99ba-9c2843af65ed\"\n}', '{}', '', null, '{\"Token\":\"${Token}\"}', '{\"id\":\"277\"}', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"headers\":\"\",\n		\"preCases\":[],\n		\"postProcessors\":[],\n		\"method\":1,\n		\"data\":\"{\\\"username\\\":\\\"123\\\",\\\"password\\\":\\\"123\\\"}\",\n		\"level\":0,\n		\"source\":0,\n		\"params\":\"\",\n		\"url\":\"/user/login\",\n		\"asserts\":[\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":265,\n				\"expression\":null,\n				\"type\":3,\n				\"operator\":0,\n				\"assertName\":\"HTTP响应状态码\",\n				\"order\":0\n			},\n			{\n				\"exceptedResult\":\"200\",\n				\"assertId\":266,\n				\"expression\":\"$..code\",\n				\"type\":0,\n				\"operator\":0,\n				\"assertName\":\"接口状态码\",\n				\"order\":1\n			}\n		],\n		\"importNo\":null,\n		\"caseId\":277,\n		\"creater\":\"系统管理员\",\n		\"doc\":null,\n		\"json\":null,\n		\"createdTime\":\"2021-03-08 15:25:56\",\n		\"moduleId\":14,\n		\"projectId\":24,\n		\"desc\":\"用户登录\"\n	}\n}', '6', '123', '1', '2021-04-13 18:42:23', null, 'SN20210413184222hg9nw60378', 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:22:888\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:897\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":2,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:22:942\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":32,\"time\":47,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:22:955\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":32,\"time\":61,\"type\":\"INTERFACE_JSON\",\"value\":\"9f43b988-97d4-41ca-99ba-9c2843af65ed\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:22:976\",\"typeDesc\":\"参数缓存\",\"expression\":\"$..id\",\"name\":\"id\",\"time\":4,\"type\":\"WRITE_PROCESSOR_REQUEST_PARAMS\",\"value\":\"277\",\"desc\":\"Params\"},{\"date\":\"2021-04-13 18:42:22:989\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":2,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-13 18:42:23:020\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..url\\\",\\\"277\\\")\",\"id\":41,\"time\":25,\"type\":\"SQL_SELECT\",\"value\":\"/user/login\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-13 18:42:23:028\",\"typeDesc\":\"使用缓存\",\"name\":\"id\",\"time\":2,\"type\":\"READ_PROCESSOR\",\"value\":\"277\",\"desc\":\"使用缓存\"},{\"date\":\"2021-04-13 18:42:23:059\",\"typeDesc\":\"SQL依赖\",\"name\":\"InterfaceCaseTable(\\\"$..level\\\",\\\"277\\\")\",\"id\":41,\"time\":23,\"type\":\"SQL_SELECT\",\"value\":\"0\",\"desc\":\"查询语句\"},{\"date\":\"2021-04-13 18:42:23:093\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例详情\",\"id\":33,\"time\":208,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('34', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"084692fb-cd19-4b7e-ae16-f435d769f3c6\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '19', '系统调度', '0', '2021-04-13 18:42:23', null, null, 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:23:105\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:23:113\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:23:167\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":34,\"time\":57,\"type\":\"RELY_END\",\"desc\":\"执行完成\"}]', '1', '4');
INSERT INTO `t_interface_case_execute_log` VALUES ('35', '279', '查看用例列表', 'http://localhost:7777/interface/case/list', '0', '{\n	\"Token\":\"084692fb-cd19-4b7e-ae16-f435d769f3c6\"\n}', '', '', null, '{\"Token\":\"${Token}\"}', '', null, null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"操作成功\",\n	\"code\":200,\n	\"data\":{\n		\"startRow\":1,\n		\"navigatepageNums\":[\n			1\n		],\n		\"lastPage\":1,\n		\"prePage\":0,\n		\"hasNextPage\":false,\n		\"nextPage\":0,\n		\"pageSize\":10,\n		\"endRow\":5,\n		\"list\":[\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/list?pageNum=1&pageSize=10\",\n				\"importNo\":null,\n				\"caseId\":284,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-04-05 15:12:13\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用户列表\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/info/{userId}\",\n				\"importNo\":null,\n				\"caseId\":283,\n				\"creater\":\"123\",\n				\"createdTime\":\"2021-03-30 14:03:41\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看新增用户详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/info/{id}\",\n				\"importNo\":null,\n				\"caseId\":280,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:34:20\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例详情\"\n			},\n			{\n				\"method\":0,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/interface/case/list\",\n				\"importNo\":null,\n				\"caseId\":279,\n				\"creater\":\"超级管理员\",\n				\"createdTime\":\"2021-03-08 15:33:36\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"查看用例列表\"\n			},\n			{\n				\"method\":1,\n				\"level\":0,\n				\"moduleName\":\"用户管理\",\n				\"source\":0,\n				\"url\":\"/user/login\",\n				\"importNo\":null,\n				\"caseId\":277,\n				\"creater\":\"系统管理员\",\n				\"createdTime\":\"2021-03-08 15:25:56\",\n				\"projectName\":\"Alex\",\n				\"moduleId\":14,\n				\"projectId\":24,\n				\"desc\":\"用户登录\"\n			}\n		],\n		\"pageNum\":1,\n		\"navigatePages\":8,\n		\"total\":5,\n		\"navigateFirstPage\":1,\n		\"pages\":1,\n		\"size\":5,\n		\"firstPage\":1,\n		\"isLastPage\":true,\n		\"hasPreviousPage\":false,\n		\"navigateLastPage\":1,\n		\"isFirstPage\":true\n	}\n}', '9', '123', '0', '2021-04-13 18:42:23', null, 'SN20210413184222hg9nw60378', 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:23:105\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:23:113\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"time\":3,\"type\":\"RELY_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:23:167\",\"typeDesc\":\"接口依赖\",\"name\":\"用户登录\",\"id\":34,\"time\":57,\"type\":\"RELY_END\",\"desc\":\"执行完成\"},{\"date\":\"2021-04-13 18:42:23:177\",\"typeDesc\":\"接口依赖\",\"expression\":\"$..data.token\",\"name\":\"Token\",\"id\":34,\"time\":68,\"type\":\"INTERFACE_JSON\",\"value\":\"084692fb-cd19-4b7e-ae16-f435d769f3c6\",\"desc\":\"Json\"},{\"date\":\"2021-04-13 18:42:23:212\",\"typeDesc\":\"执行用例\",\"name\":\"查看用例列表\",\"id\":35,\"time\":109,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('36', '277', '用户登录', 'http://localhost:7777/user/login', '1', '', '', '{\n	\"password\":\"123\",\n	\"username\":\"123\"\n}', null, '', '', '{\"username\":\"123\",\"password\":\"123\"}', null, '200', '{\n	\"Vary\":[\"Origin\",\"Access-Control-Request-Method\",\"Access-Control-Request-Headers\"],\n	\"Content-Type\":[\"application/json\"],\n	\"Transfer-Encoding\":[\"chunked\"],\n	\"Date\":[\"Tue, 13 Apr 2021 10:42:22 GMT\"],\n	\"Keep-Alive\":[\"timeout=60\"],\n	\"Connection\":[\"keep-alive\"]\n}', '{\n	\"msg\":\"登录成功\",\n	\"code\":200,\n	\"data\":{\n		\"realName\":\"123\",\n		\"permission\":[\n			\"role\",\n			\"role:add\",\n			\"role:modify\",\n			\"role:remove\",\n			\"role:find\",\n			\"role:permission\",\n			\"permission\",\n			null,\n			null,\n			null,\n			null,\n			\"permission:add_top\",\n			\"project\",\n			\"project:add\",\n			\"project:modify\",\n			\"project:remove\",\n			\"project:find\",\n			\"module\",\n			\"module:add\",\n			\"module:modify\",\n			\"module:remove\",\n			\"module:find\",\n			\"db\",\n			\"db:add\",\n			\"db:modify\",\n			\"db:remove\",\n			\"db:find\",\n			\"db:check\",\n			\"factory\",\n			\"factory:add\",\n			\"factory:modify\",\n			\"factory:remove\",\n			\"factory:find\",\n			\"factory:execute\",\n			\"data_center\",\n			\"data_center:temp_env\",\n			\"data_center:temp_env:find\",\n			\"data_center:temp_env:clear\",\n			\"data_center:if_rely\",\n			\"data_center:if_rely:add\",\n			\"data_center:if_rely:modify\",\n			\"data_center:if_rely:remove\",\n			\"data_center:if_rely:find\",\n			\"data_center:if_rely:execute\",\n			\"data_center:rely_data:add\",\n			\"data_center:rely_data:modify\",\n			\"data_center:rely_data:remove\",\n			\"data_center:rely_data:find\",\n			\"data_center:rely_sql_data\",\n			\"data_center:rely_sql_data:add\",\n			\"data_center:rely_sql_data:modify\",\n			\"data_center:rely_sql_data:remove\",\n			\"data_center:rely_sql_data:find\",\n			\"data_center:rely_init_method\",\n			null,\n			\"data_center:rely_init_method:modify\",\n			\"data_center:rely_init_method:remove\",\n			\"data_center:rely_init_method:find\",\n			\"data_center:rely_fixed_data\",\n			\"data_center:rely_fixed_data:add\",\n			\"data_center:rely_fixed_data:remove\",\n			\"data_center:rely_fixed_data:modify\",\n			\"data_center:rely_fixed_data:find\",\n			\"interface\",\n			\"interface:case\",\n			\"interface:case:add\",\n			\"interface:case:modify\",\n			\"interface:case:remove\",\n			\"interface:case:find\",\n			\"interface:case:copy\",\n			\"interface:case:generate\",\n			\"interface:case:execute\",\n			\"interface:case:import\",\n			\"interface:suite\",\n			\"interface:suite:add\",\n			\"interface:suite:modify\",\n			\"interface:suite:remove\",\n			\"interface:suite:find\",\n			\"interface:suite:copy\",\n			\"interface:suite:manager\",\n			\"interface:suite:execute\",\n			\"interface:case_log\",\n			\"interface:case_log:find\",\n			\"interface:case_log:detail\",\n			\"interface:case_log:chain\",\n			\"interface:assert_log\",\n			\"interface:assert_log:find\",\n			\"setting:email\",\n			\"setting\",\n			\"setting:email:modify\",\n			\"setting:email:add\",\n			\"setting:email:remove\",\n			\"setting:email:find\",\n			\"setting:proxy\",\n			\"setting:proxy:add\",\n			\"setting:proxy:modify\",\n			\"setting:proxy:remove\",\n			\"setting:proxy:find\",\n			\"setting:task\",\n			\"setting:task:add\",\n			\"setting:task:modify\",\n			\"setting:task:remove\",\n			\"setting:task:find\",\n			\"user:add\",\n			\"user:remove\",\n			\"user:modify\",\n			\"user:find\",\n			\"user:reset\",\n			\"user\",\n			\"setting:task:execute\",\n			\"setting:timeout\",\n			\"setting:timeout:add\",\n			\"setting:timeout:modify\",\n			\"setting:timeout:remove\",\n			\"setting:timeout:find\",\n			\"interface:case:logInfo\",\n			\"feedback\",\n			\"feedback:list\",\n			\"feedback:list:find\",\n			\"feedback:list:remove\",\n			\"feedback:list:reply\",\n			\"feedback:my\",\n			\"feedback:my:modify\",\n			\"feedback:my:remove\",\n			\"feedback:my:find\",\n			\"feedback:my:add\"\n		],\n		\"userId\":1,\n		\"token\":\"3dee54ff-4eda-41d1-96a0-baf9dbd9b8bc\",\n		\"username\":\"123\",\n		\"isEnable\":1\n	}\n}', '10', '123', '0', '2021-04-13 18:42:23', null, 'SN20210413184222hg9nw60378', 'SND20210413184222hg9nw60378', '[{\"date\":\"2021-04-13 18:42:23:223\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-13 18:42:23:271\",\"typeDesc\":\"执行用例\",\"name\":\"用户登录\",\"id\":36,\"time\":50,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '2');
INSERT INTO `t_interface_case_execute_log` VALUES ('37', '429', 'test', 'http://localhost:1080//some/path?cartId=123&type=123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '93', '123', '0', '2021-04-15 13:28:00', null, null, null, '[{\"date\":\"2021-04-15 13:28:00:339\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":6,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:28:00:494\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":37,\"time\":161,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('38', '429', 'test', 'http://localhost:1080//some/path?cartId=123&type=123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '10', '123', '1', '2021-04-15 13:28:49', null, null, null, '[{\"date\":\"2021-04-15 13:28:49:396\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:28:49:446\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":38,\"time\":52,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('39', '429', 'test', 'http://localhost:1080//some/path?cartId=123', '0', '', '{\n	\"type\":\"123\"\n}', '', null, '', '{\"type\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '17', '123', '1', '2021-04-15 13:29:31', null, null, null, '[{\"date\":\"2021-04-15 13:29:30:759\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:29:30:806\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":39,\"time\":50,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('40', '429', 'test', 'http://localhost:1080//some/path?type=123', '0', '', '{\n	\"cartId\":\"123\"\n}', '', null, '', '{\"cartId\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '6', '123', '1', '2021-04-15 13:29:58', null, null, null, '[{\"date\":\"2021-04-15 13:29:57:964\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:29:58:022\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":40,\"time\":59,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('41', '429', 'test', 'http://localhost:1080//some/path?type=123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '128', '123', '1', '2021-04-15 13:31:11', null, null, null, '[{\"date\":\"2021-04-15 13:31:11:078\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:31:11:239\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":41,\"time\":163,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('42', '429', 'test', 'http://localhost:1080//some/path?cartId=123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '12', '123', '1', '2021-04-15 13:31:21', null, null, null, '[{\"date\":\"2021-04-15 13:31:20:990\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:31:21:030\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":42,\"time\":42,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('43', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"cartId\":\"123\"\n}', '', null, '', '{\"cartId\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '37', '123', '1', '2021-04-15 13:31:41', null, null, null, '[{\"date\":\"2021-04-15 13:31:40:854\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:31:40:917\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":43,\"time\":66,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('44', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"cartId\":\"123\"\n}', '', null, '', '{\"cartId\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '14', '123', '1', '2021-04-15 13:32:00', null, null, null, '[{\"date\":\"2021-04-15 13:31:59:998\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:32:00:061\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":44,\"time\":65,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('45', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"cartId\":\"123\"\n}', '', null, '', '{\"cartId\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '166', '123', '1', '2021-04-15 13:32:42', null, null, null, '[{\"date\":\"2021-04-15 13:32:41:535\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:32:41:755\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":45,\"time\":223,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('46', '429', 'test', 'http://localhost:1080//some/path/123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '142', '123', '1', '2021-04-15 13:34:13', null, null, null, '[{\"date\":\"2021-04-15 13:34:12:796\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":1,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:34:12:966\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":46,\"time\":171,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('47', '429', 'test', 'http://localhost:1080//some/path/123', '0', '', '', '', null, '', '', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '54', '123', '0', '2021-04-15 13:38:16', null, null, null, '[{\"date\":\"2021-04-15 13:38:15:575\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":4,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:38:15:673\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":47,\"time\":102,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('48', '429', 'test', 'http://localhost:1080//some/path/123', '0', '', '', '', null, '', '', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '16', '123', '0', '2021-04-15 13:38:36', null, null, null, '[{\"date\":\"2021-04-15 13:38:36:038\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":3,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:38:36:096\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":48,\"time\":61,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('49', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"cartId\":\"123\"\n}', '', null, '', '{\"cartId\":\"123\"}', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '17', '123', '0', '2021-04-15 13:39:19', null, null, null, '[{\"date\":\"2021-04-15 13:39:18:588\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":1,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:39:18:651\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":49,\"time\":64,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('50', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"cartId\":\"1245\"\n}', '', null, '', '{\"cartId\":\"1245\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '21', '123', '1', '2021-04-15 13:39:24', null, null, null, '[{\"date\":\"2021-04-15 13:39:23:757\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:39:23:810\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":50,\"time\":54,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('51', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"name\":\"123\",\n	\"value\":\"123\"\n}', '', null, '', '{\"name\":\"123\",\"value\":\"123\"}', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '17', '123', '0', '2021-04-15 13:40:11', null, null, null, '[{\"date\":\"2021-04-15 13:40:10:638\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:40:10:702\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":51,\"time\":66,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('52', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"name\":\"123\"\n}', '', null, '', '{\"name\":\"123\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '6', '123', '1', '2021-04-15 13:40:18', null, null, null, '[{\"date\":\"2021-04-15 13:40:18:053\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:40:18:083\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":52,\"time\":32,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('53', '429', 'test', 'http://localhost:1080//some/path', '0', '', '{\n	\"name\":\"123\",\n	\"value\":\"1253\"\n}', '', null, '', '{\"name\":\"123\",\"value\":\"1253\"}', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '22', '123', '1', '2021-04-15 13:40:24', null, null, null, '[{\"date\":\"2021-04-15 13:40:24:461\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:40:24:507\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":53,\"time\":48,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('54', '429', 'test', 'http://localhost:1080//some/path/123', '0', '', '', '', null, '', '', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '17', '123', '0', '2021-04-15 13:47:55', null, null, null, '[{\"date\":\"2021-04-15 13:47:55:116\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:47:55:197\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":54,\"time\":83,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('55', '429', 'test', 'http://localhost:1080//some/path/123/123', '0', '', '', '', null, '', '', null, null, '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '16', '123', '0', '2021-04-15 13:48:23', null, null, null, '[{\"date\":\"2021-04-15 13:48:22:557\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:48:22:619\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":55,\"time\":64,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('56', '429', 'test', 'http://localhost:1080//some/path/123', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '7', '123', '1', '2021-04-15 13:48:28', null, null, null, '[{\"date\":\"2021-04-15 13:48:28:052\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 13:48:28:109\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":56,\"time\":59,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('57', '429', 'test', 'http://localhost:1080//some/path', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '15', '123', '1', '2021-04-15 14:41:23', null, null, null, '[{\"date\":\"2021-04-15 14:41:23:107\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":1,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:41:23:156\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":57,\"time\":50,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('58', '429', 'test', 'http://localhost:1080//some/path', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '7', '123', '1', '2021-04-15 14:41:30', null, null, null, '[{\"date\":\"2021-04-15 14:41:29:537\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:41:29:591\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":58,\"time\":56,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('59', '429', 'test', 'http://localhost:1080//some/path', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '12', '123', '1', '2021-04-15 14:41:45', null, null, null, '[{\"date\":\"2021-04-15 14:41:45:338\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:41:45:402\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":59,\"time\":66,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('60', '429', 'test', 'http://localhost:1080//some/path', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '5', '123', '1', '2021-04-15 14:41:48', null, null, null, '[{\"date\":\"2021-04-15 14:41:48:025\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:41:48:055\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":60,\"time\":32,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('61', '429', 'test', 'http://localhost:1080//some/path', '0', '', '', '', null, '', '', null, null, '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '7', '123', '1', '2021-04-15 14:41:55', null, null, null, '[{\"date\":\"2021-04-15 14:41:54:639\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:41:54:691\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":61,\"time\":54,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('62', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'some_stringsome_stringsome_string', '', '', null, 'some_stringsome_stringsome_string', '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '14', '123', '0', '2021-04-15 14:42:14', null, null, null, '[{\"date\":\"2021-04-15 14:42:13:688\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:42:13:725\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":62,\"time\":39,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('63', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'some_stringsome_stringsome_string', '', '', null, 'some_stringsome_stringsome_string', '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '10', '123', '0', '2021-04-15 14:42:15', null, null, null, '[{\"date\":\"2021-04-15 14:42:14:640\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:42:14:697\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":63,\"time\":59,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('64', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'som', '', '', null, 'som', '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '34', '123', '1', '2021-04-15 14:42:23', null, null, null, '[{\"date\":\"2021-04-15 14:42:22:833\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 14:42:22:900\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":64,\"time\":69,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('65', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'som', '', '', null, 'som', '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '20', '123', '1', '2021-04-15 15:59:38', null, null, null, '[{\"date\":\"2021-04-15 15:59:37:634\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":11,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 15:59:37:709\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":65,\"time\":86,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('66', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'som', '', '', null, 'som', '404', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"0\"]\n}', 'null', '7', '123', '1', '2021-04-15 16:00:05', null, null, null, '[{\"date\":\"2021-04-15 16:00:05:452\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":1,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 16:00:05:485\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":66,\"time\":34,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');
INSERT INTO `t_interface_case_execute_log` VALUES ('67', '429', 'test', 'http://localhost:1080//some/path', '1', '', '', '', 'som', '', '', null, 'som', '200', '{\n	\"connection\":[\"keep-alive\"],\n	\"content-length\":[\"18\"]\n}', 'some_response_body', '9', '123', '0', '2021-04-15 16:01:31', null, null, null, '[{\"date\":\"2021-04-15 16:01:31:332\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"time\":2,\"type\":\"CASE_START\",\"desc\":\"开始执行\"},{\"date\":\"2021-04-15 16:01:31:382\",\"typeDesc\":\"执行用例\",\"name\":\"test\",\"id\":67,\"time\":52,\"type\":\"CASE_END\",\"desc\":\"执行完成\"}]', '1', '0');

-- ----------------------------
-- Table structure for t_interface_case_rely_data
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_case_rely_data`;
CREATE TABLE `t_interface_case_rely_data` (
  `rely_id` int NOT NULL AUTO_INCREMENT COMMENT ' 自增主键',
  `rely_case_id` int DEFAULT NULL COMMENT '依赖用例编号',
  `rely_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '依赖名称,通过${name}引用',
  `rely_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '依赖描述',
  `content_type` tinyint DEFAULT NULL COMMENT '提取数据类型   0json/1html/2header/',
  `extract_expression` varchar(50) DEFAULT NULL COMMENT '提取表达式',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`rely_id`),
  UNIQUE KEY `rely_name` (`rely_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_case_rely_data
-- ----------------------------
INSERT INTO `t_interface_case_rely_data` VALUES ('14', '277', 'Token', '获取登录token', '0', '$..data.token', '2021-03-08 15:27:29', '2021-03-08 15:27:37');

-- ----------------------------
-- Table structure for t_interface_case_suite
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_case_suite`;
CREATE TABLE `t_interface_case_suite` (
  `suite_id` int NOT NULL AUTO_INCREMENT COMMENT '接口测试套件id',
  `suite_name` varchar(20) DEFAULT NULL COMMENT '测试套件名称',
  `desc` varchar(100) DEFAULT NULL COMMENT '测试套件描述',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `execute_type` tinyint DEFAULT NULL COMMENT '执行方式 0并行1串行',
  `run_dev` tinyint DEFAULT NULL COMMENT '0dev1test2stg3prod4debug',
  `is_retry` tinyint DEFAULT NULL COMMENT '是否失败重新 0是1否',
  PRIMARY KEY (`suite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_case_suite
-- ----------------------------
INSERT INTO `t_interface_case_suite` VALUES ('35', '测试', null, null, '2021-04-09 20:28:32', '超级管理员', '0', '4', '1');
INSERT INTO `t_interface_case_suite` VALUES ('36', '111', '123', '2021-04-13 18:41:56', '2021-04-13 18:41:56', '123', '1', '0', '1');

-- ----------------------------
-- Table structure for t_interface_pre_case
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_pre_case`;
CREATE TABLE `t_interface_pre_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_case_id` int DEFAULT NULL COMMENT '用例id',
  `pre_case_id` int DEFAULT NULL COMMENT '前置用例id',
  `order` int DEFAULT NULL COMMENT '排序(越小越先执行)',
  `status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_case_id` (`parent_case_id`),
  KEY `pre_case_id` (`pre_case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_pre_case
-- ----------------------------

-- ----------------------------
-- Table structure for t_interface_processor
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_processor`;
CREATE TABLE `t_interface_processor` (
  `processor_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `case_id` int DEFAULT NULL COMMENT '接口测试用例编号',
  `name` varchar(50) DEFAULT NULL COMMENT '后置处理器取值名称',
  `type` tinyint DEFAULT NULL COMMENT '提取数据类型   提取数据类型   0response-json/1response-html/2response-header/3request-header/4request-params/5request-data/6request-json',
  `expression` varchar(50) DEFAULT NULL COMMENT '提取表达式',
  `default_value` varchar(100) DEFAULT NULL COMMENT '缺省值',
  `have_default_value` tinyint DEFAULT NULL COMMENT '是否存在缺省值0是1否',
  `created_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`processor_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_processor
-- ----------------------------
INSERT INTO `t_interface_processor` VALUES ('56', '280', 'id', '4', '$..id', null, '1', '2021-03-08 16:11:19', '2021-03-13 15:48:55');

-- ----------------------------
-- Table structure for t_interface_processor_log
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_processor_log`;
CREATE TABLE `t_interface_processor_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '后置处理器使用日志编号',
  `processor_id` int DEFAULT NULL COMMENT '自增主键',
  `case_id` int DEFAULT NULL COMMENT '接口测试用例编号',
  `case_execute_log_id` int DEFAULT NULL COMMENT '用例执行编号',
  `name` varchar(50) DEFAULT NULL COMMENT '后置处理器取值名称',
  `is_default_value` tinyint DEFAULT NULL COMMENT '是否为缺省值0是1否',
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '后值处理器获取的值',
  `type` tinyint DEFAULT NULL COMMENT '提取数据类型   提取数据类型   0response-json/1response-html/2response-header/3request-header/4request-params/5request-data/6request-json',
  `expression` varchar(50) DEFAULT NULL COMMENT '提取表达式',
  `created_time` datetime DEFAULT NULL COMMENT '创建日期',
  `status` tinyint DEFAULT NULL COMMENT '状态0通过1失败',
  `error_msg` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '失败时错误日志',
  `wr` tinyint DEFAULT NULL COMMENT '读/写 0读1写',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_processor_log
-- ----------------------------
INSERT INTO `t_interface_processor_log` VALUES ('1', '56', '280', '15', 'id', '1', '277', '4', '$..id', '2021-04-12 16:26:14', '0', null, '1');
INSERT INTO `t_interface_processor_log` VALUES ('2', null, null, null, 'id', null, '277', null, null, '2021-04-12 16:26:14', '0', null, '0');
INSERT INTO `t_interface_processor_log` VALUES ('3', null, null, null, 'id', null, '277', null, null, '2021-04-12 16:26:15', '0', null, '0');
INSERT INTO `t_interface_processor_log` VALUES ('4', '56', '280', '24', 'id', '1', '277', '4', '$..id', '2021-04-13 18:42:22', '0', null, '1');
INSERT INTO `t_interface_processor_log` VALUES ('5', null, null, null, 'id', null, '277', null, null, '2021-04-13 18:42:22', '0', null, '0');
INSERT INTO `t_interface_processor_log` VALUES ('6', null, null, null, 'id', null, '277', null, null, '2021-04-13 18:42:22', '0', null, '0');
INSERT INTO `t_interface_processor_log` VALUES ('7', '56', '280', '33', 'id', '1', '277', '4', '$..id', '2021-04-13 18:42:23', '0', null, '1');
INSERT INTO `t_interface_processor_log` VALUES ('8', null, null, null, 'id', null, '277', null, null, '2021-04-13 18:42:23', '0', null, '0');
INSERT INTO `t_interface_processor_log` VALUES ('9', null, null, null, 'id', null, '277', null, null, '2021-04-13 18:42:23', '0', null, '0');

-- ----------------------------
-- Table structure for t_interface_suite_case_ref
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_suite_case_ref`;
CREATE TABLE `t_interface_suite_case_ref` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `case_id` int NOT NULL COMMENT '接口用例编号',
  `suite_id` int NOT NULL COMMENT '测试套件编号',
  `case_status` tinyint DEFAULT NULL COMMENT '用例状态0启用 1禁用',
  `order` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_suite_case_ref
-- ----------------------------
INSERT INTO `t_interface_suite_case_ref` VALUES ('338', '277', '35', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('339', '279', '35', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('340', '284', '35', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('341', '283', '35', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('342', '280', '35', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('343', '284', '36', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('344', '283', '36', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('345', '280', '36', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('346', '279', '36', '0', '1');
INSERT INTO `t_interface_suite_case_ref` VALUES ('347', '277', '36', '0', '1');

-- ----------------------------
-- Table structure for t_interface_suite_log
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_suite_log`;
CREATE TABLE `t_interface_suite_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suite_id` int DEFAULT NULL,
  `suite_log_no` varchar(50) DEFAULT NULL COMMENT '测试套件日志编号',
  `run_time` int DEFAULT NULL COMMENT '运行时长ms',
  `total_case` int DEFAULT NULL COMMENT '测试套件总用例',
  `total_run_case` int DEFAULT NULL COMMENT '运行总用例数',
  `total_skip` int DEFAULT NULL COMMENT '跳过数（未启用）',
  `total_success` int DEFAULT NULL COMMENT '运行成功数',
  `total_failed` int DEFAULT NULL COMMENT '运行失败数',
  `total_error` int DEFAULT NULL COMMENT '运行错误数',
  `total_retry` int DEFAULT NULL COMMENT '总重试用例数',
  `start_time` datetime DEFAULT NULL COMMENT '开始运行时间',
  `end_time` datetime DEFAULT NULL COMMENT '运行完成时间',
  `execute_type` tinyint DEFAULT NULL COMMENT '执行方式 0并行1串行',
  `run_dev` tinyint DEFAULT NULL COMMENT '0dev1test2stg3prod4debug',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `is_retry` tinyint DEFAULT NULL COMMENT '是否失败重新 0是1否',
  `progress` tinyint DEFAULT NULL COMMENT '0进行中1执行完成2执行失败',
  `percentage` int DEFAULT NULL COMMENT '执行进度百分比',
  PRIMARY KEY (`id`),
  UNIQUE KEY `suite_log_no` (`suite_log_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_suite_log
-- ----------------------------
INSERT INTO `t_interface_suite_log` VALUES ('1', '35', 'SN20210411181450n5vsl86703', '320', '1', '1', '0', '1', '0', '0', null, '2021-04-11 18:14:50', '2021-04-11 18:14:50', '0', '4', '定时任务', '1', '1', '100');
INSERT INTO `t_interface_suite_log` VALUES ('2', '35', 'SN20210411181639k6drf31595', '469', '1', '1', '0', '1', '0', '0', null, '2021-04-11 18:16:39', '2021-04-11 18:16:39', '0', '4', '定时任务', '1', '1', '100');
INSERT INTO `t_interface_suite_log` VALUES ('3', '35', 'SN20210412161600kvduc40230', '189', '2', '2', '0', '2', '0', '0', null, '2021-04-12 16:16:00', '2021-04-12 16:16:01', '0', '4', '123', '1', '1', '100');
INSERT INTO `t_interface_suite_log` VALUES ('4', '35', 'SN202104131801150w4hn83167', '420', '2', '2', '0', '2', '0', '0', null, '2021-04-13 18:01:15', '2021-04-13 18:01:15', '0', '4', '定时任务', '1', '1', '100');
INSERT INTO `t_interface_suite_log` VALUES ('5', '35', 'SN20210413184221cb7eg49748', '671', '5', '5', '0', '3', '2', '0', null, '2021-04-13 18:42:21', '2021-04-13 18:42:22', '0', '4', '123', '1', '1', '100');
INSERT INTO `t_interface_suite_log` VALUES ('6', '36', 'SN20210413184222hg9nw60378', '692', '5', '5', '0', '4', '1', '0', null, '2021-04-13 18:42:23', '2021-04-13 18:42:23', '1', '0', '123', '1', '1', '100');

-- ----------------------------
-- Table structure for t_interface_suite_processor
-- ----------------------------
DROP TABLE IF EXISTS `t_interface_suite_processor`;
CREATE TABLE `t_interface_suite_processor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suite_id` int DEFAULT NULL COMMENT '测试套件编号',
  `processor_type` tinyint DEFAULT NULL COMMENT '0前置处理器1后置处理器',
  `type` tinyint DEFAULT NULL COMMENT '0执行依赖1公共头2公共params3公共data',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface_suite_processor
-- ----------------------------
INSERT INTO `t_interface_suite_processor` VALUES ('52', '35', '0', '0', null, '', '2021-04-09 20:28:32', '2021-04-09 20:28:32');
INSERT INTO `t_interface_suite_processor` VALUES ('53', '35', '1', '0', null, '', '2021-04-09 20:28:32', '2021-04-09 20:28:32');

-- ----------------------------
-- Table structure for t_mock_api
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_api`;
CREATE TABLE `t_mock_api` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `server_id` int DEFAULT NULL,
  `desc` varchar(30) DEFAULT NULL COMMENT '描述',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求地址',
  `method` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `response_code` int DEFAULT NULL COMMENT '状态码',
  `response_headers` varchar(1000) DEFAULT NULL COMMENT '响应头',
  `response_body` mediumtext COMMENT '响应body',
  `response_delay` int DEFAULT NULL COMMENT '响应时延ms',
  `status` tinyint DEFAULT NULL COMMENT '0启用1禁用',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `response_headers_enable_rely` tinyint DEFAULT NULL COMMENT '0是1否 是否解析headers依赖',
  `response_body_enable_rely` tinyint DEFAULT NULL COMMENT '0是1否 是否解析body依赖',
  `creator_id` int DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(30) DEFAULT NULL COMMENT '创建人名称',
  `response_body_type` tinyint DEFAULT NULL COMMENT '0文本1json2xml3html',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mock_api
-- ----------------------------
INSERT INTO `t_mock_api` VALUES ('5', '1', '123', '/get', 'GET', '123', '123', '123', null, '1', '2021-04-16 18:11:28', '2021-04-16 20:41:22', '0', '0', '1', '123', '0');

-- ----------------------------
-- Table structure for t_mock_hit_policy
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_hit_policy`;
CREATE TABLE `t_mock_hit_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `api_id` int DEFAULT NULL COMMENT 'api_id',
  `match_scope` tinyint DEFAULT NULL COMMENT '0请求头1请求body2pathparams3请求queryparams',
  `match_type` tinyint DEFAULT NULL COMMENT '0固定值1包含2正则3jsonschema4xpath5jsonpath',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `status` tinyint DEFAULT NULL COMMENT '0启用1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mock_hit_policy
-- ----------------------------

-- ----------------------------
-- Table structure for t_mock_sever
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_sever`;
CREATE TABLE `t_mock_sever` (
  `server_id` int NOT NULL AUTO_INCREMENT,
  `port` int DEFAULT NULL COMMENT '端口号',
  `remote_host` varchar(30) DEFAULT NULL COMMENT '当没有命中时转发的主机地址',
  `remote_port` int DEFAULT NULL COMMENT '当没有命中时转发的端口',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `creator_id` int DEFAULT NULL COMMENT '创建人user_id',
  `creator_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人realname',
  `created_time` datetime DEFAULT NULL COMMENT 'update_time',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `port` (`port`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mock_sever
-- ----------------------------
INSERT INTO `t_mock_sever` VALUES ('1', '7733', '127.0.0.1', '7777', '123', '1', '', '2021-04-14 17:07:46', '2021-04-15 12:32:08');
INSERT INTO `t_mock_sever` VALUES ('3', '5555', '', null, '', '1', '123', '2021-04-14 19:24:01', '2021-04-14 19:24:23');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `project_id` int NOT NULL COMMENT '项目id',
  `module_id` int NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块名称',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES ('24', '14', '用户管理', null, '2021-03-08 15:24:31', '2021-03-08 15:24:31');
INSERT INTO `t_module` VALUES ('25', '15', 'Mock', null, '2021-04-15 13:27:28', '2021-04-15 13:27:28');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限编号 对应代码中@RequiresPermissions 的value',
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限名称',
  `parent_id` int DEFAULT NULL COMMENT '父节点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'user', '用户管理', '0');
INSERT INTO `t_permission` VALUES ('2', 'user:add', '新增', '1');
INSERT INTO `t_permission` VALUES ('3', 'user:modify', '修改', '1');
INSERT INTO `t_permission` VALUES ('4', 'user:remove', '删除', '1');
INSERT INTO `t_permission` VALUES ('5', 'user:find', '查询', '1');
INSERT INTO `t_permission` VALUES ('6', 'user:reset', '重置密码', '1');
INSERT INTO `t_permission` VALUES ('89', 'role', '角色管理', '0');
INSERT INTO `t_permission` VALUES ('90', 'role:add', '新增', '89');
INSERT INTO `t_permission` VALUES ('91', 'role:modify', '修改', '89');
INSERT INTO `t_permission` VALUES ('92', 'role:remove', '删除', '89');
INSERT INTO `t_permission` VALUES ('93', 'role:find', '查询', '89');
INSERT INTO `t_permission` VALUES ('94', 'role:permission', '授权', '89');
INSERT INTO `t_permission` VALUES ('95', 'permission', '权限管理', '0');
INSERT INTO `t_permission` VALUES ('100', 'permission:add_top', '新增顶级节点', '95');
INSERT INTO `t_permission` VALUES ('102', 'project', '项目管理', '0');
INSERT INTO `t_permission` VALUES ('103', 'project:add', '新增', '102');
INSERT INTO `t_permission` VALUES ('104', 'project:modify', '修改', '102');
INSERT INTO `t_permission` VALUES ('105', 'project:remove', '删除', '102');
INSERT INTO `t_permission` VALUES ('106', 'project:find', '查询', '102');
INSERT INTO `t_permission` VALUES ('107', 'module', '模块管理', '0');
INSERT INTO `t_permission` VALUES ('108', 'module:add', '新增', '107');
INSERT INTO `t_permission` VALUES ('109', 'module:modify', '修改', '107');
INSERT INTO `t_permission` VALUES ('110', 'module:remove', '删除', '107');
INSERT INTO `t_permission` VALUES ('111', 'module:find', '查询', '107');
INSERT INTO `t_permission` VALUES ('112', 'db', '数据源中心', '0');
INSERT INTO `t_permission` VALUES ('113', 'db:add', '新增', '112');
INSERT INTO `t_permission` VALUES ('114', 'db:modify', '修改', '112');
INSERT INTO `t_permission` VALUES ('115', 'db:remove', '删除', '112');
INSERT INTO `t_permission` VALUES ('116', 'db:find', '查询', '112');
INSERT INTO `t_permission` VALUES ('117', 'db:check', '预检', '112');
INSERT INTO `t_permission` VALUES ('118', 'factory', '数据工厂', '0');
INSERT INTO `t_permission` VALUES ('119', 'factory:add', '新增', '118');
INSERT INTO `t_permission` VALUES ('120', 'factory:modify', '修改', '118');
INSERT INTO `t_permission` VALUES ('121', 'factory:remove', '删除', '118');
INSERT INTO `t_permission` VALUES ('122', 'factory:find', '查询', '118');
INSERT INTO `t_permission` VALUES ('123', 'factory:execute', '执行', '118');
INSERT INTO `t_permission` VALUES ('124', 'data_center', '数据中心', '0');
INSERT INTO `t_permission` VALUES ('125', 'data_center:temp_env', '临时变量', '124');
INSERT INTO `t_permission` VALUES ('126', 'data_center:temp_env:find', '查询', '125');
INSERT INTO `t_permission` VALUES ('127', 'data_center:temp_env:clear', '清空', '125');
INSERT INTO `t_permission` VALUES ('128', 'data_center:if_rely', '接口依赖', '124');
INSERT INTO `t_permission` VALUES ('129', 'data_center:if_rely:add', '新增', '128');
INSERT INTO `t_permission` VALUES ('130', 'data_center:if_rely:modify', '修改', '128');
INSERT INTO `t_permission` VALUES ('131', 'data_center:if_rely:remove', '删除', '128');
INSERT INTO `t_permission` VALUES ('132', 'data_center:if_rely:find', '查询', '128');
INSERT INTO `t_permission` VALUES ('133', 'data_center:if_rely:execute', '执行', '128');
INSERT INTO `t_permission` VALUES ('134', 'data_center:rely_data', '其它依赖', '124');
INSERT INTO `t_permission` VALUES ('135', 'data_center:rely_data:add', '新增', '134');
INSERT INTO `t_permission` VALUES ('136', 'data_center:rely_data:modify', '修改', '134');
INSERT INTO `t_permission` VALUES ('137', 'data_center:rely_data:remove', '删除', '134');
INSERT INTO `t_permission` VALUES ('138', 'data_center:rely_data:find', '查询', '134');
INSERT INTO `t_permission` VALUES ('139', 'data_center:rely_sql_data', 'SQL语句', '124');
INSERT INTO `t_permission` VALUES ('140', 'data_center:rely_sql_data:add', '新增', '139');
INSERT INTO `t_permission` VALUES ('141', 'data_center:rely_sql_data:modify', '修改', '139');
INSERT INTO `t_permission` VALUES ('142', 'data_center:rely_sql_data:remove', '删除', '139');
INSERT INTO `t_permission` VALUES ('143', 'data_center:rely_sql_data:find', '查询', '139');
INSERT INTO `t_permission` VALUES ('144', 'data_center:rely_init_method', '预置方法', '124');
INSERT INTO `t_permission` VALUES ('146', 'data_center:rely_init_method:modify', '修改', '144');
INSERT INTO `t_permission` VALUES ('147', 'data_center:rely_init_method:remove', '删除', '144');
INSERT INTO `t_permission` VALUES ('148', 'data_center:rely_init_method:find', '查询', '144');
INSERT INTO `t_permission` VALUES ('149', 'data_center:rely_fixed_data', '固定字符', '124');
INSERT INTO `t_permission` VALUES ('150', 'data_center:rely_fixed_data:add', '新增', '149');
INSERT INTO `t_permission` VALUES ('151', 'data_center:rely_fixed_data:modify', '修改', '149');
INSERT INTO `t_permission` VALUES ('152', 'data_center:rely_fixed_data:remove', '删除', '149');
INSERT INTO `t_permission` VALUES ('153', 'data_center:rely_fixed_data:find', '查询', '149');
INSERT INTO `t_permission` VALUES ('154', 'interface', '接口测试', '0');
INSERT INTO `t_permission` VALUES ('155', 'interface:case', '测试用例', '154');
INSERT INTO `t_permission` VALUES ('156', 'interface:case:add', '新增', '155');
INSERT INTO `t_permission` VALUES ('157', 'interface:case:modify', '修改', '155');
INSERT INTO `t_permission` VALUES ('158', 'interface:case:remove', '删除', '155');
INSERT INTO `t_permission` VALUES ('159', 'interface:case:find', '查询', '155');
INSERT INTO `t_permission` VALUES ('160', 'interface:case:copy', '复制', '155');
INSERT INTO `t_permission` VALUES ('161', 'interface:case:generate', '生成', '155');
INSERT INTO `t_permission` VALUES ('162', 'interface:case:import', '导入', '155');
INSERT INTO `t_permission` VALUES ('163', 'interface:case:execute', '执行', '155');
INSERT INTO `t_permission` VALUES ('164', 'interface:suite', '测试套件', '154');
INSERT INTO `t_permission` VALUES ('165', 'interface:suite:add', '新增', '164');
INSERT INTO `t_permission` VALUES ('166', 'interface:suite:modify', '修改', '164');
INSERT INTO `t_permission` VALUES ('167', 'interface:suite:remove', '删除', '164');
INSERT INTO `t_permission` VALUES ('168', 'interface:suite:find', '查询', '164');
INSERT INTO `t_permission` VALUES ('169', 'interface:suite:copy', '复制', '164');
INSERT INTO `t_permission` VALUES ('170', 'interface:suite:manager', '用例维护', '164');
INSERT INTO `t_permission` VALUES ('171', 'interface:suite:execute', '执行', '164');
INSERT INTO `t_permission` VALUES ('172', 'interface:case_log', '执行日志', '154');
INSERT INTO `t_permission` VALUES ('173', 'interface:case_log:find', '查询', '172');
INSERT INTO `t_permission` VALUES ('174', 'interface:case_log:detail', '详情', '172');
INSERT INTO `t_permission` VALUES ('175', 'interface:case_log:chain', '链路跟踪', '172');
INSERT INTO `t_permission` VALUES ('176', 'interface:assert_log', '断言日志', '154');
INSERT INTO `t_permission` VALUES ('177', 'interface:assert_log:find', '查询', '176');
INSERT INTO `t_permission` VALUES ('178', 'setting', '配置中心', '0');
INSERT INTO `t_permission` VALUES ('179', 'setting:email', '邮箱管理', '178');
INSERT INTO `t_permission` VALUES ('180', 'setting:email:add', '新增', '179');
INSERT INTO `t_permission` VALUES ('181', 'setting:email:modify', '修改', '179');
INSERT INTO `t_permission` VALUES ('182', 'setting:email:remove', '删除', '179');
INSERT INTO `t_permission` VALUES ('183', 'setting:email:find', '查询', '179');
INSERT INTO `t_permission` VALUES ('184', 'setting:proxy', '代理管理', '178');
INSERT INTO `t_permission` VALUES ('185', 'setting:proxy:add', '新增', '184');
INSERT INTO `t_permission` VALUES ('186', 'setting:proxy:modify', '修改', '184');
INSERT INTO `t_permission` VALUES ('187', 'setting:proxy:remove', '删除', '184');
INSERT INTO `t_permission` VALUES ('188', 'setting:proxy:find', '查询', '184');
INSERT INTO `t_permission` VALUES ('189', 'setting:task', '定时任务', '178');
INSERT INTO `t_permission` VALUES ('190', 'setting:task:add', '新增', '189');
INSERT INTO `t_permission` VALUES ('191', 'setting:task:modify', '修改', '189');
INSERT INTO `t_permission` VALUES ('192', 'setting:task:remove', '删除', '189');
INSERT INTO `t_permission` VALUES ('193', 'setting:task:find', '查询', '189');
INSERT INTO `t_permission` VALUES ('194', 'setting:task:execute', '执行', '189');
INSERT INTO `t_permission` VALUES ('195', 'setting:timeout', '超时配置', '178');
INSERT INTO `t_permission` VALUES ('196', 'setting:timeout:add', '新增', '195');
INSERT INTO `t_permission` VALUES ('197', 'setting:timeout:modify', '修改', '195');
INSERT INTO `t_permission` VALUES ('198', 'setting:timeout:remove', '删除', '195');
INSERT INTO `t_permission` VALUES ('199', 'setting:timeout:find', '查询', '195');
INSERT INTO `t_permission` VALUES ('200', 'interface:case:logInfo', '链路日志', '155');
INSERT INTO `t_permission` VALUES ('201', 'feedback', '反馈中心', '0');
INSERT INTO `t_permission` VALUES ('202', 'feedback:list', '反馈列表', '201');
INSERT INTO `t_permission` VALUES ('203', 'feedback:list:find', '查询', '202');
INSERT INTO `t_permission` VALUES ('204', 'feedback:list:remove', '删除', '202');
INSERT INTO `t_permission` VALUES ('205', 'feedback:list:reply', '回复', '202');
INSERT INTO `t_permission` VALUES ('206', 'feedback:my', '我的反馈', '201');
INSERT INTO `t_permission` VALUES ('207', 'feedback:my:add', '新增', '206');
INSERT INTO `t_permission` VALUES ('208', 'feedback:my:modify', '修改', '206');
INSERT INTO `t_permission` VALUES ('209', 'feedback:my:remove', '删除', '206');
INSERT INTO `t_permission` VALUES ('210', 'feedback:my:find', '查询', '206');
INSERT INTO `t_permission` VALUES ('211', 'interface:ifreport', '测试报告', '154');
INSERT INTO `t_permission` VALUES ('212', 'interface:ifreport:find', '查询', '211');
INSERT INTO `t_permission` VALUES ('213', 'mock', 'Mock', '0');
INSERT INTO `t_permission` VALUES ('214', 'mock:node', '节点管理', '213');
INSERT INTO `t_permission` VALUES ('215', 'mock:node:add', '添加', '214');
INSERT INTO `t_permission` VALUES ('216', 'mock:node:modify', '修改', '214');
INSERT INTO `t_permission` VALUES ('217', 'mock:node:remove', '删除', '214');
INSERT INTO `t_permission` VALUES ('218', 'mock:node:find', '查询', '214');
INSERT INTO `t_permission` VALUES ('219', 'mock:node:start', '启用', '214');
INSERT INTO `t_permission` VALUES ('220', 'mock:node:stop', '停用', '214');
INSERT INTO `t_permission` VALUES ('221', 'mock:api', '接口管理', '213');
INSERT INTO `t_permission` VALUES ('222', 'mock:api:add', '添加', '221');
INSERT INTO `t_permission` VALUES ('223', 'mock:api:modify', '修改', '221');
INSERT INTO `t_permission` VALUES ('224', 'mock:api:remove', '删除', '221');
INSERT INTO `t_permission` VALUES ('225', 'mock:api:query', '查询', '221');

-- ----------------------------
-- Table structure for t_permission_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_role_ref`;
CREATE TABLE `t_permission_role_ref` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int DEFAULT NULL COMMENT '权限ID',
  `role_id` int DEFAULT NULL COMMENT '权限编号',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission_role_ref
-- ----------------------------
INSERT INTO `t_permission_role_ref` VALUES ('31', '89', '1', '2021-03-12 19:58:20');
INSERT INTO `t_permission_role_ref` VALUES ('32', '90', '1', '2021-03-12 19:58:21');
INSERT INTO `t_permission_role_ref` VALUES ('33', '91', '1', '2021-03-12 19:58:21');
INSERT INTO `t_permission_role_ref` VALUES ('34', '92', '1', '2021-03-12 19:58:22');
INSERT INTO `t_permission_role_ref` VALUES ('35', '93', '1', '2021-03-12 19:58:22');
INSERT INTO `t_permission_role_ref` VALUES ('36', '94', '1', '2021-03-12 19:58:23');
INSERT INTO `t_permission_role_ref` VALUES ('37', '95', '1', '2021-03-12 19:58:24');
INSERT INTO `t_permission_role_ref` VALUES ('38', '97', '1', '2021-03-12 19:58:25');
INSERT INTO `t_permission_role_ref` VALUES ('39', '96', '1', '2021-03-12 19:58:27');
INSERT INTO `t_permission_role_ref` VALUES ('40', '98', '1', '2021-03-12 19:58:28');
INSERT INTO `t_permission_role_ref` VALUES ('41', '99', '1', '2021-03-12 19:58:28');
INSERT INTO `t_permission_role_ref` VALUES ('42', '100', '1', '2021-03-12 19:58:30');
INSERT INTO `t_permission_role_ref` VALUES ('43', '102', '1', '2021-03-12 19:58:32');
INSERT INTO `t_permission_role_ref` VALUES ('44', '103', '1', '2021-03-12 19:58:33');
INSERT INTO `t_permission_role_ref` VALUES ('45', '104', '1', '2021-03-12 19:58:34');
INSERT INTO `t_permission_role_ref` VALUES ('46', '105', '1', '2021-03-12 19:58:34');
INSERT INTO `t_permission_role_ref` VALUES ('47', '106', '1', '2021-03-12 19:58:34');
INSERT INTO `t_permission_role_ref` VALUES ('48', '107', '1', '2021-03-12 19:58:38');
INSERT INTO `t_permission_role_ref` VALUES ('49', '108', '1', '2021-03-12 19:58:38');
INSERT INTO `t_permission_role_ref` VALUES ('50', '109', '1', '2021-03-12 19:58:39');
INSERT INTO `t_permission_role_ref` VALUES ('51', '110', '1', '2021-03-12 19:58:39');
INSERT INTO `t_permission_role_ref` VALUES ('52', '111', '1', '2021-03-12 19:58:40');
INSERT INTO `t_permission_role_ref` VALUES ('53', '112', '1', '2021-03-12 19:58:41');
INSERT INTO `t_permission_role_ref` VALUES ('54', '113', '1', '2021-03-12 19:58:42');
INSERT INTO `t_permission_role_ref` VALUES ('55', '114', '1', '2021-03-12 19:58:42');
INSERT INTO `t_permission_role_ref` VALUES ('56', '115', '1', '2021-03-12 19:58:42');
INSERT INTO `t_permission_role_ref` VALUES ('57', '116', '1', '2021-03-12 19:58:43');
INSERT INTO `t_permission_role_ref` VALUES ('58', '117', '1', '2021-03-12 19:58:43');
INSERT INTO `t_permission_role_ref` VALUES ('59', '118', '1', '2021-03-12 19:58:46');
INSERT INTO `t_permission_role_ref` VALUES ('60', '119', '1', '2021-03-12 19:58:47');
INSERT INTO `t_permission_role_ref` VALUES ('61', '120', '1', '2021-03-12 19:58:47');
INSERT INTO `t_permission_role_ref` VALUES ('62', '121', '1', '2021-03-12 19:58:48');
INSERT INTO `t_permission_role_ref` VALUES ('63', '122', '1', '2021-03-12 19:58:48');
INSERT INTO `t_permission_role_ref` VALUES ('64', '123', '1', '2021-03-12 19:58:49');
INSERT INTO `t_permission_role_ref` VALUES ('65', '124', '1', '2021-03-12 19:58:50');
INSERT INTO `t_permission_role_ref` VALUES ('66', '125', '1', '2021-03-12 19:58:52');
INSERT INTO `t_permission_role_ref` VALUES ('67', '126', '1', '2021-03-12 19:58:53');
INSERT INTO `t_permission_role_ref` VALUES ('68', '127', '1', '2021-03-12 19:58:55');
INSERT INTO `t_permission_role_ref` VALUES ('69', '128', '1', '2021-03-12 19:58:56');
INSERT INTO `t_permission_role_ref` VALUES ('70', '129', '1', '2021-03-12 19:58:56');
INSERT INTO `t_permission_role_ref` VALUES ('71', '130', '1', '2021-03-12 19:58:57');
INSERT INTO `t_permission_role_ref` VALUES ('72', '131', '1', '2021-03-12 19:58:58');
INSERT INTO `t_permission_role_ref` VALUES ('73', '132', '1', '2021-03-12 19:58:59');
INSERT INTO `t_permission_role_ref` VALUES ('74', '133', '1', '2021-03-12 19:58:59');
INSERT INTO `t_permission_role_ref` VALUES ('76', '135', '1', '2021-03-12 19:59:01');
INSERT INTO `t_permission_role_ref` VALUES ('77', '136', '1', '2021-03-12 19:59:01');
INSERT INTO `t_permission_role_ref` VALUES ('78', '137', '1', '2021-03-12 19:59:02');
INSERT INTO `t_permission_role_ref` VALUES ('79', '138', '1', '2021-03-12 19:59:02');
INSERT INTO `t_permission_role_ref` VALUES ('80', '139', '1', '2021-03-12 19:59:04');
INSERT INTO `t_permission_role_ref` VALUES ('81', '140', '1', '2021-03-12 19:59:04');
INSERT INTO `t_permission_role_ref` VALUES ('82', '141', '1', '2021-03-12 19:59:05');
INSERT INTO `t_permission_role_ref` VALUES ('83', '142', '1', '2021-03-12 19:59:05');
INSERT INTO `t_permission_role_ref` VALUES ('84', '143', '1', '2021-03-12 19:59:05');
INSERT INTO `t_permission_role_ref` VALUES ('85', '144', '1', '2021-03-12 19:59:07');
INSERT INTO `t_permission_role_ref` VALUES ('86', '145', '1', '2021-03-12 19:59:08');
INSERT INTO `t_permission_role_ref` VALUES ('87', '146', '1', '2021-03-12 19:59:10');
INSERT INTO `t_permission_role_ref` VALUES ('88', '147', '1', '2021-03-12 19:59:10');
INSERT INTO `t_permission_role_ref` VALUES ('89', '148', '1', '2021-03-12 19:59:11');
INSERT INTO `t_permission_role_ref` VALUES ('90', '149', '1', '2021-03-12 19:59:12');
INSERT INTO `t_permission_role_ref` VALUES ('91', '150', '1', '2021-03-12 19:59:13');
INSERT INTO `t_permission_role_ref` VALUES ('92', '152', '1', '2021-03-12 19:59:14');
INSERT INTO `t_permission_role_ref` VALUES ('93', '151', '1', '2021-03-12 19:59:14');
INSERT INTO `t_permission_role_ref` VALUES ('94', '153', '1', '2021-03-12 19:59:15');
INSERT INTO `t_permission_role_ref` VALUES ('95', '154', '1', '2021-03-12 19:59:16');
INSERT INTO `t_permission_role_ref` VALUES ('96', '155', '1', '2021-03-12 19:59:17');
INSERT INTO `t_permission_role_ref` VALUES ('97', '156', '1', '2021-03-12 19:59:18');
INSERT INTO `t_permission_role_ref` VALUES ('98', '157', '1', '2021-03-12 19:59:19');
INSERT INTO `t_permission_role_ref` VALUES ('99', '158', '1', '2021-03-12 19:59:20');
INSERT INTO `t_permission_role_ref` VALUES ('100', '159', '1', '2021-03-12 19:59:20');
INSERT INTO `t_permission_role_ref` VALUES ('101', '160', '1', '2021-03-12 19:59:21');
INSERT INTO `t_permission_role_ref` VALUES ('102', '161', '1', '2021-03-12 19:59:21');
INSERT INTO `t_permission_role_ref` VALUES ('103', '163', '1', '2021-03-12 19:59:23');
INSERT INTO `t_permission_role_ref` VALUES ('104', '162', '1', '2021-03-12 19:59:25');
INSERT INTO `t_permission_role_ref` VALUES ('105', '164', '1', '2021-03-12 19:59:27');
INSERT INTO `t_permission_role_ref` VALUES ('106', '165', '1', '2021-03-12 19:59:29');
INSERT INTO `t_permission_role_ref` VALUES ('107', '166', '1', '2021-03-12 19:59:29');
INSERT INTO `t_permission_role_ref` VALUES ('108', '167', '1', '2021-03-12 19:59:30');
INSERT INTO `t_permission_role_ref` VALUES ('109', '168', '1', '2021-03-12 19:59:30');
INSERT INTO `t_permission_role_ref` VALUES ('110', '169', '1', '2021-03-12 19:59:30');
INSERT INTO `t_permission_role_ref` VALUES ('111', '170', '1', '2021-03-12 19:59:31');
INSERT INTO `t_permission_role_ref` VALUES ('112', '171', '1', '2021-03-12 19:59:33');
INSERT INTO `t_permission_role_ref` VALUES ('113', '172', '1', '2021-03-12 19:59:34');
INSERT INTO `t_permission_role_ref` VALUES ('114', '173', '1', '2021-03-12 19:59:36');
INSERT INTO `t_permission_role_ref` VALUES ('115', '174', '1', '2021-03-12 19:59:37');
INSERT INTO `t_permission_role_ref` VALUES ('116', '175', '1', '2021-03-12 19:59:37');
INSERT INTO `t_permission_role_ref` VALUES ('117', '176', '1', '2021-03-12 19:59:38');
INSERT INTO `t_permission_role_ref` VALUES ('118', '177', '1', '2021-03-12 19:59:38');
INSERT INTO `t_permission_role_ref` VALUES ('119', '179', '1', '2021-03-12 19:59:40');
INSERT INTO `t_permission_role_ref` VALUES ('120', '178', '1', '2021-03-12 19:59:40');
INSERT INTO `t_permission_role_ref` VALUES ('121', '181', '1', '2021-03-12 19:59:42');
INSERT INTO `t_permission_role_ref` VALUES ('122', '180', '1', '2021-03-12 19:59:42');
INSERT INTO `t_permission_role_ref` VALUES ('123', '182', '1', '2021-03-12 19:59:43');
INSERT INTO `t_permission_role_ref` VALUES ('124', '183', '1', '2021-03-12 19:59:44');
INSERT INTO `t_permission_role_ref` VALUES ('125', '184', '1', '2021-03-12 19:59:45');
INSERT INTO `t_permission_role_ref` VALUES ('126', '185', '1', '2021-03-12 19:59:46');
INSERT INTO `t_permission_role_ref` VALUES ('127', '186', '1', '2021-03-12 19:59:47');
INSERT INTO `t_permission_role_ref` VALUES ('128', '187', '1', '2021-03-12 19:59:47');
INSERT INTO `t_permission_role_ref` VALUES ('129', '188', '1', '2021-03-12 19:59:48');
INSERT INTO `t_permission_role_ref` VALUES ('130', '189', '1', '2021-03-12 19:59:48');
INSERT INTO `t_permission_role_ref` VALUES ('131', '190', '1', '2021-03-12 19:59:49');
INSERT INTO `t_permission_role_ref` VALUES ('132', '191', '1', '2021-03-12 19:59:49');
INSERT INTO `t_permission_role_ref` VALUES ('133', '192', '1', '2021-03-12 19:59:51');
INSERT INTO `t_permission_role_ref` VALUES ('134', '193', '1', '2021-03-12 19:59:51');
INSERT INTO `t_permission_role_ref` VALUES ('137', '2', '1', '2021-03-12 20:36:59');
INSERT INTO `t_permission_role_ref` VALUES ('138', '4', '1', '2021-03-12 20:37:00');
INSERT INTO `t_permission_role_ref` VALUES ('139', '3', '1', '2021-03-12 20:37:00');
INSERT INTO `t_permission_role_ref` VALUES ('140', '5', '1', '2021-03-12 20:37:01');
INSERT INTO `t_permission_role_ref` VALUES ('141', '6', '1', '2021-03-12 20:37:01');
INSERT INTO `t_permission_role_ref` VALUES ('142', '1', '1', '2021-03-12 20:38:31');
INSERT INTO `t_permission_role_ref` VALUES ('153', '127', '4', '2021-03-12 21:02:08');
INSERT INTO `t_permission_role_ref` VALUES ('154', '126', '4', '2021-03-12 21:02:08');
INSERT INTO `t_permission_role_ref` VALUES ('155', '1', '4', '2021-03-12 21:25:53');
INSERT INTO `t_permission_role_ref` VALUES ('156', '89', '4', '2021-03-12 21:25:55');
INSERT INTO `t_permission_role_ref` VALUES ('157', '95', '4', '2021-03-12 21:25:56');
INSERT INTO `t_permission_role_ref` VALUES ('158', '102', '4', '2021-03-12 21:25:56');
INSERT INTO `t_permission_role_ref` VALUES ('159', '107', '4', '2021-03-12 21:25:57');
INSERT INTO `t_permission_role_ref` VALUES ('160', '112', '4', '2021-03-12 21:25:57');
INSERT INTO `t_permission_role_ref` VALUES ('161', '118', '4', '2021-03-12 21:25:58');
INSERT INTO `t_permission_role_ref` VALUES ('162', '124', '4', '2021-03-12 21:25:59');
INSERT INTO `t_permission_role_ref` VALUES ('163', '154', '4', '2021-03-12 21:25:59');
INSERT INTO `t_permission_role_ref` VALUES ('164', '178', '4', '2021-03-12 21:26:00');
INSERT INTO `t_permission_role_ref` VALUES ('165', '194', '1', '2021-04-02 09:20:55');
INSERT INTO `t_permission_role_ref` VALUES ('166', '195', '1', '2021-04-11 17:13:45');
INSERT INTO `t_permission_role_ref` VALUES ('167', '196', '1', '2021-04-11 17:13:46');
INSERT INTO `t_permission_role_ref` VALUES ('168', '197', '1', '2021-04-11 17:13:47');
INSERT INTO `t_permission_role_ref` VALUES ('169', '198', '1', '2021-04-11 17:13:47');
INSERT INTO `t_permission_role_ref` VALUES ('170', '199', '1', '2021-04-11 17:13:48');
INSERT INTO `t_permission_role_ref` VALUES ('171', '200', '1', '2021-04-11 18:08:03');
INSERT INTO `t_permission_role_ref` VALUES ('172', '201', '1', '2021-04-11 21:05:27');
INSERT INTO `t_permission_role_ref` VALUES ('173', '202', '1', '2021-04-11 21:05:27');
INSERT INTO `t_permission_role_ref` VALUES ('174', '203', '1', '2021-04-11 21:05:28');
INSERT INTO `t_permission_role_ref` VALUES ('175', '204', '1', '2021-04-11 21:05:28');
INSERT INTO `t_permission_role_ref` VALUES ('176', '205', '1', '2021-04-11 21:05:29');
INSERT INTO `t_permission_role_ref` VALUES ('177', '206', '1', '2021-04-11 21:05:30');
INSERT INTO `t_permission_role_ref` VALUES ('178', '208', '1', '2021-04-11 21:05:31');
INSERT INTO `t_permission_role_ref` VALUES ('179', '209', '1', '2021-04-11 21:05:31');
INSERT INTO `t_permission_role_ref` VALUES ('180', '210', '1', '2021-04-11 21:05:32');
INSERT INTO `t_permission_role_ref` VALUES ('181', '207', '1', '2021-04-11 21:05:33');
INSERT INTO `t_permission_role_ref` VALUES ('182', '211', '1', '2021-04-13 18:46:52');
INSERT INTO `t_permission_role_ref` VALUES ('183', '212', '1', '2021-04-13 18:46:52');
INSERT INTO `t_permission_role_ref` VALUES ('184', '213', '1', '2021-04-14 19:45:39');
INSERT INTO `t_permission_role_ref` VALUES ('185', '214', '1', '2021-04-14 19:45:39');
INSERT INTO `t_permission_role_ref` VALUES ('186', '215', '1', '2021-04-14 19:45:40');
INSERT INTO `t_permission_role_ref` VALUES ('187', '216', '1', '2021-04-14 19:45:40');
INSERT INTO `t_permission_role_ref` VALUES ('188', '217', '1', '2021-04-14 19:45:41');
INSERT INTO `t_permission_role_ref` VALUES ('189', '218', '1', '2021-04-14 19:45:41');
INSERT INTO `t_permission_role_ref` VALUES ('190', '219', '1', '2021-04-14 19:45:42');
INSERT INTO `t_permission_role_ref` VALUES ('191', '220', '1', '2021-04-14 19:45:42');
INSERT INTO `t_permission_role_ref` VALUES ('192', '221', '1', '2021-04-16 21:22:41');
INSERT INTO `t_permission_role_ref` VALUES ('193', '222', '1', '2021-04-16 21:22:41');
INSERT INTO `t_permission_role_ref` VALUES ('194', '223', '1', '2021-04-16 21:22:42');
INSERT INTO `t_permission_role_ref` VALUES ('195', '225', '1', '2021-04-16 21:22:42');
INSERT INTO `t_permission_role_ref` VALUES ('196', '224', '1', '2021-04-16 21:22:43');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目描述',
  `domain` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目地址',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `dev_domain` varchar(30) DEFAULT NULL COMMENT '开发环境域名',
  `test_domain` varchar(30) DEFAULT NULL COMMENT '测试环境域名',
  `stg_domain` varchar(30) DEFAULT NULL COMMENT '预上线环境域名',
  `prod_domain` varchar(30) DEFAULT NULL COMMENT '正式环境域名',
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('24', 'Alex', '', 'https://localhost:7777', null, null, 'https://localhost:7777', 'https://localhost:7777', 'https://localhost:7777', 'https://localhost:7777');
INSERT INTO `t_project` VALUES ('25', 'MockTest', null, 'http://localhost:1080/', null, null, 'http://localhost:1080/', 'http://localhost:1080/', 'http://localhost:1080/', 'http://localhost:1080/');

-- ----------------------------
-- Table structure for t_rely_data
-- ----------------------------
DROP TABLE IF EXISTS `t_rely_data`;
CREATE TABLE `t_rely_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '依赖名称',
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '依赖值',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '依赖描述',
  `type` tinyint DEFAULT NULL COMMENT '依赖类型 0固定值 1反射方法 2sql-select 3sql-insert 4sql-update 5sql-delete 6sql-script',
  `datasource_id` int DEFAULT NULL COMMENT '数据源id',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `enable_return` tinyint DEFAULT NULL COMMENT '0是1否当type=3（新增）时，是否返回自增主键',
  `analysis_rely` tinyint DEFAULT NULL COMMENT '0是1否当type<2时，是否解析sql中的依赖',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rely_data
-- ----------------------------
INSERT INTO `t_rely_data` VALUES ('1', 'md5', 'md5(String s)', 'md5加密，引用方式示例：${md5(\"123456\")}', '1', null, '2020-09-02 11:37:06', '2020-09-02 11:36:58', null, null);
INSERT INTO `t_rely_data` VALUES ('2', 'uuid', 'uuid()', '获取uuid，引用方式示例：${uuid()}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:29:54', null, null);
INSERT INTO `t_rely_data` VALUES ('3', 'base64', 'base64(String s)', 'base64加密，引用方式示例：${base64(\"123456\")}', '1', null, '2020-09-02 11:37:06', '2020-09-02 11:36:58', null, null);
INSERT INTO `t_rely_data` VALUES ('4', 'timestamp', 'timestamp()', '获取当前时间戳ms，引用方式示例：${timestamp()}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);
INSERT INTO `t_rely_data` VALUES ('5', 'now', 'now(String format)', '获取当前时间，引用方式示例：${now(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:07', null, null);
INSERT INTO `t_rely_data` VALUES ('10', 'yesterday', 'yesterday(String format)', '获取当前时间对应的昨天，引用方式示例：${yesterday(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:11', null, null);
INSERT INTO `t_rely_data` VALUES ('11', 'lastMonth', 'lastMonth(String format)', '获取当前时间对应的上个月，引用方式示例：${lastMonth(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:15', null, null);
INSERT INTO `t_rely_data` VALUES ('12', 'nextMonth', 'nextMonth(String format)', '获取当前时间对应的下个月，引用方式示例：${nextMonth(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:18', null, null);
INSERT INTO `t_rely_data` VALUES ('13', 'lastYear', 'lastYear(String format)', '获取当前时间对应的去年，引用方式示例：${lastYear(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:23', null, null);
INSERT INTO `t_rely_data` VALUES ('14', 'nextYear', 'nextYear(String format)', '获取当前时间对应的明年，引用方式示例：${nextYear(\"yyyy-MM-dd HH:mm:ss\")}，重载方法参数可为空，默认yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-10-21 16:18:28', null, null);
INSERT INTO `t_rely_data` VALUES ('15', 'time', 'time(String operator, String amount, String format)', '获取相较于当前时间的指定时间，operator：y、M、d、h、m、s；分别对应：年、月、日、时、分、秒，amount：数额，format：格式，如yyyy-MM-dd HH:mm:ss', '1', null, '2020-09-02 11:37:06', '2020-09-02 11:36:58', null, null);
INSERT INTO `t_rely_data` VALUES ('16', 'randomInt', 'randomInt(String length)', '获取指定长度的随机整数，引用方式示例：${randomInt(\"10\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:34:17', null, null);
INSERT INTO `t_rely_data` VALUES ('17', 'randomUpper', 'randomUpper(String length)', '获取指定长度的随机大写英文，引用方式示例：${randomUpper(\"10\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:34:27', null, null);
INSERT INTO `t_rely_data` VALUES ('18', 'randomLower', 'randomLower(String length)', '获取指定长度的随机小写英文，引用方式示例：${randomLower(\"10\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:34:32', null, null);
INSERT INTO `t_rely_data` VALUES ('19', 'randomEn', 'randomEn(String length)', '获取指定长度的随机英文，引用方式示例：${randomEn(\"10\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:34:44', null, null);
INSERT INTO `t_rely_data` VALUES ('20', 'randomIllegal', 'randomIllegal(String length)', '获取指定长度的非法字符，引用方式示例：${randomIllegal(\"10\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:34:56', null, null);
INSERT INTO `t_rely_data` VALUES ('21', 'cs', '长沙', '长沙市，引用方式示例：${cs}', '0', null, '2020-09-02 11:37:06', '2020-10-02 09:35:17', null, null);
INSERT INTO `t_rely_data` VALUES ('29', 'city', 'city()', '随机城市，引用方式示例：${city()}', '1', null, '2020-10-21 15:26:23', '2020-10-21 15:26:32', null, null);
INSERT INTO `t_rely_data` VALUES ('30', 'province', 'province()', '随机省份，引用方式示例：${province()}', '1', null, '2020-10-21 16:16:16', null, null, null);
INSERT INTO `t_rely_data` VALUES ('31', 'country', 'country()', '随机国家，引用方式示例：${country()}', '1', null, '2020-10-21 16:16:20', null, null, null);
INSERT INTO `t_rely_data` VALUES ('32', 'phone', 'phone()', '随机手机号码，引用方式示例：${phone()}', '1', null, '2020-10-21 16:16:26', null, null, null);
INSERT INTO `t_rely_data` VALUES ('33', 'email', 'email()', '随机邮箱，引用方式示例：${email()}', '1', null, '2020-10-21 16:16:28', null, null, null);
INSERT INTO `t_rely_data` VALUES ('34', 'mac', 'mac()', '随机mac地址，引用方式示例：${mac()}', '1', null, '2020-10-21 16:16:30', null, null, null);
INSERT INTO `t_rely_data` VALUES ('35', 'book', 'book()', '随机书名，引用方式示例：${book()}', '1', null, '2020-10-21 16:16:35', null, null, null);
INSERT INTO `t_rely_data` VALUES ('36', 'name', 'name()', '随机中文名称，引用方式示例：${name()}', '1', null, '2020-10-21 16:16:37', null, null, null);
INSERT INTO `t_rely_data` VALUES ('37', 'ipv4', 'ipv4()', '随机ipv4地址，引用方式示例：${ipv4()}', '1', null, '2020-10-21 16:16:40', null, null, null);
INSERT INTO `t_rely_data` VALUES ('38', 'privateIpv4', 'privateIpv4()', '随机私有ipv4地址，引用方式示例：${privateIpv4()}', '1', null, '2020-10-21 16:16:42', null, null, null);
INSERT INTO `t_rely_data` VALUES ('39', 'publicIpv4', 'publicIpv4()', '随机公有ipv4地址，引用方式示例：${publicIpv4()}', '1', null, '2020-10-21 16:16:44', null, null, null);
INSERT INTO `t_rely_data` VALUES ('40', 'ipv6', 'ipv6()', '随机ipv6地址，引用方式示例：${ipv6()}', '1', null, '2020-10-21 16:16:47', null, null, null);
INSERT INTO `t_rely_data` VALUES ('41', 'InterfaceCaseTable', 'select * from t_interface_case where case_id = ?', '查询根据用例编号查询t_interface_case', '2', '1', '2021-03-08 15:32:57', '2021-03-31 11:43:19', null, '1');
INSERT INTO `t_rely_data` VALUES ('44', 'InsertUser', 'INSERT INTO `platform`.`t_user` (`username`, `password`, `job_number`, `sex`, `is_enable`, `created_time`, `update_time`, `real_name`, `role_id`) VALUES (\'${timestamp()}\', \'18e29620f058e8bf085bfed74fdf5e82\', \'\', \'1\', \'1\', NULL, \'2021-03-10 16:08:51\', \'123\', \'1\');', '新增用户', '3', '1', '2021-03-30 13:44:05', '2021-04-02 10:23:07', '0', '0');
INSERT INTO `t_rely_data` VALUES ('45', 'timestamps', 'timestamps()', '获取当前时间戳s，引用方式示例：${timestamps()}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);
INSERT INTO `t_rely_data` VALUES ('46', 'pick', 'pick(String... args)', '参数列表任选值，引用方式示例：${pick(\"1\", \"2\", \"3\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);
INSERT INTO `t_rely_data` VALUES ('47', 'inversePick', 'inversePick(String... args)', '参数列表返选值，引用方式示例：${inversePick(\"1\", \"2\", \"3\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);
INSERT INTO `t_rely_data` VALUES ('48', 'select', 'select(String dbId, String sql, String returnType)', '随机任选查询结果(仅支持单列)，returnType可选值有[integer, float, double, number, string],引用方式示例：${pick(\"1\", \"select username from t_user where id > 3\", \"integer\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);
INSERT INTO `t_rely_data` VALUES ('49', 'inverseSelect', 'inverseSelect(String dbId, String sql, String returnType)', '随机反选查询结果(仅支持单列)，returnType可选值有[integer, float, double, number, string],引用方式示例：${pick(\"1\", \"select username from t_user where id > 3\", \"integer\")}', '1', null, '2020-09-02 11:37:06', '2020-10-02 09:30:56', null, null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '0');
INSERT INTO `t_role` VALUES ('4', '游客', '0');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `cron` varchar(30) DEFAULT NULL COMMENT '定时任务表达式',
  `next_time` datetime DEFAULT NULL COMMENT '下次执行时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '创建时间',
  `suite_type` tinyint DEFAULT NULL COMMENT '0接口1UI',
  `suite_id` int DEFAULT NULL COMMENT '测试套件编号',
  `status` tinyint DEFAULT NULL COMMENT '状态0启用1禁用',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('119', '定时任务', '*/5 * * * * ?', '2021-04-13 18:01:15', '2021-03-09 10:34:23', '2021-04-13 18:01:19', '0', '35', '1');

-- ----------------------------
-- Table structure for t_task_email_ref
-- ----------------------------
DROP TABLE IF EXISTS `t_task_email_ref`;
CREATE TABLE `t_task_email_ref` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '定时任务id',
  `task_id` int DEFAULT NULL,
  `email_address` varchar(30) DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task_email_ref
-- ----------------------------
INSERT INTO `t_task_email_ref` VALUES ('67', '119', '1014759718@qq.com');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `job_number` varchar(10) DEFAULT NULL COMMENT '工号',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别,0女 1男',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0禁用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `role_id` int DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123', '18e29620f058e8bf085bfed74fdf5e82', '', '1', '1', null, '2021-03-10 16:08:51', '123', '1');
INSERT INTO `t_user` VALUES ('555', 'youke', '123', '1', '1', '1', '2021-03-12 20:42:04', '2021-03-12 20:42:04', 'youke', '4');
