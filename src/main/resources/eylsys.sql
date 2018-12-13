/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MariaDB
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : eylsys

 Target Server Type    : MariaDB
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 13/12/2018 00:06:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check_info
-- ----------------------------
DROP TABLE IF EXISTS `check_info`;
CREATE TABLE `check_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stay_id` int(11) NULL DEFAULT NULL,
  `due_money` float NULL DEFAULT NULL,
  `order_money` float NULL DEFAULT NULL,
  `discount_rate` float NULL DEFAULT NULL,
  `discount_price` float NULL DEFAULT NULL,
  `paid_up_money` float NULL DEFAULT NULL,
  `check_date` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `oprator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `modifiedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `check_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `stay_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oprator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `modifiedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NULL DEFAULT NULL,
  `customer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkin_date` datetime(0) NULL DEFAULT NULL,
  `order_date` datetime(0) NULL DEFAULT NULL,
  `stay_day` int(11) NULL DEFAULT NULL,
  `order_money` float NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `modifiedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for room_info
-- ----------------------------
DROP TABLE IF EXISTS `room_info`;
CREATE TABLE `room_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rt_id` int(11) NULL DEFAULT NULL,
  `room_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room_add` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bed_num` int(11) NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `statu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `room_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for room_state
-- ----------------------------
DROP TABLE IF EXISTS `room_state`;
CREATE TABLE `room_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `modifiedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for room_type
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rt_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rt_price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stay_info
-- ----------------------------
DROP TABLE IF EXISTS `stay_info`;
CREATE TABLE `stay_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  `stay_date` datetime(0) NULL DEFAULT NULL,
  `stay_day_count` int(11) NULL DEFAULT NULL,
  `stay_man_count` int(11) NULL DEFAULT NULL,
  `cash` float NULL DEFAULT NULL,
  `leave_date` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `modifiedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `stay_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stay_info_ibfk_2` FOREIGN KEY (`id`) REFERENCES `customer_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_configs
-- ----------------------------
DROP TABLE IF EXISTS `sys_configs`;
CREATE TABLE `sys_configs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_configs
-- ----------------------------
INSERT INTO `sys_configs` VALUES (4, 'uploadPath', '/upload/images', '上传路径', '2018-04-22 17:39:55', '2018-04-22 17:39:55', NULL, NULL);
INSERT INTO `sys_configs` VALUES (5, 'downloadPath', '/downloads/', '文件下载路径', '2018-04-22 17:40:41', '2018-04-22 17:40:41', NULL, NULL);
INSERT INTO `sys_configs` VALUES (6, '555', '100', 'aaa', '2018-05-28 12:40:27', '2018-05-28 12:40:27', NULL, NULL);
INSERT INTO `sys_configs` VALUES (7, 'p1', 'v1', 'wqe', '2018-06-05 08:44:17', '2018-06-05 08:44:17', NULL, NULL);
INSERT INTO `sys_configs` VALUES (8, 'p2', 'v2', 'ppp', '2018-06-05 13:07:52', '2018-06-05 13:07:52', NULL, NULL);
INSERT INTO `sys_configs` VALUES (9, 'aaaaaaaa1', 'aa', 'aa', '2018-06-05 19:01:56', '2018-06-05 19:01:56', NULL, NULL);
INSERT INTO `sys_configs` VALUES (10, 'd', 'spring-boot-02-quickstart', 'sd', '2018-06-05 19:02:50', '2018-06-05 19:02:50', NULL, NULL);
INSERT INTO `sys_configs` VALUES (11, 'ddd', 'sdfasdf', 'sadf', '2018-06-05 19:40:03', '2018-06-05 19:40:03', NULL, NULL);
INSERT INTO `sys_configs` VALUES (12, '数据库端口', '3306', '数据库监听端口', '2018-06-05 19:43:37', '2018-10-29 12:09:36', NULL, NULL);
INSERT INTO `sys_configs` VALUES (13, '端口', '8080', '服务器端口', '2018-06-05 22:36:47', '2018-10-29 12:09:06', NULL, NULL);

-- ----------------------------
-- Table structure for sys_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_depts`;
CREATE TABLE `sys_depts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '上级部门',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_depts
-- ----------------------------
INSERT INTO `sys_depts` VALUES (2, '产品部', NULL, 1, '负责产品设计及研发', '2018-04-19 18:59:09', '2018-10-29 12:21:55', 'admin', NULL);
INSERT INTO `sys_depts` VALUES (3, '计调部', NULL, 2, '负责计划安排', '2018-04-19 19:15:05', '2018-10-29 12:22:52', NULL, NULL);
INSERT INTO `sys_depts` VALUES (5, 'dept-a-001', 2, 1, '111111', '2018-07-08 23:42:01', '2018-07-08 23:45:32', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dicts
-- ----------------------------
DROP TABLE IF EXISTS `sys_dicts`;
CREATE TABLE `sys_dicts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典码',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `valid` tinyint(4) NULL DEFAULT 1 COMMENT '有效',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES (9, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '2018-04-17 19:53:38');
INSERT INTO `sys_logs` VALUES (10, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '2018-04-17 19:54:05');
INSERT INTO `sys_logs` VALUES (11, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '2018-04-17 19:54:36');
INSERT INTO `sys_logs` VALUES (12, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 155, '0:0:0:0:0:0:0:1', '2018-04-18 15:14:44');
INSERT INTO `sys_logs` VALUES (13, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 165, '0:0:0:0:0:0:0:1', '2018-04-19 18:52:35');
INSERT INTO `sys_logs` VALUES (14, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 75, '0:0:0:0:0:0:0:1', '2018-04-19 19:10:36');
INSERT INTO `sys_logs` VALUES (15, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 69, '0:0:0:0:0:0:0:1', '2018-04-19 19:12:46');
INSERT INTO `sys_logs` VALUES (16, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 187, '0:0:0:0:0:0:0:1', '2018-04-19 23:27:14');
INSERT INTO `sys_logs` VALUES (17, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 103, '0:0:0:0:0:0:0:1', '2018-04-20 13:11:37');
INSERT INTO `sys_logs` VALUES (18, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 85, '0:0:0:0:0:0:0:1', '2018-04-20 13:55:04');
INSERT INTO `sys_logs` VALUES (19, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 89, '0:0:0:0:0:0:0:1', '2018-04-20 13:57:12');
INSERT INTO `sys_logs` VALUES (20, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 69, '0:0:0:0:0:0:0:1', '2018-04-20 13:58:32');
INSERT INTO `sys_logs` VALUES (21, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 291, '0:0:0:0:0:0:0:1', '2018-04-20 15:22:55');
INSERT INTO `sys_logs` VALUES (22, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 158, '0:0:0:0:0:0:0:1', '2018-04-22 16:20:56');
INSERT INTO `sys_logs` VALUES (23, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 94, '0:0:0:0:0:0:0:1', '2018-04-22 17:05:34');
INSERT INTO `sys_logs` VALUES (24, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 138, '0:0:0:0:0:0:0:1', '2018-04-22 17:20:32');
INSERT INTO `sys_logs` VALUES (25, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 124, '0:0:0:0:0:0:0:1', '2018-04-22 17:24:12');
INSERT INTO `sys_logs` VALUES (26, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 75, '0:0:0:0:0:0:0:1', '2018-04-22 17:31:51');
INSERT INTO `sys_logs` VALUES (27, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 148, '0:0:0:0:0:0:0:1', '2018-04-22 17:33:25');
INSERT INTO `sys_logs` VALUES (28, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 69, '0:0:0:0:0:0:0:1', '2018-04-22 17:39:26');
INSERT INTO `sys_logs` VALUES (29, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 120, '0:0:0:0:0:0:0:1', '2018-04-22 19:10:28');
INSERT INTO `sys_logs` VALUES (30, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 104, '0:0:0:0:0:0:0:1', '2018-04-22 19:23:56');
INSERT INTO `sys_logs` VALUES (31, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 79, '0:0:0:0:0:0:0:1', '2018-04-22 19:42:40');
INSERT INTO `sys_logs` VALUES (32, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 71, '0:0:0:0:0:0:0:1', '2018-04-22 19:58:49');
INSERT INTO `sys_logs` VALUES (33, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 201, '0:0:0:0:0:0:0:1', '2018-04-22 20:02:01');
INSERT INTO `sys_logs` VALUES (34, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 119, '0:0:0:0:0:0:0:1', '2018-04-22 20:26:31');
INSERT INTO `sys_logs` VALUES (35, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 131, '0:0:0:0:0:0:0:1', '2018-04-22 20:58:21');
INSERT INTO `sys_logs` VALUES (36, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 9, '192.168.43.1', '2018-04-22 21:32:25');
INSERT INTO `sys_logs` VALUES (37, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 6, '192.168.43.183', '2018-04-22 21:34:40');
INSERT INTO `sys_logs` VALUES (38, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 4, '192.168.43.211', '2018-04-22 22:10:04');
INSERT INTO `sys_logs` VALUES (39, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 71, '0:0:0:0:0:0:0:1', '2018-04-23 08:47:21');
INSERT INTO `sys_logs` VALUES (40, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '2018-04-23 18:22:51');
INSERT INTO `sys_logs` VALUES (41, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 133, '0:0:0:0:0:0:0:1', '2018-04-28 17:51:31');
INSERT INTO `sys_logs` VALUES (42, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 185, '0:0:0:0:0:0:0:1', '2018-05-15 23:22:01');
INSERT INTO `sys_logs` VALUES (43, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 114, '0:0:0:0:0:0:0:1', '2018-05-16 09:55:16');
INSERT INTO `sys_logs` VALUES (44, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 184, '0:0:0:0:0:0:0:1', '2018-05-20 08:05:15');
INSERT INTO `sys_logs` VALUES (45, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 254, '172.20.10.1', '2018-05-27 10:22:56');
INSERT INTO `sys_logs` VALUES (46, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin \"', 8, '172.20.10.9', '2018-05-27 10:22:58');
INSERT INTO `sys_logs` VALUES (47, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 9, '172.20.10.11', '2018-05-27 10:23:18');
INSERT INTO `sys_logs` VALUES (48, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 5, '172.20.10.14', '2018-05-27 10:23:25');
INSERT INTO `sys_logs` VALUES (49, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin \"', 5, '172.20.10.9', '2018-05-27 10:23:36');
INSERT INTO `sys_logs` VALUES (50, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 102858, '192.168.152.1', '2018-05-27 11:42:19');
INSERT INTO `sys_logs` VALUES (51, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 5496830, '192.168.152.1', '2018-05-27 13:14:26');
INSERT INTO `sys_logs` VALUES (52, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 100, '0:0:0:0:0:0:0:1', '2018-05-28 12:40:09');
INSERT INTO `sys_logs` VALUES (53, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 187, '0:0:0:0:0:0:0:1', '2018-05-31 19:43:43');
INSERT INTO `sys_logs` VALUES (54, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 454942, '0:0:0:0:0:0:0:1', '2018-05-31 19:53:32');
INSERT INTO `sys_logs` VALUES (55, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 220, '0:0:0:0:0:0:0:1', '2018-06-04 13:01:37');
INSERT INTO `sys_logs` VALUES (56, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 4208, '0:0:0:0:0:0:0:1', '2018-06-04 13:43:18');
INSERT INTO `sys_logs` VALUES (57, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 139, '0:0:0:0:0:0:0:1', '2018-06-04 13:54:55');
INSERT INTO `sys_logs` VALUES (58, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 200, '0:0:0:0:0:0:0:1', '2018-06-05 08:42:41');
INSERT INTO `sys_logs` VALUES (59, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 182, '0:0:0:0:0:0:0:1', '2018-06-05 13:10:56');
INSERT INTO `sys_logs` VALUES (60, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 139, '0:0:0:0:0:0:0:1', '2018-06-05 13:16:21');
INSERT INTO `sys_logs` VALUES (61, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '2018-06-05 13:17:07');
INSERT INTO `sys_logs` VALUES (62, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 186, '0:0:0:0:0:0:0:1', '2018-06-05 13:19:22');
INSERT INTO `sys_logs` VALUES (63, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 139, '0:0:0:0:0:0:0:1', '2018-06-05 13:33:09');
INSERT INTO `sys_logs` VALUES (64, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 146, '0:0:0:0:0:0:0:1', '2018-06-05 18:47:17');
INSERT INTO `sys_logs` VALUES (65, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 79, '0:0:0:0:0:0:0:1', '2018-06-05 18:59:03');
INSERT INTO `sys_logs` VALUES (66, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 65, '0:0:0:0:0:0:0:1', '2018-06-05 19:24:08');
INSERT INTO `sys_logs` VALUES (67, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 70, '0:0:0:0:0:0:0:1', '2018-06-05 19:24:56');
INSERT INTO `sys_logs` VALUES (68, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 87, '0:0:0:0:0:0:0:1', '2018-06-05 19:39:55');
INSERT INTO `sys_logs` VALUES (69, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 71, '0:0:0:0:0:0:0:1', '2018-06-05 19:43:30');
INSERT INTO `sys_logs` VALUES (70, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 71, '0:0:0:0:0:0:0:1', '2018-06-05 19:51:27');
INSERT INTO `sys_logs` VALUES (71, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 196, '0:0:0:0:0:0:0:1', '2018-06-05 22:29:07');
INSERT INTO `sys_logs` VALUES (72, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 161, '0:0:0:0:0:0:0:1', '2018-06-05 22:32:27');
INSERT INTO `sys_logs` VALUES (73, 'admin', '登陆操作', 'com.jt.sys.service.impl.SysUserServiceImpl.login()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '2018-06-05 22:36:33');
INSERT INTO `sys_logs` VALUES (74, 'admin', '分页查询配置信息', 'com.jt.sys.service.impl.SysConfigServiceImpl.findPageObjects', '[null,1]', 33, '0:0:0:0:0:0:0:1', '2018-07-11 19:00:43');
INSERT INTO `sys_logs` VALUES (75, 'admin', '分页查询配置信息', 'com.jt.sys.service.impl.SysConfigServiceImpl.findPageObjects', '[null,1]', 10, '0:0:0:0:0:0:0:1', '2018-07-11 19:00:52');
INSERT INTO `sys_logs` VALUES (76, 'admin', '分页查询配置信息', 'com.jt.sys.service.impl.SysConfigServiceImpl.findPageObjects', '[null,1]', 183, '0:0:0:0:0:0:0:1', '2018-08-15 18:38:22');
INSERT INTO `sys_logs` VALUES (77, 'admin', NULL, 'com.jt.sys.service.impl.SysRoleServiceImpl.findPageObjects', '[null, 1]', 147, '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `sys_logs` VALUES (78, 'admin', NULL, 'com.jt.sys.service.impl.SysRoleServiceImpl.findPageObjects', '[null, 1]', 5, '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `sys_logs` VALUES (79, 'admin', NULL, 'com.jt.sys.service.impl.SysRoleServiceImpl.findPageObjects', '[null, 1]', 7, '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `sys_logs` VALUES (80, 'admin', NULL, 'com.jt.sys.service.impl.SysRoleServiceImpl.findPageObjects', '[null, 1]', 6, '0:0:0:0:0:0:0:1', NULL);

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型     1：菜单   2：按钮',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `permission` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(如：user:create)',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (8, '系统管理', '请求路径', 1, 8, NULL, NULL, 'sys:list', '2017-07-12 15:15:59', '2017-07-21 11:16:00', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES (24, '配置管理', 'config/doFindPageObjects.do', 1, 24, NULL, 8, 'sys:config:view', '2017-07-12 15:15:59', '2018-10-29 12:15:19', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (25, '日志管理', 'log/doFindPageObject.do', 1, 25, NULL, 8, 'sys:log:view', '2017-07-12 15:15:59', '2018-10-29 12:15:48', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (45, '用户管理', 'user/doUserListUI.do', 1, 45, NULL, 8, 'sys:user:view', '2017-07-12 15:15:59', '2018-10-29 12:16:41', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (46, '菜单管理', 'menu/doMenuListUI.do', 1, 46, NULL, 8, 'sys:menu:view', '2017-07-12 15:15:59', '2018-10-29 12:17:01', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (47, '角色管理', 'role/doRoleListUI.do', 1, 47, NULL, 8, 'sys:role:view', '2017-07-12 15:15:59', '2018-10-29 12:17:46', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (48, '组织管理', 'dept/doFindPageObjects.do', 1, 48, NULL, 8, 'sys:org:view', '2017-07-12 15:15:59', '2018-10-29 12:16:20', 'admin', NULL);
INSERT INTO `sys_menus` VALUES (115, '查看', '', 2, 1, NULL, 46, 'sys:menu:view', '2017-07-13 16:33:41', '2017-07-21 11:09:05', NULL, NULL);
INSERT INTO `sys_menus` VALUES (116, '新增', '', 2, 2, NULL, 46, 'sys:menu:add', '2017-07-13 16:34:02', '2017-07-21 11:09:22', NULL, NULL);
INSERT INTO `sys_menus` VALUES (117, '修改', '', 2, 3, NULL, 46, 'sys:menu:update', '2017-07-13 16:34:25', '2017-07-21 11:09:45', NULL, NULL);
INSERT INTO `sys_menus` VALUES (118, '删除', '', 2, 4, NULL, 46, 'sys:menu:delete', '2017-07-13 16:34:46', '2017-07-21 11:10:12', NULL, NULL);
INSERT INTO `sys_menus` VALUES (119, '查看', '', 2, 1, NULL, 45, 'sys:user:view', '2017-07-13 16:35:05', '2017-07-21 11:12:46', NULL, NULL);
INSERT INTO `sys_menus` VALUES (120, '查看', '', 2, 1, NULL, 47, 'sys:role:view', '2017-07-13 16:35:26', '2017-07-21 11:13:43', NULL, NULL);
INSERT INTO `sys_menus` VALUES (126, '新增', '', 2, 2, NULL, 45, 'sys:user:add', '2017-07-21 11:11:34', '2017-07-21 11:11:34', NULL, NULL);
INSERT INTO `sys_menus` VALUES (127, '修改', '', 2, 3, NULL, 45, 'sys:user:update', '2017-07-21 11:11:56', '2017-07-21 11:11:56', NULL, NULL);
INSERT INTO `sys_menus` VALUES (128, '新增', '', 2, 2, NULL, 47, 'sys:role:add', '2017-07-21 11:14:24', '2017-07-21 11:14:24', NULL, NULL);
INSERT INTO `sys_menus` VALUES (129, '修改', '', 2, 3, NULL, 47, 'sys:role:update', '2017-07-21 11:14:48', '2017-07-21 11:14:48', NULL, NULL);
INSERT INTO `sys_menus` VALUES (130, '删除', '', 2, 4, NULL, 47, 'sys:role:delete', '2017-07-21 11:15:09', '2017-07-21 11:15:09', NULL, NULL);
INSERT INTO `sys_menus` VALUES (131, '禁用启用', 'user/doValidById.do', 1, 111111, NULL, 45, 'sys:user:valid', '2018-07-18 19:24:48', '2018-07-18 19:24:48', NULL, NULL);
INSERT INTO `sys_menus` VALUES (132, '日志删除', 'log/doDeleteObject.do', 2, 10, NULL, 25, 'sys:log:delete', '2018-10-29 12:18:42', '2018-10-29 12:18:42', NULL, NULL);
INSERT INTO `sys_menus` VALUES (133, '添加配置', 'config/doSaveObject.do', 1, 2, NULL, 24, 'sys:config:save', '2018-10-29 12:20:07', '2018-10-29 12:20:07', NULL, NULL);
INSERT INTO `sys_menus` VALUES (134, '添加配置', 'config/doSaveObject.do', 1, 2, NULL, 24, 'sys:config:save', '2018-10-29 12:20:08', '2018-10-29 12:20:08', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1391 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
INSERT INTO `sys_role_menus` VALUES (1232, 1, 8);
INSERT INTO `sys_role_menus` VALUES (1233, 1, 24);
INSERT INTO `sys_role_menus` VALUES (1234, 1, 25);
INSERT INTO `sys_role_menus` VALUES (1235, 1, 45);
INSERT INTO `sys_role_menus` VALUES (1236, 1, 119);
INSERT INTO `sys_role_menus` VALUES (1237, 1, 126);
INSERT INTO `sys_role_menus` VALUES (1238, 1, 127);
INSERT INTO `sys_role_menus` VALUES (1239, 1, 46);
INSERT INTO `sys_role_menus` VALUES (1240, 1, 115);
INSERT INTO `sys_role_menus` VALUES (1241, 1, 116);
INSERT INTO `sys_role_menus` VALUES (1242, 1, 117);
INSERT INTO `sys_role_menus` VALUES (1243, 1, 118);
INSERT INTO `sys_role_menus` VALUES (1244, 1, 47);
INSERT INTO `sys_role_menus` VALUES (1245, 1, 120);
INSERT INTO `sys_role_menus` VALUES (1246, 1, 128);
INSERT INTO `sys_role_menus` VALUES (1247, 1, 129);
INSERT INTO `sys_role_menus` VALUES (1248, 1, 130);
INSERT INTO `sys_role_menus` VALUES (1249, 1, 48);
INSERT INTO `sys_role_menus` VALUES (1352, 47, 8);
INSERT INTO `sys_role_menus` VALUES (1353, 47, 24);
INSERT INTO `sys_role_menus` VALUES (1354, 47, 133);
INSERT INTO `sys_role_menus` VALUES (1355, 47, 134);
INSERT INTO `sys_role_menus` VALUES (1356, 47, 25);
INSERT INTO `sys_role_menus` VALUES (1357, 47, 132);
INSERT INTO `sys_role_menus` VALUES (1358, 47, 45);
INSERT INTO `sys_role_menus` VALUES (1359, 47, 119);
INSERT INTO `sys_role_menus` VALUES (1360, 47, 126);
INSERT INTO `sys_role_menus` VALUES (1361, 47, 127);
INSERT INTO `sys_role_menus` VALUES (1362, 47, 131);
INSERT INTO `sys_role_menus` VALUES (1363, 47, 46);
INSERT INTO `sys_role_menus` VALUES (1364, 47, 115);
INSERT INTO `sys_role_menus` VALUES (1365, 47, 116);
INSERT INTO `sys_role_menus` VALUES (1366, 47, 117);
INSERT INTO `sys_role_menus` VALUES (1367, 47, 118);
INSERT INTO `sys_role_menus` VALUES (1368, 47, 47);
INSERT INTO `sys_role_menus` VALUES (1369, 47, 120);
INSERT INTO `sys_role_menus` VALUES (1370, 47, 128);
INSERT INTO `sys_role_menus` VALUES (1371, 47, 129);
INSERT INTO `sys_role_menus` VALUES (1372, 47, 130);
INSERT INTO `sys_role_menus` VALUES (1373, 47, 48);
INSERT INTO `sys_role_menus` VALUES (1374, 46, 8);
INSERT INTO `sys_role_menus` VALUES (1375, 46, 24);
INSERT INTO `sys_role_menus` VALUES (1376, 46, 45);
INSERT INTO `sys_role_menus` VALUES (1377, 46, 119);
INSERT INTO `sys_role_menus` VALUES (1378, 46, 126);
INSERT INTO `sys_role_menus` VALUES (1379, 46, 127);
INSERT INTO `sys_role_menus` VALUES (1380, 46, 46);
INSERT INTO `sys_role_menus` VALUES (1381, 46, 115);
INSERT INTO `sys_role_menus` VALUES (1382, 46, 116);
INSERT INTO `sys_role_menus` VALUES (1383, 46, 117);
INSERT INTO `sys_role_menus` VALUES (1384, 46, 118);
INSERT INTO `sys_role_menus` VALUES (1385, 46, 47);
INSERT INTO `sys_role_menus` VALUES (1386, 46, 120);
INSERT INTO `sys_role_menus` VALUES (1387, 46, 128);
INSERT INTO `sys_role_menus` VALUES (1388, 46, 129);
INSERT INTO `sys_role_menus` VALUES (1389, 46, 130);
INSERT INTO `sys_role_menus` VALUES (1390, 46, 48);

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (46, '软件工程师', '负责软件设计与研发', '2018-07-06 19:25:36', '2018-11-13 08:25:29', NULL, NULL);
INSERT INTO `sys_roles` VALUES (47, '系统管理员', '系统管理员。。。。。。。。', '2018-07-18 19:23:11', '2018-11-13 08:24:25', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES (1, 19, 46);
INSERT INTO `sys_user_roles` VALUES (2, 1, 47);
INSERT INTO `sys_user_roles` VALUES (3, 3, 46);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐  密码加密时前缀，使加密后的值不同',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `valid` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常  默认值 ：1',
  `deptId` int(11) NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, 'admin', '4ebd394fbd25e495e0753a7dc9889a8e', '7adb778c-e7d3-4dd3-a3c5-5f80a158006d', 'admin@t.cn', '13624356789', 1, 3, NULL, '2018-07-18 19:23:31', NULL, 'admin');
INSERT INTO `sys_users` VALUES (2, 'zhangli', 'bdcf69375bdb532e50279b91eb00940d', '5e7cbd36-e897-4951-b42b-19809caf3caa', 'zhangli@t.cn', '13678909876', 0, 3, '2017-07-18 10:01:51', '2018-04-22 20:49:19', NULL, 'admin');
INSERT INTO `sys_users` VALUES (3, 'wangke', 'c5dc32ec66041aeddf432b3146bd2257', '5e3e1475-1ea9-4a6a-976e-b07545827139', 'wangke@t.cn', '18678900987', 1, 3, '2017-07-18 11:40:53', '2018-11-13 08:24:45', NULL, NULL);
INSERT INTO `sys_users` VALUES (4, 'zhangql', '+HBpqtPuj9KLBIpneR5X0A==', 'ed487fac-9952-45c9-acaa-21dab9c689cc', 'zhangql@t.cn', '13678909876', 1, 2, '2017-07-18 12:17:30', '2018-07-18 19:27:14', NULL, 'admin');
INSERT INTO `sys_users` VALUES (5, 'fanwei', '1acab7425d6dfae670f26bd160518902', '34fbedb2-e135-4f8d-b595-24360edc348d', 'fanwei@t.cn', '13876545678', 0, 3, '2017-07-20 17:03:22', '2018-07-18 19:27:07', NULL, 'admin');
INSERT INTO `sys_users` VALUES (6, 'wumei', '431ebdcccf3404787a144f9ba669a8e2', '8a14f46f-7a17-4dfe-85ab-08e63cb618ce', 'wumei@t.cn', '13567898765', 1, 2, '2017-07-21 10:57:40', '2018-04-22 20:46:49', NULL, NULL);
INSERT INTO `sys_users` VALUES (7, 'user-003', '689c673a0d8bda7ee795dd45a126ae96', '3faa1d2b-a99f-4ffb-9d29-0e71563258af', 't@t.com', '123', 1, 3, '2018-01-12 23:19:58', '2018-04-22 20:46:07', NULL, 'admin');
INSERT INTO `sys_users` VALUES (9, 'user-002', 'e10adc3949ba59abbe56e057f20f883e', NULL, 't@t.com', '123', 1, 3, '2018-01-12 23:20:31', '2018-04-22 20:45:55', NULL, NULL);
INSERT INTO `sys_users` VALUES (12, 'user-001', '5bf6593afd106aa544000d559f0c2241', '9528e727-2901-4746-8558-9010d9607da2', 't@t.com', '123', 1, 3, '2018-01-13 01:48:32', '2018-04-22 20:45:37', NULL, NULL);
INSERT INTO `sys_users` VALUES (13, 'user-c', '2630d8bd50c76abf001a9daceeae97e6', '30fff766-e245-4a93-9f5e-6eb2c2cec494', 't@t.com', '123456', 0, 3, '2018-01-13 02:01:56', '2018-04-22 20:43:58', NULL, 'admin');
INSERT INTO `sys_users` VALUES (15, 'user-b', '2ce586af95c6431112092f653659c85f', 'eaedbaee-d760-40e4-b71e-ccecf01b6187', 't@t.com', '123456', 1, 3, '2018-01-13 02:02:06', '2018-04-22 20:54:10', NULL, 'admin');
INSERT INTO `sys_users` VALUES (16, 'user-a', '710058cf374a38d76510d009f63bf28d', 'e8e35b96-bbdd-4090-81ee-b71a36141760', '1@t.com', '121212', NULL, 2, '2018-04-22 19:43:11', '2018-04-22 20:54:02', NULL, NULL);
INSERT INTO `sys_users` VALUES (17, 'aaaaaaa', '573a6f32087ea8346c39d3b7c0166a41', 'f60ba9da-76ba-44ef-8a25-8d3a2ad2b53b', '11', '11111111', 1, 3, '2018-07-09 00:44:03', '2018-07-09 00:44:03', NULL, NULL);
INSERT INTO `sys_users` VALUES (18, 'aa', '06af7a09abd673ca920fb25aaf45760d', '3f327de1-4285-4e67-9675-b942d5850fda', 'aaa', '111111', 0, 2, '2018-07-09 00:45:16', '2018-10-26 08:44:16', NULL, 'admin');
INSERT INTO `sys_users` VALUES (19, 'qq', 'be17afaeeb2da6337b7ebdf984ee2e26', 'e4479018-7b70-4c1c-a4cb-9d9ec2b046b5', 'asaf', '1111111111', 1, 2, '2018-07-09 00:52:06', '2018-07-09 00:52:06', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
