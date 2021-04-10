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

 Date: 10/04/2021 18:00:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_login_log
-- ----------------------------
DROP TABLE IF EXISTS `auth_login_log`;
CREATE TABLE `auth_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '登录用户主键',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录的IP地址',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录现实地址，国家',
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录现实地址，区域，省',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录现实地址，城市',
  `isp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '因特网提供商',
  `login_time` datetime(0) NOT NULL COMMENT '登录时间',
  `token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'tokenId',
  `logout_time` datetime(0) NOT NULL COMMENT '登出时间，默认为登录时间+token失效时间，登出时更新',
  `logout` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否主动登出，默认为0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统账号登录日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_login_log
-- ----------------------------
INSERT INTO `auth_login_log` VALUES (1, 1, '127.0.0.1', 'XX', 'XX', '内网IP', '内网IP', '2021-04-10 17:35:39', '36cda294-4239-41f6-adb1-8b216b4d723d', '2021-04-10 18:35:39', 0, '2021-04-10 17:35:38', 0, '2021-04-10 17:35:38', 0, 0);
INSERT INTO `auth_login_log` VALUES (2, 1, '127.0.0.1', 'XX', 'XX', '内网IP', '内网IP', '2021-04-10 17:47:49', 'e6e1bd60-5c9f-4739-aec0-a5a7efb9f167', '2021-04-10 18:47:49', 0, '2021-04-10 17:47:48', 0, '2021-04-10 17:47:48', 0, 0);
INSERT INTO `auth_login_log` VALUES (3, 22, '127.0.0.1', 'XX', 'XX', '内网IP', '内网IP', '2021-04-10 17:51:14', 'cac3210f-c36f-41b7-ae58-92dae15b5552', '2021-04-10 18:51:14', 0, '2021-04-10 17:51:14', 0, '2021-04-10 17:53:54', 0, 1);
INSERT INTO `auth_login_log` VALUES (4, 22, '127.0.0.1', 'XX', 'XX', '内网IP', '内网IP', '2021-04-10 17:57:01', '838d9ac6-6b38-46cf-8ed4-5290fb303fff', '2021-04-10 18:57:01', 0, '2021-04-10 17:57:00', 0, '2021-04-10 17:57:00', 0, 0);

-- ----------------------------
-- Table structure for auth_resources
-- ----------------------------
DROP TABLE IF EXISTS `auth_resources`;
CREATE TABLE `auth_resources`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_resources
-- ----------------------------
INSERT INTO `auth_resources` VALUES (1, '/table/column/list', '^/table/column/list$', '查询所有的系统数据库表字段信息表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (2, '/table/column/page/{currentPage}', '^/table/column/page/[0-9]+$', '分页查询系统数据库表字段信息表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (3, '/table/column/recover/page/{currentPage}', '^/table/column/recover/page/[0-9]+$', '分页查询逻辑删除的系统数据库表字段信息表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (4, '/table/column/export/excel', '^/table/column/export/excel$', '导出系统数据库表字段信息表数据的Excel文件', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (5, '/table/column/recover/{id}', '^/table/column/recover/[0-9]+$', '通过主键恢复逻辑删除的系统数据库表字段信息表数据', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (6, '/table/column/table/info/{tableInfoId}', '^/table/column/table/info/[0-9]+$', '通过tableInfoId获取所有的字段信息', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (7, '/table/column/recover/{id}', '^/table/column/recover/[0-9]+$', '通过主键彻底删除一条系统数据库表字段信息表数据', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (8, '/table/column', '^/table/column$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (9, '/table/column', '^/table/column$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (10, '/table/column/{id}', '^/table/column/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (11, '/table/column/{id}', '^/table/column/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (12, '/table/info/page/{currentPage}', '^/table/info/page/[0-9]+$', '分页查询系统数据库表信息数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (13, '/table/info/recover/page/{currentPage}', '^/table/info/recover/page/[0-9]+$', '分页查询逻辑删除的系统数据库表信息表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (14, '/table/info/not/list', '^/table/info/not/list$', '获取还没有插入数据库中的数据库表信息', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (15, '/table/info/recover/{id}', '^/table/info/recover/[0-9]+$', '通过主键恢复逻辑删除的系统数据库表信息表数据', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (16, '/table/info/recover/{id}', '^/table/info/recover/[0-9]+$', '通过主键彻底删除一条系统数据库表信息表数据', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (17, '/table/info/code/generation/{id}', '^/table/info/code/generation/[0-9]+$', '生成代码', 'POST', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (18, '/table/info', '^/table/info$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (19, '/table/info', '^/table/info$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (20, '/table/info/{id}', '^/table/info/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (21, '/table/info/{id}', '^/table/info/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (22, '/log/list', '^/log/list$', '查询所有的系统操作日志表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (23, '/log/page/{currentPage}', '^/log/page/[0-9]+$', '分页查询系统操作日志表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (24, '/log/recover/page/{currentPage}', '^/log/recover/page/[0-9]+$', '分页查询逻辑删除的系统操作日志表数据', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (25, '/log/export/excel', '^/log/export/excel$', '导出操作日志列表数据的Excel文件', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (26, '/log/recover/{id}', '^/log/recover/[0-9]+$', '通过主键恢复逻辑删除的系统操作日志表数据', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (27, '/log/recover/{id}', '^/log/recover/[0-9]+$', '通过主键彻底删除一条系统操作日志表数据', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (28, '/log', '^/log$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (29, '/log', '^/log$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (30, '/log/{id}', '^/log/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (31, '/log/{id}', '^/log/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (32, '/menu/enabled/{id}', '^/menu/enabled/[0-9]+$', '启用或者禁用一个菜单', 'PUT', '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources` VALUES (33, '/menu/page/{currentPage}', '^/menu/page/[0-9]+$', '分页查询系统菜单表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (34, '/menu/recover/page/{currentPage}', '^/menu/recover/page/[0-9]+$', '分页查询逻辑删除的系统菜单表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (35, '/menu/export/excel', '^/menu/export/excel$', '导出系统菜单列表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (36, '/menu/recover/{id}', '^/menu/recover/[0-9]+$', '通过主键恢复逻辑删除的系统菜单表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (37, '/menu/recover/{id}', '^/menu/recover/[0-9]+$', '通过主键彻底删除一条系统菜单表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (38, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '添加菜单角色', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (39, '/menu/routes', '^/menu/routes$', '[动态路由]获取所有启用的系统菜单', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (40, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '删除菜单角色', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (41, '/menu/role/{menuId}', '^/menu/role/[0-9]+$', '获取该菜单未拥有的角色', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (42, '/menu', '^/menu$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (43, '/menu', '^/menu$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (44, '/menu/{id}', '^/menu/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (45, '/menu/{id}', '^/menu/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (46, '/user/info/list', '^/user/info/list$', '查询所有的系统用户信息表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (47, '/user/info/mail/verify', '^/user/info/mail/verify$', '验证邮件验证码', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (48, '/user/info', '^/user/info$', '查询当前登录用户的信息数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (49, '/user/info/page/{currentPage}', '^/user/info/page/[0-9]+$', '分页查询系统用户信息表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (50, '/user/info/recover/page/{currentPage}', '^/user/info/recover/page/[0-9]+$', '分页查询逻辑删除的系统用户信息表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (51, '/user/info/export/excel', '^/user/info/export/excel$', '导出系统用户信息表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (52, '/user/info/recover/{id}', '^/user/info/recover/[0-9]+$', '通过主键恢复逻辑删除的系统用户信息表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (53, '/user/info/recover/{id}', '^/user/info/recover/[0-9]+$', '通过主键彻底删除一条系统用户信息表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (54, '/user/info/mail/verify/send', '^/user/info/mail/verify/send$', '发送电子邮件号码验证邮件', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (55, '/user/info/avatar', '^/user/info/avatar$', '获取用户头像路径', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (56, '/user/info/avatar', '^/user/info/avatar$', '上传用户头像', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (57, '/user/info', '^/user/info$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (58, '/user/info', '^/user/info$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (59, '/user/info/{id}', '^/user/info/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (60, '/user/info/{id}', '^/user/info/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (61, '/server/info', '^/server/info$', '获取系统服务器的监控信息', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (62, '/server/piechart', '^/server/piechart$', '获取系统服务器的CPU，内存，JVM饼图信息', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (63, '/file/manage/replace', '^/file/manage/replace$', '通过主键替换一个文件资源', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (64, '/file/manage/list', '^/file/manage/list$', '查询所有的文件资源管理表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (65, '/file/manage/page/{currentPage}', '^/file/manage/page/[0-9]+$', '分页查询文件资源管理表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (66, '/file/manage/recover/page/{currentPage}', '^/file/manage/recover/page/[0-9]+$', '分页查询逻辑删除的文件资源管理表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (67, '/file/manage/export/excel', '^/file/manage/export/excel$', '导出文件资源管理表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (68, '/file/manage/recover/{id}', '^/file/manage/recover/[0-9]+$', '通过主键恢复逻辑删除的文件资源管理表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (69, '/file/manage/recover/{id}', '^/file/manage/recover/[0-9]+$', '通过主键彻底删除一条文件资源管理表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (70, '/file/manage/bak/{id}', '^/file/manage/bak/[0-9]+$', '通过主键备份一个文件资源', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (71, '/file/manage', '^/file/manage$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (72, '/file/manage', '^/file/manage$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (73, '/file/manage/{id}', '^/file/manage/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (74, '/file/manage/{id}', '^/file/manage/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (75, '/upload/image', '^/upload/image$', '上传图片文件', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (76, '/login/log/list', '^/login/log/list$', '查询所有的系统账号登录日志表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (77, '/login/log/page/{currentPage}', '^/login/log/page/[0-9]+$', '分页查询系统账号登录日志表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (78, '/login/log/recover/page/{currentPage}', '^/login/log/recover/page/[0-9]+$', '分页查询逻辑删除的系统账号登录日志表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (79, '/login/log/export/excel', '^/login/log/export/excel$', '导出系统账号登录日志表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (80, '/login/log/recover/{id}', '^/login/log/recover/[0-9]+$', '通过主键恢复逻辑删除的系统账号登录日志表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (81, '/login/log/recover/{id}', '^/login/log/recover/[0-9]+$', '通过主键彻底删除一条系统账号登录日志表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (82, '/login/log/offline/{userId}', '^/login/log/offline/[0-9]+$', '通过tokenId下线用户', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (83, '/login/log/online/{userId}', '^/login/log/online/[0-9]+$', '获取当前在线的用户记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (84, '/login/log', '^/login/log$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (85, '/login/log', '^/login/log$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (86, '/login/log/{id}', '^/login/log/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (87, '/login/log/{id}', '^/login/log/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (88, '/resources/page/{currentPage}', '^/resources/page/[0-9]+$', '分页查询系统资源数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (89, '/resources/recover/page/{currentPage}', '^/resources/recover/page/[0-9]+$', '分页查询逻辑删除的系统资源表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (90, '/resources/export/excel', '^/resources/export/excel$', '导出系统资源列表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (91, '/resources/recover/{id}', '^/resources/recover/[0-9]+$', '通过主键恢复逻辑删除的系统资源表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (92, '/resources/recover/{id}', '^/resources/recover/[0-9]+$', '通过主键彻底删除一条系统资源表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (93, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '添加系统资源角色', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (94, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '删除系统资源角色', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (95, '/resources/role/{resourcesId}', '^/resources/role/[0-9]+$', '获取未拥有该系统资源的角色', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (96, '/resources', '^/resources$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (97, '/resources', '^/resources$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (98, '/resources/{id}', '^/resources/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (99, '/resources/{id}', '^/resources/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (100, '/role/check/name', '^/role/check/name$', '检测角色名称是否已存在', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (101, '/role/list', '^/role/list$', '获取所有的用户角色', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (102, '/role/page/{currentPage}', '^/role/page/[0-9]+$', '分页查询角色数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (103, '/role/recover/page/{currentPage}', '^/role/recover/page/[0-9]+$', '分页查询逻辑删除的系统角色表数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (104, '/role/export/excel', '^/role/export/excel$', '导出角色列表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (105, '/role/recover/{id}', '^/role/recover/[0-9]+$', '通过主键恢复逻辑删除的系统角色表数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (106, '/role/recover/{id}', '^/role/recover/[0-9]+$', '通过主键彻底删除一条系统角色表数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (107, '/role/acquiescence', '^/role/acquiescence$', '通过主键设置或者取消默认角色', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (108, '/role', '^/role$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (109, '/role', '^/role$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (110, '/role/{id}', '^/role/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (111, '/role/{id}', '^/role/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (112, '/user/enabled/{id}', '^/user/enabled/[0-9]+$', '启用或者禁用一个用户账号', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (113, '/user/token', '^/user/token$', '获取请求头上的accessToken，并根据accessToken返回用户信息', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (114, '/user/page/{currentPage}', '^/user/page/[0-9]+$', '分页查询用户数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (115, '/user/recover/page/{currentPage}', '^/user/recover/page/[0-9]+$', '分页查询逻辑删除的用户数据', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (116, '/user/export/excel', '^/user/export/excel$', '导出用户列表数据的Excel文件', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (117, '/user/recover/{id}', '^/user/recover/[0-9]+$', '通过主键恢复逻辑删除的用户数据', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (118, '/user/recover/{id}', '^/user/recover/[0-9]+$', '通过主键彻底删除一条用户数据', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (119, '/user/role/{userId}', '^/user/role/[0-9]+$', '添加用户角色', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (120, '/user/role/{userId}', '^/user/role/[0-9]+$', '删除用户角色', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (121, '/user/reset/password', '^/user/reset/password$', '重置用户账号密码', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (122, '/user/check/username', '^/user/check/username$', '检测用户名是否已存在', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (123, '/user/check/password', '^/user/check/password$', '检测用户密码是否正确', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (124, '/user/role/{userId}', '^/user/role/[0-9]+$', '获取该用户未拥有的角色', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (125, '/user', '^/user$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (126, '/user', '^/user$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (127, '/user/{id}', '^/user/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (128, '/user/{id}', '^/user/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (129, '/mail/text', '^/mail/text$', '发送普通文本邮件', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources` VALUES (130, '/mail/template', '^/mail/template$', '发送HTML模板邮件', 'POST', '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);

-- ----------------------------
-- Table structure for auth_resources_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_resources_role`;
CREATE TABLE `auth_resources_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resources_id` int(11) NOT NULL COMMENT '资源主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_resources_role
-- ----------------------------
INSERT INTO `auth_resources_role` VALUES (1, 1, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (2, 2, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (3, 3, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (4, 4, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (5, 5, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (6, 6, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (7, 7, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (8, 8, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (9, 9, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (10, 10, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (11, 11, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (12, 12, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (13, 13, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (14, 14, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (15, 15, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (16, 16, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (17, 17, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (18, 18, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (19, 19, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (20, 20, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (21, 21, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (22, 22, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (23, 23, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (24, 24, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (25, 25, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (26, 26, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (27, 27, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (28, 28, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (29, 29, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (30, 30, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (31, 31, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (32, 32, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_resources_role` VALUES (33, 33, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (34, 34, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (35, 35, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (36, 36, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (37, 37, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (38, 38, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (39, 39, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (40, 40, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (41, 41, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (42, 42, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (43, 43, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (44, 44, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (45, 45, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (46, 46, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (47, 47, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (48, 48, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (49, 49, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (50, 50, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (51, 51, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (52, 52, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (53, 53, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (54, 54, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (55, 55, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (56, 56, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (57, 57, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (58, 58, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (59, 59, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (60, 60, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (61, 61, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (62, 62, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (63, 63, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (64, 64, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (65, 65, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (66, 66, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (67, 67, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (68, 68, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (69, 69, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (70, 70, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (71, 71, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (72, 72, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (73, 73, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (74, 74, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (75, 75, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (76, 76, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (77, 77, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (78, 78, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (79, 79, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (80, 80, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (81, 81, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (82, 82, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (83, 83, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (84, 84, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (85, 85, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (86, 86, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (87, 87, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (88, 88, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (89, 89, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (90, 90, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (91, 91, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (92, 92, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (93, 93, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (94, 94, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (95, 95, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (96, 96, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (97, 97, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (98, 98, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (99, 99, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (100, 100, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (101, 101, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (102, 102, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (103, 103, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (104, 104, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (105, 105, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (106, 106, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (107, 107, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (108, 108, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (109, 109, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (110, 110, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (111, 111, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (112, 112, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (113, 113, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (114, 114, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (115, 115, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (116, 116, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (117, 117, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (118, 118, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (119, 119, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (120, 120, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (121, 121, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (122, 122, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (123, 123, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (124, 124, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (125, 125, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (126, 126, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (127, 127, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (128, 128, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (129, 129, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (130, 130, 1, '2021-04-10 17:33:53', 0, '2021-04-10 17:33:53', 0, 0);
INSERT INTO `auth_resources_role` VALUES (131, 1, 3, '2021-04-10 17:38:12', 1, '2021-04-10 17:38:12', 1, 0);
INSERT INTO `auth_resources_role` VALUES (132, 2, 3, '2021-04-10 17:38:14', 1, '2021-04-10 17:38:14', 1, 0);
INSERT INTO `auth_resources_role` VALUES (133, 3, 3, '2021-04-10 17:38:17', 1, '2021-04-10 17:38:17', 1, 0);
INSERT INTO `auth_resources_role` VALUES (134, 4, 3, '2021-04-10 17:38:19', 1, '2021-04-10 17:38:19', 1, 0);
INSERT INTO `auth_resources_role` VALUES (135, 6, 3, '2021-04-10 17:38:20', 1, '2021-04-10 17:38:20', 1, 0);
INSERT INTO `auth_resources_role` VALUES (136, 11, 3, '2021-04-10 17:38:21', 1, '2021-04-10 17:38:21', 1, 0);
INSERT INTO `auth_resources_role` VALUES (138, 12, 3, '2021-04-10 17:38:25', 1, '2021-04-10 17:38:25', 1, 0);
INSERT INTO `auth_resources_role` VALUES (139, 13, 3, '2021-04-10 17:38:27', 1, '2021-04-10 17:38:27', 1, 0);
INSERT INTO `auth_resources_role` VALUES (140, 14, 3, '2021-04-10 17:38:28', 1, '2021-04-10 17:38:28', 1, 0);
INSERT INTO `auth_resources_role` VALUES (141, 21, 3, '2021-04-10 17:38:30', 1, '2021-04-10 17:38:30', 1, 0);
INSERT INTO `auth_resources_role` VALUES (142, 22, 3, '2021-04-10 17:38:46', 1, '2021-04-10 17:38:46', 1, 0);
INSERT INTO `auth_resources_role` VALUES (143, 23, 3, '2021-04-10 17:38:47', 1, '2021-04-10 17:38:47', 1, 0);
INSERT INTO `auth_resources_role` VALUES (144, 24, 3, '2021-04-10 17:38:49', 1, '2021-04-10 17:38:49', 1, 0);
INSERT INTO `auth_resources_role` VALUES (145, 25, 3, '2021-04-10 17:38:50', 1, '2021-04-10 17:38:50', 1, 0);
INSERT INTO `auth_resources_role` VALUES (146, 31, 3, '2021-04-10 17:38:51', 1, '2021-04-10 17:38:51', 1, 0);
INSERT INTO `auth_resources_role` VALUES (147, 33, 3, '2021-04-10 17:38:52', 1, '2021-04-10 17:38:52', 1, 0);
INSERT INTO `auth_resources_role` VALUES (148, 34, 3, '2021-04-10 17:38:53', 1, '2021-04-10 17:38:53', 1, 0);
INSERT INTO `auth_resources_role` VALUES (149, 35, 3, '2021-04-10 17:38:55', 1, '2021-04-10 17:38:55', 1, 0);
INSERT INTO `auth_resources_role` VALUES (150, 39, 3, '2021-04-10 17:38:56', 1, '2021-04-10 17:38:56', 1, 0);
INSERT INTO `auth_resources_role` VALUES (151, 41, 3, '2021-04-10 17:38:57', 1, '2021-04-10 17:38:57', 1, 0);
INSERT INTO `auth_resources_role` VALUES (152, 45, 3, '2021-04-10 17:39:01', 1, '2021-04-10 17:39:01', 1, 0);
INSERT INTO `auth_resources_role` VALUES (153, 46, 3, '2021-04-10 17:39:02', 1, '2021-04-10 17:39:02', 1, 0);
INSERT INTO `auth_resources_role` VALUES (154, 48, 3, '2021-04-10 17:39:03', 1, '2021-04-10 17:39:03', 1, 0);
INSERT INTO `auth_resources_role` VALUES (155, 49, 3, '2021-04-10 17:39:04', 1, '2021-04-10 17:39:04', 1, 0);
INSERT INTO `auth_resources_role` VALUES (156, 50, 3, '2021-04-10 17:39:05', 1, '2021-04-10 17:39:05', 1, 0);
INSERT INTO `auth_resources_role` VALUES (157, 51, 3, '2021-04-10 17:39:06', 1, '2021-04-10 17:39:06', 1, 0);
INSERT INTO `auth_resources_role` VALUES (158, 55, 3, '2021-04-10 17:39:07', 1, '2021-04-10 17:39:07', 1, 0);
INSERT INTO `auth_resources_role` VALUES (159, 60, 3, '2021-04-10 17:39:09', 1, '2021-04-10 17:39:09', 1, 0);
INSERT INTO `auth_resources_role` VALUES (160, 61, 3, '2021-04-10 17:39:10', 1, '2021-04-10 17:39:10', 1, 0);
INSERT INTO `auth_resources_role` VALUES (161, 62, 3, '2021-04-10 17:39:11', 1, '2021-04-10 17:39:11', 1, 0);
INSERT INTO `auth_resources_role` VALUES (162, 64, 3, '2021-04-10 17:39:14', 1, '2021-04-10 17:39:14', 1, 0);
INSERT INTO `auth_resources_role` VALUES (163, 65, 3, '2021-04-10 17:39:15', 1, '2021-04-10 17:39:15', 1, 0);
INSERT INTO `auth_resources_role` VALUES (164, 66, 3, '2021-04-10 17:39:16', 1, '2021-04-10 17:39:16', 1, 0);
INSERT INTO `auth_resources_role` VALUES (165, 67, 3, '2021-04-10 17:39:18', 1, '2021-04-10 17:39:18', 1, 0);
INSERT INTO `auth_resources_role` VALUES (166, 74, 3, '2021-04-10 17:39:19', 1, '2021-04-10 17:39:19', 1, 0);
INSERT INTO `auth_resources_role` VALUES (167, 76, 3, '2021-04-10 17:39:20', 1, '2021-04-10 17:39:20', 1, 0);
INSERT INTO `auth_resources_role` VALUES (168, 77, 3, '2021-04-10 17:39:22', 1, '2021-04-10 17:39:22', 1, 0);
INSERT INTO `auth_resources_role` VALUES (169, 78, 3, '2021-04-10 17:39:24', 1, '2021-04-10 17:39:24', 1, 0);
INSERT INTO `auth_resources_role` VALUES (170, 79, 3, '2021-04-10 17:39:25', 1, '2021-04-10 17:39:25', 1, 0);
INSERT INTO `auth_resources_role` VALUES (171, 83, 3, '2021-04-10 17:39:26', 1, '2021-04-10 17:39:26', 1, 0);
INSERT INTO `auth_resources_role` VALUES (172, 87, 3, '2021-04-10 17:39:29', 1, '2021-04-10 17:39:29', 1, 0);
INSERT INTO `auth_resources_role` VALUES (173, 88, 3, '2021-04-10 17:39:30', 1, '2021-04-10 17:39:30', 1, 0);
INSERT INTO `auth_resources_role` VALUES (174, 89, 3, '2021-04-10 17:39:32', 1, '2021-04-10 17:39:32', 1, 0);
INSERT INTO `auth_resources_role` VALUES (175, 90, 3, '2021-04-10 17:39:33', 1, '2021-04-10 17:39:33', 1, 0);
INSERT INTO `auth_resources_role` VALUES (176, 95, 3, '2021-04-10 17:39:35', 1, '2021-04-10 17:39:35', 1, 0);
INSERT INTO `auth_resources_role` VALUES (177, 99, 3, '2021-04-10 17:39:36', 1, '2021-04-10 17:39:36', 1, 0);
INSERT INTO `auth_resources_role` VALUES (178, 100, 3, '2021-04-10 17:39:37', 1, '2021-04-10 17:39:37', 1, 0);
INSERT INTO `auth_resources_role` VALUES (179, 101, 3, '2021-04-10 17:39:39', 1, '2021-04-10 17:39:39', 1, 0);
INSERT INTO `auth_resources_role` VALUES (180, 103, 3, '2021-04-10 17:39:40', 1, '2021-04-10 17:39:40', 1, 0);
INSERT INTO `auth_resources_role` VALUES (181, 102, 3, '2021-04-10 17:39:42', 1, '2021-04-10 17:39:42', 1, 0);
INSERT INTO `auth_resources_role` VALUES (182, 104, 3, '2021-04-10 17:39:44', 1, '2021-04-10 17:39:44', 1, 0);
INSERT INTO `auth_resources_role` VALUES (183, 111, 3, '2021-04-10 17:39:45', 1, '2021-04-10 17:39:45', 1, 0);
INSERT INTO `auth_resources_role` VALUES (184, 113, 3, '2021-04-10 17:39:47', 1, '2021-04-10 17:39:47', 1, 0);
INSERT INTO `auth_resources_role` VALUES (185, 114, 3, '2021-04-10 17:39:48', 1, '2021-04-10 17:39:48', 1, 0);
INSERT INTO `auth_resources_role` VALUES (186, 115, 3, '2021-04-10 17:39:49', 1, '2021-04-10 17:39:49', 1, 0);
INSERT INTO `auth_resources_role` VALUES (187, 116, 3, '2021-04-10 17:39:50', 1, '2021-04-10 17:39:50', 1, 0);
INSERT INTO `auth_resources_role` VALUES (188, 122, 3, '2021-04-10 17:39:51', 1, '2021-04-10 17:39:51', 1, 0);
INSERT INTO `auth_resources_role` VALUES (189, 123, 3, '2021-04-10 17:39:53', 1, '2021-04-10 17:39:53', 1, 0);
INSERT INTO `auth_resources_role` VALUES (190, 124, 3, '2021-04-10 17:39:55', 1, '2021-04-10 17:39:55', 1, 0);
INSERT INTO `auth_resources_role` VALUES (191, 128, 3, '2021-04-10 17:39:56', 1, '2021-04-10 17:39:56', 1, 0);
INSERT INTO `auth_resources_role` VALUES (192, 8, 3, '2021-04-10 17:40:05', 1, '2021-04-10 17:40:05', 1, 0);
INSERT INTO `auth_resources_role` VALUES (193, 18, 3, '2021-04-10 17:40:08', 1, '2021-04-10 17:40:08', 1, 0);
INSERT INTO `auth_resources_role` VALUES (194, 28, 3, '2021-04-10 17:40:10', 1, '2021-04-10 17:40:10', 1, 0);
INSERT INTO `auth_resources_role` VALUES (195, 47, 3, '2021-04-10 17:40:29', 1, '2021-04-10 17:40:29', 1, 0);
INSERT INTO `auth_resources_role` VALUES (196, 54, 3, '2021-04-10 17:40:31', 1, '2021-04-10 17:40:31', 1, 0);
INSERT INTO `auth_resources_role` VALUES (197, 56, 3, '2021-04-10 17:40:33', 1, '2021-04-10 17:40:33', 1, 0);
INSERT INTO `auth_resources_role` VALUES (198, 57, 3, '2021-04-10 17:40:35', 1, '2021-04-10 17:40:35', 1, 0);
INSERT INTO `auth_resources_role` VALUES (199, 63, 3, '2021-04-10 17:40:40', 1, '2021-04-10 17:40:40', 1, 0);
INSERT INTO `auth_resources_role` VALUES (200, 70, 3, '2021-04-10 17:40:41', 1, '2021-04-10 17:40:41', 1, 0);
INSERT INTO `auth_resources_role` VALUES (201, 71, 3, '2021-04-10 17:40:44', 1, '2021-04-10 17:40:44', 1, 0);
INSERT INTO `auth_resources_role` VALUES (202, 75, 3, '2021-04-10 17:40:45', 1, '2021-04-10 17:40:45', 1, 0);
INSERT INTO `auth_resources_role` VALUES (203, 84, 3, '2021-04-10 17:40:48', 1, '2021-04-10 17:40:48', 1, 0);
INSERT INTO `auth_resources_role` VALUES (205, 125, 3, '2021-04-10 17:41:03', 1, '2021-04-10 17:41:03', 1, 0);
INSERT INTO `auth_resources_role` VALUES (206, 129, 3, '2021-04-10 17:41:07', 1, '2021-04-10 17:41:07', 1, 0);
INSERT INTO `auth_resources_role` VALUES (207, 130, 3, '2021-04-10 17:41:09', 1, '2021-04-10 17:41:09', 1, 0);
INSERT INTO `auth_resources_role` VALUES (208, 9, 3, '2021-04-10 17:41:49', 1, '2021-04-10 17:41:49', 1, 0);
INSERT INTO `auth_resources_role` VALUES (209, 19, 3, '2021-04-10 17:41:51', 1, '2021-04-10 17:41:51', 1, 0);
INSERT INTO `auth_resources_role` VALUES (210, 58, 3, '2021-04-10 17:42:06', 1, '2021-04-10 17:42:06', 1, 0);
INSERT INTO `auth_resources_role` VALUES (211, 72, 3, '2021-04-10 17:42:13', 1, '2021-04-10 17:42:13', 1, 0);
INSERT INTO `auth_resources_role` VALUES (212, 82, 3, '2021-04-10 17:42:17', 1, '2021-04-10 17:42:17', 1, 0);
INSERT INTO `auth_resources_role` VALUES (213, 85, 3, '2021-04-10 17:42:23', 1, '2021-04-10 17:42:23', 1, 0);
INSERT INTO `auth_resources_role` VALUES (214, 107, 3, '2021-04-10 17:42:34', 1, '2021-04-10 17:42:34', 1, 0);
INSERT INTO `auth_resources_role` VALUES (215, 112, 3, '2021-04-10 17:42:49', 1, '2021-04-10 17:42:49', 1, 0);
INSERT INTO `auth_resources_role` VALUES (216, 121, 3, '2021-04-10 17:42:56', 1, '2021-04-10 17:42:56', 1, 0);
INSERT INTO `auth_resources_role` VALUES (217, 126, 3, '2021-04-10 17:42:58', 1, '2021-04-10 17:42:58', 1, 0);
INSERT INTO `auth_resources_role` VALUES (218, 30, 3, '2021-04-10 17:43:11', 1, '2021-04-10 17:43:11', 1, 0);
INSERT INTO `auth_resources_role` VALUES (219, 20, 3, '2021-04-10 17:43:14', 1, '2021-04-10 17:43:14', 1, 0);
INSERT INTO `auth_resources_role` VALUES (220, 10, 3, '2021-04-10 17:43:19', 1, '2021-04-10 17:43:19', 1, 0);
INSERT INTO `auth_resources_role` VALUES (221, 73, 3, '2021-04-10 17:43:32', 1, '2021-04-10 17:43:32', 1, 0);
INSERT INTO `auth_resources_role` VALUES (222, 86, 3, '2021-04-10 17:43:35', 1, '2021-04-10 17:43:35', 1, 0);
INSERT INTO `auth_resources_role` VALUES (223, 127, 3, '2021-04-10 17:43:46', 1, '2021-04-10 17:43:46', 1, 0);
INSERT INTO `auth_resources_role` VALUES (225, 117, 3, '2021-04-10 17:55:23', 1, '2021-04-10 17:55:23', 1, 0);

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述信息',
  `acquiescence` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为默认角色，所有角色中只允许一个角色值为1(true)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (1, 'root', 'root权限，系统的最高权限', 0, '2021-01-03 16:22:28', 0, '2021-04-07 19:23:51', 1, 0);
INSERT INTO `auth_role` VALUES (2, 'admin', 'admin权限，管理员权限', 0, '2021-01-03 16:33:03', 0, '2021-04-10 17:55:32', 22, 0);
INSERT INTO `auth_role` VALUES (3, 'user', '普通用户权限', 1, '2021-01-03 16:33:03', 0, '2021-04-10 17:55:32', 22, 0);

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号在线人数',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '账号是否启用，1为启用，0为禁用，默认为1',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账号是否锁定，1为锁定，0为未锁定，默认为0',
  `account_expire` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账号是否过期，1为过期，0为未过期，默认为0',
  `password_expire` tinyint(1) NOT NULL DEFAULT 0 COMMENT '密码是否过期，1为过期，0为未过期，默认为0',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号类型',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'root', '$2a$10$2AbFLGrGmFV3aEDj7R2pTera/2kQtmakbItVjzFuqZVbbFhgAmcCu', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:22:28', 0, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (2, '零', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:42:46', 1, '2021-04-08 00:06:04', 22, 0);
INSERT INTO `auth_user` VALUES (3, '天帝', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:42:57', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (4, '彦', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:06', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (5, '懒羊羊', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:13', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (6, '修罗铠甲', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:20', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (7, '喜羊羊', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:33', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (8, '凉冰', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:41', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (9, '凯莎女王', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:51', 1, '2021-04-10 17:51:52', 1, 0);
INSERT INTO `auth_user` VALUES (10, '鹤熙', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:43:59', 1, '2021-04-10 17:52:48', 1, 0);
INSERT INTO `auth_user` VALUES (11, '死神卡尔', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:04', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (12, '帝蕾娜', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:10', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (13, '刑天铠甲', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:22', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (14, '飞影铠甲', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:28', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (15, '孙悟空', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:41', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (16, '天下谁人不识君', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:49', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (17, '泽塔奥特曼', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:44:56', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (18, '天使凯拉', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:45:01', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (19, '波波', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:45:07', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (20, '刘老板', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:45:15', 1, '2021-04-10 17:49:36', 1, 0);
INSERT INTO `auth_user` VALUES (21, '池总', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:45:33', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (22, 'user', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-03 16:45:45', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (23, '赛罗奥特曼', '$2a$10$1nAGkXfhU7ZoizZG.Jty1.SbafsaFPFmrTyz6Ley.hpvIHQGHxN2u', 1, 0, 0, 0, 'LOCAL', '2021-01-16 22:49:41', 1, '2021-04-10 17:55:25', 1, 0);

-- ----------------------------
-- Table structure for auth_user_info
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_info`;
CREATE TABLE `auth_user_info`  (
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
-- Records of auth_user_info
-- ----------------------------
INSERT INTO `auth_user_info` VALUES (1, '何任鹏', 1, '17345671234', '2519832582@qq.com', '2021-01-17', '360733202101014219', '2519832582', 'H2519832582', 'http://127.0.0.1:10000/api/image/2021/4/8/a05d1efd-c4c3-44f2-a3d4-ec5fc41699a6.jpg', '2021-01-12 22:54:06', 1, '2021-04-06 18:52:39', 1, 0);
INSERT INTO `auth_user_info` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:51', 0, '2021-01-16 22:42:51', 0, 0);
INSERT INTO `auth_user_info` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:53', 0, '2021-01-16 22:42:53', 0, 0);
INSERT INTO `auth_user_info` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:42:56', 0, '2021-01-16 22:42:56', 0, 0);
INSERT INTO `auth_user_info` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:07', 0, '2021-01-16 22:44:07', 0, 0);
INSERT INTO `auth_user_info` VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:44:30', 0, '2021-01-16 22:44:30', 0, 0);
INSERT INTO `auth_user_info` VALUES (22, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'http://127.0.0.1:10000/api/image/2021/4/10/c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', '2021-01-16 22:44:30', 0, '2021-01-16 22:49:58', 22, 0);
INSERT INTO `auth_user_info` VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:49:41', 1, '2021-01-16 22:49:41', 1, 0);

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role`  (
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
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES (1, 1, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `auth_user_role` VALUES (2, 2, 3, '2021-04-10 17:35:48', 1, '2021-04-10 17:35:48', 1, 0);
INSERT INTO `auth_user_role` VALUES (3, 3, 3, '2021-04-10 17:35:50', 1, '2021-04-10 17:35:50', 1, 0);
INSERT INTO `auth_user_role` VALUES (4, 4, 3, '2021-04-10 17:35:52', 1, '2021-04-10 17:35:52', 1, 0);
INSERT INTO `auth_user_role` VALUES (5, 5, 3, '2021-04-10 17:35:53', 1, '2021-04-10 17:35:53', 1, 0);
INSERT INTO `auth_user_role` VALUES (6, 6, 3, '2021-04-10 17:35:56', 1, '2021-04-10 17:35:56', 1, 0);
INSERT INTO `auth_user_role` VALUES (7, 7, 3, '2021-04-10 17:35:58', 1, '2021-04-10 17:35:58', 1, 0);
INSERT INTO `auth_user_role` VALUES (8, 8, 3, '2021-04-10 17:36:00', 1, '2021-04-10 17:36:00', 1, 0);
INSERT INTO `auth_user_role` VALUES (9, 9, 3, '2021-04-10 17:36:02', 1, '2021-04-10 17:36:02', 1, 0);
INSERT INTO `auth_user_role` VALUES (10, 10, 3, '2021-04-10 17:36:03', 1, '2021-04-10 17:36:03', 1, 0);
INSERT INTO `auth_user_role` VALUES (11, 11, 3, '2021-04-10 17:36:06', 1, '2021-04-10 17:36:06', 1, 0);
INSERT INTO `auth_user_role` VALUES (12, 12, 3, '2021-04-10 17:36:08', 1, '2021-04-10 17:36:08', 1, 0);
INSERT INTO `auth_user_role` VALUES (13, 13, 3, '2021-04-10 17:36:09', 1, '2021-04-10 17:36:09', 1, 0);
INSERT INTO `auth_user_role` VALUES (14, 14, 3, '2021-04-10 17:36:10', 1, '2021-04-10 17:36:10', 1, 0);
INSERT INTO `auth_user_role` VALUES (15, 15, 3, '2021-04-10 17:36:12', 1, '2021-04-10 17:36:12', 1, 0);
INSERT INTO `auth_user_role` VALUES (16, 16, 3, '2021-04-10 17:36:13', 1, '2021-04-10 17:36:13', 1, 0);
INSERT INTO `auth_user_role` VALUES (17, 17, 3, '2021-04-10 17:36:15', 1, '2021-04-10 17:36:15', 1, 0);
INSERT INTO `auth_user_role` VALUES (18, 18, 3, '2021-04-10 17:36:16', 1, '2021-04-10 17:36:16', 1, 0);
INSERT INTO `auth_user_role` VALUES (19, 19, 3, '2021-04-10 17:36:18', 1, '2021-04-10 17:36:18', 1, 0);
INSERT INTO `auth_user_role` VALUES (20, 20, 3, '2021-04-10 17:36:19', 1, '2021-04-10 17:36:19', 1, 0);
INSERT INTO `auth_user_role` VALUES (21, 21, 3, '2021-04-10 17:36:22', 1, '2021-04-10 17:36:22', 1, 0);
INSERT INTO `auth_user_role` VALUES (22, 22, 3, '2021-04-10 17:36:24', 1, '2021-04-10 17:36:24', 1, 0);

-- ----------------------------
-- Table structure for dev_table_column
-- ----------------------------
DROP TABLE IF EXISTS `dev_table_column`;
CREATE TABLE `dev_table_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `database_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段类型',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段注释',
  `java_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Java属性名称',
  `java_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型对应的Java类型',
  `jdbc_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型对应的jdbc类型',
  `query` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为查询字段',
  `sort` int(11) NOT NULL COMMENT '字段排序顺序，数据库默认升序排序',
  `table_info_id` int(11) NOT NULL COMMENT '表信息主键，关联dev_table_info表的主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表字段信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dev_table_info
-- ----------------------------
DROP TABLE IF EXISTS `dev_table_info`;
CREATE TABLE `dev_table_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表注释',
  `entity_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实体类名称',
  `request_mapping` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类请求路径',
  `java_package_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包前缀名称',
  `java_code_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Java代码生成路径',
  `vue_code_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'vue代码生成路径',
  `vue_package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'vue包路径',
  `code_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码作者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oauth_github_user
-- ----------------------------
DROP TABLE IF EXISTS `oauth_github_user`;
CREATE TABLE `oauth_github_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Github用户名称',
  `user_id` int(11) NOT NULL COMMENT '用户表主键',
  `github_id` int(11) NOT NULL COMMENT 'Github用户主键',
  `node_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Github Node主键',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Github 用户信息api请求路径',
  `html_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Github 用户主页路径',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Github 用户类型',
  `public_repos` int(11) NOT NULL COMMENT 'Github 公开的仓库个数',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像路径',
  `public_gists` int(11) NOT NULL COMMENT 'public_gists',
  `gravatar_id` int(11) NULL DEFAULT NULL COMMENT 'gravatar_id',
  `followers_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'followers_url',
  `site_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'site_admin',
  `following_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'following_url',
  `gists_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'gists_url',
  `starred_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'starred_url',
  `subscriptions_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'subscriptions_url',
  `organizations_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'organizations_url',
  `repos_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'repos_url',
  `events_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'events_url',
  `received_events_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'received_events_url',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'name',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'company',
  `blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'blog',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'location',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `hireable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'hireable',
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'bio',
  `twitter_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'twitter_username',
  `followers` int(11) NOT NULL COMMENT 'followers',
  `following` int(11) NOT NULL COMMENT 'following',
  `created_at` datetime(0) NOT NULL COMMENT 'Github账号创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT 'Github最后更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Github用户信息表' ROW_FORMAT = Compact;

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
  `request_args` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `execution_time` bigint(20) NOT NULL COMMENT '执行时间',
  `result` tinyint(1) NOT NULL COMMENT '执行结果标识，1(true)为正常，0(false)为执行异常',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志描述信息',
  `exception_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常名称',
  `exception_message` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 561 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, '2021-04-10 17:35:39', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 25, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:35:38', 1, '2021-04-10 17:35:38', 1, 0);
INSERT INTO `sys_log` VALUES (2, 1, '2021-04-10 17:35:39', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 24, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:35:39', 1, '2021-04-10 17:35:39', 1, 0);
INSERT INTO `sys_log` VALUES (3, 1, '2021-04-10 17:35:40', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 97, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:39', 1, '2021-04-10 17:35:39', 1, 0);
INSERT INTO `sys_log` VALUES (4, 1, '2021-04-10 17:35:48', '127.0.0.1', '/api/user/role/2', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[2]', 6, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:47', 1, '2021-04-10 17:35:47', 1, 0);
INSERT INTO `sys_log` VALUES (5, 1, '2021-04-10 17:35:49', '127.0.0.1', '/api/user/role/2', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[2,3]', 13, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:48', 1, '2021-04-10 17:35:48', 1, 0);
INSERT INTO `sys_log` VALUES (6, 1, '2021-04-10 17:35:49', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 44, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:48', 1, '2021-04-10 17:35:48', 1, 0);
INSERT INTO `sys_log` VALUES (7, 1, '2021-04-10 17:35:50', '127.0.0.1', '/api/user/role/3', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[3]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:49', 1, '2021-04-10 17:35:49', 1, 0);
INSERT INTO `sys_log` VALUES (8, 1, '2021-04-10 17:35:51', '127.0.0.1', '/api/user/role/3', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[3,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:50', 1, '2021-04-10 17:35:50', 1, 0);
INSERT INTO `sys_log` VALUES (9, 1, '2021-04-10 17:35:51', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 41, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:50', 1, '2021-04-10 17:35:50', 1, 0);
INSERT INTO `sys_log` VALUES (10, 1, '2021-04-10 17:35:51', '127.0.0.1', '/api/user/role/4', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[4]', 3, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:51', 1, '2021-04-10 17:53:44', 1, 1);
INSERT INTO `sys_log` VALUES (11, 1, '2021-04-10 17:35:52', '127.0.0.1', '/api/user/role/4', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[4,3]', 13, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:52', 1, '2021-04-10 17:35:52', 1, 0);
INSERT INTO `sys_log` VALUES (12, 1, '2021-04-10 17:35:52', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 35, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:52', 1, '2021-04-10 17:35:52', 1, 0);
INSERT INTO `sys_log` VALUES (13, 1, '2021-04-10 17:35:53', '127.0.0.1', '/api/user/role/5', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[5]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:52', 1, '2021-04-10 17:35:52', 1, 0);
INSERT INTO `sys_log` VALUES (14, 1, '2021-04-10 17:35:54', '127.0.0.1', '/api/user/role/5', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[5,3]', 15, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:53', 1, '2021-04-10 17:35:53', 1, 0);
INSERT INTO `sys_log` VALUES (15, 1, '2021-04-10 17:35:54', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 47, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:53', 1, '2021-04-10 17:35:53', 1, 0);
INSERT INTO `sys_log` VALUES (16, 1, '2021-04-10 17:35:55', '127.0.0.1', '/api/user/role/6', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[6]', 6, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:55', 1, '2021-04-10 17:35:55', 1, 0);
INSERT INTO `sys_log` VALUES (17, 1, '2021-04-10 17:35:56', '127.0.0.1', '/api/user/role/6', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[6,3]', 12, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:56', 1, '2021-04-10 17:35:56', 1, 0);
INSERT INTO `sys_log` VALUES (18, 1, '2021-04-10 17:35:56', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 48, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:56', 1, '2021-04-10 17:35:56', 1, 0);
INSERT INTO `sys_log` VALUES (19, 1, '2021-04-10 17:35:57', '127.0.0.1', '/api/user/role/7', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[7]', 4, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:57', 1, '2021-04-10 17:35:57', 1, 0);
INSERT INTO `sys_log` VALUES (20, 1, '2021-04-10 17:35:58', '127.0.0.1', '/api/user/role/7', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[7,3]', 8, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:35:58', 1, '2021-04-10 17:35:58', 1, 0);
INSERT INTO `sys_log` VALUES (21, 1, '2021-04-10 17:35:58', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 31, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:35:58', 1, '2021-04-10 17:35:58', 1, 0);
INSERT INTO `sys_log` VALUES (22, 1, '2021-04-10 17:36:00', '127.0.0.1', '/api/user/role/8', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[8]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:35:59', 1, '2021-04-10 17:35:59', 1, 0);
INSERT INTO `sys_log` VALUES (23, 1, '2021-04-10 17:36:01', '127.0.0.1', '/api/user/role/8', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[8,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:00', 1, '2021-04-10 17:36:00', 1, 0);
INSERT INTO `sys_log` VALUES (24, 1, '2021-04-10 17:36:01', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 42, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:00', 1, '2021-04-10 17:36:00', 1, 0);
INSERT INTO `sys_log` VALUES (25, 1, '2021-04-10 17:36:01', '127.0.0.1', '/api/user/role/9', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[9]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:01', 1, '2021-04-10 17:36:01', 1, 0);
INSERT INTO `sys_log` VALUES (26, 1, '2021-04-10 17:36:02', '127.0.0.1', '/api/user/role/9', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[9,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:02', 1, '2021-04-10 17:36:02', 1, 0);
INSERT INTO `sys_log` VALUES (27, 1, '2021-04-10 17:36:02', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 43, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:02', 1, '2021-04-10 17:36:02', 1, 0);
INSERT INTO `sys_log` VALUES (28, 1, '2021-04-10 17:36:03', '127.0.0.1', '/api/user/role/10', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[10]', 3, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:03', 1, '2021-04-10 17:36:03', 1, 0);
INSERT INTO `sys_log` VALUES (29, 1, '2021-04-10 17:36:04', '127.0.0.1', '/api/user/role/10', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[10,3]', 13, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:03', 1, '2021-04-10 17:36:03', 1, 0);
INSERT INTO `sys_log` VALUES (30, 1, '2021-04-10 17:36:04', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 41, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:03', 1, '2021-04-10 17:36:03', 1, 0);
INSERT INTO `sys_log` VALUES (31, 1, '2021-04-10 17:36:05', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 29, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:04', 1, '2021-04-10 17:36:04', 1, 0);
INSERT INTO `sys_log` VALUES (32, 1, '2021-04-10 17:36:06', '127.0.0.1', '/api/user/role/11', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[11]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:05', 1, '2021-04-10 17:36:05', 1, 0);
INSERT INTO `sys_log` VALUES (33, 1, '2021-04-10 17:36:07', '127.0.0.1', '/api/user/role/11', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[11,3]', 9, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:06', 1, '2021-04-10 17:36:06', 1, 0);
INSERT INTO `sys_log` VALUES (34, 1, '2021-04-10 17:36:07', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 36, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:06', 1, '2021-04-10 17:36:06', 1, 0);
INSERT INTO `sys_log` VALUES (35, 1, '2021-04-10 17:36:07', '127.0.0.1', '/api/user/role/12', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[12]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:07', 1, '2021-04-10 17:36:07', 1, 0);
INSERT INTO `sys_log` VALUES (36, 1, '2021-04-10 17:36:08', '127.0.0.1', '/api/user/role/12', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[12,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:08', 1, '2021-04-10 17:36:08', 1, 0);
INSERT INTO `sys_log` VALUES (37, 1, '2021-04-10 17:36:08', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 32, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:08', 1, '2021-04-10 17:36:08', 1, 0);
INSERT INTO `sys_log` VALUES (38, 1, '2021-04-10 17:36:09', '127.0.0.1', '/api/user/role/13', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[13]', 3, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:08', 1, '2021-04-10 17:36:08', 1, 0);
INSERT INTO `sys_log` VALUES (39, 1, '2021-04-10 17:36:10', '127.0.0.1', '/api/user/role/13', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[13,3]', 9, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:09', 1, '2021-04-10 17:36:09', 1, 0);
INSERT INTO `sys_log` VALUES (40, 1, '2021-04-10 17:36:10', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 38, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:09', 1, '2021-04-10 17:36:09', 1, 0);
INSERT INTO `sys_log` VALUES (41, 1, '2021-04-10 17:36:10', '127.0.0.1', '/api/user/role/14', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[14]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:10', 1, '2021-04-10 17:36:10', 1, 0);
INSERT INTO `sys_log` VALUES (42, 1, '2021-04-10 17:36:11', '127.0.0.1', '/api/user/role/14', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[14,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:10', 1, '2021-04-10 17:36:10', 1, 0);
INSERT INTO `sys_log` VALUES (43, 1, '2021-04-10 17:36:11', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 27, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:11', 1, '2021-04-10 17:36:11', 1, 0);
INSERT INTO `sys_log` VALUES (44, 1, '2021-04-10 17:36:12', '127.0.0.1', '/api/user/role/15', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[15]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:11', 1, '2021-04-10 17:36:11', 1, 0);
INSERT INTO `sys_log` VALUES (45, 1, '2021-04-10 17:36:12', '127.0.0.1', '/api/user/role/15', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[15,3]', 10, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:12', 1, '2021-04-10 17:36:12', 1, 0);
INSERT INTO `sys_log` VALUES (46, 1, '2021-04-10 17:36:12', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 33, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:12', 1, '2021-04-10 17:36:12', 1, 0);
INSERT INTO `sys_log` VALUES (47, 1, '2021-04-10 17:36:13', '127.0.0.1', '/api/user/role/16', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[16]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:13', 1, '2021-04-10 17:36:13', 1, 0);
INSERT INTO `sys_log` VALUES (48, 1, '2021-04-10 17:36:14', '127.0.0.1', '/api/user/role/16', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[16,3]', 8, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:13', 1, '2021-04-10 17:36:13', 1, 0);
INSERT INTO `sys_log` VALUES (49, 1, '2021-04-10 17:36:14', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 26, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:13', 1, '2021-04-10 17:36:13', 1, 0);
INSERT INTO `sys_log` VALUES (50, 1, '2021-04-10 17:36:15', '127.0.0.1', '/api/user/role/17', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[17]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:14', 1, '2021-04-10 17:36:14', 1, 0);
INSERT INTO `sys_log` VALUES (51, 1, '2021-04-10 17:36:15', '127.0.0.1', '/api/user/role/17', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[17,3]', 10, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:15', 1, '2021-04-10 17:36:15', 1, 0);
INSERT INTO `sys_log` VALUES (52, 1, '2021-04-10 17:36:15', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 28, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:15', 1, '2021-04-10 17:36:15', 1, 0);
INSERT INTO `sys_log` VALUES (53, 1, '2021-04-10 17:36:16', '127.0.0.1', '/api/user/role/18', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[18]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:16', 1, '2021-04-10 17:36:16', 1, 0);
INSERT INTO `sys_log` VALUES (54, 1, '2021-04-10 17:36:17', '127.0.0.1', '/api/user/role/18', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[18,3]', 13, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:16', 1, '2021-04-10 17:36:16', 1, 0);
INSERT INTO `sys_log` VALUES (55, 1, '2021-04-10 17:36:17', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 34, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:17', 1, '2021-04-10 17:36:17', 1, 0);
INSERT INTO `sys_log` VALUES (56, 1, '2021-04-10 17:36:18', '127.0.0.1', '/api/user/role/19', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[19]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:17', 1, '2021-04-10 17:36:17', 1, 0);
INSERT INTO `sys_log` VALUES (57, 1, '2021-04-10 17:36:18', '127.0.0.1', '/api/user/role/19', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[19,3]', 9, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:18', 1, '2021-04-10 17:36:18', 1, 0);
INSERT INTO `sys_log` VALUES (58, 1, '2021-04-10 17:36:18', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 33, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:18', 1, '2021-04-10 17:36:18', 1, 0);
INSERT INTO `sys_log` VALUES (59, 1, '2021-04-10 17:36:19', '127.0.0.1', '/api/user/role/20', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[20]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:19', 1, '2021-04-10 17:36:19', 1, 0);
INSERT INTO `sys_log` VALUES (60, 1, '2021-04-10 17:36:20', '127.0.0.1', '/api/user/role/20', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[20,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:19', 1, '2021-04-10 17:36:19', 1, 0);
INSERT INTO `sys_log` VALUES (61, 1, '2021-04-10 17:36:20', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 30, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:19', 1, '2021-04-10 17:36:19', 1, 0);
INSERT INTO `sys_log` VALUES (62, 1, '2021-04-10 17:36:21', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.auth.controller.UserController.page', '[3,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 10, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:21', 1, '2021-04-10 17:36:21', 1, 0);
INSERT INTO `sys_log` VALUES (63, 1, '2021-04-10 17:36:22', '127.0.0.1', '/api/user/role/21', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[21]', 2, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:22', 1, '2021-04-10 17:36:22', 1, 0);
INSERT INTO `sys_log` VALUES (64, 1, '2021-04-10 17:36:23', '127.0.0.1', '/api/user/role/21', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[21,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:22', 1, '2021-04-10 17:36:22', 1, 0);
INSERT INTO `sys_log` VALUES (65, 1, '2021-04-10 17:36:23', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.auth.controller.UserController.page', '[3,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 10, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:22', 1, '2021-04-10 17:36:22', 1, 0);
INSERT INTO `sys_log` VALUES (66, 1, '2021-04-10 17:36:24', '127.0.0.1', '/api/user/role/22', 'GET', 'class com.zero.auth.controller.UserController.getUserNotRoleList', '[22]', 1, 1, '获取该用户未拥有的角色', NULL, NULL, '2021-04-10 17:36:23', 1, '2021-04-10 17:36:23', 1, 0);
INSERT INTO `sys_log` VALUES (67, 1, '2021-04-10 17:36:25', '127.0.0.1', '/api/user/role/22', 'POST', 'class com.zero.auth.controller.UserController.addUserRole', '[22,3]', 11, 1, '添加用户角色', NULL, NULL, '2021-04-10 17:36:24', 1, '2021-04-10 17:36:24', 1, 0);
INSERT INTO `sys_log` VALUES (68, 1, '2021-04-10 17:36:25', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.auth.controller.UserController.page', '[3,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 9, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:36:24', 1, '2021-04-10 17:36:24', 1, 0);
INSERT INTO `sys_log` VALUES (69, 1, '2021-04-10 17:36:29', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 15, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:36:28', 1, '2021-04-10 17:36:28', 1, 0);
INSERT INTO `sys_log` VALUES (70, 1, '2021-04-10 17:36:32', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 24, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:36:32', 1, '2021-04-10 17:36:32', 1, 0);
INSERT INTO `sys_log` VALUES (71, 1, '2021-04-10 17:36:36', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 57, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:35', 1, '2021-04-10 17:36:35', 1, 0);
INSERT INTO `sys_log` VALUES (72, 1, '2021-04-10 17:36:39', '127.0.0.1', '/api/menu/role/1', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[1]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:39', 1, '2021-04-10 17:36:39', 1, 0);
INSERT INTO `sys_log` VALUES (73, 1, '2021-04-10 17:36:40', '127.0.0.1', '/api/menu/role/1', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[1,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:40', 1, '2021-04-10 17:36:40', 1, 0);
INSERT INTO `sys_log` VALUES (74, 1, '2021-04-10 17:36:40', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 58, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:40', 1, '2021-04-10 17:36:40', 1, 0);
INSERT INTO `sys_log` VALUES (75, 1, '2021-04-10 17:36:41', '127.0.0.1', '/api/menu/role/2', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[2]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:40', 1, '2021-04-10 17:36:40', 1, 0);
INSERT INTO `sys_log` VALUES (76, 1, '2021-04-10 17:36:42', '127.0.0.1', '/api/menu/role/2', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[2,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:41', 1, '2021-04-10 17:36:41', 1, 0);
INSERT INTO `sys_log` VALUES (77, 1, '2021-04-10 17:36:42', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 53, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:41', 1, '2021-04-10 17:36:41', 1, 0);
INSERT INTO `sys_log` VALUES (78, 1, '2021-04-10 17:36:42', '127.0.0.1', '/api/menu/role/3', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[3]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:42', 1, '2021-04-10 17:36:42', 1, 0);
INSERT INTO `sys_log` VALUES (79, 1, '2021-04-10 17:36:43', '127.0.0.1', '/api/menu/role/3', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[3,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:43', 1, '2021-04-10 17:36:43', 1, 0);
INSERT INTO `sys_log` VALUES (80, 1, '2021-04-10 17:36:43', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 45, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:43', 1, '2021-04-10 17:36:43', 1, 0);
INSERT INTO `sys_log` VALUES (81, 1, '2021-04-10 17:36:44', '127.0.0.1', '/api/menu/role/4', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[4]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:44', 1, '2021-04-10 17:36:44', 1, 0);
INSERT INTO `sys_log` VALUES (82, 1, '2021-04-10 17:36:45', '127.0.0.1', '/api/menu/role/4', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[4,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:45', 1, '2021-04-10 17:36:45', 1, 0);
INSERT INTO `sys_log` VALUES (83, 1, '2021-04-10 17:36:45', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 44, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:45', 1, '2021-04-10 17:36:45', 1, 0);
INSERT INTO `sys_log` VALUES (84, 1, '2021-04-10 17:36:46', '127.0.0.1', '/api/menu/role/5', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[5]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:46', 1, '2021-04-10 17:36:46', 1, 0);
INSERT INTO `sys_log` VALUES (85, 1, '2021-04-10 17:36:48', '127.0.0.1', '/api/menu/role/5', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[5,3]', 7, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:47', 1, '2021-04-10 17:36:47', 1, 0);
INSERT INTO `sys_log` VALUES (86, 1, '2021-04-10 17:36:48', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 38, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:47', 1, '2021-04-10 17:36:47', 1, 0);
INSERT INTO `sys_log` VALUES (87, 1, '2021-04-10 17:36:48', '127.0.0.1', '/api/menu/role/6', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[6]', 3, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:48', 1, '2021-04-10 17:36:48', 1, 0);
INSERT INTO `sys_log` VALUES (88, 1, '2021-04-10 17:36:49', '127.0.0.1', '/api/menu/role/6', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[6,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:48', 1, '2021-04-10 17:36:48', 1, 0);
INSERT INTO `sys_log` VALUES (89, 1, '2021-04-10 17:36:49', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 51, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:49', 1, '2021-04-10 17:36:49', 1, 0);
INSERT INTO `sys_log` VALUES (90, 1, '2021-04-10 17:36:53', '127.0.0.1', '/api/menu/role/7', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[7]', 1, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:52', 1, '2021-04-10 17:36:52', 1, 0);
INSERT INTO `sys_log` VALUES (91, 1, '2021-04-10 17:36:53', '127.0.0.1', '/api/menu/role/7', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[7,3]', 11, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:53', 1, '2021-04-10 17:36:53', 1, 0);
INSERT INTO `sys_log` VALUES (92, 1, '2021-04-10 17:36:53', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 51, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:53', 1, '2021-04-10 17:36:53', 1, 0);
INSERT INTO `sys_log` VALUES (93, 1, '2021-04-10 17:36:54', '127.0.0.1', '/api/menu/role/8', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[8]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:54', 1, '2021-04-10 17:36:54', 1, 0);
INSERT INTO `sys_log` VALUES (94, 1, '2021-04-10 17:36:55', '127.0.0.1', '/api/menu/role/8', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[8,3]', 10, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:55', 1, '2021-04-10 17:36:55', 1, 0);
INSERT INTO `sys_log` VALUES (95, 1, '2021-04-10 17:36:55', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 45, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:55', 1, '2021-04-10 17:36:55', 1, 0);
INSERT INTO `sys_log` VALUES (96, 1, '2021-04-10 17:36:56', '127.0.0.1', '/api/menu/role/9', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[9]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:56', 1, '2021-04-10 17:36:56', 1, 0);
INSERT INTO `sys_log` VALUES (97, 1, '2021-04-10 17:36:58', '127.0.0.1', '/api/menu/role/9', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[9,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:36:57', 1, '2021-04-10 17:36:57', 1, 0);
INSERT INTO `sys_log` VALUES (98, 1, '2021-04-10 17:36:58', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 42, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:36:57', 1, '2021-04-10 17:36:57', 1, 0);
INSERT INTO `sys_log` VALUES (99, 1, '2021-04-10 17:36:59', '127.0.0.1', '/api/menu/role/10', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[10]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:36:59', 1, '2021-04-10 17:36:59', 1, 0);
INSERT INTO `sys_log` VALUES (100, 1, '2021-04-10 17:37:00', '127.0.0.1', '/api/menu/role/10', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[10,3]', 11, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:00', 1, '2021-04-10 17:37:00', 1, 0);
INSERT INTO `sys_log` VALUES (101, 1, '2021-04-10 17:37:00', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 41, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:00', 1, '2021-04-10 17:37:00', 1, 0);
INSERT INTO `sys_log` VALUES (102, 1, '2021-04-10 17:37:04', '127.0.0.1', '/api/menu/role/11', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[11]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:04', 1, '2021-04-10 17:37:04', 1, 0);
INSERT INTO `sys_log` VALUES (103, 1, '2021-04-10 17:37:05', '127.0.0.1', '/api/menu/role/11', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[11,3]', 38, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:05', 1, '2021-04-10 17:37:05', 1, 0);
INSERT INTO `sys_log` VALUES (104, 1, '2021-04-10 17:37:05', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 36, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:05', 1, '2021-04-10 17:37:05', 1, 0);
INSERT INTO `sys_log` VALUES (105, 1, '2021-04-10 17:37:06', '127.0.0.1', '/api/menu/role/12', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[12]', 3, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:06', 1, '2021-04-10 17:37:06', 1, 0);
INSERT INTO `sys_log` VALUES (106, 1, '2021-04-10 17:37:07', '127.0.0.1', '/api/menu/role/12', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[12,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:06', 1, '2021-04-10 17:37:06', 1, 0);
INSERT INTO `sys_log` VALUES (107, 1, '2021-04-10 17:37:07', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 50, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:06', 1, '2021-04-10 17:37:06', 1, 0);
INSERT INTO `sys_log` VALUES (108, 1, '2021-04-10 17:37:07', '127.0.0.1', '/api/menu/role/13', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[13]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:07', 1, '2021-04-10 17:37:07', 1, 0);
INSERT INTO `sys_log` VALUES (109, 1, '2021-04-10 17:37:08', '127.0.0.1', '/api/menu/role/13', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[13,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:08', 1, '2021-04-10 17:37:08', 1, 0);
INSERT INTO `sys_log` VALUES (110, 1, '2021-04-10 17:37:08', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 49, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:08', 1, '2021-04-10 17:37:08', 1, 0);
INSERT INTO `sys_log` VALUES (111, 1, '2021-04-10 17:37:12', '127.0.0.1', '/api/menu/role/24', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[24]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:12', 1, '2021-04-10 17:37:12', 1, 0);
INSERT INTO `sys_log` VALUES (112, 1, '2021-04-10 17:37:13', '127.0.0.1', '/api/menu/role/24', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[24,3]', 7, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:12', 1, '2021-04-10 17:37:12', 1, 0);
INSERT INTO `sys_log` VALUES (113, 1, '2021-04-10 17:37:13', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 48, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:12', 1, '2021-04-10 17:37:12', 1, 0);
INSERT INTO `sys_log` VALUES (114, 1, '2021-04-10 17:37:13', '127.0.0.1', '/api/menu/role/25', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[25]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:13', 1, '2021-04-10 17:37:13', 1, 0);
INSERT INTO `sys_log` VALUES (115, 1, '2021-04-10 17:37:14', '127.0.0.1', '/api/menu/role/25', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[25,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:13', 1, '2021-04-10 17:37:13', 1, 0);
INSERT INTO `sys_log` VALUES (116, 1, '2021-04-10 17:37:14', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 43, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:14', 1, '2021-04-10 17:37:14', 1, 0);
INSERT INTO `sys_log` VALUES (117, 1, '2021-04-10 17:37:15', '127.0.0.1', '/api/menu/role/26', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[26]', 3, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:14', 1, '2021-04-10 17:37:14', 1, 0);
INSERT INTO `sys_log` VALUES (118, 1, '2021-04-10 17:37:15', '127.0.0.1', '/api/menu/role/26', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[26,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:15', 1, '2021-04-10 17:37:15', 1, 0);
INSERT INTO `sys_log` VALUES (119, 1, '2021-04-10 17:37:15', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 44, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:15', 1, '2021-04-10 17:37:15', 1, 0);
INSERT INTO `sys_log` VALUES (120, 1, '2021-04-10 17:37:18', '127.0.0.1', '/api/menu/role/14', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[14]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:18', 1, '2021-04-10 17:37:18', 1, 0);
INSERT INTO `sys_log` VALUES (121, 1, '2021-04-10 17:37:19', '127.0.0.1', '/api/menu/role/14', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[14,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:19', 1, '2021-04-10 17:37:19', 1, 0);
INSERT INTO `sys_log` VALUES (122, 1, '2021-04-10 17:37:19', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 41, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:19', 1, '2021-04-10 17:37:19', 1, 0);
INSERT INTO `sys_log` VALUES (123, 1, '2021-04-10 17:37:20', '127.0.0.1', '/api/menu/role/15', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[15]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:19', 1, '2021-04-10 17:37:19', 1, 0);
INSERT INTO `sys_log` VALUES (124, 1, '2021-04-10 17:37:21', '127.0.0.1', '/api/menu/role/15', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[15,3]', 10, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:20', 1, '2021-04-10 17:37:20', 1, 0);
INSERT INTO `sys_log` VALUES (125, 1, '2021-04-10 17:37:21', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 45, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:20', 1, '2021-04-10 17:37:20', 1, 0);
INSERT INTO `sys_log` VALUES (126, 1, '2021-04-10 17:37:21', '127.0.0.1', '/api/menu/role/16', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[16]', 3, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:21', 1, '2021-04-10 17:37:21', 1, 0);
INSERT INTO `sys_log` VALUES (127, 1, '2021-04-10 17:37:24', '127.0.0.1', '/api/menu/role/16', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[16,3]', 8, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:24', 1, '2021-04-10 17:37:24', 1, 0);
INSERT INTO `sys_log` VALUES (128, 1, '2021-04-10 17:37:24', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 37, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:24', 1, '2021-04-10 17:37:24', 1, 0);
INSERT INTO `sys_log` VALUES (129, 1, '2021-04-10 17:37:30', '127.0.0.1', '/api/menu/role/19', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[19]', 3, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:30', 1, '2021-04-10 17:37:30', 1, 0);
INSERT INTO `sys_log` VALUES (130, 1, '2021-04-10 17:37:31', '127.0.0.1', '/api/menu/role/19', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[19,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:31', 1, '2021-04-10 17:37:31', 1, 0);
INSERT INTO `sys_log` VALUES (131, 1, '2021-04-10 17:37:31', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 41, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:31', 1, '2021-04-10 17:37:31', 1, 0);
INSERT INTO `sys_log` VALUES (132, 1, '2021-04-10 17:37:32', '127.0.0.1', '/api/menu/role/21', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[21]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:32', 1, '2021-04-10 17:37:32', 1, 0);
INSERT INTO `sys_log` VALUES (133, 1, '2021-04-10 17:37:34', '127.0.0.1', '/api/menu/role/21', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[21,3]', 11, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:34', 1, '2021-04-10 17:37:34', 1, 0);
INSERT INTO `sys_log` VALUES (134, 1, '2021-04-10 17:37:34', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 40, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:34', 1, '2021-04-10 17:37:34', 1, 0);
INSERT INTO `sys_log` VALUES (135, 1, '2021-04-10 17:37:36', '127.0.0.1', '/api/menu/role/20', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[20]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:37:35', 1, '2021-04-10 17:37:35', 1, 0);
INSERT INTO `sys_log` VALUES (136, 1, '2021-04-10 17:37:38', '127.0.0.1', '/api/menu/role/20', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[20,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:37:37', 1, '2021-04-10 17:37:37', 1, 0);
INSERT INTO `sys_log` VALUES (137, 1, '2021-04-10 17:37:38', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 40, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:37:37', 1, '2021-04-10 17:37:37', 1, 0);
INSERT INTO `sys_log` VALUES (138, 1, '2021-04-10 17:37:42', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', '[1,10,{\"id\":null,\"name\":null,\"type\":null,\"uri\":null,\"uploadTime\":null,\"uploadUserId\":null,\"parentId\":null,\"bakFiles\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 18, 1, '分页查询文件资源管理表数据', NULL, NULL, '2021-04-10 17:37:42', 1, '2021-04-10 17:37:42', 1, 0);
INSERT INTO `sys_log` VALUES (139, 1, '2021-04-10 17:37:44', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 13, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:37:44', 1, '2021-04-10 17:37:44', 1, 0);
INSERT INTO `sys_log` VALUES (140, 1, '2021-04-10 17:37:49', '127.0.0.1', '/api/role/list', 'GET', 'class com.zero.auth.controller.RoleController.list', '[{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 3, 1, '获取所有的用户角色', NULL, NULL, '2021-04-10 17:37:49', 1, '2021-04-10 17:37:49', 1, 0);
INSERT INTO `sys_log` VALUES (141, 1, '2021-04-10 17:38:00', '127.0.0.1', '/api/table/info/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.page', '[1,10,{\"id\":null,\"name\":null,\"comment\":null,\"entityName\":null,\"requestMapping\":null,\"javaPackageName\":null,\"javaCodePath\":null,\"vueCodePath\":null,\"vuePackage\":null,\"codeAuthor\":null,\"tableColumnList\":null}]', 13, 1, '分页查询系统数据库表信息数据', NULL, NULL, '2021-04-10 17:37:59', 1, '2021-04-10 17:37:59', 1, 0);
INSERT INTO `sys_log` VALUES (142, 1, '2021-04-10 17:38:09', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:08', 1, '2021-04-10 17:38:08', 1, 0);
INSERT INTO `sys_log` VALUES (143, 1, '2021-04-10 17:38:11', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:10', 1, '2021-04-10 17:38:10', 1, 0);
INSERT INTO `sys_log` VALUES (144, 1, '2021-04-10 17:38:12', '127.0.0.1', '/api/resources/role/1', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[1]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:11', 1, '2021-04-10 17:38:11', 1, 0);
INSERT INTO `sys_log` VALUES (145, 1, '2021-04-10 17:38:13', '127.0.0.1', '/api/resources/role/1', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[1,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:12', 1, '2021-04-10 17:38:12', 1, 0);
INSERT INTO `sys_log` VALUES (146, 1, '2021-04-10 17:38:13', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 22, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:12', 1, '2021-04-10 17:38:12', 1, 0);
INSERT INTO `sys_log` VALUES (147, 1, '2021-04-10 17:38:14', '127.0.0.1', '/api/resources/role/2', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[2]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:13', 1, '2021-04-10 17:38:13', 1, 0);
INSERT INTO `sys_log` VALUES (148, 1, '2021-04-10 17:38:14', '127.0.0.1', '/api/resources/role/2', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[2,3]', 12, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:14', 1, '2021-04-10 17:38:14', 1, 0);
INSERT INTO `sys_log` VALUES (149, 1, '2021-04-10 17:38:14', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:14', 1, '2021-04-10 17:38:14', 1, 0);
INSERT INTO `sys_log` VALUES (150, 1, '2021-04-10 17:38:15', '127.0.0.1', '/api/resources/role/3', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[3]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:15', 1, '2021-04-10 17:38:15', 1, 0);
INSERT INTO `sys_log` VALUES (151, 1, '2021-04-10 17:38:18', '127.0.0.1', '/api/resources/role/3', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[3,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:17', 1, '2021-04-10 17:38:17', 1, 0);
INSERT INTO `sys_log` VALUES (152, 1, '2021-04-10 17:38:18', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:17', 1, '2021-04-10 17:38:17', 1, 0);
INSERT INTO `sys_log` VALUES (153, 1, '2021-04-10 17:38:18', '127.0.0.1', '/api/resources/role/4', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[4]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:18', 1, '2021-04-10 17:38:18', 1, 0);
INSERT INTO `sys_log` VALUES (154, 1, '2021-04-10 17:38:19', '127.0.0.1', '/api/resources/role/4', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[4,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:19', 1, '2021-04-10 17:38:19', 1, 0);
INSERT INTO `sys_log` VALUES (155, 1, '2021-04-10 17:38:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:19', 1, '2021-04-10 17:38:19', 1, 0);
INSERT INTO `sys_log` VALUES (156, 1, '2021-04-10 17:38:20', '127.0.0.1', '/api/resources/role/6', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[6]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:19', 1, '2021-04-10 17:38:19', 1, 0);
INSERT INTO `sys_log` VALUES (157, 1, '2021-04-10 17:38:20', '127.0.0.1', '/api/resources/role/6', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[6,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:20', 1, '2021-04-10 17:38:20', 1, 0);
INSERT INTO `sys_log` VALUES (158, 1, '2021-04-10 17:38:20', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:20', 1, '2021-04-10 17:38:20', 1, 0);
INSERT INTO `sys_log` VALUES (159, 1, '2021-04-10 17:38:21', '127.0.0.1', '/api/resources/role/11', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[11]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:21', 1, '2021-04-10 17:38:21', 1, 0);
INSERT INTO `sys_log` VALUES (160, 1, '2021-04-10 17:38:22', '127.0.0.1', '/api/resources/role/11', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[11,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:21', 1, '2021-04-10 17:38:21', 1, 0);
INSERT INTO `sys_log` VALUES (161, 1, '2021-04-10 17:38:22', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:21', 1, '2021-04-10 17:38:21', 1, 0);
INSERT INTO `sys_log` VALUES (162, 1, '2021-04-10 17:38:22', '127.0.0.1', '/api/resources/role/12', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[12]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:22', 1, '2021-04-10 17:38:22', 1, 0);
INSERT INTO `sys_log` VALUES (163, 1, '2021-04-10 17:38:23', '127.0.0.1', '/api/resources/role/12', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[12,2]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:22', 1, '2021-04-10 17:38:22', 1, 0);
INSERT INTO `sys_log` VALUES (164, 1, '2021-04-10 17:38:23', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:23', 1, '2021-04-10 17:38:23', 1, 0);
INSERT INTO `sys_log` VALUES (165, 1, '2021-04-10 17:38:24', '127.0.0.1', '/api/resources/role/12', 'DELETE', 'class com.zero.auth.controller.ResourcesController.deleteResourcesRole', '[12,2]', 7, 1, '删除系统资源角色', NULL, NULL, '2021-04-10 17:38:24', 1, '2021-04-10 17:38:24', 1, 0);
INSERT INTO `sys_log` VALUES (166, 1, '2021-04-10 17:38:24', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:24', 1, '2021-04-10 17:38:24', 1, 0);
INSERT INTO `sys_log` VALUES (167, 1, '2021-04-10 17:38:25', '127.0.0.1', '/api/resources/role/12', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[12]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:24', 1, '2021-04-10 17:38:24', 1, 0);
INSERT INTO `sys_log` VALUES (168, 1, '2021-04-10 17:38:26', '127.0.0.1', '/api/resources/role/12', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[12,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:25', 1, '2021-04-10 17:38:25', 1, 0);
INSERT INTO `sys_log` VALUES (169, 1, '2021-04-10 17:38:26', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 14, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:25', 1, '2021-04-10 17:38:25', 1, 0);
INSERT INTO `sys_log` VALUES (170, 1, '2021-04-10 17:38:26', '127.0.0.1', '/api/resources/role/13', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[13]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:26', 1, '2021-04-10 17:38:26', 1, 0);
INSERT INTO `sys_log` VALUES (171, 1, '2021-04-10 17:38:27', '127.0.0.1', '/api/resources/role/13', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[13,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:27', 1, '2021-04-10 17:38:27', 1, 0);
INSERT INTO `sys_log` VALUES (172, 1, '2021-04-10 17:38:27', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:27', 1, '2021-04-10 17:38:27', 1, 0);
INSERT INTO `sys_log` VALUES (173, 1, '2021-04-10 17:38:28', '127.0.0.1', '/api/resources/role/14', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[14]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:27', 1, '2021-04-10 17:38:27', 1, 0);
INSERT INTO `sys_log` VALUES (174, 1, '2021-04-10 17:38:28', '127.0.0.1', '/api/resources/role/14', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[14,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:28', 1, '2021-04-10 17:38:28', 1, 0);
INSERT INTO `sys_log` VALUES (175, 1, '2021-04-10 17:38:28', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:28', 1, '2021-04-10 17:38:28', 1, 0);
INSERT INTO `sys_log` VALUES (176, 1, '2021-04-10 17:38:29', '127.0.0.1', '/api/resources/role/21', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[21]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:28', 1, '2021-04-10 17:38:28', 1, 0);
INSERT INTO `sys_log` VALUES (177, 1, '2021-04-10 17:38:30', '127.0.0.1', '/api/resources/role/21', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[21,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:30', 1, '2021-04-10 17:38:30', 1, 0);
INSERT INTO `sys_log` VALUES (178, 1, '2021-04-10 17:38:30', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:30', 1, '2021-04-10 17:38:30', 1, 0);
INSERT INTO `sys_log` VALUES (179, 1, '2021-04-10 17:38:45', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:45', 1, '2021-04-10 17:38:45', 1, 0);
INSERT INTO `sys_log` VALUES (180, 1, '2021-04-10 17:38:46', '127.0.0.1', '/api/resources/role/22', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[22]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:46', 1, '2021-04-10 17:38:46', 1, 0);
INSERT INTO `sys_log` VALUES (181, 1, '2021-04-10 17:38:47', '127.0.0.1', '/api/resources/role/22', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[22,3]', 12, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:46', 1, '2021-04-10 17:38:46', 1, 0);
INSERT INTO `sys_log` VALUES (182, 1, '2021-04-10 17:38:47', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:46', 1, '2021-04-10 17:38:46', 1, 0);
INSERT INTO `sys_log` VALUES (183, 1, '2021-04-10 17:38:47', '127.0.0.1', '/api/resources/role/23', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[23]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:47', 1, '2021-04-10 17:38:47', 1, 0);
INSERT INTO `sys_log` VALUES (184, 1, '2021-04-10 17:38:48', '127.0.0.1', '/api/resources/role/23', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[23,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:47', 1, '2021-04-10 17:38:47', 1, 0);
INSERT INTO `sys_log` VALUES (185, 1, '2021-04-10 17:38:48', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:48', 1, '2021-04-10 17:38:48', 1, 0);
INSERT INTO `sys_log` VALUES (186, 1, '2021-04-10 17:38:49', '127.0.0.1', '/api/resources/role/24', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[24]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:48', 1, '2021-04-10 17:38:48', 1, 0);
INSERT INTO `sys_log` VALUES (187, 1, '2021-04-10 17:38:49', '127.0.0.1', '/api/resources/role/24', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[24,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:49', 1, '2021-04-10 17:38:49', 1, 0);
INSERT INTO `sys_log` VALUES (188, 1, '2021-04-10 17:38:49', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:49', 1, '2021-04-10 17:38:49', 1, 0);
INSERT INTO `sys_log` VALUES (189, 1, '2021-04-10 17:38:50', '127.0.0.1', '/api/resources/role/25', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[25]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:49', 1, '2021-04-10 17:38:49', 1, 0);
INSERT INTO `sys_log` VALUES (190, 1, '2021-04-10 17:38:50', '127.0.0.1', '/api/resources/role/25', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[25,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:50', 1, '2021-04-10 17:38:50', 1, 0);
INSERT INTO `sys_log` VALUES (191, 1, '2021-04-10 17:38:50', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:50', 1, '2021-04-10 17:38:50', 1, 0);
INSERT INTO `sys_log` VALUES (192, 1, '2021-04-10 17:38:51', '127.0.0.1', '/api/resources/role/31', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[31]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:50', 1, '2021-04-10 17:38:50', 1, 0);
INSERT INTO `sys_log` VALUES (193, 1, '2021-04-10 17:38:51', '127.0.0.1', '/api/resources/role/31', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[31,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:51', 1, '2021-04-10 17:38:51', 1, 0);
INSERT INTO `sys_log` VALUES (194, 1, '2021-04-10 17:38:52', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:51', 1, '2021-04-10 17:38:51', 1, 0);
INSERT INTO `sys_log` VALUES (195, 1, '2021-04-10 17:38:52', '127.0.0.1', '/api/resources/role/33', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[33]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:51', 1, '2021-04-10 17:38:51', 1, 0);
INSERT INTO `sys_log` VALUES (196, 1, '2021-04-10 17:38:53', '127.0.0.1', '/api/resources/role/33', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[33,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:52', 1, '2021-04-10 17:38:52', 1, 0);
INSERT INTO `sys_log` VALUES (197, 1, '2021-04-10 17:38:53', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:52', 1, '2021-04-10 17:38:52', 1, 0);
INSERT INTO `sys_log` VALUES (198, 1, '2021-04-10 17:38:53', '127.0.0.1', '/api/resources/role/34', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[34]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:53', 1, '2021-04-10 17:38:53', 1, 0);
INSERT INTO `sys_log` VALUES (199, 1, '2021-04-10 17:38:54', '127.0.0.1', '/api/resources/role/34', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[34,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:53', 1, '2021-04-10 17:38:53', 1, 0);
INSERT INTO `sys_log` VALUES (200, 1, '2021-04-10 17:38:54', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:53', 1, '2021-04-10 17:38:53', 1, 0);
INSERT INTO `sys_log` VALUES (201, 1, '2021-04-10 17:38:54', '127.0.0.1', '/api/resources/role/35', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[35]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:54', 1, '2021-04-10 17:38:54', 1, 0);
INSERT INTO `sys_log` VALUES (202, 1, '2021-04-10 17:38:55', '127.0.0.1', '/api/resources/role/35', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[35,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:55', 1, '2021-04-10 17:38:55', 1, 0);
INSERT INTO `sys_log` VALUES (203, 1, '2021-04-10 17:38:55', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:55', 1, '2021-04-10 17:38:55', 1, 0);
INSERT INTO `sys_log` VALUES (204, 1, '2021-04-10 17:38:56', '127.0.0.1', '/api/resources/role/39', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[39]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:55', 1, '2021-04-10 17:38:55', 1, 0);
INSERT INTO `sys_log` VALUES (205, 1, '2021-04-10 17:38:56', '127.0.0.1', '/api/resources/role/39', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[39,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:56', 1, '2021-04-10 17:38:56', 1, 0);
INSERT INTO `sys_log` VALUES (206, 1, '2021-04-10 17:38:56', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:56', 1, '2021-04-10 17:38:56', 1, 0);
INSERT INTO `sys_log` VALUES (207, 1, '2021-04-10 17:38:57', '127.0.0.1', '/api/resources/role/41', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[41]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:38:56', 1, '2021-04-10 17:38:56', 1, 0);
INSERT INTO `sys_log` VALUES (208, 1, '2021-04-10 17:38:58', '127.0.0.1', '/api/resources/role/41', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[41,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:38:57', 1, '2021-04-10 17:38:57', 1, 0);
INSERT INTO `sys_log` VALUES (209, 1, '2021-04-10 17:38:58', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:57', 1, '2021-04-10 17:38:57', 1, 0);
INSERT INTO `sys_log` VALUES (210, 1, '2021-04-10 17:38:59', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:38:59', 1, '2021-04-10 17:38:59', 1, 0);
INSERT INTO `sys_log` VALUES (211, 1, '2021-04-10 17:39:00', '127.0.0.1', '/api/resources/role/45', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[45]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:00', 1, '2021-04-10 17:39:00', 1, 0);
INSERT INTO `sys_log` VALUES (212, 1, '2021-04-10 17:39:01', '127.0.0.1', '/api/resources/role/45', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[45,3]', 12, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:01', 1, '2021-04-10 17:39:01', 1, 0);
INSERT INTO `sys_log` VALUES (213, 1, '2021-04-10 17:39:01', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:01', 1, '2021-04-10 17:39:01', 1, 0);
INSERT INTO `sys_log` VALUES (214, 1, '2021-04-10 17:39:02', '127.0.0.1', '/api/resources/role/46', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[46]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:01', 1, '2021-04-10 17:39:01', 1, 0);
INSERT INTO `sys_log` VALUES (215, 1, '2021-04-10 17:39:02', '127.0.0.1', '/api/resources/role/46', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[46,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:02', 1, '2021-04-10 17:39:02', 1, 0);
INSERT INTO `sys_log` VALUES (216, 1, '2021-04-10 17:39:02', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:02', 1, '2021-04-10 17:39:02', 1, 0);
INSERT INTO `sys_log` VALUES (217, 1, '2021-04-10 17:39:03', '127.0.0.1', '/api/resources/role/48', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[48]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:02', 1, '2021-04-10 17:39:02', 1, 0);
INSERT INTO `sys_log` VALUES (218, 1, '2021-04-10 17:39:03', '127.0.0.1', '/api/resources/role/48', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[48,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:03', 1, '2021-04-10 17:39:03', 1, 0);
INSERT INTO `sys_log` VALUES (219, 1, '2021-04-10 17:39:03', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:03', 1, '2021-04-10 17:39:03', 1, 0);
INSERT INTO `sys_log` VALUES (220, 1, '2021-04-10 17:39:04', '127.0.0.1', '/api/resources/role/49', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[49]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:03', 1, '2021-04-10 17:39:03', 1, 0);
INSERT INTO `sys_log` VALUES (221, 1, '2021-04-10 17:39:05', '127.0.0.1', '/api/resources/role/49', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[49,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:04', 1, '2021-04-10 17:39:04', 1, 0);
INSERT INTO `sys_log` VALUES (222, 1, '2021-04-10 17:39:05', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:04', 1, '2021-04-10 17:39:04', 1, 0);
INSERT INTO `sys_log` VALUES (223, 1, '2021-04-10 17:39:05', '127.0.0.1', '/api/resources/role/50', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[50]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:05', 1, '2021-04-10 17:39:05', 1, 0);
INSERT INTO `sys_log` VALUES (224, 1, '2021-04-10 17:39:06', '127.0.0.1', '/api/resources/role/50', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[50,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:05', 1, '2021-04-10 17:39:05', 1, 0);
INSERT INTO `sys_log` VALUES (225, 1, '2021-04-10 17:39:06', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:05', 1, '2021-04-10 17:39:05', 1, 0);
INSERT INTO `sys_log` VALUES (226, 1, '2021-04-10 17:39:06', '127.0.0.1', '/api/resources/role/51', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[51]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:06', 1, '2021-04-10 17:39:06', 1, 0);
INSERT INTO `sys_log` VALUES (227, 1, '2021-04-10 17:39:07', '127.0.0.1', '/api/resources/role/51', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[51,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:06', 1, '2021-04-10 17:39:06', 1, 0);
INSERT INTO `sys_log` VALUES (228, 1, '2021-04-10 17:39:07', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:06', 1, '2021-04-10 17:39:06', 1, 0);
INSERT INTO `sys_log` VALUES (229, 1, '2021-04-10 17:39:07', '127.0.0.1', '/api/resources/role/55', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[55]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:07', 1, '2021-04-10 17:39:07', 1, 0);
INSERT INTO `sys_log` VALUES (230, 1, '2021-04-10 17:39:08', '127.0.0.1', '/api/resources/role/55', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[55,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:08', 1, '2021-04-10 17:39:08', 1, 0);
INSERT INTO `sys_log` VALUES (231, 1, '2021-04-10 17:39:08', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:08', 1, '2021-04-10 17:39:08', 1, 0);
INSERT INTO `sys_log` VALUES (232, 1, '2021-04-10 17:39:08', '127.0.0.1', '/api/resources/role/60', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[60]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:08', 1, '2021-04-10 17:39:08', 1, 0);
INSERT INTO `sys_log` VALUES (233, 1, '2021-04-10 17:39:09', '127.0.0.1', '/api/resources/role/60', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[60,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:09', 1, '2021-04-10 17:39:09', 1, 0);
INSERT INTO `sys_log` VALUES (234, 1, '2021-04-10 17:39:09', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:09', 1, '2021-04-10 17:39:09', 1, 0);
INSERT INTO `sys_log` VALUES (235, 1, '2021-04-10 17:39:10', '127.0.0.1', '/api/resources/role/61', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[61]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:09', 1, '2021-04-10 17:39:09', 1, 0);
INSERT INTO `sys_log` VALUES (236, 1, '2021-04-10 17:39:10', '127.0.0.1', '/api/resources/role/61', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[61,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:10', 1, '2021-04-10 17:39:10', 1, 0);
INSERT INTO `sys_log` VALUES (237, 1, '2021-04-10 17:39:10', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 22, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:10', 1, '2021-04-10 17:39:10', 1, 0);
INSERT INTO `sys_log` VALUES (238, 1, '2021-04-10 17:39:11', '127.0.0.1', '/api/resources/role/62', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[62]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:10', 1, '2021-04-10 17:39:10', 1, 0);
INSERT INTO `sys_log` VALUES (239, 1, '2021-04-10 17:39:12', '127.0.0.1', '/api/resources/role/62', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[62,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:11', 1, '2021-04-10 17:39:11', 1, 0);
INSERT INTO `sys_log` VALUES (240, 1, '2021-04-10 17:39:12', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:11', 1, '2021-04-10 17:39:11', 1, 0);
INSERT INTO `sys_log` VALUES (241, 1, '2021-04-10 17:39:13', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:12', 1, '2021-04-10 17:39:12', 1, 0);
INSERT INTO `sys_log` VALUES (242, 1, '2021-04-10 17:39:14', '127.0.0.1', '/api/resources/role/64', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[64]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:13', 1, '2021-04-10 17:39:13', 1, 0);
INSERT INTO `sys_log` VALUES (243, 1, '2021-04-10 17:39:14', '127.0.0.1', '/api/resources/role/64', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[64,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:14', 1, '2021-04-10 17:39:14', 1, 0);
INSERT INTO `sys_log` VALUES (244, 1, '2021-04-10 17:39:15', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:14', 1, '2021-04-10 17:39:14', 1, 0);
INSERT INTO `sys_log` VALUES (245, 1, '2021-04-10 17:39:15', '127.0.0.1', '/api/resources/role/65', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[65]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:14', 1, '2021-04-10 17:39:14', 1, 0);
INSERT INTO `sys_log` VALUES (246, 1, '2021-04-10 17:39:15', '127.0.0.1', '/api/resources/role/65', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[65,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:15', 1, '2021-04-10 17:39:15', 1, 0);
INSERT INTO `sys_log` VALUES (247, 1, '2021-04-10 17:39:16', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:15', 1, '2021-04-10 17:39:15', 1, 0);
INSERT INTO `sys_log` VALUES (248, 1, '2021-04-10 17:39:16', '127.0.0.1', '/api/resources/role/66', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[66]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:16', 1, '2021-04-10 17:39:16', 1, 0);
INSERT INTO `sys_log` VALUES (249, 1, '2021-04-10 17:39:17', '127.0.0.1', '/api/resources/role/66', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[66,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:16', 1, '2021-04-10 17:39:16', 1, 0);
INSERT INTO `sys_log` VALUES (250, 1, '2021-04-10 17:39:17', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:16', 1, '2021-04-10 17:39:16', 1, 0);
INSERT INTO `sys_log` VALUES (251, 1, '2021-04-10 17:39:18', '127.0.0.1', '/api/resources/role/67', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[67]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:17', 1, '2021-04-10 17:39:17', 1, 0);
INSERT INTO `sys_log` VALUES (252, 1, '2021-04-10 17:39:18', '127.0.0.1', '/api/resources/role/67', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[67,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:18', 1, '2021-04-10 17:39:18', 1, 0);
INSERT INTO `sys_log` VALUES (253, 1, '2021-04-10 17:39:18', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 22, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:18', 1, '2021-04-10 17:39:18', 1, 0);
INSERT INTO `sys_log` VALUES (254, 1, '2021-04-10 17:39:19', '127.0.0.1', '/api/resources/role/74', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[74]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:18', 1, '2021-04-10 17:39:18', 1, 0);
INSERT INTO `sys_log` VALUES (255, 1, '2021-04-10 17:39:20', '127.0.0.1', '/api/resources/role/74', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[74,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:19', 1, '2021-04-10 17:39:19', 1, 0);
INSERT INTO `sys_log` VALUES (256, 1, '2021-04-10 17:39:20', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:19', 1, '2021-04-10 17:39:19', 1, 0);
INSERT INTO `sys_log` VALUES (257, 1, '2021-04-10 17:39:20', '127.0.0.1', '/api/resources/role/76', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[76]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:20', 1, '2021-04-10 17:39:20', 1, 0);
INSERT INTO `sys_log` VALUES (258, 1, '2021-04-10 17:39:21', '127.0.0.1', '/api/resources/role/76', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[76,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:20', 1, '2021-04-10 17:39:20', 1, 0);
INSERT INTO `sys_log` VALUES (259, 1, '2021-04-10 17:39:21', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:20', 1, '2021-04-10 17:39:20', 1, 0);
INSERT INTO `sys_log` VALUES (260, 1, '2021-04-10 17:39:22', '127.0.0.1', '/api/resources/role/77', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[77]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:22', 1, '2021-04-10 17:39:22', 1, 0);
INSERT INTO `sys_log` VALUES (261, 1, '2021-04-10 17:39:23', '127.0.0.1', '/api/resources/role/77', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[77,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:22', 1, '2021-04-10 17:39:22', 1, 0);
INSERT INTO `sys_log` VALUES (262, 1, '2021-04-10 17:39:23', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:22', 1, '2021-04-10 17:39:22', 1, 0);
INSERT INTO `sys_log` VALUES (263, 1, '2021-04-10 17:39:23', '127.0.0.1', '/api/resources/role/78', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[78]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:23', 1, '2021-04-10 17:39:23', 1, 0);
INSERT INTO `sys_log` VALUES (264, 1, '2021-04-10 17:39:24', '127.0.0.1', '/api/resources/role/78', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[78,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:24', 1, '2021-04-10 17:39:24', 1, 0);
INSERT INTO `sys_log` VALUES (265, 1, '2021-04-10 17:39:24', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 22, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:24', 1, '2021-04-10 17:39:24', 1, 0);
INSERT INTO `sys_log` VALUES (266, 1, '2021-04-10 17:39:25', '127.0.0.1', '/api/resources/role/79', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[79]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:24', 1, '2021-04-10 17:39:24', 1, 0);
INSERT INTO `sys_log` VALUES (267, 1, '2021-04-10 17:39:25', '127.0.0.1', '/api/resources/role/79', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[79,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:25', 1, '2021-04-10 17:39:25', 1, 0);
INSERT INTO `sys_log` VALUES (268, 1, '2021-04-10 17:39:25', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:25', 1, '2021-04-10 17:39:25', 1, 0);
INSERT INTO `sys_log` VALUES (269, 1, '2021-04-10 17:39:26', '127.0.0.1', '/api/resources/role/83', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[83]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:26', 1, '2021-04-10 17:39:26', 1, 0);
INSERT INTO `sys_log` VALUES (270, 1, '2021-04-10 17:39:27', '127.0.0.1', '/api/resources/role/83', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[83,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:26', 1, '2021-04-10 17:39:26', 1, 0);
INSERT INTO `sys_log` VALUES (271, 1, '2021-04-10 17:39:27', '127.0.0.1', '/api/resources/page/4', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[4,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:26', 1, '2021-04-10 17:39:26', 1, 0);
INSERT INTO `sys_log` VALUES (272, 1, '2021-04-10 17:39:28', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:27', 1, '2021-04-10 17:39:27', 1, 0);
INSERT INTO `sys_log` VALUES (273, 1, '2021-04-10 17:39:29', '127.0.0.1', '/api/resources/role/87', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[87]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:28', 1, '2021-04-10 17:39:28', 1, 0);
INSERT INTO `sys_log` VALUES (274, 1, '2021-04-10 17:39:30', '127.0.0.1', '/api/resources/role/87', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[87,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:29', 1, '2021-04-10 17:39:29', 1, 0);
INSERT INTO `sys_log` VALUES (275, 1, '2021-04-10 17:39:30', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:29', 1, '2021-04-10 17:39:29', 1, 0);
INSERT INTO `sys_log` VALUES (276, 1, '2021-04-10 17:39:30', '127.0.0.1', '/api/resources/role/88', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[88]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:30', 1, '2021-04-10 17:39:30', 1, 0);
INSERT INTO `sys_log` VALUES (277, 1, '2021-04-10 17:39:31', '127.0.0.1', '/api/resources/role/88', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[88,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:30', 1, '2021-04-10 17:39:30', 1, 0);
INSERT INTO `sys_log` VALUES (278, 1, '2021-04-10 17:39:31', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:30', 1, '2021-04-10 17:39:30', 1, 0);
INSERT INTO `sys_log` VALUES (279, 1, '2021-04-10 17:39:32', '127.0.0.1', '/api/resources/role/89', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[89]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:31', 1, '2021-04-10 17:39:31', 1, 0);
INSERT INTO `sys_log` VALUES (280, 1, '2021-04-10 17:39:33', '127.0.0.1', '/api/resources/role/89', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[89,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:32', 1, '2021-04-10 17:39:32', 1, 0);
INSERT INTO `sys_log` VALUES (281, 1, '2021-04-10 17:39:33', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:32', 1, '2021-04-10 17:39:32', 1, 0);
INSERT INTO `sys_log` VALUES (282, 1, '2021-04-10 17:39:33', '127.0.0.1', '/api/resources/role/90', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[90]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:33', 1, '2021-04-10 17:39:33', 1, 0);
INSERT INTO `sys_log` VALUES (283, 1, '2021-04-10 17:39:34', '127.0.0.1', '/api/resources/role/90', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[90,3]', 6, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:33', 1, '2021-04-10 17:39:33', 1, 0);
INSERT INTO `sys_log` VALUES (284, 1, '2021-04-10 17:39:34', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:33', 1, '2021-04-10 17:39:33', 1, 0);
INSERT INTO `sys_log` VALUES (285, 1, '2021-04-10 17:39:34', '127.0.0.1', '/api/resources/role/95', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[95]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:34', 1, '2021-04-10 17:39:34', 1, 0);
INSERT INTO `sys_log` VALUES (286, 1, '2021-04-10 17:39:35', '127.0.0.1', '/api/resources/role/95', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[95,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:35', 1, '2021-04-10 17:39:35', 1, 0);
INSERT INTO `sys_log` VALUES (287, 1, '2021-04-10 17:39:35', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:35', 1, '2021-04-10 17:39:35', 1, 0);
INSERT INTO `sys_log` VALUES (288, 1, '2021-04-10 17:39:36', '127.0.0.1', '/api/resources/role/99', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[99]', 3, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:35', 1, '2021-04-10 17:39:35', 1, 0);
INSERT INTO `sys_log` VALUES (289, 1, '2021-04-10 17:39:36', '127.0.0.1', '/api/resources/role/99', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[99,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:36', 1, '2021-04-10 17:39:36', 1, 0);
INSERT INTO `sys_log` VALUES (290, 1, '2021-04-10 17:39:36', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:36', 1, '2021-04-10 17:39:36', 1, 0);
INSERT INTO `sys_log` VALUES (291, 1, '2021-04-10 17:39:37', '127.0.0.1', '/api/resources/role/100', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[100]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:36', 1, '2021-04-10 17:39:36', 1, 0);
INSERT INTO `sys_log` VALUES (292, 1, '2021-04-10 17:39:37', '127.0.0.1', '/api/resources/role/100', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[100,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:37', 1, '2021-04-10 17:39:37', 1, 0);
INSERT INTO `sys_log` VALUES (293, 1, '2021-04-10 17:39:38', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:37', 1, '2021-04-10 17:39:37', 1, 0);
INSERT INTO `sys_log` VALUES (294, 1, '2021-04-10 17:39:38', '127.0.0.1', '/api/resources/role/101', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[101]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:38', 1, '2021-04-10 17:39:38', 1, 0);
INSERT INTO `sys_log` VALUES (295, 1, '2021-04-10 17:39:39', '127.0.0.1', '/api/resources/role/101', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[101,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:39', 1, '2021-04-10 17:39:39', 1, 0);
INSERT INTO `sys_log` VALUES (296, 1, '2021-04-10 17:39:39', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:39', 1, '2021-04-10 17:39:39', 1, 0);
INSERT INTO `sys_log` VALUES (297, 1, '2021-04-10 17:39:40', '127.0.0.1', '/api/resources/role/103', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[103]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:40', 1, '2021-04-10 17:39:40', 1, 0);
INSERT INTO `sys_log` VALUES (298, 1, '2021-04-10 17:39:41', '127.0.0.1', '/api/resources/role/103', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[103,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:40', 1, '2021-04-10 17:39:40', 1, 0);
INSERT INTO `sys_log` VALUES (299, 1, '2021-04-10 17:39:41', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:40', 1, '2021-04-10 17:39:40', 1, 0);
INSERT INTO `sys_log` VALUES (300, 1, '2021-04-10 17:39:41', '127.0.0.1', '/api/resources/role/102', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[102]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:41', 1, '2021-04-10 17:39:41', 1, 0);
INSERT INTO `sys_log` VALUES (301, 1, '2021-04-10 17:39:42', '127.0.0.1', '/api/resources/role/102', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[102,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:42', 1, '2021-04-10 17:39:42', 1, 0);
INSERT INTO `sys_log` VALUES (302, 1, '2021-04-10 17:39:42', '127.0.0.1', '/api/resources/page/5', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[5,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:42', 1, '2021-04-10 17:39:42', 1, 0);
INSERT INTO `sys_log` VALUES (303, 1, '2021-04-10 17:39:43', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:43', 1, '2021-04-10 17:39:43', 1, 0);
INSERT INTO `sys_log` VALUES (304, 1, '2021-04-10 17:39:44', '127.0.0.1', '/api/resources/role/104', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[104]', 4, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:44', 1, '2021-04-10 17:39:44', 1, 0);
INSERT INTO `sys_log` VALUES (305, 1, '2021-04-10 17:39:45', '127.0.0.1', '/api/resources/role/104', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[104,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:44', 1, '2021-04-10 17:39:44', 1, 0);
INSERT INTO `sys_log` VALUES (306, 1, '2021-04-10 17:39:45', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:44', 1, '2021-04-10 17:39:44', 1, 0);
INSERT INTO `sys_log` VALUES (307, 1, '2021-04-10 17:39:45', '127.0.0.1', '/api/resources/role/111', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[111]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:45', 1, '2021-04-10 17:39:45', 1, 0);
INSERT INTO `sys_log` VALUES (308, 1, '2021-04-10 17:39:46', '127.0.0.1', '/api/resources/role/111', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[111,3]', 6, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:46', 1, '2021-04-10 17:39:46', 1, 0);
INSERT INTO `sys_log` VALUES (309, 1, '2021-04-10 17:39:46', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:46', 1, '2021-04-10 17:39:46', 1, 0);
INSERT INTO `sys_log` VALUES (310, 1, '2021-04-10 17:39:46', '127.0.0.1', '/api/resources/role/113', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[113]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:46', 1, '2021-04-10 17:39:46', 1, 0);
INSERT INTO `sys_log` VALUES (311, 1, '2021-04-10 17:39:47', '127.0.0.1', '/api/resources/role/113', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[113,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:47', 1, '2021-04-10 17:39:47', 1, 0);
INSERT INTO `sys_log` VALUES (312, 1, '2021-04-10 17:39:47', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:47', 1, '2021-04-10 17:39:47', 1, 0);
INSERT INTO `sys_log` VALUES (313, 1, '2021-04-10 17:39:48', '127.0.0.1', '/api/resources/role/114', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[114]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:47', 1, '2021-04-10 17:39:47', 1, 0);
INSERT INTO `sys_log` VALUES (314, 1, '2021-04-10 17:39:48', '127.0.0.1', '/api/resources/role/114', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[114,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:48', 1, '2021-04-10 17:39:48', 1, 0);
INSERT INTO `sys_log` VALUES (315, 1, '2021-04-10 17:39:48', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:48', 1, '2021-04-10 17:39:48', 1, 0);
INSERT INTO `sys_log` VALUES (316, 1, '2021-04-10 17:39:49', '127.0.0.1', '/api/resources/role/115', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[115]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:48', 1, '2021-04-10 17:39:48', 1, 0);
INSERT INTO `sys_log` VALUES (317, 1, '2021-04-10 17:39:49', '127.0.0.1', '/api/resources/role/115', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[115,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:49', 1, '2021-04-10 17:39:49', 1, 0);
INSERT INTO `sys_log` VALUES (318, 1, '2021-04-10 17:39:50', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:49', 1, '2021-04-10 17:39:49', 1, 0);
INSERT INTO `sys_log` VALUES (319, 1, '2021-04-10 17:39:50', '127.0.0.1', '/api/resources/role/116', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[116]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:50', 1, '2021-04-10 17:39:50', 1, 0);
INSERT INTO `sys_log` VALUES (320, 1, '2021-04-10 17:39:51', '127.0.0.1', '/api/resources/role/116', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[116,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:50', 1, '2021-04-10 17:39:50', 1, 0);
INSERT INTO `sys_log` VALUES (321, 1, '2021-04-10 17:39:51', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:50', 1, '2021-04-10 17:39:50', 1, 0);
INSERT INTO `sys_log` VALUES (322, 1, '2021-04-10 17:39:51', '127.0.0.1', '/api/resources/role/122', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[122]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:51', 1, '2021-04-10 17:39:51', 1, 0);
INSERT INTO `sys_log` VALUES (323, 1, '2021-04-10 17:39:52', '127.0.0.1', '/api/resources/role/122', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[122,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:51', 1, '2021-04-10 17:39:51', 1, 0);
INSERT INTO `sys_log` VALUES (324, 1, '2021-04-10 17:39:52', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:51', 1, '2021-04-10 17:39:51', 1, 0);
INSERT INTO `sys_log` VALUES (325, 1, '2021-04-10 17:39:53', '127.0.0.1', '/api/resources/role/123', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[123]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:52', 1, '2021-04-10 17:39:52', 1, 0);
INSERT INTO `sys_log` VALUES (326, 1, '2021-04-10 17:39:53', '127.0.0.1', '/api/resources/role/123', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[123,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:53', 1, '2021-04-10 17:39:53', 1, 0);
INSERT INTO `sys_log` VALUES (327, 1, '2021-04-10 17:39:53', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:53', 1, '2021-04-10 17:39:53', 1, 0);
INSERT INTO `sys_log` VALUES (328, 1, '2021-04-10 17:39:55', '127.0.0.1', '/api/resources/role/124', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[124]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:54', 1, '2021-04-10 17:39:54', 1, 0);
INSERT INTO `sys_log` VALUES (329, 1, '2021-04-10 17:39:56', '127.0.0.1', '/api/resources/role/124', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[124,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:55', 1, '2021-04-10 17:39:55', 1, 0);
INSERT INTO `sys_log` VALUES (330, 1, '2021-04-10 17:39:56', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 20, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:55', 1, '2021-04-10 17:39:55', 1, 0);
INSERT INTO `sys_log` VALUES (331, 1, '2021-04-10 17:39:56', '127.0.0.1', '/api/resources/role/128', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[128]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:39:56', 1, '2021-04-10 17:39:56', 1, 0);
INSERT INTO `sys_log` VALUES (332, 1, '2021-04-10 17:39:57', '127.0.0.1', '/api/resources/role/128', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[128,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:39:56', 1, '2021-04-10 17:39:56', 1, 0);
INSERT INTO `sys_log` VALUES (333, 1, '2021-04-10 17:39:57', '127.0.0.1', '/api/resources/page/6', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[6,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"GET\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:39:56', 1, '2021-04-10 17:39:56', 1, 0);
INSERT INTO `sys_log` VALUES (334, 1, '2021-04-10 17:40:00', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:00', 1, '2021-04-10 17:40:00', 1, 0);
INSERT INTO `sys_log` VALUES (335, 1, '2021-04-10 17:40:04', '127.0.0.1', '/api/resources/role/8', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[8]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:03', 1, '2021-04-10 17:40:03', 1, 0);
INSERT INTO `sys_log` VALUES (336, 1, '2021-04-10 17:40:06', '127.0.0.1', '/api/resources/role/8', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[8,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:05', 1, '2021-04-10 17:40:05', 1, 0);
INSERT INTO `sys_log` VALUES (337, 1, '2021-04-10 17:40:06', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:05', 1, '2021-04-10 17:40:05', 1, 0);
INSERT INTO `sys_log` VALUES (338, 1, '2021-04-10 17:40:08', '127.0.0.1', '/api/resources/role/18', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[18]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:08', 1, '2021-04-10 17:40:08', 1, 0);
INSERT INTO `sys_log` VALUES (339, 1, '2021-04-10 17:40:09', '127.0.0.1', '/api/resources/role/18', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[18,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:08', 1, '2021-04-10 17:40:08', 1, 0);
INSERT INTO `sys_log` VALUES (340, 1, '2021-04-10 17:40:09', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:08', 1, '2021-04-10 17:40:08', 1, 0);
INSERT INTO `sys_log` VALUES (341, 1, '2021-04-10 17:40:09', '127.0.0.1', '/api/resources/role/28', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[28]', 4, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:09', 1, '2021-04-10 17:40:09', 1, 0);
INSERT INTO `sys_log` VALUES (342, 1, '2021-04-10 17:40:11', '127.0.0.1', '/api/resources/role/28', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[28,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:10', 1, '2021-04-10 17:40:10', 1, 0);
INSERT INTO `sys_log` VALUES (343, 1, '2021-04-10 17:40:11', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:10', 1, '2021-04-10 17:40:10', 1, 0);
INSERT INTO `sys_log` VALUES (344, 1, '2021-04-10 17:40:26', '127.0.0.1', '/api/resources/role/47', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[47]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:26', 1, '2021-04-10 17:40:26', 1, 0);
INSERT INTO `sys_log` VALUES (345, 1, '2021-04-10 17:40:29', '127.0.0.1', '/api/resources/role/47', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[47,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:29', 1, '2021-04-10 17:40:29', 1, 0);
INSERT INTO `sys_log` VALUES (346, 1, '2021-04-10 17:40:29', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 14, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:29', 1, '2021-04-10 17:40:29', 1, 0);
INSERT INTO `sys_log` VALUES (347, 1, '2021-04-10 17:40:31', '127.0.0.1', '/api/resources/role/54', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[54]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:30', 1, '2021-04-10 17:40:30', 1, 0);
INSERT INTO `sys_log` VALUES (348, 1, '2021-04-10 17:40:32', '127.0.0.1', '/api/resources/role/54', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[54,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:31', 1, '2021-04-10 17:40:31', 1, 0);
INSERT INTO `sys_log` VALUES (349, 1, '2021-04-10 17:40:32', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:31', 1, '2021-04-10 17:40:31', 1, 0);
INSERT INTO `sys_log` VALUES (350, 1, '2021-04-10 17:40:33', '127.0.0.1', '/api/resources/role/56', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[56]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:33', 1, '2021-04-10 17:40:33', 1, 0);
INSERT INTO `sys_log` VALUES (351, 1, '2021-04-10 17:40:34', '127.0.0.1', '/api/resources/role/56', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[56,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:33', 1, '2021-04-10 17:40:33', 1, 0);
INSERT INTO `sys_log` VALUES (352, 1, '2021-04-10 17:40:34', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:33', 1, '2021-04-10 17:40:33', 1, 0);
INSERT INTO `sys_log` VALUES (353, 1, '2021-04-10 17:40:35', '127.0.0.1', '/api/resources/role/57', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[57]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:34', 1, '2021-04-10 17:40:34', 1, 0);
INSERT INTO `sys_log` VALUES (354, 1, '2021-04-10 17:40:36', '127.0.0.1', '/api/resources/role/57', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[57,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:35', 1, '2021-04-10 17:40:35', 1, 0);
INSERT INTO `sys_log` VALUES (355, 1, '2021-04-10 17:40:36', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 22, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:35', 1, '2021-04-10 17:40:35', 1, 0);
INSERT INTO `sys_log` VALUES (356, 1, '2021-04-10 17:40:37', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:37', 1, '2021-04-10 17:40:37', 1, 0);
INSERT INTO `sys_log` VALUES (357, 1, '2021-04-10 17:40:40', '127.0.0.1', '/api/resources/role/63', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[63]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:39', 1, '2021-04-10 17:40:39', 1, 0);
INSERT INTO `sys_log` VALUES (358, 1, '2021-04-10 17:40:41', '127.0.0.1', '/api/resources/role/63', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[63,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:40', 1, '2021-04-10 17:40:40', 1, 0);
INSERT INTO `sys_log` VALUES (359, 1, '2021-04-10 17:40:41', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:40', 1, '2021-04-10 17:40:40', 1, 0);
INSERT INTO `sys_log` VALUES (360, 1, '2021-04-10 17:40:41', '127.0.0.1', '/api/resources/role/70', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[70]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:41', 1, '2021-04-10 17:40:41', 1, 0);
INSERT INTO `sys_log` VALUES (361, 1, '2021-04-10 17:40:42', '127.0.0.1', '/api/resources/role/70', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[70,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:41', 1, '2021-04-10 17:40:41', 1, 0);
INSERT INTO `sys_log` VALUES (362, 1, '2021-04-10 17:40:42', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:42', 1, '2021-04-10 17:40:42', 1, 0);
INSERT INTO `sys_log` VALUES (363, 1, '2021-04-10 17:40:44', '127.0.0.1', '/api/resources/role/71', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[71]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:44', 1, '2021-04-10 17:40:44', 1, 0);
INSERT INTO `sys_log` VALUES (364, 1, '2021-04-10 17:40:45', '127.0.0.1', '/api/resources/role/71', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[71,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:44', 1, '2021-04-10 17:40:44', 1, 0);
INSERT INTO `sys_log` VALUES (365, 1, '2021-04-10 17:40:45', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:44', 1, '2021-04-10 17:40:44', 1, 0);
INSERT INTO `sys_log` VALUES (366, 1, '2021-04-10 17:40:45', '127.0.0.1', '/api/resources/role/75', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[75]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:45', 1, '2021-04-10 17:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (367, 1, '2021-04-10 17:40:46', '127.0.0.1', '/api/resources/role/75', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[75,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:45', 1, '2021-04-10 17:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (368, 1, '2021-04-10 17:40:46', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 14, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:45', 1, '2021-04-10 17:40:45', 1, 0);
INSERT INTO `sys_log` VALUES (369, 1, '2021-04-10 17:40:47', '127.0.0.1', '/api/resources/role/84', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[84]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:47', 1, '2021-04-10 17:40:47', 1, 0);
INSERT INTO `sys_log` VALUES (370, 1, '2021-04-10 17:40:48', '127.0.0.1', '/api/resources/role/84', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[84,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:48', 1, '2021-04-10 17:40:48', 1, 0);
INSERT INTO `sys_log` VALUES (371, 1, '2021-04-10 17:40:48', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:48', 1, '2021-04-10 17:40:48', 1, 0);
INSERT INTO `sys_log` VALUES (372, 1, '2021-04-10 17:40:58', '127.0.0.1', '/api/resources/role/119', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[119]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:40:57', 1, '2021-04-10 17:40:57', 1, 0);
INSERT INTO `sys_log` VALUES (373, 1, '2021-04-10 17:40:58', '127.0.0.1', '/api/resources/role/119', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[119,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:40:58', 1, '2021-04-10 17:40:58', 1, 0);
INSERT INTO `sys_log` VALUES (374, 1, '2021-04-10 17:40:58', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 21, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:40:58', 1, '2021-04-10 17:40:58', 1, 0);
INSERT INTO `sys_log` VALUES (375, 1, '2021-04-10 17:41:03', '127.0.0.1', '/api/resources/role/119', 'DELETE', 'class com.zero.auth.controller.ResourcesController.deleteResourcesRole', '[119,3]', 5, 1, '删除系统资源角色', NULL, NULL, '2021-04-10 17:41:02', 1, '2021-04-10 17:41:02', 1, 0);
INSERT INTO `sys_log` VALUES (376, 1, '2021-04-10 17:41:03', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:02', 1, '2021-04-10 17:41:02', 1, 0);
INSERT INTO `sys_log` VALUES (377, 1, '2021-04-10 17:41:03', '127.0.0.1', '/api/resources/role/125', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[125]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:41:03', 1, '2021-04-10 17:41:03', 1, 0);
INSERT INTO `sys_log` VALUES (378, 1, '2021-04-10 17:41:04', '127.0.0.1', '/api/resources/role/125', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[125,3]', 11, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:41:03', 1, '2021-04-10 17:41:03', 1, 0);
INSERT INTO `sys_log` VALUES (379, 1, '2021-04-10 17:41:04', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:04', 1, '2021-04-10 17:41:04', 1, 0);
INSERT INTO `sys_log` VALUES (380, 1, '2021-04-10 17:41:05', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 8, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:05', 1, '2021-04-10 17:41:05', 1, 0);
INSERT INTO `sys_log` VALUES (381, 1, '2021-04-10 17:41:07', '127.0.0.1', '/api/resources/role/129', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[129]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:41:06', 1, '2021-04-10 17:41:06', 1, 0);
INSERT INTO `sys_log` VALUES (382, 1, '2021-04-10 17:41:08', '127.0.0.1', '/api/resources/role/129', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[129,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:41:07', 1, '2021-04-10 17:41:07', 1, 0);
INSERT INTO `sys_log` VALUES (383, 1, '2021-04-10 17:41:08', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 7, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:07', 1, '2021-04-10 17:41:07', 1, 0);
INSERT INTO `sys_log` VALUES (384, 1, '2021-04-10 17:41:08', '127.0.0.1', '/api/resources/role/130', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[130]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:41:08', 1, '2021-04-10 17:41:08', 1, 0);
INSERT INTO `sys_log` VALUES (385, 1, '2021-04-10 17:41:09', '127.0.0.1', '/api/resources/role/130', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[130,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:41:09', 1, '2021-04-10 17:41:09', 1, 0);
INSERT INTO `sys_log` VALUES (386, 1, '2021-04-10 17:41:09', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 7, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:09', 1, '2021-04-10 17:41:09', 1, 0);
INSERT INTO `sys_log` VALUES (387, 1, '2021-04-10 17:41:11', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:11', 1, '2021-04-10 17:41:11', 1, 0);
INSERT INTO `sys_log` VALUES (388, 1, '2021-04-10 17:41:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"POST\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:19', 1, '2021-04-10 17:41:19', 1, 0);
INSERT INTO `sys_log` VALUES (389, 1, '2021-04-10 17:41:27', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:26', 1, '2021-04-10 17:41:26', 1, 0);
INSERT INTO `sys_log` VALUES (390, 1, '2021-04-10 17:41:49', '127.0.0.1', '/api/resources/role/9', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[9]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:41:48', 1, '2021-04-10 17:41:48', 1, 0);
INSERT INTO `sys_log` VALUES (391, 1, '2021-04-10 17:41:50', '127.0.0.1', '/api/resources/role/9', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[9,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:41:49', 1, '2021-04-10 17:41:49', 1, 0);
INSERT INTO `sys_log` VALUES (392, 1, '2021-04-10 17:41:50', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:49', 1, '2021-04-10 17:41:49', 1, 0);
INSERT INTO `sys_log` VALUES (393, 1, '2021-04-10 17:41:51', '127.0.0.1', '/api/resources/role/19', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[19]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:41:51', 1, '2021-04-10 17:41:51', 1, 0);
INSERT INTO `sys_log` VALUES (394, 1, '2021-04-10 17:41:52', '127.0.0.1', '/api/resources/role/19', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[19,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:41:51', 1, '2021-04-10 17:41:51', 1, 0);
INSERT INTO `sys_log` VALUES (395, 1, '2021-04-10 17:41:52', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:41:51', 1, '2021-04-10 17:41:51', 1, 0);
INSERT INTO `sys_log` VALUES (396, 1, '2021-04-10 17:42:04', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:03', 1, '2021-04-10 17:42:03', 1, 0);
INSERT INTO `sys_log` VALUES (397, 1, '2021-04-10 17:42:06', '127.0.0.1', '/api/resources/role/58', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[58]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:06', 1, '2021-04-10 17:42:06', 1, 0);
INSERT INTO `sys_log` VALUES (398, 1, '2021-04-10 17:42:07', '127.0.0.1', '/api/resources/role/58', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[58,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:06', 1, '2021-04-10 17:42:06', 1, 0);
INSERT INTO `sys_log` VALUES (399, 1, '2021-04-10 17:42:07', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:06', 1, '2021-04-10 17:42:06', 1, 0);
INSERT INTO `sys_log` VALUES (400, 1, '2021-04-10 17:42:13', '127.0.0.1', '/api/resources/role/72', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[72]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:12', 1, '2021-04-10 17:42:12', 1, 0);
INSERT INTO `sys_log` VALUES (401, 1, '2021-04-10 17:42:14', '127.0.0.1', '/api/resources/role/72', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[72,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:13', 1, '2021-04-10 17:42:13', 1, 0);
INSERT INTO `sys_log` VALUES (402, 1, '2021-04-10 17:42:14', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:13', 1, '2021-04-10 17:42:13', 1, 0);
INSERT INTO `sys_log` VALUES (403, 1, '2021-04-10 17:42:17', '127.0.0.1', '/api/resources/role/82', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[82]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:17', 1, '2021-04-10 17:42:17', 1, 0);
INSERT INTO `sys_log` VALUES (404, 1, '2021-04-10 17:42:18', '127.0.0.1', '/api/resources/role/82', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[82,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:17', 1, '2021-04-10 17:42:17', 1, 0);
INSERT INTO `sys_log` VALUES (405, 1, '2021-04-10 17:42:18', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:17', 1, '2021-04-10 17:42:17', 1, 0);
INSERT INTO `sys_log` VALUES (406, 1, '2021-04-10 17:42:23', '127.0.0.1', '/api/resources/role/85', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[85]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:22', 1, '2021-04-10 17:42:22', 1, 0);
INSERT INTO `sys_log` VALUES (407, 1, '2021-04-10 17:42:23', '127.0.0.1', '/api/resources/role/85', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[85,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:23', 1, '2021-04-10 17:42:23', 1, 0);
INSERT INTO `sys_log` VALUES (408, 1, '2021-04-10 17:42:23', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:23', 1, '2021-04-10 17:42:23', 1, 0);
INSERT INTO `sys_log` VALUES (409, 1, '2021-04-10 17:42:34', '127.0.0.1', '/api/resources/role/107', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[107]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:33', 1, '2021-04-10 17:42:33', 1, 0);
INSERT INTO `sys_log` VALUES (410, 1, '2021-04-10 17:42:34', '127.0.0.1', '/api/resources/role/107', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[107,3]', 12, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:34', 1, '2021-04-10 17:42:34', 1, 0);
INSERT INTO `sys_log` VALUES (411, 1, '2021-04-10 17:42:35', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:34', 1, '2021-04-10 17:42:34', 1, 0);
INSERT INTO `sys_log` VALUES (412, 1, '2021-04-10 17:42:45', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 12, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:44', 1, '2021-04-10 17:42:44', 1, 0);
INSERT INTO `sys_log` VALUES (413, 1, '2021-04-10 17:42:49', '127.0.0.1', '/api/resources/role/112', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[112]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:48', 1, '2021-04-10 17:42:48', 1, 0);
INSERT INTO `sys_log` VALUES (414, 1, '2021-04-10 17:42:50', '127.0.0.1', '/api/resources/role/112', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[112,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:49', 1, '2021-04-10 17:42:49', 1, 0);
INSERT INTO `sys_log` VALUES (415, 1, '2021-04-10 17:42:50', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 10, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:49', 1, '2021-04-10 17:42:49', 1, 0);
INSERT INTO `sys_log` VALUES (416, 1, '2021-04-10 17:42:54', '127.0.0.1', '/api/resources/role/121', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[121]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:54', 1, '2021-04-10 17:42:54', 1, 0);
INSERT INTO `sys_log` VALUES (417, 1, '2021-04-10 17:42:55', '127.0.0.1', '/api/resources/role/121', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[121]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:54', 1, '2021-04-10 17:42:54', 1, 0);
INSERT INTO `sys_log` VALUES (418, 1, '2021-04-10 17:42:56', '127.0.0.1', '/api/resources/role/121', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[121]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:55', 1, '2021-04-10 17:42:55', 1, 0);
INSERT INTO `sys_log` VALUES (419, 1, '2021-04-10 17:42:57', '127.0.0.1', '/api/resources/role/121', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[121,3]', 12, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:56', 1, '2021-04-10 17:42:56', 1, 0);
INSERT INTO `sys_log` VALUES (420, 1, '2021-04-10 17:42:57', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 13, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:56', 1, '2021-04-10 17:42:56', 1, 0);
INSERT INTO `sys_log` VALUES (421, 1, '2021-04-10 17:42:57', '127.0.0.1', '/api/resources/role/126', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[126]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:42:57', 1, '2021-04-10 17:42:57', 1, 0);
INSERT INTO `sys_log` VALUES (422, 1, '2021-04-10 17:42:58', '127.0.0.1', '/api/resources/role/126', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[126,3]', 9, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:42:58', 1, '2021-04-10 17:42:58', 1, 0);
INSERT INTO `sys_log` VALUES (423, 1, '2021-04-10 17:42:58', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 8, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:42:58', 1, '2021-04-10 17:42:58', 1, 0);
INSERT INTO `sys_log` VALUES (424, 1, '2021-04-10 17:43:03', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:03', 1, '2021-04-10 17:43:03', 1, 0);
INSERT INTO `sys_log` VALUES (425, 1, '2021-04-10 17:43:11', '127.0.0.1', '/api/resources/role/30', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[30]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:11', 1, '2021-04-10 17:43:11', 1, 0);
INSERT INTO `sys_log` VALUES (426, 1, '2021-04-10 17:43:12', '127.0.0.1', '/api/resources/role/30', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[30,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:11', 1, '2021-04-10 17:43:11', 1, 0);
INSERT INTO `sys_log` VALUES (427, 1, '2021-04-10 17:43:12', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:11', 1, '2021-04-10 17:43:11', 1, 0);
INSERT INTO `sys_log` VALUES (428, 1, '2021-04-10 17:43:14', '127.0.0.1', '/api/resources/role/20', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[20]', 1, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:13', 1, '2021-04-10 17:43:13', 1, 0);
INSERT INTO `sys_log` VALUES (429, 1, '2021-04-10 17:43:15', '127.0.0.1', '/api/resources/role/20', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[20,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:14', 1, '2021-04-10 17:43:14', 1, 0);
INSERT INTO `sys_log` VALUES (430, 1, '2021-04-10 17:43:15', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 46, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:14', 1, '2021-04-10 17:43:14', 1, 0);
INSERT INTO `sys_log` VALUES (431, 1, '2021-04-10 17:43:19', '127.0.0.1', '/api/resources/role/10', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[10]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:18', 1, '2021-04-10 17:43:18', 1, 0);
INSERT INTO `sys_log` VALUES (432, 1, '2021-04-10 17:43:19', '127.0.0.1', '/api/resources/role/10', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[10,3]', 7, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:19', 1, '2021-04-10 17:43:19', 1, 0);
INSERT INTO `sys_log` VALUES (433, 1, '2021-04-10 17:43:19', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:19', 1, '2021-04-10 17:43:19', 1, 0);
INSERT INTO `sys_log` VALUES (434, 1, '2021-04-10 17:43:25', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:24', 1, '2021-04-10 17:43:24', 1, 0);
INSERT INTO `sys_log` VALUES (435, 1, '2021-04-10 17:43:27', '127.0.0.1', '/api/resources/role/59', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[59]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:27', 1, '2021-04-10 17:43:27', 1, 0);
INSERT INTO `sys_log` VALUES (436, 1, '2021-04-10 17:43:31', '127.0.0.1', '/api/resources/role/73', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[73]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:31', 1, '2021-04-10 17:43:31', 1, 0);
INSERT INTO `sys_log` VALUES (437, 1, '2021-04-10 17:43:33', '127.0.0.1', '/api/resources/role/73', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[73,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:32', 1, '2021-04-10 17:43:32', 1, 0);
INSERT INTO `sys_log` VALUES (438, 1, '2021-04-10 17:43:33', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:32', 1, '2021-04-10 17:43:32', 1, 0);
INSERT INTO `sys_log` VALUES (439, 1, '2021-04-10 17:43:35', '127.0.0.1', '/api/resources/role/86', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[86]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:34', 1, '2021-04-10 17:43:34', 1, 0);
INSERT INTO `sys_log` VALUES (440, 1, '2021-04-10 17:43:35', '127.0.0.1', '/api/resources/role/86', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[86,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:35', 1, '2021-04-10 17:43:35', 1, 0);
INSERT INTO `sys_log` VALUES (441, 1, '2021-04-10 17:43:35', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:35', 1, '2021-04-10 17:43:35', 1, 0);
INSERT INTO `sys_log` VALUES (442, 1, '2021-04-10 17:43:41', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 9, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:40', 1, '2021-04-10 17:43:40', 1, 0);
INSERT INTO `sys_log` VALUES (443, 1, '2021-04-10 17:43:45', '127.0.0.1', '/api/resources/role/127', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[127]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:43:45', 1, '2021-04-10 17:43:45', 1, 0);
INSERT INTO `sys_log` VALUES (444, 1, '2021-04-10 17:43:46', '127.0.0.1', '/api/resources/role/127', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[127,3]', 8, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:43:46', 1, '2021-04-10 17:43:46', 1, 0);
INSERT INTO `sys_log` VALUES (445, 1, '2021-04-10 17:43:46', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 7, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:46', 1, '2021-04-10 17:43:46', 1, 0);
INSERT INTO `sys_log` VALUES (446, 1, '2021-04-10 17:43:52', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"\",\"roles\":null,\"queryRoleId\":null}]', 13, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:51', 1, '2021-04-10 17:43:51', 1, 0);
INSERT INTO `sys_log` VALUES (447, 1, '2021-04-10 17:43:59', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"recover\",\"regex\":null,\"description\":null,\"methodType\":\"\",\"roles\":null,\"queryRoleId\":null}]', 30, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:43:58', 1, '2021-04-10 17:43:58', 1, 0);
INSERT INTO `sys_log` VALUES (448, 1, '2021-04-10 17:44:06', '127.0.0.1', '/api/resources/page/2', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[2,10,{\"id\":null,\"uri\":\"recover\",\"regex\":null,\"description\":null,\"methodType\":\"\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:44:06', 1, '2021-04-10 17:44:06', 1, 0);
INSERT INTO `sys_log` VALUES (449, 1, '2021-04-10 17:44:09', '127.0.0.1', '/api/resources/page/3', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[3,10,{\"id\":null,\"uri\":\"recover\",\"regex\":null,\"description\":null,\"methodType\":\"\",\"roles\":null,\"queryRoleId\":null}]', 14, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:44:09', 1, '2021-04-10 17:44:09', 1, 0);
INSERT INTO `sys_log` VALUES (450, 1, '2021-04-10 17:44:22', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 21, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:44:22', 1, '2021-04-10 17:44:22', 1, 0);
INSERT INTO `sys_log` VALUES (451, 1, '2021-04-10 17:47:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 11, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:47:48', 1, '2021-04-10 17:47:48', 1, 0);
INSERT INTO `sys_log` VALUES (452, 1, '2021-04-10 17:47:49', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 11, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:47:48', 1, '2021-04-10 17:47:48', 1, 0);
INSERT INTO `sys_log` VALUES (453, 1, '2021-04-10 17:47:49', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 32, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:47:49', 1, '2021-04-10 17:47:49', 1, 0);
INSERT INTO `sys_log` VALUES (454, 1, '2021-04-10 17:47:56', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.auth.controller.UserController.page', '[3,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 8, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:47:56', 1, '2021-04-10 17:47:56', 1, 0);
INSERT INTO `sys_log` VALUES (455, 1, '2021-04-10 17:47:57', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 18, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:47:57', 1, '2021-04-10 17:47:57', 1, 0);
INSERT INTO `sys_log` VALUES (456, 1, '2021-04-10 17:48:04', '127.0.0.1', '/api/user/enabled/20', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[20,false]', 16, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:48:04', 1, '2021-04-10 17:48:04', 1, 0);
INSERT INTO `sys_log` VALUES (457, 1, '2021-04-10 17:48:42', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 20, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:48:41', 1, '2021-04-10 17:48:41', 1, 0);
INSERT INTO `sys_log` VALUES (458, 1, '2021-04-10 17:49:06', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 4, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:49:06', 1, '2021-04-10 17:49:06', 1, 0);
INSERT INTO `sys_log` VALUES (459, 1, '2021-04-10 17:49:09', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 35, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:08', 1, '2021-04-10 17:49:08', 1, 0);
INSERT INTO `sys_log` VALUES (460, 1, '2021-04-10 17:49:20', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 22, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:20', 1, '2021-04-10 17:49:20', 1, 0);
INSERT INTO `sys_log` VALUES (461, 1, '2021-04-10 17:49:33', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 26, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:33', 1, '2021-04-10 17:49:33', 1, 0);
INSERT INTO `sys_log` VALUES (462, 1, '2021-04-10 17:49:34', '127.0.0.1', '/api/user/page/3', 'GET', 'class com.zero.auth.controller.UserController.page', '[3,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 9, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:34', 1, '2021-04-10 17:49:34', 1, 0);
INSERT INTO `sys_log` VALUES (463, 1, '2021-04-10 17:49:35', '127.0.0.1', '/api/user/page/2', 'GET', 'class com.zero.auth.controller.UserController.page', '[2,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 20, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:35', 1, '2021-04-10 17:49:35', 1, 0);
INSERT INTO `sys_log` VALUES (464, 1, '2021-04-10 17:49:36', '127.0.0.1', '/api/user/enabled/20', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[20,true]', 7, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:49:36', 1, '2021-04-10 17:49:36', 1, 0);
INSERT INTO `sys_log` VALUES (465, 1, '2021-04-10 17:49:38', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 23, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:49:38', 1, '2021-04-10 17:49:38', 1, 0);
INSERT INTO `sys_log` VALUES (466, 1, '2021-04-10 17:50:35', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 20, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:50:35', 1, '2021-04-10 17:50:35', 1, 0);
INSERT INTO `sys_log` VALUES (467, 1, '2021-04-10 17:50:37', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,false]', 8, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:50:36', 1, '2021-04-10 17:50:36', 1, 0);
INSERT INTO `sys_log` VALUES (468, 1, '2021-04-10 17:50:37', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 27, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:50:36', 1, '2021-04-10 17:50:36', 1, 0);
INSERT INTO `sys_log` VALUES (469, 1, '2021-04-10 17:50:38', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,true]', 9, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:50:37', 1, '2021-04-10 17:50:37', 1, 0);
INSERT INTO `sys_log` VALUES (470, 1, '2021-04-10 17:50:38', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 28, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:50:37', 1, '2021-04-10 17:50:37', 1, 0);
INSERT INTO `sys_log` VALUES (471, 22, '2021-04-10 17:51:14', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 10, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:51:14', 22, '2021-04-10 17:51:14', 22, 0);
INSERT INTO `sys_log` VALUES (472, 22, '2021-04-10 17:51:22', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 25, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:21', 22, '2021-04-10 17:51:21', 22, 0);
INSERT INTO `sys_log` VALUES (473, 22, '2021-04-10 17:51:24', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,false]', 8, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:51:23', 22, '2021-04-10 17:51:23', 22, 0);
INSERT INTO `sys_log` VALUES (474, 22, '2021-04-10 17:51:24', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 28, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:23', 22, '2021-04-10 17:51:23', 22, 0);
INSERT INTO `sys_log` VALUES (475, 22, '2021-04-10 17:51:25', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 4, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:51:25', 22, '2021-04-10 17:51:25', 22, 0);
INSERT INTO `sys_log` VALUES (476, 22, '2021-04-10 17:51:28', '127.0.0.1', '/api/role/acquiescence', 'PUT', 'class com.zero.auth.controller.RoleController.updateAcquiescence', '[{\"id\":2,\"name\":null,\"description\":null,\"acquiescence\":true,\"authority\":\"ROLE_null\"}]', 14, 1, '通过主键设置或者取消默认角色', NULL, NULL, '2021-04-10 17:51:27', 22, '2021-04-10 17:51:27', 22, 0);
INSERT INTO `sys_log` VALUES (477, 22, '2021-04-10 17:51:28', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 6, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:51:27', 22, '2021-04-10 17:51:27', 22, 0);
INSERT INTO `sys_log` VALUES (478, 22, '2021-04-10 17:51:29', '127.0.0.1', '/api/role/acquiescence', 'PUT', 'class com.zero.auth.controller.RoleController.updateAcquiescence', '[{\"id\":2,\"name\":null,\"description\":null,\"acquiescence\":false,\"authority\":\"ROLE_null\"}]', 6, 1, '通过主键设置或者取消默认角色', NULL, NULL, '2021-04-10 17:51:28', 22, '2021-04-10 17:51:28', 22, 0);
INSERT INTO `sys_log` VALUES (479, 22, '2021-04-10 17:51:29', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 5, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:51:28', 22, '2021-04-10 17:51:28', 22, 0);
INSERT INTO `sys_log` VALUES (480, 22, '2021-04-10 17:51:30', '127.0.0.1', '/api/role/acquiescence', 'PUT', 'class com.zero.auth.controller.RoleController.updateAcquiescence', '[{\"id\":3,\"name\":null,\"description\":null,\"acquiescence\":true,\"authority\":\"ROLE_null\"}]', 11, 1, '通过主键设置或者取消默认角色', NULL, NULL, '2021-04-10 17:51:29', 22, '2021-04-10 17:51:29', 22, 0);
INSERT INTO `sys_log` VALUES (481, 22, '2021-04-10 17:51:30', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 4, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:51:29', 22, '2021-04-10 17:51:29', 22, 0);
INSERT INTO `sys_log` VALUES (482, 22, '2021-04-10 17:51:32', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 13, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:51:31', 22, '2021-04-10 17:51:31', 22, 0);
INSERT INTO `sys_log` VALUES (483, 1, '2021-04-10 17:51:49', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 39, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:49', 1, '2021-04-10 17:51:49', 1, 0);
INSERT INTO `sys_log` VALUES (484, 1, '2021-04-10 17:51:51', '127.0.0.1', '/api/user/enabled/9', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[9,false]', 6, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:51:50', 1, '2021-04-10 17:51:50', 1, 0);
INSERT INTO `sys_log` VALUES (485, 1, '2021-04-10 17:51:51', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 23, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:50', 1, '2021-04-10 17:51:50', 1, 0);
INSERT INTO `sys_log` VALUES (486, 1, '2021-04-10 17:51:53', '127.0.0.1', '/api/user/enabled/9', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[9,true]', 8, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:51:52', 1, '2021-04-10 17:51:52', 1, 0);
INSERT INTO `sys_log` VALUES (487, 1, '2021-04-10 17:51:53', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 24, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:52', 1, '2021-04-10 17:51:52', 1, 0);
INSERT INTO `sys_log` VALUES (488, 1, '2021-04-10 17:51:53', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,true]', 8, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:51:53', 1, '2021-04-10 17:51:53', 1, 0);
INSERT INTO `sys_log` VALUES (489, 1, '2021-04-10 17:51:53', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 33, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:51:53', 1, '2021-04-10 17:51:53', 1, 0);
INSERT INTO `sys_log` VALUES (490, 1, '2021-04-10 17:52:40', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,false]', 9, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:52:39', 1, '2021-04-10 17:52:39', 1, 0);
INSERT INTO `sys_log` VALUES (491, 1, '2021-04-10 17:52:40', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 134, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:52:39', 1, '2021-04-10 17:52:39', 1, 0);
INSERT INTO `sys_log` VALUES (492, 1, '2021-04-10 17:52:41', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,true]', 9, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:52:41', 1, '2021-04-10 17:52:41', 1, 0);
INSERT INTO `sys_log` VALUES (493, 1, '2021-04-10 17:52:41', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 27, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:52:41', 1, '2021-04-10 17:52:41', 1, 0);
INSERT INTO `sys_log` VALUES (494, 1, '2021-04-10 17:52:46', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,false]', 12, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:52:46', 1, '2021-04-10 17:52:46', 1, 0);
INSERT INTO `sys_log` VALUES (495, 1, '2021-04-10 17:52:46', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 42, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:52:46', 1, '2021-04-10 17:52:46', 1, 0);
INSERT INTO `sys_log` VALUES (496, 1, '2021-04-10 17:52:48', '127.0.0.1', '/api/user/enabled/10', 'PUT', 'class com.zero.auth.controller.UserController.enabled', '[10,true]', 20, 1, '启用或者禁用一个用户账号', NULL, NULL, '2021-04-10 17:52:48', 1, '2021-04-10 17:52:48', 1, 0);
INSERT INTO `sys_log` VALUES (497, 1, '2021-04-10 17:52:48', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 28, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:52:48', 1, '2021-04-10 17:52:48', 1, 0);
INSERT INTO `sys_log` VALUES (498, 1, '2021-04-10 17:52:52', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 60, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:52:52', 1, '2021-04-10 17:52:52', 1, 0);
INSERT INTO `sys_log` VALUES (499, 1, '2021-04-10 17:52:56', '127.0.0.1', '/api/menu/role/23', 'GET', 'class com.zero.sys.controller.MenuController.getMenuNotRoleList', '[23]', 2, 1, '获取该菜单未拥有的角色', NULL, NULL, '2021-04-10 17:52:55', 1, '2021-04-10 17:52:55', 1, 0);
INSERT INTO `sys_log` VALUES (500, 1, '2021-04-10 17:52:56', '127.0.0.1', '/api/menu/role/23', 'POST', 'class com.zero.sys.controller.MenuController.addUserRole', '[23,3]', 9, 1, '添加菜单角色', NULL, NULL, '2021-04-10 17:52:56', 1, '2021-04-10 17:52:56', 1, 0);
INSERT INTO `sys_log` VALUES (501, 1, '2021-04-10 17:52:56', '127.0.0.1', '/api/menu/page/1', 'GET', 'class com.zero.sys.controller.MenuController.page', '[1,10,{\"id\":null,\"path\":null,\"name\":null,\"component\":null,\"metaTitle\":null,\"metaIcon\":null,\"redirect\":null,\"sort\":null,\"hidden\":null,\"enabled\":null,\"parentId\":null,\"children\":null,\"roles\":null,\"queryRoleId\":null}]', 51, 1, '分页查询系统菜单表数据', NULL, NULL, '2021-04-10 17:52:56', 1, '2021-04-10 17:52:56', 1, 0);
INSERT INTO `sys_log` VALUES (502, 22, '2021-04-10 17:53:13', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 16, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:53:13', 22, '2021-04-10 17:53:13', 22, 0);
INSERT INTO `sys_log` VALUES (503, 22, '2021-04-10 17:53:14', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 17, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:53:13', 22, '2021-04-10 17:53:13', 22, 0);
INSERT INTO `sys_log` VALUES (504, 22, '2021-04-10 17:53:14', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 19, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:53:14', 22, '2021-04-10 17:53:14', 22, 0);
INSERT INTO `sys_log` VALUES (505, 22, '2021-04-10 17:53:18', '127.0.0.1', '/api/table/info/page/1', 'GET', 'class com.zero.code.generation.controller.TableInfoController.page', '[1,10,{\"id\":null,\"name\":null,\"comment\":null,\"entityName\":null,\"requestMapping\":null,\"javaPackageName\":null,\"javaCodePath\":null,\"vueCodePath\":null,\"vuePackage\":null,\"codeAuthor\":null,\"tableColumnList\":null}]', 5, 1, '分页查询系统数据库表信息数据', NULL, NULL, '2021-04-10 17:53:18', 22, '2021-04-10 17:53:18', 22, 0);
INSERT INTO `sys_log` VALUES (506, 22, '2021-04-10 17:53:27', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 7, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:53:27', 22, '2021-04-10 17:53:27', 22, 0);
INSERT INTO `sys_log` VALUES (507, 22, '2021-04-10 17:53:30', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.auth.controller.RoleController.recoverPage', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 6, 1, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-04-10 17:53:30', 22, '2021-04-10 17:53:30', 22, 0);
INSERT INTO `sys_log` VALUES (508, 22, '2021-04-10 17:53:39', '127.0.0.1', '/api/login/log/page/1', 'GET', 'class com.zero.auth.controller.LoginLogController.page', '[1,10,{\"id\":null,\"userId\":null,\"ip\":null,\"country\":null,\"region\":null,\"city\":null,\"isp\":null,\"loginTime\":null,\"tokenId\":null,\"logoutTime\":null,\"logout\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null,\"queryOnline\":null,\"queryAddress\":null}]', 18, 1, '分页查询系统账号登录日志表数据', NULL, NULL, '2021-04-10 17:53:38', 22, '2021-04-10 17:53:38', 22, 0);
INSERT INTO `sys_log` VALUES (509, 22, '2021-04-10 17:53:40', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', '[1,10,{\"id\":null,\"operationUserId\":null,\"accessTime\":null,\"ip\":null,\"uri\":null,\"methodType\":null,\"method\":null,\"requestArgs\":null,\"executionTime\":null,\"result\":null,\"description\":null,\"exceptionName\":null,\"exceptionMessage\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 22, 1, '分页查询系统操作日志表数据', NULL, NULL, '2021-04-10 17:53:40', 22, '2021-04-10 17:53:40', 22, 0);
INSERT INTO `sys_log` VALUES (510, 22, '2021-04-10 17:53:45', '127.0.0.1', '/api/log/10', 'DELETE', 'class com.zero.sys.controller.LogController.deleteById', '[10]', 8, 1, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-04-10 17:53:44', 22, '2021-04-10 17:53:44', 22, 0);
INSERT INTO `sys_log` VALUES (511, 22, '2021-04-10 17:53:45', '127.0.0.1', '/api/log/page/1', 'GET', 'class com.zero.sys.controller.LogController.page', '[1,10,{\"id\":null,\"operationUserId\":null,\"accessTime\":null,\"ip\":null,\"uri\":null,\"methodType\":null,\"method\":null,\"requestArgs\":null,\"executionTime\":null,\"result\":null,\"description\":null,\"exceptionName\":null,\"exceptionMessage\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 13, 1, '分页查询系统操作日志表数据', NULL, NULL, '2021-04-10 17:53:44', 22, '2021-04-10 17:53:44', 22, 0);
INSERT INTO `sys_log` VALUES (512, 22, '2021-04-10 17:53:48', '127.0.0.1', '/api/login/log/page/1', 'GET', 'class com.zero.auth.controller.LoginLogController.page', '[1,10,{\"id\":null,\"userId\":null,\"ip\":null,\"country\":null,\"region\":null,\"city\":null,\"isp\":null,\"loginTime\":null,\"tokenId\":null,\"logoutTime\":null,\"logout\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null,\"queryOnline\":null,\"queryAddress\":null}]', 9, 1, '分页查询系统账号登录日志表数据', NULL, NULL, '2021-04-10 17:53:47', 22, '2021-04-10 17:53:47', 22, 0);
INSERT INTO `sys_log` VALUES (513, 22, '2021-04-10 17:53:54', '127.0.0.1', '/api/login/log/3', 'DELETE', 'class com.zero.auth.controller.LoginLogController.deleteById', '[3]', 4, 1, '[通用方法]通过主键删除一条对应实体类的数据库记录', NULL, NULL, '2021-04-10 17:53:54', 22, '2021-04-10 17:53:54', 22, 0);
INSERT INTO `sys_log` VALUES (514, 22, '2021-04-10 17:53:54', '127.0.0.1', '/api/login/log/page/1', 'GET', 'class com.zero.auth.controller.LoginLogController.page', '[1,10,{\"id\":null,\"userId\":null,\"ip\":null,\"country\":null,\"region\":null,\"city\":null,\"isp\":null,\"loginTime\":null,\"tokenId\":null,\"logoutTime\":null,\"logout\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null,\"queryOnline\":null,\"queryAddress\":null}]', 6, 1, '分页查询系统账号登录日志表数据', NULL, NULL, '2021-04-10 17:53:54', 22, '2021-04-10 17:53:54', 22, 0);
INSERT INTO `sys_log` VALUES (515, 1, '2021-04-10 17:53:59', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":null,\"roles\":null,\"queryRoleId\":null}]', 18, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:53:58', 1, '2021-04-10 17:53:58', 1, 0);
INSERT INTO `sys_log` VALUES (516, 1, '2021-04-10 17:54:00', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":null,\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:54:00', 1, '2021-04-10 17:54:00', 1, 0);
INSERT INTO `sys_log` VALUES (517, 1, '2021-04-10 17:54:05', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"login\",\"regex\":null,\"description\":null,\"methodType\":\"DELETE\",\"roles\":null,\"queryRoleId\":null}]', 8, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:54:05', 1, '2021-04-10 17:54:05', 1, 0);
INSERT INTO `sys_log` VALUES (518, 22, '2021-04-10 17:54:17', '127.0.0.1', '/api/login/log/recover/page/1', 'GET', 'class com.zero.auth.controller.LoginLogController.recoverPage', '[1,10,{\"id\":null,\"userId\":null,\"ip\":null,\"country\":null,\"region\":null,\"city\":null,\"isp\":null,\"loginTime\":null,\"tokenId\":null,\"logoutTime\":null,\"logout\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null,\"queryOnline\":null,\"queryAddress\":null}]', 4, 1, '分页查询逻辑删除的系统账号登录日志表数据', NULL, NULL, '2021-04-10 17:54:17', 22, '2021-04-10 17:54:17', 22, 0);
INSERT INTO `sys_log` VALUES (519, 22, '2021-04-10 17:54:20', '127.0.0.1', '/api/login/log/recover/page/1', 'GET', 'class com.zero.auth.controller.LoginLogController.recoverPage', '[1,10,{\"id\":null,\"userId\":null,\"ip\":null,\"country\":null,\"region\":null,\"city\":null,\"isp\":null,\"loginTime\":null,\"tokenId\":null,\"logoutTime\":null,\"logout\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null,\"queryOnline\":null,\"queryAddress\":null}]', 7, 1, '分页查询逻辑删除的系统账号登录日志表数据', NULL, NULL, '2021-04-10 17:54:20', 22, '2021-04-10 17:54:20', 22, 0);
INSERT INTO `sys_log` VALUES (520, 22, '2021-04-10 17:54:22', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', '[1,10,{\"id\":null,\"operationUserId\":null,\"accessTime\":null,\"ip\":null,\"uri\":null,\"methodType\":null,\"method\":null,\"requestArgs\":null,\"executionTime\":null,\"result\":null,\"description\":null,\"exceptionName\":null,\"exceptionMessage\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 10, 1, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-04-10 17:54:22', 22, '2021-04-10 17:54:22', 22, 0);
INSERT INTO `sys_log` VALUES (521, 22, '2021-04-10 17:54:23', '127.0.0.1', '/api/log/recover/page/1', 'GET', 'class com.zero.sys.controller.LogController.recoverPage', '[1,10,{\"id\":null,\"operationUserId\":null,\"accessTime\":null,\"ip\":null,\"uri\":null,\"methodType\":null,\"method\":null,\"requestArgs\":null,\"executionTime\":null,\"result\":null,\"description\":null,\"exceptionName\":null,\"exceptionMessage\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 6, 1, '分页查询逻辑删除的系统操作日志表数据', NULL, NULL, '2021-04-10 17:54:23', 22, '2021-04-10 17:54:23', 22, 0);
INSERT INTO `sys_log` VALUES (522, 22, '2021-04-10 17:54:27', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.auth.controller.RoleController.recoverPage', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 2, 1, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-04-10 17:54:27', 22, '2021-04-10 17:54:27', 22, 0);
INSERT INTO `sys_log` VALUES (523, 22, '2021-04-10 17:54:29', '127.0.0.1', '/api/file/manage/recover/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.recoverPage', '[1,10,{\"id\":null,\"name\":null,\"type\":null,\"uri\":null,\"uploadTime\":null,\"uploadUserId\":null,\"parentId\":null,\"bakFiles\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 6, 1, '分页查询逻辑删除的文件资源管理表数据', NULL, NULL, '2021-04-10 17:54:29', 22, '2021-04-10 17:54:29', 22, 0);
INSERT INTO `sys_log` VALUES (524, 22, '2021-04-10 17:54:30', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 4, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:54:30', 22, '2021-04-10 17:54:30', 22, 0);
INSERT INTO `sys_log` VALUES (525, 22, '2021-04-10 17:54:34', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 5, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:54:34', 22, '2021-04-10 17:54:34', 22, 0);
INSERT INTO `sys_log` VALUES (526, 22, '2021-04-10 17:54:38', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 18, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:54:38', 22, '2021-04-10 17:54:38', 22, 0);
INSERT INTO `sys_log` VALUES (527, 1, '2021-04-10 17:54:46', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"user\",\"regex\":null,\"description\":null,\"methodType\":\"\",\"roles\":null,\"queryRoleId\":null}]', 16, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:54:46', 1, '2021-04-10 17:54:46', 1, 0);
INSERT INTO `sys_log` VALUES (528, 1, '2021-04-10 17:54:48', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"user\",\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 17, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:54:47', 1, '2021-04-10 17:54:47', 1, 0);
INSERT INTO `sys_log` VALUES (529, 1, '2021-04-10 17:54:54', '127.0.0.1', '/api/resources/role/52', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[52]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:54:53', 1, '2021-04-10 17:54:53', 1, 0);
INSERT INTO `sys_log` VALUES (530, 1, '2021-04-10 17:54:54', '127.0.0.1', '/api/resources/role/52', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[52,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:54:54', 1, '2021-04-10 17:54:54', 1, 0);
INSERT INTO `sys_log` VALUES (531, 1, '2021-04-10 17:54:55', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"user\",\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 12, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:54:54', 1, '2021-04-10 17:54:54', 1, 0);
INSERT INTO `sys_log` VALUES (532, 22, '2021-04-10 17:54:58', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 7, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:54:58', 22, '2021-04-10 17:54:58', 22, 0);
INSERT INTO `sys_log` VALUES (533, 22, '2021-04-10 17:54:59', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 7, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:54:58', 22, '2021-04-10 17:54:58', 22, 0);
INSERT INTO `sys_log` VALUES (534, 22, '2021-04-10 17:55:01', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 15, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:55:01', 22, '2021-04-10 17:55:01', 22, 0);
INSERT INTO `sys_log` VALUES (535, 22, '2021-04-10 17:55:02', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 7, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:55:01', 22, '2021-04-10 17:55:01', 22, 0);
INSERT INTO `sys_log` VALUES (536, 22, '2021-04-10 17:55:02', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 7, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:55:02', 22, '2021-04-10 17:55:02', 22, 0);
INSERT INTO `sys_log` VALUES (537, 22, '2021-04-10 17:55:05', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 5, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:55:05', 22, '2021-04-10 17:55:05', 22, 0);
INSERT INTO `sys_log` VALUES (538, 1, '2021-04-10 17:55:17', '127.0.0.1', '/api/resources/role/52', 'DELETE', 'class com.zero.auth.controller.ResourcesController.deleteResourcesRole', '[52,3]', 5, 1, '删除系统资源角色', NULL, NULL, '2021-04-10 17:55:17', 1, '2021-04-10 17:55:17', 1, 0);
INSERT INTO `sys_log` VALUES (539, 1, '2021-04-10 17:55:18', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"user\",\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:55:17', 1, '2021-04-10 17:55:17', 1, 0);
INSERT INTO `sys_log` VALUES (540, 1, '2021-04-10 17:55:23', '127.0.0.1', '/api/resources/role/117', 'GET', 'class com.zero.auth.controller.ResourcesController.getResourcesNotRoleList', '[117]', 2, 1, '获取未拥有该系统资源的角色', NULL, NULL, '2021-04-10 17:55:22', 1, '2021-04-10 17:55:22', 1, 0);
INSERT INTO `sys_log` VALUES (541, 1, '2021-04-10 17:55:23', '127.0.0.1', '/api/resources/role/117', 'POST', 'class com.zero.auth.controller.ResourcesController.addResourcesRole', '[117,3]', 10, 1, '添加系统资源角色', NULL, NULL, '2021-04-10 17:55:23', 1, '2021-04-10 17:55:23', 1, 0);
INSERT INTO `sys_log` VALUES (542, 1, '2021-04-10 17:55:23', '127.0.0.1', '/api/resources/page/1', 'GET', 'class com.zero.auth.controller.ResourcesController.page', '[1,10,{\"id\":null,\"uri\":\"user\",\"regex\":null,\"description\":null,\"methodType\":\"PUT\",\"roles\":null,\"queryRoleId\":null}]', 15, 1, '分页查询系统资源数据', NULL, NULL, '2021-04-10 17:55:23', 1, '2021-04-10 17:55:23', 1, 0);
INSERT INTO `sys_log` VALUES (543, 22, '2021-04-10 17:55:25', '127.0.0.1', '/api/user/recover/23', 'PUT', 'class com.zero.auth.controller.UserController.recover', '[23]', 5, 1, '通过主键恢复逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:55:25', 22, '2021-04-10 17:55:25', 22, 0);
INSERT INTO `sys_log` VALUES (544, 22, '2021-04-10 17:55:25', '127.0.0.1', '/api/user/recover/page/1', 'GET', 'class com.zero.auth.controller.UserController.recoverPage', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 2, 1, '分页查询逻辑删除的用户数据', NULL, NULL, '2021-04-10 17:55:25', 22, '2021-04-10 17:55:25', 22, 0);
INSERT INTO `sys_log` VALUES (545, 22, '2021-04-10 17:55:27', '127.0.0.1', '/api/role/recover/page/1', 'GET', 'class com.zero.auth.controller.RoleController.recoverPage', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 4, 1, '分页查询逻辑删除的系统角色表数据', NULL, NULL, '2021-04-10 17:55:26', 22, '2021-04-10 17:55:26', 22, 0);
INSERT INTO `sys_log` VALUES (546, 22, '2021-04-10 17:55:30', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 5, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:55:29', 22, '2021-04-10 17:55:29', 22, 0);
INSERT INTO `sys_log` VALUES (547, 22, '2021-04-10 17:55:31', '127.0.0.1', '/api/role/acquiescence', 'PUT', 'class com.zero.auth.controller.RoleController.updateAcquiescence', '[{\"id\":2,\"name\":null,\"description\":null,\"acquiescence\":true,\"authority\":\"ROLE_null\"}]', 12, 1, '通过主键设置或者取消默认角色', NULL, NULL, '2021-04-10 17:55:30', 22, '2021-04-10 17:55:30', 22, 0);
INSERT INTO `sys_log` VALUES (548, 22, '2021-04-10 17:55:31', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 3, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:55:30', 22, '2021-04-10 17:55:30', 22, 0);
INSERT INTO `sys_log` VALUES (549, 22, '2021-04-10 17:55:32', '127.0.0.1', '/api/role/acquiescence', 'PUT', 'class com.zero.auth.controller.RoleController.updateAcquiescence', '[{\"id\":3,\"name\":null,\"description\":null,\"acquiescence\":true,\"authority\":\"ROLE_null\"}]', 10, 1, '通过主键设置或者取消默认角色', NULL, NULL, '2021-04-10 17:55:32', 22, '2021-04-10 17:55:32', 22, 0);
INSERT INTO `sys_log` VALUES (550, 22, '2021-04-10 17:55:32', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 6, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:55:32', 22, '2021-04-10 17:55:32', 22, 0);
INSERT INTO `sys_log` VALUES (551, 22, '2021-04-10 17:55:34', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', '[1,10,{\"id\":null,\"name\":null,\"type\":null,\"uri\":null,\"uploadTime\":null,\"uploadUserId\":null,\"parentId\":null,\"bakFiles\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 4, 1, '分页查询文件资源管理表数据', NULL, NULL, '2021-04-10 17:55:33', 22, '2021-04-10 17:55:33', 22, 0);
INSERT INTO `sys_log` VALUES (552, 22, '2021-04-10 17:55:43', '127.0.0.1', '/api/user/info', 'GET', 'class com.zero.sys.controller.UserInfoController.info', NULL, 24, 1, '查询当前登录用户的信息数据', NULL, NULL, '2021-04-10 17:55:42', 22, '2021-04-10 17:55:42', 22, 0);
INSERT INTO `sys_log` VALUES (553, 22, '2021-04-10 17:56:09', '127.0.0.1', '/api/user/info/avatar', 'POST', 'class com.zero.sys.controller.UserInfoController.avatar', NULL, 1409, 1, '上传用户头像', NULL, NULL, '2021-04-10 17:56:09', 22, '2021-04-10 17:56:09', 22, 0);
INSERT INTO `sys_log` VALUES (554, 22, '2021-04-10 17:56:44', '127.0.0.1', '/api/user/page/1', 'GET', 'class com.zero.auth.controller.UserController.page', '[1,10,{\"id\":null,\"username\":null,\"password\":null,\"enabled\":null,\"locked\":null,\"accountExpire\":null,\"passwordExpire\":null,\"type\":null,\"roles\":null,\"userInfo\":null,\"onlineLoginLogs\":null,\"queryRoleId\":null}]', 30, 1, '分页查询用户数据', NULL, NULL, '2021-04-10 17:56:43', 22, '2021-04-10 17:56:43', 22, 0);
INSERT INTO `sys_log` VALUES (555, 22, '2021-04-10 17:56:45', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 4, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:56:45', 22, '2021-04-10 17:56:45', 22, 0);
INSERT INTO `sys_log` VALUES (556, 1, '2021-04-10 17:56:52', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', '[1,10,{\"id\":null,\"name\":null,\"type\":null,\"uri\":null,\"uploadTime\":null,\"uploadUserId\":null,\"parentId\":null,\"bakFiles\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 10, 1, '分页查询文件资源管理表数据', NULL, NULL, '2021-04-10 17:56:52', 1, '2021-04-10 17:56:52', 1, 0);
INSERT INTO `sys_log` VALUES (557, 22, '2021-04-10 17:57:01', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 17, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:57:00', 22, '2021-04-10 17:57:00', 22, 0);
INSERT INTO `sys_log` VALUES (558, 22, '2021-04-10 17:57:01', '127.0.0.1', '/api/menu/routes', 'GET', 'class com.zero.sys.controller.MenuController.routes', NULL, 13, 1, '[动态路由]获取所有启用的系统菜单', NULL, NULL, '2021-04-10 17:57:00', 22, '2021-04-10 17:57:00', 22, 0);
INSERT INTO `sys_log` VALUES (559, 22, '2021-04-10 17:57:01', '127.0.0.1', '/api/role/page/1', 'GET', 'class com.zero.auth.controller.RoleController.page', '[1,10,{\"id\":null,\"name\":null,\"description\":null,\"acquiescence\":null,\"authority\":\"ROLE_null\"}]', 6, 1, '分页查询角色数据', NULL, NULL, '2021-04-10 17:57:01', 22, '2021-04-10 17:57:01', 22, 0);
INSERT INTO `sys_log` VALUES (560, 22, '2021-04-10 17:57:03', '127.0.0.1', '/api/file/manage/page/1', 'GET', 'class com.zero.upload.controller.FileManageController.page', '[1,10,{\"id\":null,\"name\":null,\"type\":null,\"uri\":null,\"uploadTime\":null,\"uploadUserId\":null,\"parentId\":null,\"bakFiles\":null,\"user\":null,\"queryUsername\":null,\"queryStartDate\":null,\"queryEndDate\":null}]', 7, 1, '分页查询文件资源管理表数据', NULL, NULL, '2021-04-10 17:57:02', 22, '2021-04-10 17:57:02', 22, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单路由路径',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单模块名称',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单模块路径',
  `meta_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `meta_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单图标',
  `redirect` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级菜单定向路由路径',
  `sort` int(11) NOT NULL COMMENT '菜单排序',
  `hidden` tinyint(1) NOT NULL COMMENT '菜单是否隐藏，0(false)为正常，1(true)为隐藏',
  `enabled` tinyint(1) NOT NULL COMMENT '菜单是否启用，0(false)为禁用，1(true)为启用',
  `parent_id` int(11) NOT NULL COMMENT '父级菜单主键，如果为顶级菜单，值为0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '/data', 'Data', 'Layout', '数据管理', 'el-icon-s-help', '/data/user', 1, 0, 1, 0, '2020-11-15 23:25:21', 0, '2020-12-01 20:59:37', 1, 0);
INSERT INTO `sys_menu` VALUES (2, 'user', 'User', 'data/user/index', '用户管理', 'el-icon-user', NULL, 1, 0, 1, 1, '2020-11-15 23:28:06', 0, '2020-12-29 22:10:21', 1, 0);
INSERT INTO `sys_menu` VALUES (3, 'role', 'Role', 'data/role/index', '角色管理', 'el-icon-discount', NULL, 2, 0, 1, 1, '2020-11-17 23:32:23', 0, '2020-11-22 23:00:48', 1, 0);
INSERT INTO `sys_menu` VALUES (4, 'resources', 'Resources', 'data/resources/index', '资源管理', 'el-icon-star-on', NULL, 3, 0, 1, 1, '2020-11-17 23:53:50', 0, '2020-11-22 23:06:12', 1, 0);
INSERT INTO `sys_menu` VALUES (5, 'menu', 'Menu', 'data/menu/index', '菜单管理', 'el-icon-guide', NULL, 4, 0, 1, 1, '2020-11-17 23:54:27', 0, '2020-11-22 23:00:49', 1, 0);
INSERT INTO `sys_menu` VALUES (6, 'file-manage', 'FileManage', 'data/file-manage/index', '文件管理', 'el-icon-folder-opened', NULL, 5, 0, 1, 1, '2021-01-30 18:40:45', 1, '2021-01-31 22:33:51', 1, 0);
INSERT INTO `sys_menu` VALUES (7, '/system', 'System', 'Layout', '系统监控', 'el-icon-view', '/system/server', 2, 0, 1, 0, '2020-11-17 23:56:14', 0, '2020-12-01 20:59:55', 1, 0);
INSERT INTO `sys_menu` VALUES (8, 'server', 'Server', 'system/server/index', '服务器监控', 'el-icon-monitor', NULL, 1, 0, 1, 7, '2020-11-17 23:57:27', 0, '2020-11-22 23:00:45', 1, 0);
INSERT INTO `sys_menu` VALUES (9, 'login-log', 'LoginLog', 'system/login-log/index', '登入日志', 'el-icon-sunny', NULL, 2, 0, 1, 7, '2021-02-18 07:46:54', 0, '2021-02-18 09:11:27', 1, 0);
INSERT INTO `sys_menu` VALUES (10, 'log', 'Log', 'system/log/index', '日志管理', 'el-icon-tickets', NULL, 3, 0, 1, 7, '2020-11-17 23:58:00', 0, '2021-02-18 07:46:21', 1, 0);
INSERT INTO `sys_menu` VALUES (11, '/setting', 'Setting', 'Layout', '系统设置', 'el-icon-setting', '/setting/password', 3, 0, 1, 0, '2020-12-28 20:53:06', 1, '2020-12-28 20:53:49', 1, 0);
INSERT INTO `sys_menu` VALUES (12, 'password', 'Password', 'setting/password/index', '密码设置', 'el-icon-more-outline', NULL, 1, 0, 1, 11, '2020-12-28 21:01:44', 1, '2020-12-28 21:02:45', 1, 0);
INSERT INTO `sys_menu` VALUES (13, 'user-info', 'UserInfo', 'setting/user-info/index', '用户信息', 'el-icon-edit', NULL, 2, 0, 1, 11, '2021-01-04 19:51:21', 1, '2021-01-04 20:34:57', 1, 0);
INSERT INTO `sys_menu` VALUES (14, '/recover', 'Recover', 'Layout', '回收站', 'el-icon-delete-solid', '/recover/user', 4, 0, 1, 0, '2020-11-29 22:13:02', 1, '2020-12-28 20:50:58', 1, 0);
INSERT INTO `sys_menu` VALUES (15, 'user', 'User', 'recover/user/index', '用户数据', 'el-icon-user-solid', NULL, 1, 0, 1, 14, '2020-11-29 22:16:53', 1, '2020-11-29 22:17:57', 1, 0);
INSERT INTO `sys_menu` VALUES (16, 'role', 'Role', 'recover/role/index', '角色数据', 'el-icon-price-tag', NULL, 2, 0, 1, 14, '2020-11-30 22:32:29', 1, '2020-11-30 22:33:42', 1, 0);
INSERT INTO `sys_menu` VALUES (17, 'resources', 'Resources', 'recover/resources/index', '资源数据', 'el-icon-star-off', NULL, 3, 0, 1, 14, '2020-12-01 19:46:53', 1, '2020-12-01 19:47:54', 1, 0);
INSERT INTO `sys_menu` VALUES (18, 'menu', 'Menu', 'recover/menu/index', '菜单数据', 'el-icon-guide', NULL, 4, 0, 1, 14, '2020-12-01 20:39:18', 1, '2020-12-01 20:40:04', 1, 0);
INSERT INTO `sys_menu` VALUES (19, 'file-manage', 'FileManage', 'recover/file-manage/index', '文件数据', 'el-icon-folder', NULL, 5, 0, 1, 14, '2021-02-02 22:32:12', 1, '2021-02-18 08:59:23', 1, 0);
INSERT INTO `sys_menu` VALUES (20, 'log', 'Log', 'recover/log/index', '日志数据', 'el-icon-tickets', NULL, 7, 0, 1, 14, '2020-12-01 22:36:03', 1, '2021-02-18 08:59:05', 1, 0);
INSERT INTO `sys_menu` VALUES (21, 'login-log', 'LoginLog', 'recover/login-log/index', '登入数据', 'el-icon-sunrise-1', NULL, 6, 0, 1, 14, '2021-02-18 09:01:25', 0, '2021-02-18 09:21:15', 1, 0);
INSERT INTO `sys_menu` VALUES (22, 'code-generation', 'CodeGeneration', 'recover/code-generation/index', '数据库表数据', 'el-icon-refresh-right', NULL, 8, 0, 1, 14, '2020-12-01 22:45:52', 1, '2021-02-18 08:59:31', 1, 0);
INSERT INTO `sys_menu` VALUES (23, '/development', 'Development', 'Layout', '系统开发', 'el-icon-monitor', '/development/code-generation', 5, 0, 1, 0, '2020-11-17 23:59:02', 0, '2021-03-28 14:35:50', 1, 0);
INSERT INTO `sys_menu` VALUES (24, 'code-generation', 'CodeGeneration', 'development/code-generation/index', '代码生成', 'el-icon-refresh-right', NULL, 1, 0, 1, 23, '2020-11-17 23:59:58', 0, '2021-03-28 15:16:15', 1, 0);
INSERT INTO `sys_menu` VALUES (25, 'code-setting', 'CodeSetting', 'development/code-setting/index', '代码设置', 'el-icon-tickets', NULL, 2, 1, 1, 23, '2021-03-28 15:40:24', 1, '2021-03-28 15:40:24', 1, 0);
INSERT INTO `sys_menu` VALUES (26, 'http://127.0.0.1:10000/api/swagger-ui/index.html', 'Swagger2', '', '项目文档', 'el-icon-notebook-2', NULL, 3, 0, 1, 23, '2020-11-18 00:03:34', 0, '2021-03-28 15:40:45', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu_role
-- ----------------------------
INSERT INTO `sys_menu_role` VALUES (1, 1, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (2, 2, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (3, 3, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (4, 4, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (5, 5, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (6, 6, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (7, 7, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (8, 8, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (9, 9, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (10, 10, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (11, 11, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (12, 12, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (13, 13, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (14, 14, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (15, 15, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (16, 16, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (17, 17, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (18, 18, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (19, 19, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (20, 20, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (21, 21, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (22, 22, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (23, 23, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (24, 24, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (25, 25, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (26, 26, 1, '2021-04-10 17:33:52', 0, '2021-04-10 17:33:52', 0, 0);
INSERT INTO `sys_menu_role` VALUES (27, 1, 3, '2021-04-10 17:36:40', 1, '2021-04-10 17:36:40', 1, 0);
INSERT INTO `sys_menu_role` VALUES (28, 2, 3, '2021-04-10 17:36:41', 1, '2021-04-10 17:36:41', 1, 0);
INSERT INTO `sys_menu_role` VALUES (29, 3, 3, '2021-04-10 17:36:43', 1, '2021-04-10 17:36:43', 1, 0);
INSERT INTO `sys_menu_role` VALUES (30, 4, 3, '2021-04-10 17:36:45', 1, '2021-04-10 17:36:45', 1, 0);
INSERT INTO `sys_menu_role` VALUES (31, 5, 3, '2021-04-10 17:36:47', 1, '2021-04-10 17:36:47', 1, 0);
INSERT INTO `sys_menu_role` VALUES (32, 6, 3, '2021-04-10 17:36:48', 1, '2021-04-10 17:36:48', 1, 0);
INSERT INTO `sys_menu_role` VALUES (33, 7, 3, '2021-04-10 17:36:53', 1, '2021-04-10 17:36:53', 1, 0);
INSERT INTO `sys_menu_role` VALUES (34, 8, 3, '2021-04-10 17:36:55', 1, '2021-04-10 17:36:55', 1, 0);
INSERT INTO `sys_menu_role` VALUES (35, 9, 3, '2021-04-10 17:36:57', 1, '2021-04-10 17:36:57', 1, 0);
INSERT INTO `sys_menu_role` VALUES (36, 10, 3, '2021-04-10 17:37:00', 1, '2021-04-10 17:37:00', 1, 0);
INSERT INTO `sys_menu_role` VALUES (37, 11, 3, '2021-04-10 17:37:05', 1, '2021-04-10 17:37:05', 1, 0);
INSERT INTO `sys_menu_role` VALUES (38, 12, 3, '2021-04-10 17:37:06', 1, '2021-04-10 17:37:06', 1, 0);
INSERT INTO `sys_menu_role` VALUES (39, 13, 3, '2021-04-10 17:37:08', 1, '2021-04-10 17:37:08', 1, 0);
INSERT INTO `sys_menu_role` VALUES (40, 24, 3, '2021-04-10 17:37:12', 1, '2021-04-10 17:37:12', 1, 0);
INSERT INTO `sys_menu_role` VALUES (41, 25, 3, '2021-04-10 17:37:13', 1, '2021-04-10 17:37:13', 1, 0);
INSERT INTO `sys_menu_role` VALUES (42, 26, 3, '2021-04-10 17:37:15', 1, '2021-04-10 17:37:15', 1, 0);
INSERT INTO `sys_menu_role` VALUES (43, 14, 3, '2021-04-10 17:37:19', 1, '2021-04-10 17:37:19', 1, 0);
INSERT INTO `sys_menu_role` VALUES (44, 15, 3, '2021-04-10 17:37:20', 1, '2021-04-10 17:37:20', 1, 0);
INSERT INTO `sys_menu_role` VALUES (45, 16, 3, '2021-04-10 17:37:24', 1, '2021-04-10 17:37:24', 1, 0);
INSERT INTO `sys_menu_role` VALUES (46, 19, 3, '2021-04-10 17:37:31', 1, '2021-04-10 17:37:31', 1, 0);
INSERT INTO `sys_menu_role` VALUES (47, 21, 3, '2021-04-10 17:37:34', 1, '2021-04-10 17:37:34', 1, 0);
INSERT INTO `sys_menu_role` VALUES (48, 20, 3, '2021-04-10 17:37:37', 1, '2021-04-10 17:37:37', 1, 0);
INSERT INTO `sys_menu_role` VALUES (49, 23, 3, '2021-04-10 17:52:56', 1, '2021-04-10 17:52:56', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件资源管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of upload_file_manage
-- ----------------------------
INSERT INTO `upload_file_manage` VALUES (1, '雅典娜-冰冠公主.jpg', 'IMAGE', 'http://127.0.0.1:10000/api/image/2021/4/10/c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', 'G:\\temp\\image\\2021\\4\\10\\c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', '2021-04-10 17:56:10', 22, 0, '2021-04-10 17:56:09', 22, '2021-04-10 17:56:09', 22, 0);

SET FOREIGN_KEY_CHECKS = 1;
