/*
 Navicat Premium Data Transfer

 Source Server         : aliyun-mysql
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 47.114.99.214:3306
 Source Schema         : zero-admin

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 27/06/2021 16:45:43
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
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统账号登录日志表' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统资源表' ROW_FORMAT = Compact;

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
INSERT INTO `auth_resources` VALUES (131, '/index/panel/group', '^/index/panel/group$', '获取系统首页的展示数据', 'GET', '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources` VALUES (132, '/index/weather', '^/index/weather$', '获取当前城市的天气预报信息', 'GET', '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources` VALUES (133, '/index/login/map', '^/index/login/map$', '获取系统首页的用户登录地图数据', 'GET', '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources` VALUES (134, '/config/const/page/{currentPage}', '^/config/const/page/[0-9]+$', '分页查询系统配置常量表数据', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (135, '/config/const/recover/page/{currentPage}', '^/config/const/recover/page/[0-9]+$', '分页查询逻辑删除的系统配置常量表数据', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (136, '/config/const/recover/{id}', '^/config/const/recover/[0-9]+$', '通过主键恢复逻辑删除的系统配置常量表数据', 'PUT', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (137, '/config/const/recover/{id}', '^/config/const/recover/[0-9]+$', '通过主键彻底删除一条系统配置常量表数据', 'DELETE', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (138, '/config/const/export/excel', '^/config/const/export/excel$', '导出系统配置常量表数据的Excel文件', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (139, '/config/const/list/key', '^/config/const/list/key$', '查询所有的常量键值数据', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (140, '/config/const/list', '^/config/const/list$', '查询所有的系统配置常量表数据', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (141, '/config/const/key', '^/config/const/key$', '查询常量键值配置数据', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (142, '/config/const', '^/config/const$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (143, '/config/const/{id}', '^/config/const/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (144, '/config/const/{id}', '^/config/const/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (145, '/config/const', '^/config/const$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources` VALUES (146, '/user/config/page/{currentPage}', '^/user/config/page/[0-9]+$', '分页查询系统用户配置表数据', 'GET', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (147, '/user/config/recover/page/{currentPage}', '^/user/config/recover/page/[0-9]+$', '分页查询逻辑删除的系统用户配置表数据', 'GET', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (148, '/user/config/recover/{id}', '^/user/config/recover/[0-9]+$', '通过主键恢复逻辑删除的系统用户配置表数据', 'PUT', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (149, '/user/config/recover/{id}', '^/user/config/recover/[0-9]+$', '通过主键彻底删除一条系统用户配置表数据', 'DELETE', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (150, '/user/config/export/excel', '^/user/config/export/excel$', '导出系统用户配置表数据的Excel文件', 'GET', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (151, '/user/config/list', '^/user/config/list$', '查询所有的系统用户配置表数据', 'GET', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (152, '/user/config/key', '^/user/config/key$', '更新用户配置数据', 'PUT', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (153, '/user/config', '^/user/config$', '[通用方法]更新一条对应实体类的数据库记录', 'PUT', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (154, '/user/config/{id}', '^/user/config/[0-9]+$', '[通用方法]通过主键获取一条对应实体类的数据库记录', 'GET', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (155, '/user/config/{id}', '^/user/config/[0-9]+$', '[通用方法]通过主键删除一条对应实体类的数据库记录', 'DELETE', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources` VALUES (156, '/user/config', '^/user/config$', '[通用方法]插入一条对应实体类的数据库记录', 'POST', '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源角色关系表' ROW_FORMAT = Compact;

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
INSERT INTO `auth_resources_role` VALUES (226, 131, 1, '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources_role` VALUES (227, 132, 1, '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources_role` VALUES (228, 133, 1, '2021-04-29 00:03:42', 0, '2021-04-29 00:03:42', 0, 0);
INSERT INTO `auth_resources_role` VALUES (229, 131, 3, '2021-04-29 09:23:27', 1, '2021-04-29 09:23:27', 1, 0);
INSERT INTO `auth_resources_role` VALUES (230, 132, 3, '2021-04-29 09:23:28', 1, '2021-04-29 09:23:28', 1, 0);
INSERT INTO `auth_resources_role` VALUES (231, 133, 3, '2021-04-29 09:23:30', 1, '2021-04-29 09:23:30', 1, 0);
INSERT INTO `auth_resources_role` VALUES (232, 134, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (233, 135, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (234, 136, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (235, 137, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (236, 138, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (237, 139, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (238, 140, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (239, 141, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (240, 142, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (241, 143, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (242, 144, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (243, 145, 1, '2021-06-27 11:33:23', 0, '2021-06-27 11:33:23', 0, 0);
INSERT INTO `auth_resources_role` VALUES (244, 146, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (245, 147, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (246, 148, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (247, 149, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (248, 150, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (249, 151, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (250, 152, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (251, 153, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (252, 154, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (253, 155, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (254, 156, 1, '2021-06-27 11:33:24', 0, '2021-06-27 11:33:24', 0, 0);
INSERT INTO `auth_resources_role` VALUES (255, 134, 3, '2021-06-27 11:35:14', 1, '2021-06-27 11:35:14', 1, 0);
INSERT INTO `auth_resources_role` VALUES (256, 139, 3, '2021-06-27 11:35:19', 1, '2021-06-27 11:35:19', 1, 0);
INSERT INTO `auth_resources_role` VALUES (257, 141, 3, '2021-06-27 11:35:25', 1, '2021-06-27 11:35:25', 1, 0);
INSERT INTO `auth_resources_role` VALUES (258, 146, 3, '2021-06-27 11:35:50', 1, '2021-06-27 11:35:50', 1, 0);
INSERT INTO `auth_resources_role` VALUES (259, 152, 3, '2021-06-27 11:40:00', 1, '2021-06-27 11:40:00', 1, 0);

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
INSERT INTO `auth_role` VALUES (2, 'admin', 'admin权限，管理员权限', 0, '2021-01-03 16:33:03', 0, '2021-05-11 11:15:54', 22, 0);
INSERT INTO `auth_role` VALUES (3, 'user', '普通用户权限', 0, '2021-01-03 16:33:03', 0, '2021-05-11 11:15:53', 22, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'root', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:22:28', 0, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (2, '零', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:42:46', 1, '2021-06-14 06:57:00', 22, 0);
INSERT INTO `auth_user` VALUES (3, '天帝', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:42:57', 1, '2021-05-11 16:38:51', 22, 0);
INSERT INTO `auth_user` VALUES (4, '彦', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:06', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (5, '懒羊羊', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:13', 1, '2021-05-11 16:38:52', 22, 0);
INSERT INTO `auth_user` VALUES (6, '修罗铠甲', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:20', 1, '2021-05-11 16:38:54', 22, 0);
INSERT INTO `auth_user` VALUES (7, '喜羊羊', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:33', 1, '2021-05-11 16:38:57', 22, 0);
INSERT INTO `auth_user` VALUES (8, '凉冰', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:41', 1, '2021-05-11 16:38:58', 22, 0);
INSERT INTO `auth_user` VALUES (9, '凯莎女王', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:51', 1, '2021-05-11 16:38:59', 22, 0);
INSERT INTO `auth_user` VALUES (10, '鹤熙', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 0, 0, 0, 0, 'PASSWORD', '2021-01-03 16:43:59', 1, '2021-05-11 16:38:59', 22, 0);
INSERT INTO `auth_user` VALUES (11, '死神卡尔', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:04', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (12, '帝蕾娜', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:10', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (13, '刑天铠甲', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:22', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (14, '飞影铠甲', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:28', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (15, '孙悟空', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:41', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (16, '天下谁人不识君', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:49', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (17, '泽塔奥特曼', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:44:56', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (18, '天使凯拉', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:45:01', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (19, '波波', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:45:07', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (20, '刘老板', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:45:15', 1, '2021-04-10 17:49:36', 1, 0);
INSERT INTO `auth_user` VALUES (21, '池总', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:45:33', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (22, 'user', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-03 16:45:45', 1, '2021-04-08 00:06:04', 1, 0);
INSERT INTO `auth_user` VALUES (23, '赛罗奥特曼', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'PASSWORD', '2021-01-16 22:49:41', 1, '2021-04-10 17:55:25', 1, 0);
INSERT INTO `auth_user` VALUES (24, 'herenpeng', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 1, 0, 0, 0, 'GITHUB', '2021-04-10 18:14:03', 0, '2021-04-10 18:14:03', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_info
-- ----------------------------
INSERT INTO `auth_user_info` VALUES (1, '何任鹏', 1, '17345671234', '2519832582@qq.com', '2021-01-17', '360733202101014219', '2519832582', 'H2519832582', 'http://zeroadmin.herenpeng.com/api/image/2021/4/10/8d3ff81d-d467-4bdc-aa2d-18a3d619713b.jpg', '2021-01-12 22:54:06', 1, '2021-04-06 18:52:39', 1, 0);
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
INSERT INTO `auth_user_info` VALUES (22, NULL, 1, NULL, '2519832582@qq.com', NULL, NULL, NULL, NULL, 'http://zeroadmin.herenpeng.com/api/image/2021/4/10/c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', '2021-01-16 22:44:30', 0, '2021-06-14 10:12:35', 22, 0);
INSERT INTO `auth_user_info` VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 22:49:41', 1, '2021-01-16 22:49:41', 1, 0);
INSERT INTO `auth_user_info` VALUES (24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://avatars.githubusercontent.com/u/60246991?v=4', '2021-04-10 18:14:03', 0, '2021-04-10 18:14:03', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = Compact;

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
INSERT INTO `auth_user_role` VALUES (23, 24, 3, '2021-04-10 18:14:03', 0, '2021-04-10 18:14:03', 0, 0);
INSERT INTO `auth_user_role` VALUES (24, 23, 3, '2021-04-10 18:32:39', 1, '2021-04-10 18:32:39', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表字段信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dev_table_column
-- ----------------------------
INSERT INTO `dev_table_column` VALUES (1, 'id', 'int(11)', '主键', 'id', 'Integer', 'INTEGER', 0, 1, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (2, 'user_id', 'int(11)', '登录用户主键', 'userId', 'Integer', 'INTEGER', 0, 2, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (3, 'ip', 'varchar(50)', '登录的IP地址', 'ip', 'String', 'VARCHAR', 0, 3, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (4, 'country', 'varchar(100)', '登录现实地址，国家', 'country', 'String', 'VARCHAR', 0, 4, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (5, 'region', 'varchar(100)', '登录现实地址，区域，省', 'region', 'String', 'VARCHAR', 0, 5, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (6, 'city', 'varchar(100)', '登录现实地址，城市', 'city', 'String', 'VARCHAR', 0, 6, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (7, 'isp', 'varchar(100)', '因特网提供商', 'isp', 'String', 'VARCHAR', 0, 7, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (8, 'login_time', 'datetime', '登录时间', 'loginTime', 'Date', 'TIMESTAMP', 0, 8, 1, '2021-04-16 20:32:12', 1, '2021-04-16 20:32:12', 1, 0);
INSERT INTO `dev_table_column` VALUES (9, 'token_id', 'varchar(100)', 'tokenId', 'tokenId', 'String', 'VARCHAR', 0, 9, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (10, 'logout_time', 'datetime', '登出时间，默认为登录时间+token失效时间，登出时更新', 'logoutTime', 'Date', 'TIMESTAMP', 0, 10, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (11, 'logout', 'tinyint(1)', '是否主动登出，默认为0', 'logout', 'Boolean', 'BOOLEAN', 0, 11, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (12, 'create_time', 'datetime', '数据库数据插入时间', 'createTime', 'Date', 'TIMESTAMP', 0, 12, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (13, 'create_user_id', 'int(11)', '数据库数据插入用户主键', 'createUserId', 'Integer', 'INTEGER', 0, 13, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (14, 'update_time', 'datetime', '数据库数据更新时间', 'updateTime', 'Date', 'TIMESTAMP', 0, 14, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (15, 'update_user_id', 'int(11)', '数据库数据更新用户主键', 'updateUserId', 'Integer', 'INTEGER', 0, 15, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);
INSERT INTO `dev_table_column` VALUES (16, 'deleted', 'tinyint(1)', '逻辑删除标识，0为正常，1为逻辑删除，默认为0', 'deleted', 'Boolean', 'BOOLEAN', 0, 16, 1, '2021-04-16 20:32:13', 1, '2021-04-16 20:32:13', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据库表信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dev_table_info
-- ----------------------------
INSERT INTO `dev_table_info` VALUES (1, 'auth_login_log', '系统账号登录日志表', 'LoginLog', 'login/log', 'com.auth', 'G:\\\\', 'G:\\\\', 'development', 'herenpeng', '2021-04-16 20:32:12', 1, '2021-05-01 12:46:51', 22, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Github用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_github_user
-- ----------------------------
INSERT INTO `oauth_github_user` VALUES (1, 'herenpeng', 24, 60246991, 'MDQ6VXNlcjYwMjQ2OTkx', 'https://api.github.com/users/herenpeng', 'https://github.com/herenpeng', 'User', 11, 'https://avatars.githubusercontent.com/u/60246991?v=4', 0, NULL, 'https://api.github.com/users/herenpeng/followers', 0, 'https://api.github.com/users/herenpeng/following{/other_user}', 'https://api.github.com/users/herenpeng/gists{/gist_id}', 'https://api.github.com/users/herenpeng/starred{/owner}{/repo}', 'https://api.github.com/users/herenpeng/subscriptions', 'https://api.github.com/users/herenpeng/orgs', 'https://api.github.com/users/herenpeng/repos', 'https://api.github.com/users/herenpeng/events{/privacy}', 'https://api.github.com/users/herenpeng/received_events', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 2, 0, '2020-01-24 02:49:20', '2021-04-30 16:18:44', '2021-04-10 18:14:03', 0, '2021-05-01 21:40:24', 0, 0);

-- ----------------------------
-- Table structure for sys_config_const
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_const`;
CREATE TABLE `sys_config_const`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '常量键值，标识，唯一',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键值描述信息',
  `default_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置的默认值',
  `userable` tinyint(1) NOT NULL COMMENT '用户可配置，true为可配置，false为不可配置',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`, `key`) USING BTREE,
  UNIQUE INDEX `key_unique_index`(`key`) USING BTREE COMMENT 'key值唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置常量表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config_const
-- ----------------------------
INSERT INTO `sys_config_const` VALUES (1, 'RECORD_NUMBER', '网站ICP备案信息', '赣ICP备2020014777号', 0, '2021-06-06 11:41:48', 1, '2021-06-27 09:42:03', 1, 0);
INSERT INTO `sys_config_const` VALUES (2, 'SHOW_SETTINGS', '是否显示设置栏', 'true', 0, '2021-06-27 09:42:38', 0, '2021-06-27 09:52:37', 0, 0);
INSERT INTO `sys_config_const` VALUES (3, 'THEME_COLOR', '主题颜色', '#1890FF', 1, '2021-06-06 17:10:03', 1, '2021-06-26 16:52:57', 1, 0);
INSERT INTO `sys_config_const` VALUES (4, 'TAGS_VIEW', '开启页面顶部标签', 'true', 1, '2021-06-26 22:04:03', 1, '2021-06-26 22:17:17', 1, 0);
INSERT INTO `sys_config_const` VALUES (7, 'FIXED_HEADER', '固定顶部显示栏', 'true', 1, '2021-06-27 09:32:08', 1, '2021-06-27 09:32:08', 1, 0);
INSERT INTO `sys_config_const` VALUES (8, 'SIDEBAR_LOGO', '显示侧边栏LOGO', 'false', 1, '2021-06-27 09:32:29', 1, '2021-06-27 09:32:29', 1, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Compact;


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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_menu` VALUES (26, 'http://zeroadmin.herenpeng.com/api/swagger-ui/index.html', 'Swagger2', '', '项目文档', 'el-icon-notebook-2', NULL, 3, 0, 1, 23, '2020-11-18 00:03:34', 0, '2021-04-12 10:22:12', 1, 0);
INSERT INTO `sys_menu` VALUES (27, 'config', 'Config', 'system/config/index', '系统配置', 'el-icon-setting', NULL, 3, 0, 1, 11, '2021-06-05 22:38:42', 1, '2021-06-06 21:52:43', 1, 0);
INSERT INTO `sys_menu` VALUES (28, 'user-config', 'UserConfig', 'system/user-config/index', '用户配置', 'el-icon-picture-outline-round', NULL, 4, 0, 1, 11, '2021-06-06 21:50:42', 1, '2021-06-06 21:52:51', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单角色关系表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_menu_role` VALUES (50, 27, 1, '2021-06-27 11:34:28', 1, '2021-06-27 11:34:28', 1, 0);
INSERT INTO `sys_menu_role` VALUES (51, 27, 3, '2021-06-27 11:34:32', 1, '2021-06-27 11:34:32', 1, 0);
INSERT INTO `sys_menu_role` VALUES (52, 28, 1, '2021-06-27 11:34:36', 1, '2021-06-27 11:34:36', 1, 0);
INSERT INTO `sys_menu_role` VALUES (53, 28, 3, '2021-06-27 11:34:39', 1, '2021-06-27 11:34:39', 1, 0);

-- ----------------------------
-- Table structure for sys_user_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_config`;
CREATE TABLE `sys_user_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户主键',
  `config_id` int(11) NOT NULL COMMENT '配置主键',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户配置值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据库数据插入时间',
  `create_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据插入用户主键',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库数据更新时间',
  `update_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '数据库数据更新用户主键',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，0为正常，1为逻辑删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_config
-- ----------------------------
INSERT INTO `sys_user_config` VALUES (4, 1, 3, '#1890FF', '2021-06-27 11:34:17', 1, '2021-06-27 11:34:17', 1, 0);
INSERT INTO `sys_user_config` VALUES (5, 22, 3, '#F5222D', '2021-06-27 11:40:04', 22, '2021-06-27 11:41:53', 22, 0);
INSERT INTO `sys_user_config` VALUES (6, 22, 4, 'true', '2021-06-27 11:41:43', 22, '2021-06-27 11:41:50', 22, 0);
INSERT INTO `sys_user_config` VALUES (7, 22, 7, 'true', '2021-06-27 16:00:34', 22, '2021-06-27 16:00:41', 22, 0);
INSERT INTO `sys_user_config` VALUES (8, 22, 8, 'false', '2021-06-27 16:00:43', 22, '2021-06-27 16:00:49', 22, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件资源管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of upload_file_manage
-- ----------------------------
INSERT INTO `upload_file_manage` VALUES (1, '雅典娜-冰冠公主.jpg', 'IMAGE', 'http://zeroadmin.herenpeng.com/api/image/2021/4/10/c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', '/usr/app/zero-admin/static/image/2021/4/10/c1e3f69c-38b5-4eb7-9d80-097dba435e4e.jpg', '2021-04-10 17:56:10', 22, 0, '2021-04-10 17:56:09', 22, '2021-04-10 18:37:47', 22, 0);
INSERT INTO `upload_file_manage` VALUES (2, '公孙离-花间舞.jpg', 'IMAGE', 'http://zeroadmin.herenpeng.com/api/image/2021/4/10/8d3ff81d-d467-4bdc-aa2d-18a3d619713b.jpg', '/usr/app/zero-admin/static/image/2021/4/10/8d3ff81d-d467-4bdc-aa2d-18a3d619713b.jpg', '2021-04-10 18:34:41', 1, 0, '2021-04-10 18:34:40', 1, '2021-04-10 18:34:40', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
