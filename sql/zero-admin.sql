/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : zero-admin

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 03/01/2021 17:15:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dev_table_column
-- ----------------------------
DROP TABLE IF EXISTS `dev_table_column`;
CREATE TABLE `dev_table_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `java_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Java属性名称',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段注释',
  `database_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库表字段类型',
  `jdbc_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型对应的jdbc类型',
  `java_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型对应的Java类型',
  `sort` int(11) NOT NULL COMMENT '字段排序顺序，数据库默认升序排序',
  `table_info_id` int(11) NOT NULL COMMENT '表信息主键，关联dev_table_info表的主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表字段信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dev_table_column
-- ----------------------------
INSERT INTO `dev_table_column` VALUES (1, 'id', 'id', '用户主键', 'int(11)', 'INTEGER', 'Integer', 1, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (2, 'username', 'username', '用户名称', 'varchar(50)', 'VARCHAR', 'String', 2, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (3, 'password', 'password', '用户密码', 'varchar(255)', 'VARCHAR', 'String', 3, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (4, 'enabled', 'enabled', '账号是否启用，1为启用，0为禁用，默认为1', 'tinyint(1)', 'BOOLEAN', 'Boolean', 4, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (5, 'locked', 'locked', '账号是否锁定，1为锁定，0为未锁定，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 5, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (6, 'account_expire', 'accountExpire', '账号是否过期，1为过期，0为未过期，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 6, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (7, 'password_expire', 'passwordExpire', '密码是否过期，1为过期，0为未过期，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 7, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (8, 'create_time', 'createTime', '数据库数据插入时间', 'datetime', 'TIMESTAMP', 'Date', 8, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (9, 'create_user_id', 'createUserId', '数据库数据插入用户主键', 'int(11)', 'INTEGER', 'Integer', 9, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (10, 'update_time', 'updateTime', '数据库数据更新时间', 'datetime', 'TIMESTAMP', 'Date', 10, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (11, 'update_user_id', 'updateUserId', '数据库数据更新用户主键', 'int(11)', 'INTEGER', 'Integer', 11, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `dev_table_column` VALUES (12, 'deleted', 'deleted', '逻辑删除标识，0为正常，1为逻辑删除，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 12, 1, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);

-- ----------------------------
-- Table structure for dev_table_info
-- ----------------------------
DROP TABLE IF EXISTS `dev_table_info`;
CREATE TABLE `dev_table_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表注释',
  `entity_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实体类名称',
  `base_package_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包前缀名称',
  `code_generation_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码生成路径',
  `code_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码作者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dev_table_info
-- ----------------------------
INSERT INTO `dev_table_info` VALUES (1, 'sys_user', '系统用户表', 'User', 'com.zero.sys', 'E:\\', 'herenpeng', '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作日志用户',
  `access_time` datetime(0) NOT NULL COMMENT '访问时间',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问ip地址',
  `uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问的uri',
  `method_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法类型',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问方法',
  `execution_time` bigint(20) NOT NULL COMMENT '执行时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志描述信息',
  `exception_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常名称',
  `exception_message` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'root', '2021-01-03 16:37:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 45, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:37:13', 1, '2021-01-03 16:37:13', 1, 0);
INSERT INTO `sys_log` VALUES (2, 'root', '2021-01-03 16:37:13', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 23, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:37:13', 1, '2021-01-03 16:37:13', 1, 0);
INSERT INTO `sys_log` VALUES (3, 'root', '2021-01-03 16:37:23', '127.0.0.1', '/api/user/check/password', 'GET', 'class com.zero.sys.controller.UserController.checkPassword', 120, '检测用户密码是否正确', NULL, NULL, '2021-01-03 16:37:23', 1, '2021-01-03 16:37:23', 1, 0);
INSERT INTO `sys_log` VALUES (4, 'root', '2021-01-03 16:37:35', '127.0.0.1', '/api/user/check/password', 'GET', 'class com.zero.sys.controller.UserController.checkPassword', 115, '检测用户密码是否正确', NULL, NULL, '2021-01-03 16:37:35', 1, '2021-01-03 16:37:35', 1, 0);
INSERT INTO `sys_log` VALUES (5, 'root', '2021-01-03 16:37:35', '127.0.0.1', '/api/user/reset/password', 'PUT', 'class com.zero.sys.controller.UserController.resetPassword', 218, '重置用户账号密码', NULL, NULL, '2021-01-03 16:37:35', 1, '2021-01-03 16:37:35', 1, 0);
INSERT INTO `sys_log` VALUES (6, 'root', '2021-01-03 16:38:52', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 39, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:38:52', 1, '2021-01-03 16:56:44', 1, 0);
INSERT INTO `sys_log` VALUES (7, 'root', '2021-01-03 16:38:52', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:38:52', 1, '2021-01-03 16:38:52', 1, 0);
INSERT INTO `sys_log` VALUES (8, 'root', '2021-01-03 16:38:52', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 25, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:38:52', 1, '2021-01-03 16:38:52', 1, 0);
INSERT INTO `sys_log` VALUES (9, 'root', '2021-01-03 16:38:56', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 85, '分页查询用户数据', NULL, NULL, '2021-01-03 16:38:56', 1, '2021-01-03 16:38:56', 1, 0);
INSERT INTO `sys_log` VALUES (10, 'root', '2021-01-03 16:38:58', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 20, '分页查询角色数据', NULL, NULL, '2021-01-03 16:38:58', 1, '2021-01-03 16:38:58', 1, 0);
INSERT INTO `sys_log` VALUES (11, 'root', '2021-01-03 16:39:01', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 43, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:39:00', 1, '2021-01-03 16:39:00', 1, 0);
INSERT INTO `sys_log` VALUES (12, 'root', '2021-01-03 16:39:06', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 54, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:39:05', 1, '2021-01-03 16:39:05', 1, 0);
INSERT INTO `sys_log` VALUES (13, 'root', '2021-01-03 16:39:42', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 7, '分页查询角色数据', NULL, NULL, '2021-01-03 16:39:41', 1, '2021-01-03 16:39:41', 1, 0);
INSERT INTO `sys_log` VALUES (14, 'root', '2021-01-03 16:39:47', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 33, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:39:47', 1, '2021-01-03 16:39:47', 1, 0);
INSERT INTO `sys_log` VALUES (15, 'root', '2021-01-03 16:39:54', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 47, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:39:53', 1, '2021-01-03 16:39:53', 1, 0);
INSERT INTO `sys_log` VALUES (16, 'root', '2021-01-03 16:39:57', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 20, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-03 16:39:57', 1, '2021-01-03 16:39:57', 1, 0);
INSERT INTO `sys_log` VALUES (17, 'root', '2021-01-03 16:39:59', '127.0.0.1', '/api/log/page/2', 'GET', 'class com.zero.sys.controller.LogController.page', 12, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-03 16:39:58', 1, '2021-01-03 16:39:58', 1, 0);
INSERT INTO `sys_log` VALUES (18, 'root', '2021-01-03 16:40:00', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 10, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-03 16:40:00', 1, '2021-01-03 16:40:00', 1, 0);
INSERT INTO `sys_log` VALUES (19, 'root', '2021-01-03 16:42:37', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 10, '分页查询用户数据', NULL, NULL, '2021-01-03 16:42:36', 1, '2021-01-03 16:42:36', 1, 0);
INSERT INTO `sys_log` VALUES (20, 'root', '2021-01-03 16:42:45', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:42:44', 1, '2021-01-03 16:42:44', 1, 0);
INSERT INTO `sys_log` VALUES (21, 'root', '2021-01-03 16:42:46', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:42:46', 1, '2021-01-03 16:42:46', 1, 0);
INSERT INTO `sys_log` VALUES (22, 'root', '2021-01-03 16:42:46', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 118, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:42:46', 1, '2021-01-03 16:42:46', 1, 0);
INSERT INTO `sys_log` VALUES (23, 'root', '2021-01-03 16:42:46', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:42:46', 1, '2021-01-03 16:42:46', 1, 0);
INSERT INTO `sys_log` VALUES (24, 'root', '2021-01-03 16:42:48', '127.0.0.1', '/api/user/role/2', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 7, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:42:47', 1, '2021-01-03 16:42:47', 1, 0);
INSERT INTO `sys_log` VALUES (25, 'root', '2021-01-03 16:42:49', '127.0.0.1', '/api/user/role/2', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 11, '添加用户角色', NULL, NULL, '2021-01-03 16:42:48', 1, '2021-01-03 16:42:48', 1, 0);
INSERT INTO `sys_log` VALUES (26, 'root', '2021-01-03 16:42:49', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 9, '分页查询用户数据', NULL, NULL, '2021-01-03 16:42:48', 1, '2021-01-03 16:42:48', 1, 0);
INSERT INTO `sys_log` VALUES (27, 'root', '2021-01-03 16:42:56', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:42:55', 1, '2021-01-03 16:42:55', 1, 0);
INSERT INTO `sys_log` VALUES (28, 'root', '2021-01-03 16:42:57', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:42:57', 1, '2021-01-03 16:42:57', 1, 0);
INSERT INTO `sys_log` VALUES (29, 'root', '2021-01-03 16:42:57', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 107, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:42:57', 1, '2021-01-03 16:42:57', 1, 0);
INSERT INTO `sys_log` VALUES (30, 'root', '2021-01-03 16:42:57', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 12, '分页查询用户数据', NULL, NULL, '2021-01-03 16:42:57', 1, '2021-01-03 16:42:57', 1, 0);
INSERT INTO `sys_log` VALUES (31, 'root', '2021-01-03 16:42:58', '127.0.0.1', '/api/user/role/3', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:42:58', 1, '2021-01-03 16:42:58', 1, 0);
INSERT INTO `sys_log` VALUES (32, 'root', '2021-01-03 16:42:59', '127.0.0.1', '/api/user/role/3', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 8, '添加用户角色', NULL, NULL, '2021-01-03 16:42:58', 1, '2021-01-03 16:42:58', 1, 0);
INSERT INTO `sys_log` VALUES (33, 'root', '2021-01-03 16:42:59', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 10, '分页查询用户数据', NULL, NULL, '2021-01-03 16:42:58', 1, '2021-01-03 16:42:58', 1, 0);
INSERT INTO `sys_log` VALUES (34, 'root', '2021-01-03 16:43:05', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:05', 1, '2021-01-03 16:43:05', 1, 0);
INSERT INTO `sys_log` VALUES (35, 'root', '2021-01-03 16:43:07', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:06', 1, '2021-01-03 16:43:06', 1, 0);
INSERT INTO `sys_log` VALUES (36, 'root', '2021-01-03 16:43:07', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 171, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:06', 1, '2021-01-03 16:43:06', 1, 0);
INSERT INTO `sys_log` VALUES (37, 'root', '2021-01-03 16:43:07', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 11, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:06', 1, '2021-01-03 16:43:06', 1, 0);
INSERT INTO `sys_log` VALUES (38, 'root', '2021-01-03 16:43:12', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:11', 1, '2021-01-03 16:43:11', 1, 0);
INSERT INTO `sys_log` VALUES (39, 'root', '2021-01-03 16:43:13', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:12', 1, '2021-01-03 16:43:12', 1, 0);
INSERT INTO `sys_log` VALUES (40, 'root', '2021-01-03 16:43:13', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 111, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:13', 1, '2021-01-03 16:43:13', 1, 0);
INSERT INTO `sys_log` VALUES (41, 'root', '2021-01-03 16:43:13', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:13', 1, '2021-01-03 16:43:13', 1, 0);
INSERT INTO `sys_log` VALUES (42, 'root', '2021-01-03 16:43:19', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:19', 1, '2021-01-03 16:43:19', 1, 0);
INSERT INTO `sys_log` VALUES (43, 'root', '2021-01-03 16:43:21', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:20', 1, '2021-01-03 16:43:20', 1, 0);
INSERT INTO `sys_log` VALUES (44, 'root', '2021-01-03 16:43:21', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 120, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:20', 1, '2021-01-03 16:43:20', 1, 0);
INSERT INTO `sys_log` VALUES (45, 'root', '2021-01-03 16:43:21', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:20', 1, '2021-01-03 16:43:20', 1, 0);
INSERT INTO `sys_log` VALUES (46, 'root', '2021-01-03 16:43:23', '127.0.0.1', '/api/user/role/4', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:23', 1, '2021-01-03 16:43:23', 1, 0);
INSERT INTO `sys_log` VALUES (47, 'root', '2021-01-03 16:43:24', '127.0.0.1', '/api/user/role/4', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 13, '添加用户角色', NULL, NULL, '2021-01-03 16:43:23', 1, '2021-01-03 16:43:23', 1, 0);
INSERT INTO `sys_log` VALUES (48, 'root', '2021-01-03 16:43:24', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 16, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:24', 1, '2021-01-03 16:43:24', 1, 0);
INSERT INTO `sys_log` VALUES (49, 'root', '2021-01-03 16:43:25', '127.0.0.1', '/api/user/role/5', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:24', 1, '2021-01-03 16:43:24', 1, 0);
INSERT INTO `sys_log` VALUES (50, 'root', '2021-01-03 16:43:25', '127.0.0.1', '/api/user/role/5', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 6, '添加用户角色', NULL, NULL, '2021-01-03 16:43:25', 1, '2021-01-03 16:43:25', 1, 0);
INSERT INTO `sys_log` VALUES (51, 'root', '2021-01-03 16:43:25', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:25', 1, '2021-01-03 16:43:25', 1, 0);
INSERT INTO `sys_log` VALUES (52, 'root', '2021-01-03 16:43:26', '127.0.0.1', '/api/user/role/6', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:25', 1, '2021-01-03 16:43:25', 1, 0);
INSERT INTO `sys_log` VALUES (53, 'root', '2021-01-03 16:43:27', '127.0.0.1', '/api/user/role/6', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 8, '添加用户角色', NULL, NULL, '2021-01-03 16:43:26', 1, '2021-01-03 16:43:26', 1, 0);
INSERT INTO `sys_log` VALUES (54, 'root', '2021-01-03 16:43:27', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 16, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:26', 1, '2021-01-03 16:43:26', 1, 0);
INSERT INTO `sys_log` VALUES (55, 'root', '2021-01-03 16:43:32', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:31', 1, '2021-01-03 16:43:31', 1, 0);
INSERT INTO `sys_log` VALUES (56, 'root', '2021-01-03 16:43:34', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:33', 1, '2021-01-03 16:43:33', 1, 0);
INSERT INTO `sys_log` VALUES (57, 'root', '2021-01-03 16:43:34', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 107, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:33', 1, '2021-01-03 16:43:33', 1, 0);
INSERT INTO `sys_log` VALUES (58, 'root', '2021-01-03 16:43:34', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:33', 1, '2021-01-03 16:43:33', 1, 0);
INSERT INTO `sys_log` VALUES (59, 'root', '2021-01-03 16:43:35', '127.0.0.1', '/api/user/role/7', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:35', 1, '2021-01-03 16:43:35', 1, 0);
INSERT INTO `sys_log` VALUES (60, 'root', '2021-01-03 16:43:36', '127.0.0.1', '/api/user/role/7', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 9, '添加用户角色', NULL, NULL, '2021-01-03 16:43:35', 1, '2021-01-03 16:43:35', 1, 0);
INSERT INTO `sys_log` VALUES (61, 'root', '2021-01-03 16:43:36', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:35', 1, '2021-01-03 16:43:35', 1, 0);
INSERT INTO `sys_log` VALUES (62, 'root', '2021-01-03 16:43:40', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:40', 1, '2021-01-03 16:43:40', 1, 0);
INSERT INTO `sys_log` VALUES (63, 'root', '2021-01-03 16:43:41', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:41', 1, '2021-01-03 16:43:41', 1, 0);
INSERT INTO `sys_log` VALUES (64, 'root', '2021-01-03 16:43:41', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 113, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:41', 1, '2021-01-03 16:43:41', 1, 0);
INSERT INTO `sys_log` VALUES (65, 'root', '2021-01-03 16:43:42', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:41', 1, '2021-01-03 16:43:41', 1, 0);
INSERT INTO `sys_log` VALUES (66, 'root', '2021-01-03 16:43:42', '127.0.0.1', '/api/user/role/8', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:42', 1, '2021-01-03 16:43:42', 1, 0);
INSERT INTO `sys_log` VALUES (67, 'root', '2021-01-03 16:43:43', '127.0.0.1', '/api/user/role/8', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 7, '添加用户角色', NULL, NULL, '2021-01-03 16:43:43', 1, '2021-01-03 16:43:43', 1, 0);
INSERT INTO `sys_log` VALUES (68, 'root', '2021-01-03 16:43:43', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 19, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:43', 1, '2021-01-03 16:43:43', 1, 0);
INSERT INTO `sys_log` VALUES (69, 'root', '2021-01-03 16:43:49', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:49', 1, '2021-01-03 16:43:49', 1, 0);
INSERT INTO `sys_log` VALUES (70, 'root', '2021-01-03 16:43:51', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:51', 1, '2021-01-03 16:43:51', 1, 0);
INSERT INTO `sys_log` VALUES (71, 'root', '2021-01-03 16:43:51', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 107, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:51', 1, '2021-01-03 16:43:51', 1, 0);
INSERT INTO `sys_log` VALUES (72, 'root', '2021-01-03 16:43:51', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 18, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:51', 1, '2021-01-03 16:43:51', 1, 0);
INSERT INTO `sys_log` VALUES (73, 'root', '2021-01-03 16:43:53', '127.0.0.1', '/api/user/role/9', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:43:52', 1, '2021-01-03 16:43:52', 1, 0);
INSERT INTO `sys_log` VALUES (74, 'root', '2021-01-03 16:43:53', '127.0.0.1', '/api/user/role/9', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 9, '添加用户角色', NULL, NULL, '2021-01-03 16:43:53', 1, '2021-01-03 16:43:53', 1, 0);
INSERT INTO `sys_log` VALUES (75, 'root', '2021-01-03 16:43:53', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 20, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:53', 1, '2021-01-03 16:43:53', 1, 0);
INSERT INTO `sys_log` VALUES (76, 'root', '2021-01-03 16:43:58', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:57', 1, '2021-01-03 16:43:57', 1, 0);
INSERT INTO `sys_log` VALUES (77, 'root', '2021-01-03 16:43:59', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:43:58', 1, '2021-01-03 16:43:58', 1, 0);
INSERT INTO `sys_log` VALUES (78, 'root', '2021-01-03 16:43:59', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 122, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:43:59', 1, '2021-01-03 16:43:59', 1, 0);
INSERT INTO `sys_log` VALUES (79, 'root', '2021-01-03 16:43:59', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 18, '分页查询用户数据', NULL, NULL, '2021-01-03 16:43:59', 1, '2021-01-03 16:43:59', 1, 0);
INSERT INTO `sys_log` VALUES (80, 'root', '2021-01-03 16:44:04', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:03', 1, '2021-01-03 16:44:03', 1, 0);
INSERT INTO `sys_log` VALUES (81, 'root', '2021-01-03 16:44:05', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:04', 1, '2021-01-03 16:44:04', 1, 0);
INSERT INTO `sys_log` VALUES (82, 'root', '2021-01-03 16:44:05', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 113, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:04', 1, '2021-01-03 16:44:04', 1, 0);
INSERT INTO `sys_log` VALUES (83, 'root', '2021-01-03 16:44:05', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:04', 1, '2021-01-03 16:44:04', 1, 0);
INSERT INTO `sys_log` VALUES (84, 'root', '2021-01-03 16:44:09', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:09', 1, '2021-01-03 16:44:09', 1, 0);
INSERT INTO `sys_log` VALUES (85, 'root', '2021-01-03 16:44:10', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:10', 1, '2021-01-03 16:44:10', 1, 0);
INSERT INTO `sys_log` VALUES (86, 'root', '2021-01-03 16:44:10', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 107, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:10', 1, '2021-01-03 16:44:10', 1, 0);
INSERT INTO `sys_log` VALUES (87, 'root', '2021-01-03 16:44:11', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:10', 1, '2021-01-03 16:44:10', 1, 0);
INSERT INTO `sys_log` VALUES (88, 'root', '2021-01-03 16:44:11', '127.0.0.1', '/api/user/role/10', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:11', 1, '2021-01-03 16:44:11', 1, 0);
INSERT INTO `sys_log` VALUES (89, 'root', '2021-01-03 16:44:12', '127.0.0.1', '/api/user/role/10', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 9, '添加用户角色', NULL, NULL, '2021-01-03 16:44:12', 1, '2021-01-03 16:44:12', 1, 0);
INSERT INTO `sys_log` VALUES (90, 'root', '2021-01-03 16:44:12', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:12', 1, '2021-01-03 16:44:12', 1, 0);
INSERT INTO `sys_log` VALUES (91, 'root', '2021-01-03 16:44:13', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 6, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:13', 1, '2021-01-03 16:44:13', 1, 0);
INSERT INTO `sys_log` VALUES (92, 'root', '2021-01-03 16:44:14', '127.0.0.1', '/api/user/role/11', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:14', 1, '2021-01-03 16:44:14', 1, 0);
INSERT INTO `sys_log` VALUES (93, 'root', '2021-01-03 16:44:15', '127.0.0.1', '/api/user/role/11', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 9, '添加用户角色', NULL, NULL, '2021-01-03 16:44:14', 1, '2021-01-03 16:44:14', 1, 0);
INSERT INTO `sys_log` VALUES (94, 'root', '2021-01-03 16:44:15', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 9, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:14', 1, '2021-01-03 16:44:14', 1, 0);
INSERT INTO `sys_log` VALUES (95, 'root', '2021-01-03 16:44:15', '127.0.0.1', '/api/user/role/12', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:15', 1, '2021-01-03 16:44:15', 1, 0);
INSERT INTO `sys_log` VALUES (96, 'root', '2021-01-03 16:44:16', '127.0.0.1', '/api/user/role/12', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 9, '添加用户角色', NULL, NULL, '2021-01-03 16:44:16', 1, '2021-01-03 16:44:16', 1, 0);
INSERT INTO `sys_log` VALUES (97, 'root', '2021-01-03 16:44:16', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 8, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:16', 1, '2021-01-03 16:44:16', 1, 0);
INSERT INTO `sys_log` VALUES (98, 'root', '2021-01-03 16:44:21', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:21', 1, '2021-01-03 16:44:21', 1, 0);
INSERT INTO `sys_log` VALUES (99, 'root', '2021-01-03 16:44:22', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:22', 1, '2021-01-03 16:44:22', 1, 0);
INSERT INTO `sys_log` VALUES (100, 'root', '2021-01-03 16:44:23', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 109, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:22', 1, '2021-01-03 16:44:22', 1, 0);
INSERT INTO `sys_log` VALUES (101, 'root', '2021-01-03 16:44:23', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 8, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:22', 1, '2021-01-03 16:44:22', 1, 0);
INSERT INTO `sys_log` VALUES (102, 'root', '2021-01-03 16:44:27', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:27', 1, '2021-01-03 16:44:27', 1, 0);
INSERT INTO `sys_log` VALUES (103, 'root', '2021-01-03 16:44:28', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:27', 1, '2021-01-03 16:44:27', 1, 0);
INSERT INTO `sys_log` VALUES (104, 'root', '2021-01-03 16:44:28', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 110, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:28', 1, '2021-01-03 16:44:28', 1, 0);
INSERT INTO `sys_log` VALUES (105, 'root', '2021-01-03 16:44:28', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 10, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:28', 1, '2021-01-03 16:44:28', 1, 0);
INSERT INTO `sys_log` VALUES (106, 'root', '2021-01-03 16:44:29', '127.0.0.1', '/api/user/role/13', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:29', 1, '2021-01-03 16:44:29', 1, 0);
INSERT INTO `sys_log` VALUES (107, 'root', '2021-01-03 16:44:30', '127.0.0.1', '/api/user/role/13', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 8, '添加用户角色', NULL, NULL, '2021-01-03 16:44:29', 1, '2021-01-03 16:44:29', 1, 0);
INSERT INTO `sys_log` VALUES (108, 'root', '2021-01-03 16:44:30', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 9, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:29', 1, '2021-01-03 16:44:29', 1, 0);
INSERT INTO `sys_log` VALUES (109, 'root', '2021-01-03 16:44:30', '127.0.0.1', '/api/user/role/14', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 4, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:30', 1, '2021-01-03 16:44:30', 1, 0);
INSERT INTO `sys_log` VALUES (110, 'root', '2021-01-03 16:44:31', '127.0.0.1', '/api/user/role/14', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 8, '添加用户角色', NULL, NULL, '2021-01-03 16:44:31', 1, '2021-01-03 16:44:31', 1, 0);
INSERT INTO `sys_log` VALUES (111, 'root', '2021-01-03 16:44:31', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 10, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:31', 1, '2021-01-03 16:44:31', 1, 0);
INSERT INTO `sys_log` VALUES (112, 'root', '2021-01-03 16:44:41', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:40', 1, '2021-01-03 16:44:40', 1, 0);
INSERT INTO `sys_log` VALUES (113, 'root', '2021-01-03 16:44:42', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:41', 1, '2021-01-03 16:44:41', 1, 0);
INSERT INTO `sys_log` VALUES (114, 'root', '2021-01-03 16:44:42', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 102, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:41', 1, '2021-01-03 16:44:41', 1, 0);
INSERT INTO `sys_log` VALUES (115, 'root', '2021-01-03 16:44:42', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 10, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:41', 1, '2021-01-03 16:44:41', 1, 0);
INSERT INTO `sys_log` VALUES (116, 'root', '2021-01-03 16:44:43', '127.0.0.1', '/api/user/role/15', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:44:43', 1, '2021-01-03 16:44:43', 1, 0);
INSERT INTO `sys_log` VALUES (117, 'root', '2021-01-03 16:44:44', '127.0.0.1', '/api/user/role/15', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 7, '添加用户角色', NULL, NULL, '2021-01-03 16:44:43', 1, '2021-01-03 16:44:43', 1, 0);
INSERT INTO `sys_log` VALUES (118, 'root', '2021-01-03 16:44:44', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 12, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:43', 1, '2021-01-03 16:44:43', 1, 0);
INSERT INTO `sys_log` VALUES (119, 'root', '2021-01-03 16:44:48', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:48', 1, '2021-01-03 16:44:48', 1, 0);
INSERT INTO `sys_log` VALUES (120, 'root', '2021-01-03 16:44:49', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:49', 1, '2021-01-03 16:44:49', 1, 0);
INSERT INTO `sys_log` VALUES (121, 'root', '2021-01-03 16:44:49', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 132, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:49', 1, '2021-01-03 16:44:49', 1, 0);
INSERT INTO `sys_log` VALUES (122, 'root', '2021-01-03 16:44:50', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 11, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:49', 1, '2021-01-03 16:44:49', 1, 0);
INSERT INTO `sys_log` VALUES (123, 'root', '2021-01-03 16:44:54', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:54', 1, '2021-01-03 16:44:54', 1, 0);
INSERT INTO `sys_log` VALUES (124, 'root', '2021-01-03 16:44:56', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:44:56', 1, '2021-01-03 16:44:56', 1, 0);
INSERT INTO `sys_log` VALUES (125, 'root', '2021-01-03 16:44:56', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 115, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:44:56', 1, '2021-01-03 16:44:56', 1, 0);
INSERT INTO `sys_log` VALUES (126, 'root', '2021-01-03 16:44:57', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 11, '分页查询用户数据', NULL, NULL, '2021-01-03 16:44:56', 1, '2021-01-03 16:44:56', 1, 0);
INSERT INTO `sys_log` VALUES (127, 'root', '2021-01-03 16:45:01', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 3, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:00', 1, '2021-01-03 16:45:00', 1, 0);
INSERT INTO `sys_log` VALUES (128, 'root', '2021-01-03 16:45:02', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:01', 1, '2021-01-03 16:45:01', 1, 0);
INSERT INTO `sys_log` VALUES (129, 'root', '2021-01-03 16:45:02', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 120, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:45:01', 1, '2021-01-03 16:45:01', 1, 0);
INSERT INTO `sys_log` VALUES (130, 'root', '2021-01-03 16:45:02', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:01', 1, '2021-01-03 16:45:01', 1, 0);
INSERT INTO `sys_log` VALUES (131, 'root', '2021-01-03 16:45:07', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:06', 1, '2021-01-03 16:45:06', 1, 0);
INSERT INTO `sys_log` VALUES (132, 'root', '2021-01-03 16:45:08', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:07', 1, '2021-01-03 16:45:07', 1, 0);
INSERT INTO `sys_log` VALUES (133, 'root', '2021-01-03 16:45:08', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 118, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:45:07', 1, '2021-01-03 16:45:07', 1, 0);
INSERT INTO `sys_log` VALUES (134, 'root', '2021-01-03 16:45:08', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:07', 1, '2021-01-03 16:45:07', 1, 0);
INSERT INTO `sys_log` VALUES (135, 'root', '2021-01-03 16:45:14', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:13', 1, '2021-01-03 16:45:13', 1, 0);
INSERT INTO `sys_log` VALUES (136, 'root', '2021-01-03 16:45:15', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:14', 1, '2021-01-03 16:45:14', 1, 0);
INSERT INTO `sys_log` VALUES (137, 'root', '2021-01-03 16:45:15', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 104, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:45:15', 1, '2021-01-03 16:45:15', 1, 0);
INSERT INTO `sys_log` VALUES (138, 'root', '2021-01-03 16:45:15', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:15', 1, '2021-01-03 16:45:15', 1, 0);
INSERT INTO `sys_log` VALUES (139, 'root', '2021-01-03 16:45:16', '127.0.0.1', '/api/user/role/16', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:16', 1, '2021-01-03 16:45:16', 1, 0);
INSERT INTO `sys_log` VALUES (140, 'root', '2021-01-03 16:45:17', '127.0.0.1', '/api/user/role/16', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 7, '添加用户角色', NULL, NULL, '2021-01-03 16:45:16', 1, '2021-01-03 16:45:16', 1, 0);
INSERT INTO `sys_log` VALUES (141, 'root', '2021-01-03 16:45:17', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:16', 1, '2021-01-03 16:45:16', 1, 0);
INSERT INTO `sys_log` VALUES (142, 'root', '2021-01-03 16:45:17', '127.0.0.1', '/api/user/role/17', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:17', 1, '2021-01-03 16:45:17', 1, 0);
INSERT INTO `sys_log` VALUES (143, 'root', '2021-01-03 16:45:18', '127.0.0.1', '/api/user/role/17', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 8, '添加用户角色', NULL, NULL, '2021-01-03 16:45:18', 1, '2021-01-03 16:45:18', 1, 0);
INSERT INTO `sys_log` VALUES (144, 'root', '2021-01-03 16:45:18', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:18', 1, '2021-01-03 16:45:18', 1, 0);
INSERT INTO `sys_log` VALUES (145, 'root', '2021-01-03 16:45:19', '127.0.0.1', '/api/user/role/18', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:18', 1, '2021-01-03 16:45:18', 1, 0);
INSERT INTO `sys_log` VALUES (146, 'root', '2021-01-03 16:45:20', '127.0.0.1', '/api/user/role/18', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 7, '添加用户角色', NULL, NULL, '2021-01-03 16:45:19', 1, '2021-01-03 16:45:19', 1, 0);
INSERT INTO `sys_log` VALUES (147, 'root', '2021-01-03 16:45:20', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 16, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:19', 1, '2021-01-03 16:45:19', 1, 0);
INSERT INTO `sys_log` VALUES (148, 'root', '2021-01-03 16:45:20', '127.0.0.1', '/api/user/role/19', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 3, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:20', 1, '2021-01-03 16:45:20', 1, 0);
INSERT INTO `sys_log` VALUES (149, 'root', '2021-01-03 16:45:21', '127.0.0.1', '/api/user/role/19', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 6, '添加用户角色', NULL, NULL, '2021-01-03 16:45:20', 1, '2021-01-03 16:45:20', 1, 0);
INSERT INTO `sys_log` VALUES (150, 'root', '2021-01-03 16:45:21', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 17, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:20', 1, '2021-01-03 16:45:20', 1, 0);
INSERT INTO `sys_log` VALUES (151, 'root', '2021-01-03 16:45:22', '127.0.0.1', '/api/user/role/20', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:21', 1, '2021-01-03 16:45:21', 1, 0);
INSERT INTO `sys_log` VALUES (152, 'root', '2021-01-03 16:45:23', '127.0.0.1', '/api/user/role/20', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 6, '添加用户角色', NULL, NULL, '2021-01-03 16:45:22', 1, '2021-01-03 16:45:22', 1, 0);
INSERT INTO `sys_log` VALUES (153, 'root', '2021-01-03 16:45:23', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:22', 1, '2021-01-03 16:45:22', 1, 0);
INSERT INTO `sys_log` VALUES (154, 'root', '2021-01-03 16:45:32', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:32', 1, '2021-01-03 16:45:32', 1, 0);
INSERT INTO `sys_log` VALUES (155, 'root', '2021-01-03 16:45:34', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:33', 1, '2021-01-03 16:45:33', 1, 0);
INSERT INTO `sys_log` VALUES (156, 'root', '2021-01-03 16:45:34', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 103, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:45:33', 1, '2021-01-03 16:45:33', 1, 0);
INSERT INTO `sys_log` VALUES (157, 'root', '2021-01-03 16:45:34', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:33', 1, '2021-01-03 16:45:33', 1, 0);
INSERT INTO `sys_log` VALUES (158, 'root', '2021-01-03 16:45:35', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.sys.controller.UserController.page', 5, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:34', 1, '2021-01-03 16:45:34', 1, 0);
INSERT INTO `sys_log` VALUES (159, 'root', '2021-01-03 16:45:36', '127.0.0.1', '/api/user/role/21', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:35', 1, '2021-01-03 16:45:35', 1, 0);
INSERT INTO `sys_log` VALUES (160, 'root', '2021-01-03 16:45:37', '127.0.0.1', '/api/user/role/21', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 7, '添加用户角色', NULL, NULL, '2021-01-03 16:45:36', 1, '2021-01-03 16:45:36', 1, 0);
INSERT INTO `sys_log` VALUES (161, 'root', '2021-01-03 16:45:37', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.sys.controller.UserController.page', 5, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:36', 1, '2021-01-03 16:45:36', 1, 0);
INSERT INTO `sys_log` VALUES (162, 'root', '2021-01-03 16:45:41', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:41', 1, '2021-01-03 16:45:41', 1, 0);
INSERT INTO `sys_log` VALUES (163, 'root', '2021-01-03 16:45:45', '127.0.0.1', '/api/user/check/username', 'GET', 'class com.zero.sys.controller.UserController.checkUsername', 2, '检测用户名是否已存在', NULL, NULL, '2021-01-03 16:45:45', 1, '2021-01-03 16:45:45', 1, 0);
INSERT INTO `sys_log` VALUES (164, 'root', '2021-01-03 16:45:45', '127.0.0.1', '/api/user', 'POST', 'class com.zero.sys.controller.UserController.save', 104, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:45:45', 1, '2021-01-03 16:45:45', 1, 0);
INSERT INTO `sys_log` VALUES (165, 'root', '2021-01-03 16:45:46', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.sys.controller.UserController.page', 8, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:45', 1, '2021-01-03 16:45:45', 1, 0);
INSERT INTO `sys_log` VALUES (166, 'root', '2021-01-03 16:45:46', '127.0.0.1', '/api/user/role/22', 'GET', 'class com.zero.sys.controller.UserController.getUserNotRoleList', 2, '获取该用户未拥有的角色', NULL, NULL, '2021-01-03 16:45:46', 1, '2021-01-03 16:45:46', 1, 0);
INSERT INTO `sys_log` VALUES (167, 'root', '2021-01-03 16:45:47', '127.0.0.1', '/api/user/role/22', 'POST', 'class com.zero.sys.controller.UserController.addUserRole', 5, '添加用户角色', NULL, NULL, '2021-01-03 16:45:47', 1, '2021-01-03 16:45:47', 1, 0);
INSERT INTO `sys_log` VALUES (168, 'root', '2021-01-03 16:45:47', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.sys.controller.UserController.page', 7, '分页查询用户数据', NULL, NULL, '2021-01-03 16:45:47', 1, '2021-01-03 16:45:47', 1, 0);
INSERT INTO `sys_log` VALUES (169, 'root', '2021-01-03 16:46:07', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:46:06', 1, '2021-01-03 16:46:06', 1, 0);
INSERT INTO `sys_log` VALUES (170, 'root', '2021-01-03 16:46:10', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 13, '分页查询用户数据', NULL, NULL, '2021-01-03 16:46:09', 1, '2021-01-03 16:46:09', 1, 0);
INSERT INTO `sys_log` VALUES (171, 'root', '2021-01-03 16:46:14', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:46:13', 1, '2021-01-03 16:46:13', 1, 0);
INSERT INTO `sys_log` VALUES (172, 'root', '2021-01-03 16:46:16', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 4, '分页查询角色数据', NULL, NULL, '2021-01-03 16:46:16', 1, '2021-01-03 16:46:16', 1, 0);
INSERT INTO `sys_log` VALUES (173, 'root', '2021-01-03 16:46:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 13, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:46:18', 1, '2021-01-03 16:46:18', 1, 0);
INSERT INTO `sys_log` VALUES (174, 'root', '2021-01-03 16:46:23', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 36, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:23', 1, '2021-01-03 16:46:23', 1, 0);
INSERT INTO `sys_log` VALUES (175, 'root', '2021-01-03 16:46:25', '127.0.0.1', '/api/menu/role/1', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:24', 1, '2021-01-03 16:46:24', 1, 0);
INSERT INTO `sys_log` VALUES (176, 'root', '2021-01-03 16:46:26', '127.0.0.1', '/api/menu/role/1', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 8, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:25', 1, '2021-01-03 16:46:25', 1, 0);
INSERT INTO `sys_log` VALUES (177, 'root', '2021-01-03 16:46:26', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 34, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:25', 1, '2021-01-03 16:46:25', 1, 0);
INSERT INTO `sys_log` VALUES (178, 'root', '2021-01-03 16:46:28', '127.0.0.1', '/api/menu/role/2', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:27', 1, '2021-01-03 16:46:27', 1, 0);
INSERT INTO `sys_log` VALUES (179, 'root', '2021-01-03 16:46:29', '127.0.0.1', '/api/menu/role/2', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 6, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:28', 1, '2021-01-03 16:46:28', 1, 0);
INSERT INTO `sys_log` VALUES (180, 'root', '2021-01-03 16:46:29', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 38, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:28', 1, '2021-01-03 16:46:28', 1, 0);
INSERT INTO `sys_log` VALUES (181, 'root', '2021-01-03 16:46:29', '127.0.0.1', '/api/menu/role/3', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:29', 1, '2021-01-03 16:46:29', 1, 0);
INSERT INTO `sys_log` VALUES (182, 'root', '2021-01-03 16:46:30', '127.0.0.1', '/api/menu/role/3', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:29', 1, '2021-01-03 16:46:29', 1, 0);
INSERT INTO `sys_log` VALUES (183, 'root', '2021-01-03 16:46:30', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 30, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:29', 1, '2021-01-03 16:46:29', 1, 0);
INSERT INTO `sys_log` VALUES (184, 'root', '2021-01-03 16:46:31', '127.0.0.1', '/api/menu/role/4', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:31', 1, '2021-01-03 16:46:31', 1, 0);
INSERT INTO `sys_log` VALUES (185, 'root', '2021-01-03 16:46:32', '127.0.0.1', '/api/menu/role/4', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 4, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:31', 1, '2021-01-03 16:46:31', 1, 0);
INSERT INTO `sys_log` VALUES (186, 'root', '2021-01-03 16:46:32', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 33, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:31', 1, '2021-01-03 16:46:31', 1, 0);
INSERT INTO `sys_log` VALUES (187, 'root', '2021-01-03 16:46:33', '127.0.0.1', '/api/menu/role/5', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:33', 1, '2021-01-03 16:46:33', 1, 0);
INSERT INTO `sys_log` VALUES (188, 'root', '2021-01-03 16:46:34', '127.0.0.1', '/api/menu/role/5', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:34', 1, '2021-01-03 16:46:34', 1, 0);
INSERT INTO `sys_log` VALUES (189, 'root', '2021-01-03 16:46:34', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 35, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:34', 1, '2021-01-03 16:46:34', 1, 0);
INSERT INTO `sys_log` VALUES (190, 'root', '2021-01-03 16:46:37', '127.0.0.1', '/api/menu/role/6', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:36', 1, '2021-01-03 16:46:36', 1, 0);
INSERT INTO `sys_log` VALUES (191, 'root', '2021-01-03 16:46:38', '127.0.0.1', '/api/menu/role/6', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:37', 1, '2021-01-03 16:46:37', 1, 0);
INSERT INTO `sys_log` VALUES (192, 'root', '2021-01-03 16:46:38', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 35, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:37', 1, '2021-01-03 16:46:37', 1, 0);
INSERT INTO `sys_log` VALUES (193, 'root', '2021-01-03 16:46:38', '127.0.0.1', '/api/menu/role/7', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 4, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:38', 1, '2021-01-03 16:46:38', 1, 0);
INSERT INTO `sys_log` VALUES (194, 'root', '2021-01-03 16:46:39', '127.0.0.1', '/api/menu/role/7', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 6, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:38', 1, '2021-01-03 16:46:38', 1, 0);
INSERT INTO `sys_log` VALUES (195, 'root', '2021-01-03 16:46:39', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 36, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:38', 1, '2021-01-03 16:46:38', 1, 0);
INSERT INTO `sys_log` VALUES (196, 'root', '2021-01-03 16:46:39', '127.0.0.1', '/api/menu/role/8', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:39', 1, '2021-01-03 16:46:39', 1, 0);
INSERT INTO `sys_log` VALUES (197, 'root', '2021-01-03 16:46:40', '127.0.0.1', '/api/menu/role/8', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:39', 1, '2021-01-03 16:46:39', 1, 0);
INSERT INTO `sys_log` VALUES (198, 'root', '2021-01-03 16:46:40', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 38, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:39', 1, '2021-01-03 16:46:39', 1, 0);
INSERT INTO `sys_log` VALUES (199, 'root', '2021-01-03 16:46:45', '127.0.0.1', '/api/menu/role/19', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:44', 1, '2021-01-03 16:46:44', 1, 0);
INSERT INTO `sys_log` VALUES (200, 'root', '2021-01-03 16:46:45', '127.0.0.1', '/api/menu/role/19', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 6, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:45', 1, '2021-01-03 16:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (201, 'root', '2021-01-03 16:46:46', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 34, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:45', 1, '2021-01-03 16:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (202, 'root', '2021-01-03 16:46:46', '127.0.0.1', '/api/menu/role/20', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:46', 1, '2021-01-03 16:46:46', 1, 0);
INSERT INTO `sys_log` VALUES (203, 'root', '2021-01-03 16:46:47', '127.0.0.1', '/api/menu/role/20', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:46', 1, '2021-01-03 16:46:46', 1, 0);
INSERT INTO `sys_log` VALUES (204, 'root', '2021-01-03 16:46:47', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 31, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:46', 1, '2021-01-03 16:46:46', 1, 0);
INSERT INTO `sys_log` VALUES (205, 'root', '2021-01-03 16:46:50', '127.0.0.1', '/api/menu/role/12', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:49', 1, '2021-01-03 16:46:49', 1, 0);
INSERT INTO `sys_log` VALUES (206, 'root', '2021-01-03 16:46:50', '127.0.0.1', '/api/menu/role/12', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 5, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:50', 1, '2021-01-03 16:46:50', 1, 0);
INSERT INTO `sys_log` VALUES (207, 'root', '2021-01-03 16:46:50', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 31, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:50', 1, '2021-01-03 16:46:50', 1, 0);
INSERT INTO `sys_log` VALUES (208, 'root', '2021-01-03 16:46:51', '127.0.0.1', '/api/menu/role/13', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:50', 1, '2021-01-03 16:46:50', 1, 0);
INSERT INTO `sys_log` VALUES (209, 'root', '2021-01-03 16:46:52', '127.0.0.1', '/api/menu/role/13', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 6, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:51', 1, '2021-01-03 16:46:51', 1, 0);
INSERT INTO `sys_log` VALUES (210, 'root', '2021-01-03 16:46:52', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 31, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:51', 1, '2021-01-03 16:46:51', 1, 0);
INSERT INTO `sys_log` VALUES (211, 'root', '2021-01-03 16:46:54', '127.0.0.1', '/api/menu/role/14', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:54', 1, '2021-01-03 16:46:54', 1, 0);
INSERT INTO `sys_log` VALUES (212, 'root', '2021-01-03 16:46:55', '127.0.0.1', '/api/menu/role/14', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 7, '添加菜单角色', NULL, NULL, '2021-01-03 16:46:55', 1, '2021-01-03 16:46:55', 1, 0);
INSERT INTO `sys_log` VALUES (213, 'root', '2021-01-03 16:46:55', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 34, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:46:55', 1, '2021-01-03 16:46:55', 1, 0);
INSERT INTO `sys_log` VALUES (214, 'root', '2021-01-03 16:46:59', '127.0.0.1', '/api/menu/role/17', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:46:59', 1, '2021-01-03 16:46:59', 1, 0);
INSERT INTO `sys_log` VALUES (215, 'root', '2021-01-03 16:47:00', '127.0.0.1', '/api/menu/role/17', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 4, '添加菜单角色', NULL, NULL, '2021-01-03 16:47:00', 1, '2021-01-03 16:47:00', 1, 0);
INSERT INTO `sys_log` VALUES (216, 'root', '2021-01-03 16:47:00', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 33, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:47:00', 1, '2021-01-03 16:47:00', 1, 0);
INSERT INTO `sys_log` VALUES (217, 'root', '2021-01-03 16:47:06', '127.0.0.1', '/api/menu/role/10', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:47:06', 1, '2021-01-03 16:47:06', 1, 0);
INSERT INTO `sys_log` VALUES (218, 'root', '2021-01-03 16:47:07', '127.0.0.1', '/api/menu/role/9', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:47:07', 1, '2021-01-03 16:47:07', 1, 0);
INSERT INTO `sys_log` VALUES (219, 'root', '2021-01-03 16:47:08', '127.0.0.1', '/api/menu/role/9', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 4, '添加菜单角色', NULL, NULL, '2021-01-03 16:47:08', 1, '2021-01-03 16:47:08', 1, 0);
INSERT INTO `sys_log` VALUES (220, 'root', '2021-01-03 16:47:08', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 30, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:47:08', 1, '2021-01-03 16:47:08', 1, 0);
INSERT INTO `sys_log` VALUES (221, 'root', '2021-01-03 16:47:09', '127.0.0.1', '/api/menu/role/10', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:47:09', 1, '2021-01-03 16:47:09', 1, 0);
INSERT INTO `sys_log` VALUES (222, 'root', '2021-01-03 16:47:10', '127.0.0.1', '/api/menu/role/10', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 6, '添加菜单角色', NULL, NULL, '2021-01-03 16:47:10', 1, '2021-01-03 16:47:10', 1, 0);
INSERT INTO `sys_log` VALUES (223, 'root', '2021-01-03 16:47:10', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 30, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:47:10', 1, '2021-01-03 16:47:10', 1, 0);
INSERT INTO `sys_log` VALUES (224, 'root', '2021-01-03 16:47:11', '127.0.0.1', '/api/menu/role/11', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:47:11', 1, '2021-01-03 16:47:11', 1, 0);
INSERT INTO `sys_log` VALUES (225, 'root', '2021-01-03 16:47:12', '127.0.0.1', '/api/menu/role/11', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 4, '添加菜单角色', NULL, NULL, '2021-01-03 16:47:12', 1, '2021-01-03 16:47:12', 1, 0);
INSERT INTO `sys_log` VALUES (226, 'root', '2021-01-03 16:47:12', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 29, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:47:12', 1, '2021-01-03 16:47:12', 1, 0);
INSERT INTO `sys_log` VALUES (227, 'root', '2021-01-03 16:47:20', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:19', 1, '2021-01-03 16:47:19', 1, 0);
INSERT INTO `sys_log` VALUES (228, 'root', '2021-01-03 16:47:21', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.sys.controller.RoleController.list', 2, '获取所有的用户角色', NULL, NULL, '2021-01-03 16:47:20', 1, '2021-01-03 16:47:20', 1, 0);
INSERT INTO `sys_log` VALUES (229, 'root', '2021-01-03 16:47:25', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 18, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:24', 1, '2021-01-03 16:47:24', 1, 0);
INSERT INTO `sys_log` VALUES (230, 'root', '2021-01-03 16:47:35', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:35', 1, '2021-01-03 16:47:35', 1, 0);
INSERT INTO `sys_log` VALUES (231, 'root', '2021-01-03 16:47:36', '127.0.0.1', '/api/resources/role/45', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:36', 1, '2021-01-03 16:47:36', 1, 0);
INSERT INTO `sys_log` VALUES (232, 'root', '2021-01-03 16:47:38', '127.0.0.1', '/api/resources/role/45', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:37', 1, '2021-01-03 16:47:37', 1, 0);
INSERT INTO `sys_log` VALUES (233, 'root', '2021-01-03 16:47:38', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:37', 1, '2021-01-03 16:47:37', 1, 0);
INSERT INTO `sys_log` VALUES (234, 'root', '2021-01-03 16:47:38', '127.0.0.1', '/api/resources/role/46', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:38', 1, '2021-01-03 16:47:38', 1, 0);
INSERT INTO `sys_log` VALUES (235, 'root', '2021-01-03 16:47:40', '127.0.0.1', '/api/resources/role/46', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:39', 1, '2021-01-03 16:47:39', 1, 0);
INSERT INTO `sys_log` VALUES (236, 'root', '2021-01-03 16:47:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:39', 1, '2021-01-03 16:47:39', 1, 0);
INSERT INTO `sys_log` VALUES (237, 'root', '2021-01-03 16:47:41', '127.0.0.1', '/api/resources/role/47', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:40', 1, '2021-01-03 16:47:40', 1, 0);
INSERT INTO `sys_log` VALUES (238, 'root', '2021-01-03 16:47:42', '127.0.0.1', '/api/resources/role/47', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:41', 1, '2021-01-03 16:47:41', 1, 0);
INSERT INTO `sys_log` VALUES (239, 'root', '2021-01-03 16:47:42', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 13, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:41', 1, '2021-01-03 16:47:41', 1, 0);
INSERT INTO `sys_log` VALUES (240, 'root', '2021-01-03 16:47:42', '127.0.0.1', '/api/resources/role/50', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:42', 1, '2021-01-03 16:47:42', 1, 0);
INSERT INTO `sys_log` VALUES (241, 'root', '2021-01-03 16:47:43', '127.0.0.1', '/api/resources/role/50', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:43', 1, '2021-01-03 16:47:43', 1, 0);
INSERT INTO `sys_log` VALUES (242, 'root', '2021-01-03 16:47:43', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:43', 1, '2021-01-03 16:47:43', 1, 0);
INSERT INTO `sys_log` VALUES (243, 'root', '2021-01-03 16:47:45', '127.0.0.1', '/api/resources/role/53', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:44', 1, '2021-01-03 16:47:44', 1, 0);
INSERT INTO `sys_log` VALUES (244, 'root', '2021-01-03 16:47:45', '127.0.0.1', '/api/resources/role/53', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:45', 1, '2021-01-03 16:47:45', 1, 0);
INSERT INTO `sys_log` VALUES (245, 'root', '2021-01-03 16:47:45', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:45', 1, '2021-01-03 16:47:45', 1, 0);
INSERT INTO `sys_log` VALUES (246, 'root', '2021-01-03 16:47:46', '127.0.0.1', '/api/resources/role/54', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:46', 1, '2021-01-03 16:47:46', 1, 0);
INSERT INTO `sys_log` VALUES (247, 'root', '2021-01-03 16:47:47', '127.0.0.1', '/api/resources/role/54', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:46', 1, '2021-01-03 16:47:46', 1, 0);
INSERT INTO `sys_log` VALUES (248, 'root', '2021-01-03 16:47:47', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:46', 1, '2021-01-03 16:47:46', 1, 0);
INSERT INTO `sys_log` VALUES (249, 'root', '2021-01-03 16:47:47', '127.0.0.1', '/api/resources/role/56', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:47', 1, '2021-01-03 16:47:47', 1, 0);
INSERT INTO `sys_log` VALUES (250, 'root', '2021-01-03 16:47:48', '127.0.0.1', '/api/resources/role/56', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:47:48', 1, '2021-01-03 16:47:48', 1, 0);
INSERT INTO `sys_log` VALUES (251, 'root', '2021-01-03 16:47:48', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:48', 1, '2021-01-03 16:47:48', 1, 0);
INSERT INTO `sys_log` VALUES (252, 'root', '2021-01-03 16:47:59', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 6, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:47:58', 1, '2021-01-03 16:47:58', 1, 0);
INSERT INTO `sys_log` VALUES (253, 'root', '2021-01-03 16:48:00', '127.0.0.1', '/api/resources/role/51', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:47:59', 1, '2021-01-03 16:47:59', 1, 0);
INSERT INTO `sys_log` VALUES (254, 'root', '2021-01-03 16:48:03', '127.0.0.1', '/api/resources/role/51', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:02', 1, '2021-01-03 16:48:02', 1, 0);
INSERT INTO `sys_log` VALUES (255, 'root', '2021-01-03 16:48:03', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 8, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:02', 1, '2021-01-03 16:48:02', 1, 0);
INSERT INTO `sys_log` VALUES (256, 'root', '2021-01-03 16:48:04', '127.0.0.1', '/api/resources/role/57', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:03', 1, '2021-01-03 16:48:03', 1, 0);
INSERT INTO `sys_log` VALUES (257, 'root', '2021-01-03 16:48:06', '127.0.0.1', '/api/resources/role/57', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:06', 1, '2021-01-03 16:48:06', 1, 0);
INSERT INTO `sys_log` VALUES (258, 'root', '2021-01-03 16:48:06', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 7, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:06', 1, '2021-01-03 16:48:06', 1, 0);
INSERT INTO `sys_log` VALUES (259, 'root', '2021-01-03 16:48:07', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:07', 1, '2021-01-03 16:48:07', 1, 0);
INSERT INTO `sys_log` VALUES (260, 'root', '2021-01-03 16:48:09', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 9, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:08', 1, '2021-01-03 16:48:08', 1, 0);
INSERT INTO `sys_log` VALUES (261, 'root', '2021-01-03 16:48:11', '127.0.0.1', '/api/resources/role/44', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:10', 1, '2021-01-03 16:48:10', 1, 0);
INSERT INTO `sys_log` VALUES (262, 'root', '2021-01-03 16:48:11', '127.0.0.1', '/api/resources/role/44', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:11', 1, '2021-01-03 16:48:11', 1, 0);
INSERT INTO `sys_log` VALUES (263, 'root', '2021-01-03 16:48:11', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:11', 1, '2021-01-03 16:48:11', 1, 0);
INSERT INTO `sys_log` VALUES (264, 'root', '2021-01-03 16:48:12', '127.0.0.1', '/api/resources/role/49', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:12', 1, '2021-01-03 16:48:12', 1, 0);
INSERT INTO `sys_log` VALUES (265, 'root', '2021-01-03 16:48:18', '127.0.0.1', '/api/resources/role/49', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:17', 1, '2021-01-03 16:48:17', 1, 0);
INSERT INTO `sys_log` VALUES (266, 'root', '2021-01-03 16:48:18', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 9, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:17', 1, '2021-01-03 16:48:17', 1, 0);
INSERT INTO `sys_log` VALUES (267, 'root', '2021-01-03 16:48:18', '127.0.0.1', '/api/resources/role/55', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:18', 1, '2021-01-03 16:48:18', 1, 0);
INSERT INTO `sys_log` VALUES (268, 'root', '2021-01-03 16:48:19', '127.0.0.1', '/api/resources/role/55', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:19', 1, '2021-01-03 16:48:19', 1, 0);
INSERT INTO `sys_log` VALUES (269, 'root', '2021-01-03 16:48:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 9, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:19', 1, '2021-01-03 16:48:19', 1, 0);
INSERT INTO `sys_log` VALUES (270, 'root', '2021-01-03 16:48:20', '127.0.0.1', '/api/resources/role/58', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:20', 1, '2021-01-03 16:48:20', 1, 0);
INSERT INTO `sys_log` VALUES (271, 'root', '2021-01-03 16:48:21', '127.0.0.1', '/api/resources/role/58', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:21', 1, '2021-01-03 16:48:21', 1, 0);
INSERT INTO `sys_log` VALUES (272, 'root', '2021-01-03 16:48:21', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 9, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:21', 1, '2021-01-03 16:48:21', 1, 0);
INSERT INTO `sys_log` VALUES (273, 'root', '2021-01-03 16:48:23', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:22', 1, '2021-01-03 16:48:22', 1, 0);
INSERT INTO `sys_log` VALUES (274, 'root', '2021-01-03 16:48:24', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 8, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:24', 1, '2021-01-03 16:48:24', 1, 0);
INSERT INTO `sys_log` VALUES (275, 'root', '2021-01-03 16:48:39', '127.0.0.1', '/api/resources/role/52', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:39', 1, '2021-01-03 16:48:39', 1, 0);
INSERT INTO `sys_log` VALUES (276, 'root', '2021-01-03 16:48:40', '127.0.0.1', '/api/resources/role/52', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:40', 1, '2021-01-03 16:48:40', 1, 0);
INSERT INTO `sys_log` VALUES (277, 'root', '2021-01-03 16:48:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 8, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:40', 1, '2021-01-03 16:48:40', 1, 0);
INSERT INTO `sys_log` VALUES (278, 'root', '2021-01-03 16:48:41', '127.0.0.1', '/api/resources/role/59', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:48:40', 1, '2021-01-03 16:48:40', 1, 0);
INSERT INTO `sys_log` VALUES (279, 'root', '2021-01-03 16:48:41', '127.0.0.1', '/api/resources/role/59', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:48:41', 1, '2021-01-03 16:48:41', 1, 0);
INSERT INTO `sys_log` VALUES (280, 'root', '2021-01-03 16:48:41', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:41', 1, '2021-01-03 16:48:41', 1, 0);
INSERT INTO `sys_log` VALUES (281, 'root', '2021-01-03 16:48:51', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:48:51', 1, '2021-01-03 16:48:51', 1, 0);
INSERT INTO `sys_log` VALUES (282, 'root', '2021-01-03 16:49:09', '127.0.0.1', '/api/resources/role/43', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:09', 1, '2021-01-03 16:49:09', 1, 0);
INSERT INTO `sys_log` VALUES (283, 'root', '2021-01-03 16:49:10', '127.0.0.1', '/api/resources/role/43', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:10', 1, '2021-01-03 16:49:10', 1, 0);
INSERT INTO `sys_log` VALUES (284, 'root', '2021-01-03 16:49:10', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:10', 1, '2021-01-03 16:49:10', 1, 0);
INSERT INTO `sys_log` VALUES (285, 'root', '2021-01-03 16:49:18', '127.0.0.1', '/api/resources/role/29', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:17', 1, '2021-01-03 16:49:17', 1, 0);
INSERT INTO `sys_log` VALUES (286, 'root', '2021-01-03 16:49:18', '127.0.0.1', '/api/resources/role/29', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:18', 1, '2021-01-03 16:49:18', 1, 0);
INSERT INTO `sys_log` VALUES (287, 'root', '2021-01-03 16:49:18', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:18', 1, '2021-01-03 16:49:18', 1, 0);
INSERT INTO `sys_log` VALUES (288, 'root', '2021-01-03 16:49:19', '127.0.0.1', '/api/resources/role/19', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:19', 1, '2021-01-03 16:49:19', 1, 0);
INSERT INTO `sys_log` VALUES (289, 'root', '2021-01-03 16:49:20', '127.0.0.1', '/api/resources/role/19', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:19', 1, '2021-01-03 16:49:19', 1, 0);
INSERT INTO `sys_log` VALUES (290, 'root', '2021-01-03 16:49:20', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 9, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:19', 1, '2021-01-03 16:49:19', 1, 0);
INSERT INTO `sys_log` VALUES (291, 'root', '2021-01-03 16:49:28', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:28', 1, '2021-01-03 16:49:28', 1, 0);
INSERT INTO `sys_log` VALUES (292, 'root', '2021-01-03 16:49:35', '127.0.0.1', '/api/resources/role/10', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:35', 1, '2021-01-03 16:49:35', 1, 0);
INSERT INTO `sys_log` VALUES (293, 'root', '2021-01-03 16:49:36', '127.0.0.1', '/api/resources/role/10', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:35', 1, '2021-01-03 16:49:35', 1, 0);
INSERT INTO `sys_log` VALUES (294, 'root', '2021-01-03 16:49:36', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:35', 1, '2021-01-03 16:49:35', 1, 0);
INSERT INTO `sys_log` VALUES (295, 'root', '2021-01-03 16:49:37', '127.0.0.1', '/api/resources/role/11', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:37', 1, '2021-01-03 16:49:37', 1, 0);
INSERT INTO `sys_log` VALUES (296, 'root', '2021-01-03 16:49:38', '127.0.0.1', '/api/resources/role/11', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:37', 1, '2021-01-03 16:49:37', 1, 0);
INSERT INTO `sys_log` VALUES (297, 'root', '2021-01-03 16:49:38', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:37', 1, '2021-01-03 16:49:37', 1, 0);
INSERT INTO `sys_log` VALUES (298, 'root', '2021-01-03 16:49:39', '127.0.0.1', '/api/resources/role/12', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:39', 1, '2021-01-03 16:49:39', 1, 0);
INSERT INTO `sys_log` VALUES (299, 'root', '2021-01-03 16:49:40', '127.0.0.1', '/api/resources/role/12', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:39', 1, '2021-01-03 16:49:39', 1, 0);
INSERT INTO `sys_log` VALUES (300, 'root', '2021-01-03 16:49:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:39', 1, '2021-01-03 16:49:39', 1, 0);
INSERT INTO `sys_log` VALUES (301, 'root', '2021-01-03 16:49:43', '127.0.0.1', '/api/resources/role/13', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:43', 1, '2021-01-03 16:49:43', 1, 0);
INSERT INTO `sys_log` VALUES (302, 'root', '2021-01-03 16:49:56', '127.0.0.1', '/api/resources/role/16', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:55', 1, '2021-01-03 16:49:55', 1, 0);
INSERT INTO `sys_log` VALUES (303, 'root', '2021-01-03 16:49:56', '127.0.0.1', '/api/resources/role/16', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:56', 1, '2021-01-03 16:49:56', 1, 0);
INSERT INTO `sys_log` VALUES (304, 'root', '2021-01-03 16:49:56', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:56', 1, '2021-01-03 16:49:56', 1, 0);
INSERT INTO `sys_log` VALUES (305, 'root', '2021-01-03 16:49:58', '127.0.0.1', '/api/resources/role/17', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:49:57', 1, '2021-01-03 16:49:57', 1, 0);
INSERT INTO `sys_log` VALUES (306, 'root', '2021-01-03 16:49:59', '127.0.0.1', '/api/resources/role/17', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:49:58', 1, '2021-01-03 16:49:58', 1, 0);
INSERT INTO `sys_log` VALUES (307, 'root', '2021-01-03 16:49:59', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:49:58', 1, '2021-01-03 16:49:58', 1, 0);
INSERT INTO `sys_log` VALUES (308, 'root', '2021-01-03 16:50:01', '127.0.0.1', '/api/resources/role/18', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:01', 1, '2021-01-03 16:50:01', 1, 0);
INSERT INTO `sys_log` VALUES (309, 'root', '2021-01-03 16:50:02', '127.0.0.1', '/api/resources/role/18', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:02', 1, '2021-01-03 16:50:02', 1, 0);
INSERT INTO `sys_log` VALUES (310, 'root', '2021-01-03 16:50:02', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:02', 1, '2021-01-03 16:50:02', 1, 0);
INSERT INTO `sys_log` VALUES (311, 'root', '2021-01-03 16:50:08', '127.0.0.1', '/api/resources/role/18', 'DELETE', 'class com.zero.sys.controller.ResourcesController.deleteResourcesRole', 6, '删除系统资源角色', NULL, NULL, '2021-01-03 16:50:08', 1, '2021-01-03 16:50:08', 1, 0);
INSERT INTO `sys_log` VALUES (312, 'root', '2021-01-03 16:50:08', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:08', 1, '2021-01-03 16:50:08', 1, 0);
INSERT INTO `sys_log` VALUES (313, 'root', '2021-01-03 16:50:10', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 7, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:09', 1, '2021-01-03 16:50:09', 1, 0);
INSERT INTO `sys_log` VALUES (314, 'root', '2021-01-03 16:50:31', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 17, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:31', 1, '2021-01-03 16:50:31', 1, 0);
INSERT INTO `sys_log` VALUES (315, 'root', '2021-01-03 16:50:38', '127.0.0.1', '/api/resources/role/30', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:38', 1, '2021-01-03 16:50:38', 1, 0);
INSERT INTO `sys_log` VALUES (316, 'root', '2021-01-03 16:50:40', '127.0.0.1', '/api/resources/role/30', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:39', 1, '2021-01-03 16:50:39', 1, 0);
INSERT INTO `sys_log` VALUES (317, 'root', '2021-01-03 16:50:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 18, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:39', 1, '2021-01-03 16:50:39', 1, 0);
INSERT INTO `sys_log` VALUES (318, 'root', '2021-01-03 16:50:41', '127.0.0.1', '/api/resources/role/34', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:40', 1, '2021-01-03 16:50:40', 1, 0);
INSERT INTO `sys_log` VALUES (319, 'root', '2021-01-03 16:50:41', '127.0.0.1', '/api/resources/role/34', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:41', 1, '2021-01-03 16:50:41', 1, 0);
INSERT INTO `sys_log` VALUES (320, 'root', '2021-01-03 16:50:41', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 18, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:41', 1, '2021-01-03 16:50:41', 1, 0);
INSERT INTO `sys_log` VALUES (321, 'root', '2021-01-03 16:50:42', '127.0.0.1', '/api/resources/role/35', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:41', 1, '2021-01-03 16:50:41', 1, 0);
INSERT INTO `sys_log` VALUES (322, 'root', '2021-01-03 16:50:43', '127.0.0.1', '/api/resources/role/35', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:42', 1, '2021-01-03 16:50:42', 1, 0);
INSERT INTO `sys_log` VALUES (323, 'root', '2021-01-03 16:50:44', '127.0.0.1', '/api/resources/role/35', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:43', 1, '2021-01-03 16:50:43', 1, 0);
INSERT INTO `sys_log` VALUES (324, 'root', '2021-01-03 16:50:47', '127.0.0.1', '/api/resources/role/35', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:47', 1, '2021-01-03 16:50:47', 1, 0);
INSERT INTO `sys_log` VALUES (325, 'root', '2021-01-03 16:50:47', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:47', 1, '2021-01-03 16:50:47', 1, 0);
INSERT INTO `sys_log` VALUES (326, 'root', '2021-01-03 16:50:48', '127.0.0.1', '/api/resources/role/36', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:47', 1, '2021-01-03 16:50:47', 1, 0);
INSERT INTO `sys_log` VALUES (327, 'root', '2021-01-03 16:50:49', '127.0.0.1', '/api/resources/role/36', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:48', 1, '2021-01-03 16:50:48', 1, 0);
INSERT INTO `sys_log` VALUES (328, 'root', '2021-01-03 16:50:49', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:48', 1, '2021-01-03 16:50:48', 1, 0);
INSERT INTO `sys_log` VALUES (329, 'root', '2021-01-03 16:50:53', '127.0.0.1', '/api/resources/role/37', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:50:53', 1, '2021-01-03 16:50:53', 1, 0);
INSERT INTO `sys_log` VALUES (330, 'root', '2021-01-03 16:50:54', '127.0.0.1', '/api/resources/role/37', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:50:53', 1, '2021-01-03 16:50:53', 1, 0);
INSERT INTO `sys_log` VALUES (331, 'root', '2021-01-03 16:50:54', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 17, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:53', 1, '2021-01-03 16:50:53', 1, 0);
INSERT INTO `sys_log` VALUES (332, 'root', '2021-01-03 16:50:55', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:50:55', 1, '2021-01-03 16:50:55', 1, 0);
INSERT INTO `sys_log` VALUES (333, 'root', '2021-01-03 16:51:01', '127.0.0.1', '/api/resources/role/40', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:00', 1, '2021-01-03 16:51:00', 1, 0);
INSERT INTO `sys_log` VALUES (334, 'root', '2021-01-03 16:51:01', '127.0.0.1', '/api/resources/role/40', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:01', 1, '2021-01-03 16:51:01', 1, 0);
INSERT INTO `sys_log` VALUES (335, 'root', '2021-01-03 16:51:02', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:01', 1, '2021-01-03 16:51:01', 1, 0);
INSERT INTO `sys_log` VALUES (336, 'root', '2021-01-03 16:51:04', '127.0.0.1', '/api/resources/role/41', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:04', 1, '2021-01-03 16:51:04', 1, 0);
INSERT INTO `sys_log` VALUES (337, 'root', '2021-01-03 16:51:05', '127.0.0.1', '/api/resources/role/41', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:04', 1, '2021-01-03 16:51:04', 1, 0);
INSERT INTO `sys_log` VALUES (338, 'root', '2021-01-03 16:51:05', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:04', 1, '2021-01-03 16:51:04', 1, 0);
INSERT INTO `sys_log` VALUES (339, 'root', '2021-01-03 16:51:07', '127.0.0.1', '/api/resources/role/42', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:06', 1, '2021-01-03 16:51:06', 1, 0);
INSERT INTO `sys_log` VALUES (340, 'root', '2021-01-03 16:51:07', '127.0.0.1', '/api/resources/role/42', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:07', 1, '2021-01-03 16:51:07', 1, 0);
INSERT INTO `sys_log` VALUES (341, 'root', '2021-01-03 16:51:07', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:07', 1, '2021-01-03 16:51:07', 1, 0);
INSERT INTO `sys_log` VALUES (342, 'root', '2021-01-03 16:51:15', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:15', 1, '2021-01-03 16:51:15', 1, 0);
INSERT INTO `sys_log` VALUES (343, 'root', '2021-01-03 16:51:21', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:21', 1, '2021-01-03 16:51:21', 1, 0);
INSERT INTO `sys_log` VALUES (344, 'root', '2021-01-03 16:51:30', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 13, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:29', 1, '2021-01-03 16:51:29', 1, 0);
INSERT INTO `sys_log` VALUES (345, 'root', '2021-01-03 16:51:32', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 11, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:32', 1, '2021-01-03 16:51:32', 1, 0);
INSERT INTO `sys_log` VALUES (346, 'root', '2021-01-03 16:51:34', '127.0.0.1', '/api/resources/role/63', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:34', 1, '2021-01-03 16:51:34', 1, 0);
INSERT INTO `sys_log` VALUES (347, 'root', '2021-01-03 16:51:38', '127.0.0.1', '/api/resources/role/3', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:37', 1, '2021-01-03 16:51:37', 1, 0);
INSERT INTO `sys_log` VALUES (348, 'root', '2021-01-03 16:51:38', '127.0.0.1', '/api/resources/role/3', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:38', 1, '2021-01-03 16:51:38', 1, 0);
INSERT INTO `sys_log` VALUES (349, 'root', '2021-01-03 16:51:38', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 10, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:38', 1, '2021-01-03 16:51:38', 1, 0);
INSERT INTO `sys_log` VALUES (350, 'root', '2021-01-03 16:51:47', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:46', 1, '2021-01-03 16:51:46', 1, 0);
INSERT INTO `sys_log` VALUES (351, 'root', '2021-01-03 16:51:50', '127.0.0.1', '/api/resources/role/23', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:50', 1, '2021-01-03 16:51:50', 1, 0);
INSERT INTO `sys_log` VALUES (352, 'root', '2021-01-03 16:51:51', '127.0.0.1', '/api/resources/role/23', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:51', 1, '2021-01-03 16:51:51', 1, 0);
INSERT INTO `sys_log` VALUES (353, 'root', '2021-01-03 16:51:51', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:51', 1, '2021-01-03 16:51:51', 1, 0);
INSERT INTO `sys_log` VALUES (354, 'root', '2021-01-03 16:51:54', '127.0.0.1', '/api/resources/role/24', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:51:54', 1, '2021-01-03 16:51:54', 1, 0);
INSERT INTO `sys_log` VALUES (355, 'root', '2021-01-03 16:51:55', '127.0.0.1', '/api/resources/role/24', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:51:54', 1, '2021-01-03 16:51:54', 1, 0);
INSERT INTO `sys_log` VALUES (356, 'root', '2021-01-03 16:51:55', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 18, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:54', 1, '2021-01-03 16:51:54', 1, 0);
INSERT INTO `sys_log` VALUES (357, 'root', '2021-01-03 16:51:56', '127.0.0.1', '/api/resources/role/24', 'DELETE', 'class com.zero.sys.controller.ResourcesController.deleteResourcesRole', 4, '删除系统资源角色', NULL, NULL, '2021-01-03 16:51:56', 1, '2021-01-03 16:51:56', 1, 0);
INSERT INTO `sys_log` VALUES (358, 'root', '2021-01-03 16:51:57', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:51:56', 1, '2021-01-03 16:51:56', 1, 0);
INSERT INTO `sys_log` VALUES (359, 'root', '2021-01-03 16:52:02', '127.0.0.1', '/api/resources/role/27', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:01', 1, '2021-01-03 16:52:01', 1, 0);
INSERT INTO `sys_log` VALUES (360, 'root', '2021-01-03 16:52:02', '127.0.0.1', '/api/resources/role/27', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:02', 1, '2021-01-03 16:52:02', 1, 0);
INSERT INTO `sys_log` VALUES (361, 'root', '2021-01-03 16:52:02', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:02', 1, '2021-01-03 16:52:02', 1, 0);
INSERT INTO `sys_log` VALUES (362, 'root', '2021-01-03 16:52:04', '127.0.0.1', '/api/resources/role/28', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:03', 1, '2021-01-03 16:52:03', 1, 0);
INSERT INTO `sys_log` VALUES (363, 'root', '2021-01-03 16:52:07', '127.0.0.1', '/api/resources/role/28', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:06', 1, '2021-01-03 16:52:06', 1, 0);
INSERT INTO `sys_log` VALUES (364, 'root', '2021-01-03 16:52:07', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:06', 1, '2021-01-03 16:52:06', 1, 0);
INSERT INTO `sys_log` VALUES (365, 'root', '2021-01-03 16:52:21', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 5, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:21', 1, '2021-01-03 16:52:21', 1, 0);
INSERT INTO `sys_log` VALUES (366, 'root', '2021-01-03 16:52:23', '127.0.0.1', '/api/resources/role/33', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:23', 1, '2021-01-03 16:52:23', 1, 0);
INSERT INTO `sys_log` VALUES (367, 'root', '2021-01-03 16:52:30', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 11, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:30', 1, '2021-01-03 16:52:30', 1, 0);
INSERT INTO `sys_log` VALUES (368, 'root', '2021-01-03 16:52:33', '127.0.0.1', '/api/resources/role/1', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:32', 1, '2021-01-03 16:52:32', 1, 0);
INSERT INTO `sys_log` VALUES (369, 'root', '2021-01-03 16:52:34', '127.0.0.1', '/api/resources/role/1', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:33', 1, '2021-01-03 16:52:33', 1, 0);
INSERT INTO `sys_log` VALUES (370, 'root', '2021-01-03 16:52:34', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:33', 1, '2021-01-03 16:52:33', 1, 0);
INSERT INTO `sys_log` VALUES (371, 'root', '2021-01-03 16:52:37', '127.0.0.1', '/api/resources/role/2', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:36', 1, '2021-01-03 16:52:36', 1, 0);
INSERT INTO `sys_log` VALUES (372, 'root', '2021-01-03 16:52:38', '127.0.0.1', '/api/resources/role/2', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:37', 1, '2021-01-03 16:52:37', 1, 0);
INSERT INTO `sys_log` VALUES (373, 'root', '2021-01-03 16:52:38', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:37', 1, '2021-01-03 16:52:37', 1, 0);
INSERT INTO `sys_log` VALUES (374, 'root', '2021-01-03 16:52:43', '127.0.0.1', '/api/resources/role/6', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:43', 1, '2021-01-03 16:52:43', 1, 0);
INSERT INTO `sys_log` VALUES (375, 'root', '2021-01-03 16:52:44', '127.0.0.1', '/api/resources/role/6', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:43', 1, '2021-01-03 16:52:43', 1, 0);
INSERT INTO `sys_log` VALUES (376, 'root', '2021-01-03 16:52:44', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:43', 1, '2021-01-03 16:52:43', 1, 0);
INSERT INTO `sys_log` VALUES (377, 'root', '2021-01-03 16:52:48', '127.0.0.1', '/api/resources/role/9', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:52:48', 1, '2021-01-03 16:52:48', 1, 0);
INSERT INTO `sys_log` VALUES (378, 'root', '2021-01-03 16:52:49', '127.0.0.1', '/api/resources/role/9', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:52:48', 1, '2021-01-03 16:52:48', 1, 0);
INSERT INTO `sys_log` VALUES (379, 'root', '2021-01-03 16:52:49', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:52:48', 1, '2021-01-03 16:52:48', 1, 0);
INSERT INTO `sys_log` VALUES (380, 'root', '2021-01-03 16:53:03', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:53:02', 1, '2021-01-03 16:53:02', 1, 0);
INSERT INTO `sys_log` VALUES (381, 'root', '2021-01-03 16:53:04', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:53:04', 1, '2021-01-03 16:53:04', 1, 0);
INSERT INTO `sys_log` VALUES (382, 'root', '2021-01-03 16:53:05', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:53:05', 1, '2021-01-03 16:53:05', 1, 0);
INSERT INTO `sys_log` VALUES (383, 'root', '2021-01-03 16:53:06', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:53:06', 1, '2021-01-03 16:53:06', 1, 0);
INSERT INTO `sys_log` VALUES (384, 'root', '2021-01-03 16:53:07', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:53:06', 1, '2021-01-03 16:53:06', 1, 0);
INSERT INTO `sys_log` VALUES (385, 'user', '2021-01-03 16:53:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:53:29', 22, '2021-01-03 16:53:29', 22, 0);
INSERT INTO `sys_log` VALUES (386, 'user', '2021-01-03 16:53:30', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 1, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:53:29', 22, '2021-01-03 16:53:29', 22, 0);
INSERT INTO `sys_log` VALUES (387, 'user', '2021-01-03 16:53:37', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 15, '分页查询用户数据', NULL, NULL, '2021-01-03 16:53:37', 22, '2021-01-03 16:53:37', 22, 0);
INSERT INTO `sys_log` VALUES (388, 'user', '2021-01-03 16:53:39', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 4, '分页查询角色数据', NULL, NULL, '2021-01-03 16:53:39', 22, '2021-01-03 16:53:39', 22, 0);
INSERT INTO `sys_log` VALUES (389, 'user', '2021-01-03 16:53:48', '127.0.0.1', '/api/role/3', 'DELETE', 'class com.zero.sys.controller.RoleController.deleteById', 6, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:53:47', 22, '2021-01-03 16:53:47', 22, 0);
INSERT INTO `sys_log` VALUES (390, 'user', '2021-01-03 16:53:48', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 5, '分页查询角色数据', NULL, NULL, '2021-01-03 16:53:48', 22, '2021-01-03 16:53:48', 22, 0);
INSERT INTO `sys_log` VALUES (391, 'user', '2021-01-03 16:53:53', '127.0.0.1', '/api/role/1', 'DELETE', 'class com.zero.sys.controller.RoleController.deleteById', 5, '[通用方法]通过主键删除一条对应实体类的数据库记录', 'com.zero.common.exception.MyException', NULL, '2021-01-03 16:53:52', 22, '2021-01-03 16:53:52', 22, 0);
INSERT INTO `sys_log` VALUES (392, 'user', '2021-01-03 16:53:55', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 5, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:53:55', 22, '2021-01-03 16:53:55', 22, 0);
INSERT INTO `sys_log` VALUES (393, 'user', '2021-01-03 16:53:58', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 4, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:53:57', 22, '2021-01-03 16:53:57', 22, 0);
INSERT INTO `sys_log` VALUES (394, 'user', '2021-01-03 16:53:59', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 4, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:53:58', 22, '2021-01-03 16:53:58', 22, 0);
INSERT INTO `sys_log` VALUES (395, 'root', '2021-01-03 16:54:06', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:54:05', 1, '2021-01-03 16:54:05', 1, 0);
INSERT INTO `sys_log` VALUES (396, 'root', '2021-01-03 16:54:07', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 6, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:54:07', 1, '2021-01-03 16:54:07', 1, 0);
INSERT INTO `sys_log` VALUES (397, 'root', '2021-01-03 16:54:09', '127.0.0.1', '/api/resources/role/39', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:54:09', 1, '2021-01-03 16:54:09', 1, 0);
INSERT INTO `sys_log` VALUES (398, 'root', '2021-01-03 16:54:12', '127.0.0.1', '/api/resources/role/39', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:54:11', 1, '2021-01-03 16:54:11', 1, 0);
INSERT INTO `sys_log` VALUES (399, 'root', '2021-01-03 16:54:16', '127.0.0.1', '/api/resources/role/39', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:54:15', 1, '2021-01-03 16:54:15', 1, 0);
INSERT INTO `sys_log` VALUES (400, 'root', '2021-01-03 16:54:44', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 4, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:54:44', 1, '2021-01-03 16:54:44', 1, 0);
INSERT INTO `sys_log` VALUES (401, 'user', '2021-01-03 16:54:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:54:48', 22, '2021-01-03 16:54:48', 22, 0);
INSERT INTO `sys_log` VALUES (402, 'user', '2021-01-03 16:54:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:54:48', 22, '2021-01-03 16:54:48', 22, 0);
INSERT INTO `sys_log` VALUES (403, 'user', '2021-01-03 16:54:49', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 1, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:54:48', 22, '2021-01-03 16:54:48', 22, 0);
INSERT INTO `sys_log` VALUES (404, 'user', '2021-01-03 16:54:49', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 4, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:54:49', 22, '2021-01-03 16:54:49', 22, 0);
INSERT INTO `sys_log` VALUES (405, 'user', '2021-01-03 16:54:53', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 3, '分页查询角色数据', NULL, NULL, '2021-01-03 16:54:52', 22, '2021-01-03 16:54:52', 22, 0);
INSERT INTO `sys_log` VALUES (406, 'user', '2021-01-03 16:54:55', '127.0.0.1', '/api/role/3', 'DELETE', 'class com.zero.sys.controller.RoleController.deleteById', 9, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:54:54', 22, '2021-01-03 16:54:54', 22, 0);
INSERT INTO `sys_log` VALUES (407, 'user', '2021-01-03 16:54:55', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 6, '分页查询角色数据', NULL, NULL, '2021-01-03 16:54:54', 22, '2021-01-03 16:54:54', 22, 0);
INSERT INTO `sys_log` VALUES (408, 'root', '2021-01-03 16:55:00', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 3, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:54:59', 1, '2021-01-03 16:54:59', 1, 0);
INSERT INTO `sys_log` VALUES (409, 'root', '2021-01-03 16:55:01', '127.0.0.1', '/api/role/recover/3', 'PUT', 'class com.zero.sys.controller.RoleController.recover', 4, '通过主键恢复逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:55:00', 1, '2021-01-03 16:55:00', 1, 0);
INSERT INTO `sys_log` VALUES (410, 'root', '2021-01-03 16:55:01', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 3, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:55:00', 1, '2021-01-03 16:55:00', 1, 0);
INSERT INTO `sys_log` VALUES (411, 'user', '2021-01-03 16:55:04', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:55:04', 22, '2021-01-03 16:55:04', 22, 0);
INSERT INTO `sys_log` VALUES (412, 'user', '2021-01-03 16:55:04', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:55:04', 22, '2021-01-03 16:55:04', 22, 0);
INSERT INTO `sys_log` VALUES (413, 'user', '2021-01-03 16:55:04', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 1, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:55:04', 22, '2021-01-03 16:55:04', 22, 0);
INSERT INTO `sys_log` VALUES (414, 'user', '2021-01-03 16:55:05', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 3, '分页查询角色数据', NULL, NULL, '2021-01-03 16:55:04', 22, '2021-01-03 16:55:04', 22, 0);
INSERT INTO `sys_log` VALUES (415, 'root', '2021-01-03 16:55:08', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 13, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:08', 1, '2021-01-03 16:55:08', 1, 0);
INSERT INTO `sys_log` VALUES (416, 'user', '2021-01-03 16:55:14', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:14', 22, '2021-01-03 16:55:14', 22, 0);
INSERT INTO `sys_log` VALUES (417, 'user', '2021-01-03 16:55:15', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 24, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:55:15', 22, '2021-01-03 16:55:15', 22, 0);
INSERT INTO `sys_log` VALUES (418, 'user', '2021-01-03 16:55:21', '127.0.0.1', '/api/menu/role/2', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 3, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:55:20', 22, '2021-01-03 16:55:20', 22, 0);
INSERT INTO `sys_log` VALUES (419, 'user', '2021-01-03 16:55:25', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:24', 22, '2021-01-03 16:55:24', 22, 0);
INSERT INTO `sys_log` VALUES (420, 'user', '2021-01-03 16:55:26', '127.0.0.1', '/api/resources/role/4', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:55:25', 22, '2021-01-03 16:55:25', 22, 0);
INSERT INTO `sys_log` VALUES (421, 'user', '2021-01-03 16:55:27', '127.0.0.1', '/api/resources/role/4', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 5, '添加系统资源角色', NULL, NULL, '2021-01-03 16:55:26', 22, '2021-01-03 16:55:26', 22, 0);
INSERT INTO `sys_log` VALUES (422, 'user', '2021-01-03 16:55:27', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 11, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:26', 22, '2021-01-03 16:55:26', 22, 0);
INSERT INTO `sys_log` VALUES (423, 'user', '2021-01-03 16:55:31', '127.0.0.1', '/api/resources/role/4', 'DELETE', 'class com.zero.sys.controller.ResourcesController.deleteResourcesRole', 4, '删除系统资源角色', NULL, NULL, '2021-01-03 16:55:30', 22, '2021-01-03 16:55:30', 22, 0);
INSERT INTO `sys_log` VALUES (424, 'user', '2021-01-03 16:55:31', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:30', 22, '2021-01-03 16:55:30', 22, 0);
INSERT INTO `sys_log` VALUES (425, 'root', '2021-01-03 16:55:36', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:36', 1, '2021-01-03 16:55:36', 1, 0);
INSERT INTO `sys_log` VALUES (426, 'root', '2021-01-03 16:55:43', '127.0.0.1', '/api/resources/role/28', 'DELETE', 'class com.zero.sys.controller.ResourcesController.deleteResourcesRole', 7, '删除系统资源角色', NULL, NULL, '2021-01-03 16:55:42', 1, '2021-01-03 16:55:42', 1, 0);
INSERT INTO `sys_log` VALUES (427, 'root', '2021-01-03 16:55:43', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 14, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:55:42', 1, '2021-01-03 16:55:42', 1, 0);
INSERT INTO `sys_log` VALUES (428, 'user', '2021-01-03 16:55:47', '127.0.0.1', '/api/resources/role/4', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:55:46', 22, '2021-01-03 16:55:46', 22, 0);
INSERT INTO `sys_log` VALUES (429, 'user', '2021-01-03 16:55:54', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 33, '分页查询系统菜单表数据', NULL, NULL, '2021-01-03 16:55:54', 22, '2021-01-03 16:55:54', 22, 0);
INSERT INTO `sys_log` VALUES (430, 'user', '2021-01-03 16:55:55', '127.0.0.1', '/api/menu/role/9', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 2, '获取该菜单未拥有的角色', NULL, NULL, '2021-01-03 16:55:55', 22, '2021-01-03 16:55:55', 22, 0);
INSERT INTO `sys_log` VALUES (431, 'user', '2021-01-03 16:55:59', '127.0.0.1', '/api/menu/enabled/9', 'PUT', 'class com.zero.sys.controller.MenuController.enabled', 16, '启用或者禁用一个菜单', NULL, NULL, '2021-01-03 16:55:58', 22, '2021-01-03 16:55:58', 22, 0);
INSERT INTO `sys_log` VALUES (432, 'user', '2021-01-03 16:55:59', '127.0.0.1', '/api/menu/enabled/9', 'PUT', 'class com.zero.sys.controller.MenuController.enabled', 5, '启用或者禁用一个菜单', NULL, NULL, '2021-01-03 16:55:59', 22, '2021-01-03 16:55:59', 22, 0);
INSERT INTO `sys_log` VALUES (433, 'root', '2021-01-03 16:56:12', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 5, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:12', 1, '2021-01-03 16:56:12', 1, 0);
INSERT INTO `sys_log` VALUES (434, 'root', '2021-01-03 16:56:16', '127.0.0.1', '/api/resources/role/60', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:56:15', 1, '2021-01-03 16:56:15', 1, 0);
INSERT INTO `sys_log` VALUES (435, 'root', '2021-01-03 16:56:17', '127.0.0.1', '/api/resources/role/60', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:56:16', 1, '2021-01-03 16:56:16', 1, 0);
INSERT INTO `sys_log` VALUES (436, 'root', '2021-01-03 16:56:17', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 7, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:16', 1, '2021-01-03 16:56:16', 1, 0);
INSERT INTO `sys_log` VALUES (437, 'root', '2021-01-03 16:56:18', '127.0.0.1', '/api/resources/role/61', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:56:17', 1, '2021-01-03 16:56:17', 1, 0);
INSERT INTO `sys_log` VALUES (438, 'root', '2021-01-03 16:56:18', '127.0.0.1', '/api/resources/role/61', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:56:18', 1, '2021-01-03 16:56:18', 1, 0);
INSERT INTO `sys_log` VALUES (439, 'root', '2021-01-03 16:56:18', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 8, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:18', 1, '2021-01-03 16:56:18', 1, 0);
INSERT INTO `sys_log` VALUES (440, 'user', '2021-01-03 16:56:22', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:56:21', 22, '2021-01-03 16:56:21', 22, 0);
INSERT INTO `sys_log` VALUES (441, 'user', '2021-01-03 16:56:22', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 16:56:21', 22, '2021-01-03 16:56:21', 22, 0);
INSERT INTO `sys_log` VALUES (442, 'user', '2021-01-03 16:56:22', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 2, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 16:56:21', 22, '2021-01-03 16:56:21', 22, 0);
INSERT INTO `sys_log` VALUES (443, 'user', '2021-01-03 16:56:28', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 5, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:28', 22, '2021-01-03 16:56:28', 22, 0);
INSERT INTO `sys_log` VALUES (444, 'user', '2021-01-03 16:56:31', '127.0.0.1', '/api/log/6', 'DELETE', 'class com.zero.sys.controller.LogController.deleteById', 6, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:56:31', 22, '2021-01-03 16:56:31', 22, 0);
INSERT INTO `sys_log` VALUES (445, 'user', '2021-01-03 16:56:31', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 12, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:31', 22, '2021-01-03 16:56:31', 22, 0);
INSERT INTO `sys_log` VALUES (446, 'user', '2021-01-03 16:56:35', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 6, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:34', 22, '2021-01-03 16:56:34', 22, 0);
INSERT INTO `sys_log` VALUES (447, 'user', '2021-01-03 16:56:36', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 5, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:35', 22, '2021-01-03 16:56:35', 22, 0);
INSERT INTO `sys_log` VALUES (448, 'root', '2021-01-03 16:56:43', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 7, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:43', 1, '2021-01-03 16:56:43', 1, 0);
INSERT INTO `sys_log` VALUES (449, 'root', '2021-01-03 16:56:45', '127.0.0.1', '/api/log/recover/6', 'PUT', 'class com.zero.sys.controller.LogController.recover', 4, '通过主键恢复逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:44', 1, '2021-01-03 16:56:44', 1, 0);
INSERT INTO `sys_log` VALUES (450, 'root', '2021-01-03 16:56:45', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 5, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:56:44', 1, '2021-01-03 16:56:44', 1, 0);
INSERT INTO `sys_log` VALUES (451, 'root', '2021-01-03 16:56:49', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 16, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:49', 1, '2021-01-03 16:56:49', 1, 0);
INSERT INTO `sys_log` VALUES (452, 'root', '2021-01-03 16:56:52', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:52', 1, '2021-01-03 16:56:52', 1, 0);
INSERT INTO `sys_log` VALUES (453, 'root', '2021-01-03 16:56:54', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 6, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:53', 1, '2021-01-03 16:56:53', 1, 0);
INSERT INTO `sys_log` VALUES (454, 'root', '2021-01-03 16:56:55', '127.0.0.1', '/api/resources/role/5', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:56:55', 1, '2021-01-03 16:56:55', 1, 0);
INSERT INTO `sys_log` VALUES (455, 'root', '2021-01-03 16:56:56', '127.0.0.1', '/api/resources/role/5', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:56:56', 1, '2021-01-03 16:56:56', 1, 0);
INSERT INTO `sys_log` VALUES (456, 'root', '2021-01-03 16:56:56', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 8, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:56:56', 1, '2021-01-03 16:56:56', 1, 0);
INSERT INTO `sys_log` VALUES (457, 'root', '2021-01-03 16:57:03', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 11, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:57:02', 1, '2021-01-03 16:57:02', 1, 0);
INSERT INTO `sys_log` VALUES (458, 'root', '2021-01-03 16:57:07', '127.0.0.1', '/api/resources/role/39', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:57:06', 1, '2021-01-03 16:57:06', 1, 0);
INSERT INTO `sys_log` VALUES (459, 'root', '2021-01-03 16:57:07', '127.0.0.1', '/api/resources/role/39', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:57:07', 1, '2021-01-03 16:57:07', 1, 0);
INSERT INTO `sys_log` VALUES (460, 'root', '2021-01-03 16:57:08', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 12, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:57:07', 1, '2021-01-03 16:57:07', 1, 0);
INSERT INTO `sys_log` VALUES (461, 'root', '2021-01-03 16:57:08', '127.0.0.1', '/api/resources/role/65', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:57:08', 1, '2021-01-03 16:57:08', 1, 0);
INSERT INTO `sys_log` VALUES (462, 'user', '2021-01-03 16:57:21', '127.0.0.1', '/api/user/check/password', 'GET', 'class com.zero.sys.controller.UserController.checkPassword', 123, '检测用户密码是否正确', NULL, NULL, '2021-01-03 16:57:21', 22, '2021-01-03 16:57:21', 22, 0);
INSERT INTO `sys_log` VALUES (463, 'user', '2021-01-03 16:57:27', '127.0.0.1', '/api/user/check/password', 'GET', 'class com.zero.sys.controller.UserController.checkPassword', 153, '检测用户密码是否正确', NULL, NULL, '2021-01-03 16:57:26', 22, '2021-01-03 16:57:26', 22, 0);
INSERT INTO `sys_log` VALUES (464, 'root', '2021-01-03 16:57:42', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 6, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:57:42', 1, '2021-01-03 16:57:42', 1, 0);
INSERT INTO `sys_log` VALUES (465, 'root', '2021-01-03 16:58:02', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 5, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:02', 1, '2021-01-03 16:58:02', 1, 0);
INSERT INTO `sys_log` VALUES (466, 'root', '2021-01-03 16:58:11', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 7, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:10', 1, '2021-01-03 16:58:10', 1, 0);
INSERT INTO `sys_log` VALUES (467, 'root', '2021-01-03 16:58:24', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:24', 1, '2021-01-03 16:58:24', 1, 0);
INSERT INTO `sys_log` VALUES (468, 'root', '2021-01-03 16:58:26', '127.0.0.1', '/api/resources/role/62', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:58:26', 1, '2021-01-03 16:58:26', 1, 0);
INSERT INTO `sys_log` VALUES (469, 'root', '2021-01-03 16:58:27', '127.0.0.1', '/api/resources/role/62', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 4, '添加系统资源角色', NULL, NULL, '2021-01-03 16:58:26', 1, '2021-01-03 16:58:26', 1, 0);
INSERT INTO `sys_log` VALUES (470, 'root', '2021-01-03 16:58:27', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:26', 1, '2021-01-03 16:58:26', 1, 0);
INSERT INTO `sys_log` VALUES (471, 'root', '2021-01-03 16:58:33', '127.0.0.1', '/api/resources/role/68', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:58:32', 1, '2021-01-03 16:58:32', 1, 0);
INSERT INTO `sys_log` VALUES (472, 'root', '2021-01-03 16:58:34', '127.0.0.1', '/api/resources/role/68', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:58:33', 1, '2021-01-03 16:58:33', 1, 0);
INSERT INTO `sys_log` VALUES (473, 'root', '2021-01-03 16:58:34', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:33', 1, '2021-01-03 16:58:33', 1, 0);
INSERT INTO `sys_log` VALUES (474, 'root', '2021-01-03 16:58:34', '127.0.0.1', '/api/resources/role/69', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 3, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:58:34', 1, '2021-01-03 16:58:34', 1, 0);
INSERT INTO `sys_log` VALUES (475, 'root', '2021-01-03 16:58:35', '127.0.0.1', '/api/resources/role/69', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 6, '添加系统资源角色', NULL, NULL, '2021-01-03 16:58:35', 1, '2021-01-03 16:58:35', 1, 0);
INSERT INTO `sys_log` VALUES (476, 'root', '2021-01-03 16:58:35', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 17, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:35', 1, '2021-01-03 16:58:35', 1, 0);
INSERT INTO `sys_log` VALUES (477, 'root', '2021-01-03 16:58:39', '127.0.0.1', '/api/resources/role/66', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:58:38', 1, '2021-01-03 16:58:38', 1, 0);
INSERT INTO `sys_log` VALUES (478, 'root', '2021-01-03 16:58:39', '127.0.0.1', '/api/resources/role/66', 'POST', 'class com.zero.sys.controller.ResourcesController.addResourcesRole', 7, '添加系统资源角色', NULL, NULL, '2021-01-03 16:58:39', 1, '2021-01-03 16:58:39', 1, 0);
INSERT INTO `sys_log` VALUES (479, 'root', '2021-01-03 16:58:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 15, '分页查询系统资源数据', NULL, NULL, '2021-01-03 16:58:39', 1, '2021-01-03 16:58:39', 1, 0);
INSERT INTO `sys_log` VALUES (480, 'root', '2021-01-03 16:58:43', '127.0.0.1', '/api/resources/role/70', 'GET', 'class com.zero.sys.controller.ResourcesController.getResourcesNotRoleList', 2, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-03 16:58:43', 1, '2021-01-03 16:58:43', 1, 0);
INSERT INTO `sys_log` VALUES (481, 'user', '2021-01-03 16:58:55', '127.0.0.1', '/api/table/info/not/list', 'GET', 'class com.zero.code.generation.controller.TableInfoController.getNotAddList', 11, '获取还没有插入数据库中的数据库表信息', NULL, NULL, '2021-01-03 16:58:55', 22, '2021-01-03 16:58:55', 22, 0);
INSERT INTO `sys_log` VALUES (482, 'user', '2021-01-03 16:59:36', '127.0.0.1', '/api/table/info', 'POST', 'class com.zero.code.generation.controller.TableInfoController.save', 46, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `sys_log` VALUES (483, 'user', '2021-01-03 16:59:36', '127.0.0.1', '/api/table/info/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.page', 4, '分页查询系统数据库表信息数据', NULL, NULL, '2021-01-03 16:59:36', 22, '2021-01-03 16:59:36', 22, 0);
INSERT INTO `sys_log` VALUES (484, 'user', '2021-01-03 16:59:56', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 3, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 16:59:55', 22, '2021-01-03 16:59:55', 22, 0);
INSERT INTO `sys_log` VALUES (485, 'user', '2021-01-03 16:59:57', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.sys.controller.RoleController.recoverPage', 2, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-01-03 16:59:56', 22, '2021-01-03 16:59:56', 22, 0);
INSERT INTO `sys_log` VALUES (486, 'user', '2021-01-03 16:59:58', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', 6, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-01-03 16:59:58', 22, '2021-01-03 16:59:58', 22, 0);
INSERT INTO `sys_log` VALUES (487, 'root', '2021-01-03 17:00:04', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 21, '分页查询用户数据', NULL, NULL, '2021-01-03 17:00:03', 1, '2021-01-03 17:00:03', 1, 0);
INSERT INTO `sys_log` VALUES (488, 'root', '2021-01-03 17:00:06', '127.0.0.1', '/api/user/10', 'DELETE', 'class com.zero.sys.controller.UserController.deleteById', 8, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 17:00:06', 1, '2021-01-03 17:00:06', 1, 0);
INSERT INTO `sys_log` VALUES (489, 'root', '2021-01-03 17:00:06', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-03 17:00:06', 1, '2021-01-03 17:00:06', 1, 0);
INSERT INTO `sys_log` VALUES (490, 'user', '2021-01-03 17:00:09', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 5, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:09', 22, '2021-01-03 17:00:09', 22, 0);
INSERT INTO `sys_log` VALUES (491, 'user', '2021-01-03 17:00:11', '127.0.0.1', '/api/user/recover/10', 'PUT', 'class com.zero.sys.controller.UserController.recover', 5, '通过主键恢复逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:10', 22, '2021-01-03 17:00:10', 22, 0);
INSERT INTO `sys_log` VALUES (492, 'user', '2021-01-03 17:00:11', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 2, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:10', 22, '2021-01-03 17:00:10', 22, 0);
INSERT INTO `sys_log` VALUES (493, 'root', '2021-01-03 17:00:15', '127.0.0.1', '/api/user/11', 'DELETE', 'class com.zero.sys.controller.UserController.deleteById', 5, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-03 17:00:15', 1, '2021-01-03 17:00:15', 1, 0);
INSERT INTO `sys_log` VALUES (494, 'root', '2021-01-03 17:00:15', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 18, '分页查询用户数据', NULL, NULL, '2021-01-03 17:00:15', 1, '2021-01-03 17:00:15', 1, 0);
INSERT INTO `sys_log` VALUES (495, 'user', '2021-01-03 17:00:19', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 14, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 17:00:18', 22, '2021-01-03 17:00:18', 22, 0);
INSERT INTO `sys_log` VALUES (496, 'user', '2021-01-03 17:00:19', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-03 17:00:18', 22, '2021-01-03 17:00:18', 22, 0);
INSERT INTO `sys_log` VALUES (497, 'user', '2021-01-03 17:00:19', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserController.info', 1, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-03 17:00:18', 22, '2021-01-03 17:00:18', 22, 0);
INSERT INTO `sys_log` VALUES (498, 'user', '2021-01-03 17:00:19', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 5, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:19', 22, '2021-01-03 17:00:19', 22, 0);
INSERT INTO `sys_log` VALUES (499, 'user', '2021-01-03 17:00:27', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 5, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:27', 22, '2021-01-03 17:00:27', 22, 0);
INSERT INTO `sys_log` VALUES (500, 'user', '2021-01-03 17:00:28', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 4, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:27', 22, '2021-01-03 17:00:27', 22, 0);
INSERT INTO `sys_log` VALUES (501, 'user', '2021-01-03 17:00:30', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 6, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:29', 22, '2021-01-03 17:00:29', 22, 0);
INSERT INTO `sys_log` VALUES (502, 'user', '2021-01-03 17:00:31', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 5, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:30', 22, '2021-01-03 17:00:30', 22, 0);
INSERT INTO `sys_log` VALUES (503, 'user', '2021-01-03 17:00:31', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 5, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-03 17:00:31', 22, '2021-01-03 17:00:31', 22, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单路由路径',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单模块名称',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单模块路径',
  `meta_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `meta_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单图标',
  `redirect` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级菜单定向路由路径',
  `sort` int(11) NOT NULL COMMENT '菜单排序',
  `enabled` tinyint(1) NOT NULL COMMENT '菜单是否启用，0(false)为禁用，1(true)为启用',
  `parent_id` int(11) NOT NULL COMMENT '父级菜单主键，如果为顶级菜单，值为0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '/data', 'Data', 'Layout', '数据管理', 'el-icon-s-help', '/data/user', 1, 1, 0, '2020-11-15 23:25:21', 0, '2020-12-01 20:59:37', 1, 0);
INSERT INTO `sys_menu` VALUES (2, 'user', 'User', 'data/user/index', '用户管理', 'el-icon-user', NULL, 1, 1, 1, '2020-11-15 23:28:06', 0, '2020-12-29 22:10:21', 1, 0);
INSERT INTO `sys_menu` VALUES (3, 'role', 'Role', 'data/role/index', '角色管理', 'el-icon-discount', NULL, 2, 1, 1, '2020-11-17 23:32:23', 0, '2020-11-22 23:00:48', 1, 0);
INSERT INTO `sys_menu` VALUES (4, 'resources', 'Resources', 'data/resources/index', '资源管理', 'el-icon-star-on', NULL, 3, 1, 1, '2020-11-17 23:53:50', 0, '2020-11-22 23:06:12', 1, 0);
INSERT INTO `sys_menu` VALUES (5, 'menu', 'Menu', 'data/menu/index', '菜单管理', 'el-icon-guide', NULL, 4, 1, 1, '2020-11-17 23:54:27', 0, '2020-11-22 23:00:49', 1, 0);
INSERT INTO `sys_menu` VALUES (6, '/system', 'System', 'Layout', '系统监控', 'el-icon-view', '/system/server', 2, 1, 0, '2020-11-17 23:56:14', 0, '2020-12-01 20:59:55', 1, 0);
INSERT INTO `sys_menu` VALUES (7, 'server', 'Server', 'system/server/index', '服务器监控', 'el-icon-monitor', NULL, 1, 1, 6, '2020-11-17 23:57:27', 0, '2020-11-22 23:00:45', 1, 0);
INSERT INTO `sys_menu` VALUES (8, 'log', 'Log', 'system/log/index', '日志管理', 'el-icon-tickets', NULL, 2, 1, 6, '2020-11-17 23:58:00', 0, '2020-11-22 23:00:49', 1, 0);
INSERT INTO `sys_menu` VALUES (9, '/development', 'Development', 'Layout', '系统开发', 'el-icon-monitor', '/development/code-generation', 5, 1, 0, '2020-11-17 23:59:02', 0, '2021-01-03 16:55:59', 22, 0);
INSERT INTO `sys_menu` VALUES (10, 'code-generation', 'CodeGeneration', 'development/code-generation/index', '代码生成', 'el-icon-refresh-right', NULL, 1, 1, 9, '2020-11-17 23:59:58', 0, '2020-12-01 22:18:16', 1, 0);
INSERT INTO `sys_menu` VALUES (11, 'http://127.0.0.1:10000/api/swagger-ui.html', 'Swagger2', '', '项目文档', 'el-icon-notebook-2', NULL, 2, 1, 9, '2020-11-18 00:03:34', 0, '2020-12-28 20:40:23', 1, 0);
INSERT INTO `sys_menu` VALUES (12, '/recover', 'Recover', 'Layout', '回收站', 'el-icon-delete-solid', '/recover/user', 4, 1, 0, '2020-11-29 22:13:02', 1, '2020-12-28 20:50:58', 1, 0);
INSERT INTO `sys_menu` VALUES (13, 'user', 'User', 'recover/user/index', '用户数据', 'el-icon-user-solid', NULL, 1, 1, 12, '2020-11-29 22:16:53', 1, '2020-11-29 22:17:57', 1, 0);
INSERT INTO `sys_menu` VALUES (14, 'role', 'Role', 'recover/role/index', '角色数据', 'el-icon-price-tag', NULL, 2, 1, 12, '2020-11-30 22:32:29', 1, '2020-11-30 22:33:42', 1, 0);
INSERT INTO `sys_menu` VALUES (15, 'resources', 'Resources', 'recover/resources/index', '资源数据', 'el-icon-star-off', NULL, 3, 1, 12, '2020-12-01 19:46:53', 1, '2020-12-01 19:47:54', 1, 0);
INSERT INTO `sys_menu` VALUES (16, 'menu', 'Menu', 'recover/menu/index', '菜单数据', 'el-icon-guide', NULL, 4, 1, 12, '2020-12-01 20:39:18', 1, '2020-12-01 20:40:04', 1, 0);
INSERT INTO `sys_menu` VALUES (17, 'log', 'Log', 'recover/log/index', '日志数据', 'el-icon-tickets', NULL, 5, 1, 12, '2020-12-01 22:36:03', 1, '2020-12-01 22:36:55', 1, 0);
INSERT INTO `sys_menu` VALUES (18, 'code-generation', 'CodeGeneration', 'recover/code-generation/index', '数据库表数据', 'el-icon-refresh-right', NULL, 6, 1, 12, '2020-12-01 22:45:52', 1, '2020-12-01 22:46:40', 1, 0);
INSERT INTO `sys_menu` VALUES (19, '/setting', 'Setting', 'Layout', '系统设置', 'el-icon-setting', '/setting/password', 3, 1, 0, '2020-12-28 20:53:06', 1, '2020-12-28 20:53:49', 1, 0);
INSERT INTO `sys_menu` VALUES (20, 'password', 'Password', 'setting/password/index', '密码设置', 'el-icon-more-outline', NULL, 1, 1, 19, '2020-12-28 21:01:44', 1, '2020-12-28 21:02:45', 1, 0);

-- ----------------------------
-- Table structure for sys_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role`;
CREATE TABLE `sys_menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '菜单主键',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu_role
-- ----------------------------
INSERT INTO `sys_menu_role` VALUES (1, 1, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (2, 2, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (3, 3, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (4, 4, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (5, 5, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (6, 6, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (7, 7, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (8, 8, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (9, 9, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (10, 10, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (11, 11, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (12, 12, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (13, 13, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (14, 14, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (15, 15, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (16, 16, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (17, 17, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (18, 18, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (19, 19, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (20, 20, 1, '2021-01-03 16:24:29', 0, '2021-01-03 16:24:29', 0, 0);
INSERT INTO `sys_menu_role` VALUES (21, 1, 3, '2021-01-03 16:46:25', 1, '2021-01-03 16:46:25', 1, 0);
INSERT INTO `sys_menu_role` VALUES (22, 2, 3, '2021-01-03 16:46:28', 1, '2021-01-03 16:46:28', 1, 0);
INSERT INTO `sys_menu_role` VALUES (23, 3, 3, '2021-01-03 16:46:29', 1, '2021-01-03 16:46:29', 1, 0);
INSERT INTO `sys_menu_role` VALUES (24, 4, 3, '2021-01-03 16:46:31', 1, '2021-01-03 16:46:31', 1, 0);
INSERT INTO `sys_menu_role` VALUES (25, 5, 3, '2021-01-03 16:46:34', 1, '2021-01-03 16:46:34', 1, 0);
INSERT INTO `sys_menu_role` VALUES (26, 6, 3, '2021-01-03 16:46:37', 1, '2021-01-03 16:46:37', 1, 0);
INSERT INTO `sys_menu_role` VALUES (27, 7, 3, '2021-01-03 16:46:38', 1, '2021-01-03 16:46:38', 1, 0);
INSERT INTO `sys_menu_role` VALUES (28, 8, 3, '2021-01-03 16:46:39', 1, '2021-01-03 16:46:39', 1, 0);
INSERT INTO `sys_menu_role` VALUES (29, 19, 3, '2021-01-03 16:46:45', 1, '2021-01-03 16:46:45', 1, 0);
INSERT INTO `sys_menu_role` VALUES (30, 20, 3, '2021-01-03 16:46:46', 1, '2021-01-03 16:46:46', 1, 0);
INSERT INTO `sys_menu_role` VALUES (31, 12, 3, '2021-01-03 16:46:50', 1, '2021-01-03 16:46:50', 1, 0);
INSERT INTO `sys_menu_role` VALUES (32, 13, 3, '2021-01-03 16:46:51', 1, '2021-01-03 16:46:51', 1, 0);
INSERT INTO `sys_menu_role` VALUES (33, 14, 3, '2021-01-03 16:46:55', 1, '2021-01-03 16:46:55', 1, 0);
INSERT INTO `sys_menu_role` VALUES (34, 17, 3, '2021-01-03 16:47:00', 1, '2021-01-03 16:47:00', 1, 0);
INSERT INTO `sys_menu_role` VALUES (35, 9, 3, '2021-01-03 16:47:08', 1, '2021-01-03 16:47:08', 1, 0);
INSERT INTO `sys_menu_role` VALUES (36, 10, 3, '2021-01-03 16:47:10', 1, '2021-01-03 16:47:10', 1, 0);
INSERT INTO `sys_menu_role` VALUES (37, 11, 3, '2021-01-03 16:47:12', 1, '2021-01-03 16:47:12', 1, 0);

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源主键',
  `uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源定位符',
  `regex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正则匹配',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源描述信息',
  `method_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源方法类型：get/post/put/delete',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除0，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES (1, '/log/list', '^/log/list$', '查询所有的系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (2, '/log/page/{currentPage}', '^/log/page/[A-Za-z0-9]+$', '分页查询系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (3, '/log/recover/page/{currentPage}', '^/log/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (4, '/log/recover/{id}', '^/log/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条系统操作日志表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (5, '/log/recover/{id}', '^/log/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的系统操作日志表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (6, '/log/export/excel', '^/log/export/excel$', '导出操作日志列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (7, '/log', '^/log$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (8, '/log', '^/log$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (9, '/log/{id}', '^/log/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (10, '/menu/enabled/{id}', '^/menu/enabled/[A-Za-z0-9]+$', '启用或者禁用一个菜单', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (11, '/menu/page/{currentPage}', '^/menu/page/[A-Za-z0-9]+$', '分页查询系统菜单表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (12, '/menu/role/{menuId}', '^/menu/role/[A-Za-z0-9]+$', '获取该菜单未拥有的角色', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (13, '/menu/recover/page/{currentPage}', '^/menu/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的系统菜单表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (14, '/menu/recover/{id}', '^/menu/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条系统菜单表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (15, '/menu/recover/{id}', '^/menu/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的系统菜单表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (16, '/menu/routes', '^/menu/routes$', '[动态路由]获取所有启用的系统菜单', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (17, '/menu/export/excel', '^/menu/export/excel$', '导出系统菜单列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (18, '/menu/role/{menuId}', '^/menu/role/[A-Za-z0-9]+$', '添加菜单角色', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (19, '/menu/role/{menuId}', '^/menu/role/[A-Za-z0-9]+$', '删除菜单角色', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (20, '/menu', '^/menu$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (21, '/menu', '^/menu$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (22, '/menu/{id}', '^/menu/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (23, '/resources/page/{currentPage}', '^/resources/page/[A-Za-z0-9]+$', '分页查询系统资源数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (24, '/resources/recover/page/{currentPage}', '^/resources/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的系统资源表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (25, '/resources/recover/{id}', '^/resources/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条系统资源表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (26, '/resources/recover/{id}', '^/resources/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的系统资源表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (27, '/resources/export/excel', '^/resources/export/excel$', '导出系统资源列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (28, '/resources/role/{resourcesId}', '^/resources/role/[A-Za-z0-9]+$', '添加系统资源角色', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (29, '/resources/role/{resourcesId}', '^/resources/role/[A-Za-z0-9]+$', '删除系统资源角色', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (30, '/resources/role/{resourcesId}', '^/resources/role/[A-Za-z0-9]+$', '获取未拥有该系统资源的角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (31, '/resources', '^/resources$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (32, '/resources', '^/resources$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (33, '/resources/{id}', '^/resources/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (34, '/role/check/name', '^/role/check/name$', '检测角色名称是否已存在', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (35, '/role/list', '^/role/list$', '获取所有的用户角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (36, '/role/page/{currentPage}', '^/role/page/[A-Za-z0-9]+$', '分页查询角色数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (37, '/role/recover/page/{currentPage}', '^/role/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的系统角色表数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (38, '/role/recover/{id}', '^/role/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条系统角色表数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (39, '/role/recover/{id}', '^/role/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的系统角色表数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (40, '/role/export/excel', '^/role/export/excel$', '导出角色列表数据的Excel文件', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (41, '/role', '^/role$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (42, '/role', '^/role$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (43, '/role/{id}', '^/role/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (44, '/user/enabled/{id}', '^/user/enabled/[A-Za-z0-9]+$', '启用或者禁用一个用户账号', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (45, '/user/info', '^/user/info$', '获取请求头上的accessToken，并根据accessToken返回用户信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (46, '/user/page/{currentPage}', '^/user/page/[A-Za-z0-9]+$', '分页查询用户数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (47, '/user/recover/page/{currentPage}', '^/user/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的用户数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (48, '/user/recover/{id}', '^/user/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条用户数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (49, '/user/recover/{id}', '^/user/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的用户数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (50, '/user/export/excel', '^/user/export/excel$', '导出用户列表数据的Excel文件', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (51, '/user/role/{userId}', '^/user/role/[A-Za-z0-9]+$', '添加用户角色', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (52, '/user/role/{userId}', '^/user/role/[A-Za-z0-9]+$', '删除用户角色', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (53, '/user/check/password', '^/user/check/password$', '检测用户密码是否正确', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (54, '/user/check/username', '^/user/check/username$', '检测用户名是否已存在', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (55, '/user/reset/password', '^/user/reset/password$', '重置用户账号密码', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (56, '/user/role/{userId}', '^/user/role/[A-Za-z0-9]+$', '获取该用户未拥有的角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (57, '/user', '^/user$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (58, '/user', '^/user$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (59, '/user/{id}', '^/user/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (60, '/server/info', '^/server/info$', '获取系统服务器的监控信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (61, '/server/piechart', '^/server/piechart$', '获取系统服务器的CPU，内存，JVM饼图信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (62, '/table/info/page/{currentPage}', '^/table/info/page/[A-Za-z0-9]+$', '分页查询系统数据库表信息数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (63, '/table/info/recover/page/{currentPage}', '^/table/info/recover/page/[A-Za-z0-9]+$', '分页查询逻辑删除的系统数据库表信息表数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (64, '/table/info/recover/{id}', '^/table/info/recover/[A-Za-z0-9]+$', '通过主键彻底删除一条系统数据库表信息表数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (65, '/table/info/recover/{id}', '^/table/info/recover/[A-Za-z0-9]+$', '通过主键恢复逻辑删除的系统数据库表信息表数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (66, '/table/info/not/list', '^/table/info/not/list$', '获取还没有插入数据库中的数据库表信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (67, '/table/info/code/generation/{id}', '^/table/info/code/generation/[A-Za-z0-9]+$', '生成代码', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (68, '/table/info', '^/table/info$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (69, '/table/info', '^/table/info$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (70, '/table/info/{id}', '^/table/info/[A-Za-z0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);

-- ----------------------------
-- Table structure for sys_resources_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources_role`;
CREATE TABLE `sys_resources_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resources_id` int(11) NOT NULL COMMENT '资源主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resources_role
-- ----------------------------
INSERT INTO `sys_resources_role` VALUES (1, 1, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (2, 2, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (3, 3, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (4, 4, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (5, 5, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (6, 6, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (7, 7, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (8, 8, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (9, 9, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (10, 10, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (11, 11, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (12, 12, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (13, 13, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (14, 14, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (15, 15, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (16, 16, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (17, 17, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (18, 18, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (19, 19, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (20, 20, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (21, 21, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (22, 22, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (23, 23, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (24, 24, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (25, 25, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (26, 26, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (27, 27, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (28, 28, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (29, 29, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (30, 30, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (31, 31, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (32, 32, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (33, 33, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (34, 34, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (35, 35, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (36, 36, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (37, 37, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (38, 38, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (39, 39, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (40, 40, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (41, 41, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (42, 42, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (43, 43, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (44, 44, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (45, 45, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (46, 46, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (47, 47, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (48, 48, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (49, 49, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (50, 50, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (51, 51, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (52, 52, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (53, 53, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (54, 54, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (55, 55, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (56, 56, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (57, 57, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (58, 58, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (59, 59, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (60, 60, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (61, 61, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (62, 62, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (63, 63, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (64, 64, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (65, 65, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (66, 66, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (67, 67, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (68, 68, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (69, 69, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (70, 70, 1, '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources_role` VALUES (71, 45, 3, '2021-01-03 16:47:37', 1, '2021-01-03 16:47:37', 1, 0);
INSERT INTO `sys_resources_role` VALUES (72, 46, 3, '2021-01-03 16:47:39', 1, '2021-01-03 16:47:39', 1, 0);
INSERT INTO `sys_resources_role` VALUES (73, 47, 3, '2021-01-03 16:47:41', 1, '2021-01-03 16:47:41', 1, 0);
INSERT INTO `sys_resources_role` VALUES (74, 50, 3, '2021-01-03 16:47:43', 1, '2021-01-03 16:47:43', 1, 0);
INSERT INTO `sys_resources_role` VALUES (75, 53, 3, '2021-01-03 16:47:45', 1, '2021-01-03 16:47:45', 1, 0);
INSERT INTO `sys_resources_role` VALUES (76, 54, 3, '2021-01-03 16:47:46', 1, '2021-01-03 16:47:46', 1, 0);
INSERT INTO `sys_resources_role` VALUES (77, 56, 3, '2021-01-03 16:47:48', 1, '2021-01-03 16:47:48', 1, 0);
INSERT INTO `sys_resources_role` VALUES (78, 51, 3, '2021-01-03 16:48:02', 1, '2021-01-03 16:48:02', 1, 0);
INSERT INTO `sys_resources_role` VALUES (79, 57, 3, '2021-01-03 16:48:06', 1, '2021-01-03 16:48:06', 1, 0);
INSERT INTO `sys_resources_role` VALUES (80, 44, 3, '2021-01-03 16:48:11', 1, '2021-01-03 16:48:11', 1, 0);
INSERT INTO `sys_resources_role` VALUES (81, 49, 3, '2021-01-03 16:48:17', 1, '2021-01-03 16:48:17', 1, 0);
INSERT INTO `sys_resources_role` VALUES (82, 55, 3, '2021-01-03 16:48:19', 1, '2021-01-03 16:48:19', 1, 0);
INSERT INTO `sys_resources_role` VALUES (83, 58, 3, '2021-01-03 16:48:21', 1, '2021-01-03 16:48:21', 1, 0);
INSERT INTO `sys_resources_role` VALUES (84, 52, 3, '2021-01-03 16:48:40', 1, '2021-01-03 16:48:40', 1, 0);
INSERT INTO `sys_resources_role` VALUES (85, 59, 3, '2021-01-03 16:48:41', 1, '2021-01-03 16:48:41', 1, 0);
INSERT INTO `sys_resources_role` VALUES (86, 43, 3, '2021-01-03 16:49:10', 1, '2021-01-03 16:49:10', 1, 0);
INSERT INTO `sys_resources_role` VALUES (87, 29, 3, '2021-01-03 16:49:18', 1, '2021-01-03 16:49:18', 1, 0);
INSERT INTO `sys_resources_role` VALUES (88, 19, 3, '2021-01-03 16:49:19', 1, '2021-01-03 16:49:19', 1, 0);
INSERT INTO `sys_resources_role` VALUES (89, 10, 3, '2021-01-03 16:49:35', 1, '2021-01-03 16:49:35', 1, 0);
INSERT INTO `sys_resources_role` VALUES (90, 11, 3, '2021-01-03 16:49:37', 1, '2021-01-03 16:49:37', 1, 0);
INSERT INTO `sys_resources_role` VALUES (91, 12, 3, '2021-01-03 16:49:39', 1, '2021-01-03 16:49:39', 1, 0);
INSERT INTO `sys_resources_role` VALUES (92, 16, 3, '2021-01-03 16:49:56', 1, '2021-01-03 16:49:56', 1, 0);
INSERT INTO `sys_resources_role` VALUES (93, 17, 3, '2021-01-03 16:49:58', 1, '2021-01-03 16:49:58', 1, 0);
INSERT INTO `sys_resources_role` VALUES (95, 30, 3, '2021-01-03 16:50:39', 1, '2021-01-03 16:50:39', 1, 0);
INSERT INTO `sys_resources_role` VALUES (96, 34, 3, '2021-01-03 16:50:41', 1, '2021-01-03 16:50:41', 1, 0);
INSERT INTO `sys_resources_role` VALUES (97, 35, 3, '2021-01-03 16:50:47', 1, '2021-01-03 16:50:47', 1, 0);
INSERT INTO `sys_resources_role` VALUES (98, 36, 3, '2021-01-03 16:50:48', 1, '2021-01-03 16:50:48', 1, 0);
INSERT INTO `sys_resources_role` VALUES (99, 37, 3, '2021-01-03 16:50:53', 1, '2021-01-03 16:50:53', 1, 0);
INSERT INTO `sys_resources_role` VALUES (100, 40, 3, '2021-01-03 16:51:01', 1, '2021-01-03 16:51:01', 1, 0);
INSERT INTO `sys_resources_role` VALUES (101, 41, 3, '2021-01-03 16:51:04', 1, '2021-01-03 16:51:04', 1, 0);
INSERT INTO `sys_resources_role` VALUES (102, 42, 3, '2021-01-03 16:51:07', 1, '2021-01-03 16:51:07', 1, 0);
INSERT INTO `sys_resources_role` VALUES (103, 3, 3, '2021-01-03 16:51:38', 1, '2021-01-03 16:51:38', 1, 0);
INSERT INTO `sys_resources_role` VALUES (104, 23, 3, '2021-01-03 16:51:51', 1, '2021-01-03 16:51:51', 1, 0);
INSERT INTO `sys_resources_role` VALUES (106, 27, 3, '2021-01-03 16:52:02', 1, '2021-01-03 16:52:02', 1, 0);
INSERT INTO `sys_resources_role` VALUES (108, 1, 3, '2021-01-03 16:52:33', 1, '2021-01-03 16:52:33', 1, 0);
INSERT INTO `sys_resources_role` VALUES (109, 2, 3, '2021-01-03 16:52:37', 1, '2021-01-03 16:52:37', 1, 0);
INSERT INTO `sys_resources_role` VALUES (110, 6, 3, '2021-01-03 16:52:43', 1, '2021-01-03 16:52:43', 1, 0);
INSERT INTO `sys_resources_role` VALUES (111, 9, 3, '2021-01-03 16:52:48', 1, '2021-01-03 16:52:48', 1, 0);
INSERT INTO `sys_resources_role` VALUES (113, 60, 3, '2021-01-03 16:56:16', 1, '2021-01-03 16:56:16', 1, 0);
INSERT INTO `sys_resources_role` VALUES (114, 61, 3, '2021-01-03 16:56:18', 1, '2021-01-03 16:56:18', 1, 0);
INSERT INTO `sys_resources_role` VALUES (115, 5, 3, '2021-01-03 16:56:56', 1, '2021-01-03 16:56:56', 1, 0);
INSERT INTO `sys_resources_role` VALUES (116, 39, 3, '2021-01-03 16:57:07', 1, '2021-01-03 16:57:07', 1, 0);
INSERT INTO `sys_resources_role` VALUES (117, 62, 3, '2021-01-03 16:58:26', 1, '2021-01-03 16:58:26', 1, 0);
INSERT INTO `sys_resources_role` VALUES (118, 68, 3, '2021-01-03 16:58:33', 1, '2021-01-03 16:58:33', 1, 0);
INSERT INTO `sys_resources_role` VALUES (119, 69, 3, '2021-01-03 16:58:35', 1, '2021-01-03 16:58:35', 1, 0);
INSERT INTO `sys_resources_role` VALUES (120, 66, 3, '2021-01-03 16:58:39', 1, '2021-01-03 16:58:39', 1, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'root', 'root权限，系统的最高权限', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_role` VALUES (2, 'admin', 'admin权限，管理员权限', '2021-01-03 16:33:03', 0, '2021-01-03 16:33:03', 0, 0);
INSERT INTO `sys_role` VALUES (3, 'user', '普通用户权限', '2021-01-03 16:33:03', 0, '2021-01-03 16:55:00', 0, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '账号是否启用，1为启用，0为禁用，默认为1',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账号是否锁定，1为锁定，0为未锁定，默认为0',
  `account_expire` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账号是否过期，1为过期，0为未过期，默认为0',
  `password_expire` tinyint(1) NOT NULL DEFAULT 0 COMMENT '密码是否过期，1为过期，0为未过期，默认为0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '$2a$10$AdNpEjUSPLFby/aaYhhU2.oFWMAsLTOmTjLC6M4ZX/Y2ItqjmU5bG', 1, 0, 0, 0, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 1, 0);
INSERT INTO `sys_user` VALUES (2, '零', '$2a$10$6GrGe8lBkM.MmMV9n/YajeNvN4PkXQXe9gDE1nogdba.NwLuwmZD.', 1, 0, 0, 0, '2021-01-03 16:42:46', 1, '2021-01-03 16:42:46', 1, 0);
INSERT INTO `sys_user` VALUES (3, '天帝', '$2a$10$e.Y4r.QQXZckf8eFB6y87eHH3dPXtTXvfH5LKG1ZTK813vAuJMJz.', 1, 0, 0, 0, '2021-01-03 16:42:57', 1, '2021-01-03 16:42:57', 1, 0);
INSERT INTO `sys_user` VALUES (4, '彦', '$2a$10$FlKnHiSMRu85/25BOQefrOkYTWWyBAopKdhUPXUpHZQtOPSs9Ad96', 1, 0, 0, 0, '2021-01-03 16:43:06', 1, '2021-01-03 16:43:06', 1, 0);
INSERT INTO `sys_user` VALUES (5, '懒羊羊', '$2a$10$N4hAgrlRABuGK.3/0J69yeaUWv340ila6k2tx4qjL2PdzKZEmcP/e', 1, 0, 0, 0, '2021-01-03 16:43:13', 1, '2021-01-03 16:43:13', 1, 0);
INSERT INTO `sys_user` VALUES (6, '修罗铠甲', '$2a$10$UZXoiYBRG4Os/ti1S7gjwO/GQvJcEcgyysBNmGiomwf/6GqrBkYWe', 1, 0, 0, 0, '2021-01-03 16:43:20', 1, '2021-01-03 16:43:20', 1, 0);
INSERT INTO `sys_user` VALUES (7, '喜羊羊', '$2a$10$pudj.DG8Wf4elQ93uja2oeDcn2tmEmQfy/jE.Iqd5C0zWeNSynhZC', 1, 0, 0, 0, '2021-01-03 16:43:33', 1, '2021-01-03 16:43:33', 1, 0);
INSERT INTO `sys_user` VALUES (8, '凉冰', '$2a$10$BIVgfbbFsKWurdwHBKHb1.Go1sNpabrepk/QvUc9X.thB29Ayiv0q', 1, 0, 0, 0, '2021-01-03 16:43:41', 1, '2021-01-03 16:43:41', 1, 0);
INSERT INTO `sys_user` VALUES (9, '凯莎女王', '$2a$10$b9XEtxzl8aqQEakEhfS.2OPtzXYYtf6/zs28ubU1aTwY9XBR0CiLy', 1, 0, 0, 0, '2021-01-03 16:43:51', 1, '2021-01-03 16:43:51', 1, 0);
INSERT INTO `sys_user` VALUES (10, '鹤熙', '$2a$10$8d/WQLbfJaKL7OkqwelW1Ozlw4.yxQ8pUHqCB3/IRHoEcuEHR3A1e', 1, 0, 0, 0, '2021-01-03 16:43:59', 1, '2021-01-03 17:00:10', 1, 0);
INSERT INTO `sys_user` VALUES (11, '死神卡尔', '$2a$10$MLUeISaif04uuv5jAiPd8ueCbn0lrY93qN5jvgW9OpLdujfkJ8c.G', 1, 0, 0, 0, '2021-01-03 16:44:04', 1, '2021-01-03 17:00:15', 1, 1);
INSERT INTO `sys_user` VALUES (12, '帝蕾娜', '$2a$10$9ZO/HBssnV5msQnYbFtQ5.FcTptwd8OrUPxN2iZpMvlKjXAxucA2K', 1, 0, 0, 0, '2021-01-03 16:44:10', 1, '2021-01-03 16:44:10', 1, 0);
INSERT INTO `sys_user` VALUES (13, '刑天铠甲', '$2a$10$4ja34eHSYD/tcRWnTnIvyes65fVNi8.C.lkehtj/mNOpRf/KKr.zG', 1, 0, 0, 0, '2021-01-03 16:44:22', 1, '2021-01-03 16:44:22', 1, 0);
INSERT INTO `sys_user` VALUES (14, '飞影铠甲', '$2a$10$QrOo/We/XMZU15kxfa4VuepRxVxo5MLRSq8JiwNnPRMfp8VWCW0bm', 1, 0, 0, 0, '2021-01-03 16:44:28', 1, '2021-01-03 16:44:28', 1, 0);
INSERT INTO `sys_user` VALUES (15, '孙悟空', '$2a$10$5gWZzjkqApzkYhPvxbPInePeI0FQDM/3pz7tXYJ.kfjR.QjzLPJVC', 1, 0, 0, 0, '2021-01-03 16:44:41', 1, '2021-01-03 16:44:41', 1, 0);
INSERT INTO `sys_user` VALUES (16, '天下谁人不识君', '$2a$10$Lp2UxbvFcVLyKRKSJMNrLevvV7iXKXOnnKjH.WFQoUz6B0FXhIwxS', 1, 0, 0, 0, '2021-01-03 16:44:49', 1, '2021-01-03 16:44:49', 1, 0);
INSERT INTO `sys_user` VALUES (17, '泽塔奥特曼', '$2a$10$AgZq/IV4FLDS80/L8oIOE.lLNixxqZ/jNX7nxRJN/XqBIe2CV.D0e', 1, 0, 0, 0, '2021-01-03 16:44:56', 1, '2021-01-03 16:44:56', 1, 0);
INSERT INTO `sys_user` VALUES (18, '天使凯拉', '$2a$10$TJTPNg3nc0mRCYPb1BjbI.reLeQV.lzciSLsuWIrVk0nLNEFIketq', 1, 0, 0, 0, '2021-01-03 16:45:01', 1, '2021-01-03 16:45:01', 1, 0);
INSERT INTO `sys_user` VALUES (19, '波波', '$2a$10$ZdIhxbI1LA0BhkUtL8J4Xu9l.uQ/kRAcHDwOHZ.sVg1YvCRQ3SJUS', 1, 0, 0, 0, '2021-01-03 16:45:07', 1, '2021-01-03 16:45:07', 1, 0);
INSERT INTO `sys_user` VALUES (20, '刘老板', '$2a$10$HEgjCKoeghK2LUZi0qXHAelhThBrFTxOKwOVvICQowL.5thWjIJnW', 1, 0, 0, 0, '2021-01-03 16:45:15', 1, '2021-01-03 16:45:15', 1, 0);
INSERT INTO `sys_user` VALUES (21, '池总', '$2a$10$65KwSmFekUMmX9ZHydr24u0q9pMBjVMtCwf6eHk7/Vx9Es5HNwErq', 1, 0, 0, 0, '2021-01-03 16:45:33', 1, '2021-01-03 16:45:33', 1, 0);
INSERT INTO `sys_user` VALUES (22, 'user', '$2a$10$FZ.3l1pp1CM56bMQnqHQYeufFk1NTMLzHuQZ1oSj0OlguURbnoHUq', 1, 0, 0, 0, '2021-01-03 16:45:45', 1, '2021-01-03 16:45:45', 1, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_user_role` VALUES (2, 2, 3, '2021-01-03 16:42:48', 1, '2021-01-03 16:42:48', 1, 0);
INSERT INTO `sys_user_role` VALUES (3, 3, 3, '2021-01-03 16:42:58', 1, '2021-01-03 16:42:58', 1, 0);
INSERT INTO `sys_user_role` VALUES (4, 4, 3, '2021-01-03 16:43:23', 1, '2021-01-03 16:43:23', 1, 0);
INSERT INTO `sys_user_role` VALUES (5, 5, 3, '2021-01-03 16:43:25', 1, '2021-01-03 16:43:25', 1, 0);
INSERT INTO `sys_user_role` VALUES (6, 6, 3, '2021-01-03 16:43:26', 1, '2021-01-03 16:43:26', 1, 0);
INSERT INTO `sys_user_role` VALUES (7, 7, 3, '2021-01-03 16:43:35', 1, '2021-01-03 16:43:35', 1, 0);
INSERT INTO `sys_user_role` VALUES (8, 8, 3, '2021-01-03 16:43:43', 1, '2021-01-03 16:43:43', 1, 0);
INSERT INTO `sys_user_role` VALUES (9, 9, 3, '2021-01-03 16:43:53', 1, '2021-01-03 16:43:53', 1, 0);
INSERT INTO `sys_user_role` VALUES (10, 10, 3, '2021-01-03 16:44:12', 1, '2021-01-03 16:44:12', 1, 0);
INSERT INTO `sys_user_role` VALUES (11, 11, 3, '2021-01-03 16:44:14', 1, '2021-01-03 16:44:14', 1, 0);
INSERT INTO `sys_user_role` VALUES (12, 12, 3, '2021-01-03 16:44:16', 1, '2021-01-03 16:44:16', 1, 0);
INSERT INTO `sys_user_role` VALUES (13, 13, 3, '2021-01-03 16:44:29', 1, '2021-01-03 16:44:29', 1, 0);
INSERT INTO `sys_user_role` VALUES (14, 14, 3, '2021-01-03 16:44:31', 1, '2021-01-03 16:44:31', 1, 0);
INSERT INTO `sys_user_role` VALUES (15, 15, 3, '2021-01-03 16:44:43', 1, '2021-01-03 16:44:43', 1, 0);
INSERT INTO `sys_user_role` VALUES (16, 16, 3, '2021-01-03 16:45:16', 1, '2021-01-03 16:45:16', 1, 0);
INSERT INTO `sys_user_role` VALUES (17, 17, 3, '2021-01-03 16:45:18', 1, '2021-01-03 16:45:18', 1, 0);
INSERT INTO `sys_user_role` VALUES (18, 18, 3, '2021-01-03 16:45:19', 1, '2021-01-03 16:45:19', 1, 0);
INSERT INTO `sys_user_role` VALUES (19, 19, 3, '2021-01-03 16:45:20', 1, '2021-01-03 16:45:20', 1, 0);
INSERT INTO `sys_user_role` VALUES (20, 20, 3, '2021-01-03 16:45:22', 1, '2021-01-03 16:45:22', 1, 0);
INSERT INTO `sys_user_role` VALUES (21, 21, 3, '2021-01-03 16:45:36', 1, '2021-01-03 16:45:36', 1, 0);
INSERT INTO `sys_user_role` VALUES (22, 22, 3, '2021-01-03 16:45:47', 1, '2021-01-03 16:45:47', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
