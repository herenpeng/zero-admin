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

 Date: 03/02/2021 22:41:04
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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表字段信息表' ROW_FORMAT = Compact;

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
INSERT INTO `dev_table_column` VALUES (25, 'id', 'id', '主键', 'int(11)', 'INTEGER', 'Integer', 1, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (26, 'name', 'name', '用户姓名', 'varchar(50)', 'VARCHAR', 'String', 2, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (27, 'gender', 'gender', '用户性别，1（true）为男，0（false）为女', 'tinyint(1)', 'BOOLEAN', 'Boolean', 3, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (28, 'mobile', 'mobile', '用户手机号码', 'varchar(50)', 'VARCHAR', 'String', 4, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (29, 'mail', 'mail', '用户邮箱地址', 'varchar(50)', 'VARCHAR', 'String', 5, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (30, 'birthday', 'birthday', '用户出生日期', 'date', 'DATE', 'Date', 6, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (31, 'identity_number', 'identityNumber', '用户身份证号码', 'varchar(50)', 'VARCHAR', 'String', 7, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (32, 'qq', 'qq', '用户QQ号码', 'varchar(50)', 'VARCHAR', 'String', 8, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (33, 'we_chat', 'weChat', '用户微信号码', 'varchar(50)', 'VARCHAR', 'String', 9, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (34, 'avatar', 'avatar', '用户头像路径', 'varchar(500)', 'VARCHAR', 'String', 10, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (35, 'create_time', 'createTime', '数据库数据插入时间', 'datetime', 'TIMESTAMP', 'Date', 11, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (36, 'create_user_id', 'createUserId', '数据库数据插入用户主键', 'int(11)', 'INTEGER', 'Integer', 12, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (37, 'update_time', 'updateTime', '数据库数据更新时间', 'datetime', 'TIMESTAMP', 'Date', 13, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (38, 'update_user_id', 'updateUserId', '数据库数据更新用户主键', 'int(11)', 'INTEGER', 'Integer', 14, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (39, 'deleted', 'deleted', '逻辑删除标识，0为正常，1为逻辑删除，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 15, 3, '2021-01-12 22:19:55', 1, '2021-01-12 22:19:55', 1, 0);
INSERT INTO `dev_table_column` VALUES (63, 'id', 'id', '主键', 'int(11)', 'INTEGER', 'Integer', 1, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (64, 'name', 'name', '文件名称', 'varchar(255)', 'VARCHAR', 'String', 2, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (65, 'type', 'type', '文件类型', 'varchar(50)', 'VARCHAR', 'String', 3, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (66, 'uri', 'uri', '文件http引用路径', 'varchar(500)', 'VARCHAR', 'String', 4, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (67, 'path', 'path', '文件磁盘路径', 'varchar(500)', 'VARCHAR', 'String', 5, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (68, 'upload_time', 'uploadTime', '文件上传时间', 'datetime', 'TIMESTAMP', 'Date', 6, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (69, 'upload_user_id', 'uploadUserId', '文件上传用户主键', 'int(11)', 'INTEGER', 'Integer', 7, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (70, 'parent_id', 'parentId', '主文件主键，源文件为0，其他值为对应的备份文件', 'int(11)', 'INTEGER', 'Integer', 8, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (71, 'create_time', 'createTime', '数据库数据插入时间', 'datetime', 'TIMESTAMP', 'Date', 9, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (72, 'create_user_id', 'createUserId', '数据库数据插入用户主键', 'int(11)', 'INTEGER', 'Integer', 10, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (73, 'update_time', 'updateTime', '数据库数据更新时间', 'datetime', 'TIMESTAMP', 'Date', 11, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (74, 'update_user_id', 'updateUserId', '数据库数据更新用户主键', 'int(11)', 'INTEGER', 'Integer', 12, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);
INSERT INTO `dev_table_column` VALUES (75, 'deleted', 'deleted', '逻辑删除标识，0为正常，1为逻辑删除，默认为0', 'tinyint(1)', 'BOOLEAN', 'Boolean', 13, 6, '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dev_table_info
-- ----------------------------
INSERT INTO `dev_table_info` VALUES (1, 'sys_user', '系统用户表', 'User', 'com.zero.sys', 'G:\\temp', 'herenpeng', '2021-01-03 16:59:36', 22, '2021-01-09 22:47:40', 1, 0);
INSERT INTO `dev_table_info` VALUES (3, 'sys_user_info', '系统用户信息表', 'UserInfo', 'com.zero.sys', 'G:\\temp', 'herenpeng', '2021-01-12 22:19:55', 1, '2021-01-12 22:26:37', 1, 0);
INSERT INTO `dev_table_info` VALUES (6, 'upload_file_manage', '文件资源管理表', 'FileManage', 'com.zero.upload', 'F:\\IdeaCode\\zero-admin\\zero-upload', 'herenpeng', '2021-01-30 18:46:07', 1, '2021-01-30 18:46:07', 1, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `operation_user_id` int(11) NOT NULL COMMENT '操作日志用户主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2035 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1498, 1, '2021-01-30 22:53:47', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 37, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 22:53:47', 1, '2021-01-30 22:53:47', 1, 0);
INSERT INTO `sys_log` VALUES (1499, 1, '2021-01-30 22:53:48', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 30, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 22:53:47', 1, '2021-01-30 22:53:47', 1, 0);
INSERT INTO `sys_log` VALUES (1500, 1, '2021-01-30 22:53:53', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 18, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-30 22:53:53', 1, '2021-01-30 22:53:53', 1, 0);
INSERT INTO `sys_log` VALUES (1501, 1, '2021-01-30 22:53:56', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 41, '分页查询系统操作日志表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'queryLog.username != null and queryLog.username != \'\'\'. Cause: org.apache.ibatis.ognl.NoSuchPropertyException: com.zero.sys.entity.Log.username', '2021-01-30 22:53:56', 1, '2021-01-30 22:53:56', 1, 0);
INSERT INTO `sys_log` VALUES (1502, 1, '2021-01-30 22:59:56', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 135, '分页查询用户数据', NULL, NULL, '2021-01-30 22:59:56', 1, '2021-01-30 22:59:56', 1, 0);
INSERT INTO `sys_log` VALUES (1503, 1, '2021-01-30 23:01:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 38, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:01:12', 1, '2021-01-30 23:01:12', 1, 0);
INSERT INTO `sys_log` VALUES (1504, 1, '2021-01-30 23:01:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:01:12', 1, '2021-01-30 23:01:12', 1, 0);
INSERT INTO `sys_log` VALUES (1505, 1, '2021-01-30 23:01:13', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 7, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:01:12', 1, '2021-01-30 23:01:12', 1, 0);
INSERT INTO `sys_log` VALUES (1506, 1, '2021-01-30 23:03:09', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 125, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:03:09', 1, '2021-01-30 23:03:09', 1, 0);
INSERT INTO `sys_log` VALUES (1507, 1, '2021-01-30 23:03:10', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 258, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:03:09', 1, '2021-01-30 23:03:09', 1, 0);
INSERT INTO `sys_log` VALUES (1508, 1, '2021-01-30 23:03:10', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 7, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:03:09', 1, '2021-01-30 23:03:09', 1, 0);
INSERT INTO `sys_log` VALUES (1509, 1, '2021-01-30 23:03:47', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:03:47', 1, '2021-01-30 23:03:47', 1, 0);
INSERT INTO `sys_log` VALUES (1510, 1, '2021-01-30 23:03:47', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 14, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:03:47', 1, '2021-01-30 23:03:47', 1, 0);
INSERT INTO `sys_log` VALUES (1511, 1, '2021-01-30 23:03:47', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:03:47', 1, '2021-01-30 23:03:47', 1, 0);
INSERT INTO `sys_log` VALUES (1512, 1, '2021-01-30 23:03:48', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 39, '分页查询系统操作日志表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'queryLog.user.username != null and queryLog.user.username != \'\'\'. Cause: org.apache.ibatis.ognl.OgnlException: source is null for getProperty(null, \"username\")', '2021-01-30 23:03:47', 1, '2021-01-30 23:03:47', 1, 0);
INSERT INTO `sys_log` VALUES (1513, 1, '2021-01-30 23:04:02', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:04:02', 1, '2021-01-30 23:04:02', 1, 0);
INSERT INTO `sys_log` VALUES (1514, 1, '2021-01-30 23:04:08', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 23, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:04:07', 1, '2021-01-30 23:04:07', 1, 0);
INSERT INTO `sys_log` VALUES (1515, 1, '2021-01-30 23:04:08', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:04:07', 1, '2021-01-30 23:04:07', 1, 0);
INSERT INTO `sys_log` VALUES (1516, 1, '2021-01-30 23:04:09', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 4, '分页查询系统操作日志表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'queryLog.user.username != null and queryLog.user.username != \'\'\'. Cause: org.apache.ibatis.ognl.OgnlException: source is null for getProperty(null, \"username\")', '2021-01-30 23:04:08', 1, '2021-01-30 23:04:08', 1, 0);
INSERT INTO `sys_log` VALUES (1517, 1, '2021-01-30 23:08:17', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 54, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:08:17', 1, '2021-01-30 23:08:17', 1, 0);
INSERT INTO `sys_log` VALUES (1518, 1, '2021-01-30 23:08:18', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:08:17', 1, '2021-01-30 23:08:17', 1, 0);
INSERT INTO `sys_log` VALUES (1519, 1, '2021-01-30 23:08:18', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 14, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:08:17', 1, '2021-01-30 23:08:17', 1, 0);
INSERT INTO `sys_log` VALUES (1520, 1, '2021-01-30 23:08:18', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 58, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:08:18', 1, '2021-01-30 23:08:18', 1, 0);
INSERT INTO `sys_log` VALUES (1521, 1, '2021-01-30 23:09:00', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 24, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:09:00', 1, '2021-01-30 23:09:00', 1, 0);
INSERT INTO `sys_log` VALUES (1522, 1, '2021-01-30 23:09:00', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 21, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-30 23:09:00', 1, '2021-01-30 23:09:00', 1, 0);
INSERT INTO `sys_log` VALUES (1523, 1, '2021-01-30 23:09:00', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-30 23:09:00', 1, '2021-01-30 23:09:00', 1, 0);
INSERT INTO `sys_log` VALUES (1524, 1, '2021-01-30 23:09:01', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 17, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:09:01', 1, '2021-01-30 23:09:01', 1, 0);
INSERT INTO `sys_log` VALUES (1525, 1, '2021-01-30 23:09:04', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 16, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:09:04', 1, '2021-01-30 23:09:04', 1, 0);
INSERT INTO `sys_log` VALUES (1526, 1, '2021-01-30 23:09:08', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 13, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:09:07', 1, '2021-01-30 23:09:07', 1, 0);
INSERT INTO `sys_log` VALUES (1527, 1, '2021-01-30 23:14:48', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 28, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:14:48', 1, '2021-01-30 23:14:48', 1, 0);
INSERT INTO `sys_log` VALUES (1528, 1, '2021-01-30 23:14:52', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 10, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:14:51', 1, '2021-01-30 23:14:51', 1, 0);
INSERT INTO `sys_log` VALUES (1529, 1, '2021-01-30 23:14:55', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 11, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:14:54', 1, '2021-01-30 23:14:54', 1, 0);
INSERT INTO `sys_log` VALUES (1530, 1, '2021-01-30 23:15:11', '127.0.0.1', '/api/log/page/4', 'GET', 'class com.zero.sys.controller.LogController.page', 10, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:15:10', 1, '2021-01-30 23:15:10', 1, 0);
INSERT INTO `sys_log` VALUES (1531, 1, '2021-01-30 23:15:12', '127.0.0.1', '/api/log/page/3', 'GET', 'class com.zero.sys.controller.LogController.page', 9, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:15:12', 1, '2021-01-30 23:15:12', 1, 0);
INSERT INTO `sys_log` VALUES (1532, 1, '2021-01-30 23:15:13', '127.0.0.1', '/api/log/page/2', 'GET', 'class com.zero.sys.controller.LogController.page', 12, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:15:13', 1, '2021-01-30 23:15:13', 1, 0);
INSERT INTO `sys_log` VALUES (1533, 1, '2021-01-30 23:19:22', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 12, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-30 23:19:22', 1, '2021-01-30 23:19:22', 1, 0);
INSERT INTO `sys_log` VALUES (1534, 1, '2021-01-31 10:12:02', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 10:12:01', 1, '2021-01-31 10:12:01', 1, 0);
INSERT INTO `sys_log` VALUES (1535, 1, '2021-01-31 10:12:02', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.sys.controller.UserController.token', 17, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 10:12:01', 1, '2021-01-31 10:12:01', 1, 0);
INSERT INTO `sys_log` VALUES (1536, 1, '2021-01-31 10:12:08', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 117, '分页查询用户数据', NULL, NULL, '2021-01-31 10:12:08', 1, '2021-01-31 10:12:08', 1, 0);
INSERT INTO `sys_log` VALUES (1537, 1, '2021-01-31 10:12:10', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.sys.controller.RoleController.list', 18, '获取所有的用户角色', NULL, NULL, '2021-01-31 10:12:09', 1, '2021-01-31 10:12:09', 1, 0);
INSERT INTO `sys_log` VALUES (1538, 1, '2021-01-31 10:12:11', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 14, '分页查询用户数据', NULL, NULL, '2021-01-31 10:12:10', 1, '2021-01-31 10:12:10', 1, 0);
INSERT INTO `sys_log` VALUES (1539, 1, '2021-01-31 10:12:12', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 9, '分页查询用户数据', NULL, NULL, '2021-01-31 10:12:12', 1, '2021-01-31 10:12:12', 1, 0);
INSERT INTO `sys_log` VALUES (1540, 1, '2021-01-31 10:12:14', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 27, '分页查询用户数据', NULL, NULL, '2021-01-31 10:12:14', 1, '2021-01-31 10:12:14', 1, 0);
INSERT INTO `sys_log` VALUES (1541, 1, '2021-01-31 10:12:16', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.sys.controller.RoleController.page', 5, '分页查询角色数据', NULL, NULL, '2021-01-31 10:12:16', 1, '2021-01-31 10:12:16', 1, 0);
INSERT INTO `sys_log` VALUES (1542, 1, '2021-01-31 10:12:17', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 40, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:12:17', 1, '2021-01-31 10:12:17', 1, 0);
INSERT INTO `sys_log` VALUES (1543, 1, '2021-01-31 10:12:18', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.sys.controller.RoleController.list', 5, '获取所有的用户角色', NULL, NULL, '2021-01-31 10:12:18', 1, '2021-01-31 10:12:18', 1, 0);
INSERT INTO `sys_log` VALUES (1544, 1, '2021-01-31 10:12:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 23, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:12:19', 1, '2021-01-31 10:12:19', 1, 0);
INSERT INTO `sys_log` VALUES (1545, 1, '2021-01-31 10:12:21', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 6, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:12:20', 1, '2021-01-31 10:12:20', 1, 0);
INSERT INTO `sys_log` VALUES (1546, 1, '2021-01-31 10:12:22', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 22, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:12:22', 1, '2021-01-31 10:12:22', 1, 0);
INSERT INTO `sys_log` VALUES (1547, 1, '2021-01-31 10:12:24', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 80, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:24', 1, '2021-01-31 10:12:24', 1, 0);
INSERT INTO `sys_log` VALUES (1548, 1, '2021-01-31 10:12:26', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.sys.controller.RoleController.list', 4, '获取所有的用户角色', NULL, NULL, '2021-01-31 10:12:25', 1, '2021-01-31 10:12:25', 1, 0);
INSERT INTO `sys_log` VALUES (1549, 1, '2021-01-31 10:12:27', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 11, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:26', 1, '2021-01-31 10:12:26', 1, 0);
INSERT INTO `sys_log` VALUES (1550, 1, '2021-01-31 10:12:28', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 44, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:28', 1, '2021-01-31 10:12:28', 1, 0);
INSERT INTO `sys_log` VALUES (1551, 1, '2021-01-31 10:12:31', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 47, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:30', 1, '2021-01-31 10:12:30', 1, 0);
INSERT INTO `sys_log` VALUES (1552, 1, '2021-01-31 10:12:35', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 5, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-01-31 10:12:35', 1, '2021-01-31 10:12:35', 1, 0);
INSERT INTO `sys_log` VALUES (1553, 1, '2021-01-31 10:12:38', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 41, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:38', 1, '2021-01-31 10:12:38', 1, 0);
INSERT INTO `sys_log` VALUES (1554, 1, '2021-01-31 10:12:43', '127.0.0.1', '/api/menu/11', 'DELETE', 'class com.zero.sys.controller.MenuController.deleteById', 9, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-31 10:12:43', 1, '2021-01-31 10:12:43', 1, 0);
INSERT INTO `sys_log` VALUES (1555, 1, '2021-01-31 10:12:44', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 40, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 10:12:43', 1, '2021-01-31 10:12:43', 1, 0);
INSERT INTO `sys_log` VALUES (1556, 1, '2021-01-31 10:12:48', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 6, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-01-31 10:12:47', 1, '2021-01-31 10:12:47', 1, 0);
INSERT INTO `sys_log` VALUES (1557, 1, '2021-01-31 10:12:57', '127.0.0.1', '/api/menu/recover/11', 'PUT', 'class com.zero.sys.controller.MenuController.recover', 6, '通过主键恢复逻辑删除的系统菜单表数据', NULL, NULL, '2021-01-31 10:12:57', 1, '2021-01-31 10:12:57', 1, 0);
INSERT INTO `sys_log` VALUES (1558, 1, '2021-01-31 10:12:58', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 4, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-01-31 10:12:57', 1, '2021-01-31 10:12:57', 1, 0);
INSERT INTO `sys_log` VALUES (1559, 1, '2021-01-31 10:13:00', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 23, '分页查询用户数据', NULL, NULL, '2021-01-31 10:13:00', 1, '2021-01-31 10:13:00', 1, 0);
INSERT INTO `sys_log` VALUES (1560, 1, '2021-01-31 10:13:04', '127.0.0.1', '/api/user/10', 'DELETE', 'class com.zero.sys.controller.UserController.deleteById', 8, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-31 10:13:03', 1, '2021-01-31 10:13:03', 1, 0);
INSERT INTO `sys_log` VALUES (1561, 1, '2021-01-31 10:13:04', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 22, '分页查询用户数据', NULL, NULL, '2021-01-31 10:13:03', 1, '2021-01-31 10:13:03', 1, 0);
INSERT INTO `sys_log` VALUES (1562, 1, '2021-01-31 10:13:06', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 7, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-31 10:13:05', 1, '2021-01-31 10:13:05', 1, 0);
INSERT INTO `sys_log` VALUES (1563, 1, '2021-01-31 10:13:09', '127.0.0.1', '/api/user/recover/10', 'PUT', 'class com.zero.sys.controller.UserController.recover', 6, '通过主键恢复逻辑删除的用户数据', NULL, NULL, '2021-01-31 10:13:08', 1, '2021-01-31 10:13:08', 1, 0);
INSERT INTO `sys_log` VALUES (1564, 1, '2021-01-31 10:13:09', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 3, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-31 10:13:09', 1, '2021-01-31 10:13:09', 1, 0);
INSERT INTO `sys_log` VALUES (1565, 1, '2021-01-31 10:13:11', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.sys.controller.UserController.page', 23, '分页查询用户数据', NULL, NULL, '2021-01-31 10:13:11', 1, '2021-01-31 10:13:11', 1, 0);
INSERT INTO `sys_log` VALUES (1566, 1, '2021-01-31 10:13:15', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 22, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:13:14', 1, '2021-01-31 10:13:14', 1, 0);
INSERT INTO `sys_log` VALUES (1567, 1, '2021-01-31 10:13:23', '127.0.0.1', '/api/resources/10', 'DELETE', 'class com.zero.sys.controller.ResourcesController.deleteById', 44, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-01-31 10:13:22', 1, '2021-01-31 10:13:22', 1, 0);
INSERT INTO `sys_log` VALUES (1568, 1, '2021-01-31 10:13:23', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.page', 20, '分页查询系统资源数据', NULL, NULL, '2021-01-31 10:13:23', 1, '2021-01-31 10:13:23', 1, 0);
INSERT INTO `sys_log` VALUES (1569, 1, '2021-01-31 10:13:25', '127.0.0.1', '/api/resources/recover/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.recoverPage', 5, '分页查询逻辑删除的系统资源表数据', NULL, NULL, '2021-01-31 10:13:24', 1, '2021-01-31 10:13:24', 1, 0);
INSERT INTO `sys_log` VALUES (1570, 1, '2021-01-31 10:13:27', '127.0.0.1', '/api/resources/recover/10', 'PUT', 'class com.zero.sys.controller.ResourcesController.recover', 5, '通过主键恢复逻辑删除的系统资源表数据', NULL, NULL, '2021-01-31 10:13:26', 1, '2021-01-31 10:13:26', 1, 0);
INSERT INTO `sys_log` VALUES (1571, 1, '2021-01-31 10:13:27', '127.0.0.1', '/api/resources/recover/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.recoverPage', 3, '分页查询逻辑删除的系统资源表数据', NULL, NULL, '2021-01-31 10:13:26', 1, '2021-01-31 10:13:26', 1, 0);
INSERT INTO `sys_log` VALUES (1572, 1, '2021-01-31 10:13:28', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.sys.controller.RoleController.list', 3, '获取所有的用户角色', NULL, NULL, '2021-01-31 10:13:27', 1, '2021-01-31 10:13:27', 1, 0);
INSERT INTO `sys_log` VALUES (1573, 1, '2021-01-31 10:13:29', '127.0.0.1', '/api/resources/recover/page/1', 'GET', 'class com.zero.sys.controller.ResourcesController.recoverPage', 7, '分页查询逻辑删除的系统资源表数据', NULL, NULL, '2021-01-31 10:13:29', 1, '2021-01-31 10:13:29', 1, 0);
INSERT INTO `sys_log` VALUES (1574, 1, '2021-01-31 10:13:31', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 4, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-31 10:13:31', 1, '2021-01-31 10:13:31', 1, 0);
INSERT INTO `sys_log` VALUES (1575, 1, '2021-01-31 10:15:50', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.sys.controller.UserController.recoverPage', 6, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-01-31 10:15:49', 1, '2021-01-31 10:15:49', 1, 0);
INSERT INTO `sys_log` VALUES (1576, 1, '2021-01-31 10:15:52', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 28, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-31 10:15:52', 1, '2021-01-31 10:15:52', 1, 0);
INSERT INTO `sys_log` VALUES (1577, 1, '2021-01-31 10:15:55', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 30, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-31 10:15:54', 1, '2021-01-31 10:15:54', 1, 0);
INSERT INTO `sys_log` VALUES (1578, 1, '2021-01-31 10:15:58', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 18, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-31 10:15:57', 1, '2021-01-31 10:15:57', 1, 0);
INSERT INTO `sys_log` VALUES (1579, 1, '2021-01-31 10:15:59', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 7, '分页查询系统操作日志表数据', NULL, NULL, '2021-01-31 10:15:59', 1, '2021-01-31 10:15:59', 1, 0);
INSERT INTO `sys_log` VALUES (1580, 1, '2021-01-31 10:16:09', '127.0.0.1', '/api/table/info/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.page', 16, '分页查询系统数据库表信息数据', NULL, NULL, '2021-01-31 10:16:09', 1, '2021-01-31 10:16:09', 1, 0);
INSERT INTO `sys_log` VALUES (1581, 1, '2021-01-31 11:37:24', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 31, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 11:37:23', 1, '2021-01-31 11:37:23', 1, 0);
INSERT INTO `sys_log` VALUES (1582, 1, '2021-01-31 11:37:24', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 14, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 11:37:23', 1, '2021-01-31 11:37:23', 1, 0);
INSERT INTO `sys_log` VALUES (1583, 1, '2021-01-31 11:37:24', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 15, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 11:37:23', 1, '2021-01-31 11:37:23', 1, 0);
INSERT INTO `sys_log` VALUES (1584, 1, '2021-01-31 11:37:24', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 80, '分页查询用户数据', NULL, NULL, '2021-01-31 11:37:24', 1, '2021-01-31 11:37:24', 1, 0);
INSERT INTO `sys_log` VALUES (1585, 1, '2021-01-31 11:37:26', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', 11, '分页查询角色数据', NULL, NULL, '2021-01-31 11:37:26', 1, '2021-01-31 11:37:26', 1, 0);
INSERT INTO `sys_log` VALUES (1586, 1, '2021-01-31 11:37:28', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 26, '分页查询系统资源数据', NULL, NULL, '2021-01-31 11:37:27', 1, '2021-01-31 11:37:27', 1, 0);
INSERT INTO `sys_log` VALUES (1587, 1, '2021-01-31 11:37:29', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 48, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 11:37:28', 1, '2021-01-31 11:37:28', 1, 0);
INSERT INTO `sys_log` VALUES (1588, 1, '2021-01-31 11:37:30', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 66, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 11:37:30', 1, '2021-01-31 11:37:30', 1, 0);
INSERT INTO `sys_log` VALUES (1589, 1, '2021-01-31 11:37:35', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 14, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-31 11:37:34', 1, '2021-01-31 11:37:34', 1, 0);
INSERT INTO `sys_log` VALUES (1590, 1, '2021-01-31 19:17:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 34, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 19:17:54', 1, '2021-01-31 19:17:54', 1, 0);
INSERT INTO `sys_log` VALUES (1591, 1, '2021-01-31 19:17:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 19:17:54', 1, '2021-01-31 19:17:54', 1, 0);
INSERT INTO `sys_log` VALUES (1592, 1, '2021-01-31 19:17:55', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 21, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 19:17:54', 1, '2021-01-31 19:17:54', 1, 0);
INSERT INTO `sys_log` VALUES (1593, 1, '2021-01-31 19:17:56', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 85, '分页查询用户数据', NULL, NULL, '2021-01-31 19:17:55', 1, '2021-01-31 19:17:55', 1, 0);
INSERT INTO `sys_log` VALUES (1594, 1, '2021-01-31 19:17:59', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 64, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 19:17:59', 1, '2021-01-31 19:17:59', 1, 0);
INSERT INTO `sys_log` VALUES (1595, 1, '2021-01-31 19:18:04', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 21, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-31 19:18:03', 1, '2021-01-31 19:18:03', 1, 0);
INSERT INTO `sys_log` VALUES (1596, 1, '2021-01-31 19:18:29', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 238, '上传用户头像', NULL, NULL, '2021-01-31 19:18:28', 1, '2021-01-31 19:18:28', 1, 0);
INSERT INTO `sys_log` VALUES (1597, 1, '2021-01-31 19:25:44', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 35, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-31 19:25:43', 1, '2021-01-31 19:25:43', 1, 0);
INSERT INTO `sys_log` VALUES (1598, 1, '2021-01-31 19:25:53', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 726, '上传用户头像', NULL, NULL, '2021-01-31 19:25:53', 1, '2021-01-31 19:25:53', 1, 0);
INSERT INTO `sys_log` VALUES (1599, 1, '2021-01-31 19:26:50', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 722, '上传用户头像', NULL, NULL, '2021-01-31 19:26:50', 1, '2021-01-31 19:26:50', 1, 0);
INSERT INTO `sys_log` VALUES (1600, 1, '2021-01-31 19:36:33', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 777, '上传用户头像', NULL, NULL, '2021-01-31 19:36:33', 1, '2021-01-31 19:36:33', 1, 0);
INSERT INTO `sys_log` VALUES (1601, 1, '2021-01-31 19:38:15', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 811, '上传用户头像', NULL, NULL, '2021-01-31 19:38:15', 1, '2021-01-31 19:38:15', 1, 0);
INSERT INTO `sys_log` VALUES (1602, 1, '2021-01-31 19:41:27', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 787, '上传用户头像', NULL, NULL, '2021-01-31 19:41:27', 1, '2021-01-31 19:41:27', 1, 0);
INSERT INTO `sys_log` VALUES (1603, 1, '2021-01-31 19:55:06', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 784, '上传用户头像', NULL, NULL, '2021-01-31 19:55:06', 1, '2021-01-31 19:55:06', 1, 0);
INSERT INTO `sys_log` VALUES (1604, 1, '2021-01-31 20:30:47', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 33, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 20:30:46', 1, '2021-01-31 20:30:46', 1, 0);
INSERT INTO `sys_log` VALUES (1605, 1, '2021-01-31 20:30:47', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 20:30:46', 1, '2021-01-31 20:30:46', 1, 0);
INSERT INTO `sys_log` VALUES (1606, 1, '2021-01-31 20:30:47', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 17, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 20:30:46', 1, '2021-01-31 20:30:46', 1, 0);
INSERT INTO `sys_log` VALUES (1607, 1, '2021-01-31 20:30:47', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 20, '查询当前登录用户的信息数据', NULL, NULL, '2021-01-31 20:30:47', 1, '2021-01-31 20:30:47', 1, 0);
INSERT INTO `sys_log` VALUES (1608, 1, '2021-01-31 20:30:56', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 208, '上传用户头像', NULL, NULL, '2021-01-31 20:30:56', 1, '2021-01-31 20:30:56', 1, 0);
INSERT INTO `sys_log` VALUES (1609, 1, '2021-01-31 20:40:21', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 832, '上传用户头像', NULL, NULL, '2021-01-31 20:40:22', 1, '2021-01-31 20:40:22', 1, 0);
INSERT INTO `sys_log` VALUES (1610, 1, '2021-01-31 20:49:01', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 841, '上传用户头像', NULL, NULL, '2021-01-31 20:49:01', 1, '2021-01-31 20:49:01', 1, 0);
INSERT INTO `sys_log` VALUES (1611, 1, '2021-01-31 20:49:33', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 14636, '上传用户头像', NULL, NULL, '2021-01-31 20:49:48', 1, '2021-01-31 20:49:48', 1, 0);
INSERT INTO `sys_log` VALUES (1612, 1, '2021-01-31 20:52:47', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 5459, '上传用户头像', NULL, NULL, '2021-01-31 20:52:52', 1, '2021-01-31 20:52:52', 1, 0);
INSERT INTO `sys_log` VALUES (1613, 1, '2021-01-31 21:56:14', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 40, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 21:56:14', 1, '2021-01-31 21:56:14', 1, 0);
INSERT INTO `sys_log` VALUES (1614, 1, '2021-01-31 21:56:14', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 21:56:14', 1, '2021-01-31 21:56:14', 1, 0);
INSERT INTO `sys_log` VALUES (1615, 1, '2021-01-31 21:56:15', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 23, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 21:56:14', 1, '2021-01-31 21:56:14', 1, 0);
INSERT INTO `sys_log` VALUES (1616, 1, '2021-01-31 21:56:15', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 127, '分页查询用户数据', NULL, NULL, '2021-01-31 21:56:15', 1, '2021-01-31 21:56:15', 1, 0);
INSERT INTO `sys_log` VALUES (1617, 1, '2021-01-31 21:56:22', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', 22, '分页查询角色数据', NULL, NULL, '2021-01-31 21:56:22', 1, '2021-01-31 21:56:22', 1, 0);
INSERT INTO `sys_log` VALUES (1618, 1, '2021-01-31 21:56:25', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 29, '分页查询用户数据', NULL, NULL, '2021-01-31 21:56:25', 1, '2021-01-31 21:56:25', 1, 0);
INSERT INTO `sys_log` VALUES (1619, 1, '2021-01-31 21:56:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 22, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 21:56:30', 1, '2021-01-31 21:56:30', 1, 0);
INSERT INTO `sys_log` VALUES (1620, 1, '2021-01-31 21:56:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 21, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 21:56:30', 1, '2021-01-31 21:56:30', 1, 0);
INSERT INTO `sys_log` VALUES (1621, 1, '2021-01-31 21:56:30', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 21:56:30', 1, '2021-01-31 21:56:30', 1, 0);
INSERT INTO `sys_log` VALUES (1622, 1, '2021-01-31 21:56:31', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 26, '分页查询用户数据', NULL, NULL, '2021-01-31 21:56:31', 1, '2021-01-31 21:56:31', 1, 0);
INSERT INTO `sys_log` VALUES (1623, 1, '2021-01-31 22:30:44', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 15, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:30:44', 1, '2021-01-31 22:30:44', 1, 0);
INSERT INTO `sys_log` VALUES (1624, 1, '2021-01-31 22:30:44', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:30:44', 1, '2021-01-31 22:30:44', 1, 0);
INSERT INTO `sys_log` VALUES (1625, 1, '2021-01-31 22:30:44', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:30:44', 1, '2021-01-31 22:30:44', 1, 0);
INSERT INTO `sys_log` VALUES (1626, 1, '2021-01-31 22:30:45', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 25, '分页查询用户数据', NULL, NULL, '2021-01-31 22:30:44', 1, '2021-01-31 22:30:44', 1, 0);
INSERT INTO `sys_log` VALUES (1627, 1, '2021-01-31 22:32:47', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 64, '分页查询系统菜单表数据', NULL, NULL, '2021-01-31 22:32:46', 1, '2021-01-31 22:32:46', 1, 0);
INSERT INTO `sys_log` VALUES (1628, 1, '2021-01-31 22:34:04', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 22, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:03', 1, '2021-01-31 22:34:03', 1, 0);
INSERT INTO `sys_log` VALUES (1629, 1, '2021-01-31 22:34:04', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:03', 1, '2021-01-31 22:34:03', 1, 0);
INSERT INTO `sys_log` VALUES (1630, 1, '2021-01-31 22:34:04', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:03', 1, '2021-01-31 22:34:03', 1, 0);
INSERT INTO `sys_log` VALUES (1631, 1, '2021-01-31 22:34:07', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 26, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:07', 1, '2021-01-31 22:34:07', 1, 0);
INSERT INTO `sys_log` VALUES (1632, 1, '2021-01-31 22:34:07', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 11, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:07', 1, '2021-01-31 22:34:07', 1, 0);
INSERT INTO `sys_log` VALUES (1633, 1, '2021-01-31 22:34:07', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:07', 1, '2021-01-31 22:34:07', 1, 0);
INSERT INTO `sys_log` VALUES (1634, 1, '2021-01-31 22:34:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:12', 1, '2021-01-31 22:34:12', 1, 0);
INSERT INTO `sys_log` VALUES (1635, 1, '2021-01-31 22:34:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:12', 1, '2021-01-31 22:34:12', 1, 0);
INSERT INTO `sys_log` VALUES (1636, 1, '2021-01-31 22:34:13', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:12', 1, '2021-01-31 22:34:12', 1, 0);
INSERT INTO `sys_log` VALUES (1637, 1, '2021-01-31 22:34:46', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 21, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:46', 1, '2021-01-31 22:34:46', 1, 0);
INSERT INTO `sys_log` VALUES (1638, 1, '2021-01-31 22:34:46', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:46', 1, '2021-01-31 22:34:46', 1, 0);
INSERT INTO `sys_log` VALUES (1639, 1, '2021-01-31 22:34:46', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:46', 1, '2021-01-31 22:34:46', 1, 0);
INSERT INTO `sys_log` VALUES (1640, 1, '2021-01-31 22:34:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:48', 1, '2021-01-31 22:34:48', 1, 0);
INSERT INTO `sys_log` VALUES (1641, 1, '2021-01-31 22:34:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 10, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:49', 1, '2021-01-31 22:34:49', 1, 0);
INSERT INTO `sys_log` VALUES (1642, 1, '2021-01-31 22:34:49', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:49', 1, '2021-01-31 22:34:49', 1, 0);
INSERT INTO `sys_log` VALUES (1643, 1, '2021-01-31 22:34:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:54', 1, '2021-01-31 22:34:54', 1, 0);
INSERT INTO `sys_log` VALUES (1644, 1, '2021-01-31 22:34:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 11, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:54', 1, '2021-01-31 22:34:54', 1, 0);
INSERT INTO `sys_log` VALUES (1645, 1, '2021-01-31 22:34:55', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:54', 1, '2021-01-31 22:34:54', 1, 0);
INSERT INTO `sys_log` VALUES (1646, 1, '2021-01-31 22:34:57', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:56', 1, '2021-01-31 22:34:56', 1, 0);
INSERT INTO `sys_log` VALUES (1647, 1, '2021-01-31 22:34:57', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 11, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:34:56', 1, '2021-01-31 22:34:56', 1, 0);
INSERT INTO `sys_log` VALUES (1648, 1, '2021-01-31 22:34:57', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:34:56', 1, '2021-01-31 22:34:56', 1, 0);
INSERT INTO `sys_log` VALUES (1649, 1, '2021-01-31 22:35:14', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:35:14', 1, '2021-01-31 22:35:14', 1, 0);
INSERT INTO `sys_log` VALUES (1650, 1, '2021-01-31 22:35:14', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:35:14', 1, '2021-01-31 22:35:14', 1, 0);
INSERT INTO `sys_log` VALUES (1651, 1, '2021-01-31 22:35:23', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 45, '分页查询系统资源数据', NULL, NULL, '2021-01-31 22:35:23', 1, '2021-01-31 22:35:23', 1, 0);
INSERT INTO `sys_log` VALUES (1652, 1, '2021-01-31 22:35:28', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 28, '分页查询系统资源数据', NULL, NULL, '2021-01-31 22:35:28', 1, '2021-01-31 22:35:28', 1, 0);
INSERT INTO `sys_log` VALUES (1653, 1, '2021-01-31 22:35:31', '127.0.0.1', '/api/resources/role/160', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', 6, '获取未拥有该系统资源的角色', NULL, NULL, '2021-01-31 22:35:30', 1, '2021-01-31 22:35:30', 1, 0);
INSERT INTO `sys_log` VALUES (1654, 1, '2021-01-31 22:35:39', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 21, '分页查询系统资源数据', NULL, NULL, '2021-01-31 22:35:38', 1, '2021-01-31 22:35:38', 1, 0);
INSERT INTO `sys_log` VALUES (1655, 1, '2021-01-31 22:51:52', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:51:52', 1, '2021-01-31 22:51:52', 1, 0);
INSERT INTO `sys_log` VALUES (1656, 1, '2021-01-31 22:51:52', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 253, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:51:52', 1, '2021-01-31 22:51:52', 1, 0);
INSERT INTO `sys_log` VALUES (1657, 1, '2021-01-31 22:51:53', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 13, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:51:52', 1, '2021-01-31 22:51:52', 1, 0);
INSERT INTO `sys_log` VALUES (1658, 1, '2021-01-31 22:54:27', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:54:27', 1, '2021-01-31 22:54:27', 1, 0);
INSERT INTO `sys_log` VALUES (1659, 1, '2021-01-31 22:54:27', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 22:54:27', 1, '2021-01-31 22:54:27', 1, 0);
INSERT INTO `sys_log` VALUES (1660, 1, '2021-01-31 22:54:27', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 22:54:27', 1, '2021-01-31 22:54:27', 1, 0);
INSERT INTO `sys_log` VALUES (1661, 1, '2021-01-31 22:55:04', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 50, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 22:55:04', 1, '2021-01-31 22:55:04', 1, 0);
INSERT INTO `sys_log` VALUES (1662, 1, '2021-01-31 23:01:16', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 68, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:01:16', 1, '2021-01-31 23:01:16', 1, 0);
INSERT INTO `sys_log` VALUES (1663, 1, '2021-01-31 23:01:24', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 26, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:01:24', 1, '2021-01-31 23:01:24', 1, 0);
INSERT INTO `sys_log` VALUES (1664, 1, '2021-01-31 23:01:24', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 22, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:01:24', 1, '2021-01-31 23:01:24', 1, 0);
INSERT INTO `sys_log` VALUES (1665, 1, '2021-01-31 23:01:24', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 23, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 23:01:24', 1, '2021-01-31 23:01:24', 1, 0);
INSERT INTO `sys_log` VALUES (1666, 1, '2021-01-31 23:01:25', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 131, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:01:25', 1, '2021-01-31 23:01:25', 1, 0);
INSERT INTO `sys_log` VALUES (1667, 1, '2021-01-31 23:02:18', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 33, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:02:18', 1, '2021-01-31 23:02:18', 1, 0);
INSERT INTO `sys_log` VALUES (1668, 1, '2021-01-31 23:02:36', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 23, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:02:35', 1, '2021-01-31 23:02:35', 1, 0);
INSERT INTO `sys_log` VALUES (1669, 1, '2021-01-31 23:02:36', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 16, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:02:35', 1, '2021-01-31 23:02:35', 1, 0);
INSERT INTO `sys_log` VALUES (1670, 1, '2021-01-31 23:02:36', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 23:02:35', 1, '2021-01-31 23:02:35', 1, 0);
INSERT INTO `sys_log` VALUES (1671, 1, '2021-01-31 23:02:36', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 38, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:02:36', 1, '2021-01-31 23:02:36', 1, 0);
INSERT INTO `sys_log` VALUES (1672, 1, '2021-01-31 23:02:51', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 23, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:02:51', 1, '2021-01-31 23:02:51', 1, 0);
INSERT INTO `sys_log` VALUES (1673, 1, '2021-01-31 23:02:52', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 16, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:02:51', 1, '2021-01-31 23:02:51', 1, 0);
INSERT INTO `sys_log` VALUES (1674, 1, '2021-01-31 23:02:52', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 23:02:51', 1, '2021-01-31 23:02:51', 1, 0);
INSERT INTO `sys_log` VALUES (1675, 1, '2021-01-31 23:02:52', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 27, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:02:52', 1, '2021-01-31 23:02:52', 1, 0);
INSERT INTO `sys_log` VALUES (1676, 1, '2021-01-31 23:06:45', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 222, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:06:45', 1, '2021-01-31 23:06:45', 1, 0);
INSERT INTO `sys_log` VALUES (1677, 1, '2021-01-31 23:06:55', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String', '2021-01-31 23:06:55', 1, '2021-01-31 23:06:55', 1, 0);
INSERT INTO `sys_log` VALUES (1678, 1, '2021-01-31 23:11:20', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 44, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:11:19', 1, '2021-01-31 23:11:19', 1, 0);
INSERT INTO `sys_log` VALUES (1679, 1, '2021-01-31 23:11:23', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 30, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:11:22', 1, '2021-01-31 23:11:22', 1, 0);
INSERT INTO `sys_log` VALUES (1680, 1, '2021-01-31 23:11:24', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 25, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:11:23', 1, '2021-01-31 23:11:23', 1, 0);
INSERT INTO `sys_log` VALUES (1681, 1, '2021-01-31 23:29:32', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 154, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:29:32', 1, '2021-01-31 23:29:32', 1, 0);
INSERT INTO `sys_log` VALUES (1682, 1, '2021-01-31 23:30:05', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 27, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:30:04', 1, '2021-01-31 23:30:04', 1, 0);
INSERT INTO `sys_log` VALUES (1683, 1, '2021-01-31 23:30:08', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 25, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:30:07', 1, '2021-01-31 23:30:07', 1, 0);
INSERT INTO `sys_log` VALUES (1684, 1, '2021-01-31 23:30:17', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 26, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:30:16', 1, '2021-01-31 23:30:16', 1, 0);
INSERT INTO `sys_log` VALUES (1685, 1, '2021-01-31 23:31:42', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 26, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:31:42', 1, '2021-01-31 23:31:42', 1, 0);
INSERT INTO `sys_log` VALUES (1686, 1, '2021-01-31 23:31:48', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 38, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:31:48', 1, '2021-01-31 23:31:48', 1, 0);
INSERT INTO `sys_log` VALUES (1687, 1, '2021-01-31 23:31:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:31:48', 1, '2021-01-31 23:31:48', 1, 0);
INSERT INTO `sys_log` VALUES (1688, 1, '2021-01-31 23:31:49', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 20, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 23:31:48', 1, '2021-01-31 23:31:48', 1, 0);
INSERT INTO `sys_log` VALUES (1689, 1, '2021-01-31 23:31:49', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 34, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:31:49', 1, '2021-01-31 23:31:49', 1, 0);
INSERT INTO `sys_log` VALUES (1690, 1, '2021-01-31 23:32:05', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 29, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:32:04', 1, '2021-01-31 23:32:04', 1, 0);
INSERT INTO `sys_log` VALUES (1691, 1, '2021-01-31 23:32:10', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 21, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:32:10', 1, '2021-01-31 23:32:10', 1, 0);
INSERT INTO `sys_log` VALUES (1692, 1, '2021-01-31 23:32:10', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 15, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-01-31 23:32:10', 1, '2021-01-31 23:32:10', 1, 0);
INSERT INTO `sys_log` VALUES (1693, 1, '2021-01-31 23:32:10', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-01-31 23:32:10', 1, '2021-01-31 23:32:10', 1, 0);
INSERT INTO `sys_log` VALUES (1694, 1, '2021-01-31 23:32:11', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 34, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:32:10', 1, '2021-01-31 23:32:10', 1, 0);
INSERT INTO `sys_log` VALUES (1695, 1, '2021-01-31 23:32:30', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 27, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:32:30', 1, '2021-01-31 23:32:30', 1, 0);
INSERT INTO `sys_log` VALUES (1696, 1, '2021-01-31 23:32:53', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 41, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:32:53', 1, '2021-01-31 23:32:53', 1, 0);
INSERT INTO `sys_log` VALUES (1697, 1, '2021-01-31 23:33:00', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 14, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:33:00', 1, '2021-01-31 23:33:00', 1, 0);
INSERT INTO `sys_log` VALUES (1698, 1, '2021-01-31 23:33:03', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 23, '分页查询文件资源管理表数据', NULL, NULL, '2021-01-31 23:33:02', 1, '2021-01-31 23:33:02', 1, 0);
INSERT INTO `sys_log` VALUES (1699, 1, '2021-01-31 23:33:06', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String', '2021-01-31 23:33:05', 1, '2021-01-31 23:33:05', 1, 0);
INSERT INTO `sys_log` VALUES (1700, 1, '2021-02-01 21:08:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 49, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:08:23', 1, '2021-02-01 21:08:23', 1, 0);
INSERT INTO `sys_log` VALUES (1701, 1, '2021-02-01 21:08:23', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 19, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 21:08:23', 1, '2021-02-01 21:08:23', 1, 0);
INSERT INTO `sys_log` VALUES (1702, 1, '2021-02-01 21:08:31', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 144, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:08:31', 1, '2021-02-01 21:08:31', 1, 0);
INSERT INTO `sys_log` VALUES (1703, 1, '2021-02-01 21:08:37', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 14, '分页查询文件资源管理表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String', '2021-02-01 21:08:37', 1, '2021-02-01 21:08:37', 1, 0);
INSERT INTO `sys_log` VALUES (1704, 1, '2021-02-01 21:10:57', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 134, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:10:56', 1, '2021-02-01 21:10:56', 1, 0);
INSERT INTO `sys_log` VALUES (1705, 1, '2021-02-01 21:10:57', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 182, '分页查询系统菜单表数据', NULL, NULL, '2021-02-01 21:10:56', 1, '2021-02-01 21:10:56', 1, 0);
INSERT INTO `sys_log` VALUES (1706, 1, '2021-02-01 21:11:00', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String', '2021-02-01 21:11:00', 1, '2021-02-01 21:11:00', 1, 0);
INSERT INTO `sys_log` VALUES (1707, 1, '2021-02-01 21:11:34', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 3803, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:11:38', 1, '2021-02-01 21:11:38', 1, 0);
INSERT INTO `sys_log` VALUES (1708, 1, '2021-02-01 21:11:40', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 3, '分页查询文件资源管理表数据', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: com.zero.upload.enums.FileTypeEnums and java.lang.String', '2021-02-01 21:11:40', 1, '2021-02-01 21:11:40', 1, 0);
INSERT INTO `sys_log` VALUES (1709, 1, '2021-02-01 21:12:51', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 10595, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:01', 1, '2021-02-01 21:13:01', 1, 0);
INSERT INTO `sys_log` VALUES (1710, 1, '2021-02-01 21:13:06', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 11144, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:16', 1, '2021-02-01 21:13:16', 1, 0);
INSERT INTO `sys_log` VALUES (1711, 1, '2021-02-01 21:13:40', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 100, '分页查询系统资源数据', NULL, NULL, '2021-02-01 21:13:40', 1, '2021-02-01 21:13:40', 1, 0);
INSERT INTO `sys_log` VALUES (1712, 1, '2021-02-01 21:13:42', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 3973, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:46', 1, '2021-02-01 21:13:46', 1, 0);
INSERT INTO `sys_log` VALUES (1713, 1, '2021-02-01 21:13:50', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 38, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:50', 1, '2021-02-01 21:13:50', 1, 0);
INSERT INTO `sys_log` VALUES (1714, 1, '2021-02-01 21:13:58', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 34, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:57', 1, '2021-02-01 21:13:57', 1, 0);
INSERT INTO `sys_log` VALUES (1715, 1, '2021-02-01 21:14:00', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 28, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:13:59', 1, '2021-02-01 21:13:59', 1, 0);
INSERT INTO `sys_log` VALUES (1716, 1, '2021-02-01 21:42:39', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 120, '分页查询系统菜单表数据', NULL, NULL, '2021-02-01 21:42:38', 1, '2021-02-01 21:42:38', 1, 0);
INSERT INTO `sys_log` VALUES (1717, 1, '2021-02-01 21:42:42', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 26, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:42:42', 1, '2021-02-01 21:42:42', 1, 0);
INSERT INTO `sys_log` VALUES (1718, 1, '2021-02-01 21:47:56', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 54, '分页查询系统菜单表数据', NULL, NULL, '2021-02-01 21:47:56', 1, '2021-02-01 21:47:56', 1, 0);
INSERT INTO `sys_log` VALUES (1719, 1, '2021-02-01 21:48:01', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 43, '分页查询用户数据', NULL, NULL, '2021-02-01 21:48:01', 1, '2021-02-01 21:48:01', 1, 0);
INSERT INTO `sys_log` VALUES (1720, 1, '2021-02-01 21:48:02', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', 11, '启用或者禁用一个用户账号', NULL, NULL, '2021-02-01 21:48:02', 1, '2021-02-01 21:48:02', 1, 0);
INSERT INTO `sys_log` VALUES (1721, 1, '2021-02-01 21:48:03', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', 6, '启用或者禁用一个用户账号', NULL, NULL, '2021-02-01 21:48:03', 1, '2021-02-01 21:48:03', 1, 0);
INSERT INTO `sys_log` VALUES (1722, 1, '2021-02-01 21:48:05', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 34, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:48:04', 1, '2021-02-01 21:48:04', 1, 0);
INSERT INTO `sys_log` VALUES (1723, 1, '2021-02-01 21:48:33', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 24, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:48:33', 1, '2021-02-01 21:48:33', 1, 0);
INSERT INTO `sys_log` VALUES (1724, 1, '2021-02-01 21:49:00', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 25, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:49:00', 1, '2021-02-01 21:49:00', 1, 0);
INSERT INTO `sys_log` VALUES (1725, 1, '2021-02-01 21:49:00', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:49:00', 1, '2021-02-01 21:49:00', 1, 0);
INSERT INTO `sys_log` VALUES (1726, 1, '2021-02-01 21:49:00', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 9, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 21:49:00', 1, '2021-02-01 21:49:00', 1, 0);
INSERT INTO `sys_log` VALUES (1727, 1, '2021-02-01 21:49:01', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 23, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:49:00', 1, '2021-02-01 21:49:00', 1, 0);
INSERT INTO `sys_log` VALUES (1728, 1, '2021-02-01 21:50:23', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 11, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:50:23', 1, '2021-02-01 21:50:23', 1, 0);
INSERT INTO `sys_log` VALUES (1729, 1, '2021-02-01 21:50:26', '127.0.0.1', '/api/file/manage/12', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 9, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-01 21:50:25', 1, '2021-02-01 21:50:25', 1, 0);
INSERT INTO `sys_log` VALUES (1730, 1, '2021-02-01 21:50:26', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 7, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:50:26', 1, '2021-02-01 21:50:26', 1, 0);
INSERT INTO `sys_log` VALUES (1731, 1, '2021-02-01 21:50:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:50:30', 1, '2021-02-01 21:50:30', 1, 0);
INSERT INTO `sys_log` VALUES (1732, 1, '2021-02-01 21:50:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 15, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:50:30', 1, '2021-02-01 21:50:30', 1, 0);
INSERT INTO `sys_log` VALUES (1733, 1, '2021-02-01 21:50:30', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 2, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 21:50:30', 1, '2021-02-01 21:50:30', 1, 0);
INSERT INTO `sys_log` VALUES (1734, 1, '2021-02-01 21:50:31', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 33, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:50:30', 1, '2021-02-01 21:50:30', 1, 0);
INSERT INTO `sys_log` VALUES (1735, 1, '2021-02-01 21:51:09', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 29, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:51:09', 1, '2021-02-01 21:51:09', 1, 0);
INSERT INTO `sys_log` VALUES (1736, 1, '2021-02-01 21:51:09', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 14, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 21:51:09', 1, '2021-02-01 21:51:09', 1, 0);
INSERT INTO `sys_log` VALUES (1737, 1, '2021-02-01 21:51:09', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 8, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 21:51:09', 1, '2021-02-01 21:51:09', 1, 0);
INSERT INTO `sys_log` VALUES (1738, 1, '2021-02-01 21:51:10', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 25, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:51:09', 1, '2021-02-01 21:51:09', 1, 0);
INSERT INTO `sys_log` VALUES (1739, 1, '2021-02-01 21:51:11', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 10, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:51:10', 1, '2021-02-01 21:51:10', 1, 0);
INSERT INTO `sys_log` VALUES (1740, 1, '2021-02-01 21:51:13', '127.0.0.1', '/api/file/manage/12', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 5, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-01 21:51:12', 1, '2021-02-01 21:51:12', 1, 0);
INSERT INTO `sys_log` VALUES (1741, 1, '2021-02-01 21:51:13', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 6, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:51:12', 1, '2021-02-01 21:51:12', 1, 0);
INSERT INTO `sys_log` VALUES (1742, 1, '2021-02-01 21:51:19', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 20, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 21:51:19', 1, '2021-02-01 21:51:19', 1, 0);
INSERT INTO `sys_log` VALUES (1743, 1, '2021-02-01 22:19:38', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 33, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:19:37', 1, '2021-02-01 22:19:37', 1, 0);
INSERT INTO `sys_log` VALUES (1744, 1, '2021-02-01 22:19:38', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:19:37', 1, '2021-02-01 22:19:37', 1, 0);
INSERT INTO `sys_log` VALUES (1745, 1, '2021-02-01 22:19:38', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 18, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 22:19:38', 1, '2021-02-01 22:19:38', 1, 0);
INSERT INTO `sys_log` VALUES (1746, 1, '2021-02-01 22:19:38', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', 85, '分页查询角色数据', NULL, NULL, '2021-02-01 22:19:38', 1, '2021-02-01 22:19:38', 1, 0);
INSERT INTO `sys_log` VALUES (1747, 1, '2021-02-01 22:19:43', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 93, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:19:43', 1, '2021-02-01 22:19:43', 1, 0);
INSERT INTO `sys_log` VALUES (1748, 1, '2021-02-01 22:19:50', '127.0.0.1', '/api/file/manage/bak/1', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 829, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 22:19:51', 1, '2021-02-01 22:19:51', 1, 0);
INSERT INTO `sys_log` VALUES (1749, 1, '2021-02-01 22:20:14', '127.0.0.1', '/api/file/manage/bak/7', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 2190, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 22:20:15', 1, '2021-02-01 22:20:15', 1, 0);
INSERT INTO `sys_log` VALUES (1750, 1, '2021-02-01 22:20:32', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 30, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:20:31', 1, '2021-02-01 22:20:31', 1, 0);
INSERT INTO `sys_log` VALUES (1751, 1, '2021-02-01 22:20:32', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:20:31', 1, '2021-02-01 22:20:31', 1, 0);
INSERT INTO `sys_log` VALUES (1752, 1, '2021-02-01 22:20:32', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 22:20:31', 1, '2021-02-01 22:20:31', 1, 0);
INSERT INTO `sys_log` VALUES (1753, 1, '2021-02-01 22:20:32', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 36, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:20:32', 1, '2021-02-01 22:20:32', 1, 0);
INSERT INTO `sys_log` VALUES (1754, 1, '2021-02-01 22:32:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 21, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:32:22', 1, '2021-02-01 22:32:22', 1, 0);
INSERT INTO `sys_log` VALUES (1755, 1, '2021-02-01 22:32:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 22:32:22', 1, '2021-02-01 22:32:22', 1, 0);
INSERT INTO `sys_log` VALUES (1756, 1, '2021-02-01 22:32:23', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 22:32:22', 1, '2021-02-01 22:32:22', 1, 0);
INSERT INTO `sys_log` VALUES (1757, 1, '2021-02-01 22:32:24', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 46, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:32:23', 1, '2021-02-01 22:32:23', 1, 0);
INSERT INTO `sys_log` VALUES (1758, 1, '2021-02-01 22:32:29', '127.0.0.1', '/api/file/manage/bak/3', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 156, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 22:32:29', 1, '2021-02-01 22:32:29', 1, 0);
INSERT INTO `sys_log` VALUES (1759, 1, '2021-02-01 22:33:47', '127.0.0.1', '/api/file/manage/bak/5', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 1008, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 22:33:48', 1, '2021-02-01 22:33:48', 1, 0);
INSERT INTO `sys_log` VALUES (1760, 1, '2021-02-01 22:33:48', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 100, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:33:48', 1, '2021-02-01 22:33:48', 1, 0);
INSERT INTO `sys_log` VALUES (1761, 1, '2021-02-01 22:33:56', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 75, '分页查询系统菜单表数据', NULL, NULL, '2021-02-01 22:33:56', 1, '2021-02-01 22:33:56', 1, 0);
INSERT INTO `sys_log` VALUES (1762, 1, '2021-02-01 22:34:03', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 31, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:34:03', 1, '2021-02-01 22:34:03', 1, 0);
INSERT INTO `sys_log` VALUES (1763, 1, '2021-02-01 22:59:58', '127.0.0.1', '/api/file/manage/bak/2', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 947, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 22:59:59', 1, '2021-02-01 22:59:59', 1, 0);
INSERT INTO `sys_log` VALUES (1764, 1, '2021-02-01 22:59:59', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 93, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 22:59:59', 1, '2021-02-01 22:59:59', 1, 0);
INSERT INTO `sys_log` VALUES (1765, 1, '2021-02-01 23:00:12', '127.0.0.1', '/api/file/manage/bak/2', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 5784, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 23:00:17', 1, '2021-02-01 23:00:17', 1, 0);
INSERT INTO `sys_log` VALUES (1766, 1, '2021-02-01 23:00:28', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 37, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 23:00:28', 1, '2021-02-01 23:00:28', 1, 0);
INSERT INTO `sys_log` VALUES (1767, 1, '2021-02-01 23:00:29', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 20, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 23:00:28', 1, '2021-02-01 23:00:28', 1, 0);
INSERT INTO `sys_log` VALUES (1768, 1, '2021-02-01 23:00:29', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 21, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 23:00:28', 1, '2021-02-01 23:00:28', 1, 0);
INSERT INTO `sys_log` VALUES (1769, 1, '2021-02-01 23:00:29', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 44, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:00:29', 1, '2021-02-01 23:00:29', 1, 0);
INSERT INTO `sys_log` VALUES (1770, 1, '2021-02-01 23:02:21', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 34, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:02:20', 1, '2021-02-01 23:02:20', 1, 0);
INSERT INTO `sys_log` VALUES (1771, 1, '2021-02-01 23:04:18', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 36, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:04:17', 1, '2021-02-01 23:04:17', 1, 0);
INSERT INTO `sys_log` VALUES (1772, 1, '2021-02-01 23:05:00', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 37, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:05:00', 1, '2021-02-01 23:05:00', 1, 0);
INSERT INTO `sys_log` VALUES (1773, 1, '2021-02-01 23:06:07', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 26, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:06:07', 1, '2021-02-01 23:06:07', 1, 0);
INSERT INTO `sys_log` VALUES (1774, 1, '2021-02-01 23:06:13', '127.0.0.1', '/api/file/manage/bak/10', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 920, '通过主键备份一个文件资源', NULL, NULL, '2021-02-01 23:06:13', 1, '2021-02-01 23:06:13', 1, 0);
INSERT INTO `sys_log` VALUES (1775, 1, '2021-02-01 23:06:13', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 26, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:06:13', 1, '2021-02-01 23:06:13', 1, 0);
INSERT INTO `sys_log` VALUES (1776, 1, '2021-02-01 23:07:22', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 36, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:07:22', 1, '2021-02-01 23:07:22', 1, 0);
INSERT INTO `sys_log` VALUES (1777, 1, '2021-02-01 23:08:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 28, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 23:08:12', 1, '2021-02-01 23:08:12', 1, 0);
INSERT INTO `sys_log` VALUES (1778, 1, '2021-02-01 23:08:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-01 23:08:12', 1, '2021-02-01 23:08:12', 1, 0);
INSERT INTO `sys_log` VALUES (1779, 1, '2021-02-01 23:08:13', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-01 23:08:12', 1, '2021-02-01 23:08:12', 1, 0);
INSERT INTO `sys_log` VALUES (1780, 1, '2021-02-01 23:08:13', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 29, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:08:13', 1, '2021-02-01 23:08:13', 1, 0);
INSERT INTO `sys_log` VALUES (1781, 1, '2021-02-01 23:08:50', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 28, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-01 23:08:49', 1, '2021-02-01 23:08:49', 1, 0);
INSERT INTO `sys_log` VALUES (1782, 1, '2021-02-02 20:49:16', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 42, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 20:49:16', 1, '2021-02-02 20:49:16', 1, 0);
INSERT INTO `sys_log` VALUES (1783, 1, '2021-02-02 20:49:16', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 22, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 20:49:16', 1, '2021-02-02 20:49:16', 1, 0);
INSERT INTO `sys_log` VALUES (1784, 1, '2021-02-02 20:49:22', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 137, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 20:49:21', 1, '2021-02-02 20:49:21', 1, 0);
INSERT INTO `sys_log` VALUES (1785, 1, '2021-02-02 20:49:37', '127.0.0.1', '/api/file/manage/bak/4', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 11494, '通过主键备份一个文件资源', 'java.lang.NullPointerException', NULL, '2021-02-02 20:49:48', 1, '2021-02-02 20:49:48', 1, 0);
INSERT INTO `sys_log` VALUES (1786, 1, '2021-02-02 21:09:36', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 40, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 21:09:36', 1, '2021-02-02 21:09:36', 1, 0);
INSERT INTO `sys_log` VALUES (1787, 1, '2021-02-02 21:09:36', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 14, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 21:09:36', 1, '2021-02-02 21:09:36', 1, 0);
INSERT INTO `sys_log` VALUES (1788, 1, '2021-02-02 21:09:41', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 125, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 21:09:40', 1, '2021-02-02 21:09:40', 1, 0);
INSERT INTO `sys_log` VALUES (1789, 1, '2021-02-02 21:09:43', '127.0.0.1', '/api/file/manage/bak/4', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 7452, '通过主键备份一个文件资源', NULL, NULL, '2021-02-02 21:09:50', 1, '2021-02-02 21:09:50', 1, 0);
INSERT INTO `sys_log` VALUES (1790, 1, '2021-02-02 21:10:06', '127.0.0.1', '/api/file/manage/bak/5', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 9462, '通过主键备份一个文件资源', NULL, NULL, '2021-02-02 21:10:15', 1, '2021-02-02 21:10:15', 1, 0);
INSERT INTO `sys_log` VALUES (1791, 1, '2021-02-02 21:10:22', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 31, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 21:10:22', 1, '2021-02-02 21:10:22', 1, 0);
INSERT INTO `sys_log` VALUES (1792, 1, '2021-02-02 21:10:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 21:10:22', 1, '2021-02-02 21:10:22', 1, 0);
INSERT INTO `sys_log` VALUES (1793, 1, '2021-02-02 21:10:23', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 5, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 21:10:22', 1, '2021-02-02 21:10:22', 1, 0);
INSERT INTO `sys_log` VALUES (1794, 1, '2021-02-02 21:10:24', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 38, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 21:10:23', 1, '2021-02-02 21:10:23', 1, 0);
INSERT INTO `sys_log` VALUES (1795, 1, '2021-02-02 22:15:11', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 31, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:15:10', 1, '2021-02-02 22:15:10', 1, 0);
INSERT INTO `sys_log` VALUES (1796, 1, '2021-02-02 22:15:11', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 15, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:15:11', 1, '2021-02-02 22:15:11', 1, 0);
INSERT INTO `sys_log` VALUES (1797, 1, '2021-02-02 22:15:11', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 17, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:15:11', 1, '2021-02-02 22:15:11', 1, 0);
INSERT INTO `sys_log` VALUES (1798, 1, '2021-02-02 22:15:11', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', 68, '分页查询角色数据', NULL, NULL, '2021-02-02 22:15:11', 1, '2021-02-02 22:15:11', 1, 0);
INSERT INTO `sys_log` VALUES (1799, 1, '2021-02-02 22:15:14', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 62, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:15:14', 1, '2021-02-02 22:15:14', 1, 0);
INSERT INTO `sys_log` VALUES (1800, 1, '2021-02-02 22:15:21', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 18, '查询当前登录用户的信息数据', NULL, NULL, '2021-02-02 22:15:20', 1, '2021-02-02 22:15:20', 1, 0);
INSERT INTO `sys_log` VALUES (1801, 1, '2021-02-02 22:15:30', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 232, '上传用户头像', NULL, NULL, '2021-02-02 22:15:29', 1, '2021-02-02 22:15:29', 1, 0);
INSERT INTO `sys_log` VALUES (1802, 1, '2021-02-02 22:15:33', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 67, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:15:32', 1, '2021-02-02 22:15:32', 1, 0);
INSERT INTO `sys_log` VALUES (1803, 1, '2021-02-02 22:15:33', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 38, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:15:33', 1, '2021-02-02 22:15:33', 1, 0);
INSERT INTO `sys_log` VALUES (1804, 1, '2021-02-02 22:15:34', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 13, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:15:34', 1, '2021-02-02 22:15:34', 1, 0);
INSERT INTO `sys_log` VALUES (1805, 1, '2021-02-02 22:15:37', '127.0.0.1', '/api/file/manage/bak/22', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 3857, '通过主键备份一个文件资源', NULL, NULL, '2021-02-02 22:15:40', 1, '2021-02-02 22:15:40', 1, 0);
INSERT INTO `sys_log` VALUES (1806, 1, '2021-02-02 22:15:41', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 14, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:15:40', 1, '2021-02-02 22:15:40', 1, 0);
INSERT INTO `sys_log` VALUES (1807, 1, '2021-02-02 22:16:04', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 16, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:04', 1, '2021-02-02 22:16:04', 1, 0);
INSERT INTO `sys_log` VALUES (1808, 1, '2021-02-02 22:16:15', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 5, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:14', 1, '2021-02-02 22:16:14', 1, 0);
INSERT INTO `sys_log` VALUES (1809, 1, '2021-02-02 22:16:16', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 14, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:16', 1, '2021-02-02 22:16:16', 1, 0);
INSERT INTO `sys_log` VALUES (1810, 1, '2021-02-02 22:16:19', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 15, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:19', 1, '2021-02-02 22:16:19', 1, 0);
INSERT INTO `sys_log` VALUES (1811, 1, '2021-02-02 22:16:22', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 7, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:21', 1, '2021-02-02 22:16:21', 1, 0);
INSERT INTO `sys_log` VALUES (1812, 1, '2021-02-02 22:16:24', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 25, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:23', 1, '2021-02-02 22:16:23', 1, 0);
INSERT INTO `sys_log` VALUES (1813, 1, '2021-02-02 22:16:35', '127.0.0.1', '/api/file/manage/10', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 11, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 22:16:34', 1, '2021-02-02 22:16:34', 1, 0);
INSERT INTO `sys_log` VALUES (1814, 1, '2021-02-02 22:16:35', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 35, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:34', 1, '2021-02-02 22:16:34', 1, 0);
INSERT INTO `sys_log` VALUES (1815, 1, '2021-02-02 22:16:37', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 11, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:16:36', 1, '2021-02-02 22:16:36', 1, 0);
INSERT INTO `sys_log` VALUES (1816, 1, '2021-02-02 22:18:04', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 32, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:18:03', 1, '2021-02-02 22:18:03', 1, 0);
INSERT INTO `sys_log` VALUES (1817, 1, '2021-02-02 22:18:10', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:18:10', 1, '2021-02-02 22:18:10', 1, 0);
INSERT INTO `sys_log` VALUES (1818, 1, '2021-02-02 22:18:17', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 8, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:18:16', 1, '2021-02-02 22:18:16', 1, 0);
INSERT INTO `sys_log` VALUES (1819, 1, '2021-02-02 22:18:29', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 9311, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:18:37', 1, '2021-02-02 22:18:37', 1, 0);
INSERT INTO `sys_log` VALUES (1820, 1, '2021-02-02 22:19:08', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 76, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:19:07', 1, '2021-02-02 22:19:07', 1, 0);
INSERT INTO `sys_log` VALUES (1821, 1, '2021-02-02 22:19:09', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 37, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:19:09', 1, '2021-02-02 22:19:09', 1, 0);
INSERT INTO `sys_log` VALUES (1822, 1, '2021-02-02 22:19:37', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 28, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:19:36', 1, '2021-02-02 22:19:36', 1, 0);
INSERT INTO `sys_log` VALUES (1823, 1, '2021-02-02 22:19:47', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 6, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:19:46', 1, '2021-02-02 22:19:46', 1, 0);
INSERT INTO `sys_log` VALUES (1824, 1, '2021-02-02 22:21:09', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 29, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:09', 1, '2021-02-02 22:21:09', 1, 0);
INSERT INTO `sys_log` VALUES (1825, 1, '2021-02-02 22:21:11', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 10, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:10', 1, '2021-02-02 22:21:10', 1, 0);
INSERT INTO `sys_log` VALUES (1826, 1, '2021-02-02 22:21:21', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 31, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:21', 1, '2021-02-02 22:21:21', 1, 0);
INSERT INTO `sys_log` VALUES (1827, 1, '2021-02-02 22:21:24', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 11, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:23', 1, '2021-02-02 22:21:23', 1, 0);
INSERT INTO `sys_log` VALUES (1828, 1, '2021-02-02 22:21:25', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 22, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:24', 1, '2021-02-02 22:21:24', 1, 0);
INSERT INTO `sys_log` VALUES (1829, 1, '2021-02-02 22:21:32', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 30, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:32', 1, '2021-02-02 22:21:32', 1, 0);
INSERT INTO `sys_log` VALUES (1830, 1, '2021-02-02 22:21:36', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 7, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:36', 1, '2021-02-02 22:21:36', 1, 0);
INSERT INTO `sys_log` VALUES (1831, 1, '2021-02-02 22:21:44', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 7, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:21:44', 1, '2021-02-02 22:21:44', 1, 0);
INSERT INTO `sys_log` VALUES (1832, 1, '2021-02-02 22:22:23', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 40, '分页查询系统操作日志表数据', NULL, NULL, '2021-02-02 22:22:23', 1, '2021-02-02 22:22:23', 1, 0);
INSERT INTO `sys_log` VALUES (1833, 1, '2021-02-02 22:22:28', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 14, '分页查询系统操作日志表数据', NULL, NULL, '2021-02-02 22:22:27', 1, '2021-02-02 22:22:27', 1, 0);
INSERT INTO `sys_log` VALUES (1834, 1, '2021-02-02 22:22:29', '127.0.0.1', '/api/log/page/9', 'GET', 'class com.zero.sys.controller.LogController.page', 10, '分页查询系统操作日志表数据', NULL, NULL, '2021-02-02 22:22:29', 1, '2021-02-02 22:22:29', 1, 0);
INSERT INTO `sys_log` VALUES (1835, 1, '2021-02-02 22:23:18', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 28, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:17', 1, '2021-02-02 22:23:17', 1, 0);
INSERT INTO `sys_log` VALUES (1836, 1, '2021-02-02 22:23:20', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 22, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:20', 1, '2021-02-02 22:23:20', 1, 0);
INSERT INTO `sys_log` VALUES (1837, 1, '2021-02-02 22:23:33', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 6, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:33', 1, '2021-02-02 22:23:33', 1, 0);
INSERT INTO `sys_log` VALUES (1838, 1, '2021-02-02 22:23:36', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 20, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:36', 1, '2021-02-02 22:23:36', 1, 0);
INSERT INTO `sys_log` VALUES (1839, 1, '2021-02-02 22:23:39', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 8, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:38', 1, '2021-02-02 22:23:38', 1, 0);
INSERT INTO `sys_log` VALUES (1840, 1, '2021-02-02 22:23:40', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 25, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:23:39', 1, '2021-02-02 22:23:39', 1, 0);
INSERT INTO `sys_log` VALUES (1841, 1, '2021-02-02 22:24:25', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 10, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:24:24', 1, '2021-02-02 22:24:24', 1, 0);
INSERT INTO `sys_log` VALUES (1842, 1, '2021-02-02 22:24:32', '127.0.0.1', '/api/file/manage/bak/22', 'POST', 'class com.zero.upload.controller.FileManageController.bak', 962, '通过主键备份一个文件资源', NULL, NULL, '2021-02-02 22:24:32', 1, '2021-02-02 22:24:32', 1, 0);
INSERT INTO `sys_log` VALUES (1843, 1, '2021-02-02 22:24:33', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 10, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:24:32', 1, '2021-02-02 22:24:32', 1, 0);
INSERT INTO `sys_log` VALUES (1844, 1, '2021-02-02 22:29:14', '127.0.0.1', '/api/table/info/recover/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.recoverPage', 20, '分页查询逻辑删除的系统数据库表信息表数据', NULL, NULL, '2021-02-02 22:29:13', 1, '2021-02-02 22:29:13', 1, 0);
INSERT INTO `sys_log` VALUES (1845, 1, '2021-02-02 22:30:52', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 54, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:30:52', 1, '2021-02-02 22:30:52', 1, 0);
INSERT INTO `sys_log` VALUES (1846, 1, '2021-02-02 22:31:00', '127.0.0.1', '/api/menu', 'PUT', 'class com.zero.sys.controller.MenuController.updateById', 6, '[通用方法]更新一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 22:31:00', 1, '2021-02-02 22:31:00', 1, 0);
INSERT INTO `sys_log` VALUES (1847, 1, '2021-02-02 22:31:00', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 54, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:31:00', 1, '2021-02-02 22:31:00', 1, 0);
INSERT INTO `sys_log` VALUES (1848, 1, '2021-02-02 22:32:13', '127.0.0.1', '/api/menu', 'POST', 'class com.zero.sys.controller.MenuController.save', 6, '[通用方法]插入一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 22:32:12', 1, '2021-02-02 22:32:12', 1, 0);
INSERT INTO `sys_log` VALUES (1849, 1, '2021-02-02 22:32:13', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 58, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:32:13', 1, '2021-02-02 22:32:13', 1, 0);
INSERT INTO `sys_log` VALUES (1850, 1, '2021-02-02 22:32:14', '127.0.0.1', '/api/menu/role/23', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', 7, '获取该菜单未拥有的角色', NULL, NULL, '2021-02-02 22:32:14', 1, '2021-02-02 22:32:14', 1, 0);
INSERT INTO `sys_log` VALUES (1851, 1, '2021-02-02 22:32:16', '127.0.0.1', '/api/menu/role/23', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', 9, '添加菜单角色', NULL, NULL, '2021-02-02 22:32:16', 1, '2021-02-02 22:32:16', 1, 0);
INSERT INTO `sys_log` VALUES (1852, 1, '2021-02-02 22:32:16', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 45, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:32:16', 1, '2021-02-02 22:32:16', 1, 0);
INSERT INTO `sys_log` VALUES (1853, 1, '2021-02-02 22:32:29', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:29', 1, '2021-02-02 22:32:29', 1, 0);
INSERT INTO `sys_log` VALUES (1854, 1, '2021-02-02 22:32:29', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:29', 1, '2021-02-02 22:32:29', 1, 0);
INSERT INTO `sys_log` VALUES (1855, 1, '2021-02-02 22:32:29', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:32:29', 1, '2021-02-02 22:32:29', 1, 0);
INSERT INTO `sys_log` VALUES (1856, 1, '2021-02-02 22:32:30', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 58, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:32:29', 1, '2021-02-02 22:32:29', 1, 0);
INSERT INTO `sys_log` VALUES (1857, 1, '2021-02-02 22:32:45', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 16, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:45', 1, '2021-02-02 22:32:45', 1, 0);
INSERT INTO `sys_log` VALUES (1858, 1, '2021-02-02 22:32:45', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:45', 1, '2021-02-02 22:32:45', 1, 0);
INSERT INTO `sys_log` VALUES (1859, 1, '2021-02-02 22:32:45', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:32:45', 1, '2021-02-02 22:32:45', 1, 0);
INSERT INTO `sys_log` VALUES (1860, 1, '2021-02-02 22:32:51', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:51', 1, '2021-02-02 22:32:51', 1, 0);
INSERT INTO `sys_log` VALUES (1861, 1, '2021-02-02 22:32:51', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:32:51', 1, '2021-02-02 22:32:51', 1, 0);
INSERT INTO `sys_log` VALUES (1862, 1, '2021-02-02 22:32:51', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:32:51', 1, '2021-02-02 22:32:51', 1, 0);
INSERT INTO `sys_log` VALUES (1863, 1, '2021-02-02 22:34:29', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:34:29', 1, '2021-02-02 22:34:29', 1, 0);
INSERT INTO `sys_log` VALUES (1864, 1, '2021-02-02 22:34:29', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 2, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:34:29', 1, '2021-02-02 22:34:29', 1, 0);
INSERT INTO `sys_log` VALUES (1865, 1, '2021-02-02 22:34:33', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 53, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:34:33', 1, '2021-02-02 22:34:33', 1, 0);
INSERT INTO `sys_log` VALUES (1866, 1, '2021-02-02 22:35:57', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:35:56', 1, '2021-02-02 22:35:56', 1, 0);
INSERT INTO `sys_log` VALUES (1867, 1, '2021-02-02 22:35:57', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 13, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:35:56', 1, '2021-02-02 22:35:56', 1, 0);
INSERT INTO `sys_log` VALUES (1868, 1, '2021-02-02 22:35:57', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:35:56', 1, '2021-02-02 22:35:56', 1, 0);
INSERT INTO `sys_log` VALUES (1869, 1, '2021-02-02 22:35:58', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 52, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:35:57', 1, '2021-02-02 22:35:57', 1, 0);
INSERT INTO `sys_log` VALUES (1870, 1, '2021-02-02 22:39:10', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', 7, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-02-02 22:39:09', 1, '2021-02-02 22:39:09', 1, 0);
INSERT INTO `sys_log` VALUES (1871, 1, '2021-02-02 22:40:19', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 6, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:40:19', 1, '2021-02-02 22:40:19', 1, 0);
INSERT INTO `sys_log` VALUES (1872, 1, '2021-02-02 22:40:28', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 3, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-02-02 22:40:27', 1, '2021-02-02 22:40:27', 1, 0);
INSERT INTO `sys_log` VALUES (1873, 1, '2021-02-02 22:40:32', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 43, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:40:32', 1, '2021-02-02 22:40:32', 1, 0);
INSERT INTO `sys_log` VALUES (1874, 1, '2021-02-02 22:40:37', '127.0.0.1', '/api/menu/11', 'DELETE', 'class com.zero.sys.controller.MenuController.deleteById', 6, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 22:40:36', 1, '2021-02-02 22:40:36', 1, 0);
INSERT INTO `sys_log` VALUES (1875, 1, '2021-02-02 22:40:37', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 63, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 22:40:36', 1, '2021-02-02 22:40:36', 1, 0);
INSERT INTO `sys_log` VALUES (1876, 1, '2021-02-02 22:40:41', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 8, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-02-02 22:40:40', 1, '2021-02-02 22:40:40', 1, 0);
INSERT INTO `sys_log` VALUES (1877, 1, '2021-02-02 22:40:46', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:40:45', 1, '2021-02-02 22:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (1878, 1, '2021-02-02 22:40:46', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 3, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:40:45', 1, '2021-02-02 22:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (1879, 1, '2021-02-02 22:40:52', '127.0.0.1', '/api/table/info/recover/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.recoverPage', 4, '分页查询逻辑删除的系统数据库表信息表数据', NULL, NULL, '2021-02-02 22:40:52', 1, '2021-02-02 22:40:52', 1, 0);
INSERT INTO `sys_log` VALUES (1880, 1, '2021-02-02 22:40:54', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 32, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:40:54', 1, '2021-02-02 22:40:54', 1, 0);
INSERT INTO `sys_log` VALUES (1881, 1, '2021-02-02 22:40:57', '127.0.0.1', '/api/file/manage/12', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 5, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 22:40:57', 1, '2021-02-02 22:40:57', 1, 0);
INSERT INTO `sys_log` VALUES (1882, 1, '2021-02-02 22:40:57', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 44, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 22:40:57', 1, '2021-02-02 22:40:57', 1, 0);
INSERT INTO `sys_log` VALUES (1883, 1, '2021-02-02 22:40:59', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 6, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:40:59', 1, '2021-02-02 22:40:59', 1, 0);
INSERT INTO `sys_log` VALUES (1884, 1, '2021-02-02 22:42:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 55, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:42:12', 1, '2021-02-02 22:42:12', 1, 0);
INSERT INTO `sys_log` VALUES (1885, 1, '2021-02-02 22:42:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 19, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:42:12', 1, '2021-02-02 22:42:12', 1, 0);
INSERT INTO `sys_log` VALUES (1886, 1, '2021-02-02 22:42:13', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:42:12', 1, '2021-02-02 22:42:12', 1, 0);
INSERT INTO `sys_log` VALUES (1887, 1, '2021-02-02 22:42:13', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 7, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:42:13', 1, '2021-02-02 22:42:13', 1, 0);
INSERT INTO `sys_log` VALUES (1888, 1, '2021-02-02 22:43:56', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 7, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:43:55', 1, '2021-02-02 22:43:55', 1, 0);
INSERT INTO `sys_log` VALUES (1889, 1, '2021-02-02 22:46:12', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 5, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:46:12', 1, '2021-02-02 22:46:12', 1, 0);
INSERT INTO `sys_log` VALUES (1890, 1, '2021-02-02 22:46:45', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 42, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:46:45', 1, '2021-02-02 22:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (1891, 1, '2021-02-02 22:46:45', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:46:45', 1, '2021-02-02 22:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (1892, 1, '2021-02-02 22:46:45', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:46:45', 1, '2021-02-02 22:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (1893, 1, '2021-02-02 22:46:46', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 5, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:46:45', 1, '2021-02-02 22:46:45', 1, 0);
INSERT INTO `sys_log` VALUES (1894, 1, '2021-02-02 22:53:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:53:22', 1, '2021-02-02 22:53:22', 1, 0);
INSERT INTO `sys_log` VALUES (1895, 1, '2021-02-02 22:53:23', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 12, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:53:22', 1, '2021-02-02 22:53:22', 1, 0);
INSERT INTO `sys_log` VALUES (1896, 1, '2021-02-02 22:53:23', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 4, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:53:22', 1, '2021-02-02 22:53:22', 1, 0);
INSERT INTO `sys_log` VALUES (1897, 1, '2021-02-02 22:53:24', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 7, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:53:23', 1, '2021-02-02 22:53:23', 1, 0);
INSERT INTO `sys_log` VALUES (1898, 1, '2021-02-02 22:54:57', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 69, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:54:56', 1, '2021-02-02 22:54:56', 1, 0);
INSERT INTO `sys_log` VALUES (1899, 1, '2021-02-02 22:55:06', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 24, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:55:05', 1, '2021-02-02 22:55:05', 1, 0);
INSERT INTO `sys_log` VALUES (1900, 1, '2021-02-02 22:55:06', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 24, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 22:55:05', 1, '2021-02-02 22:55:05', 1, 0);
INSERT INTO `sys_log` VALUES (1901, 1, '2021-02-02 22:55:06', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 25, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 22:55:05', 1, '2021-02-02 22:55:05', 1, 0);
INSERT INTO `sys_log` VALUES (1902, 1, '2021-02-02 22:55:07', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 146, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:55:06', 1, '2021-02-02 22:55:06', 1, 0);
INSERT INTO `sys_log` VALUES (1903, 1, '2021-02-02 22:55:11', '127.0.0.1', '/api/file/manage/recover/12', 'PUT', 'class com.zero.upload.controller.FileManageController.recover', 6, '通过主键恢复逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:55:10', 1, '2021-02-02 22:55:10', 1, 0);
INSERT INTO `sys_log` VALUES (1904, 1, '2021-02-02 22:55:11', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 11, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:55:11', 1, '2021-02-02 22:55:11', 1, 0);
INSERT INTO `sys_log` VALUES (1905, 1, '2021-02-02 22:55:25', '127.0.0.1', '/api/file/manage/recover/10', 'PUT', 'class com.zero.upload.controller.FileManageController.recover', 7, '通过主键恢复逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:55:25', 1, '2021-02-02 22:55:25', 1, 0);
INSERT INTO `sys_log` VALUES (1906, 1, '2021-02-02 22:55:25', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 16, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:55:25', 1, '2021-02-02 22:55:25', 1, 0);
INSERT INTO `sys_log` VALUES (1907, 1, '2021-02-02 22:56:03', '127.0.0.1', '/api/file/manage/recover/9', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 9, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:02', 1, '2021-02-02 22:56:02', 1, 0);
INSERT INTO `sys_log` VALUES (1908, 1, '2021-02-02 22:56:03', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 6, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:02', 1, '2021-02-02 22:56:02', 1, 0);
INSERT INTO `sys_log` VALUES (1909, 1, '2021-02-02 22:56:20', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 7, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:19', 1, '2021-02-02 22:56:19', 1, 0);
INSERT INTO `sys_log` VALUES (1910, 1, '2021-02-02 22:56:23', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 13, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:23', 1, '2021-02-02 22:56:23', 1, 0);
INSERT INTO `sys_log` VALUES (1911, 1, '2021-02-02 22:56:25', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 8, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:24', 1, '2021-02-02 22:56:24', 1, 0);
INSERT INTO `sys_log` VALUES (1912, 1, '2021-02-02 22:56:27', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 13, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:27', 1, '2021-02-02 22:56:27', 1, 0);
INSERT INTO `sys_log` VALUES (1913, 1, '2021-02-02 22:56:29', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 10, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:29', 1, '2021-02-02 22:56:29', 1, 0);
INSERT INTO `sys_log` VALUES (1914, 1, '2021-02-02 22:56:35', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 10, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:34', 1, '2021-02-02 22:56:34', 1, 0);
INSERT INTO `sys_log` VALUES (1915, 1, '2021-02-02 22:56:42', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 10, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 22:56:42', 1, '2021-02-02 22:56:42', 1, 0);
INSERT INTO `sys_log` VALUES (1916, 1, '2021-02-02 23:00:58', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 178, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:00:58', 1, '2021-02-02 23:00:58', 1, 0);
INSERT INTO `sys_log` VALUES (1917, 1, '2021-02-02 23:01:03', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 103, '分页查询系统菜单表数据', NULL, NULL, '2021-02-02 23:01:03', 1, '2021-02-02 23:01:03', 1, 0);
INSERT INTO `sys_log` VALUES (1918, 1, '2021-02-02 23:01:04', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 32, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:01:04', 1, '2021-02-02 23:01:04', 1, 0);
INSERT INTO `sys_log` VALUES (1919, 1, '2021-02-02 23:01:07', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:01:06', 1, '2021-02-02 23:01:06', 1, 0);
INSERT INTO `sys_log` VALUES (1920, 1, '2021-02-02 23:01:11', '127.0.0.1', '/api/file/manage/24', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 10, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 23:01:11', 1, '2021-02-02 23:01:11', 1, 0);
INSERT INTO `sys_log` VALUES (1921, 1, '2021-02-02 23:01:11', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 12, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:01:11', 1, '2021-02-02 23:01:11', 1, 0);
INSERT INTO `sys_log` VALUES (1922, 1, '2021-02-02 23:01:15', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', 30, '分页查询系统操作日志表数据', NULL, NULL, '2021-02-02 23:01:14', 1, '2021-02-02 23:01:14', 1, 0);
INSERT INTO `sys_log` VALUES (1923, 1, '2021-02-02 23:01:19', '127.0.0.1', '/api/table/info/recover/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.recoverPage', 24, '分页查询逻辑删除的系统数据库表信息表数据', NULL, NULL, '2021-02-02 23:01:19', 1, '2021-02-02 23:01:19', 1, 0);
INSERT INTO `sys_log` VALUES (1924, 1, '2021-02-02 23:01:20', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 9, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:01:19', 1, '2021-02-02 23:01:19', 1, 0);
INSERT INTO `sys_log` VALUES (1925, 1, '2021-02-02 23:03:14', '127.0.0.1', '/api/menu/recover/page/1', 'GET', 'class com.zero.sys.controller.MenuController.recoverPage', 10, '分页查询逻辑删除的系统菜单表数据', NULL, NULL, '2021-02-02 23:03:14', 1, '2021-02-02 23:03:14', 1, 0);
INSERT INTO `sys_log` VALUES (1926, 1, '2021-02-02 23:03:18', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 11, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:03:18', 1, '2021-02-02 23:03:18', 1, 0);
INSERT INTO `sys_log` VALUES (1927, 1, '2021-02-02 23:06:24', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 84, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:06:23', 1, '2021-02-02 23:06:23', 1, 0);
INSERT INTO `sys_log` VALUES (1928, 1, '2021-02-02 23:06:45', '127.0.0.1', '/api/file/manage/recover/24', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 13, '通过主键彻底删除一条文件资源管理表数据', 'java.lang.NullPointerException', NULL, '2021-02-02 23:06:45', 1, '2021-02-02 23:06:45', 1, 0);
INSERT INTO `sys_log` VALUES (1929, 1, '2021-02-02 23:10:33', '127.0.0.1', '/api/file/manage/recover/24', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 936, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-02 23:10:33', 1, '2021-02-02 23:10:33', 1, 0);
INSERT INTO `sys_log` VALUES (1930, 1, '2021-02-02 23:10:40', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 110, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:10:39', 1, '2021-02-02 23:10:39', 1, 0);
INSERT INTO `sys_log` VALUES (1931, 1, '2021-02-02 23:13:51', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 163, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:13:51', 1, '2021-02-02 23:13:51', 1, 0);
INSERT INTO `sys_log` VALUES (1932, 1, '2021-02-02 23:13:54', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 14, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:13:53', 1, '2021-02-02 23:13:53', 1, 0);
INSERT INTO `sys_log` VALUES (1933, 1, '2021-02-02 23:13:58', '127.0.0.1', '/api/file/manage/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 11, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 23:13:58', 1, '2021-02-02 23:13:58', 1, 0);
INSERT INTO `sys_log` VALUES (1934, 1, '2021-02-02 23:13:58', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 18, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:13:58', 1, '2021-02-02 23:13:58', 1, 0);
INSERT INTO `sys_log` VALUES (1935, 1, '2021-02-02 23:14:01', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 11, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:14:00', 1, '2021-02-02 23:14:00', 1, 0);
INSERT INTO `sys_log` VALUES (1936, 1, '2021-02-02 23:14:33', '127.0.0.1', '/api/file/manage/recover/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 15, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-02 23:14:33', 1, '2021-02-02 23:14:33', 1, 0);
INSERT INTO `sys_log` VALUES (1937, 1, '2021-02-02 23:14:33', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 10, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:14:33', 1, '2021-02-02 23:14:33', 1, 0);
INSERT INTO `sys_log` VALUES (1938, 1, '2021-02-02 23:16:10', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 37, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 23:16:10', 1, '2021-02-02 23:16:10', 1, 0);
INSERT INTO `sys_log` VALUES (1939, 1, '2021-02-02 23:16:10', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 16, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 23:16:10', 1, '2021-02-02 23:16:10', 1, 0);
INSERT INTO `sys_log` VALUES (1940, 1, '2021-02-02 23:16:11', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 24, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 23:16:10', 1, '2021-02-02 23:16:10', 1, 0);
INSERT INTO `sys_log` VALUES (1941, 1, '2021-02-02 23:16:11', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 125, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:16:11', 1, '2021-02-02 23:16:11', 1, 0);
INSERT INTO `sys_log` VALUES (1942, 1, '2021-02-02 23:16:20', '127.0.0.1', '/api/file/manage/recover/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 28, '通过主键彻底删除一条文件资源管理表数据', 'java.io.FileNotFoundException', 'File does not exist: G:\\temp\\image\\2021\\1\\31\\104c2751-96fa-48fa-9768-04b2c66e0f40.jpg', '2021-02-02 23:16:20', 1, '2021-02-02 23:16:20', 1, 0);
INSERT INTO `sys_log` VALUES (1943, 1, '2021-02-02 23:17:36', '127.0.0.1', '/api/file/manage/recover/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 12, '通过主键彻底删除一条文件资源管理表数据', 'java.io.FileNotFoundException', 'File does not exist: G:\\temp\\image\\2021\\1\\31\\104c2751-96fa-48fa-9768-04b2c66e0f40.jpg', '2021-02-02 23:17:35', 1, '2021-02-02 23:17:35', 1, 0);
INSERT INTO `sys_log` VALUES (1944, 1, '2021-02-02 23:17:50', '127.0.0.1', '/api/file/manage/recover/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 12051, '通过主键彻底删除一条文件资源管理表数据', 'java.io.FileNotFoundException', 'File does not exist: G:\\temp\\image\\2021\\1\\31\\104c2751-96fa-48fa-9768-04b2c66e0f40.jpg', '2021-02-02 23:18:02', 1, '2021-02-02 23:18:02', 1, 0);
INSERT INTO `sys_log` VALUES (1945, 1, '2021-02-02 23:19:56', '127.0.0.1', '/api/file/manage/recover/23', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 4248, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:00', 1, '2021-02-02 23:20:00', 1, 0);
INSERT INTO `sys_log` VALUES (1946, 1, '2021-02-02 23:20:11', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 93, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:11', 1, '2021-02-02 23:20:11', 1, 0);
INSERT INTO `sys_log` VALUES (1947, 1, '2021-02-02 23:20:23', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 58, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:23', 1, '2021-02-02 23:20:23', 1, 0);
INSERT INTO `sys_log` VALUES (1948, 1, '2021-02-02 23:20:27', '127.0.0.1', '/api/file/manage/12', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 9, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-02 23:20:26', 1, '2021-02-02 23:20:26', 1, 0);
INSERT INTO `sys_log` VALUES (1949, 1, '2021-02-02 23:20:27', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 57, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:26', 1, '2021-02-02 23:20:26', 1, 0);
INSERT INTO `sys_log` VALUES (1950, 1, '2021-02-02 23:20:29', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 8, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:28', 1, '2021-02-02 23:20:28', 1, 0);
INSERT INTO `sys_log` VALUES (1951, 1, '2021-02-02 23:20:57', '127.0.0.1', '/api/file/manage/recover/12', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 92, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:57', 1, '2021-02-02 23:20:57', 1, 0);
INSERT INTO `sys_log` VALUES (1952, 1, '2021-02-02 23:20:57', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 10, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-02 23:20:57', 1, '2021-02-02 23:20:57', 1, 0);
INSERT INTO `sys_log` VALUES (1953, 1, '2021-02-02 23:33:46', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 29, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-02 23:33:46', 1, '2021-02-02 23:33:46', 1, 0);
INSERT INTO `sys_log` VALUES (1954, 1, '2021-02-02 23:33:46', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 25, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-02 23:33:46', 1, '2021-02-02 23:33:46', 1, 0);
INSERT INTO `sys_log` VALUES (1955, 1, '2021-02-02 23:33:53', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 386, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:33:53', 1, '2021-02-02 23:33:53', 1, 0);
INSERT INTO `sys_log` VALUES (1956, 1, '2021-02-02 23:33:55', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 11, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:33:54', 1, '2021-02-02 23:33:54', 1, 0);
INSERT INTO `sys_log` VALUES (1957, 1, '2021-02-02 23:33:56', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 43, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:33:56', 1, '2021-02-02 23:33:56', 1, 0);
INSERT INTO `sys_log` VALUES (1958, 1, '2021-02-02 23:34:00', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 16, '查询当前登录用户的信息数据', NULL, NULL, '2021-02-02 23:34:00', 1, '2021-02-02 23:34:00', 1, 0);
INSERT INTO `sys_log` VALUES (1959, 1, '2021-02-02 23:34:09', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 1021, '上传用户头像', NULL, NULL, '2021-02-02 23:34:10', 1, '2021-02-02 23:34:10', 1, 0);
INSERT INTO `sys_log` VALUES (1960, 1, '2021-02-02 23:34:13', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 52, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:34:12', 1, '2021-02-02 23:34:12', 1, 0);
INSERT INTO `sys_log` VALUES (1961, 1, '2021-02-02 23:34:14', '127.0.0.1', '/api/file/manage/page/2', 'GET', 'class com.zero.upload.controller.FileManageController.page', 13, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-02 23:34:14', 1, '2021-02-02 23:34:14', 1, 0);
INSERT INTO `sys_log` VALUES (1962, 1, '2021-02-02 23:35:26', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', 91, '查询当前登录用户的信息数据', NULL, NULL, '2021-02-02 23:35:25', 1, '2021-02-02 23:35:25', 1, 0);
INSERT INTO `sys_log` VALUES (1963, 1, '2021-02-02 23:35:28', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', 1072, '上传用户头像', NULL, NULL, '2021-02-02 23:35:29', 1, '2021-02-02 23:35:29', 1, 0);
INSERT INTO `sys_log` VALUES (1964, 1, '2021-02-03 20:40:15', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 30, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 20:40:14', 1, '2021-02-03 20:40:14', 1, 0);
INSERT INTO `sys_log` VALUES (1965, 1, '2021-02-03 20:40:15', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 15, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 20:40:14', 1, '2021-02-03 20:40:14', 1, 0);
INSERT INTO `sys_log` VALUES (1966, 1, '2021-02-03 20:44:22', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 142, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 20:44:21', 1, '2021-02-03 20:44:21', 1, 0);
INSERT INTO `sys_log` VALUES (1967, 1, '2021-02-03 20:44:27', '127.0.0.1', '/api/table/info/recover/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.recoverPage', 25, '分页查询逻辑删除的系统数据库表信息表数据', NULL, NULL, '2021-02-03 20:44:26', 1, '2021-02-03 20:44:26', 1, 0);
INSERT INTO `sys_log` VALUES (1968, 1, '2021-02-03 20:44:28', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 7, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-03 20:44:27', 1, '2021-02-03 20:44:27', 1, 0);
INSERT INTO `sys_log` VALUES (1969, 1, '2021-02-03 20:44:35', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 64, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 20:44:34', 1, '2021-02-03 20:44:34', 1, 0);
INSERT INTO `sys_log` VALUES (1970, 1, '2021-02-03 20:45:20', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 37, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 20:45:19', 1, '2021-02-03 20:45:19', 1, 0);
INSERT INTO `sys_log` VALUES (1971, 1, '2021-02-03 20:46:26', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 25, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 20:46:25', 1, '2021-02-03 20:46:25', 1, 0);
INSERT INTO `sys_log` VALUES (1972, 1, '2021-02-03 20:46:26', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 20:46:25', 1, '2021-02-03 20:46:25', 1, 0);
INSERT INTO `sys_log` VALUES (1973, 1, '2021-02-03 20:46:26', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 20:46:25', 1, '2021-02-03 20:46:25', 1, 0);
INSERT INTO `sys_log` VALUES (1974, 1, '2021-02-03 20:46:26', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 36, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 20:46:26', 1, '2021-02-03 20:46:26', 1, 0);
INSERT INTO `sys_log` VALUES (1975, 1, '2021-02-03 21:02:28', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 31, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:02:27', 1, '2021-02-03 21:02:27', 1, 0);
INSERT INTO `sys_log` VALUES (1976, 1, '2021-02-03 21:04:12', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 58, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:04:11', 1, '2021-02-03 21:04:11', 1, 0);
INSERT INTO `sys_log` VALUES (1977, 1, '2021-02-03 21:15:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 18, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:15:54', 1, '2021-02-03 21:15:54', 1, 0);
INSERT INTO `sys_log` VALUES (1978, 1, '2021-02-03 21:15:55', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 17, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:15:54', 1, '2021-02-03 21:15:54', 1, 0);
INSERT INTO `sys_log` VALUES (1979, 1, '2021-02-03 21:15:55', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 6, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 21:15:54', 1, '2021-02-03 21:15:54', 1, 0);
INSERT INTO `sys_log` VALUES (1980, 1, '2021-02-03 21:15:55', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 24, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:15:55', 1, '2021-02-03 21:15:55', 1, 0);
INSERT INTO `sys_log` VALUES (1981, 1, '2021-02-03 21:23:25', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 238, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:23:25', 1, '2021-02-03 21:23:25', 1, 0);
INSERT INTO `sys_log` VALUES (1982, 1, '2021-02-03 21:23:26', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', 55, '分页查询系统资源数据', NULL, NULL, '2021-02-03 21:23:25', 1, '2021-02-03 21:23:25', 1, 0);
INSERT INTO `sys_log` VALUES (1983, 1, '2021-02-03 21:23:27', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 67, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:23:27', 1, '2021-02-03 21:23:27', 1, 0);
INSERT INTO `sys_log` VALUES (1984, 1, '2021-02-03 21:25:43', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 79, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:25:43', 1, '2021-02-03 21:25:43', 1, 0);
INSERT INTO `sys_log` VALUES (1985, 1, '2021-02-03 21:29:12', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 40, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:29:12', 1, '2021-02-03 21:29:12', 1, 0);
INSERT INTO `sys_log` VALUES (1986, 1, '2021-02-03 21:29:45', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 38, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:29:45', 1, '2021-02-03 21:29:45', 1, 0);
INSERT INTO `sys_log` VALUES (1987, 1, '2021-02-03 21:30:15', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 40, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:30:15', 1, '2021-02-03 21:30:15', 1, 0);
INSERT INTO `sys_log` VALUES (1988, 1, '2021-02-03 21:31:12', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 37, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:31:12', 1, '2021-02-03 21:31:12', 1, 0);
INSERT INTO `sys_log` VALUES (1989, 1, '2021-02-03 21:31:26', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 3, '通过主键备份一个文件资源', NULL, NULL, '2021-02-03 21:31:26', 1, '2021-02-03 21:31:26', 1, 0);
INSERT INTO `sys_log` VALUES (1990, 1, '2021-02-03 21:40:42', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 53, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:40:41', 1, '2021-02-03 21:40:41', 1, 0);
INSERT INTO `sys_log` VALUES (1991, 1, '2021-02-03 21:40:42', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 30, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:40:41', 1, '2021-02-03 21:40:41', 1, 0);
INSERT INTO `sys_log` VALUES (1992, 1, '2021-02-03 21:40:42', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 20, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 21:40:41', 1, '2021-02-03 21:40:41', 1, 0);
INSERT INTO `sys_log` VALUES (1993, 1, '2021-02-03 21:40:43', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 318, '分页查询系统菜单表数据', NULL, NULL, '2021-02-03 21:40:42', 1, '2021-02-03 21:40:42', 1, 0);
INSERT INTO `sys_log` VALUES (1994, 1, '2021-02-03 21:40:45', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 136, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:40:45', 1, '2021-02-03 21:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (1995, 1, '2021-02-03 21:41:11', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 1183, '通过主键备份一个文件资源', NULL, NULL, '2021-02-03 21:41:12', 1, '2021-02-03 21:41:12', 1, 0);
INSERT INTO `sys_log` VALUES (1996, 1, '2021-02-03 21:43:24', '127.0.0.1', '/api/file/manage/13', 'DELETE', 'class com.zero.upload.controller.FileManageController.deleteById', 8, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-02-03 21:43:23', 1, '2021-02-03 21:43:23', 1, 0);
INSERT INTO `sys_log` VALUES (1997, 1, '2021-02-03 21:43:24', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 44, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:43:24', 1, '2021-02-03 21:43:24', 1, 0);
INSERT INTO `sys_log` VALUES (1998, 1, '2021-02-03 21:43:28', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 14, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-03 21:43:27', 1, '2021-02-03 21:43:27', 1, 0);
INSERT INTO `sys_log` VALUES (1999, 1, '2021-02-03 21:43:30', '127.0.0.1', '/api/file/manage/recover/13', 'DELETE', 'class com.zero.upload.controller.FileManageController.recoverDelete', 1001, '通过主键彻底删除一条文件资源管理表数据', NULL, NULL, '2021-02-03 21:43:31', 1, '2021-02-03 21:43:31', 1, 0);
INSERT INTO `sys_log` VALUES (2000, 1, '2021-02-03 21:43:31', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', 6, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-02-03 21:43:31', 1, '2021-02-03 21:43:31', 1, 0);
INSERT INTO `sys_log` VALUES (2001, 1, '2021-02-03 21:43:48', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 54, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:43:48', 1, '2021-02-03 21:43:48', 1, 0);
INSERT INTO `sys_log` VALUES (2002, 1, '2021-02-03 21:44:00', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 168, '通过主键备份一个文件资源', NULL, NULL, '2021-02-03 21:43:59', 1, '2021-02-03 21:43:59', 1, 0);
INSERT INTO `sys_log` VALUES (2003, 1, '2021-02-03 21:49:51', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 1183, '通过主键替换一个文件资源', NULL, NULL, '2021-02-03 21:49:52', 1, '2021-02-03 21:49:52', 1, 0);
INSERT INTO `sys_log` VALUES (2004, 1, '2021-02-03 21:51:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 51, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:51:29', 1, '2021-02-03 21:51:29', 1, 0);
INSERT INTO `sys_log` VALUES (2005, 1, '2021-02-03 21:51:30', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 25, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 21:51:29', 1, '2021-02-03 21:51:29', 1, 0);
INSERT INTO `sys_log` VALUES (2006, 1, '2021-02-03 21:51:30', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 24, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 21:51:29', 1, '2021-02-03 21:51:29', 1, 0);
INSERT INTO `sys_log` VALUES (2007, 1, '2021-02-03 21:51:30', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 128, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:51:30', 1, '2021-02-03 21:51:30', 1, 0);
INSERT INTO `sys_log` VALUES (2008, 1, '2021-02-03 21:53:55', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 47, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:53:55', 1, '2021-02-03 21:53:55', 1, 0);
INSERT INTO `sys_log` VALUES (2009, 1, '2021-02-03 21:54:08', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 1136, '通过主键替换一个文件资源', NULL, NULL, '2021-02-03 21:54:09', 1, '2021-02-03 21:54:09', 1, 0);
INSERT INTO `sys_log` VALUES (2010, 1, '2021-02-03 21:54:25', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 592, '通过主键替换一个文件资源', NULL, NULL, '2021-02-03 21:54:25', 1, '2021-02-03 21:54:25', 1, 0);
INSERT INTO `sys_log` VALUES (2011, 1, '2021-02-03 21:55:17', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 49, '分页查询用户数据', NULL, NULL, '2021-02-03 21:55:16', 1, '2021-02-03 21:55:16', 1, 0);
INSERT INTO `sys_log` VALUES (2012, 1, '2021-02-03 21:55:20', '127.0.0.1', '/api/user', 'PUT', 'class com.zero.auth.controller.UserController.updateById', 11, '[通用方法]更新一条对应实体类的数据库记录', NULL, NULL, '2021-02-03 21:55:20', 1, '2021-02-03 21:55:20', 1, 0);
INSERT INTO `sys_log` VALUES (2013, 1, '2021-02-03 21:55:21', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', 26, '分页查询用户数据', NULL, NULL, '2021-02-03 21:55:20', 1, '2021-02-03 21:55:20', 1, 0);
INSERT INTO `sys_log` VALUES (2014, 1, '2021-02-03 21:55:47', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 36, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:55:46', 1, '2021-02-03 21:55:46', 1, 0);
INSERT INTO `sys_log` VALUES (2015, 1, '2021-02-03 21:55:58', '127.0.0.1', '/api/file/manage/replace', 'POST', 'class com.zero.upload.controller.FileManageController.replace', 1157, '通过主键替换一个文件资源', NULL, NULL, '2021-02-03 21:55:59', 1, '2021-02-03 21:55:59', 1, 0);
INSERT INTO `sys_log` VALUES (2016, 1, '2021-02-03 21:57:01', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 50, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:57:01', 1, '2021-02-03 21:57:01', 1, 0);
INSERT INTO `sys_log` VALUES (2017, 1, '2021-02-03 21:57:03', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 78, '分页查询系统菜单表数据', NULL, NULL, '2021-02-03 21:57:02', 1, '2021-02-03 21:57:02', 1, 0);
INSERT INTO `sys_log` VALUES (2018, 1, '2021-02-03 21:57:04', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 29, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 21:57:04', 1, '2021-02-03 21:57:04', 1, 0);
INSERT INTO `sys_log` VALUES (2019, 1, '2021-02-03 21:57:05', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 1221, '导出文件资源管理表数据的Excel文件', NULL, NULL, '2021-02-03 21:57:05', 1, '2021-02-03 21:57:05', 1, 0);
INSERT INTO `sys_log` VALUES (2020, 1, '2021-02-03 22:07:44', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 88, '导出文件资源管理表数据的Excel文件', NULL, NULL, '2021-02-03 22:07:43', 1, '2021-02-03 22:07:43', 1, 0);
INSERT INTO `sys_log` VALUES (2021, 1, '2021-02-03 22:10:18', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 1762, '导出文件资源管理表数据的Excel文件', 'cn.afterturn.easypoi.exception.excel.ExcelExportException', 'Excel导出错误', '2021-02-03 22:10:20', 1, '2021-02-03 22:10:20', 1, 0);
INSERT INTO `sys_log` VALUES (2022, 1, '2021-02-03 22:10:29', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 66, '导出文件资源管理表数据的Excel文件', 'cn.afterturn.easypoi.exception.excel.ExcelExportException', 'Excel导出错误', '2021-02-03 22:10:29', 1, '2021-02-03 22:10:29', 1, 0);
INSERT INTO `sys_log` VALUES (2023, 1, '2021-02-03 22:10:32', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 39, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 22:10:31', 1, '2021-02-03 22:10:31', 1, 0);
INSERT INTO `sys_log` VALUES (2024, 1, '2021-02-03 22:10:32', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', 23, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-02-03 22:10:32', 1, '2021-02-03 22:10:32', 1, 0);
INSERT INTO `sys_log` VALUES (2025, 1, '2021-02-03 22:10:32', '127.0.0.1', '/api/user/token', 'GET', 'class com.zero.auth.controller.UserController.token', 21, '获取请求头上的accessToken，并根据accessToken返回用户信息', NULL, NULL, '2021-02-03 22:10:32', 1, '2021-02-03 22:10:32', 1, 0);
INSERT INTO `sys_log` VALUES (2026, 1, '2021-02-03 22:10:33', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 146, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 22:10:32', 1, '2021-02-03 22:10:32', 1, 0);
INSERT INTO `sys_log` VALUES (2027, 1, '2021-02-03 22:10:35', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 69, '导出文件资源管理表数据的Excel文件', 'cn.afterturn.easypoi.exception.excel.ExcelExportException', 'Excel导出错误', '2021-02-03 22:10:34', 1, '2021-02-03 22:10:34', 1, 0);
INSERT INTO `sys_log` VALUES (2028, 1, '2021-02-03 22:10:50', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 74, '分页查询系统菜单表数据', NULL, NULL, '2021-02-03 22:10:50', 1, '2021-02-03 22:10:50', 1, 0);
INSERT INTO `sys_log` VALUES (2029, 1, '2021-02-03 22:10:52', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 35, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 22:10:52', 1, '2021-02-03 22:10:52', 1, 0);
INSERT INTO `sys_log` VALUES (2030, 1, '2021-02-03 22:10:53', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 52, '导出文件资源管理表数据的Excel文件', 'cn.afterturn.easypoi.exception.excel.ExcelExportException', 'Excel导出错误', '2021-02-03 22:10:53', 1, '2021-02-03 22:10:53', 1, 0);
INSERT INTO `sys_log` VALUES (2031, 1, '2021-02-03 22:12:06', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 1233, '导出文件资源管理表数据的Excel文件', 'cn.afterturn.easypoi.exception.excel.ExcelExportException', 'Excel导出错误', '2021-02-03 22:12:07', 1, '2021-02-03 22:12:07', 1, 0);
INSERT INTO `sys_log` VALUES (2032, 1, '2021-02-03 22:13:42', '127.0.0.1', '/api/file/manage/export/excel', 'GET', 'class com.zero.upload.controller.FileManageController.exportExcel', 1405, '导出文件资源管理表数据的Excel文件', NULL, NULL, '2021-02-03 22:13:43', 1, '2021-02-03 22:13:43', 1, 0);
INSERT INTO `sys_log` VALUES (2033, 1, '2021-02-03 22:15:00', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', 146, '分页查询系统菜单表数据', NULL, NULL, '2021-02-03 22:15:00', 1, '2021-02-03 22:15:00', 1, 0);
INSERT INTO `sys_log` VALUES (2034, 1, '2021-02-03 22:15:02', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', 66, '分页查询文件资源管理表数据', NULL, NULL, '2021-02-03 22:15:01', 1, '2021-02-03 22:15:01', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_menu` VALUES (11, 'http://127.0.0.1:10000/api/swagger-ui/index.html', 'Swagger2', '', '项目文档', 'el-icon-notebook-2', NULL, 2, 1, 9, '2020-11-18 00:03:34', 0, '2021-02-02 22:40:36', 1, 1);
INSERT INTO `sys_menu` VALUES (12, '/recover', 'Recover', 'Layout', '回收站', 'el-icon-delete-solid', '/recover/user', 4, 1, 0, '2020-11-29 22:13:02', 1, '2020-12-28 20:50:58', 1, 0);
INSERT INTO `sys_menu` VALUES (13, 'user', 'User', 'recover/user/index', '用户数据', 'el-icon-user-solid', NULL, 1, 1, 12, '2020-11-29 22:16:53', 1, '2020-11-29 22:17:57', 1, 0);
INSERT INTO `sys_menu` VALUES (14, 'role', 'Role', 'recover/role/index', '角色数据', 'el-icon-price-tag', NULL, 2, 1, 12, '2020-11-30 22:32:29', 1, '2020-11-30 22:33:42', 1, 0);
INSERT INTO `sys_menu` VALUES (15, 'resources', 'Resources', 'recover/resources/index', '资源数据', 'el-icon-star-off', NULL, 3, 1, 12, '2020-12-01 19:46:53', 1, '2020-12-01 19:47:54', 1, 0);
INSERT INTO `sys_menu` VALUES (16, 'menu', 'Menu', 'recover/menu/index', '菜单数据', 'el-icon-guide', NULL, 4, 1, 12, '2020-12-01 20:39:18', 1, '2020-12-01 20:40:04', 1, 0);
INSERT INTO `sys_menu` VALUES (17, 'log', 'Log', 'recover/log/index', '日志数据', 'el-icon-tickets', NULL, 5, 1, 12, '2020-12-01 22:36:03', 1, '2020-12-01 22:36:55', 1, 0);
INSERT INTO `sys_menu` VALUES (18, 'code-generation', 'CodeGeneration', 'recover/code-generation/index', '数据库表数据', 'el-icon-refresh-right', NULL, 7, 1, 12, '2020-12-01 22:45:52', 1, '2021-02-02 22:31:00', 1, 0);
INSERT INTO `sys_menu` VALUES (19, '/setting', 'Setting', 'Layout', '系统设置', 'el-icon-setting', '/setting/password', 3, 1, 0, '2020-12-28 20:53:06', 1, '2020-12-28 20:53:49', 1, 0);
INSERT INTO `sys_menu` VALUES (20, 'password', 'Password', 'setting/password/index', '密码设置', 'el-icon-more-outline', NULL, 1, 1, 19, '2020-12-28 21:01:44', 1, '2020-12-28 21:02:45', 1, 0);
INSERT INTO `sys_menu` VALUES (21, 'user-info', 'UserInfo', 'setting/user-info/index', '用户信息', 'el-icon-edit', NULL, 2, 1, 19, '2021-01-04 19:51:21', 1, '2021-01-04 20:34:57', 1, 0);
INSERT INTO `sys_menu` VALUES (22, 'file-manage', 'FileManage', 'data/file-manage/index', '文件管理', 'el-icon-folder-opened', NULL, 5, 1, 1, '2021-01-30 18:40:45', 1, '2021-01-31 22:33:51', 1, 0);
INSERT INTO `sys_menu` VALUES (23, 'file-manage', 'FileManage', 'recover/file-manage/index', '文件数据', 'el-icon-folder', NULL, 6, 1, 12, '2021-02-02 22:32:12', 1, '2021-02-02 22:32:12', 1, 0);

-- ----------------------------
-- Table structure for sys_menu_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_copy1`;
CREATE TABLE `sys_menu_copy1`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu_copy1
-- ----------------------------
INSERT INTO `sys_menu_copy1` VALUES (1, '/data', 'Data', 'Layout', '数据管理', 'el-icon-s-help', '/data/user', 1, 1, 0, '2020-11-15 23:25:21', 0, '2020-12-01 20:59:37', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (2, 'user', 'User', 'data/user/index', '用户管理', 'el-icon-user', NULL, 1, 1, 1, '2020-11-15 23:28:06', 0, '2020-12-29 22:10:21', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (3, 'role', 'Role', 'data/role/index', '角色管理', 'el-icon-discount', NULL, 2, 1, 1, '2020-11-17 23:32:23', 0, '2020-11-22 23:00:48', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (4, 'resources', 'Resources', 'data/resources/index', '资源管理', 'el-icon-star-on', NULL, 3, 1, 1, '2020-11-17 23:53:50', 0, '2020-11-22 23:06:12', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (5, 'menu', 'Menu', 'data/menu/index', '菜单管理', 'el-icon-guide', NULL, 4, 1, 1, '2020-11-17 23:54:27', 0, '2020-11-22 23:00:49', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (6, '/system', 'System', 'Layout', '系统监控', 'el-icon-view', '/system/server', 2, 1, 0, '2020-11-17 23:56:14', 0, '2020-12-01 20:59:55', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (7, 'server', 'Server', 'system/server/index', '服务器监控', 'el-icon-monitor', NULL, 1, 1, 6, '2020-11-17 23:57:27', 0, '2020-11-22 23:00:45', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (8, 'log', 'Log', 'system/log/index', '日志管理', 'el-icon-tickets', NULL, 2, 1, 6, '2020-11-17 23:58:00', 0, '2020-11-22 23:00:49', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (9, '/development', 'Development', 'Layout', '系统开发', 'el-icon-monitor', '/development/code-generation', 5, 1, 0, '2020-11-17 23:59:02', 0, '2021-01-03 16:55:59', 22, 0);
INSERT INTO `sys_menu_copy1` VALUES (10, 'code-generation', 'CodeGeneration', 'development/code-generation/index', '代码生成', 'el-icon-refresh-right', NULL, 1, 1, 9, '2020-11-17 23:59:58', 0, '2020-12-01 22:18:16', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (11, 'http://127.0.0.1:10000/api/swagger-ui/index.html', 'Swagger2', '', '项目文档', 'el-icon-notebook-2', NULL, 2, 1, 9, '2020-11-18 00:03:34', 0, '2021-02-02 22:40:36', 1, 1);
INSERT INTO `sys_menu_copy1` VALUES (12, '/recover', 'Recover', 'Layout', '回收站', 'el-icon-delete-solid', '/recover/user', 4, 1, 0, '2020-11-29 22:13:02', 1, '2020-12-28 20:50:58', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (13, 'user', 'User', 'recover/user/index', '用户数据', 'el-icon-user-solid', NULL, 1, 1, 12, '2020-11-29 22:16:53', 1, '2020-11-29 22:17:57', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (14, 'role', 'Role', 'recover/role/index', '角色数据', 'el-icon-price-tag', NULL, 2, 1, 12, '2020-11-30 22:32:29', 1, '2020-11-30 22:33:42', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (15, 'resources', 'Resources', 'recover/resources/index', '资源数据', 'el-icon-star-off', NULL, 3, 1, 12, '2020-12-01 19:46:53', 1, '2020-12-01 19:47:54', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (16, 'menu', 'Menu', 'recover/menu/index', '菜单数据', 'el-icon-guide', NULL, 4, 1, 12, '2020-12-01 20:39:18', 1, '2020-12-01 20:40:04', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (17, 'log', 'Log', 'recover/log/index', '日志数据', 'el-icon-tickets', NULL, 5, 1, 12, '2020-12-01 22:36:03', 1, '2020-12-01 22:36:55', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (18, 'code-generation', 'CodeGeneration', 'recover/code-generation/index', '数据库表数据', 'el-icon-refresh-right', NULL, 7, 1, 12, '2020-12-01 22:45:52', 1, '2021-02-02 22:31:00', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (19, '/setting', 'Setting', 'Layout', '系统设置', 'el-icon-setting', '/setting/password', 3, 1, 0, '2020-12-28 20:53:06', 1, '2020-12-28 20:53:49', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (20, 'password', 'Password', 'setting/password/index', '密码设置', 'el-icon-more-outline', NULL, 1, 1, 19, '2020-12-28 21:01:44', 1, '2020-12-28 21:02:45', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (21, 'user-info', 'UserInfo', 'setting/user-info/index', '用户信息', 'el-icon-edit', NULL, 2, 1, 19, '2021-01-04 19:51:21', 1, '2021-01-04 20:34:57', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (22, 'file-manage', 'FileManage', 'data/file-manage/index', '文件管理', 'el-icon-folder-opened', NULL, 5, 1, 1, '2021-01-30 18:40:45', 1, '2021-01-31 22:33:51', 1, 0);
INSERT INTO `sys_menu_copy1` VALUES (23, 'file-manage', 'FileManage', 'recover/file-manage/index', '文件数据', 'el-icon-folder', NULL, 6, 1, 12, '2021-02-02 22:32:12', 1, '2021-02-02 22:32:12', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单角色关系表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_menu_role` VALUES (38, 21, 1, '2021-01-04 19:51:24', 1, '2021-01-04 19:51:24', 1, 0);
INSERT INTO `sys_menu_role` VALUES (39, 21, 3, '2021-01-16 22:36:58', 1, '2021-01-16 22:36:58', 1, 0);
INSERT INTO `sys_menu_role` VALUES (40, 22, 1, '2021-01-30 18:40:47', 1, '2021-01-30 18:40:47', 1, 0);
INSERT INTO `sys_menu_role` VALUES (41, 22, 3, '2021-01-30 18:40:49', 1, '2021-01-30 18:40:49', 1, 0);
INSERT INTO `sys_menu_role` VALUES (42, 23, 1, '2021-02-02 22:32:16', 1, '2021-02-02 22:32:16', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES (1, '/log/list', '^/log/list$', '查询所有的系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (2, '/log/page/{currentPage}', '^/log/page/[0-9]+$', '分页查询系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (3, '/log/recover/page/{currentPage}', '^/log/recover/page/[0-9]+$', '分页查询逻辑删除的系统操作日志表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (4, '/log/recover/{id}', '^/log/recover/[0-9]+$', '通过主键彻底删除一条系统操作日志表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (5, '/log/recover/{id}', '^/log/recover/[0-9]+$', '通过主键恢复逻辑删除的系统操作日志表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (6, '/log/export/excel', '^/log/export/excel$', '导出操作日志列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (7, '/log', '^/log$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (8, '/log', '^/log$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (9, '/log/{id}', '^/log/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (10, '/menu/enabled/{id}', '^/menu/enabled/[0-9]+$', '启用或者禁用一个菜单', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-31 10:13:26', 0, 0);
INSERT INTO `sys_resources` VALUES (11, '/menu/page/{currentPage}', '^/menu/page/[0-9]+$', '分页查询系统菜单表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (12, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '获取该菜单未拥有的角色', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (13, '/menu/recover/page/{currentPage}', '^/menu/recover/page/[0-9]+$', '分页查询逻辑删除的系统菜单表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (14, '/menu/recover/{id}', '^/menu/recover/[0-9]+$', '通过主键彻底删除一条系统菜单表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (15, '/menu/recover/{id}', '^/menu/recover/[0-9]+$', '通过主键恢复逻辑删除的系统菜单表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (16, '/menu/routes', '^/menu/routes$', '[动态路由]获取所有启用的系统菜单', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (17, '/menu/export/excel', '^/menu/export/excel$', '导出系统菜单列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (18, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '添加菜单角色', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (19, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '删除菜单角色', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (20, '/menu', '^/menu$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (21, '/menu', '^/menu$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (22, '/menu/{id}', '^/menu/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (23, '/resources/page/{currentPage}', '^/resources/page/[0-9]+$', '分页查询系统资源数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (24, '/resources/recover/page/{currentPage}', '^/resources/recover/page/[0-9]+$', '分页查询逻辑删除的系统资源表数据', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (25, '/resources/recover/{id}', '^/resources/recover/[0-9]+$', '通过主键彻底删除一条系统资源表数据', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (26, '/resources/recover/{id}', '^/resources/recover/[0-9]+$', '通过主键恢复逻辑删除的系统资源表数据', 'PUT', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (27, '/resources/export/excel', '^/resources/export/excel$', '导出系统资源列表数据的Excel文件', 'GET', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (28, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '添加系统资源角色', 'POST', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (29, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '删除系统资源角色', 'DELETE', '2021-01-03 16:22:28', 0, '2021-01-03 16:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (30, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '获取未拥有该系统资源的角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (31, '/resources', '^/resources$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (32, '/resources', '^/resources$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (33, '/resources/{id}', '^/resources/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (34, '/role/check/name', '^/role/check/name$', '检测角色名称是否已存在', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (35, '/role/list', '^/role/list$', '获取所有的用户角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (36, '/role/page/{currentPage}', '^/role/page/[0-9]+$', '分页查询角色数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (37, '/role/recover/page/{currentPage}', '^/role/recover/page/[0-9]+$', '分页查询逻辑删除的系统角色表数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (38, '/role/recover/{id}', '^/role/recover/[0-9]+$', '通过主键彻底删除一条系统角色表数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (39, '/role/recover/{id}', '^/role/recover/[0-9]+$', '通过主键恢复逻辑删除的系统角色表数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (40, '/role/export/excel', '^/role/export/excel$', '导出角色列表数据的Excel文件', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (41, '/role', '^/role$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (42, '/role', '^/role$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (43, '/role/{id}', '^/role/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (44, '/user/enabled/{id}', '^/user/enabled/[0-9]+$', '启用或者禁用一个用户账号', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (45, '/user/token', '^/user/token$', '获取请求头上的accessToken，并根据accessToken返回用户信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-11 22:03:00', 0, 0);
INSERT INTO `sys_resources` VALUES (46, '/user/page/{currentPage}', '^/user/page/[0-9]+$', '分页查询用户数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (47, '/user/recover/page/{currentPage}', '^/user/recover/page/[0-9]+$', '分页查询逻辑删除的用户数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (48, '/user/recover/{id}', '^/user/recover/[0-9]+$', '通过主键彻底删除一条用户数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (49, '/user/recover/{id}', '^/user/recover/[0-9]+$', '通过主键恢复逻辑删除的用户数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (50, '/user/export/excel', '^/user/export/excel$', '导出用户列表数据的Excel文件', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (51, '/user/role/{userId}', '^/user/role/[0-9]+$', '添加用户角色', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (52, '/user/role/{userId}', '^/user/role/[0-9]+$', '删除用户角色', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (53, '/user/check/password', '^/user/check/password$', '检测用户密码是否正确', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (54, '/user/check/username', '^/user/check/username$', '检测用户名是否已存在', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (55, '/user/reset/password', '^/user/reset/password$', '重置用户账号密码', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (56, '/user/role/{userId}', '^/user/role/[0-9]+$', '获取该用户未拥有的角色', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (57, '/user', '^/user$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (58, '/user', '^/user$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (59, '/user/{id}', '^/user/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (60, '/server/info', '^/server/info$', '获取系统服务器的监控信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (61, '/server/piechart', '^/server/piechart$', '获取系统服务器的CPU，内存，JVM饼图信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (62, '/table/info/page/{currentPage}', '^/table/info/page/[0-9]+$', '分页查询系统数据库表信息数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (63, '/table/info/recover/page/{currentPage}', '^/table/info/recover/page/[0-9]+$', '分页查询逻辑删除的系统数据库表信息表数据', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (64, '/table/info/recover/{id}', '^/table/info/recover/[0-9]+$', '通过主键彻底删除一条系统数据库表信息表数据', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (65, '/table/info/recover/{id}', '^/table/info/recover/[0-9]+$', '通过主键恢复逻辑删除的系统数据库表信息表数据', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (66, '/table/info/not/list', '^/table/info/not/list$', '获取还没有插入数据库中的数据库表信息', 'GET', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (67, '/table/info/code/generation/{id}', '^/table/info/code/generation/[0-9]+$', '生成代码', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (68, '/table/info', '^/table/info$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (69, '/table/info', '^/table/info$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (70, '/table/info/{id}', '^/table/info/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-03 16:22:29', 0, '2021-01-03 16:22:29', 0, 0);
INSERT INTO `sys_resources` VALUES (71, '/upload/image', '^/upload/image$', '上传图片文件', 'POST', '2021-01-09 22:32:20', 0, '2021-01-09 22:32:20', 0, 0);
INSERT INTO `sys_resources` VALUES (72, '/user/info/list', '^/user/info/list$', '查询所有的系统用户信息表数据', 'GET', '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources` VALUES (73, '/user/info/page/{currentPage}', '^/user/info/page/[0-9]+$', '分页查询系统用户信息表数据', 'GET', '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources` VALUES (74, '/user/info/export/excel', '^/user/info/export/excel$', '导出系统用户信息表数据的Excel文件', 'GET', '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources` VALUES (75, '/user/info/recover/page/{currentPage}', '^/user/info/recover/page/[0-9]+$', '分页查询逻辑删除的系统用户信息表数据', 'GET', '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources` VALUES (76, '/user/info/recover/{id}', '^/user/info/recover/[0-9]+$', '通过主键恢复逻辑删除的系统用户信息表数据', 'PUT', '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources` VALUES (77, '/user/info/recover/{id}', '^/user/info/recover/[0-9]+$', '通过主键彻底删除一条系统用户信息表数据', 'DELETE', '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources` VALUES (78, '/user/info', '^/user/info$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources` VALUES (79, '/user/info/{id}', '^/user/info/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources` VALUES (80, '/user/info', '^/user/info$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources` VALUES (81, '/user/info/avatar', '^/user/info/avatar$', '上传用户头像', 'POST', '2021-01-12 22:44:54', 0, '2021-01-12 22:44:54', 0, 0);
INSERT INTO `sys_resources` VALUES (82, '/user/info/avatar', '^/user/info/avatar$', '获取用户头像路径', 'GET', '2021-01-13 23:53:10', 0, '2021-01-13 23:53:10', 0, 0);
INSERT INTO `sys_resources` VALUES (83, '/log/{id}', '^/log/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:41', 0, '2021-01-14 19:51:41', 0, 0);
INSERT INTO `sys_resources` VALUES (84, '/menu/{id}', '^/menu/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:41', 0, '2021-01-14 19:51:41', 0, 0);
INSERT INTO `sys_resources` VALUES (85, '/resources/{id}', '^/resources/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources` VALUES (86, '/role/{id}', '^/role/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources` VALUES (87, '/user/{id}', '^/user/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources` VALUES (88, '/user/info/{id}', '^/user/info/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources` VALUES (89, '/table/info/{id}', '^/table/info/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources` VALUES (144, '/user/info', '^/user/info$', '查询当前登录用户的信息数据', 'GET', '2021-01-16 20:40:52', 0, '2021-01-16 20:42:18', 0, 0);
INSERT INTO `sys_resources` VALUES (145, '/mail/text', '^/mail/text$', '发送普通文本邮件', 'POST', '2021-01-17 20:15:20', 0, '2021-01-17 20:15:20', 0, 0);
INSERT INTO `sys_resources` VALUES (146, '/mail/template', '^/mail/template$', '发送HTML模板邮件', 'POST', '2021-01-17 20:15:20', 0, '2021-01-17 20:15:20', 0, 0);
INSERT INTO `sys_resources` VALUES (148, '/user/info/mail/verify/send', '^/user/info/mail/verify/send$', '发送电子邮件号码验证邮件', 'POST', '2021-01-17 22:01:59', 0, '2021-01-18 20:23:23', 0, 0);
INSERT INTO `sys_resources` VALUES (149, '/user/info/mail/verify', '^/user/info/mail/verify$', '验证邮件验证码', 'POST', '2021-01-18 21:22:28', 0, '2021-01-18 21:22:28', 0, 0);
INSERT INTO `sys_resources` VALUES (160, '/file/manage/list', '^/file/manage/list$', '查询所有的文件资源管理表数据', 'GET', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (161, '/file/manage/recover/{id}', '^/file/manage/recover/[0-9]+$', '通过主键彻底删除一条文件资源管理表数据', 'DELETE', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (162, '/file/manage/recover/{id}', '^/file/manage/recover/[0-9]+$', '通过主键恢复逻辑删除的文件资源管理表数据', 'PUT', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (163, '/file/manage/recover/page/{currentPage}', '^/file/manage/recover/page/[0-9]+$', '分页查询逻辑删除的文件资源管理表数据', 'GET', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (164, '/file/manage/export/excel', '^/file/manage/export/excel$', '导出文件资源管理表数据的Excel文件', 'GET', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (165, '/file/manage/page/{currentPage}', '^/file/manage/page/[0-9]+$', '分页查询文件资源管理表数据', 'GET', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (166, '/file/manage', '^/file/manage$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (167, '/file/manage/{id}', '^/file/manage/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (168, '/file/manage', '^/file/manage$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources` VALUES (169, '/file/manage/{id}', '^/file/manage/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-01-31 21:51:45', 0, '2021-01-31 21:51:45', 0, 0);
INSERT INTO `sys_resources` VALUES (170, '/file/manage/bak/{id}', '^/file/manage/bak/[0-9]+$', '通过主键备份一个文件资源', 'POST', '2021-02-01 22:18:51', 0, '2021-02-01 22:18:51', 0, 0);
INSERT INTO `sys_resources` VALUES (171, '/file/manage/replace', '^/file/manage/replace$', '通过主键替换一个文件资源', 'POST', '2021-02-03 21:21:17', 0, '2021-02-03 21:21:17', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源角色关系表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_resources_role` VALUES (121, 71, 1, '2021-01-09 22:32:20', 0, '2021-01-09 22:32:20', 0, 0);
INSERT INTO `sys_resources_role` VALUES (122, 72, 1, '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources_role` VALUES (123, 73, 1, '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources_role` VALUES (124, 74, 1, '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources_role` VALUES (125, 75, 1, '2021-01-11 22:04:01', 0, '2021-01-11 22:04:01', 0, 0);
INSERT INTO `sys_resources_role` VALUES (126, 76, 1, '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources_role` VALUES (127, 77, 1, '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources_role` VALUES (128, 78, 1, '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources_role` VALUES (129, 79, 1, '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources_role` VALUES (130, 80, 1, '2021-01-11 22:04:02', 0, '2021-01-11 22:04:02', 0, 0);
INSERT INTO `sys_resources_role` VALUES (131, 81, 1, '2021-01-12 22:44:54', 0, '2021-01-12 22:44:54', 0, 0);
INSERT INTO `sys_resources_role` VALUES (132, 82, 1, '2021-01-13 23:53:10', 0, '2021-01-13 23:53:10', 0, 0);
INSERT INTO `sys_resources_role` VALUES (133, 83, 1, '2021-01-14 19:51:41', 0, '2021-01-14 19:51:41', 0, 0);
INSERT INTO `sys_resources_role` VALUES (134, 84, 1, '2021-01-14 19:51:41', 0, '2021-01-14 19:51:41', 0, 0);
INSERT INTO `sys_resources_role` VALUES (135, 85, 1, '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources_role` VALUES (136, 86, 1, '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources_role` VALUES (137, 87, 1, '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources_role` VALUES (138, 88, 1, '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources_role` VALUES (139, 89, 1, '2021-01-14 19:51:42', 0, '2021-01-14 19:51:42', 0, 0);
INSERT INTO `sys_resources_role` VALUES (140, 90, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (141, 91, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (142, 92, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (143, 93, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (144, 94, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (145, 95, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (146, 96, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (147, 97, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (148, 98, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (149, 99, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (150, 100, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (151, 101, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (152, 102, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (153, 103, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (154, 104, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (155, 105, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (156, 106, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (157, 107, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (158, 108, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (159, 109, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (160, 110, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (161, 111, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (162, 112, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (163, 113, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (164, 114, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (165, 115, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (166, 116, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (167, 117, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (168, 118, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (169, 119, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (170, 120, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (171, 121, 1, '2021-01-14 20:09:22', 0, '2021-01-14 20:09:22', 0, 0);
INSERT INTO `sys_resources_role` VALUES (172, 122, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (173, 123, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (174, 124, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (175, 125, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (176, 126, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (177, 127, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (178, 128, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (179, 129, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (180, 130, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (181, 131, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (182, 132, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (183, 133, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (184, 134, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (185, 135, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (186, 136, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (187, 137, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (188, 138, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (189, 139, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (190, 140, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (191, 141, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (192, 142, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (193, 143, 1, '2021-01-14 20:09:23', 0, '2021-01-14 20:09:23', 0, 0);
INSERT INTO `sys_resources_role` VALUES (194, 144, 1, '2021-01-16 20:40:52', 0, '2021-01-16 20:40:52', 0, 0);
INSERT INTO `sys_resources_role` VALUES (195, 80, 3, '2021-01-16 22:37:22', 1, '2021-01-16 22:37:22', 1, 0);
INSERT INTO `sys_resources_role` VALUES (196, 81, 3, '2021-01-16 22:37:23', 1, '2021-01-16 22:37:23', 1, 0);
INSERT INTO `sys_resources_role` VALUES (197, 78, 3, '2021-01-16 22:37:27', 1, '2021-01-16 22:37:27', 1, 0);
INSERT INTO `sys_resources_role` VALUES (198, 74, 3, '2021-01-16 22:37:34', 1, '2021-01-16 22:37:34', 1, 0);
INSERT INTO `sys_resources_role` VALUES (199, 73, 3, '2021-01-16 22:37:37', 1, '2021-01-16 22:37:37', 1, 0);
INSERT INTO `sys_resources_role` VALUES (200, 82, 3, '2021-01-16 22:38:00', 1, '2021-01-16 22:38:00', 1, 0);
INSERT INTO `sys_resources_role` VALUES (201, 144, 3, '2021-01-16 22:38:03', 1, '2021-01-16 22:38:03', 1, 0);
INSERT INTO `sys_resources_role` VALUES (202, 145, 1, '2021-01-17 20:15:20', 0, '2021-01-17 20:15:20', 0, 0);
INSERT INTO `sys_resources_role` VALUES (203, 146, 1, '2021-01-17 20:15:20', 0, '2021-01-17 20:15:20', 0, 0);
INSERT INTO `sys_resources_role` VALUES (204, 147, 1, '2021-01-17 20:39:45', 0, '2021-01-17 20:39:45', 0, 0);
INSERT INTO `sys_resources_role` VALUES (205, 148, 1, '2021-01-17 22:01:59', 0, '2021-01-17 22:01:59', 0, 0);
INSERT INTO `sys_resources_role` VALUES (206, 149, 1, '2021-01-18 21:22:28', 0, '2021-01-18 21:22:28', 0, 0);
INSERT INTO `sys_resources_role` VALUES (207, 150, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (208, 151, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (209, 152, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (210, 153, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (211, 154, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (212, 155, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (213, 156, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (214, 157, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (215, 158, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (216, 159, 1, '2021-01-30 18:22:03', 0, '2021-01-30 18:22:03', 0, 0);
INSERT INTO `sys_resources_role` VALUES (217, 160, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (218, 161, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (219, 162, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (220, 163, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (221, 164, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (222, 165, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (223, 166, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (224, 167, 1, '2021-01-31 21:51:44', 0, '2021-01-31 21:51:44', 0, 0);
INSERT INTO `sys_resources_role` VALUES (225, 168, 1, '2021-01-31 21:51:45', 0, '2021-01-31 21:51:45', 0, 0);
INSERT INTO `sys_resources_role` VALUES (226, 169, 1, '2021-01-31 21:51:45', 0, '2021-01-31 21:51:45', 0, 0);
INSERT INTO `sys_resources_role` VALUES (227, 170, 1, '2021-02-01 22:18:51', 0, '2021-02-01 22:18:51', 0, 0);
INSERT INTO `sys_resources_role` VALUES (228, 171, 1, '2021-02-03 21:21:17', 0, '2021-02-03 21:21:17', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_user` VALUES (10, '鹤熙', '$2a$10$8d/WQLbfJaKL7OkqwelW1Ozlw4.yxQ8pUHqCB3/IRHoEcuEHR3A1e', 1, 0, 0, 0, '2021-01-03 16:43:59', 1, '2021-02-01 21:48:03', 1, 0);
INSERT INTO `sys_user` VALUES (11, '死神卡尔', '$2a$10$MLUeISaif04uuv5jAiPd8ueCbn0lrY93qN5jvgW9OpLdujfkJ8c.G', 1, 0, 0, 0, '2021-01-03 16:44:04', 1, '2021-01-16 22:49:03', 1, 0);
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
INSERT INTO `sys_user` VALUES (23, '赛罗奥特曼', '$2a$10$zf4yXQC.gvRJYzWQu1Erc.3jeKhY.wBH6lUGLqxai0n/jZeZdpdWy', 1, 0, 0, 0, '2021-01-16 22:49:41', 1, '2021-01-16 22:49:41', 1, 0);

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '用户性别，1（true）为男，0（false）为女',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱地址',
  `birthday` date NULL DEFAULT NULL COMMENT '用户出生日期',
  `id_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户身份证号码',
  `qq` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户QQ号码',
  `we_chat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户微信号码',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像路径',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, '何任鹏', 1, '17345671234', 'he.ren.peng@qq.com', '2021-01-17', '360733202101014219', '2519832582', 'H2519832582', 'http://127.0.0.1:10000/api/image/2021/2/2/8565e085-cb0a-4e9f-a596-56c3ce607b09.jpg', '2021-01-12 22:54:06', 1, '2021-01-19 21:19:43', 1, 0);
INSERT INTO `sys_user_info` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:51', 0, '2021-01-16 22:42:51', 0, 0);
INSERT INTO `sys_user_info` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:53', 0, '2021-01-16 22:42:53', 0, 0);
INSERT INTO `sys_user_info` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:56', 0, '2021-01-16 22:42:56', 0, 0);
INSERT INTO `sys_user_info` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `sys_user_info` VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `sys_user_info` VALUES (22, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:49:58', 22, 0);
INSERT INTO `sys_user_info` VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:49:41', 1, '2021-01-16 22:49:41', 1, 0);

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

-- ----------------------------
-- Table structure for upload_file_manage
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_manage`;
CREATE TABLE `upload_file_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `uri` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件http引用路径',
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件磁盘路径',
  `upload_time` datetime(0) NOT NULL COMMENT '文件上传时间',
  `upload_user_id` int(11) NOT NULL COMMENT '文件上传用户主键',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '主文件主键，源文件为0，其他值为对应的备份文件',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件资源管理表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
