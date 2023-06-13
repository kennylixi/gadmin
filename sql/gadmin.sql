/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : gadmin

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 13/06/2023 16:21:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (142, 'sys_notice', '通知公告', '', '', 'Notice', 'crud', 'geasy', 'system', 'notice', '通知公告', 'kennylixi', '1', '/', '{\"parentMenuId\":0,\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\"}', 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57', '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'GO类型',
  `go_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'GO字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (1791, 142, 'notice_id', '公告ID', 'int', 'int', 'NoticeId', '1', '1', '', '', '', '', '', '', 'input', '', 1, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1792, 142, 'notice_title', '公告标题', 'varchar(50)', 'string', 'NoticeTitle', '0', '0', '1', '1', '1', '1', '1', '', 'input', '', 2, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1793, 142, 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'string', 'NoticeType', '0', '0', '1', '1', '1', '1', '1', '', 'select', '', 3, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1794, 142, 'notice_content', '公告内容', 'text', 'string', 'NoticeContent', '0', '0', '', '1', '1', '1', '1', '', 'editor', '', 4, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1795, 142, 'status', '公告状态（0正常 1关闭）', 'char(1)', 'string', 'Status', '0', '0', '', '1', '1', '1', '1', '', 'radio', '', 5, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1796, 142, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', '0', '0', '', '', '', '', '', '', 'input', '', 6, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1797, 142, 'created_at', '创建时间', 'datetime', '*gtime.Time', 'CreatedAt', '0', '0', '', '', '', '', '', '', 'datetime', '', 7, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1798, 142, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', '0', '0', '', '', '', '', '', '', 'input', '', 8, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1799, 142, 'updated_at', '更新时间', 'datetime', '*gtime.Time', 'UpdatedAt', '0', '0', '', '', '', '', '', '', 'datetime', '', 9, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
INSERT INTO `gen_table_column` VALUES (1800, 142, 'remark', '备注', 'varchar(255)', 'string', 'Remark', '0', '0', '', '1', '1', '1', '', '', 'input', '', 10, 'admin', '2023-05-24 16:18:54', '', '2023-05-24 16:32:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `api_id` bigint NOT NULL AUTO_INCREMENT COMMENT '接口ID',
  `api_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务模块',
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口名称',
  `api_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口地址',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`api_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='接口表';

-- ----------------------------
-- Records of sys_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_api` VALUES (1, '用户管理', '根据用户编号获取授权角色', 'GET', '/system/user/authRole/{UserId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (2, '用户管理', '导入Excel数据', 'POST', '/system/user/importData', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (3, '定时任务管理', '获取定时任务详细', 'GET', '/monitor/job/{JobId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (4, '行政区域', '新增行政区域', 'POST', '/system/district', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (5, '行政区域', '修改行政区域', 'PUT', '/system/district', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (6, '行政区域', '删除行政区域', 'DELETE', '/system/district', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (7, '文件驱动配置', '设置主驱动配置', 'PUT', '/system/fileDriver/master/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (8, '验证码', '获取验证码图片', 'GET', '/captchaImage', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (9, '参数管理', '获取参数列表', 'GET', '/system/config/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (10, '字典数据管理', '查询字典数据详细', 'GET', '/system/dict/data/{DictCode}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (11, '用户管理', '获取个人信息', 'GET', '/system/user/profile', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (12, '用户管理', '更新个人信息', 'PUT', '/system/user/profile', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (13, '用户管理', '获取部门树列表', 'GET', '/system/user/deptTree', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (14, '定时任务管理', '修改定时任务状态', 'PUT', '/monitor/job/changeStatus', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (15, '推送渠道类型', '获取所有渠道类型', 'GET', '/system/pushType/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (16, '角色管理', '查询未分配用户角色列表', 'GET', '/system/role/authUser/unallocatedList', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (17, '角色管理', '新增角色详情', 'POST', '/system/role', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (18, '角色管理', '修改角色详情', 'PUT', '/system/role', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (19, '角色管理', '删除角色', 'DELETE', '/system/role', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (20, '代码生成', '预览业务表代码', 'GET', '/tool/gen/preview/{tableId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (21, '登录日志', '账户解锁', 'GET', '/monitor/logininfor/unlock/{UserName}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (22, '字典类型管理', '获取字典类型列表', 'GET', '/system/dict/type/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (23, '行政区域', '获取下级行政区域', 'GET', '/system/district/list/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (24, '推送渠道类型', '获取渠道类型详情', 'GET', '/system/pushType/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (25, '在线用户', '获取在线用户状态列表', 'GET', '/monitor/online/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (26, '参数管理', '根据Key获取参数详情', 'GET', '/system/config/configKey/{configKey}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (27, '通知管理', '新增通知', 'POST', '/system/notice', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (28, '通知管理', '修改通知', 'PUT', '/system/notice', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (29, '通知管理', '删除通知', 'DELETE', '/system/notice', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (30, '推送渠道', '查询渠道管理列表', 'GET', '/system/pushChannel/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (31, '部门管理', '根据部门编号获取详细信息', 'GET', '/system/dept/{deptId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (32, '菜单管理', '新增菜单', 'POST', '/system/menu', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (33, '菜单管理', '修改菜单', 'PUT', '/system/menu', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (34, '菜单管理', '获取菜单列表', 'GET', '/system/menu/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (35, '行政区域', '同步行政区域结构', 'GET', '/system/district/sync', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (36, '用户管理', '修改密码', 'PUT', '/system/user/profile/updatePwd', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (37, '定时任务管理', '执行一次任务', 'PUT', '/monitor/job/run', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (38, '接口管理', '重新导入所有接口', 'PUT', '/system/api/reimport', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (39, '字典数据管理', '新增字典数据', 'POST', '/system/dict/data', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (40, '字典数据管理', '修改字典数据', 'PUT', '/system/dict/data', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (41, '字典数据管理', '删除字典数据', 'DELETE', '/system/dict/data', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (42, '用户管理', '用户授权角色', 'PUT', '/system/user/authRole', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (43, '操作日志', '清空操作日志', 'DELETE', '/monitor/operlog/clean', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (44, '数据库管理', '恢复数据库备份', 'PUT', '/system/sqlBackups/recover/{BackupsId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (45, '用户管理', '新增用户', 'POST', '/system/user', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (46, '用户管理', '修改用户', 'PUT', '/system/user', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (47, '用户管理', '删除用户', 'DELETE', '/system/user', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (48, '用户管理', '获取用户列表', 'GET', '/system/user/search', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (49, '登录日志', '清空登录日志', 'DELETE', '/monitor/logininfor/clean', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (50, '通知管理', '获取通知详情', 'GET', '/system/notice/{NoticeId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (51, '岗位管理', '获取岗位列表', 'GET', '/system/post/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (52, '接口管理', '获取接口树形结构', 'GET', '/system/api/treeselect', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (53, '字典类型管理', '获取字典类型详细', 'GET', '/system/dict/type/{DictId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (54, '数据库管理', '获取备份文件解压密码', 'GET', '/system/sqlBackups/pwd/{BackupsId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (55, '部门管理', '获取部门列表', 'GET', '/system/dept/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (56, '字典数据管理', '获取字典数据列表', 'GET', '/system/dict/data/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (57, '菜单管理', '获取菜单详情', 'GET', '/system/menu/{MenuId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (58, '菜单管理', '删除菜单', 'DELETE', '/system/menu/{MenuId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (59, '字典类型管理', '清除字典缓存', 'DELETE', '/system/dict/type/clearCache', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (60, '操作日志', '删除操作日志', 'DELETE', '/monitor/operlog', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (61, '参数管理', '刷新参数缓存', 'DELETE', '/system/config/refreshCache', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (62, '字典数据管理', '根据字典类型查询字典数据信息', 'GET', '/system/dict/data/type/{DictType}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (63, '岗位管理', '获取岗位详情', 'GET', '/system/post/{PostId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (64, '消息模板', '获取消息模板详情', 'GET', '/system/pushTemplate/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (65, '角色管理', '获取对应角色部门树列表', 'GET', '/system/role/deptTree/{RoleId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (66, '数据库管理', '查询数据库备份表列表', 'GET', '/system/sqlBackups/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (67, '用户管理', '获取用户详情', 'GET', '/system/user/{UserId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (68, '任务日志管理', '清空任务日志', 'DELETE', '/monitor/jobLog/clean', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (69, '参数管理', '根据ID获取参数详情', 'GET', '/system/config/{configId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (70, '文件驱动配置', '新增驱动配置', 'POST', '/system/fileDriver', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (71, '文件驱动配置', '修改驱动配置', 'PUT', '/system/fileDriver', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (72, '文件驱动配置', '删除驱动配置', 'DELETE', '/system/fileDriver', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (73, '代码生成', '导入业务表', 'POST', '/tool/gen/importTable', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (74, '文件驱动配置', '查询驱动配置列表', 'GET', '/system/fileDriver/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (75, '登录日志', '删除登录日志', 'DELETE', '/monitor/logininfor', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (76, '接口管理', '新增接口管理', 'POST', '/system/api', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (77, '接口管理', '修改接口管理', 'PUT', '/system/api', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (78, '接口管理', '删除接口管理', 'DELETE', '/system/api', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (79, '部门管理', '删除部门', 'DELETE', '/system/dept/{DeptId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (80, '公共接口', '通用下载请求', 'GET', '/common/download', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (81, '系统', '获取用户信息', 'GET', '/getInfo', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (82, '文件驱动配置', '获取驱动配置详情', 'GET', '/system/fileDriver/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (83, '推送渠道', '新增渠道管理', 'POST', '/system/pushChannel', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (84, '推送渠道', '修改渠道管理', 'PUT', '/system/pushChannel', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (85, '推送渠道', '删除渠道管理', 'DELETE', '/system/pushChannel', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (86, '用户管理', '修改用户密码', 'PUT', '/system/user/resetPwd', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (87, '公共接口', '通用上传请求（单个）', 'POST', '/common/upload', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (88, '登录日志', '获取登录日志列表', 'GET', '/monitor/logininfor/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (89, '服务监控', '获取监控信息', 'GET', '/monitor/server', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (90, '菜单管理', '获取菜单下拉树列表', 'GET', '/system/menu/treeselect', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (91, '角色管理', '查询已分配用户角色列表', 'GET', '/system/role/authUser/allocatedList', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (92, '角色管理', '修改角色状态', 'PUT', '/system/role/changeStatus', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (93, '操作日志', '获取操作日志列表', 'GET', '/monitor/operlog/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (94, '参数管理', '导出参数列表', 'POST', '/system/config/export', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (95, '字典类型管理', '新增字典类型', 'POST', '/system/dict/type', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (96, '字典类型管理', '修改字典类型', 'PUT', '/system/dict/type', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (97, '字典类型管理', '删除字典类型', 'DELETE', '/system/dict/type', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (98, '代码生成', '批量生成业务表代码', 'GET', '/tool/gen/batchGenCode', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (99, '代码生成', '获取详细信息', 'GET', '/tool/gen/{tableId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (100, '系统', '获取路由信息', 'GET', '/getRouters', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (101, '定时任务管理', '定时任务列表', 'GET', '/monitor/job/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (102, '菜单管理', '获取对应角色菜单列表树', 'GET', '/system/menu/roleMenuTreeselect/{RoleId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (103, '通知管理', '获取通知列表', 'GET', '/system/notice/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (104, '公共接口', '通用上传请求（多个）', 'POST', '/common/uploads', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (105, '行政区域', '获取包含特定行政区域树形结构', 'GET', '/system/district/exclude/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (106, '文件管理', '查询文件管理列表', 'GET', '/system/file/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (107, '数据库管理', '备份数据库', 'POST', '/system/sqlBackups', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (108, '数据库管理', '删除数据库备份表', 'DELETE', '/system/sqlBackups', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (109, '代码生成', '同步业务表', 'GET', '/tool/gen/synchDb/{tableName}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (110, '接口管理', '查询接口模块列表', 'GET', '/system/api/module/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (111, '推送渠道类型', '新增渠道类型', 'POST', '/system/pushType', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (112, '推送渠道类型', '修改渠道类型', 'PUT', '/system/pushType', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (113, '角色管理', '批量取消授权用户', 'PUT', '/system/role/authUser/cancelAll', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (114, '角色管理', '修改角色数据权限', 'PUT', '/system/role/dataScope', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (115, '公共接口', '本地资源通用下载', 'GET', '/common/download/resource', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (116, '任务日志管理', '获取任务日志列表', 'GET', '/monitor/jobLog/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (117, '任务日志管理', '获取任务日志详情', 'GET', '/monitor/jobLog/{JobLogId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (118, '用户管理', '导出Excel模板', 'POST', '/system/user/importTemplate', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (119, '字典类型管理', '刷新字典缓存', 'DELETE', '/system/dict/type/refreshCache', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (120, '推送渠道类型', '获取下级渠道类型', 'GET', '/system/pushType/list/{ParentId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (121, '角色管理', '获取角色列表', 'GET', '/system/role/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (122, '推送渠道', '查询渠道管理列表（简单）', 'GET', '/system/pushChannel/list/simple', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (123, '推送渠道', '获取渠道管理详情', 'GET', '/system/pushChannel/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (124, '在线用户', '强退用户', 'DELETE', '/monitor/online/{TokenId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (125, '接口管理', '查询接口管理列表', 'GET', '/system/api/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (126, '文件管理', '删除文件管理', 'DELETE', '/system/file', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (127, '接口管理', '获取接口管理详情', 'GET', '/system/api/{ApiId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (128, '代码生成', '查询代码生成列表', 'GET', '/tool/gen/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (129, '岗位管理', '新增岗位', 'POST', '/system/post', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (130, '岗位管理', '修改岗位', 'PUT', '/system/post', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (131, '岗位管理', '删除岗位', 'DELETE', '/system/post', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (132, '消息模板', '查询消息模板列表', 'GET', '/system/pushTemplate/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (133, '角色管理', '取消授权用户', 'PUT', '/system/role/authUser/cancel', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (134, '任务日志管理', '删除任务日志', 'DELETE', '/monitor/jobLog', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (135, '部门管理', '新增部门', 'POST', '/system/dept', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (136, '部门管理', '修改部门', 'PUT', '/system/dept', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (137, '岗位管理', '获取岗位选择框列表', 'GET', '/system/post/optionselect', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (138, '推送渠道', '获取渠道模板参数', 'GET', '/system/pushChannel/template_params/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (139, '角色管理', '批量选择用户授权', 'PUT', '/system/role/authUser/selectAll', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (140, '角色管理', '获取角色选择框列表', 'GET', '/system/role/optionselect', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (141, '角色管理', '获取角色详情', 'GET', '/system/role/{RoleId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (142, '代码生成', '查询数据库列表', 'GET', '/tool/gen/db/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (143, '接口管理', '获取角色接口列表（树形结构）', 'GET', '/system/api/roleApiTreeselect/:RoleId', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (144, '部门管理', '查询部门列表（排除节点）', 'GET', '/system/dept/list/exclude/{deptId}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (145, '文件驱动配置', '测试驱动配置', 'PUT', '/system/fileDriver/test/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (146, '代码生成', '更新业务表', 'PUT', '/tool/gen', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (147, '代码生成', '删除业务表', 'DELETE', '/tool/gen', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (148, '参数管理', '新增参数', 'POST', '/system/config', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (149, '参数管理', '修改参数', 'PUT', '/system/config', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (150, '参数管理', '删除参数', 'DELETE', '/system/config', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (151, '用户管理', '修改用户状态', 'PUT', '/system/user/changeStatus', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (152, '用户管理', '导出Excel数据', 'POST', '/system/user/export', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (153, '定时任务管理', '新增定时任务', 'POST', '/monitor/job', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (154, '定时任务管理', '修改定时任务', 'PUT', '/monitor/job', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (155, '定时任务管理', '删除定时任务', 'DELETE', '/monitor/job', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (156, '推送渠道类型', '删除渠道类型', 'DELETE', '/system/pushType/{id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (157, '代码生成', '生成业务表代码', 'GET', '/tool/gen/genCode/{tableName}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (158, '字典类型管理', '获取字典选择框列表', 'GET', '/system/dict/type/optionselect', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (159, '行政区域', '获取行政区域详情', 'GET', '/system/district/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (160, '文件管理', '获取文件管理详情', 'GET', '/system/file/{Id}', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (161, '用户管理', '头像上传', 'POST', '/system/user/profile/avatar', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (162, '消息模板', '新增消息模板', 'POST', '/system/pushTemplate', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (163, '消息模板', '修改消息模板', 'PUT', '/system/pushTemplate', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (164, '消息模板', '删除消息模板', 'DELETE', '/system/pushTemplate', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (165, '消息模板', '测试发送模板消息', 'POST', '/system/pushTemplate/test', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
INSERT INTO `sys_api` VALUES (166, '用户管理', '获取用户列表', 'GET', '/system/user/list', '', '2023-06-13 11:28:59', '', '2023-06-13 11:28:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_casbin
-- ----------------------------
DROP TABLE IF EXISTS `sys_casbin`;
CREATE TABLE `sys_casbin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='授权策略表';

-- ----------------------------
-- Records of sys_casbin
-- ----------------------------
BEGIN;
INSERT INTO `sys_casbin` VALUES (244, 'g', 'ry', 'r:super', '', '', '', '');
INSERT INTO `sys_casbin` VALUES (245, 'p', 'r:super', '/system/user/resetPwd', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (246, 'p', 'r:super', '/tool/gen/{tableId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (247, 'p', 'r:super', '/monitor/operlog/clean', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (248, 'p', 'r:super', '/mp/account', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (249, 'p', 'r:super', '/mp/account', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (250, 'p', 'r:super', '/mp/account', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (251, 'p', 'r:super', '/mp/user', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (252, 'p', 'r:super', '/mp/user', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (253, 'p', 'r:super', '/mp/user', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (254, 'p', 'r:super', '/system/dict/type/clearCache', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (255, 'p', 'r:super', '/system/dict/type/{DictId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (256, 'p', 'r:super', '/system/user/export', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (257, 'p', 'r:super', '/local/trade/list/{ParentId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (258, 'p', 'r:super', '/monitor/job/run', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (259, 'p', 'r:super', '/monitor/server', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (260, 'p', 'r:super', '/mp/material/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (261, 'p', 'r:super', '/system/district/exclude/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (262, 'p', 'r:super', '/system/notice/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (263, 'p', 'r:super', '/tool/gen', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (264, 'p', 'r:super', '/tool/gen', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (265, 'p', 'r:super', '/monitor/logininfor', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (266, 'p', 'r:super', '/mp/autoReply/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (267, 'p', 'r:super', '/mp/tag/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (268, 'p', 'r:super', '/mp/tag/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (269, 'p', 'r:super', '/system/config/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (270, 'p', 'r:super', '/system/district/sync', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (271, 'p', 'r:super', '/local/category/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (272, 'p', 'r:super', '/local/changfang/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (273, 'p', 'r:super', '/mp/account/generate-qr-code/{Id}', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (274, 'p', 'r:super', '/mp/menu', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (275, 'p', 'r:super', '/mp/menu', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (276, 'p', 'r:super', '/mp/menu', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (277, 'p', 'r:super', '/system/config/export', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (278, 'p', 'r:super', '/system/dept/list/exclude/{deptId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (279, 'p', 'r:super', '/local/city', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (280, 'p', 'r:super', '/local/city', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (281, 'p', 'r:super', '/local/city', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (282, 'p', 'r:super', '/system/api/roleApiTreeselect/:RoleId', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (283, 'p', 'r:super', '/system/post/{PostId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (284, 'p', 'r:super', '/system/sqlBackups/pwd/{BackupsId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (285, 'p', 'r:super', '/system/user/profile/updatePwd', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (286, 'p', 'r:super', '/captchaImage', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (287, 'p', 'r:super', '/local/cangku/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (288, 'p', 'r:super', '/system/config/configKey/{configKey}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (289, 'p', 'r:super', '/system/pushChannel/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (290, 'p', 'r:super', '/system/role', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (291, 'p', 'r:super', '/system/role', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (292, 'p', 'r:super', '/system/role', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (293, 'p', 'r:super', '/system/role/authUser/selectAll', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (294, 'p', 'r:super', '/local/category/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (295, 'p', 'r:super', '/local/category/{id}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (296, 'p', 'r:super', '/local/city/list/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (297, 'p', 'r:super', '/local/metro', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (298, 'p', 'r:super', '/local/metro', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (299, 'p', 'r:super', '/local/metro', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (300, 'p', 'r:super', '/monitor/jobLog/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (301, 'p', 'r:super', '/mp/account/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (302, 'p', 'r:super', '/system/user', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (303, 'p', 'r:super', '/system/user', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (304, 'p', 'r:super', '/system/user', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (305, 'p', 'r:super', '/system/user/importTemplate', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (306, 'p', 'r:super', '/system/user/{UserId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (307, 'p', 'r:super', '/local/changfang/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (308, 'p', 'r:super', '/monitor/job/changeStatus', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (309, 'p', 'r:super', '/mp/menu/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (310, 'p', 'r:super', '/system/config/{configId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (311, 'p', 'r:super', '/system/dict/data/type/{DictType}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (312, 'p', 'r:super', '/system/menu/{MenuId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (313, 'p', 'r:super', '/system/menu/{MenuId}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (314, 'p', 'r:super', '/system/user/importData', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (315, 'p', 'r:super', '/local/metroStation', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (316, 'p', 'r:super', '/local/metroStation', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (317, 'p', 'r:super', '/local/metroStation', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (318, 'p', 'r:super', '/monitor/operlog/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (319, 'p', 'r:super', '/system/config', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (320, 'p', 'r:super', '/system/config', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (321, 'p', 'r:super', '/system/config', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (322, 'p', 'r:super', '/system/dept', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (323, 'p', 'r:super', '/system/dept', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (324, 'p', 'r:super', '/system/pushType/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (325, 'p', 'r:super', '/system/pushType/list/{ParentId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (326, 'p', 'r:super', '/local/category', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (327, 'p', 'r:super', '/local/category', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (328, 'p', 'r:super', '/mp/autoReply', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (329, 'p', 'r:super', '/mp/autoReply', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (330, 'p', 'r:super', '/mp/autoReply', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (331, 'p', 'r:super', '/system/fileDriver/master/{Id}', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (332, 'p', 'r:super', '/system/post', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (333, 'p', 'r:super', '/system/post', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (334, 'p', 'r:super', '/system/post', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (335, 'p', 'r:super', '/system/role/authUser/unallocatedList', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (336, 'p', 'r:super', '/tool/gen/genCode/{tableName}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (337, 'p', 'r:super', '/monitor/job', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (338, 'p', 'r:super', '/monitor/job', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (339, 'p', 'r:super', '/monitor/job', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (340, 'p', 'r:super', '/system/api', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (341, 'p', 'r:super', '/system/api', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (342, 'p', 'r:super', '/system/api', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (343, 'p', 'r:super', '/system/dict/type/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (344, 'p', 'r:super', '/system/menu/treeselect', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (345, 'p', 'r:super', '/system/pushChannel/list/simple', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (346, 'p', 'r:super', '/system/pushType/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (347, 'p', 'r:super', '/monitor/online/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (348, 'p', 'r:super', '/mp/autoReply/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (349, 'p', 'r:super', '/system/api/module/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (350, 'p', 'r:super', '/system/menu', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (351, 'p', 'r:super', '/system/menu', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (352, 'p', 'r:super', '/system/pushChannel', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (353, 'p', 'r:super', '/system/pushChannel', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (354, 'p', 'r:super', '/system/pushChannel', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (355, 'p', 'r:super', '/system/user/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (356, 'p', 'r:super', '/mp/message/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (357, 'p', 'r:super', '/system/dict/data', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (358, 'p', 'r:super', '/system/dict/data', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (359, 'p', 'r:super', '/system/dict/data', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (360, 'p', 'r:super', '/system/fileDriver/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (361, 'p', 'r:super', '/system/post/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (362, 'p', 'r:super', '/monitor/jobLog/clean', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (363, 'p', 'r:super', '/system/pushType', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (364, 'p', 'r:super', '/system/pushType', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (365, 'p', 'r:super', '/system/sqlBackups/recover/{BackupsId}', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (366, 'p', 'r:super', '/system/notice/{NoticeId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (367, 'p', 'r:super', '/mp/account/clear-quota/{Id}', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (368, 'p', 'r:super', '/mp/material/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (369, 'p', 'r:super', '/mp/message/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (370, 'p', 'r:super', '/system/dept/{DeptId}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (371, 'p', 'r:super', '/system/dict/data/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (372, 'p', 'r:super', '/system/file/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (373, 'p', 'r:super', '/monitor/logininfor/unlock/{UserName}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (374, 'p', 'r:super', '/system/api/{ApiId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (375, 'p', 'r:super', '/system/district/list/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (376, 'p', 'r:super', '/system/fileDriver/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (377, 'p', 'r:super', '/system/menu/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (378, 'p', 'r:super', '/system/role/authUser/allocatedList', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (379, 'p', 'r:super', '/system/notice', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (380, 'p', 'r:super', '/system/notice', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (381, 'p', 'r:super', '/system/notice', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (382, 'p', 'r:super', '/system/post/optionselect', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (383, 'p', 'r:super', '/system/user/profile/avatar', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (384, 'p', 'r:super', '/system/api/reimport', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (385, 'p', 'r:super', '/system/api/treeselect', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (386, 'p', 'r:super', '/system/file/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (387, 'p', 'r:super', '/tool/gen/synchDb/{tableName}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (388, 'p', 'r:super', '/common/download', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (389, 'p', 'r:super', '/monitor/logininfor/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (390, 'p', 'r:super', '/system/district/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (391, 'p', 'r:super', '/system/role/dataScope', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (392, 'p', 'r:super', '/common/upload', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (393, 'p', 'r:super', '/local/metroStation/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (394, 'p', 'r:super', '/system/dept/{deptId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (395, 'p', 'r:super', '/system/sqlBackups', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (396, 'p', 'r:super', '/system/sqlBackups', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (397, 'p', 'r:super', '/local/changfang', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (398, 'p', 'r:super', '/local/changfang', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (399, 'p', 'r:super', '/local/changfang', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (400, 'p', 'r:super', '/local/city/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (401, 'p', 'r:super', '/monitor/jobLog', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (402, 'p', 'r:super', '/mp/material', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (403, 'p', 'r:super', '/mp/material', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (404, 'p', 'r:super', '/mp/material', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (405, 'p', 'r:super', '/system/pushChannel/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (406, 'p', 'r:super', '/system/pushTemplate/test', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (407, 'p', 'r:super', '/system/user/changeStatus', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (408, 'p', 'r:super', '/tool/gen/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (409, 'p', 'r:super', '/mp/account/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (410, 'p', 'r:super', '/system/dept/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (411, 'p', 'r:super', '/system/file', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (412, 'p', 'r:super', '/system/fileDriver', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (413, 'p', 'r:super', '/system/fileDriver', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (414, 'p', 'r:super', '/system/fileDriver', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (415, 'p', 'r:super', '/system/menu/roleMenuTreeselect/{RoleId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (416, 'p', 'r:super', '/system/role/{RoleId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (417, 'p', 'r:super', '/getInfo', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (418, 'p', 'r:super', '/local/cangku/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (419, 'p', 'r:super', '/monitor/jobLog/{JobLogId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (420, 'p', 'r:super', '/mp/tag', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (421, 'p', 'r:super', '/mp/tag', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (422, 'p', 'r:super', '/mp/tag', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (423, 'p', 'r:super', '/system/dict/type/optionselect', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (424, 'p', 'r:super', '/system/role/authUser/cancel', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (425, 'p', 'r:super', '/monitor/online/{TokenId}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (426, 'p', 'r:super', '/system/pushTemplate/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (427, 'p', 'r:super', '/system/user/search', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (428, 'p', 'r:super', '/common/download/resource', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (429, 'p', 'r:super', '/local/cangku', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (430, 'p', 'r:super', '/local/cangku', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (431, 'p', 'r:super', '/local/cangku', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (432, 'p', 'r:super', '/local/trade', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (433, 'p', 'r:super', '/local/trade', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (434, 'p', 'r:super', '/monitor/operlog', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (435, 'p', 'r:super', '/system/role/changeStatus', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (436, 'p', 'r:super', '/getRouters', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (437, 'p', 'r:super', '/local/trade/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (438, 'p', 'r:super', '/mp/account/list-all-simple', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (439, 'p', 'r:super', '/mp/menu/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (440, 'p', 'r:super', '/system/role/authUser/cancelAll', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (441, 'p', 'r:super', '/system/user/authRole', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (442, 'p', 'r:super', '/system/user/deptTree', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (443, 'p', 'r:super', '/tool/gen/importTable', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (444, 'p', 'r:super', '/local/metro/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (445, 'p', 'r:super', '/local/metroStation/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (446, 'p', 'r:super', '/monitor/job/{JobId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (447, 'p', 'r:super', '/system/dict/data/{DictCode}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (448, 'p', 'r:super', '/system/role/deptTree/{RoleId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (449, 'p', 'r:super', '/system/role/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (450, 'p', 'r:super', '/tool/gen/preview/{tableId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (451, 'p', 'r:super', '/monitor/job/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (452, 'p', 'r:super', '/mp/message', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (453, 'p', 'r:super', '/mp/message', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (454, 'p', 'r:super', '/mp/message', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (455, 'p', 'r:super', '/mp/user/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (456, 'p', 'r:super', '/system/pushChannel/template_params/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (457, 'p', 'r:super', '/system/dict/type', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (458, 'p', 'r:super', '/system/dict/type', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (459, 'p', 'r:super', '/system/dict/type', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (460, 'p', 'r:super', '/system/sqlBackups/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (461, 'p', 'r:super', '/system/user/profile', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (462, 'p', 'r:super', '/system/user/profile', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (463, 'p', 'r:super', '/local/city/exclude/{Id}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (464, 'p', 'r:super', '/local/trade/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (465, 'p', 'r:super', '/local/trade/{id}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (466, 'p', 'r:super', '/monitor/logininfor/clean', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (467, 'p', 'r:super', '/system/api/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (468, 'p', 'r:super', '/system/district', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (469, 'p', 'r:super', '/system/district', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (470, 'p', 'r:super', '/system/district', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (471, 'p', 'r:super', '/tool/gen/db/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (472, 'p', 'r:super', '/common/uploads', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (473, 'p', 'r:super', '/local/category/list/{ParentId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (474, 'p', 'r:super', '/local/metro/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (475, 'p', 'r:super', '/system/role/optionselect', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (476, 'p', 'r:super', '/system/user/authRole/{UserId}', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (477, 'p', 'r:super', '/tool/gen/batchGenCode', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (478, 'p', 'r:super', '/system/pushType/{id}', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (479, 'p', 'r:super', '/mp/user/list', 'GET', '', '', '');
INSERT INTO `sys_casbin` VALUES (480, 'p', 'r:super', '/system/config/refreshCache', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (481, 'p', 'r:super', '/system/dict/type/refreshCache', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (482, 'p', 'r:super', '/system/fileDriver/test/{Id}', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (483, 'p', 'r:super', '/system/pushTemplate', 'POST', '', '', '');
INSERT INTO `sys_casbin` VALUES (484, 'p', 'r:super', '/system/pushTemplate', 'PUT', '', '', '');
INSERT INTO `sys_casbin` VALUES (485, 'p', 'r:super', '/system/pushTemplate', 'DELETE', '', '', '');
INSERT INTO `sys_casbin` VALUES (486, 'p', 'r:super', '/system/pushTemplate/{Id}', 'GET', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', '', '2021-01-27 09:36:41', '若依', '2021-05-04 21:58:32', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-01-27 09:36:41', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-27 09:36:41', 'admin', '2022-11-06 01:30:44', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '上传文件名最大长度', 'sys.upload.maxFileNameLen', '100', 'Y', 'admin', '2023-03-24 09:25:18', 'admin', '2023-03-24 09:25:34', '文件上传');
INSERT INTO `sys_config` VALUES (5, '上传文件大小', 'sys.upload.maxSize', '5242880', 'Y', 'admin', '2023-03-24 09:28:39', '', '2023-03-24 09:28:39', '文件上传(5*1024*1024)');
INSERT INTO `sys_config` VALUES (6, '上传文件允许类型', 'sys.upload.allowedExt', 'bmp,gif,jpg,jpeg,png,doc,docx,xls,xlsx,ppt,pptx,html,htm,txt,rar,zip,gz,bz2,mp4,avi,rmvb,pdf', 'Y', 'admin', '2023-03-24 09:29:46', 'admin', '2023-03-24 09:35:04', '文件上传');
INSERT INTO `sys_config` VALUES (7, '临时文件存储目录', 'sys.tempfile.dir', '/Users/kennyli/Documents/dev/gadmin/temp', 'Y', 'admin', '2023-03-24 12:11:41', 'admin', '2023-06-12 16:38:38', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '青优科技', 0, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,f', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2021-01-27 09:36:41', '若依', '2021-05-04 21:51:29', NULL);
INSERT INTO `sys_dept` VALUES (110, 100, '', 'aaa', 1, '11', '13800138000', '11@126.com', '0', '', '2021-05-04 21:51:57', '', '2021-05-04 21:51:57', '2021-05-04 21:52:45');
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '公安部', 3, '王者', '13800138000', 'aa@126.com', '1', 'admin', '2022-11-06 00:23:15', 'admin', '2022-11-06 00:27:53', '2022-11-06 00:28:09');
INSERT INTO `sys_dept` VALUES (112, 100, '0,100', '客户部', 4, '', '', '', '0', 'admin', '2022-12-07 22:57:27', '', '2022-12-07 22:57:27', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-27 09:36:41', '', '2021-05-04 08:34:33', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'default', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2023-04-11 14:41:08', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'system', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2023-04-11 14:42:03', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (87, 0, '已发布', '0', 'local_changfang_status', '', 'default', '', '0', 'admin', '2023-03-07 09:21:32', '', '2023-03-07 09:21:32', '');
INSERT INTO `sys_dict_data` VALUES (88, 0, '未发布', '1', 'local_changfang_status', '', 'default', '', '0', 'admin', '2023-03-07 09:21:40', '', '2023-03-07 09:21:40', '');
INSERT INTO `sys_dict_data` VALUES (154, 0, '本地磁盘', 'local', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:16:20', '', '2023-03-23 12:16:20', '');
INSERT INTO `sys_dict_data` VALUES (155, 0, '百度云存储', 'bos', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:16:42', '', '2023-03-23 12:16:42', '');
INSERT INTO `sys_dict_data` VALUES (156, 0, '腾讯云存储', 'cos', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:16:52', '', '2023-03-23 12:16:52', '');
INSERT INTO `sys_dict_data` VALUES (157, 0, '华为云存储', 'obs', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:17:04', '', '2023-03-23 12:17:04', '');
INSERT INTO `sys_dict_data` VALUES (158, 0, '阿里云存储', 'oss', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:17:16', '', '2023-03-23 12:17:16', '');
INSERT INTO `sys_dict_data` VALUES (159, 0, '七牛云储存', 'qiniu', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:17:26', '', '2023-03-23 12:17:26', '');
INSERT INTO `sys_dict_data` VALUES (160, 0, '又拍云存储', 'upyun', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:17:37', '', '2023-03-23 12:17:37', '');
INSERT INTO `sys_dict_data` VALUES (161, 0, 'minio存储', 'minio', 'sys_file_driver', '', 'default', '', '0', 'admin', '2023-03-23 12:17:51', '', '2023-03-23 12:17:51', '');
INSERT INTO `sys_dict_data` VALUES (162, 0, '系统', '0', 'sys_user_type', '', 'default', '', '0', 'admin', '2023-03-23 12:20:28', 'admin', '2023-03-23 12:21:38', '');
INSERT INTO `sys_dict_data` VALUES (163, 0, '管理员', '1', 'sys_user_type', '', 'default', '', '0', 'admin', '2023-03-23 12:21:47', 'admin', '2023-03-23 12:26:02', '商家管理员');
INSERT INTO `sys_dict_data` VALUES (164, 0, '商家', '2', 'sys_user_type', '', 'default', '', '0', 'admin', '2023-03-23 12:22:04', 'admin', '2023-03-23 12:26:37', '普通商家(商家管理员可以控制普通账户)');
INSERT INTO `sys_dict_data` VALUES (165, 0, '会员', '3', 'sys_user_type', '', 'default', '', '0', 'admin', '2023-03-23 12:22:29', '', '2023-03-23 12:22:29', '');
INSERT INTO `sys_dict_data` VALUES (166, 0, '坐席', '4', 'sys_user_type', '', 'default', '', '0', 'admin', '2023-03-23 12:22:55', '', '2023-03-23 12:22:55', '客服');
INSERT INTO `sys_dict_data` VALUES (167, 0, '否', 'false', 'sys_file_driver_master', '', 'info', '', '0', 'admin', '2023-03-23 14:56:57', 'admin', '2023-03-23 16:13:16', '');
INSERT INTO `sys_dict_data` VALUES (168, 0, '是', 'true', 'sys_file_driver_master', '', 'success', '', '0', 'admin', '2023-03-23 14:57:12', 'admin', '2023-03-23 16:13:22', '');
INSERT INTO `sys_dict_data` VALUES (180, 0, '通知', '0', 'sys_push_msg_type', '', 'info', '', '0', 'admin', '2023-03-29 15:52:51', 'admin', '2023-03-29 15:53:54', '');
INSERT INTO `sys_dict_data` VALUES (181, 0, '营销', '1', 'sys_push_msg_type', '', 'success', '', '0', 'admin', '2023-03-29 15:53:16', 'admin', '2023-03-29 15:53:46', '');
INSERT INTO `sys_dict_data` VALUES (182, 0, '验证码', '2', 'sys_push_msg_type', '', 'primary', '', '0', 'admin', '2023-03-29 15:53:37', '', '2023-03-29 15:53:37', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (35, '文件上传驱动', 'sys_file_driver', '0', 'admin', '2023-03-23 12:14:20', '', '2023-03-23 12:14:20', '');
INSERT INTO `sys_dict_type` VALUES (36, '用户类型', 'sys_user_type', '0', 'admin', '2023-03-23 12:20:07', '', '2023-03-23 12:20:07', '');
INSERT INTO `sys_dict_type` VALUES (37, '文件上传默认驱动', 'sys_file_driver_master', '0', 'admin', '2023-03-23 14:56:25', 'admin', '2023-03-23 15:04:42', '');
INSERT INTO `sys_dict_type` VALUES (38, '推送消息类型', 'sys_push_msg_type', '0', 'admin', '2023-03-26 21:42:08', 'admin', '2023-03-29 15:52:32', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_district
-- ----------------------------
DROP TABLE IF EXISTS `sys_district`;
CREATE TABLE `sys_district` (
  `id` bigint NOT NULL COMMENT '编号',
  `parent_id` bigint DEFAULT NULL COMMENT '上级编号',
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '祖级列表',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地区名称',
  `center` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经纬度',
  `citycode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市编码',
  `adcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮编',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拼音',
  `first_pinyin` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拼音第一个字母',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '级别',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '是否开放',
  `order_num` int DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='行政区域表';

-- ----------------------------
-- Records of sys_district
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `driver_id` bigint NOT NULL COMMENT '文件驱动ID',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '存储文件名',
  `size` bigint DEFAULT NULL COMMENT '大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件类型',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原文件名',
  `owner_id` bigint DEFAULT NULL COMMENT '拥有者ID',
  `user_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户类型',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES (1, 5, 'bg_head.png', 1578, 'png', 'bg_head.png', 0, '', NULL, '2023-03-24 13:15:31');
INSERT INTO `sys_file` VALUES (2, 5, '1oame4v1hvmcrduzfhypchs300a86qyc.png', 49904, 'png', 'bg_result.png', 0, '', NULL, '2023-03-23 23:25:29');
INSERT INTO `sys_file` VALUES (3, 5, '1oame4v1hvmcrdv8ohiw4ao40005trd4.jpg', 87143, 'jpg', 'fv.jpg', 0, '', NULL, '2023-03-24 13:15:31');
INSERT INTO `sys_file` VALUES (4, 5, '1oame4v1s61crebq0uulxag300yhtxwj.png', 1578, 'png', 'bg_head.png', 0, '', '2023-03-24 12:20:34', '2023-03-24 13:15:31');
INSERT INTO `sys_file` VALUES (5, 5, '1oame4v1s61crebqne1p0d4400w0p9dx.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 12:21:23', '2023-03-24 13:15:31');
INSERT INTO `sys_file` VALUES (6, 5, '1oame4v1s61crecw938bzgg500r4r4xi.png', 2080, 'png', 'bg_fee.png', 0, '', '2023-03-24 13:15:46', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (7, 5, '1i7cxcd1yfacrel0y3aqbx4200tuel1s.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 19:38:03', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (8, 5, '1i7cxcd1yfacrel1f4qvqk8300qy3wnb.png', 5934, 'png', 'btn_giveup.png', 0, '', '2023-03-24 19:38:40', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (9, 5, '1i7cxcd1zyncreldm9hvnlk200fyrrts.png', 5934, 'png', 'btn_giveup.png', 0, '', '2023-03-24 19:54:38', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (10, 5, '1i7cxcd1zyncreleojrozvc300v1cpi6.png', 5934, 'png', 'btn_giveup.png', 0, '', '2023-03-24 19:56:00', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (11, 5, '1i7cxcd2035crelfb1sk6w8200n5d4wo.jpg', 87143, 'jpg', 'fv.jpg', 0, '', '2023-03-24 19:56:49', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (12, 5, '1i7cxcd207ocrelh6uwlio820072iry7.png', 3896, 'png', 'img_fangzhu.png', 0, '', '2023-03-24 19:59:18', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (13, 5, '1i7cxcd207ocreli8l7zk8o300mlhfiu.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 20:00:45', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (14, 5, '1i7cxcd20nwcrelnv5ou7g02003p1e7z.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 20:08:00', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (15, 5, '1i7cxcd20nwcrelonhxyd34300sbvxwm.png', 3896, 'png', 'img_fangzhu.png', 0, '', '2023-03-24 20:09:01', '2023-03-24 20:11:09');
INSERT INTO `sys_file` VALUES (16, 5, '1i7cxcd20nwcrelq1lydm2w4009rl3m7.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 20:10:51', '2023-03-24 20:11:14');
INSERT INTO `sys_file` VALUES (17, 5, '1i7cxcd20nwcrelqi5sb4f47002d0aoi.jpg', 87143, 'jpg', 'fv.jpg', 0, '', '2023-03-24 20:11:28', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (18, 5, '1i7cxcd20nwcrelqi5rvgdk500gah3sz.png', 1578, 'png', 'bg_head.png', 0, '', '2023-03-24 20:11:29', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (19, 5, '1i7cxcd20nwcrelqi5s5dmo600yva0mu.png', 49904, 'png', 'bg_result.png', 0, '', '2023-03-24 20:11:26', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (20, 5, '1i7cxcd20nwcrelqi5stnuw800ayb56u.png', 5934, 'png', 'btn_giveup.png', 0, '', '2023-03-24 20:11:30', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (21, 5, '1i7cxcddh80crigwigj3tsw200d5oxhu.png', 1578, 'png', 'bg_head.png', 0, '', '2023-03-29 09:14:51', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (22, 5, '1i7cxcd1mttcrjsq9ghfbc8200hnfse7.png', 2080, 'png', 'bg_fee.png', 0, '', '2023-03-30 22:43:32', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (23, 5, '3e0hr5015q6cta9iloy1bq0200fi2yal.png', 37523, 'png', '10muxqn141.png', 0, '', '2023-06-12 08:58:08', '2023-06-12 21:45:09');
INSERT INTO `sys_file` VALUES (24, 5, '1cp68l38q60ctb707bejkrs2001kdu5y.png', 37523, 'png', '10muxqn141.png', 0, '', '2023-06-13 11:12:44', '2023-06-13 11:13:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_file_driver
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_driver`;
CREATE TABLE `sys_file_driver` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
  `driver` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储器',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `master` bit(1) NOT NULL COMMENT '是否为主配置',
  `config` json NOT NULL COMMENT '存储配置',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件驱动表';

-- ----------------------------
-- Records of sys_file_driver
-- ----------------------------
BEGIN;
INSERT INTO `sys_file_driver` VALUES (4, '数据库', 'local', '我是数据库', b'0', '{\"path\": \"/Users/kennyli/Documents/dev\", \"@class\": \"cn.iocoder.yudao.framework.file.core.client.db.DBFileClientConfig\", \"domain\": \"http://127.0.0.1:48080\"}', '', NULL, 'admin', '2023-03-23 20:55:07', '2023-05-24 15:44:00');
INSERT INTO `sys_file_driver` VALUES (5, '本地磁盘', 'local', '测试下本地存储', b'1', '{\"path\": \"/Users/kennyli/Documents/dev/gadmin/public\", \"isDev\": \"1\", \"domain\": \"http://localhost:8000/public\"}', '', NULL, 'admin', '2023-06-12 21:45:00', NULL);
INSERT INTO `sys_file_driver` VALUES (11, 'S3 - 七牛云', 'qiniu', NULL, b'0', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', NULL, '', '2023-03-23 16:13:56', '2023-05-24 15:44:00');
INSERT INTO `sys_file_driver` VALUES (15, 'S3 - 七牛云', 'qiniu', '', b'0', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', NULL, '', NULL, '2023-05-24 15:44:00');
INSERT INTO `sys_file_driver` VALUES (16, 'S3 - 七牛云', 'qiniu', '', b'0', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', NULL, '', NULL, '2023-05-24 15:44:00');
INSERT INTO `sys_file_driver` VALUES (17, 'S3 - 七牛云', 'qiniu', '', b'0', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', NULL, '', NULL, '2023-03-23 17:17:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `invoke_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '调用目标参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cron执行表达式',
  `max_retry` int DEFAULT '3' COMMENT '重试次数',
  `retry_delay` int DEFAULT '3' COMMENT '重试间隔',
  `is_record_log` bit(1) DEFAULT NULL COMMENT '是否记录执行日志',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'default', 'task:system:noparam', '', '*/1 * * * *', 1, 3, b'1', '0', '', NULL, 'admin', '2023-06-13 10:12:59', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'default', 'task:system:param', 'aaaaa', '*/1 * * * *', 3, 3, b'0', '0', 'admin', '2021-01-26 01:36:41', 'admin', '2023-06-13 10:13:09', '');
INSERT INTO `sys_job` VALUES (3, '管理系统登录日志', 'default', 'task:system:loginInfor', '100', '@every 10s', 3, 3, b'1', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2023-06-13 10:13:42', '');
INSERT INTO `sys_job` VALUES (4, '管理系统操作日志', 'default', 'task:system:operlog', '100', '@every 10s', 1, 3, b'1', '0', 'admin', '2021-06-03 20:57:01', 'admin', '2023-06-13 10:14:48', '');
INSERT INTO `sys_job` VALUES (5, '同步定时任务日志', 'default', 'task:system:joblog', '100', '@every 10s', 1, 3, b'1', '0', 'admin', '2021-06-03 20:57:01', 'admin', '2023-06-13 10:14:57', '');
INSERT INTO `sys_job` VALUES (9, '数据库备份', 'default', 'task:system:backup', '', '@daily', 5, 5, b'1', '0', 'admin', '2023-06-13 10:22:25', '', '2023-06-13 10:22:25', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `invoke_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '调用目标参数',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4665 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` VALUES (1, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (2, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (3, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (4, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (5, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (6, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (7, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (8, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (9, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (10, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (11, 'task:system:param', 'aaaaa', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (12, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (13, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (14, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (15, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (16, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (17, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (18, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (19, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (20, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (21, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (22, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (23, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (24, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (25, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (26, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (27, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (28, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (29, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (30, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (31, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (32, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (33, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (34, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (35, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (36, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (37, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (38, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (39, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (40, 'task:system:loginInfor', '100', '耗时 24 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (41, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (42, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (43, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (44, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (45, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (46, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (47, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (48, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (49, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (50, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (51, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (52, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (53, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (54, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (55, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (56, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (57, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (58, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (59, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (60, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (61, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (62, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (63, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (64, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (65, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (66, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (67, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (68, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (69, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (70, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (71, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (72, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (73, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (74, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (75, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (76, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (77, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (78, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (79, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (80, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (81, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (82, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (83, 'task:system:joblog', '100', '耗时 40 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (84, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (85, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (86, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (87, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (88, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (89, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (90, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (91, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (92, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (93, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (94, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (95, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (96, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (97, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (98, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (99, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (100, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (101, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (102, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (103, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (104, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (105, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (106, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (107, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (108, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (109, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (110, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (111, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (112, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (113, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (114, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (115, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (116, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (117, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (118, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (119, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (120, 'task:system:joblog', '100', '耗时 48 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (121, 'task:system:joblog', '100', '耗时 48 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (122, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (123, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (124, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (125, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (126, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (127, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (128, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (129, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (130, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (131, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (132, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (133, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (134, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (135, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (136, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (137, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (138, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (139, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (140, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (141, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (142, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (143, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (144, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (145, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (146, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (147, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (148, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (149, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (150, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (151, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (152, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (153, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (154, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (155, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (156, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (157, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (158, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (159, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (160, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (161, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (162, 'task:system:joblog', '100', '耗时 16 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (163, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (164, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:52');
INSERT INTO `sys_job_log` VALUES (165, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (166, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (167, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (168, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (169, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (170, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (171, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (172, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (173, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (174, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (175, 'task:system:operlog', '100', '耗时 113 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (176, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (177, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (178, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (179, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (180, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (181, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (182, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (183, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (184, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (185, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (186, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (187, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (188, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (189, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (190, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (191, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (192, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (193, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (194, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (195, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (196, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (197, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (198, 'task:system:joblog', '100', '耗时 16 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (199, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (200, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (201, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (202, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (203, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (204, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (205, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (206, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (207, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (208, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (209, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (210, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (211, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (212, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (213, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (214, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (215, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (216, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (217, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (218, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (219, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (220, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (221, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (222, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (223, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (224, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (225, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (226, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (227, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (228, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (229, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (230, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (231, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (232, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (233, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (234, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (235, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (236, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (237, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (238, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (239, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (240, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (241, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (242, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (243, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (244, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (245, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (246, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (247, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (248, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (249, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (250, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (251, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (252, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (253, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (254, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (255, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (256, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (257, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (258, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (259, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (260, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (261, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (262, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (263, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (264, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (265, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (266, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (267, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (268, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (269, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (270, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (271, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (272, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (273, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (274, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (275, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (276, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (277, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (278, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (279, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (280, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (281, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (282, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (283, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (284, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (285, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (286, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (287, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (288, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (289, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (290, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (291, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (292, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (293, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (294, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (295, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (296, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (297, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (298, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (299, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (300, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (301, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (302, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (303, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (304, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (305, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (306, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (307, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (308, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (309, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (310, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (311, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (312, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (313, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (314, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (315, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (316, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (317, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (318, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (319, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (320, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (321, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (322, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (323, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (324, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (325, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (326, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (327, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (328, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (329, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (330, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (331, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (332, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (333, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (334, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (335, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (336, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (337, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (338, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (339, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (340, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (341, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (342, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (343, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (344, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (345, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (346, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (347, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (348, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (349, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (350, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (351, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (352, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (353, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (354, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (355, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (356, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (357, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (358, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (359, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (360, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (361, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (362, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (363, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (364, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (365, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (366, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (367, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (368, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (369, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (370, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (371, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (372, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (373, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (374, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (375, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (376, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (377, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (378, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (379, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (380, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (381, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (382, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (383, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (384, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (385, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (386, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (387, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (388, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (389, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (390, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (391, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (392, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (393, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (394, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (395, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (396, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (397, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (398, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (399, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (400, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (401, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (402, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (403, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (404, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (405, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (406, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (407, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (408, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (409, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (410, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (411, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (412, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (413, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (414, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (415, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (416, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (417, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (418, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (419, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (420, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (421, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (422, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (423, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (424, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (425, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (426, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (427, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (428, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (429, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (430, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (431, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (432, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (433, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (434, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (435, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (436, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (437, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (438, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (439, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (440, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (441, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (442, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (443, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (444, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (445, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (446, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (447, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (448, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (449, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (450, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (451, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (452, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (453, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (454, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (455, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (456, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (457, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (458, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (459, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (460, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (461, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (462, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (463, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (464, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (465, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (466, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (467, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (468, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (469, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (470, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (471, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (472, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (473, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (474, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (475, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (476, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (477, 'task:system:joblog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (478, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (479, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (480, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:10:53');
INSERT INTO `sys_job_log` VALUES (481, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (482, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (483, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (484, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (485, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (486, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:02');
INSERT INTO `sys_job_log` VALUES (487, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:12');
INSERT INTO `sys_job_log` VALUES (488, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:11:12');
INSERT INTO `sys_job_log` VALUES (489, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:12');
INSERT INTO `sys_job_log` VALUES (490, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:23');
INSERT INTO `sys_job_log` VALUES (491, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:23');
INSERT INTO `sys_job_log` VALUES (492, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:11:23');
INSERT INTO `sys_job_log` VALUES (493, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:23');
INSERT INTO `sys_job_log` VALUES (494, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:23');
INSERT INTO `sys_job_log` VALUES (495, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 11:11:32');
INSERT INTO `sys_job_log` VALUES (496, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:32');
INSERT INTO `sys_job_log` VALUES (497, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:42');
INSERT INTO `sys_job_log` VALUES (498, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:42');
INSERT INTO `sys_job_log` VALUES (499, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:11:42');
INSERT INTO `sys_job_log` VALUES (500, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:11:52');
INSERT INTO `sys_job_log` VALUES (501, 'task:system:joblog', '100', '耗时 24 毫秒', '0', '', '2023-06-13 11:11:52');
INSERT INTO `sys_job_log` VALUES (502, 'task:system:loginInfor', '100', '耗时 26 毫秒', '0', '', '2023-06-13 11:11:52');
INSERT INTO `sys_job_log` VALUES (503, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:11:52');
INSERT INTO `sys_job_log` VALUES (504, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:02');
INSERT INTO `sys_job_log` VALUES (505, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:02');
INSERT INTO `sys_job_log` VALUES (506, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:12:02');
INSERT INTO `sys_job_log` VALUES (507, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:02');
INSERT INTO `sys_job_log` VALUES (508, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:02');
INSERT INTO `sys_job_log` VALUES (509, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:12');
INSERT INTO `sys_job_log` VALUES (510, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:12');
INSERT INTO `sys_job_log` VALUES (511, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:12:12');
INSERT INTO `sys_job_log` VALUES (512, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:12');
INSERT INTO `sys_job_log` VALUES (513, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:22');
INSERT INTO `sys_job_log` VALUES (514, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:12:22');
INSERT INTO `sys_job_log` VALUES (515, 'task:system:operlog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:12:22');
INSERT INTO `sys_job_log` VALUES (516, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:22');
INSERT INTO `sys_job_log` VALUES (517, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:22');
INSERT INTO `sys_job_log` VALUES (518, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:32');
INSERT INTO `sys_job_log` VALUES (519, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:12:32');
INSERT INTO `sys_job_log` VALUES (520, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:32');
INSERT INTO `sys_job_log` VALUES (521, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:12:42');
INSERT INTO `sys_job_log` VALUES (522, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:12:42');
INSERT INTO `sys_job_log` VALUES (523, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:12:42');
INSERT INTO `sys_job_log` VALUES (524, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:42');
INSERT INTO `sys_job_log` VALUES (525, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:52');
INSERT INTO `sys_job_log` VALUES (526, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:12:52');
INSERT INTO `sys_job_log` VALUES (527, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:12:52');
INSERT INTO `sys_job_log` VALUES (528, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:02');
INSERT INTO `sys_job_log` VALUES (529, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:13:02');
INSERT INTO `sys_job_log` VALUES (530, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:13:02');
INSERT INTO `sys_job_log` VALUES (531, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:02');
INSERT INTO `sys_job_log` VALUES (532, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:13:02');
INSERT INTO `sys_job_log` VALUES (533, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:13:12');
INSERT INTO `sys_job_log` VALUES (534, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:13:12');
INSERT INTO `sys_job_log` VALUES (535, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:13:12');
INSERT INTO `sys_job_log` VALUES (536, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:12');
INSERT INTO `sys_job_log` VALUES (537, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:22');
INSERT INTO `sys_job_log` VALUES (538, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:22');
INSERT INTO `sys_job_log` VALUES (539, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:13:22');
INSERT INTO `sys_job_log` VALUES (540, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:22');
INSERT INTO `sys_job_log` VALUES (541, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:32');
INSERT INTO `sys_job_log` VALUES (542, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:32');
INSERT INTO `sys_job_log` VALUES (543, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:13:32');
INSERT INTO `sys_job_log` VALUES (544, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:32');
INSERT INTO `sys_job_log` VALUES (545, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:32');
INSERT INTO `sys_job_log` VALUES (546, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:42');
INSERT INTO `sys_job_log` VALUES (547, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:13:42');
INSERT INTO `sys_job_log` VALUES (548, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:42');
INSERT INTO `sys_job_log` VALUES (549, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:42');
INSERT INTO `sys_job_log` VALUES (550, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:52');
INSERT INTO `sys_job_log` VALUES (551, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:13:52');
INSERT INTO `sys_job_log` VALUES (552, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:13:52');
INSERT INTO `sys_job_log` VALUES (553, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (554, 'task:system:operlog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (555, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (556, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (557, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (558, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:02');
INSERT INTO `sys_job_log` VALUES (559, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:12');
INSERT INTO `sys_job_log` VALUES (560, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:14:12');
INSERT INTO `sys_job_log` VALUES (561, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:12');
INSERT INTO `sys_job_log` VALUES (562, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:22');
INSERT INTO `sys_job_log` VALUES (563, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:22');
INSERT INTO `sys_job_log` VALUES (564, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:14:22');
INSERT INTO `sys_job_log` VALUES (565, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:22');
INSERT INTO `sys_job_log` VALUES (566, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:32');
INSERT INTO `sys_job_log` VALUES (567, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:32');
INSERT INTO `sys_job_log` VALUES (568, 'task:system:joblog', '100', '耗时 16 毫秒', '0', '', '2023-06-13 11:14:32');
INSERT INTO `sys_job_log` VALUES (569, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:32');
INSERT INTO `sys_job_log` VALUES (570, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:32');
INSERT INTO `sys_job_log` VALUES (571, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:42');
INSERT INTO `sys_job_log` VALUES (572, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:14:42');
INSERT INTO `sys_job_log` VALUES (573, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:14:42');
INSERT INTO `sys_job_log` VALUES (574, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:14:52');
INSERT INTO `sys_job_log` VALUES (575, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:52');
INSERT INTO `sys_job_log` VALUES (576, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:14:52');
INSERT INTO `sys_job_log` VALUES (577, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:14:52');
INSERT INTO `sys_job_log` VALUES (578, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:02');
INSERT INTO `sys_job_log` VALUES (579, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:15:02');
INSERT INTO `sys_job_log` VALUES (580, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:15:02');
INSERT INTO `sys_job_log` VALUES (581, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:02');
INSERT INTO `sys_job_log` VALUES (582, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:12');
INSERT INTO `sys_job_log` VALUES (583, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:12');
INSERT INTO `sys_job_log` VALUES (584, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:15:12');
INSERT INTO `sys_job_log` VALUES (585, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:12');
INSERT INTO `sys_job_log` VALUES (586, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:22');
INSERT INTO `sys_job_log` VALUES (587, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:15:22');
INSERT INTO `sys_job_log` VALUES (588, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:15:22');
INSERT INTO `sys_job_log` VALUES (589, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:22');
INSERT INTO `sys_job_log` VALUES (590, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:32');
INSERT INTO `sys_job_log` VALUES (591, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:32');
INSERT INTO `sys_job_log` VALUES (592, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:15:32');
INSERT INTO `sys_job_log` VALUES (593, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:42');
INSERT INTO `sys_job_log` VALUES (594, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:42');
INSERT INTO `sys_job_log` VALUES (595, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:15:42');
INSERT INTO `sys_job_log` VALUES (596, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:42');
INSERT INTO `sys_job_log` VALUES (597, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:52');
INSERT INTO `sys_job_log` VALUES (598, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:15:52');
INSERT INTO `sys_job_log` VALUES (599, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:15:52');
INSERT INTO `sys_job_log` VALUES (600, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:15:52');
INSERT INTO `sys_job_log` VALUES (601, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:15:52');
INSERT INTO `sys_job_log` VALUES (602, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:16:02');
INSERT INTO `sys_job_log` VALUES (603, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:16:02');
INSERT INTO `sys_job_log` VALUES (604, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:02');
INSERT INTO `sys_job_log` VALUES (605, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:16:02');
INSERT INTO `sys_job_log` VALUES (606, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:16:12');
INSERT INTO `sys_job_log` VALUES (607, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 11:16:12');
INSERT INTO `sys_job_log` VALUES (608, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:16:12');
INSERT INTO `sys_job_log` VALUES (609, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:12');
INSERT INTO `sys_job_log` VALUES (610, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:22');
INSERT INTO `sys_job_log` VALUES (611, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:22');
INSERT INTO `sys_job_log` VALUES (612, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:16:22');
INSERT INTO `sys_job_log` VALUES (613, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:16:22');
INSERT INTO `sys_job_log` VALUES (614, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:16:32');
INSERT INTO `sys_job_log` VALUES (615, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:16:32');
INSERT INTO `sys_job_log` VALUES (616, 'task:system:operlog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:16:32');
INSERT INTO `sys_job_log` VALUES (617, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:32');
INSERT INTO `sys_job_log` VALUES (618, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:42');
INSERT INTO `sys_job_log` VALUES (619, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:42');
INSERT INTO `sys_job_log` VALUES (620, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:16:42');
INSERT INTO `sys_job_log` VALUES (621, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:42');
INSERT INTO `sys_job_log` VALUES (622, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:52');
INSERT INTO `sys_job_log` VALUES (623, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:52');
INSERT INTO `sys_job_log` VALUES (624, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:16:52');
INSERT INTO `sys_job_log` VALUES (625, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:16:52');
INSERT INTO `sys_job_log` VALUES (626, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:02');
INSERT INTO `sys_job_log` VALUES (627, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:02');
INSERT INTO `sys_job_log` VALUES (628, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:17:02');
INSERT INTO `sys_job_log` VALUES (629, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:02');
INSERT INTO `sys_job_log` VALUES (630, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:12');
INSERT INTO `sys_job_log` VALUES (631, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:17:12');
INSERT INTO `sys_job_log` VALUES (632, 'task:system:operlog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:17:12');
INSERT INTO `sys_job_log` VALUES (633, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:12');
INSERT INTO `sys_job_log` VALUES (634, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:12');
INSERT INTO `sys_job_log` VALUES (635, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:22');
INSERT INTO `sys_job_log` VALUES (636, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:17:22');
INSERT INTO `sys_job_log` VALUES (637, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:22');
INSERT INTO `sys_job_log` VALUES (638, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:22');
INSERT INTO `sys_job_log` VALUES (639, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:32');
INSERT INTO `sys_job_log` VALUES (640, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:17:32');
INSERT INTO `sys_job_log` VALUES (641, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:32');
INSERT INTO `sys_job_log` VALUES (642, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:42');
INSERT INTO `sys_job_log` VALUES (643, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:42');
INSERT INTO `sys_job_log` VALUES (644, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:17:42');
INSERT INTO `sys_job_log` VALUES (645, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:17:52');
INSERT INTO `sys_job_log` VALUES (646, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:17:52');
INSERT INTO `sys_job_log` VALUES (647, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:17:52');
INSERT INTO `sys_job_log` VALUES (648, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:17:52');
INSERT INTO `sys_job_log` VALUES (649, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:02');
INSERT INTO `sys_job_log` VALUES (650, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:02');
INSERT INTO `sys_job_log` VALUES (651, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:18:02');
INSERT INTO `sys_job_log` VALUES (652, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:02');
INSERT INTO `sys_job_log` VALUES (653, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:02');
INSERT INTO `sys_job_log` VALUES (654, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:12');
INSERT INTO `sys_job_log` VALUES (655, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:12');
INSERT INTO `sys_job_log` VALUES (656, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:18:12');
INSERT INTO `sys_job_log` VALUES (657, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:18:22');
INSERT INTO `sys_job_log` VALUES (658, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:18:22');
INSERT INTO `sys_job_log` VALUES (659, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:18:22');
INSERT INTO `sys_job_log` VALUES (660, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:18:32');
INSERT INTO `sys_job_log` VALUES (661, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:18:32');
INSERT INTO `sys_job_log` VALUES (662, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:18:32');
INSERT INTO `sys_job_log` VALUES (663, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:32');
INSERT INTO `sys_job_log` VALUES (664, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:42');
INSERT INTO `sys_job_log` VALUES (665, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:18:42');
INSERT INTO `sys_job_log` VALUES (666, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:18:42');
INSERT INTO `sys_job_log` VALUES (667, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:42');
INSERT INTO `sys_job_log` VALUES (668, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:52');
INSERT INTO `sys_job_log` VALUES (669, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:52');
INSERT INTO `sys_job_log` VALUES (670, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:18:52');
INSERT INTO `sys_job_log` VALUES (671, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:18:52');
INSERT INTO `sys_job_log` VALUES (672, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:02');
INSERT INTO `sys_job_log` VALUES (673, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:02');
INSERT INTO `sys_job_log` VALUES (674, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:19:02');
INSERT INTO `sys_job_log` VALUES (675, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:02');
INSERT INTO `sys_job_log` VALUES (676, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:02');
INSERT INTO `sys_job_log` VALUES (677, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:12');
INSERT INTO `sys_job_log` VALUES (678, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:12');
INSERT INTO `sys_job_log` VALUES (679, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 11:19:12');
INSERT INTO `sys_job_log` VALUES (680, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:12');
INSERT INTO `sys_job_log` VALUES (681, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:12');
INSERT INTO `sys_job_log` VALUES (682, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:22');
INSERT INTO `sys_job_log` VALUES (683, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:19:22');
INSERT INTO `sys_job_log` VALUES (684, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:22');
INSERT INTO `sys_job_log` VALUES (685, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:22');
INSERT INTO `sys_job_log` VALUES (686, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:32');
INSERT INTO `sys_job_log` VALUES (687, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:19:32');
INSERT INTO `sys_job_log` VALUES (688, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:32');
INSERT INTO `sys_job_log` VALUES (689, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:42');
INSERT INTO `sys_job_log` VALUES (690, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:19:42');
INSERT INTO `sys_job_log` VALUES (691, 'task:system:operlog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:19:42');
INSERT INTO `sys_job_log` VALUES (692, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:42');
INSERT INTO `sys_job_log` VALUES (693, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:42');
INSERT INTO `sys_job_log` VALUES (694, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:19:52');
INSERT INTO `sys_job_log` VALUES (695, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:19:52');
INSERT INTO `sys_job_log` VALUES (696, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:19:52');
INSERT INTO `sys_job_log` VALUES (697, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:02');
INSERT INTO `sys_job_log` VALUES (698, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:02');
INSERT INTO `sys_job_log` VALUES (699, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:20:02');
INSERT INTO `sys_job_log` VALUES (700, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:02');
INSERT INTO `sys_job_log` VALUES (701, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:02');
INSERT INTO `sys_job_log` VALUES (702, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:12');
INSERT INTO `sys_job_log` VALUES (703, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:12');
INSERT INTO `sys_job_log` VALUES (704, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:20:12');
INSERT INTO `sys_job_log` VALUES (705, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:22');
INSERT INTO `sys_job_log` VALUES (706, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:22');
INSERT INTO `sys_job_log` VALUES (707, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:20:22');
INSERT INTO `sys_job_log` VALUES (708, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:32');
INSERT INTO `sys_job_log` VALUES (709, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:32');
INSERT INTO `sys_job_log` VALUES (710, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:20:32');
INSERT INTO `sys_job_log` VALUES (711, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:32');
INSERT INTO `sys_job_log` VALUES (712, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:42');
INSERT INTO `sys_job_log` VALUES (713, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:42');
INSERT INTO `sys_job_log` VALUES (714, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:20:42');
INSERT INTO `sys_job_log` VALUES (715, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:42');
INSERT INTO `sys_job_log` VALUES (716, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:42');
INSERT INTO `sys_job_log` VALUES (717, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:58');
INSERT INTO `sys_job_log` VALUES (718, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:20:58');
INSERT INTO `sys_job_log` VALUES (719, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:58');
INSERT INTO `sys_job_log` VALUES (720, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:20:58');
INSERT INTO `sys_job_log` VALUES (721, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:08');
INSERT INTO `sys_job_log` VALUES (722, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:21:08');
INSERT INTO `sys_job_log` VALUES (723, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:08');
INSERT INTO `sys_job_log` VALUES (724, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:08');
INSERT INTO `sys_job_log` VALUES (725, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:18');
INSERT INTO `sys_job_log` VALUES (726, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:21:18');
INSERT INTO `sys_job_log` VALUES (727, 'task:system:loginInfor', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:21:18');
INSERT INTO `sys_job_log` VALUES (728, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:18');
INSERT INTO `sys_job_log` VALUES (729, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:18');
INSERT INTO `sys_job_log` VALUES (730, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:21:28');
INSERT INTO `sys_job_log` VALUES (731, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:28');
INSERT INTO `sys_job_log` VALUES (732, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:28');
INSERT INTO `sys_job_log` VALUES (733, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:21:38');
INSERT INTO `sys_job_log` VALUES (734, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:38');
INSERT INTO `sys_job_log` VALUES (735, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:21:48');
INSERT INTO `sys_job_log` VALUES (736, 'task:system:operlog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:21:48');
INSERT INTO `sys_job_log` VALUES (737, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:48');
INSERT INTO `sys_job_log` VALUES (738, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:58');
INSERT INTO `sys_job_log` VALUES (739, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:21:58');
INSERT INTO `sys_job_log` VALUES (740, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:21:58');
INSERT INTO `sys_job_log` VALUES (741, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:08');
INSERT INTO `sys_job_log` VALUES (742, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:08');
INSERT INTO `sys_job_log` VALUES (743, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:22:08');
INSERT INTO `sys_job_log` VALUES (744, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:08');
INSERT INTO `sys_job_log` VALUES (745, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:22:08');
INSERT INTO `sys_job_log` VALUES (746, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:22:18');
INSERT INTO `sys_job_log` VALUES (747, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:18');
INSERT INTO `sys_job_log` VALUES (748, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:22:18');
INSERT INTO `sys_job_log` VALUES (749, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:18');
INSERT INTO `sys_job_log` VALUES (750, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:28');
INSERT INTO `sys_job_log` VALUES (751, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:28');
INSERT INTO `sys_job_log` VALUES (752, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:22:28');
INSERT INTO `sys_job_log` VALUES (753, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:28');
INSERT INTO `sys_job_log` VALUES (754, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:38');
INSERT INTO `sys_job_log` VALUES (755, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:38');
INSERT INTO `sys_job_log` VALUES (756, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:22:38');
INSERT INTO `sys_job_log` VALUES (757, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:38');
INSERT INTO `sys_job_log` VALUES (758, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:48');
INSERT INTO `sys_job_log` VALUES (759, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:48');
INSERT INTO `sys_job_log` VALUES (760, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:22:48');
INSERT INTO `sys_job_log` VALUES (761, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:48');
INSERT INTO `sys_job_log` VALUES (762, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:58');
INSERT INTO `sys_job_log` VALUES (763, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:22:58');
INSERT INTO `sys_job_log` VALUES (764, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:22:58');
INSERT INTO `sys_job_log` VALUES (765, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:22:58');
INSERT INTO `sys_job_log` VALUES (766, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:08');
INSERT INTO `sys_job_log` VALUES (767, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:08');
INSERT INTO `sys_job_log` VALUES (768, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:23:08');
INSERT INTO `sys_job_log` VALUES (769, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:08');
INSERT INTO `sys_job_log` VALUES (770, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:08');
INSERT INTO `sys_job_log` VALUES (771, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:18');
INSERT INTO `sys_job_log` VALUES (772, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:18');
INSERT INTO `sys_job_log` VALUES (773, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:23:18');
INSERT INTO `sys_job_log` VALUES (774, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:18');
INSERT INTO `sys_job_log` VALUES (775, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:28');
INSERT INTO `sys_job_log` VALUES (776, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:28');
INSERT INTO `sys_job_log` VALUES (777, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:23:28');
INSERT INTO `sys_job_log` VALUES (778, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:28');
INSERT INTO `sys_job_log` VALUES (779, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:38');
INSERT INTO `sys_job_log` VALUES (780, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:38');
INSERT INTO `sys_job_log` VALUES (781, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:23:38');
INSERT INTO `sys_job_log` VALUES (782, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:38');
INSERT INTO `sys_job_log` VALUES (783, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:38');
INSERT INTO `sys_job_log` VALUES (784, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:23:48');
INSERT INTO `sys_job_log` VALUES (785, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:23:48');
INSERT INTO `sys_job_log` VALUES (786, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:48');
INSERT INTO `sys_job_log` VALUES (787, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:23:58');
INSERT INTO `sys_job_log` VALUES (788, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:23:58');
INSERT INTO `sys_job_log` VALUES (789, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:24:08');
INSERT INTO `sys_job_log` VALUES (790, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:24:08');
INSERT INTO `sys_job_log` VALUES (791, 'task:system:operlog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:24:08');
INSERT INTO `sys_job_log` VALUES (792, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:24:08');
INSERT INTO `sys_job_log` VALUES (793, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:08');
INSERT INTO `sys_job_log` VALUES (794, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:18');
INSERT INTO `sys_job_log` VALUES (795, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:18');
INSERT INTO `sys_job_log` VALUES (796, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:24:18');
INSERT INTO `sys_job_log` VALUES (797, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:28');
INSERT INTO `sys_job_log` VALUES (798, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:24:28');
INSERT INTO `sys_job_log` VALUES (799, 'task:system:operlog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:24:28');
INSERT INTO `sys_job_log` VALUES (800, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:28');
INSERT INTO `sys_job_log` VALUES (801, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:38');
INSERT INTO `sys_job_log` VALUES (802, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:38');
INSERT INTO `sys_job_log` VALUES (803, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:24:38');
INSERT INTO `sys_job_log` VALUES (804, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:38');
INSERT INTO `sys_job_log` VALUES (805, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:48');
INSERT INTO `sys_job_log` VALUES (806, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:48');
INSERT INTO `sys_job_log` VALUES (807, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:24:48');
INSERT INTO `sys_job_log` VALUES (808, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:24:48');
INSERT INTO `sys_job_log` VALUES (809, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:24:58');
INSERT INTO `sys_job_log` VALUES (810, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:24:58');
INSERT INTO `sys_job_log` VALUES (811, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:24:58');
INSERT INTO `sys_job_log` VALUES (812, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:58');
INSERT INTO `sys_job_log` VALUES (813, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:24:58');
INSERT INTO `sys_job_log` VALUES (814, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:25:08');
INSERT INTO `sys_job_log` VALUES (815, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:25:08');
INSERT INTO `sys_job_log` VALUES (816, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:08');
INSERT INTO `sys_job_log` VALUES (817, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:08');
INSERT INTO `sys_job_log` VALUES (818, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:18');
INSERT INTO `sys_job_log` VALUES (819, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:25:18');
INSERT INTO `sys_job_log` VALUES (820, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:18');
INSERT INTO `sys_job_log` VALUES (821, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:28');
INSERT INTO `sys_job_log` VALUES (822, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:28');
INSERT INTO `sys_job_log` VALUES (823, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:25:28');
INSERT INTO `sys_job_log` VALUES (824, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:38');
INSERT INTO `sys_job_log` VALUES (825, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:38');
INSERT INTO `sys_job_log` VALUES (826, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:25:38');
INSERT INTO `sys_job_log` VALUES (827, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:38');
INSERT INTO `sys_job_log` VALUES (828, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:38');
INSERT INTO `sys_job_log` VALUES (829, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:25:48');
INSERT INTO `sys_job_log` VALUES (830, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:25:48');
INSERT INTO `sys_job_log` VALUES (831, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:25:48');
INSERT INTO `sys_job_log` VALUES (832, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:28:29');
INSERT INTO `sys_job_log` VALUES (833, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:28:29');
INSERT INTO `sys_job_log` VALUES (834, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:28:29');
INSERT INTO `sys_job_log` VALUES (835, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:39');
INSERT INTO `sys_job_log` VALUES (836, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:39');
INSERT INTO `sys_job_log` VALUES (837, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:28:39');
INSERT INTO `sys_job_log` VALUES (838, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:39');
INSERT INTO `sys_job_log` VALUES (839, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:39');
INSERT INTO `sys_job_log` VALUES (840, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:49');
INSERT INTO `sys_job_log` VALUES (841, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:28:49');
INSERT INTO `sys_job_log` VALUES (842, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:59');
INSERT INTO `sys_job_log` VALUES (843, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:28:59');
INSERT INTO `sys_job_log` VALUES (844, 'task:system:loginInfor', '100', '耗时 19 毫秒', '0', '', '2023-06-13 11:28:59');
INSERT INTO `sys_job_log` VALUES (845, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:59');
INSERT INTO `sys_job_log` VALUES (846, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:28:59');
INSERT INTO `sys_job_log` VALUES (847, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:29:09');
INSERT INTO `sys_job_log` VALUES (848, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:09');
INSERT INTO `sys_job_log` VALUES (849, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:19');
INSERT INTO `sys_job_log` VALUES (850, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:29:19');
INSERT INTO `sys_job_log` VALUES (851, 'task:system:operlog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:29:19');
INSERT INTO `sys_job_log` VALUES (852, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:19');
INSERT INTO `sys_job_log` VALUES (853, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:29');
INSERT INTO `sys_job_log` VALUES (854, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:29');
INSERT INTO `sys_job_log` VALUES (855, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:29:29');
INSERT INTO `sys_job_log` VALUES (856, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:39');
INSERT INTO `sys_job_log` VALUES (857, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:39');
INSERT INTO `sys_job_log` VALUES (858, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:29:39');
INSERT INTO `sys_job_log` VALUES (859, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:39');
INSERT INTO `sys_job_log` VALUES (860, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:49');
INSERT INTO `sys_job_log` VALUES (861, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:49');
INSERT INTO `sys_job_log` VALUES (862, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:29:49');
INSERT INTO `sys_job_log` VALUES (863, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:29:49');
INSERT INTO `sys_job_log` VALUES (864, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:49');
INSERT INTO `sys_job_log` VALUES (865, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:29:59');
INSERT INTO `sys_job_log` VALUES (866, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:59');
INSERT INTO `sys_job_log` VALUES (867, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:29:59');
INSERT INTO `sys_job_log` VALUES (868, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:30:09');
INSERT INTO `sys_job_log` VALUES (869, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:09');
INSERT INTO `sys_job_log` VALUES (870, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:09');
INSERT INTO `sys_job_log` VALUES (871, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:19');
INSERT INTO `sys_job_log` VALUES (872, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:19');
INSERT INTO `sys_job_log` VALUES (873, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:30:19');
INSERT INTO `sys_job_log` VALUES (874, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:19');
INSERT INTO `sys_job_log` VALUES (875, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:29');
INSERT INTO `sys_job_log` VALUES (876, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:29');
INSERT INTO `sys_job_log` VALUES (877, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:30:29');
INSERT INTO `sys_job_log` VALUES (878, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:29');
INSERT INTO `sys_job_log` VALUES (879, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:29');
INSERT INTO `sys_job_log` VALUES (880, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:39');
INSERT INTO `sys_job_log` VALUES (881, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:30:39');
INSERT INTO `sys_job_log` VALUES (882, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:39');
INSERT INTO `sys_job_log` VALUES (883, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:49');
INSERT INTO `sys_job_log` VALUES (884, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:49');
INSERT INTO `sys_job_log` VALUES (885, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:30:49');
INSERT INTO `sys_job_log` VALUES (886, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:49');
INSERT INTO `sys_job_log` VALUES (887, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:30:59');
INSERT INTO `sys_job_log` VALUES (888, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:59');
INSERT INTO `sys_job_log` VALUES (889, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:30:59');
INSERT INTO `sys_job_log` VALUES (890, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:30:59');
INSERT INTO `sys_job_log` VALUES (891, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (892, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (893, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (894, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (895, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (896, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:09');
INSERT INTO `sys_job_log` VALUES (897, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:19');
INSERT INTO `sys_job_log` VALUES (898, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:31:19');
INSERT INTO `sys_job_log` VALUES (899, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:19');
INSERT INTO `sys_job_log` VALUES (900, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:29');
INSERT INTO `sys_job_log` VALUES (901, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:29');
INSERT INTO `sys_job_log` VALUES (902, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 11:31:29');
INSERT INTO `sys_job_log` VALUES (903, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:29');
INSERT INTO `sys_job_log` VALUES (904, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:29');
INSERT INTO `sys_job_log` VALUES (905, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:39');
INSERT INTO `sys_job_log` VALUES (906, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:31:39');
INSERT INTO `sys_job_log` VALUES (907, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:39');
INSERT INTO `sys_job_log` VALUES (908, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:49');
INSERT INTO `sys_job_log` VALUES (909, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:49');
INSERT INTO `sys_job_log` VALUES (910, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:31:49');
INSERT INTO `sys_job_log` VALUES (911, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:49');
INSERT INTO `sys_job_log` VALUES (912, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:59');
INSERT INTO `sys_job_log` VALUES (913, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:31:59');
INSERT INTO `sys_job_log` VALUES (914, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:31:59');
INSERT INTO `sys_job_log` VALUES (915, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:31:59');
INSERT INTO `sys_job_log` VALUES (916, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (917, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (918, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (919, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (920, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (921, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:09');
INSERT INTO `sys_job_log` VALUES (922, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:19');
INSERT INTO `sys_job_log` VALUES (923, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:32:19');
INSERT INTO `sys_job_log` VALUES (924, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:19');
INSERT INTO `sys_job_log` VALUES (925, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:19');
INSERT INTO `sys_job_log` VALUES (926, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:29');
INSERT INTO `sys_job_log` VALUES (927, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:32:29');
INSERT INTO `sys_job_log` VALUES (928, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:29');
INSERT INTO `sys_job_log` VALUES (929, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:39');
INSERT INTO `sys_job_log` VALUES (930, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:32:39');
INSERT INTO `sys_job_log` VALUES (931, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:32:39');
INSERT INTO `sys_job_log` VALUES (932, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:39');
INSERT INTO `sys_job_log` VALUES (933, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:49');
INSERT INTO `sys_job_log` VALUES (934, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:49');
INSERT INTO `sys_job_log` VALUES (935, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:32:49');
INSERT INTO `sys_job_log` VALUES (936, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:49');
INSERT INTO `sys_job_log` VALUES (937, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:32:49');
INSERT INTO `sys_job_log` VALUES (938, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:32:59');
INSERT INTO `sys_job_log` VALUES (939, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:32:59');
INSERT INTO `sys_job_log` VALUES (940, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:32:59');
INSERT INTO `sys_job_log` VALUES (941, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (942, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (943, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (944, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (945, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (946, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:09');
INSERT INTO `sys_job_log` VALUES (947, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:19');
INSERT INTO `sys_job_log` VALUES (948, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:33:19');
INSERT INTO `sys_job_log` VALUES (949, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:19');
INSERT INTO `sys_job_log` VALUES (950, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:29');
INSERT INTO `sys_job_log` VALUES (951, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:29');
INSERT INTO `sys_job_log` VALUES (952, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:33:29');
INSERT INTO `sys_job_log` VALUES (953, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:29');
INSERT INTO `sys_job_log` VALUES (954, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:29');
INSERT INTO `sys_job_log` VALUES (955, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:39');
INSERT INTO `sys_job_log` VALUES (956, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:33:39');
INSERT INTO `sys_job_log` VALUES (957, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:39');
INSERT INTO `sys_job_log` VALUES (958, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:49');
INSERT INTO `sys_job_log` VALUES (959, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:49');
INSERT INTO `sys_job_log` VALUES (960, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:33:49');
INSERT INTO `sys_job_log` VALUES (961, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:33:49');
INSERT INTO `sys_job_log` VALUES (962, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:00');
INSERT INTO `sys_job_log` VALUES (963, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:00');
INSERT INTO `sys_job_log` VALUES (964, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:34:00');
INSERT INTO `sys_job_log` VALUES (965, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:00');
INSERT INTO `sys_job_log` VALUES (966, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:00');
INSERT INTO `sys_job_log` VALUES (967, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:09');
INSERT INTO `sys_job_log` VALUES (968, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:09');
INSERT INTO `sys_job_log` VALUES (969, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:34:09');
INSERT INTO `sys_job_log` VALUES (970, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:09');
INSERT INTO `sys_job_log` VALUES (971, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:19');
INSERT INTO `sys_job_log` VALUES (972, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:19');
INSERT INTO `sys_job_log` VALUES (973, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:34:19');
INSERT INTO `sys_job_log` VALUES (974, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:19');
INSERT INTO `sys_job_log` VALUES (975, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:19');
INSERT INTO `sys_job_log` VALUES (976, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:34:29');
INSERT INTO `sys_job_log` VALUES (977, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:29');
INSERT INTO `sys_job_log` VALUES (978, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:29');
INSERT INTO `sys_job_log` VALUES (979, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:34:39');
INSERT INTO `sys_job_log` VALUES (980, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:39');
INSERT INTO `sys_job_log` VALUES (981, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:49');
INSERT INTO `sys_job_log` VALUES (982, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:34:49');
INSERT INTO `sys_job_log` VALUES (983, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:34:49');
INSERT INTO `sys_job_log` VALUES (984, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:49');
INSERT INTO `sys_job_log` VALUES (985, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:59');
INSERT INTO `sys_job_log` VALUES (986, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:59');
INSERT INTO `sys_job_log` VALUES (987, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:34:59');
INSERT INTO `sys_job_log` VALUES (988, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:34:59');
INSERT INTO `sys_job_log` VALUES (989, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:35:09');
INSERT INTO `sys_job_log` VALUES (990, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:09');
INSERT INTO `sys_job_log` VALUES (991, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:35:09');
INSERT INTO `sys_job_log` VALUES (992, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:09');
INSERT INTO `sys_job_log` VALUES (993, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:35:09');
INSERT INTO `sys_job_log` VALUES (994, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:35:19');
INSERT INTO `sys_job_log` VALUES (995, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:35:19');
INSERT INTO `sys_job_log` VALUES (996, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:35:19');
INSERT INTO `sys_job_log` VALUES (997, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:19');
INSERT INTO `sys_job_log` VALUES (998, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:29');
INSERT INTO `sys_job_log` VALUES (999, 'task:system:operlog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:35:29');
INSERT INTO `sys_job_log` VALUES (1000, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:35:29');
INSERT INTO `sys_job_log` VALUES (1001, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:29');
INSERT INTO `sys_job_log` VALUES (1002, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:39');
INSERT INTO `sys_job_log` VALUES (1003, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:35:39');
INSERT INTO `sys_job_log` VALUES (1004, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:49');
INSERT INTO `sys_job_log` VALUES (1005, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:49');
INSERT INTO `sys_job_log` VALUES (1006, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:35:49');
INSERT INTO `sys_job_log` VALUES (1007, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:49');
INSERT INTO `sys_job_log` VALUES (1008, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:59');
INSERT INTO `sys_job_log` VALUES (1009, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:35:59');
INSERT INTO `sys_job_log` VALUES (1010, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:35:59');
INSERT INTO `sys_job_log` VALUES (1011, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:35:59');
INSERT INTO `sys_job_log` VALUES (1012, 'task:system:operlog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:36:09');
INSERT INTO `sys_job_log` VALUES (1013, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:36:09');
INSERT INTO `sys_job_log` VALUES (1014, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:09');
INSERT INTO `sys_job_log` VALUES (1015, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:09');
INSERT INTO `sys_job_log` VALUES (1016, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:19');
INSERT INTO `sys_job_log` VALUES (1017, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:19');
INSERT INTO `sys_job_log` VALUES (1018, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:36:19');
INSERT INTO `sys_job_log` VALUES (1019, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:19');
INSERT INTO `sys_job_log` VALUES (1020, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:19');
INSERT INTO `sys_job_log` VALUES (1021, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:29');
INSERT INTO `sys_job_log` VALUES (1022, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:36:29');
INSERT INTO `sys_job_log` VALUES (1023, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:29');
INSERT INTO `sys_job_log` VALUES (1024, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:39');
INSERT INTO `sys_job_log` VALUES (1025, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:39');
INSERT INTO `sys_job_log` VALUES (1026, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:36:39');
INSERT INTO `sys_job_log` VALUES (1027, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:49');
INSERT INTO `sys_job_log` VALUES (1028, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:49');
INSERT INTO `sys_job_log` VALUES (1029, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:36:49');
INSERT INTO `sys_job_log` VALUES (1030, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:36:49');
INSERT INTO `sys_job_log` VALUES (1031, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:36:49');
INSERT INTO `sys_job_log` VALUES (1032, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:36:59');
INSERT INTO `sys_job_log` VALUES (1033, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:36:59');
INSERT INTO `sys_job_log` VALUES (1034, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1035, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1036, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1037, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1038, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1039, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:09');
INSERT INTO `sys_job_log` VALUES (1040, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:19');
INSERT INTO `sys_job_log` VALUES (1041, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:37:19');
INSERT INTO `sys_job_log` VALUES (1042, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:19');
INSERT INTO `sys_job_log` VALUES (1043, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:29');
INSERT INTO `sys_job_log` VALUES (1044, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:29');
INSERT INTO `sys_job_log` VALUES (1045, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:37:29');
INSERT INTO `sys_job_log` VALUES (1046, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:29');
INSERT INTO `sys_job_log` VALUES (1047, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:39');
INSERT INTO `sys_job_log` VALUES (1048, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:39');
INSERT INTO `sys_job_log` VALUES (1049, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:37:39');
INSERT INTO `sys_job_log` VALUES (1050, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:39');
INSERT INTO `sys_job_log` VALUES (1051, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:49');
INSERT INTO `sys_job_log` VALUES (1052, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:49');
INSERT INTO `sys_job_log` VALUES (1053, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:37:49');
INSERT INTO `sys_job_log` VALUES (1054, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:49');
INSERT INTO `sys_job_log` VALUES (1055, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:59');
INSERT INTO `sys_job_log` VALUES (1056, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:37:59');
INSERT INTO `sys_job_log` VALUES (1057, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:37:59');
INSERT INTO `sys_job_log` VALUES (1058, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:37:59');
INSERT INTO `sys_job_log` VALUES (1059, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:09');
INSERT INTO `sys_job_log` VALUES (1060, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:09');
INSERT INTO `sys_job_log` VALUES (1061, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:38:09');
INSERT INTO `sys_job_log` VALUES (1062, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:09');
INSERT INTO `sys_job_log` VALUES (1063, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:09');
INSERT INTO `sys_job_log` VALUES (1064, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:19');
INSERT INTO `sys_job_log` VALUES (1065, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:19');
INSERT INTO `sys_job_log` VALUES (1066, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:38:19');
INSERT INTO `sys_job_log` VALUES (1067, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:19');
INSERT INTO `sys_job_log` VALUES (1068, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:29');
INSERT INTO `sys_job_log` VALUES (1069, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:29');
INSERT INTO `sys_job_log` VALUES (1070, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:38:29');
INSERT INTO `sys_job_log` VALUES (1071, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:29');
INSERT INTO `sys_job_log` VALUES (1072, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:29');
INSERT INTO `sys_job_log` VALUES (1073, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:38:39');
INSERT INTO `sys_job_log` VALUES (1074, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:39');
INSERT INTO `sys_job_log` VALUES (1075, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:39');
INSERT INTO `sys_job_log` VALUES (1076, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:49');
INSERT INTO `sys_job_log` VALUES (1077, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:38:49');
INSERT INTO `sys_job_log` VALUES (1078, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:59');
INSERT INTO `sys_job_log` VALUES (1079, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:59');
INSERT INTO `sys_job_log` VALUES (1080, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:38:59');
INSERT INTO `sys_job_log` VALUES (1081, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:38:59');
INSERT INTO `sys_job_log` VALUES (1082, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:09');
INSERT INTO `sys_job_log` VALUES (1083, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:09');
INSERT INTO `sys_job_log` VALUES (1084, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:39:09');
INSERT INTO `sys_job_log` VALUES (1085, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:09');
INSERT INTO `sys_job_log` VALUES (1086, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:19');
INSERT INTO `sys_job_log` VALUES (1087, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:19');
INSERT INTO `sys_job_log` VALUES (1088, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:39:19');
INSERT INTO `sys_job_log` VALUES (1089, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:19');
INSERT INTO `sys_job_log` VALUES (1090, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:29');
INSERT INTO `sys_job_log` VALUES (1091, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:29');
INSERT INTO `sys_job_log` VALUES (1092, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:39:29');
INSERT INTO `sys_job_log` VALUES (1093, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:29');
INSERT INTO `sys_job_log` VALUES (1094, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:29');
INSERT INTO `sys_job_log` VALUES (1095, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:39');
INSERT INTO `sys_job_log` VALUES (1096, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:39:39');
INSERT INTO `sys_job_log` VALUES (1097, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:39:39');
INSERT INTO `sys_job_log` VALUES (1098, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:49');
INSERT INTO `sys_job_log` VALUES (1099, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:39:49');
INSERT INTO `sys_job_log` VALUES (1100, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:39:49');
INSERT INTO `sys_job_log` VALUES (1101, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:49');
INSERT INTO `sys_job_log` VALUES (1102, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:59');
INSERT INTO `sys_job_log` VALUES (1103, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:39:59');
INSERT INTO `sys_job_log` VALUES (1104, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:39:59');
INSERT INTO `sys_job_log` VALUES (1105, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:09');
INSERT INTO `sys_job_log` VALUES (1106, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:09');
INSERT INTO `sys_job_log` VALUES (1107, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:40:09');
INSERT INTO `sys_job_log` VALUES (1108, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:09');
INSERT INTO `sys_job_log` VALUES (1109, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:09');
INSERT INTO `sys_job_log` VALUES (1110, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:19');
INSERT INTO `sys_job_log` VALUES (1111, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:19');
INSERT INTO `sys_job_log` VALUES (1112, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:40:19');
INSERT INTO `sys_job_log` VALUES (1113, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:19');
INSERT INTO `sys_job_log` VALUES (1114, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:19');
INSERT INTO `sys_job_log` VALUES (1115, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:29');
INSERT INTO `sys_job_log` VALUES (1116, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:40:29');
INSERT INTO `sys_job_log` VALUES (1117, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:40:29');
INSERT INTO `sys_job_log` VALUES (1118, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:40:29');
INSERT INTO `sys_job_log` VALUES (1119, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:40:39');
INSERT INTO `sys_job_log` VALUES (1120, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:39');
INSERT INTO `sys_job_log` VALUES (1121, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:49');
INSERT INTO `sys_job_log` VALUES (1122, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:49');
INSERT INTO `sys_job_log` VALUES (1123, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:40:49');
INSERT INTO `sys_job_log` VALUES (1124, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:40:49');
INSERT INTO `sys_job_log` VALUES (1125, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:49');
INSERT INTO `sys_job_log` VALUES (1126, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:40:59');
INSERT INTO `sys_job_log` VALUES (1127, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:40:59');
INSERT INTO `sys_job_log` VALUES (1128, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:40:59');
INSERT INTO `sys_job_log` VALUES (1129, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:09');
INSERT INTO `sys_job_log` VALUES (1130, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:09');
INSERT INTO `sys_job_log` VALUES (1131, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:41:09');
INSERT INTO `sys_job_log` VALUES (1132, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:09');
INSERT INTO `sys_job_log` VALUES (1133, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:09');
INSERT INTO `sys_job_log` VALUES (1134, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:19');
INSERT INTO `sys_job_log` VALUES (1135, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:19');
INSERT INTO `sys_job_log` VALUES (1136, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:41:19');
INSERT INTO `sys_job_log` VALUES (1137, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:19');
INSERT INTO `sys_job_log` VALUES (1138, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:29');
INSERT INTO `sys_job_log` VALUES (1139, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:29');
INSERT INTO `sys_job_log` VALUES (1140, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:41:29');
INSERT INTO `sys_job_log` VALUES (1141, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:29');
INSERT INTO `sys_job_log` VALUES (1142, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:39');
INSERT INTO `sys_job_log` VALUES (1143, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:39');
INSERT INTO `sys_job_log` VALUES (1144, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:41:39');
INSERT INTO `sys_job_log` VALUES (1145, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:39');
INSERT INTO `sys_job_log` VALUES (1146, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:39');
INSERT INTO `sys_job_log` VALUES (1147, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:49');
INSERT INTO `sys_job_log` VALUES (1148, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:41:49');
INSERT INTO `sys_job_log` VALUES (1149, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:49');
INSERT INTO `sys_job_log` VALUES (1150, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:41:59');
INSERT INTO `sys_job_log` VALUES (1151, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:59');
INSERT INTO `sys_job_log` VALUES (1152, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:41:59');
INSERT INTO `sys_job_log` VALUES (1153, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:41:59');
INSERT INTO `sys_job_log` VALUES (1154, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:09');
INSERT INTO `sys_job_log` VALUES (1155, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:09');
INSERT INTO `sys_job_log` VALUES (1156, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:42:09');
INSERT INTO `sys_job_log` VALUES (1157, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:09');
INSERT INTO `sys_job_log` VALUES (1158, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:19');
INSERT INTO `sys_job_log` VALUES (1159, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:19');
INSERT INTO `sys_job_log` VALUES (1160, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:42:19');
INSERT INTO `sys_job_log` VALUES (1161, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:19');
INSERT INTO `sys_job_log` VALUES (1162, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:29');
INSERT INTO `sys_job_log` VALUES (1163, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:42:29');
INSERT INTO `sys_job_log` VALUES (1164, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:42:29');
INSERT INTO `sys_job_log` VALUES (1165, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:29');
INSERT INTO `sys_job_log` VALUES (1166, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:39');
INSERT INTO `sys_job_log` VALUES (1167, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:39');
INSERT INTO `sys_job_log` VALUES (1168, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:42:39');
INSERT INTO `sys_job_log` VALUES (1169, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:39');
INSERT INTO `sys_job_log` VALUES (1170, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:49');
INSERT INTO `sys_job_log` VALUES (1171, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:49');
INSERT INTO `sys_job_log` VALUES (1172, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:42:49');
INSERT INTO `sys_job_log` VALUES (1173, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:42:59');
INSERT INTO `sys_job_log` VALUES (1174, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:59');
INSERT INTO `sys_job_log` VALUES (1175, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:42:59');
INSERT INTO `sys_job_log` VALUES (1176, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:42:59');
INSERT INTO `sys_job_log` VALUES (1177, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:42:59');
INSERT INTO `sys_job_log` VALUES (1178, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:09');
INSERT INTO `sys_job_log` VALUES (1179, 'task:system:joblog', '100', '耗时 18 毫秒', '0', '', '2023-06-13 11:43:09');
INSERT INTO `sys_job_log` VALUES (1180, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:09');
INSERT INTO `sys_job_log` VALUES (1181, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:09');
INSERT INTO `sys_job_log` VALUES (1182, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:19');
INSERT INTO `sys_job_log` VALUES (1183, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:19');
INSERT INTO `sys_job_log` VALUES (1184, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:43:19');
INSERT INTO `sys_job_log` VALUES (1185, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:19');
INSERT INTO `sys_job_log` VALUES (1186, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:19');
INSERT INTO `sys_job_log` VALUES (1187, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:43:29');
INSERT INTO `sys_job_log` VALUES (1188, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:43:29');
INSERT INTO `sys_job_log` VALUES (1189, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:43:39');
INSERT INTO `sys_job_log` VALUES (1190, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:39');
INSERT INTO `sys_job_log` VALUES (1191, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:43:39');
INSERT INTO `sys_job_log` VALUES (1192, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:49');
INSERT INTO `sys_job_log` VALUES (1193, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:49');
INSERT INTO `sys_job_log` VALUES (1194, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:43:49');
INSERT INTO `sys_job_log` VALUES (1195, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:43:59');
INSERT INTO `sys_job_log` VALUES (1196, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:59');
INSERT INTO `sys_job_log` VALUES (1197, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:43:59');
INSERT INTO `sys_job_log` VALUES (1198, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:43:59');
INSERT INTO `sys_job_log` VALUES (1199, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:09');
INSERT INTO `sys_job_log` VALUES (1200, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:09');
INSERT INTO `sys_job_log` VALUES (1201, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:44:09');
INSERT INTO `sys_job_log` VALUES (1202, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:09');
INSERT INTO `sys_job_log` VALUES (1203, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:09');
INSERT INTO `sys_job_log` VALUES (1204, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:19');
INSERT INTO `sys_job_log` VALUES (1205, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:19');
INSERT INTO `sys_job_log` VALUES (1206, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:44:19');
INSERT INTO `sys_job_log` VALUES (1207, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:19');
INSERT INTO `sys_job_log` VALUES (1208, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:29');
INSERT INTO `sys_job_log` VALUES (1209, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:29');
INSERT INTO `sys_job_log` VALUES (1210, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:44:29');
INSERT INTO `sys_job_log` VALUES (1211, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:29');
INSERT INTO `sys_job_log` VALUES (1212, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:39');
INSERT INTO `sys_job_log` VALUES (1213, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:39');
INSERT INTO `sys_job_log` VALUES (1214, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:44:39');
INSERT INTO `sys_job_log` VALUES (1215, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:39');
INSERT INTO `sys_job_log` VALUES (1216, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:39');
INSERT INTO `sys_job_log` VALUES (1217, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:49');
INSERT INTO `sys_job_log` VALUES (1218, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:44:49');
INSERT INTO `sys_job_log` VALUES (1219, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:49');
INSERT INTO `sys_job_log` VALUES (1220, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:49');
INSERT INTO `sys_job_log` VALUES (1221, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:44:59');
INSERT INTO `sys_job_log` VALUES (1222, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:44:59');
INSERT INTO `sys_job_log` VALUES (1223, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:44:59');
INSERT INTO `sys_job_log` VALUES (1224, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:09');
INSERT INTO `sys_job_log` VALUES (1225, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:09');
INSERT INTO `sys_job_log` VALUES (1226, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:45:09');
INSERT INTO `sys_job_log` VALUES (1227, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:09');
INSERT INTO `sys_job_log` VALUES (1228, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:09');
INSERT INTO `sys_job_log` VALUES (1229, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:19');
INSERT INTO `sys_job_log` VALUES (1230, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:19');
INSERT INTO `sys_job_log` VALUES (1231, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:45:19');
INSERT INTO `sys_job_log` VALUES (1232, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:19');
INSERT INTO `sys_job_log` VALUES (1233, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:29');
INSERT INTO `sys_job_log` VALUES (1234, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:29');
INSERT INTO `sys_job_log` VALUES (1235, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:45:29');
INSERT INTO `sys_job_log` VALUES (1236, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:45:29');
INSERT INTO `sys_job_log` VALUES (1237, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:45:39');
INSERT INTO `sys_job_log` VALUES (1238, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:39');
INSERT INTO `sys_job_log` VALUES (1239, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:45:39');
INSERT INTO `sys_job_log` VALUES (1240, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:45:39');
INSERT INTO `sys_job_log` VALUES (1241, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:45:39');
INSERT INTO `sys_job_log` VALUES (1242, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:45:49');
INSERT INTO `sys_job_log` VALUES (1243, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:45:49');
INSERT INTO `sys_job_log` VALUES (1244, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:49');
INSERT INTO `sys_job_log` VALUES (1245, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:49');
INSERT INTO `sys_job_log` VALUES (1246, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:59');
INSERT INTO `sys_job_log` VALUES (1247, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:45:59');
INSERT INTO `sys_job_log` VALUES (1248, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:45:59');
INSERT INTO `sys_job_log` VALUES (1249, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:09');
INSERT INTO `sys_job_log` VALUES (1250, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:09');
INSERT INTO `sys_job_log` VALUES (1251, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:46:09');
INSERT INTO `sys_job_log` VALUES (1252, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:09');
INSERT INTO `sys_job_log` VALUES (1253, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:46:19');
INSERT INTO `sys_job_log` VALUES (1254, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:19');
INSERT INTO `sys_job_log` VALUES (1255, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:46:19');
INSERT INTO `sys_job_log` VALUES (1256, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:19');
INSERT INTO `sys_job_log` VALUES (1257, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:19');
INSERT INTO `sys_job_log` VALUES (1258, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:29');
INSERT INTO `sys_job_log` VALUES (1259, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:46:29');
INSERT INTO `sys_job_log` VALUES (1260, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:29');
INSERT INTO `sys_job_log` VALUES (1261, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:39');
INSERT INTO `sys_job_log` VALUES (1262, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:39');
INSERT INTO `sys_job_log` VALUES (1263, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:46:39');
INSERT INTO `sys_job_log` VALUES (1264, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:39');
INSERT INTO `sys_job_log` VALUES (1265, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:49');
INSERT INTO `sys_job_log` VALUES (1266, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:49');
INSERT INTO `sys_job_log` VALUES (1267, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:46:49');
INSERT INTO `sys_job_log` VALUES (1268, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:49');
INSERT INTO `sys_job_log` VALUES (1269, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:59');
INSERT INTO `sys_job_log` VALUES (1270, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:59');
INSERT INTO `sys_job_log` VALUES (1271, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:46:59');
INSERT INTO `sys_job_log` VALUES (1272, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:46:59');
INSERT INTO `sys_job_log` VALUES (1273, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:09');
INSERT INTO `sys_job_log` VALUES (1274, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:09');
INSERT INTO `sys_job_log` VALUES (1275, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:47:09');
INSERT INTO `sys_job_log` VALUES (1276, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:09');
INSERT INTO `sys_job_log` VALUES (1277, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:09');
INSERT INTO `sys_job_log` VALUES (1278, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:19');
INSERT INTO `sys_job_log` VALUES (1279, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:19');
INSERT INTO `sys_job_log` VALUES (1280, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 11:47:19');
INSERT INTO `sys_job_log` VALUES (1281, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:19');
INSERT INTO `sys_job_log` VALUES (1282, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:29');
INSERT INTO `sys_job_log` VALUES (1283, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:29');
INSERT INTO `sys_job_log` VALUES (1284, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:47:29');
INSERT INTO `sys_job_log` VALUES (1285, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:29');
INSERT INTO `sys_job_log` VALUES (1286, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:39');
INSERT INTO `sys_job_log` VALUES (1287, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:39');
INSERT INTO `sys_job_log` VALUES (1288, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:47:39');
INSERT INTO `sys_job_log` VALUES (1289, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:39');
INSERT INTO `sys_job_log` VALUES (1290, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:49');
INSERT INTO `sys_job_log` VALUES (1291, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:49');
INSERT INTO `sys_job_log` VALUES (1292, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 11:47:49');
INSERT INTO `sys_job_log` VALUES (1293, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:47:49');
INSERT INTO `sys_job_log` VALUES (1294, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:47:49');
INSERT INTO `sys_job_log` VALUES (1295, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:47:59');
INSERT INTO `sys_job_log` VALUES (1296, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:47:59');
INSERT INTO `sys_job_log` VALUES (1297, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:59');
INSERT INTO `sys_job_log` VALUES (1298, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:47:59');
INSERT INTO `sys_job_log` VALUES (1299, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:09');
INSERT INTO `sys_job_log` VALUES (1300, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:48:09');
INSERT INTO `sys_job_log` VALUES (1301, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:09');
INSERT INTO `sys_job_log` VALUES (1302, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:09');
INSERT INTO `sys_job_log` VALUES (1303, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:09');
INSERT INTO `sys_job_log` VALUES (1304, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:19');
INSERT INTO `sys_job_log` VALUES (1305, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:48:19');
INSERT INTO `sys_job_log` VALUES (1306, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:48:19');
INSERT INTO `sys_job_log` VALUES (1307, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:19');
INSERT INTO `sys_job_log` VALUES (1308, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:29');
INSERT INTO `sys_job_log` VALUES (1309, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:48:29');
INSERT INTO `sys_job_log` VALUES (1310, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:29');
INSERT INTO `sys_job_log` VALUES (1311, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:29');
INSERT INTO `sys_job_log` VALUES (1312, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:48:39');
INSERT INTO `sys_job_log` VALUES (1313, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:39');
INSERT INTO `sys_job_log` VALUES (1314, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:49');
INSERT INTO `sys_job_log` VALUES (1315, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:49');
INSERT INTO `sys_job_log` VALUES (1316, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:48:49');
INSERT INTO `sys_job_log` VALUES (1317, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:59');
INSERT INTO `sys_job_log` VALUES (1318, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:48:59');
INSERT INTO `sys_job_log` VALUES (1319, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:48:59');
INSERT INTO `sys_job_log` VALUES (1320, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:48:59');
INSERT INTO `sys_job_log` VALUES (1321, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:09');
INSERT INTO `sys_job_log` VALUES (1322, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:09');
INSERT INTO `sys_job_log` VALUES (1323, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:49:09');
INSERT INTO `sys_job_log` VALUES (1324, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:09');
INSERT INTO `sys_job_log` VALUES (1325, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:09');
INSERT INTO `sys_job_log` VALUES (1326, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:19');
INSERT INTO `sys_job_log` VALUES (1327, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:19');
INSERT INTO `sys_job_log` VALUES (1328, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:49:19');
INSERT INTO `sys_job_log` VALUES (1329, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:19');
INSERT INTO `sys_job_log` VALUES (1330, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:19');
INSERT INTO `sys_job_log` VALUES (1331, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:29');
INSERT INTO `sys_job_log` VALUES (1332, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:49:29');
INSERT INTO `sys_job_log` VALUES (1333, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:29');
INSERT INTO `sys_job_log` VALUES (1334, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:29');
INSERT INTO `sys_job_log` VALUES (1335, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:39');
INSERT INTO `sys_job_log` VALUES (1336, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:49:39');
INSERT INTO `sys_job_log` VALUES (1337, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:39');
INSERT INTO `sys_job_log` VALUES (1338, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:49');
INSERT INTO `sys_job_log` VALUES (1339, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:49');
INSERT INTO `sys_job_log` VALUES (1340, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:49:49');
INSERT INTO `sys_job_log` VALUES (1341, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:49');
INSERT INTO `sys_job_log` VALUES (1342, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:59');
INSERT INTO `sys_job_log` VALUES (1343, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:49:59');
INSERT INTO `sys_job_log` VALUES (1344, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:49:59');
INSERT INTO `sys_job_log` VALUES (1345, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:49:59');
INSERT INTO `sys_job_log` VALUES (1346, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:09');
INSERT INTO `sys_job_log` VALUES (1347, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:09');
INSERT INTO `sys_job_log` VALUES (1348, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:50:09');
INSERT INTO `sys_job_log` VALUES (1349, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:09');
INSERT INTO `sys_job_log` VALUES (1350, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:50:09');
INSERT INTO `sys_job_log` VALUES (1351, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:50:19');
INSERT INTO `sys_job_log` VALUES (1352, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:19');
INSERT INTO `sys_job_log` VALUES (1353, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:50:19');
INSERT INTO `sys_job_log` VALUES (1354, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:50:19');
INSERT INTO `sys_job_log` VALUES (1355, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:50:29');
INSERT INTO `sys_job_log` VALUES (1356, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:29');
INSERT INTO `sys_job_log` VALUES (1357, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:50:29');
INSERT INTO `sys_job_log` VALUES (1358, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:29');
INSERT INTO `sys_job_log` VALUES (1359, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:29');
INSERT INTO `sys_job_log` VALUES (1360, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:50:39');
INSERT INTO `sys_job_log` VALUES (1361, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:39');
INSERT INTO `sys_job_log` VALUES (1362, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:39');
INSERT INTO `sys_job_log` VALUES (1363, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:50:49');
INSERT INTO `sys_job_log` VALUES (1364, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:49');
INSERT INTO `sys_job_log` VALUES (1365, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:49');
INSERT INTO `sys_job_log` VALUES (1366, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:59');
INSERT INTO `sys_job_log` VALUES (1367, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:50:59');
INSERT INTO `sys_job_log` VALUES (1368, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:50:59');
INSERT INTO `sys_job_log` VALUES (1369, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:09');
INSERT INTO `sys_job_log` VALUES (1370, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:09');
INSERT INTO `sys_job_log` VALUES (1371, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:51:09');
INSERT INTO `sys_job_log` VALUES (1372, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:09');
INSERT INTO `sys_job_log` VALUES (1373, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:09');
INSERT INTO `sys_job_log` VALUES (1374, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:19');
INSERT INTO `sys_job_log` VALUES (1375, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:19');
INSERT INTO `sys_job_log` VALUES (1376, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:51:19');
INSERT INTO `sys_job_log` VALUES (1377, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:19');
INSERT INTO `sys_job_log` VALUES (1378, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:29');
INSERT INTO `sys_job_log` VALUES (1379, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:29');
INSERT INTO `sys_job_log` VALUES (1380, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:51:29');
INSERT INTO `sys_job_log` VALUES (1381, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:51:29');
INSERT INTO `sys_job_log` VALUES (1382, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:51:39');
INSERT INTO `sys_job_log` VALUES (1383, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:39');
INSERT INTO `sys_job_log` VALUES (1384, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:51:39');
INSERT INTO `sys_job_log` VALUES (1385, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:51:39');
INSERT INTO `sys_job_log` VALUES (1386, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:39');
INSERT INTO `sys_job_log` VALUES (1387, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:49');
INSERT INTO `sys_job_log` VALUES (1388, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:51:49');
INSERT INTO `sys_job_log` VALUES (1389, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:51:49');
INSERT INTO `sys_job_log` VALUES (1390, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:49');
INSERT INTO `sys_job_log` VALUES (1391, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:59');
INSERT INTO `sys_job_log` VALUES (1392, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:51:59');
INSERT INTO `sys_job_log` VALUES (1393, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:51:59');
INSERT INTO `sys_job_log` VALUES (1394, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:09');
INSERT INTO `sys_job_log` VALUES (1395, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:09');
INSERT INTO `sys_job_log` VALUES (1396, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:52:09');
INSERT INTO `sys_job_log` VALUES (1397, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:09');
INSERT INTO `sys_job_log` VALUES (1398, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:09');
INSERT INTO `sys_job_log` VALUES (1399, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:19');
INSERT INTO `sys_job_log` VALUES (1400, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:19');
INSERT INTO `sys_job_log` VALUES (1401, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 11:52:19');
INSERT INTO `sys_job_log` VALUES (1402, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:19');
INSERT INTO `sys_job_log` VALUES (1403, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:29');
INSERT INTO `sys_job_log` VALUES (1404, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:29');
INSERT INTO `sys_job_log` VALUES (1405, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:52:29');
INSERT INTO `sys_job_log` VALUES (1406, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:52:39');
INSERT INTO `sys_job_log` VALUES (1407, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:52:39');
INSERT INTO `sys_job_log` VALUES (1408, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:52:39');
INSERT INTO `sys_job_log` VALUES (1409, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:39');
INSERT INTO `sys_job_log` VALUES (1410, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:49');
INSERT INTO `sys_job_log` VALUES (1411, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:49');
INSERT INTO `sys_job_log` VALUES (1412, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:52:49');
INSERT INTO `sys_job_log` VALUES (1413, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:49');
INSERT INTO `sys_job_log` VALUES (1414, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:59');
INSERT INTO `sys_job_log` VALUES (1415, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:52:59');
INSERT INTO `sys_job_log` VALUES (1416, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:52:59');
INSERT INTO `sys_job_log` VALUES (1417, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:52:59');
INSERT INTO `sys_job_log` VALUES (1418, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:09');
INSERT INTO `sys_job_log` VALUES (1419, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:09');
INSERT INTO `sys_job_log` VALUES (1420, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:53:09');
INSERT INTO `sys_job_log` VALUES (1421, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:09');
INSERT INTO `sys_job_log` VALUES (1422, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:09');
INSERT INTO `sys_job_log` VALUES (1423, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:19');
INSERT INTO `sys_job_log` VALUES (1424, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:19');
INSERT INTO `sys_job_log` VALUES (1425, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:53:19');
INSERT INTO `sys_job_log` VALUES (1426, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:19');
INSERT INTO `sys_job_log` VALUES (1427, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:29');
INSERT INTO `sys_job_log` VALUES (1428, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:29');
INSERT INTO `sys_job_log` VALUES (1429, 'task:system:joblog', '100', '耗时 15 毫秒', '0', '', '2023-06-13 11:53:29');
INSERT INTO `sys_job_log` VALUES (1430, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:39');
INSERT INTO `sys_job_log` VALUES (1431, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:53:39');
INSERT INTO `sys_job_log` VALUES (1432, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:53:39');
INSERT INTO `sys_job_log` VALUES (1433, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:39');
INSERT INTO `sys_job_log` VALUES (1434, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:49');
INSERT INTO `sys_job_log` VALUES (1435, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:49');
INSERT INTO `sys_job_log` VALUES (1436, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:53:49');
INSERT INTO `sys_job_log` VALUES (1437, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:49');
INSERT INTO `sys_job_log` VALUES (1438, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:49');
INSERT INTO `sys_job_log` VALUES (1439, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:59');
INSERT INTO `sys_job_log` VALUES (1440, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:53:59');
INSERT INTO `sys_job_log` VALUES (1441, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:53:59');
INSERT INTO `sys_job_log` VALUES (1442, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:09');
INSERT INTO `sys_job_log` VALUES (1443, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:09');
INSERT INTO `sys_job_log` VALUES (1444, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:54:09');
INSERT INTO `sys_job_log` VALUES (1445, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:09');
INSERT INTO `sys_job_log` VALUES (1446, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:09');
INSERT INTO `sys_job_log` VALUES (1447, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:19');
INSERT INTO `sys_job_log` VALUES (1448, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:19');
INSERT INTO `sys_job_log` VALUES (1449, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:54:19');
INSERT INTO `sys_job_log` VALUES (1450, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:19');
INSERT INTO `sys_job_log` VALUES (1451, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:29');
INSERT INTO `sys_job_log` VALUES (1452, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:29');
INSERT INTO `sys_job_log` VALUES (1453, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:54:29');
INSERT INTO `sys_job_log` VALUES (1454, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:39');
INSERT INTO `sys_job_log` VALUES (1455, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:54:39');
INSERT INTO `sys_job_log` VALUES (1456, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:54:39');
INSERT INTO `sys_job_log` VALUES (1457, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:54:39');
INSERT INTO `sys_job_log` VALUES (1458, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:54:49');
INSERT INTO `sys_job_log` VALUES (1459, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:49');
INSERT INTO `sys_job_log` VALUES (1460, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:54:49');
INSERT INTO `sys_job_log` VALUES (1461, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:54:49');
INSERT INTO `sys_job_log` VALUES (1462, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:54:59');
INSERT INTO `sys_job_log` VALUES (1463, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:54:59');
INSERT INTO `sys_job_log` VALUES (1464, 'task:system:joblog', '100', '耗时 25 毫秒', '0', '', '2023-06-13 11:54:59');
INSERT INTO `sys_job_log` VALUES (1465, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:09');
INSERT INTO `sys_job_log` VALUES (1466, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:09');
INSERT INTO `sys_job_log` VALUES (1467, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:55:09');
INSERT INTO `sys_job_log` VALUES (1468, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:09');
INSERT INTO `sys_job_log` VALUES (1469, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:09');
INSERT INTO `sys_job_log` VALUES (1470, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:19');
INSERT INTO `sys_job_log` VALUES (1471, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:19');
INSERT INTO `sys_job_log` VALUES (1472, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:55:19');
INSERT INTO `sys_job_log` VALUES (1473, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:19');
INSERT INTO `sys_job_log` VALUES (1474, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:29');
INSERT INTO `sys_job_log` VALUES (1475, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:29');
INSERT INTO `sys_job_log` VALUES (1476, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:55:29');
INSERT INTO `sys_job_log` VALUES (1477, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:29');
INSERT INTO `sys_job_log` VALUES (1478, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:39');
INSERT INTO `sys_job_log` VALUES (1479, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:39');
INSERT INTO `sys_job_log` VALUES (1480, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:55:39');
INSERT INTO `sys_job_log` VALUES (1481, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:39');
INSERT INTO `sys_job_log` VALUES (1482, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:49');
INSERT INTO `sys_job_log` VALUES (1483, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:55:49');
INSERT INTO `sys_job_log` VALUES (1484, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:55:49');
INSERT INTO `sys_job_log` VALUES (1485, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:55:49');
INSERT INTO `sys_job_log` VALUES (1486, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:55:59');
INSERT INTO `sys_job_log` VALUES (1487, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:55:59');
INSERT INTO `sys_job_log` VALUES (1488, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 11:55:59');
INSERT INTO `sys_job_log` VALUES (1489, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:09');
INSERT INTO `sys_job_log` VALUES (1490, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:09');
INSERT INTO `sys_job_log` VALUES (1491, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:56:09');
INSERT INTO `sys_job_log` VALUES (1492, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:09');
INSERT INTO `sys_job_log` VALUES (1493, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:19');
INSERT INTO `sys_job_log` VALUES (1494, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:19');
INSERT INTO `sys_job_log` VALUES (1495, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:56:19');
INSERT INTO `sys_job_log` VALUES (1496, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:19');
INSERT INTO `sys_job_log` VALUES (1497, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:29');
INSERT INTO `sys_job_log` VALUES (1498, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:29');
INSERT INTO `sys_job_log` VALUES (1499, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 11:56:29');
INSERT INTO `sys_job_log` VALUES (1500, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:29');
INSERT INTO `sys_job_log` VALUES (1501, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:29');
INSERT INTO `sys_job_log` VALUES (1502, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:39');
INSERT INTO `sys_job_log` VALUES (1503, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 11:56:39');
INSERT INTO `sys_job_log` VALUES (1504, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:49');
INSERT INTO `sys_job_log` VALUES (1505, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:56:49');
INSERT INTO `sys_job_log` VALUES (1506, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:56:49');
INSERT INTO `sys_job_log` VALUES (1507, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:49');
INSERT INTO `sys_job_log` VALUES (1508, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:59');
INSERT INTO `sys_job_log` VALUES (1509, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:59');
INSERT INTO `sys_job_log` VALUES (1510, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:56:59');
INSERT INTO `sys_job_log` VALUES (1511, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:56:59');
INSERT INTO `sys_job_log` VALUES (1512, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:57:09');
INSERT INTO `sys_job_log` VALUES (1513, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:57:09');
INSERT INTO `sys_job_log` VALUES (1514, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:57:09');
INSERT INTO `sys_job_log` VALUES (1515, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:09');
INSERT INTO `sys_job_log` VALUES (1516, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:19');
INSERT INTO `sys_job_log` VALUES (1517, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:19');
INSERT INTO `sys_job_log` VALUES (1518, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:57:19');
INSERT INTO `sys_job_log` VALUES (1519, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:19');
INSERT INTO `sys_job_log` VALUES (1520, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:19');
INSERT INTO `sys_job_log` VALUES (1521, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:29');
INSERT INTO `sys_job_log` VALUES (1522, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:57:29');
INSERT INTO `sys_job_log` VALUES (1523, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:39');
INSERT INTO `sys_job_log` VALUES (1524, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:39');
INSERT INTO `sys_job_log` VALUES (1525, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:57:39');
INSERT INTO `sys_job_log` VALUES (1526, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:39');
INSERT INTO `sys_job_log` VALUES (1527, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:49');
INSERT INTO `sys_job_log` VALUES (1528, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:49');
INSERT INTO `sys_job_log` VALUES (1529, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:57:49');
INSERT INTO `sys_job_log` VALUES (1530, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:49');
INSERT INTO `sys_job_log` VALUES (1531, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:59');
INSERT INTO `sys_job_log` VALUES (1532, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:59');
INSERT INTO `sys_job_log` VALUES (1533, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:57:59');
INSERT INTO `sys_job_log` VALUES (1534, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:59');
INSERT INTO `sys_job_log` VALUES (1535, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:57:59');
INSERT INTO `sys_job_log` VALUES (1536, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:58:09');
INSERT INTO `sys_job_log` VALUES (1537, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:09');
INSERT INTO `sys_job_log` VALUES (1538, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:09');
INSERT INTO `sys_job_log` VALUES (1539, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:19');
INSERT INTO `sys_job_log` VALUES (1540, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:19');
INSERT INTO `sys_job_log` VALUES (1541, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 11:58:19');
INSERT INTO `sys_job_log` VALUES (1542, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:58:19');
INSERT INTO `sys_job_log` VALUES (1543, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:58:19');
INSERT INTO `sys_job_log` VALUES (1544, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 11:58:29');
INSERT INTO `sys_job_log` VALUES (1545, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:58:29');
INSERT INTO `sys_job_log` VALUES (1546, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:58:29');
INSERT INTO `sys_job_log` VALUES (1547, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:58:39');
INSERT INTO `sys_job_log` VALUES (1548, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:39');
INSERT INTO `sys_job_log` VALUES (1549, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:49');
INSERT INTO `sys_job_log` VALUES (1550, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:49');
INSERT INTO `sys_job_log` VALUES (1551, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:58:49');
INSERT INTO `sys_job_log` VALUES (1552, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:49');
INSERT INTO `sys_job_log` VALUES (1553, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:49');
INSERT INTO `sys_job_log` VALUES (1554, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:59');
INSERT INTO `sys_job_log` VALUES (1555, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:58:59');
INSERT INTO `sys_job_log` VALUES (1556, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:58:59');
INSERT INTO `sys_job_log` VALUES (1557, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:09');
INSERT INTO `sys_job_log` VALUES (1558, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:09');
INSERT INTO `sys_job_log` VALUES (1559, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 11:59:09');
INSERT INTO `sys_job_log` VALUES (1560, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:09');
INSERT INTO `sys_job_log` VALUES (1561, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:59:19');
INSERT INTO `sys_job_log` VALUES (1562, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:59:19');
INSERT INTO `sys_job_log` VALUES (1563, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:59:19');
INSERT INTO `sys_job_log` VALUES (1564, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:59:19');
INSERT INTO `sys_job_log` VALUES (1565, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:59:19');
INSERT INTO `sys_job_log` VALUES (1566, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:59:29');
INSERT INTO `sys_job_log` VALUES (1567, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:29');
INSERT INTO `sys_job_log` VALUES (1568, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:39');
INSERT INTO `sys_job_log` VALUES (1569, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:39');
INSERT INTO `sys_job_log` VALUES (1570, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 11:59:39');
INSERT INTO `sys_job_log` VALUES (1571, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:39');
INSERT INTO `sys_job_log` VALUES (1572, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:49');
INSERT INTO `sys_job_log` VALUES (1573, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:49');
INSERT INTO `sys_job_log` VALUES (1574, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:59:49');
INSERT INTO `sys_job_log` VALUES (1575, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:49');
INSERT INTO `sys_job_log` VALUES (1576, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:59');
INSERT INTO `sys_job_log` VALUES (1577, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 11:59:59');
INSERT INTO `sys_job_log` VALUES (1578, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 11:59:59');
INSERT INTO `sys_job_log` VALUES (1579, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 11:59:59');
INSERT INTO `sys_job_log` VALUES (1580, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1581, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1582, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1583, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1584, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1585, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:00:09');
INSERT INTO `sys_job_log` VALUES (1586, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:00:19');
INSERT INTO `sys_job_log` VALUES (1587, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:00:19');
INSERT INTO `sys_job_log` VALUES (1588, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:19');
INSERT INTO `sys_job_log` VALUES (1589, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:29');
INSERT INTO `sys_job_log` VALUES (1590, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:29');
INSERT INTO `sys_job_log` VALUES (1591, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:00:29');
INSERT INTO `sys_job_log` VALUES (1592, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:29');
INSERT INTO `sys_job_log` VALUES (1593, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:29');
INSERT INTO `sys_job_log` VALUES (1594, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:39');
INSERT INTO `sys_job_log` VALUES (1595, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:00:39');
INSERT INTO `sys_job_log` VALUES (1596, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:39');
INSERT INTO `sys_job_log` VALUES (1597, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:49');
INSERT INTO `sys_job_log` VALUES (1598, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:49');
INSERT INTO `sys_job_log` VALUES (1599, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:00:49');
INSERT INTO `sys_job_log` VALUES (1600, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:49');
INSERT INTO `sys_job_log` VALUES (1601, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:59');
INSERT INTO `sys_job_log` VALUES (1602, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:59');
INSERT INTO `sys_job_log` VALUES (1603, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:00:59');
INSERT INTO `sys_job_log` VALUES (1604, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:59');
INSERT INTO `sys_job_log` VALUES (1605, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:00:59');
INSERT INTO `sys_job_log` VALUES (1606, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:09');
INSERT INTO `sys_job_log` VALUES (1607, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:01:09');
INSERT INTO `sys_job_log` VALUES (1608, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:09');
INSERT INTO `sys_job_log` VALUES (1609, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:09');
INSERT INTO `sys_job_log` VALUES (1610, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:19');
INSERT INTO `sys_job_log` VALUES (1611, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:19');
INSERT INTO `sys_job_log` VALUES (1612, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:01:19');
INSERT INTO `sys_job_log` VALUES (1613, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:19');
INSERT INTO `sys_job_log` VALUES (1614, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:29');
INSERT INTO `sys_job_log` VALUES (1615, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:29');
INSERT INTO `sys_job_log` VALUES (1616, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:01:29');
INSERT INTO `sys_job_log` VALUES (1617, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:29');
INSERT INTO `sys_job_log` VALUES (1618, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:39');
INSERT INTO `sys_job_log` VALUES (1619, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:01:39');
INSERT INTO `sys_job_log` VALUES (1620, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:01:39');
INSERT INTO `sys_job_log` VALUES (1621, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:39');
INSERT INTO `sys_job_log` VALUES (1622, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:39');
INSERT INTO `sys_job_log` VALUES (1623, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:49');
INSERT INTO `sys_job_log` VALUES (1624, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:01:49');
INSERT INTO `sys_job_log` VALUES (1625, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:49');
INSERT INTO `sys_job_log` VALUES (1626, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:49');
INSERT INTO `sys_job_log` VALUES (1627, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:59');
INSERT INTO `sys_job_log` VALUES (1628, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:01:59');
INSERT INTO `sys_job_log` VALUES (1629, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:01:59');
INSERT INTO `sys_job_log` VALUES (1630, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:09');
INSERT INTO `sys_job_log` VALUES (1631, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:09');
INSERT INTO `sys_job_log` VALUES (1632, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 12:02:09');
INSERT INTO `sys_job_log` VALUES (1633, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:09');
INSERT INTO `sys_job_log` VALUES (1634, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:09');
INSERT INTO `sys_job_log` VALUES (1635, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:19');
INSERT INTO `sys_job_log` VALUES (1636, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:19');
INSERT INTO `sys_job_log` VALUES (1637, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:02:19');
INSERT INTO `sys_job_log` VALUES (1638, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:19');
INSERT INTO `sys_job_log` VALUES (1639, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:19');
INSERT INTO `sys_job_log` VALUES (1640, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:02:29');
INSERT INTO `sys_job_log` VALUES (1641, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:29');
INSERT INTO `sys_job_log` VALUES (1642, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:39');
INSERT INTO `sys_job_log` VALUES (1643, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:39');
INSERT INTO `sys_job_log` VALUES (1644, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:02:39');
INSERT INTO `sys_job_log` VALUES (1645, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:39');
INSERT INTO `sys_job_log` VALUES (1646, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:49');
INSERT INTO `sys_job_log` VALUES (1647, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:49');
INSERT INTO `sys_job_log` VALUES (1648, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:02:49');
INSERT INTO `sys_job_log` VALUES (1649, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:49');
INSERT INTO `sys_job_log` VALUES (1650, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:59');
INSERT INTO `sys_job_log` VALUES (1651, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:59');
INSERT INTO `sys_job_log` VALUES (1652, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:02:59');
INSERT INTO `sys_job_log` VALUES (1653, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:02:59');
INSERT INTO `sys_job_log` VALUES (1654, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:02:59');
INSERT INTO `sys_job_log` VALUES (1655, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:09');
INSERT INTO `sys_job_log` VALUES (1656, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:03:09');
INSERT INTO `sys_job_log` VALUES (1657, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:09');
INSERT INTO `sys_job_log` VALUES (1658, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:09');
INSERT INTO `sys_job_log` VALUES (1659, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:19');
INSERT INTO `sys_job_log` VALUES (1660, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:19');
INSERT INTO `sys_job_log` VALUES (1661, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:03:19');
INSERT INTO `sys_job_log` VALUES (1662, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:19');
INSERT INTO `sys_job_log` VALUES (1663, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:29');
INSERT INTO `sys_job_log` VALUES (1664, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:29');
INSERT INTO `sys_job_log` VALUES (1665, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:03:29');
INSERT INTO `sys_job_log` VALUES (1666, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:29');
INSERT INTO `sys_job_log` VALUES (1667, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:03:39');
INSERT INTO `sys_job_log` VALUES (1668, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:03:39');
INSERT INTO `sys_job_log` VALUES (1669, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:49');
INSERT INTO `sys_job_log` VALUES (1670, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:49');
INSERT INTO `sys_job_log` VALUES (1671, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:03:49');
INSERT INTO `sys_job_log` VALUES (1672, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:49');
INSERT INTO `sys_job_log` VALUES (1673, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:49');
INSERT INTO `sys_job_log` VALUES (1674, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:03:59');
INSERT INTO `sys_job_log` VALUES (1675, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:59');
INSERT INTO `sys_job_log` VALUES (1676, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:03:59');
INSERT INTO `sys_job_log` VALUES (1677, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:09');
INSERT INTO `sys_job_log` VALUES (1678, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:04:09');
INSERT INTO `sys_job_log` VALUES (1679, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:09');
INSERT INTO `sys_job_log` VALUES (1680, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:09');
INSERT INTO `sys_job_log` VALUES (1681, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:19');
INSERT INTO `sys_job_log` VALUES (1682, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:19');
INSERT INTO `sys_job_log` VALUES (1683, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:04:19');
INSERT INTO `sys_job_log` VALUES (1684, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:19');
INSERT INTO `sys_job_log` VALUES (1685, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:29');
INSERT INTO `sys_job_log` VALUES (1686, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:29');
INSERT INTO `sys_job_log` VALUES (1687, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:04:29');
INSERT INTO `sys_job_log` VALUES (1688, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:39');
INSERT INTO `sys_job_log` VALUES (1689, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:39');
INSERT INTO `sys_job_log` VALUES (1690, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:04:39');
INSERT INTO `sys_job_log` VALUES (1691, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:39');
INSERT INTO `sys_job_log` VALUES (1692, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:49');
INSERT INTO `sys_job_log` VALUES (1693, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:49');
INSERT INTO `sys_job_log` VALUES (1694, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:04:49');
INSERT INTO `sys_job_log` VALUES (1695, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:49');
INSERT INTO `sys_job_log` VALUES (1696, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:59');
INSERT INTO `sys_job_log` VALUES (1697, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:04:59');
INSERT INTO `sys_job_log` VALUES (1698, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:04:59');
INSERT INTO `sys_job_log` VALUES (1699, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:04:59');
INSERT INTO `sys_job_log` VALUES (1700, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:09');
INSERT INTO `sys_job_log` VALUES (1701, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:09');
INSERT INTO `sys_job_log` VALUES (1702, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:05:09');
INSERT INTO `sys_job_log` VALUES (1703, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:09');
INSERT INTO `sys_job_log` VALUES (1704, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:05:09');
INSERT INTO `sys_job_log` VALUES (1705, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:05:19');
INSERT INTO `sys_job_log` VALUES (1706, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:19');
INSERT INTO `sys_job_log` VALUES (1707, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:05:19');
INSERT INTO `sys_job_log` VALUES (1708, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:19');
INSERT INTO `sys_job_log` VALUES (1709, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:29');
INSERT INTO `sys_job_log` VALUES (1710, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:29');
INSERT INTO `sys_job_log` VALUES (1711, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:05:29');
INSERT INTO `sys_job_log` VALUES (1712, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:39');
INSERT INTO `sys_job_log` VALUES (1713, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:39');
INSERT INTO `sys_job_log` VALUES (1714, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:05:39');
INSERT INTO `sys_job_log` VALUES (1715, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:39');
INSERT INTO `sys_job_log` VALUES (1716, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:39');
INSERT INTO `sys_job_log` VALUES (1717, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:05:49');
INSERT INTO `sys_job_log` VALUES (1718, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:49');
INSERT INTO `sys_job_log` VALUES (1719, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:59');
INSERT INTO `sys_job_log` VALUES (1720, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:05:59');
INSERT INTO `sys_job_log` VALUES (1721, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:05:59');
INSERT INTO `sys_job_log` VALUES (1722, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:05:59');
INSERT INTO `sys_job_log` VALUES (1723, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1724, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1725, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1726, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1727, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1728, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:09');
INSERT INTO `sys_job_log` VALUES (1729, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:19');
INSERT INTO `sys_job_log` VALUES (1730, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:06:19');
INSERT INTO `sys_job_log` VALUES (1731, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:19');
INSERT INTO `sys_job_log` VALUES (1732, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:29');
INSERT INTO `sys_job_log` VALUES (1733, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:29');
INSERT INTO `sys_job_log` VALUES (1734, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:06:29');
INSERT INTO `sys_job_log` VALUES (1735, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:29');
INSERT INTO `sys_job_log` VALUES (1736, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:39');
INSERT INTO `sys_job_log` VALUES (1737, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:39');
INSERT INTO `sys_job_log` VALUES (1738, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:06:39');
INSERT INTO `sys_job_log` VALUES (1739, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:39');
INSERT INTO `sys_job_log` VALUES (1740, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:39');
INSERT INTO `sys_job_log` VALUES (1741, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:06:49');
INSERT INTO `sys_job_log` VALUES (1742, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:06:49');
INSERT INTO `sys_job_log` VALUES (1743, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:06:49');
INSERT INTO `sys_job_log` VALUES (1744, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:06:59');
INSERT INTO `sys_job_log` VALUES (1745, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:06:59');
INSERT INTO `sys_job_log` VALUES (1746, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:06:59');
INSERT INTO `sys_job_log` VALUES (1747, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:06:59');
INSERT INTO `sys_job_log` VALUES (1748, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:07:09');
INSERT INTO `sys_job_log` VALUES (1749, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:07:09');
INSERT INTO `sys_job_log` VALUES (1750, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:07:09');
INSERT INTO `sys_job_log` VALUES (1751, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:07:09');
INSERT INTO `sys_job_log` VALUES (1752, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:09');
INSERT INTO `sys_job_log` VALUES (1753, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:19');
INSERT INTO `sys_job_log` VALUES (1754, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:07:19');
INSERT INTO `sys_job_log` VALUES (1755, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:07:19');
INSERT INTO `sys_job_log` VALUES (1756, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:07:19');
INSERT INTO `sys_job_log` VALUES (1757, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:07:29');
INSERT INTO `sys_job_log` VALUES (1758, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:29');
INSERT INTO `sys_job_log` VALUES (1759, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 12:07:29');
INSERT INTO `sys_job_log` VALUES (1760, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:29');
INSERT INTO `sys_job_log` VALUES (1761, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:29');
INSERT INTO `sys_job_log` VALUES (1762, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:39');
INSERT INTO `sys_job_log` VALUES (1763, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:07:39');
INSERT INTO `sys_job_log` VALUES (1764, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:39');
INSERT INTO `sys_job_log` VALUES (1765, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:39');
INSERT INTO `sys_job_log` VALUES (1766, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:07:49');
INSERT INTO `sys_job_log` VALUES (1767, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:49');
INSERT INTO `sys_job_log` VALUES (1768, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:59');
INSERT INTO `sys_job_log` VALUES (1769, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:59');
INSERT INTO `sys_job_log` VALUES (1770, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 12:07:59');
INSERT INTO `sys_job_log` VALUES (1771, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:59');
INSERT INTO `sys_job_log` VALUES (1772, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:07:59');
INSERT INTO `sys_job_log` VALUES (1773, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:09');
INSERT INTO `sys_job_log` VALUES (1774, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:08:09');
INSERT INTO `sys_job_log` VALUES (1775, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:09');
INSERT INTO `sys_job_log` VALUES (1776, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:09');
INSERT INTO `sys_job_log` VALUES (1777, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:19');
INSERT INTO `sys_job_log` VALUES (1778, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:08:19');
INSERT INTO `sys_job_log` VALUES (1779, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:19');
INSERT INTO `sys_job_log` VALUES (1780, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:19');
INSERT INTO `sys_job_log` VALUES (1781, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:29');
INSERT INTO `sys_job_log` VALUES (1782, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:08:29');
INSERT INTO `sys_job_log` VALUES (1783, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:39');
INSERT INTO `sys_job_log` VALUES (1784, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:39');
INSERT INTO `sys_job_log` VALUES (1785, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:08:39');
INSERT INTO `sys_job_log` VALUES (1786, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:39');
INSERT INTO `sys_job_log` VALUES (1787, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:49');
INSERT INTO `sys_job_log` VALUES (1788, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:49');
INSERT INTO `sys_job_log` VALUES (1789, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:08:49');
INSERT INTO `sys_job_log` VALUES (1790, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:59');
INSERT INTO `sys_job_log` VALUES (1791, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:08:59');
INSERT INTO `sys_job_log` VALUES (1792, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:08:59');
INSERT INTO `sys_job_log` VALUES (1793, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:08:59');
INSERT INTO `sys_job_log` VALUES (1794, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:09');
INSERT INTO `sys_job_log` VALUES (1795, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:09');
INSERT INTO `sys_job_log` VALUES (1796, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:09:09');
INSERT INTO `sys_job_log` VALUES (1797, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:09:09');
INSERT INTO `sys_job_log` VALUES (1798, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:09:09');
INSERT INTO `sys_job_log` VALUES (1799, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:09:19');
INSERT INTO `sys_job_log` VALUES (1800, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:19');
INSERT INTO `sys_job_log` VALUES (1801, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:09:19');
INSERT INTO `sys_job_log` VALUES (1802, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:19');
INSERT INTO `sys_job_log` VALUES (1803, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:29');
INSERT INTO `sys_job_log` VALUES (1804, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:09:29');
INSERT INTO `sys_job_log` VALUES (1805, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 12:09:29');
INSERT INTO `sys_job_log` VALUES (1806, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:09:29');
INSERT INTO `sys_job_log` VALUES (1807, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:17:28');
INSERT INTO `sys_job_log` VALUES (1808, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:17:28');
INSERT INTO `sys_job_log` VALUES (1809, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 12:17:28');
INSERT INTO `sys_job_log` VALUES (1810, 'task:system:loginInfor', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:17:28');
INSERT INTO `sys_job_log` VALUES (1811, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:17:37');
INSERT INTO `sys_job_log` VALUES (1812, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 12:17:37');
INSERT INTO `sys_job_log` VALUES (1813, 'task:system:joblog', '100', '耗时 176 毫秒', '0', '', '2023-06-13 12:17:37');
INSERT INTO `sys_job_log` VALUES (1814, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:17:37');
INSERT INTO `sys_job_log` VALUES (1815, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:17:47');
INSERT INTO `sys_job_log` VALUES (1816, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:17:47');
INSERT INTO `sys_job_log` VALUES (1817, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 12:17:47');
INSERT INTO `sys_job_log` VALUES (1818, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:17:47');
INSERT INTO `sys_job_log` VALUES (1819, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:17:47');
INSERT INTO `sys_job_log` VALUES (1820, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:17:57');
INSERT INTO `sys_job_log` VALUES (1821, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:17:57');
INSERT INTO `sys_job_log` VALUES (1822, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:07');
INSERT INTO `sys_job_log` VALUES (1823, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:07');
INSERT INTO `sys_job_log` VALUES (1824, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:18:07');
INSERT INTO `sys_job_log` VALUES (1825, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:07');
INSERT INTO `sys_job_log` VALUES (1826, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:18:07');
INSERT INTO `sys_job_log` VALUES (1827, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:18:17');
INSERT INTO `sys_job_log` VALUES (1828, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:18:17');
INSERT INTO `sys_job_log` VALUES (1829, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:18:17');
INSERT INTO `sys_job_log` VALUES (1830, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:17');
INSERT INTO `sys_job_log` VALUES (1831, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:27');
INSERT INTO `sys_job_log` VALUES (1832, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:18:27');
INSERT INTO `sys_job_log` VALUES (1833, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 12:18:27');
INSERT INTO `sys_job_log` VALUES (1834, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:27');
INSERT INTO `sys_job_log` VALUES (1835, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:27');
INSERT INTO `sys_job_log` VALUES (1836, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 12:18:37');
INSERT INTO `sys_job_log` VALUES (1837, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:18:47');
INSERT INTO `sys_job_log` VALUES (1838, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:47');
INSERT INTO `sys_job_log` VALUES (1839, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:18:47');
INSERT INTO `sys_job_log` VALUES (1840, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:47');
INSERT INTO `sys_job_log` VALUES (1841, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:47');
INSERT INTO `sys_job_log` VALUES (1842, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 12:18:57');
INSERT INTO `sys_job_log` VALUES (1843, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:18:57');
INSERT INTO `sys_job_log` VALUES (1844, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:07');
INSERT INTO `sys_job_log` VALUES (1845, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:07');
INSERT INTO `sys_job_log` VALUES (1846, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:19:07');
INSERT INTO `sys_job_log` VALUES (1847, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:07');
INSERT INTO `sys_job_log` VALUES (1848, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:07');
INSERT INTO `sys_job_log` VALUES (1849, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:17');
INSERT INTO `sys_job_log` VALUES (1850, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:17');
INSERT INTO `sys_job_log` VALUES (1851, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:19:17');
INSERT INTO `sys_job_log` VALUES (1852, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:17');
INSERT INTO `sys_job_log` VALUES (1853, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:27');
INSERT INTO `sys_job_log` VALUES (1854, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:27');
INSERT INTO `sys_job_log` VALUES (1855, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 12:19:27');
INSERT INTO `sys_job_log` VALUES (1856, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:27');
INSERT INTO `sys_job_log` VALUES (1857, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:27');
INSERT INTO `sys_job_log` VALUES (1858, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:37');
INSERT INTO `sys_job_log` VALUES (1859, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:19:37');
INSERT INTO `sys_job_log` VALUES (1860, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:37');
INSERT INTO `sys_job_log` VALUES (1861, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:37');
INSERT INTO `sys_job_log` VALUES (1862, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:19:47');
INSERT INTO `sys_job_log` VALUES (1863, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:19:47');
INSERT INTO `sys_job_log` VALUES (1864, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:47');
INSERT INTO `sys_job_log` VALUES (1865, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:57');
INSERT INTO `sys_job_log` VALUES (1866, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:57');
INSERT INTO `sys_job_log` VALUES (1867, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:19:57');
INSERT INTO `sys_job_log` VALUES (1868, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:19:57');
INSERT INTO `sys_job_log` VALUES (1869, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:07');
INSERT INTO `sys_job_log` VALUES (1870, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:07');
INSERT INTO `sys_job_log` VALUES (1871, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:20:07');
INSERT INTO `sys_job_log` VALUES (1872, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:07');
INSERT INTO `sys_job_log` VALUES (1873, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:07');
INSERT INTO `sys_job_log` VALUES (1874, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:17');
INSERT INTO `sys_job_log` VALUES (1875, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:20:17');
INSERT INTO `sys_job_log` VALUES (1876, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:17');
INSERT INTO `sys_job_log` VALUES (1877, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:17');
INSERT INTO `sys_job_log` VALUES (1878, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:27');
INSERT INTO `sys_job_log` VALUES (1879, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:20:27');
INSERT INTO `sys_job_log` VALUES (1880, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:27');
INSERT INTO `sys_job_log` VALUES (1881, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:27');
INSERT INTO `sys_job_log` VALUES (1882, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:37');
INSERT INTO `sys_job_log` VALUES (1883, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:20:37');
INSERT INTO `sys_job_log` VALUES (1884, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:47');
INSERT INTO `sys_job_log` VALUES (1885, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:47');
INSERT INTO `sys_job_log` VALUES (1886, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 12:20:47');
INSERT INTO `sys_job_log` VALUES (1887, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:47');
INSERT INTO `sys_job_log` VALUES (1888, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:47');
INSERT INTO `sys_job_log` VALUES (1889, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:20:57');
INSERT INTO `sys_job_log` VALUES (1890, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:20:57');
INSERT INTO `sys_job_log` VALUES (1891, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:20:57');
INSERT INTO `sys_job_log` VALUES (1892, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:07');
INSERT INTO `sys_job_log` VALUES (1893, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:07');
INSERT INTO `sys_job_log` VALUES (1894, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:21:07');
INSERT INTO `sys_job_log` VALUES (1895, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:07');
INSERT INTO `sys_job_log` VALUES (1896, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:07');
INSERT INTO `sys_job_log` VALUES (1897, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:17');
INSERT INTO `sys_job_log` VALUES (1898, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:17');
INSERT INTO `sys_job_log` VALUES (1899, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 12:21:17');
INSERT INTO `sys_job_log` VALUES (1900, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:17');
INSERT INTO `sys_job_log` VALUES (1901, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:28');
INSERT INTO `sys_job_log` VALUES (1902, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:28');
INSERT INTO `sys_job_log` VALUES (1903, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:21:28');
INSERT INTO `sys_job_log` VALUES (1904, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:28');
INSERT INTO `sys_job_log` VALUES (1905, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:37');
INSERT INTO `sys_job_log` VALUES (1906, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:37');
INSERT INTO `sys_job_log` VALUES (1907, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:21:37');
INSERT INTO `sys_job_log` VALUES (1908, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:37');
INSERT INTO `sys_job_log` VALUES (1909, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:21:47');
INSERT INTO `sys_job_log` VALUES (1910, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:47');
INSERT INTO `sys_job_log` VALUES (1911, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:21:47');
INSERT INTO `sys_job_log` VALUES (1912, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:57');
INSERT INTO `sys_job_log` VALUES (1913, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:57');
INSERT INTO `sys_job_log` VALUES (1914, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:21:57');
INSERT INTO `sys_job_log` VALUES (1915, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:57');
INSERT INTO `sys_job_log` VALUES (1916, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:21:57');
INSERT INTO `sys_job_log` VALUES (1917, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:07');
INSERT INTO `sys_job_log` VALUES (1918, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:22:07');
INSERT INTO `sys_job_log` VALUES (1919, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:07');
INSERT INTO `sys_job_log` VALUES (1920, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:07');
INSERT INTO `sys_job_log` VALUES (1921, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:17');
INSERT INTO `sys_job_log` VALUES (1922, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:17');
INSERT INTO `sys_job_log` VALUES (1923, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 12:22:17');
INSERT INTO `sys_job_log` VALUES (1924, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:17');
INSERT INTO `sys_job_log` VALUES (1925, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:27');
INSERT INTO `sys_job_log` VALUES (1926, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:27');
INSERT INTO `sys_job_log` VALUES (1927, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:22:27');
INSERT INTO `sys_job_log` VALUES (1928, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:27');
INSERT INTO `sys_job_log` VALUES (1929, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:37');
INSERT INTO `sys_job_log` VALUES (1930, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:37');
INSERT INTO `sys_job_log` VALUES (1931, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 12:22:37');
INSERT INTO `sys_job_log` VALUES (1932, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:47');
INSERT INTO `sys_job_log` VALUES (1933, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:47');
INSERT INTO `sys_job_log` VALUES (1934, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:22:47');
INSERT INTO `sys_job_log` VALUES (1935, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:47');
INSERT INTO `sys_job_log` VALUES (1936, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:57');
INSERT INTO `sys_job_log` VALUES (1937, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:57');
INSERT INTO `sys_job_log` VALUES (1938, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:22:57');
INSERT INTO `sys_job_log` VALUES (1939, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:22:57');
INSERT INTO `sys_job_log` VALUES (1940, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:22:57');
INSERT INTO `sys_job_log` VALUES (1941, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 12:23:07');
INSERT INTO `sys_job_log` VALUES (1942, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:23:07');
INSERT INTO `sys_job_log` VALUES (1943, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:23:07');
INSERT INTO `sys_job_log` VALUES (1944, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:23:17');
INSERT INTO `sys_job_log` VALUES (1945, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:23:17');
INSERT INTO `sys_job_log` VALUES (1946, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:23:17');
INSERT INTO `sys_job_log` VALUES (1947, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:23:17');
INSERT INTO `sys_job_log` VALUES (1948, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:23:27');
INSERT INTO `sys_job_log` VALUES (1949, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:23:27');
INSERT INTO `sys_job_log` VALUES (1950, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:23:27');
INSERT INTO `sys_job_log` VALUES (1951, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:23:27');
INSERT INTO `sys_job_log` VALUES (1952, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1953, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1954, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1955, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1956, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1957, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:50:05');
INSERT INTO `sys_job_log` VALUES (1958, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:50:13');
INSERT INTO `sys_job_log` VALUES (1959, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 12:50:13');
INSERT INTO `sys_job_log` VALUES (1960, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:50:23');
INSERT INTO `sys_job_log` VALUES (1961, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 12:50:23');
INSERT INTO `sys_job_log` VALUES (1962, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 12:50:23');
INSERT INTO `sys_job_log` VALUES (1963, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:50:23');
INSERT INTO `sys_job_log` VALUES (1964, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 12:50:33');
INSERT INTO `sys_job_log` VALUES (1965, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:33');
INSERT INTO `sys_job_log` VALUES (1966, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 12:50:33');
INSERT INTO `sys_job_log` VALUES (1967, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:33');
INSERT INTO `sys_job_log` VALUES (1968, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:33');
INSERT INTO `sys_job_log` VALUES (1969, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:43');
INSERT INTO `sys_job_log` VALUES (1970, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 12:50:43');
INSERT INTO `sys_job_log` VALUES (1971, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:43');
INSERT INTO `sys_job_log` VALUES (1972, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:43');
INSERT INTO `sys_job_log` VALUES (1973, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:53');
INSERT INTO `sys_job_log` VALUES (1974, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 12:50:53');
INSERT INTO `sys_job_log` VALUES (1975, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 12:50:53');
INSERT INTO `sys_job_log` VALUES (1976, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:07:52');
INSERT INTO `sys_job_log` VALUES (1977, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:07:52');
INSERT INTO `sys_job_log` VALUES (1978, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 13:07:52');
INSERT INTO `sys_job_log` VALUES (1979, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 13:07:52');
INSERT INTO `sys_job_log` VALUES (1980, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1981, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1982, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1983, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1984, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1985, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:08:01');
INSERT INTO `sys_job_log` VALUES (1986, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:08:11');
INSERT INTO `sys_job_log` VALUES (1987, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:08:11');
INSERT INTO `sys_job_log` VALUES (1988, 'task:system:joblog', '100', '耗时 15 毫秒', '0', '', '2023-06-13 13:08:11');
INSERT INTO `sys_job_log` VALUES (1989, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:11');
INSERT INTO `sys_job_log` VALUES (1990, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:21');
INSERT INTO `sys_job_log` VALUES (1991, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:21');
INSERT INTO `sys_job_log` VALUES (1992, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 13:08:21');
INSERT INTO `sys_job_log` VALUES (1993, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:21');
INSERT INTO `sys_job_log` VALUES (1994, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:31');
INSERT INTO `sys_job_log` VALUES (1995, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:08:31');
INSERT INTO `sys_job_log` VALUES (1996, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 13:08:31');
INSERT INTO `sys_job_log` VALUES (1997, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:08:31');
INSERT INTO `sys_job_log` VALUES (1998, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:26:33');
INSERT INTO `sys_job_log` VALUES (1999, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:26:33');
INSERT INTO `sys_job_log` VALUES (2000, 'task:system:joblog', '100', '耗时 15 毫秒', '0', '', '2023-06-13 13:26:33');
INSERT INTO `sys_job_log` VALUES (2001, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:26:33');
INSERT INTO `sys_job_log` VALUES (2002, 'task:system:operlog', '100', '耗时 118 毫秒', '0', '', '2023-06-13 13:26:43');
INSERT INTO `sys_job_log` VALUES (2003, 'task:system:loginInfor', '100', '耗时 8 毫秒', '0', '', '2023-06-13 13:26:43');
INSERT INTO `sys_job_log` VALUES (2004, 'task:system:joblog', '100', '耗时 178 毫秒', '0', '', '2023-06-13 13:26:43');
INSERT INTO `sys_job_log` VALUES (2005, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:26:43');
INSERT INTO `sys_job_log` VALUES (2006, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:26:53');
INSERT INTO `sys_job_log` VALUES (2007, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:26:53');
INSERT INTO `sys_job_log` VALUES (2008, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 13:26:53');
INSERT INTO `sys_job_log` VALUES (2009, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:26:53');
INSERT INTO `sys_job_log` VALUES (2010, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:27:03');
INSERT INTO `sys_job_log` VALUES (2011, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:27:03');
INSERT INTO `sys_job_log` VALUES (2012, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 13:27:03');
INSERT INTO `sys_job_log` VALUES (2013, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:27:03');
INSERT INTO `sys_job_log` VALUES (2014, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:27:03');
INSERT INTO `sys_job_log` VALUES (2015, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:27:13');
INSERT INTO `sys_job_log` VALUES (2016, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:27:13');
INSERT INTO `sys_job_log` VALUES (2017, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 13:27:13');
INSERT INTO `sys_job_log` VALUES (2018, 'task:system:loginInfor', '100', '耗时 4 毫秒', '0', '', '2023-06-13 13:27:13');
INSERT INTO `sys_job_log` VALUES (2019, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 13:27:13');
INSERT INTO `sys_job_log` VALUES (2020, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 13:44:00');
INSERT INTO `sys_job_log` VALUES (2021, 'task:system:joblog', '100', '耗时 117 毫秒', '0', '', '2023-06-13 13:44:00');
INSERT INTO `sys_job_log` VALUES (2022, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:44:00');
INSERT INTO `sys_job_log` VALUES (2023, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 13:44:00');
INSERT INTO `sys_job_log` VALUES (2024, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:44:00');
INSERT INTO `sys_job_log` VALUES (2025, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 13:44:09');
INSERT INTO `sys_job_log` VALUES (2026, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 13:44:09');
INSERT INTO `sys_job_log` VALUES (2027, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 13:44:09');
INSERT INTO `sys_job_log` VALUES (2028, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:09');
INSERT INTO `sys_job_log` VALUES (2029, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:19');
INSERT INTO `sys_job_log` VALUES (2030, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 13:44:19');
INSERT INTO `sys_job_log` VALUES (2031, 'task:system:joblog', '100', '耗时 15 毫秒', '0', '', '2023-06-13 13:44:19');
INSERT INTO `sys_job_log` VALUES (2032, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:29');
INSERT INTO `sys_job_log` VALUES (2033, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:29');
INSERT INTO `sys_job_log` VALUES (2034, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 13:44:29');
INSERT INTO `sys_job_log` VALUES (2035, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:29');
INSERT INTO `sys_job_log` VALUES (2036, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:39');
INSERT INTO `sys_job_log` VALUES (2037, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:39');
INSERT INTO `sys_job_log` VALUES (2038, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 13:44:39');
INSERT INTO `sys_job_log` VALUES (2039, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 13:44:39');
INSERT INTO `sys_job_log` VALUES (2040, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:07');
INSERT INTO `sys_job_log` VALUES (2041, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:00:07');
INSERT INTO `sys_job_log` VALUES (2042, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 14:00:07');
INSERT INTO `sys_job_log` VALUES (2043, 'task:system:operlog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:00:07');
INSERT INTO `sys_job_log` VALUES (2044, 'task:system:operlog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:00:17');
INSERT INTO `sys_job_log` VALUES (2045, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:00:17');
INSERT INTO `sys_job_log` VALUES (2046, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:00:17');
INSERT INTO `sys_job_log` VALUES (2047, 'task:system:joblog', '100', '耗时 31 毫秒', '0', '', '2023-06-13 14:00:17');
INSERT INTO `sys_job_log` VALUES (2048, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:17');
INSERT INTO `sys_job_log` VALUES (2049, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:27');
INSERT INTO `sys_job_log` VALUES (2050, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:27');
INSERT INTO `sys_job_log` VALUES (2051, 'task:system:joblog', '100', '耗时 16 毫秒', '0', '', '2023-06-13 14:00:27');
INSERT INTO `sys_job_log` VALUES (2052, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:00:27');
INSERT INTO `sys_job_log` VALUES (2053, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:00:37');
INSERT INTO `sys_job_log` VALUES (2054, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:37');
INSERT INTO `sys_job_log` VALUES (2055, 'task:system:joblog', '100', '耗时 27 毫秒', '0', '', '2023-06-13 14:00:37');
INSERT INTO `sys_job_log` VALUES (2056, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:47');
INSERT INTO `sys_job_log` VALUES (2057, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:47');
INSERT INTO `sys_job_log` VALUES (2058, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:00:47');
INSERT INTO `sys_job_log` VALUES (2059, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:47');
INSERT INTO `sys_job_log` VALUES (2060, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:57');
INSERT INTO `sys_job_log` VALUES (2061, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:00:57');
INSERT INTO `sys_job_log` VALUES (2062, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 14:00:57');
INSERT INTO `sys_job_log` VALUES (2063, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:00:57');
INSERT INTO `sys_job_log` VALUES (2064, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:01:07');
INSERT INTO `sys_job_log` VALUES (2065, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:01:07');
INSERT INTO `sys_job_log` VALUES (2066, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 14:01:07');
INSERT INTO `sys_job_log` VALUES (2067, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:01:07');
INSERT INTO `sys_job_log` VALUES (2068, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:01:07');
INSERT INTO `sys_job_log` VALUES (2069, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:01:17');
INSERT INTO `sys_job_log` VALUES (2070, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:01:17');
INSERT INTO `sys_job_log` VALUES (2071, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 14:01:17');
INSERT INTO `sys_job_log` VALUES (2072, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:01:17');
INSERT INTO `sys_job_log` VALUES (2073, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:01:17');
INSERT INTO `sys_job_log` VALUES (2074, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:01:27');
INSERT INTO `sys_job_log` VALUES (2075, 'task:system:joblog', '100', '耗时 25 毫秒', '0', '', '2023-06-13 14:01:27');
INSERT INTO `sys_job_log` VALUES (2076, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:01:37');
INSERT INTO `sys_job_log` VALUES (2077, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:37');
INSERT INTO `sys_job_log` VALUES (2078, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:01:37');
INSERT INTO `sys_job_log` VALUES (2079, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:37');
INSERT INTO `sys_job_log` VALUES (2080, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:47');
INSERT INTO `sys_job_log` VALUES (2081, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:01:47');
INSERT INTO `sys_job_log` VALUES (2082, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:01:47');
INSERT INTO `sys_job_log` VALUES (2083, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:47');
INSERT INTO `sys_job_log` VALUES (2084, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:57');
INSERT INTO `sys_job_log` VALUES (2085, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:01:57');
INSERT INTO `sys_job_log` VALUES (2086, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:01:57');
INSERT INTO `sys_job_log` VALUES (2087, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2088, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2089, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2090, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2091, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2092, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:02:07');
INSERT INTO `sys_job_log` VALUES (2093, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:17:59');
INSERT INTO `sys_job_log` VALUES (2094, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:17:59');
INSERT INTO `sys_job_log` VALUES (2095, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:17:59');
INSERT INTO `sys_job_log` VALUES (2096, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:18:07');
INSERT INTO `sys_job_log` VALUES (2097, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:18:07');
INSERT INTO `sys_job_log` VALUES (2098, 'task:system:joblog', '100', '耗时 139 毫秒', '0', '', '2023-06-13 14:18:07');
INSERT INTO `sys_job_log` VALUES (2099, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:18:16');
INSERT INTO `sys_job_log` VALUES (2100, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:16');
INSERT INTO `sys_job_log` VALUES (2101, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:16');
INSERT INTO `sys_job_log` VALUES (2102, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:18:16');
INSERT INTO `sys_job_log` VALUES (2103, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:18:16');
INSERT INTO `sys_job_log` VALUES (2104, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:18:26');
INSERT INTO `sys_job_log` VALUES (2105, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:26');
INSERT INTO `sys_job_log` VALUES (2106, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:18:26');
INSERT INTO `sys_job_log` VALUES (2107, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:36');
INSERT INTO `sys_job_log` VALUES (2108, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:18:36');
INSERT INTO `sys_job_log` VALUES (2109, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:18:36');
INSERT INTO `sys_job_log` VALUES (2110, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:46');
INSERT INTO `sys_job_log` VALUES (2111, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:46');
INSERT INTO `sys_job_log` VALUES (2112, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:18:46');
INSERT INTO `sys_job_log` VALUES (2113, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:18:46');
INSERT INTO `sys_job_log` VALUES (2114, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:22:09');
INSERT INTO `sys_job_log` VALUES (2115, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:22:09');
INSERT INTO `sys_job_log` VALUES (2116, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:22:09');
INSERT INTO `sys_job_log` VALUES (2117, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:22:09');
INSERT INTO `sys_job_log` VALUES (2118, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2119, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2120, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2121, 'task:system:joblog', '100', '耗时 47 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2122, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2123, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:22:18');
INSERT INTO `sys_job_log` VALUES (2124, 'task:system:joblog', '100', '耗时 46 毫秒', '0', '', '2023-06-13 14:22:28');
INSERT INTO `sys_job_log` VALUES (2125, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:28');
INSERT INTO `sys_job_log` VALUES (2126, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:38');
INSERT INTO `sys_job_log` VALUES (2127, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:38');
INSERT INTO `sys_job_log` VALUES (2128, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:22:38');
INSERT INTO `sys_job_log` VALUES (2129, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:48');
INSERT INTO `sys_job_log` VALUES (2130, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:22:48');
INSERT INTO `sys_job_log` VALUES (2131, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:22:48');
INSERT INTO `sys_job_log` VALUES (2132, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:48');
INSERT INTO `sys_job_log` VALUES (2133, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:58');
INSERT INTO `sys_job_log` VALUES (2134, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:58');
INSERT INTO `sys_job_log` VALUES (2135, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:22:58');
INSERT INTO `sys_job_log` VALUES (2136, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:22:58');
INSERT INTO `sys_job_log` VALUES (2137, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:23:08');
INSERT INTO `sys_job_log` VALUES (2138, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:23:08');
INSERT INTO `sys_job_log` VALUES (2139, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:08');
INSERT INTO `sys_job_log` VALUES (2140, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:18');
INSERT INTO `sys_job_log` VALUES (2141, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:18');
INSERT INTO `sys_job_log` VALUES (2142, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:23:18');
INSERT INTO `sys_job_log` VALUES (2143, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:23:18');
INSERT INTO `sys_job_log` VALUES (2144, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:23:28');
INSERT INTO `sys_job_log` VALUES (2145, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:28');
INSERT INTO `sys_job_log` VALUES (2146, 'task:system:joblog', '100', '耗时 15 毫秒', '0', '', '2023-06-13 14:23:28');
INSERT INTO `sys_job_log` VALUES (2147, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:28');
INSERT INTO `sys_job_log` VALUES (2148, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:38');
INSERT INTO `sys_job_log` VALUES (2149, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:38');
INSERT INTO `sys_job_log` VALUES (2150, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:23:38');
INSERT INTO `sys_job_log` VALUES (2151, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:38');
INSERT INTO `sys_job_log` VALUES (2152, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:48');
INSERT INTO `sys_job_log` VALUES (2153, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:48');
INSERT INTO `sys_job_log` VALUES (2154, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:23:48');
INSERT INTO `sys_job_log` VALUES (2155, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:48');
INSERT INTO `sys_job_log` VALUES (2156, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:58');
INSERT INTO `sys_job_log` VALUES (2157, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:23:58');
INSERT INTO `sys_job_log` VALUES (2158, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:23:58');
INSERT INTO `sys_job_log` VALUES (2159, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:08');
INSERT INTO `sys_job_log` VALUES (2160, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:08');
INSERT INTO `sys_job_log` VALUES (2161, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:24:08');
INSERT INTO `sys_job_log` VALUES (2162, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:08');
INSERT INTO `sys_job_log` VALUES (2163, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:08');
INSERT INTO `sys_job_log` VALUES (2164, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:18');
INSERT INTO `sys_job_log` VALUES (2165, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:18');
INSERT INTO `sys_job_log` VALUES (2166, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:24:18');
INSERT INTO `sys_job_log` VALUES (2167, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:24:18');
INSERT INTO `sys_job_log` VALUES (2168, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:24:28');
INSERT INTO `sys_job_log` VALUES (2169, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:28');
INSERT INTO `sys_job_log` VALUES (2170, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:24:28');
INSERT INTO `sys_job_log` VALUES (2171, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:28');
INSERT INTO `sys_job_log` VALUES (2172, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:38');
INSERT INTO `sys_job_log` VALUES (2173, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:38');
INSERT INTO `sys_job_log` VALUES (2174, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:24:38');
INSERT INTO `sys_job_log` VALUES (2175, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:38');
INSERT INTO `sys_job_log` VALUES (2176, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:48');
INSERT INTO `sys_job_log` VALUES (2177, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:48');
INSERT INTO `sys_job_log` VALUES (2178, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:24:48');
INSERT INTO `sys_job_log` VALUES (2179, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:48');
INSERT INTO `sys_job_log` VALUES (2180, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:48');
INSERT INTO `sys_job_log` VALUES (2181, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:58');
INSERT INTO `sys_job_log` VALUES (2182, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:24:58');
INSERT INTO `sys_job_log` VALUES (2183, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:58');
INSERT INTO `sys_job_log` VALUES (2184, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:24:58');
INSERT INTO `sys_job_log` VALUES (2185, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:25:08');
INSERT INTO `sys_job_log` VALUES (2186, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:08');
INSERT INTO `sys_job_log` VALUES (2187, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:08');
INSERT INTO `sys_job_log` VALUES (2188, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:18');
INSERT INTO `sys_job_log` VALUES (2189, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:18');
INSERT INTO `sys_job_log` VALUES (2190, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:25:18');
INSERT INTO `sys_job_log` VALUES (2191, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:18');
INSERT INTO `sys_job_log` VALUES (2192, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:28');
INSERT INTO `sys_job_log` VALUES (2193, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:28');
INSERT INTO `sys_job_log` VALUES (2194, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:25:28');
INSERT INTO `sys_job_log` VALUES (2195, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:28');
INSERT INTO `sys_job_log` VALUES (2196, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:28');
INSERT INTO `sys_job_log` VALUES (2197, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:25:38');
INSERT INTO `sys_job_log` VALUES (2198, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:38');
INSERT INTO `sys_job_log` VALUES (2199, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:48');
INSERT INTO `sys_job_log` VALUES (2200, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:48');
INSERT INTO `sys_job_log` VALUES (2201, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:25:48');
INSERT INTO `sys_job_log` VALUES (2202, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:48');
INSERT INTO `sys_job_log` VALUES (2203, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:48');
INSERT INTO `sys_job_log` VALUES (2204, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:58');
INSERT INTO `sys_job_log` VALUES (2205, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:25:58');
INSERT INTO `sys_job_log` VALUES (2206, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:25:58');
INSERT INTO `sys_job_log` VALUES (2207, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:08');
INSERT INTO `sys_job_log` VALUES (2208, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:08');
INSERT INTO `sys_job_log` VALUES (2209, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:26:08');
INSERT INTO `sys_job_log` VALUES (2210, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:08');
INSERT INTO `sys_job_log` VALUES (2211, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:18');
INSERT INTO `sys_job_log` VALUES (2212, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:18');
INSERT INTO `sys_job_log` VALUES (2213, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:26:18');
INSERT INTO `sys_job_log` VALUES (2214, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:18');
INSERT INTO `sys_job_log` VALUES (2215, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:28');
INSERT INTO `sys_job_log` VALUES (2216, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:28');
INSERT INTO `sys_job_log` VALUES (2217, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:26:28');
INSERT INTO `sys_job_log` VALUES (2218, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:28');
INSERT INTO `sys_job_log` VALUES (2219, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:38');
INSERT INTO `sys_job_log` VALUES (2220, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:38');
INSERT INTO `sys_job_log` VALUES (2221, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:26:38');
INSERT INTO `sys_job_log` VALUES (2222, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:26:38');
INSERT INTO `sys_job_log` VALUES (2223, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:26:48');
INSERT INTO `sys_job_log` VALUES (2224, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:26:48');
INSERT INTO `sys_job_log` VALUES (2225, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:26:48');
INSERT INTO `sys_job_log` VALUES (2226, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:48');
INSERT INTO `sys_job_log` VALUES (2227, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:26:48');
INSERT INTO `sys_job_log` VALUES (2228, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:26:58');
INSERT INTO `sys_job_log` VALUES (2229, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:08');
INSERT INTO `sys_job_log` VALUES (2230, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:08');
INSERT INTO `sys_job_log` VALUES (2231, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:27:08');
INSERT INTO `sys_job_log` VALUES (2232, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:08');
INSERT INTO `sys_job_log` VALUES (2233, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:27:18');
INSERT INTO `sys_job_log` VALUES (2234, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:18');
INSERT INTO `sys_job_log` VALUES (2235, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:27:18');
INSERT INTO `sys_job_log` VALUES (2236, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:18');
INSERT INTO `sys_job_log` VALUES (2237, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:28');
INSERT INTO `sys_job_log` VALUES (2238, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:28');
INSERT INTO `sys_job_log` VALUES (2239, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:27:28');
INSERT INTO `sys_job_log` VALUES (2240, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:28');
INSERT INTO `sys_job_log` VALUES (2241, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:38');
INSERT INTO `sys_job_log` VALUES (2242, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:38');
INSERT INTO `sys_job_log` VALUES (2243, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:27:38');
INSERT INTO `sys_job_log` VALUES (2244, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:38');
INSERT INTO `sys_job_log` VALUES (2245, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:48');
INSERT INTO `sys_job_log` VALUES (2246, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:48');
INSERT INTO `sys_job_log` VALUES (2247, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:27:48');
INSERT INTO `sys_job_log` VALUES (2248, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:48');
INSERT INTO `sys_job_log` VALUES (2249, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:27:58');
INSERT INTO `sys_job_log` VALUES (2250, 'task:system:loginInfor', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:27:58');
INSERT INTO `sys_job_log` VALUES (2251, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:27:58');
INSERT INTO `sys_job_log` VALUES (2252, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:27:58');
INSERT INTO `sys_job_log` VALUES (2253, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2254, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2255, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2256, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2257, 'task:system:operlog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2258, 'task:system:loginInfor', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:28:09');
INSERT INTO `sys_job_log` VALUES (2259, 'task:system:loginInfor', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:28:18');
INSERT INTO `sys_job_log` VALUES (2260, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:28:18');
INSERT INTO `sys_job_log` VALUES (2261, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:18');
INSERT INTO `sys_job_log` VALUES (2262, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:28');
INSERT INTO `sys_job_log` VALUES (2263, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:28');
INSERT INTO `sys_job_log` VALUES (2264, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:28:28');
INSERT INTO `sys_job_log` VALUES (2265, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:28');
INSERT INTO `sys_job_log` VALUES (2266, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:38');
INSERT INTO `sys_job_log` VALUES (2267, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:38');
INSERT INTO `sys_job_log` VALUES (2268, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:28:38');
INSERT INTO `sys_job_log` VALUES (2269, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:38');
INSERT INTO `sys_job_log` VALUES (2270, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:48');
INSERT INTO `sys_job_log` VALUES (2271, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:48');
INSERT INTO `sys_job_log` VALUES (2272, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:28:48');
INSERT INTO `sys_job_log` VALUES (2273, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:48');
INSERT INTO `sys_job_log` VALUES (2274, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:58');
INSERT INTO `sys_job_log` VALUES (2275, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:28:58');
INSERT INTO `sys_job_log` VALUES (2276, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:28:58');
INSERT INTO `sys_job_log` VALUES (2277, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:58');
INSERT INTO `sys_job_log` VALUES (2278, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:28:58');
INSERT INTO `sys_job_log` VALUES (2279, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:29:08');
INSERT INTO `sys_job_log` VALUES (2280, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:29:08');
INSERT INTO `sys_job_log` VALUES (2281, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:08');
INSERT INTO `sys_job_log` VALUES (2282, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:08');
INSERT INTO `sys_job_log` VALUES (2283, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:18');
INSERT INTO `sys_job_log` VALUES (2284, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:29:18');
INSERT INTO `sys_job_log` VALUES (2285, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:29:18');
INSERT INTO `sys_job_log` VALUES (2286, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:29:28');
INSERT INTO `sys_job_log` VALUES (2287, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:28');
INSERT INTO `sys_job_log` VALUES (2288, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:29:28');
INSERT INTO `sys_job_log` VALUES (2289, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:29:28');
INSERT INTO `sys_job_log` VALUES (2290, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:29:38');
INSERT INTO `sys_job_log` VALUES (2291, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:38');
INSERT INTO `sys_job_log` VALUES (2292, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:29:38');
INSERT INTO `sys_job_log` VALUES (2293, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:38');
INSERT INTO `sys_job_log` VALUES (2294, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:48');
INSERT INTO `sys_job_log` VALUES (2295, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:48');
INSERT INTO `sys_job_log` VALUES (2296, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:29:48');
INSERT INTO `sys_job_log` VALUES (2297, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:58');
INSERT INTO `sys_job_log` VALUES (2298, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:58');
INSERT INTO `sys_job_log` VALUES (2299, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:29:58');
INSERT INTO `sys_job_log` VALUES (2300, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:29:58');
INSERT INTO `sys_job_log` VALUES (2301, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:08');
INSERT INTO `sys_job_log` VALUES (2302, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:08');
INSERT INTO `sys_job_log` VALUES (2303, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:30:08');
INSERT INTO `sys_job_log` VALUES (2304, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:08');
INSERT INTO `sys_job_log` VALUES (2305, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:08');
INSERT INTO `sys_job_log` VALUES (2306, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:18');
INSERT INTO `sys_job_log` VALUES (2307, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:30:18');
INSERT INTO `sys_job_log` VALUES (2308, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:18');
INSERT INTO `sys_job_log` VALUES (2309, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:18');
INSERT INTO `sys_job_log` VALUES (2310, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:30:28');
INSERT INTO `sys_job_log` VALUES (2311, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:28');
INSERT INTO `sys_job_log` VALUES (2312, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:38');
INSERT INTO `sys_job_log` VALUES (2313, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:38');
INSERT INTO `sys_job_log` VALUES (2314, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:30:38');
INSERT INTO `sys_job_log` VALUES (2315, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:38');
INSERT INTO `sys_job_log` VALUES (2316, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:48');
INSERT INTO `sys_job_log` VALUES (2317, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:48');
INSERT INTO `sys_job_log` VALUES (2318, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:30:48');
INSERT INTO `sys_job_log` VALUES (2319, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:30:58');
INSERT INTO `sys_job_log` VALUES (2320, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:58');
INSERT INTO `sys_job_log` VALUES (2321, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:30:58');
INSERT INTO `sys_job_log` VALUES (2322, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:30:58');
INSERT INTO `sys_job_log` VALUES (2323, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:08');
INSERT INTO `sys_job_log` VALUES (2324, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:31:08');
INSERT INTO `sys_job_log` VALUES (2325, 'task:system:operlog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:31:08');
INSERT INTO `sys_job_log` VALUES (2326, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:08');
INSERT INTO `sys_job_log` VALUES (2327, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:31:18');
INSERT INTO `sys_job_log` VALUES (2328, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:31:18');
INSERT INTO `sys_job_log` VALUES (2329, 'task:system:joblog', '100', '耗时 18 毫秒', '0', '', '2023-06-13 14:31:18');
INSERT INTO `sys_job_log` VALUES (2330, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:18');
INSERT INTO `sys_job_log` VALUES (2331, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:31:18');
INSERT INTO `sys_job_log` VALUES (2332, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:31:28');
INSERT INTO `sys_job_log` VALUES (2333, 'task:system:joblog', '100', '耗时 27 毫秒', '0', '', '2023-06-13 14:31:28');
INSERT INTO `sys_job_log` VALUES (2334, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:31:28');
INSERT INTO `sys_job_log` VALUES (2335, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:31:28');
INSERT INTO `sys_job_log` VALUES (2336, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:31:38');
INSERT INTO `sys_job_log` VALUES (2337, 'task:system:joblog', '100', '耗时 76 毫秒', '0', '', '2023-06-13 14:31:38');
INSERT INTO `sys_job_log` VALUES (2338, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:38');
INSERT INTO `sys_job_log` VALUES (2339, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:38');
INSERT INTO `sys_job_log` VALUES (2340, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:31:48');
INSERT INTO `sys_job_log` VALUES (2341, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:48');
INSERT INTO `sys_job_log` VALUES (2342, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:58');
INSERT INTO `sys_job_log` VALUES (2343, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:31:58');
INSERT INTO `sys_job_log` VALUES (2344, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:31:58');
INSERT INTO `sys_job_log` VALUES (2345, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:31:58');
INSERT INTO `sys_job_log` VALUES (2346, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:08');
INSERT INTO `sys_job_log` VALUES (2347, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:08');
INSERT INTO `sys_job_log` VALUES (2348, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:32:08');
INSERT INTO `sys_job_log` VALUES (2349, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:08');
INSERT INTO `sys_job_log` VALUES (2350, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:18');
INSERT INTO `sys_job_log` VALUES (2351, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:32:18');
INSERT INTO `sys_job_log` VALUES (2352, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:32:18');
INSERT INTO `sys_job_log` VALUES (2353, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:28');
INSERT INTO `sys_job_log` VALUES (2354, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:28');
INSERT INTO `sys_job_log` VALUES (2355, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:32:28');
INSERT INTO `sys_job_log` VALUES (2356, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:32:28');
INSERT INTO `sys_job_log` VALUES (2357, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:32:38');
INSERT INTO `sys_job_log` VALUES (2358, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:38');
INSERT INTO `sys_job_log` VALUES (2359, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:32:38');
INSERT INTO `sys_job_log` VALUES (2360, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:38');
INSERT INTO `sys_job_log` VALUES (2361, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:48');
INSERT INTO `sys_job_log` VALUES (2362, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:48');
INSERT INTO `sys_job_log` VALUES (2363, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:32:48');
INSERT INTO `sys_job_log` VALUES (2364, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:48');
INSERT INTO `sys_job_log` VALUES (2365, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:48');
INSERT INTO `sys_job_log` VALUES (2366, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:58');
INSERT INTO `sys_job_log` VALUES (2367, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:32:58');
INSERT INTO `sys_job_log` VALUES (2368, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:32:58');
INSERT INTO `sys_job_log` VALUES (2369, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:32:58');
INSERT INTO `sys_job_log` VALUES (2370, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:08');
INSERT INTO `sys_job_log` VALUES (2371, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:33:08');
INSERT INTO `sys_job_log` VALUES (2372, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:08');
INSERT INTO `sys_job_log` VALUES (2373, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:08');
INSERT INTO `sys_job_log` VALUES (2374, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:18');
INSERT INTO `sys_job_log` VALUES (2375, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:18');
INSERT INTO `sys_job_log` VALUES (2376, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:33:18');
INSERT INTO `sys_job_log` VALUES (2377, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:18');
INSERT INTO `sys_job_log` VALUES (2378, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:28');
INSERT INTO `sys_job_log` VALUES (2379, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:28');
INSERT INTO `sys_job_log` VALUES (2380, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:33:28');
INSERT INTO `sys_job_log` VALUES (2381, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:28');
INSERT INTO `sys_job_log` VALUES (2382, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:38');
INSERT INTO `sys_job_log` VALUES (2383, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:38');
INSERT INTO `sys_job_log` VALUES (2384, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:33:38');
INSERT INTO `sys_job_log` VALUES (2385, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:38');
INSERT INTO `sys_job_log` VALUES (2386, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:33:38');
INSERT INTO `sys_job_log` VALUES (2387, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:33:48');
INSERT INTO `sys_job_log` VALUES (2388, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:58');
INSERT INTO `sys_job_log` VALUES (2389, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:58');
INSERT INTO `sys_job_log` VALUES (2390, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:33:58');
INSERT INTO `sys_job_log` VALUES (2391, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:58');
INSERT INTO `sys_job_log` VALUES (2392, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:33:58');
INSERT INTO `sys_job_log` VALUES (2393, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:34:08');
INSERT INTO `sys_job_log` VALUES (2394, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:08');
INSERT INTO `sys_job_log` VALUES (2395, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:34:18');
INSERT INTO `sys_job_log` VALUES (2396, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:18');
INSERT INTO `sys_job_log` VALUES (2397, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:34:18');
INSERT INTO `sys_job_log` VALUES (2398, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:18');
INSERT INTO `sys_job_log` VALUES (2399, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:18');
INSERT INTO `sys_job_log` VALUES (2400, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:28');
INSERT INTO `sys_job_log` VALUES (2401, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:34:28');
INSERT INTO `sys_job_log` VALUES (2402, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:28');
INSERT INTO `sys_job_log` VALUES (2403, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:28');
INSERT INTO `sys_job_log` VALUES (2404, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:34:38');
INSERT INTO `sys_job_log` VALUES (2405, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:38');
INSERT INTO `sys_job_log` VALUES (2406, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:48');
INSERT INTO `sys_job_log` VALUES (2407, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:48');
INSERT INTO `sys_job_log` VALUES (2408, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:34:48');
INSERT INTO `sys_job_log` VALUES (2409, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:34:58');
INSERT INTO `sys_job_log` VALUES (2410, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:34:58');
INSERT INTO `sys_job_log` VALUES (2411, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:34:58');
INSERT INTO `sys_job_log` VALUES (2412, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:58');
INSERT INTO `sys_job_log` VALUES (2413, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:34:58');
INSERT INTO `sys_job_log` VALUES (2414, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:35:08');
INSERT INTO `sys_job_log` VALUES (2415, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:08');
INSERT INTO `sys_job_log` VALUES (2416, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:18');
INSERT INTO `sys_job_log` VALUES (2417, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:18');
INSERT INTO `sys_job_log` VALUES (2418, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:35:18');
INSERT INTO `sys_job_log` VALUES (2419, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:18');
INSERT INTO `sys_job_log` VALUES (2420, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:18');
INSERT INTO `sys_job_log` VALUES (2421, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:28');
INSERT INTO `sys_job_log` VALUES (2422, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:35:28');
INSERT INTO `sys_job_log` VALUES (2423, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:28');
INSERT INTO `sys_job_log` VALUES (2424, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:38');
INSERT INTO `sys_job_log` VALUES (2425, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:38');
INSERT INTO `sys_job_log` VALUES (2426, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:35:38');
INSERT INTO `sys_job_log` VALUES (2427, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:35:38');
INSERT INTO `sys_job_log` VALUES (2428, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:35:48');
INSERT INTO `sys_job_log` VALUES (2429, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:48');
INSERT INTO `sys_job_log` VALUES (2430, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:35:48');
INSERT INTO `sys_job_log` VALUES (2431, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:48');
INSERT INTO `sys_job_log` VALUES (2432, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:58');
INSERT INTO `sys_job_log` VALUES (2433, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:58');
INSERT INTO `sys_job_log` VALUES (2434, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:35:58');
INSERT INTO `sys_job_log` VALUES (2435, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:35:58');
INSERT INTO `sys_job_log` VALUES (2436, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:08');
INSERT INTO `sys_job_log` VALUES (2437, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:08');
INSERT INTO `sys_job_log` VALUES (2438, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:36:08');
INSERT INTO `sys_job_log` VALUES (2439, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:08');
INSERT INTO `sys_job_log` VALUES (2440, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:18');
INSERT INTO `sys_job_log` VALUES (2441, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:18');
INSERT INTO `sys_job_log` VALUES (2442, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:36:18');
INSERT INTO `sys_job_log` VALUES (2443, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:18');
INSERT INTO `sys_job_log` VALUES (2444, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:28');
INSERT INTO `sys_job_log` VALUES (2445, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:28');
INSERT INTO `sys_job_log` VALUES (2446, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:36:28');
INSERT INTO `sys_job_log` VALUES (2447, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:28');
INSERT INTO `sys_job_log` VALUES (2448, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:39');
INSERT INTO `sys_job_log` VALUES (2449, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:36:39');
INSERT INTO `sys_job_log` VALUES (2450, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:36:39');
INSERT INTO `sys_job_log` VALUES (2451, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:36:48');
INSERT INTO `sys_job_log` VALUES (2452, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:48');
INSERT INTO `sys_job_log` VALUES (2453, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:36:48');
INSERT INTO `sys_job_log` VALUES (2454, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:48');
INSERT INTO `sys_job_log` VALUES (2455, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:48');
INSERT INTO `sys_job_log` VALUES (2456, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:58');
INSERT INTO `sys_job_log` VALUES (2457, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:36:58');
INSERT INTO `sys_job_log` VALUES (2458, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:36:58');
INSERT INTO `sys_job_log` VALUES (2459, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:36:58');
INSERT INTO `sys_job_log` VALUES (2460, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:37:08');
INSERT INTO `sys_job_log` VALUES (2461, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:08');
INSERT INTO `sys_job_log` VALUES (2462, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:08');
INSERT INTO `sys_job_log` VALUES (2463, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:08');
INSERT INTO `sys_job_log` VALUES (2464, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:18');
INSERT INTO `sys_job_log` VALUES (2465, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:37:18');
INSERT INTO `sys_job_log` VALUES (2466, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:18');
INSERT INTO `sys_job_log` VALUES (2467, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:18');
INSERT INTO `sys_job_log` VALUES (2468, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:28');
INSERT INTO `sys_job_log` VALUES (2469, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:37:28');
INSERT INTO `sys_job_log` VALUES (2470, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:28');
INSERT INTO `sys_job_log` VALUES (2471, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:38');
INSERT INTO `sys_job_log` VALUES (2472, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:38');
INSERT INTO `sys_job_log` VALUES (2473, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:37:38');
INSERT INTO `sys_job_log` VALUES (2474, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:38');
INSERT INTO `sys_job_log` VALUES (2475, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:48');
INSERT INTO `sys_job_log` VALUES (2476, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:48');
INSERT INTO `sys_job_log` VALUES (2477, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:37:48');
INSERT INTO `sys_job_log` VALUES (2478, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:37:48');
INSERT INTO `sys_job_log` VALUES (2479, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:37:58');
INSERT INTO `sys_job_log` VALUES (2480, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:37:58');
INSERT INTO `sys_job_log` VALUES (2481, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:37:58');
INSERT INTO `sys_job_log` VALUES (2482, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:38:08');
INSERT INTO `sys_job_log` VALUES (2483, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:08');
INSERT INTO `sys_job_log` VALUES (2484, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:38:08');
INSERT INTO `sys_job_log` VALUES (2485, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:08');
INSERT INTO `sys_job_log` VALUES (2486, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:08');
INSERT INTO `sys_job_log` VALUES (2487, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:18');
INSERT INTO `sys_job_log` VALUES (2488, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:18');
INSERT INTO `sys_job_log` VALUES (2489, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:38:18');
INSERT INTO `sys_job_log` VALUES (2490, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:28');
INSERT INTO `sys_job_log` VALUES (2491, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:28');
INSERT INTO `sys_job_log` VALUES (2492, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:38:28');
INSERT INTO `sys_job_log` VALUES (2493, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:38:28');
INSERT INTO `sys_job_log` VALUES (2494, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:38:38');
INSERT INTO `sys_job_log` VALUES (2495, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:38:38');
INSERT INTO `sys_job_log` VALUES (2496, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:38');
INSERT INTO `sys_job_log` VALUES (2497, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:38');
INSERT INTO `sys_job_log` VALUES (2498, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:38:48');
INSERT INTO `sys_job_log` VALUES (2499, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:48');
INSERT INTO `sys_job_log` VALUES (2500, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:58');
INSERT INTO `sys_job_log` VALUES (2501, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:38:58');
INSERT INTO `sys_job_log` VALUES (2502, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:38:58');
INSERT INTO `sys_job_log` VALUES (2503, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:08');
INSERT INTO `sys_job_log` VALUES (2504, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:08');
INSERT INTO `sys_job_log` VALUES (2505, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:39:08');
INSERT INTO `sys_job_log` VALUES (2506, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:08');
INSERT INTO `sys_job_log` VALUES (2507, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:08');
INSERT INTO `sys_job_log` VALUES (2508, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:18');
INSERT INTO `sys_job_log` VALUES (2509, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:18');
INSERT INTO `sys_job_log` VALUES (2510, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:39:18');
INSERT INTO `sys_job_log` VALUES (2511, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:28');
INSERT INTO `sys_job_log` VALUES (2512, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:28');
INSERT INTO `sys_job_log` VALUES (2513, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:39:28');
INSERT INTO `sys_job_log` VALUES (2514, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:28');
INSERT INTO `sys_job_log` VALUES (2515, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:38');
INSERT INTO `sys_job_log` VALUES (2516, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:38');
INSERT INTO `sys_job_log` VALUES (2517, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:39:38');
INSERT INTO `sys_job_log` VALUES (2518, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:38');
INSERT INTO `sys_job_log` VALUES (2519, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:38');
INSERT INTO `sys_job_log` VALUES (2520, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:48');
INSERT INTO `sys_job_log` VALUES (2521, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:39:48');
INSERT INTO `sys_job_log` VALUES (2522, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:58');
INSERT INTO `sys_job_log` VALUES (2523, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:39:58');
INSERT INTO `sys_job_log` VALUES (2524, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:39:58');
INSERT INTO `sys_job_log` VALUES (2525, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:39:58');
INSERT INTO `sys_job_log` VALUES (2526, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:40:08');
INSERT INTO `sys_job_log` VALUES (2527, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:08');
INSERT INTO `sys_job_log` VALUES (2528, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:40:08');
INSERT INTO `sys_job_log` VALUES (2529, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:08');
INSERT INTO `sys_job_log` VALUES (2530, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:40:08');
INSERT INTO `sys_job_log` VALUES (2531, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:40:18');
INSERT INTO `sys_job_log` VALUES (2532, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:18');
INSERT INTO `sys_job_log` VALUES (2533, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:40:18');
INSERT INTO `sys_job_log` VALUES (2534, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:18');
INSERT INTO `sys_job_log` VALUES (2535, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:28');
INSERT INTO `sys_job_log` VALUES (2536, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:28');
INSERT INTO `sys_job_log` VALUES (2537, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:40:28');
INSERT INTO `sys_job_log` VALUES (2538, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:38');
INSERT INTO `sys_job_log` VALUES (2539, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:38');
INSERT INTO `sys_job_log` VALUES (2540, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:40:38');
INSERT INTO `sys_job_log` VALUES (2541, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:40:38');
INSERT INTO `sys_job_log` VALUES (2542, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:40:48');
INSERT INTO `sys_job_log` VALUES (2543, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:48');
INSERT INTO `sys_job_log` VALUES (2544, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:40:48');
INSERT INTO `sys_job_log` VALUES (2545, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:48');
INSERT INTO `sys_job_log` VALUES (2546, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:58');
INSERT INTO `sys_job_log` VALUES (2547, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:58');
INSERT INTO `sys_job_log` VALUES (2548, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:40:58');
INSERT INTO `sys_job_log` VALUES (2549, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:58');
INSERT INTO `sys_job_log` VALUES (2550, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:40:58');
INSERT INTO `sys_job_log` VALUES (2551, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:41:08');
INSERT INTO `sys_job_log` VALUES (2552, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:08');
INSERT INTO `sys_job_log` VALUES (2553, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:08');
INSERT INTO `sys_job_log` VALUES (2554, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:18');
INSERT INTO `sys_job_log` VALUES (2555, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:18');
INSERT INTO `sys_job_log` VALUES (2556, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:41:18');
INSERT INTO `sys_job_log` VALUES (2557, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:28');
INSERT INTO `sys_job_log` VALUES (2558, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:28');
INSERT INTO `sys_job_log` VALUES (2559, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:41:28');
INSERT INTO `sys_job_log` VALUES (2560, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:28');
INSERT INTO `sys_job_log` VALUES (2561, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:28');
INSERT INTO `sys_job_log` VALUES (2562, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:38');
INSERT INTO `sys_job_log` VALUES (2563, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:41:38');
INSERT INTO `sys_job_log` VALUES (2564, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:38');
INSERT INTO `sys_job_log` VALUES (2565, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:48');
INSERT INTO `sys_job_log` VALUES (2566, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:48');
INSERT INTO `sys_job_log` VALUES (2567, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:41:48');
INSERT INTO `sys_job_log` VALUES (2568, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:48');
INSERT INTO `sys_job_log` VALUES (2569, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:58');
INSERT INTO `sys_job_log` VALUES (2570, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:41:58');
INSERT INTO `sys_job_log` VALUES (2571, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:41:58');
INSERT INTO `sys_job_log` VALUES (2572, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:41:58');
INSERT INTO `sys_job_log` VALUES (2573, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:08');
INSERT INTO `sys_job_log` VALUES (2574, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:08');
INSERT INTO `sys_job_log` VALUES (2575, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:42:08');
INSERT INTO `sys_job_log` VALUES (2576, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:08');
INSERT INTO `sys_job_log` VALUES (2577, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:08');
INSERT INTO `sys_job_log` VALUES (2578, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:18');
INSERT INTO `sys_job_log` VALUES (2579, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:18');
INSERT INTO `sys_job_log` VALUES (2580, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:42:18');
INSERT INTO `sys_job_log` VALUES (2581, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:28');
INSERT INTO `sys_job_log` VALUES (2582, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:28');
INSERT INTO `sys_job_log` VALUES (2583, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:42:28');
INSERT INTO `sys_job_log` VALUES (2584, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:38');
INSERT INTO `sys_job_log` VALUES (2585, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:38');
INSERT INTO `sys_job_log` VALUES (2586, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:42:38');
INSERT INTO `sys_job_log` VALUES (2587, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:42:38');
INSERT INTO `sys_job_log` VALUES (2588, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:42:48');
INSERT INTO `sys_job_log` VALUES (2589, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:42:48');
INSERT INTO `sys_job_log` VALUES (2590, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:42:48');
INSERT INTO `sys_job_log` VALUES (2591, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:58');
INSERT INTO `sys_job_log` VALUES (2592, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:58');
INSERT INTO `sys_job_log` VALUES (2593, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:42:58');
INSERT INTO `sys_job_log` VALUES (2594, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:58');
INSERT INTO `sys_job_log` VALUES (2595, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:42:58');
INSERT INTO `sys_job_log` VALUES (2596, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:08');
INSERT INTO `sys_job_log` VALUES (2597, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:43:08');
INSERT INTO `sys_job_log` VALUES (2598, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:08');
INSERT INTO `sys_job_log` VALUES (2599, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:08');
INSERT INTO `sys_job_log` VALUES (2600, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:18');
INSERT INTO `sys_job_log` VALUES (2601, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:18');
INSERT INTO `sys_job_log` VALUES (2602, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:43:18');
INSERT INTO `sys_job_log` VALUES (2603, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:28');
INSERT INTO `sys_job_log` VALUES (2604, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:43:28');
INSERT INTO `sys_job_log` VALUES (2605, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:43:28');
INSERT INTO `sys_job_log` VALUES (2606, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:43:28');
INSERT INTO `sys_job_log` VALUES (2607, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:43:38');
INSERT INTO `sys_job_log` VALUES (2608, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:38');
INSERT INTO `sys_job_log` VALUES (2609, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:43:38');
INSERT INTO `sys_job_log` VALUES (2610, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:43:38');
INSERT INTO `sys_job_log` VALUES (2611, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:43:48');
INSERT INTO `sys_job_log` VALUES (2612, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:48');
INSERT INTO `sys_job_log` VALUES (2613, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:43:48');
INSERT INTO `sys_job_log` VALUES (2614, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:48');
INSERT INTO `sys_job_log` VALUES (2615, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:58');
INSERT INTO `sys_job_log` VALUES (2616, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:43:58');
INSERT INTO `sys_job_log` VALUES (2617, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:43:58');
INSERT INTO `sys_job_log` VALUES (2618, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:08');
INSERT INTO `sys_job_log` VALUES (2619, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:08');
INSERT INTO `sys_job_log` VALUES (2620, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:44:08');
INSERT INTO `sys_job_log` VALUES (2621, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:08');
INSERT INTO `sys_job_log` VALUES (2622, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:08');
INSERT INTO `sys_job_log` VALUES (2623, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:18');
INSERT INTO `sys_job_log` VALUES (2624, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:18');
INSERT INTO `sys_job_log` VALUES (2625, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:44:18');
INSERT INTO `sys_job_log` VALUES (2626, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:28');
INSERT INTO `sys_job_log` VALUES (2627, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:44:28');
INSERT INTO `sys_job_log` VALUES (2628, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:44:28');
INSERT INTO `sys_job_log` VALUES (2629, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:28');
INSERT INTO `sys_job_log` VALUES (2630, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:38');
INSERT INTO `sys_job_log` VALUES (2631, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:38');
INSERT INTO `sys_job_log` VALUES (2632, 'task:system:joblog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:44:38');
INSERT INTO `sys_job_log` VALUES (2633, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:38');
INSERT INTO `sys_job_log` VALUES (2634, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:48');
INSERT INTO `sys_job_log` VALUES (2635, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:48');
INSERT INTO `sys_job_log` VALUES (2636, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:44:48');
INSERT INTO `sys_job_log` VALUES (2637, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:58');
INSERT INTO `sys_job_log` VALUES (2638, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:44:58');
INSERT INTO `sys_job_log` VALUES (2639, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:44:58');
INSERT INTO `sys_job_log` VALUES (2640, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:44:58');
INSERT INTO `sys_job_log` VALUES (2641, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:45:08');
INSERT INTO `sys_job_log` VALUES (2642, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:45:08');
INSERT INTO `sys_job_log` VALUES (2643, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:45:08');
INSERT INTO `sys_job_log` VALUES (2644, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:08');
INSERT INTO `sys_job_log` VALUES (2645, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:08');
INSERT INTO `sys_job_log` VALUES (2646, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:18');
INSERT INTO `sys_job_log` VALUES (2647, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:18');
INSERT INTO `sys_job_log` VALUES (2648, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:45:18');
INSERT INTO `sys_job_log` VALUES (2649, 'task:system:loginInfor', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:45:18');
INSERT INTO `sys_job_log` VALUES (2650, 'task:system:loginInfor', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:45:28');
INSERT INTO `sys_job_log` VALUES (2651, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 14:45:28');
INSERT INTO `sys_job_log` VALUES (2652, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:45:28');
INSERT INTO `sys_job_log` VALUES (2653, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:28');
INSERT INTO `sys_job_log` VALUES (2654, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:28');
INSERT INTO `sys_job_log` VALUES (2655, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:38');
INSERT INTO `sys_job_log` VALUES (2656, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:45:38');
INSERT INTO `sys_job_log` VALUES (2657, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:38');
INSERT INTO `sys_job_log` VALUES (2658, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:48');
INSERT INTO `sys_job_log` VALUES (2659, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:48');
INSERT INTO `sys_job_log` VALUES (2660, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:45:48');
INSERT INTO `sys_job_log` VALUES (2661, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:45:58');
INSERT INTO `sys_job_log` VALUES (2662, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:45:58');
INSERT INTO `sys_job_log` VALUES (2663, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:45:58');
INSERT INTO `sys_job_log` VALUES (2664, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:58');
INSERT INTO `sys_job_log` VALUES (2665, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:45:58');
INSERT INTO `sys_job_log` VALUES (2666, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:08');
INSERT INTO `sys_job_log` VALUES (2667, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:46:08');
INSERT INTO `sys_job_log` VALUES (2668, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:08');
INSERT INTO `sys_job_log` VALUES (2669, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:08');
INSERT INTO `sys_job_log` VALUES (2670, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:18');
INSERT INTO `sys_job_log` VALUES (2671, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:18');
INSERT INTO `sys_job_log` VALUES (2672, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:46:18');
INSERT INTO `sys_job_log` VALUES (2673, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:18');
INSERT INTO `sys_job_log` VALUES (2674, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:28');
INSERT INTO `sys_job_log` VALUES (2675, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:28');
INSERT INTO `sys_job_log` VALUES (2676, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:46:28');
INSERT INTO `sys_job_log` VALUES (2677, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:28');
INSERT INTO `sys_job_log` VALUES (2678, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:38');
INSERT INTO `sys_job_log` VALUES (2679, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:38');
INSERT INTO `sys_job_log` VALUES (2680, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:46:38');
INSERT INTO `sys_job_log` VALUES (2681, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:38');
INSERT INTO `sys_job_log` VALUES (2682, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:48');
INSERT INTO `sys_job_log` VALUES (2683, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:48');
INSERT INTO `sys_job_log` VALUES (2684, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:46:48');
INSERT INTO `sys_job_log` VALUES (2685, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:48');
INSERT INTO `sys_job_log` VALUES (2686, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:46:58');
INSERT INTO `sys_job_log` VALUES (2687, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:46:58');
INSERT INTO `sys_job_log` VALUES (2688, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:46:58');
INSERT INTO `sys_job_log` VALUES (2689, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:08');
INSERT INTO `sys_job_log` VALUES (2690, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:08');
INSERT INTO `sys_job_log` VALUES (2691, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:47:08');
INSERT INTO `sys_job_log` VALUES (2692, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:08');
INSERT INTO `sys_job_log` VALUES (2693, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:08');
INSERT INTO `sys_job_log` VALUES (2694, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:18');
INSERT INTO `sys_job_log` VALUES (2695, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:18');
INSERT INTO `sys_job_log` VALUES (2696, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:47:18');
INSERT INTO `sys_job_log` VALUES (2697, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:18');
INSERT INTO `sys_job_log` VALUES (2698, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:28');
INSERT INTO `sys_job_log` VALUES (2699, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:28');
INSERT INTO `sys_job_log` VALUES (2700, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:47:28');
INSERT INTO `sys_job_log` VALUES (2701, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:28');
INSERT INTO `sys_job_log` VALUES (2702, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:38');
INSERT INTO `sys_job_log` VALUES (2703, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:38');
INSERT INTO `sys_job_log` VALUES (2704, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:47:38');
INSERT INTO `sys_job_log` VALUES (2705, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:47:38');
INSERT INTO `sys_job_log` VALUES (2706, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:47:48');
INSERT INTO `sys_job_log` VALUES (2707, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:48');
INSERT INTO `sys_job_log` VALUES (2708, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:47:48');
INSERT INTO `sys_job_log` VALUES (2709, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:58');
INSERT INTO `sys_job_log` VALUES (2710, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:58');
INSERT INTO `sys_job_log` VALUES (2711, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:47:58');
INSERT INTO `sys_job_log` VALUES (2712, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:47:58');
INSERT INTO `sys_job_log` VALUES (2713, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:08');
INSERT INTO `sys_job_log` VALUES (2714, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:08');
INSERT INTO `sys_job_log` VALUES (2715, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:48:08');
INSERT INTO `sys_job_log` VALUES (2716, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:08');
INSERT INTO `sys_job_log` VALUES (2717, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:08');
INSERT INTO `sys_job_log` VALUES (2718, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:18');
INSERT INTO `sys_job_log` VALUES (2719, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:18');
INSERT INTO `sys_job_log` VALUES (2720, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:48:18');
INSERT INTO `sys_job_log` VALUES (2721, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:18');
INSERT INTO `sys_job_log` VALUES (2722, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:28');
INSERT INTO `sys_job_log` VALUES (2723, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:28');
INSERT INTO `sys_job_log` VALUES (2724, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:48:28');
INSERT INTO `sys_job_log` VALUES (2725, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:28');
INSERT INTO `sys_job_log` VALUES (2726, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:38');
INSERT INTO `sys_job_log` VALUES (2727, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:38');
INSERT INTO `sys_job_log` VALUES (2728, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:48:38');
INSERT INTO `sys_job_log` VALUES (2729, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:38');
INSERT INTO `sys_job_log` VALUES (2730, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:48');
INSERT INTO `sys_job_log` VALUES (2731, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:48');
INSERT INTO `sys_job_log` VALUES (2732, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:48:48');
INSERT INTO `sys_job_log` VALUES (2733, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:58');
INSERT INTO `sys_job_log` VALUES (2734, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:58');
INSERT INTO `sys_job_log` VALUES (2735, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:48:58');
INSERT INTO `sys_job_log` VALUES (2736, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:58');
INSERT INTO `sys_job_log` VALUES (2737, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:48:58');
INSERT INTO `sys_job_log` VALUES (2738, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:08');
INSERT INTO `sys_job_log` VALUES (2739, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:49:08');
INSERT INTO `sys_job_log` VALUES (2740, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:08');
INSERT INTO `sys_job_log` VALUES (2741, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:49:08');
INSERT INTO `sys_job_log` VALUES (2742, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:49:18');
INSERT INTO `sys_job_log` VALUES (2743, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:49:18');
INSERT INTO `sys_job_log` VALUES (2744, 'task:system:operlog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:49:18');
INSERT INTO `sys_job_log` VALUES (2745, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:49:18');
INSERT INTO `sys_job_log` VALUES (2746, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:49:29');
INSERT INTO `sys_job_log` VALUES (2747, 'task:system:operlog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:49:29');
INSERT INTO `sys_job_log` VALUES (2748, 'task:system:joblog', '100', '耗时 29 毫秒', '0', '', '2023-06-13 14:49:29');
INSERT INTO `sys_job_log` VALUES (2749, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:29');
INSERT INTO `sys_job_log` VALUES (2750, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:38');
INSERT INTO `sys_job_log` VALUES (2751, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:38');
INSERT INTO `sys_job_log` VALUES (2752, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:49:38');
INSERT INTO `sys_job_log` VALUES (2753, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:49:48');
INSERT INTO `sys_job_log` VALUES (2754, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:48');
INSERT INTO `sys_job_log` VALUES (2755, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:49:48');
INSERT INTO `sys_job_log` VALUES (2756, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:48');
INSERT INTO `sys_job_log` VALUES (2757, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:58');
INSERT INTO `sys_job_log` VALUES (2758, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:49:58');
INSERT INTO `sys_job_log` VALUES (2759, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:49:58');
INSERT INTO `sys_job_log` VALUES (2760, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:49:58');
INSERT INTO `sys_job_log` VALUES (2761, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:08');
INSERT INTO `sys_job_log` VALUES (2762, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:08');
INSERT INTO `sys_job_log` VALUES (2763, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:50:08');
INSERT INTO `sys_job_log` VALUES (2764, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:08');
INSERT INTO `sys_job_log` VALUES (2765, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:18');
INSERT INTO `sys_job_log` VALUES (2766, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:18');
INSERT INTO `sys_job_log` VALUES (2767, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:50:18');
INSERT INTO `sys_job_log` VALUES (2768, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:18');
INSERT INTO `sys_job_log` VALUES (2769, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:28');
INSERT INTO `sys_job_log` VALUES (2770, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:28');
INSERT INTO `sys_job_log` VALUES (2771, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:50:28');
INSERT INTO `sys_job_log` VALUES (2772, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:28');
INSERT INTO `sys_job_log` VALUES (2773, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:38');
INSERT INTO `sys_job_log` VALUES (2774, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:38');
INSERT INTO `sys_job_log` VALUES (2775, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:50:38');
INSERT INTO `sys_job_log` VALUES (2776, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:38');
INSERT INTO `sys_job_log` VALUES (2777, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:38');
INSERT INTO `sys_job_log` VALUES (2778, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:50:48');
INSERT INTO `sys_job_log` VALUES (2779, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:50:48');
INSERT INTO `sys_job_log` VALUES (2780, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:48');
INSERT INTO `sys_job_log` VALUES (2781, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:58');
INSERT INTO `sys_job_log` VALUES (2782, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:58');
INSERT INTO `sys_job_log` VALUES (2783, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:50:58');
INSERT INTO `sys_job_log` VALUES (2784, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:50:58');
INSERT INTO `sys_job_log` VALUES (2785, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:08');
INSERT INTO `sys_job_log` VALUES (2786, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:08');
INSERT INTO `sys_job_log` VALUES (2787, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:51:08');
INSERT INTO `sys_job_log` VALUES (2788, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:08');
INSERT INTO `sys_job_log` VALUES (2789, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:08');
INSERT INTO `sys_job_log` VALUES (2790, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:18');
INSERT INTO `sys_job_log` VALUES (2791, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:18');
INSERT INTO `sys_job_log` VALUES (2792, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:51:18');
INSERT INTO `sys_job_log` VALUES (2793, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:18');
INSERT INTO `sys_job_log` VALUES (2794, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:28');
INSERT INTO `sys_job_log` VALUES (2795, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:28');
INSERT INTO `sys_job_log` VALUES (2796, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:51:28');
INSERT INTO `sys_job_log` VALUES (2797, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:28');
INSERT INTO `sys_job_log` VALUES (2798, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:38');
INSERT INTO `sys_job_log` VALUES (2799, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:38');
INSERT INTO `sys_job_log` VALUES (2800, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:51:38');
INSERT INTO `sys_job_log` VALUES (2801, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:48');
INSERT INTO `sys_job_log` VALUES (2802, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:48');
INSERT INTO `sys_job_log` VALUES (2803, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:51:48');
INSERT INTO `sys_job_log` VALUES (2804, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:48');
INSERT INTO `sys_job_log` VALUES (2805, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:51:58');
INSERT INTO `sys_job_log` VALUES (2806, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:58');
INSERT INTO `sys_job_log` VALUES (2807, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 14:51:58');
INSERT INTO `sys_job_log` VALUES (2808, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:51:58');
INSERT INTO `sys_job_log` VALUES (2809, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:08');
INSERT INTO `sys_job_log` VALUES (2810, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:08');
INSERT INTO `sys_job_log` VALUES (2811, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:52:08');
INSERT INTO `sys_job_log` VALUES (2812, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:08');
INSERT INTO `sys_job_log` VALUES (2813, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:52:08');
INSERT INTO `sys_job_log` VALUES (2814, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:52:18');
INSERT INTO `sys_job_log` VALUES (2815, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:18');
INSERT INTO `sys_job_log` VALUES (2816, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:52:18');
INSERT INTO `sys_job_log` VALUES (2817, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:18');
INSERT INTO `sys_job_log` VALUES (2818, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:28');
INSERT INTO `sys_job_log` VALUES (2819, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:28');
INSERT INTO `sys_job_log` VALUES (2820, 'task:system:joblog', '100', '耗时 73 毫秒', '0', '', '2023-06-13 14:52:28');
INSERT INTO `sys_job_log` VALUES (2821, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:28');
INSERT INTO `sys_job_log` VALUES (2822, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:38');
INSERT INTO `sys_job_log` VALUES (2823, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:38');
INSERT INTO `sys_job_log` VALUES (2824, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:52:38');
INSERT INTO `sys_job_log` VALUES (2825, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:38');
INSERT INTO `sys_job_log` VALUES (2826, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:48');
INSERT INTO `sys_job_log` VALUES (2827, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:48');
INSERT INTO `sys_job_log` VALUES (2828, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:52:48');
INSERT INTO `sys_job_log` VALUES (2829, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:48');
INSERT INTO `sys_job_log` VALUES (2830, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:58');
INSERT INTO `sys_job_log` VALUES (2831, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 14:52:58');
INSERT INTO `sys_job_log` VALUES (2832, 'task:system:loginInfor', '100', '耗时 13 毫秒', '0', '', '2023-06-13 14:52:58');
INSERT INTO `sys_job_log` VALUES (2833, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:52:58');
INSERT INTO `sys_job_log` VALUES (2834, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2835, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2836, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2837, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2838, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2839, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:53:08');
INSERT INTO `sys_job_log` VALUES (2840, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:53:18');
INSERT INTO `sys_job_log` VALUES (2841, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:53:18');
INSERT INTO `sys_job_log` VALUES (2842, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:18');
INSERT INTO `sys_job_log` VALUES (2843, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:28');
INSERT INTO `sys_job_log` VALUES (2844, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:28');
INSERT INTO `sys_job_log` VALUES (2845, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:53:28');
INSERT INTO `sys_job_log` VALUES (2846, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:28');
INSERT INTO `sys_job_log` VALUES (2847, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:38');
INSERT INTO `sys_job_log` VALUES (2848, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:38');
INSERT INTO `sys_job_log` VALUES (2849, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:53:38');
INSERT INTO `sys_job_log` VALUES (2850, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:38');
INSERT INTO `sys_job_log` VALUES (2851, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:48');
INSERT INTO `sys_job_log` VALUES (2852, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:48');
INSERT INTO `sys_job_log` VALUES (2853, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:53:48');
INSERT INTO `sys_job_log` VALUES (2854, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:53:48');
INSERT INTO `sys_job_log` VALUES (2855, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:53:58');
INSERT INTO `sys_job_log` VALUES (2856, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:53:58');
INSERT INTO `sys_job_log` VALUES (2857, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:53:58');
INSERT INTO `sys_job_log` VALUES (2858, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:08');
INSERT INTO `sys_job_log` VALUES (2859, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:08');
INSERT INTO `sys_job_log` VALUES (2860, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:54:08');
INSERT INTO `sys_job_log` VALUES (2861, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:08');
INSERT INTO `sys_job_log` VALUES (2862, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:08');
INSERT INTO `sys_job_log` VALUES (2863, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:18');
INSERT INTO `sys_job_log` VALUES (2864, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:18');
INSERT INTO `sys_job_log` VALUES (2865, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:54:18');
INSERT INTO `sys_job_log` VALUES (2866, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:18');
INSERT INTO `sys_job_log` VALUES (2867, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:28');
INSERT INTO `sys_job_log` VALUES (2868, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:28');
INSERT INTO `sys_job_log` VALUES (2869, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:54:28');
INSERT INTO `sys_job_log` VALUES (2870, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:54:38');
INSERT INTO `sys_job_log` VALUES (2871, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:54:38');
INSERT INTO `sys_job_log` VALUES (2872, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:54:38');
INSERT INTO `sys_job_log` VALUES (2873, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:54:48');
INSERT INTO `sys_job_log` VALUES (2874, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:54:48');
INSERT INTO `sys_job_log` VALUES (2875, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:54:48');
INSERT INTO `sys_job_log` VALUES (2876, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:48');
INSERT INTO `sys_job_log` VALUES (2877, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:54:58');
INSERT INTO `sys_job_log` VALUES (2878, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:54:58');
INSERT INTO `sys_job_log` VALUES (2879, 'task:system:operlog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:54:58');
INSERT INTO `sys_job_log` VALUES (2880, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:55:08');
INSERT INTO `sys_job_log` VALUES (2881, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:08');
INSERT INTO `sys_job_log` VALUES (2882, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:55:08');
INSERT INTO `sys_job_log` VALUES (2883, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:08');
INSERT INTO `sys_job_log` VALUES (2884, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:18');
INSERT INTO `sys_job_log` VALUES (2885, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:18');
INSERT INTO `sys_job_log` VALUES (2886, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:55:18');
INSERT INTO `sys_job_log` VALUES (2887, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:18');
INSERT INTO `sys_job_log` VALUES (2888, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:28');
INSERT INTO `sys_job_log` VALUES (2889, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:55:28');
INSERT INTO `sys_job_log` VALUES (2890, 'task:system:operlog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:55:28');
INSERT INTO `sys_job_log` VALUES (2891, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:55:38');
INSERT INTO `sys_job_log` VALUES (2892, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:55:38');
INSERT INTO `sys_job_log` VALUES (2893, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 14:55:38');
INSERT INTO `sys_job_log` VALUES (2894, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:38');
INSERT INTO `sys_job_log` VALUES (2895, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:48');
INSERT INTO `sys_job_log` VALUES (2896, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:48');
INSERT INTO `sys_job_log` VALUES (2897, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:55:48');
INSERT INTO `sys_job_log` VALUES (2898, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:48');
INSERT INTO `sys_job_log` VALUES (2899, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:58');
INSERT INTO `sys_job_log` VALUES (2900, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:55:58');
INSERT INTO `sys_job_log` VALUES (2901, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:55:58');
INSERT INTO `sys_job_log` VALUES (2902, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:08');
INSERT INTO `sys_job_log` VALUES (2903, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:08');
INSERT INTO `sys_job_log` VALUES (2904, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:56:08');
INSERT INTO `sys_job_log` VALUES (2905, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:08');
INSERT INTO `sys_job_log` VALUES (2906, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:18');
INSERT INTO `sys_job_log` VALUES (2907, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:18');
INSERT INTO `sys_job_log` VALUES (2908, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:56:18');
INSERT INTO `sys_job_log` VALUES (2909, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:18');
INSERT INTO `sys_job_log` VALUES (2910, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:28');
INSERT INTO `sys_job_log` VALUES (2911, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:28');
INSERT INTO `sys_job_log` VALUES (2912, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:56:28');
INSERT INTO `sys_job_log` VALUES (2913, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:28');
INSERT INTO `sys_job_log` VALUES (2914, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:38');
INSERT INTO `sys_job_log` VALUES (2915, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:38');
INSERT INTO `sys_job_log` VALUES (2916, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:56:38');
INSERT INTO `sys_job_log` VALUES (2917, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:48');
INSERT INTO `sys_job_log` VALUES (2918, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:48');
INSERT INTO `sys_job_log` VALUES (2919, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:56:48');
INSERT INTO `sys_job_log` VALUES (2920, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:48');
INSERT INTO `sys_job_log` VALUES (2921, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:58');
INSERT INTO `sys_job_log` VALUES (2922, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:56:58');
INSERT INTO `sys_job_log` VALUES (2923, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 14:56:58');
INSERT INTO `sys_job_log` VALUES (2924, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:56:58');
INSERT INTO `sys_job_log` VALUES (2925, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:08');
INSERT INTO `sys_job_log` VALUES (2926, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:08');
INSERT INTO `sys_job_log` VALUES (2927, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:57:08');
INSERT INTO `sys_job_log` VALUES (2928, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:08');
INSERT INTO `sys_job_log` VALUES (2929, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:08');
INSERT INTO `sys_job_log` VALUES (2930, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:18');
INSERT INTO `sys_job_log` VALUES (2931, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:18');
INSERT INTO `sys_job_log` VALUES (2932, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:57:18');
INSERT INTO `sys_job_log` VALUES (2933, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:18');
INSERT INTO `sys_job_log` VALUES (2934, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:28');
INSERT INTO `sys_job_log` VALUES (2935, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:28');
INSERT INTO `sys_job_log` VALUES (2936, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:57:28');
INSERT INTO `sys_job_log` VALUES (2937, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:38');
INSERT INTO `sys_job_log` VALUES (2938, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:38');
INSERT INTO `sys_job_log` VALUES (2939, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:57:38');
INSERT INTO `sys_job_log` VALUES (2940, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:48');
INSERT INTO `sys_job_log` VALUES (2941, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:48');
INSERT INTO `sys_job_log` VALUES (2942, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:57:48');
INSERT INTO `sys_job_log` VALUES (2943, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:48');
INSERT INTO `sys_job_log` VALUES (2944, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:58');
INSERT INTO `sys_job_log` VALUES (2945, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:58');
INSERT INTO `sys_job_log` VALUES (2946, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:57:58');
INSERT INTO `sys_job_log` VALUES (2947, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:57:58');
INSERT INTO `sys_job_log` VALUES (2948, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:57:58');
INSERT INTO `sys_job_log` VALUES (2949, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:58:08');
INSERT INTO `sys_job_log` VALUES (2950, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:08');
INSERT INTO `sys_job_log` VALUES (2951, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:18');
INSERT INTO `sys_job_log` VALUES (2952, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:18');
INSERT INTO `sys_job_log` VALUES (2953, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:58:18');
INSERT INTO `sys_job_log` VALUES (2954, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:18');
INSERT INTO `sys_job_log` VALUES (2955, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:28');
INSERT INTO `sys_job_log` VALUES (2956, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:28');
INSERT INTO `sys_job_log` VALUES (2957, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:58:28');
INSERT INTO `sys_job_log` VALUES (2958, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:28');
INSERT INTO `sys_job_log` VALUES (2959, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:38');
INSERT INTO `sys_job_log` VALUES (2960, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:38');
INSERT INTO `sys_job_log` VALUES (2961, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 14:58:38');
INSERT INTO `sys_job_log` VALUES (2962, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:48');
INSERT INTO `sys_job_log` VALUES (2963, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:48');
INSERT INTO `sys_job_log` VALUES (2964, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:58:48');
INSERT INTO `sys_job_log` VALUES (2965, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:48');
INSERT INTO `sys_job_log` VALUES (2966, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:58');
INSERT INTO `sys_job_log` VALUES (2967, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:58:58');
INSERT INTO `sys_job_log` VALUES (2968, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 14:58:58');
INSERT INTO `sys_job_log` VALUES (2969, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:58');
INSERT INTO `sys_job_log` VALUES (2970, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:58:58');
INSERT INTO `sys_job_log` VALUES (2971, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:08');
INSERT INTO `sys_job_log` VALUES (2972, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:59:08');
INSERT INTO `sys_job_log` VALUES (2973, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:08');
INSERT INTO `sys_job_log` VALUES (2974, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:18');
INSERT INTO `sys_job_log` VALUES (2975, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:18');
INSERT INTO `sys_job_log` VALUES (2976, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:59:18');
INSERT INTO `sys_job_log` VALUES (2977, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:18');
INSERT INTO `sys_job_log` VALUES (2978, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:28');
INSERT INTO `sys_job_log` VALUES (2979, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:59:28');
INSERT INTO `sys_job_log` VALUES (2980, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 14:59:28');
INSERT INTO `sys_job_log` VALUES (2981, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:59:28');
INSERT INTO `sys_job_log` VALUES (2982, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:59:38');
INSERT INTO `sys_job_log` VALUES (2983, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 14:59:38');
INSERT INTO `sys_job_log` VALUES (2984, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 14:59:38');
INSERT INTO `sys_job_log` VALUES (2985, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 14:59:48');
INSERT INTO `sys_job_log` VALUES (2986, 'task:system:joblog', '100', '耗时 29 毫秒', '0', '', '2023-06-13 14:59:48');
INSERT INTO `sys_job_log` VALUES (2987, 'task:system:operlog', '100', '耗时 19 毫秒', '0', '', '2023-06-13 14:59:48');
INSERT INTO `sys_job_log` VALUES (2988, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:48');
INSERT INTO `sys_job_log` VALUES (2989, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:58');
INSERT INTO `sys_job_log` VALUES (2990, 'task:system:operlog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:59:58');
INSERT INTO `sys_job_log` VALUES (2991, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 14:59:58');
INSERT INTO `sys_job_log` VALUES (2992, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 14:59:58');
INSERT INTO `sys_job_log` VALUES (2993, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:08');
INSERT INTO `sys_job_log` VALUES (2994, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:08');
INSERT INTO `sys_job_log` VALUES (2995, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:00:08');
INSERT INTO `sys_job_log` VALUES (2996, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:08');
INSERT INTO `sys_job_log` VALUES (2997, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:18');
INSERT INTO `sys_job_log` VALUES (2998, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:18');
INSERT INTO `sys_job_log` VALUES (2999, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:00:18');
INSERT INTO `sys_job_log` VALUES (3000, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:18');
INSERT INTO `sys_job_log` VALUES (3001, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:28');
INSERT INTO `sys_job_log` VALUES (3002, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:28');
INSERT INTO `sys_job_log` VALUES (3003, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:00:28');
INSERT INTO `sys_job_log` VALUES (3004, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:28');
INSERT INTO `sys_job_log` VALUES (3005, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:38');
INSERT INTO `sys_job_log` VALUES (3006, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:38');
INSERT INTO `sys_job_log` VALUES (3007, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:00:38');
INSERT INTO `sys_job_log` VALUES (3008, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:38');
INSERT INTO `sys_job_log` VALUES (3009, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:38');
INSERT INTO `sys_job_log` VALUES (3010, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:00:48');
INSERT INTO `sys_job_log` VALUES (3011, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:00:48');
INSERT INTO `sys_job_log` VALUES (3012, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:00:48');
INSERT INTO `sys_job_log` VALUES (3013, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:00:58');
INSERT INTO `sys_job_log` VALUES (3014, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:00:58');
INSERT INTO `sys_job_log` VALUES (3015, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:00:58');
INSERT INTO `sys_job_log` VALUES (3016, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:01:08');
INSERT INTO `sys_job_log` VALUES (3017, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:08');
INSERT INTO `sys_job_log` VALUES (3018, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:01:08');
INSERT INTO `sys_job_log` VALUES (3019, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:08');
INSERT INTO `sys_job_log` VALUES (3020, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:18');
INSERT INTO `sys_job_log` VALUES (3021, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:18');
INSERT INTO `sys_job_log` VALUES (3022, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:01:18');
INSERT INTO `sys_job_log` VALUES (3023, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:18');
INSERT INTO `sys_job_log` VALUES (3024, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:28');
INSERT INTO `sys_job_log` VALUES (3025, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:28');
INSERT INTO `sys_job_log` VALUES (3026, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:01:28');
INSERT INTO `sys_job_log` VALUES (3027, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:28');
INSERT INTO `sys_job_log` VALUES (3028, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:38');
INSERT INTO `sys_job_log` VALUES (3029, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:38');
INSERT INTO `sys_job_log` VALUES (3030, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:01:38');
INSERT INTO `sys_job_log` VALUES (3031, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:38');
INSERT INTO `sys_job_log` VALUES (3032, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:48');
INSERT INTO `sys_job_log` VALUES (3033, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:48');
INSERT INTO `sys_job_log` VALUES (3034, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:01:48');
INSERT INTO `sys_job_log` VALUES (3035, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:48');
INSERT INTO `sys_job_log` VALUES (3036, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:58');
INSERT INTO `sys_job_log` VALUES (3037, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:58');
INSERT INTO `sys_job_log` VALUES (3038, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:01:58');
INSERT INTO `sys_job_log` VALUES (3039, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:01:58');
INSERT INTO `sys_job_log` VALUES (3040, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:08');
INSERT INTO `sys_job_log` VALUES (3041, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:08');
INSERT INTO `sys_job_log` VALUES (3042, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:02:08');
INSERT INTO `sys_job_log` VALUES (3043, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:08');
INSERT INTO `sys_job_log` VALUES (3044, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:18');
INSERT INTO `sys_job_log` VALUES (3045, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:18');
INSERT INTO `sys_job_log` VALUES (3046, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:02:18');
INSERT INTO `sys_job_log` VALUES (3047, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:28');
INSERT INTO `sys_job_log` VALUES (3048, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:28');
INSERT INTO `sys_job_log` VALUES (3049, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:02:28');
INSERT INTO `sys_job_log` VALUES (3050, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:02:28');
INSERT INTO `sys_job_log` VALUES (3051, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:02:38');
INSERT INTO `sys_job_log` VALUES (3052, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:38');
INSERT INTO `sys_job_log` VALUES (3053, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:02:38');
INSERT INTO `sys_job_log` VALUES (3054, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:02:38');
INSERT INTO `sys_job_log` VALUES (3055, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:02:48');
INSERT INTO `sys_job_log` VALUES (3056, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:02:48');
INSERT INTO `sys_job_log` VALUES (3057, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:48');
INSERT INTO `sys_job_log` VALUES (3058, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:58');
INSERT INTO `sys_job_log` VALUES (3059, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:02:58');
INSERT INTO `sys_job_log` VALUES (3060, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:02:58');
INSERT INTO `sys_job_log` VALUES (3061, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:02:58');
INSERT INTO `sys_job_log` VALUES (3062, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3063, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3064, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3065, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3066, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3067, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:03:08');
INSERT INTO `sys_job_log` VALUES (3068, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:03:18');
INSERT INTO `sys_job_log` VALUES (3069, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:03:18');
INSERT INTO `sys_job_log` VALUES (3070, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:03:18');
INSERT INTO `sys_job_log` VALUES (3071, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:03:28');
INSERT INTO `sys_job_log` VALUES (3072, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:28');
INSERT INTO `sys_job_log` VALUES (3073, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:38');
INSERT INTO `sys_job_log` VALUES (3074, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:38');
INSERT INTO `sys_job_log` VALUES (3075, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:03:38');
INSERT INTO `sys_job_log` VALUES (3076, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:38');
INSERT INTO `sys_job_log` VALUES (3077, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:48');
INSERT INTO `sys_job_log` VALUES (3078, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:03:48');
INSERT INTO `sys_job_log` VALUES (3079, 'task:system:operlog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:03:58');
INSERT INTO `sys_job_log` VALUES (3080, 'task:system:joblog', '100', '耗时 27 毫秒', '0', '', '2023-06-13 15:03:58');
INSERT INTO `sys_job_log` VALUES (3081, 'task:system:loginInfor', '100', '耗时 26 毫秒', '0', '', '2023-06-13 15:03:58');
INSERT INTO `sys_job_log` VALUES (3082, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:58');
INSERT INTO `sys_job_log` VALUES (3083, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:03:58');
INSERT INTO `sys_job_log` VALUES (3084, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:04:08');
INSERT INTO `sys_job_log` VALUES (3085, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:08');
INSERT INTO `sys_job_log` VALUES (3086, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:18');
INSERT INTO `sys_job_log` VALUES (3087, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:18');
INSERT INTO `sys_job_log` VALUES (3088, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:04:18');
INSERT INTO `sys_job_log` VALUES (3089, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:04:18');
INSERT INTO `sys_job_log` VALUES (3090, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:04:18');
INSERT INTO `sys_job_log` VALUES (3091, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:04:28');
INSERT INTO `sys_job_log` VALUES (3092, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:04:28');
INSERT INTO `sys_job_log` VALUES (3093, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:28');
INSERT INTO `sys_job_log` VALUES (3094, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:38');
INSERT INTO `sys_job_log` VALUES (3095, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:38');
INSERT INTO `sys_job_log` VALUES (3096, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:04:38');
INSERT INTO `sys_job_log` VALUES (3097, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:38');
INSERT INTO `sys_job_log` VALUES (3098, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:38');
INSERT INTO `sys_job_log` VALUES (3099, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:48');
INSERT INTO `sys_job_log` VALUES (3100, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:04:48');
INSERT INTO `sys_job_log` VALUES (3101, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:48');
INSERT INTO `sys_job_log` VALUES (3102, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:58');
INSERT INTO `sys_job_log` VALUES (3103, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 15:04:58');
INSERT INTO `sys_job_log` VALUES (3104, 'task:system:operlog', '100', '耗时 16 毫秒', '0', '', '2023-06-13 15:04:58');
INSERT INTO `sys_job_log` VALUES (3105, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:04:58');
INSERT INTO `sys_job_log` VALUES (3106, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3107, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3108, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3109, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3110, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3111, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:08');
INSERT INTO `sys_job_log` VALUES (3112, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:18');
INSERT INTO `sys_job_log` VALUES (3113, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:05:18');
INSERT INTO `sys_job_log` VALUES (3114, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:18');
INSERT INTO `sys_job_log` VALUES (3115, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:18');
INSERT INTO `sys_job_log` VALUES (3116, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:28');
INSERT INTO `sys_job_log` VALUES (3117, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:05:28');
INSERT INTO `sys_job_log` VALUES (3118, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:05:28');
INSERT INTO `sys_job_log` VALUES (3119, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:05:38');
INSERT INTO `sys_job_log` VALUES (3120, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:38');
INSERT INTO `sys_job_log` VALUES (3121, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:05:38');
INSERT INTO `sys_job_log` VALUES (3122, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:05:48');
INSERT INTO `sys_job_log` VALUES (3123, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:48');
INSERT INTO `sys_job_log` VALUES (3124, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:05:48');
INSERT INTO `sys_job_log` VALUES (3125, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:48');
INSERT INTO `sys_job_log` VALUES (3126, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:58');
INSERT INTO `sys_job_log` VALUES (3127, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:05:58');
INSERT INTO `sys_job_log` VALUES (3128, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:05:58');
INSERT INTO `sys_job_log` VALUES (3129, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:08');
INSERT INTO `sys_job_log` VALUES (3130, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:08');
INSERT INTO `sys_job_log` VALUES (3131, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:06:08');
INSERT INTO `sys_job_log` VALUES (3132, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:08');
INSERT INTO `sys_job_log` VALUES (3133, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:18');
INSERT INTO `sys_job_log` VALUES (3134, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:18');
INSERT INTO `sys_job_log` VALUES (3135, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:06:18');
INSERT INTO `sys_job_log` VALUES (3136, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:18');
INSERT INTO `sys_job_log` VALUES (3137, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:28');
INSERT INTO `sys_job_log` VALUES (3138, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:28');
INSERT INTO `sys_job_log` VALUES (3139, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:06:28');
INSERT INTO `sys_job_log` VALUES (3140, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:28');
INSERT INTO `sys_job_log` VALUES (3141, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:38');
INSERT INTO `sys_job_log` VALUES (3142, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:06:38');
INSERT INTO `sys_job_log` VALUES (3143, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:06:38');
INSERT INTO `sys_job_log` VALUES (3144, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:38');
INSERT INTO `sys_job_log` VALUES (3145, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:48');
INSERT INTO `sys_job_log` VALUES (3146, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:48');
INSERT INTO `sys_job_log` VALUES (3147, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:06:48');
INSERT INTO `sys_job_log` VALUES (3148, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:06:48');
INSERT INTO `sys_job_log` VALUES (3149, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:06:58');
INSERT INTO `sys_job_log` VALUES (3150, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:06:58');
INSERT INTO `sys_job_log` VALUES (3151, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:06:58');
INSERT INTO `sys_job_log` VALUES (3152, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:08');
INSERT INTO `sys_job_log` VALUES (3153, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:08');
INSERT INTO `sys_job_log` VALUES (3154, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:07:08');
INSERT INTO `sys_job_log` VALUES (3155, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:08');
INSERT INTO `sys_job_log` VALUES (3156, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:18');
INSERT INTO `sys_job_log` VALUES (3157, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:18');
INSERT INTO `sys_job_log` VALUES (3158, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:07:18');
INSERT INTO `sys_job_log` VALUES (3159, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:18');
INSERT INTO `sys_job_log` VALUES (3160, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:28');
INSERT INTO `sys_job_log` VALUES (3161, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:28');
INSERT INTO `sys_job_log` VALUES (3162, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:07:28');
INSERT INTO `sys_job_log` VALUES (3163, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:38');
INSERT INTO `sys_job_log` VALUES (3164, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:38');
INSERT INTO `sys_job_log` VALUES (3165, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:07:38');
INSERT INTO `sys_job_log` VALUES (3166, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:38');
INSERT INTO `sys_job_log` VALUES (3167, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:38');
INSERT INTO `sys_job_log` VALUES (3168, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:48');
INSERT INTO `sys_job_log` VALUES (3169, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:07:48');
INSERT INTO `sys_job_log` VALUES (3170, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:48');
INSERT INTO `sys_job_log` VALUES (3171, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:58');
INSERT INTO `sys_job_log` VALUES (3172, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:07:58');
INSERT INTO `sys_job_log` VALUES (3173, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:07:58');
INSERT INTO `sys_job_log` VALUES (3174, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:07:58');
INSERT INTO `sys_job_log` VALUES (3175, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:08');
INSERT INTO `sys_job_log` VALUES (3176, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:08');
INSERT INTO `sys_job_log` VALUES (3177, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:08:08');
INSERT INTO `sys_job_log` VALUES (3178, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:08');
INSERT INTO `sys_job_log` VALUES (3179, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:08:18');
INSERT INTO `sys_job_log` VALUES (3180, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:18');
INSERT INTO `sys_job_log` VALUES (3181, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:08:18');
INSERT INTO `sys_job_log` VALUES (3182, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:18');
INSERT INTO `sys_job_log` VALUES (3183, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:18');
INSERT INTO `sys_job_log` VALUES (3184, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:08:28');
INSERT INTO `sys_job_log` VALUES (3185, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:08:28');
INSERT INTO `sys_job_log` VALUES (3186, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:08:28');
INSERT INTO `sys_job_log` VALUES (3187, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:08:28');
INSERT INTO `sys_job_log` VALUES (3188, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:08:38');
INSERT INTO `sys_job_log` VALUES (3189, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:08:38');
INSERT INTO `sys_job_log` VALUES (3190, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3191, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3192, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3193, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3194, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3195, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:12:02');
INSERT INTO `sys_job_log` VALUES (3196, 'task:system:joblog', '100', '耗时 26 毫秒', '0', '', '2023-06-13 15:12:11');
INSERT INTO `sys_job_log` VALUES (3197, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:11');
INSERT INTO `sys_job_log` VALUES (3198, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:11');
INSERT INTO `sys_job_log` VALUES (3199, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:21');
INSERT INTO `sys_job_log` VALUES (3200, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:12:21');
INSERT INTO `sys_job_log` VALUES (3201, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:12:21');
INSERT INTO `sys_job_log` VALUES (3202, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:12:31');
INSERT INTO `sys_job_log` VALUES (3203, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:12:31');
INSERT INTO `sys_job_log` VALUES (3204, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:12:31');
INSERT INTO `sys_job_log` VALUES (3205, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:31');
INSERT INTO `sys_job_log` VALUES (3206, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:31');
INSERT INTO `sys_job_log` VALUES (3207, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:12:41');
INSERT INTO `sys_job_log` VALUES (3208, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:51');
INSERT INTO `sys_job_log` VALUES (3209, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:51');
INSERT INTO `sys_job_log` VALUES (3210, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:12:51');
INSERT INTO `sys_job_log` VALUES (3211, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:12:51');
INSERT INTO `sys_job_log` VALUES (3212, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:01');
INSERT INTO `sys_job_log` VALUES (3213, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:13:01');
INSERT INTO `sys_job_log` VALUES (3214, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:13:01');
INSERT INTO `sys_job_log` VALUES (3215, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:01');
INSERT INTO `sys_job_log` VALUES (3216, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:01');
INSERT INTO `sys_job_log` VALUES (3217, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:11');
INSERT INTO `sys_job_log` VALUES (3218, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:11');
INSERT INTO `sys_job_log` VALUES (3219, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:13:11');
INSERT INTO `sys_job_log` VALUES (3220, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:11');
INSERT INTO `sys_job_log` VALUES (3221, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:21');
INSERT INTO `sys_job_log` VALUES (3222, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:21');
INSERT INTO `sys_job_log` VALUES (3223, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 15:13:21');
INSERT INTO `sys_job_log` VALUES (3224, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:31');
INSERT INTO `sys_job_log` VALUES (3225, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:31');
INSERT INTO `sys_job_log` VALUES (3226, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:13:31');
INSERT INTO `sys_job_log` VALUES (3227, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:31');
INSERT INTO `sys_job_log` VALUES (3228, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:41');
INSERT INTO `sys_job_log` VALUES (3229, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:41');
INSERT INTO `sys_job_log` VALUES (3230, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:13:41');
INSERT INTO `sys_job_log` VALUES (3231, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:41');
INSERT INTO `sys_job_log` VALUES (3232, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:51');
INSERT INTO `sys_job_log` VALUES (3233, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:51');
INSERT INTO `sys_job_log` VALUES (3234, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:13:51');
INSERT INTO `sys_job_log` VALUES (3235, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:13:51');
INSERT INTO `sys_job_log` VALUES (3236, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:01');
INSERT INTO `sys_job_log` VALUES (3237, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:01');
INSERT INTO `sys_job_log` VALUES (3238, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:14:01');
INSERT INTO `sys_job_log` VALUES (3239, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:01');
INSERT INTO `sys_job_log` VALUES (3240, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:01');
INSERT INTO `sys_job_log` VALUES (3241, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:11');
INSERT INTO `sys_job_log` VALUES (3242, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:11');
INSERT INTO `sys_job_log` VALUES (3243, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:14:11');
INSERT INTO `sys_job_log` VALUES (3244, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:11');
INSERT INTO `sys_job_log` VALUES (3245, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:21');
INSERT INTO `sys_job_log` VALUES (3246, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:21');
INSERT INTO `sys_job_log` VALUES (3247, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 15:14:21');
INSERT INTO `sys_job_log` VALUES (3248, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:21');
INSERT INTO `sys_job_log` VALUES (3249, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:31');
INSERT INTO `sys_job_log` VALUES (3250, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:31');
INSERT INTO `sys_job_log` VALUES (3251, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:14:31');
INSERT INTO `sys_job_log` VALUES (3252, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:31');
INSERT INTO `sys_job_log` VALUES (3253, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:31');
INSERT INTO `sys_job_log` VALUES (3254, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:41');
INSERT INTO `sys_job_log` VALUES (3255, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:14:41');
INSERT INTO `sys_job_log` VALUES (3256, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:41');
INSERT INTO `sys_job_log` VALUES (3257, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:51');
INSERT INTO `sys_job_log` VALUES (3258, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:51');
INSERT INTO `sys_job_log` VALUES (3259, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:14:51');
INSERT INTO `sys_job_log` VALUES (3260, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:14:51');
INSERT INTO `sys_job_log` VALUES (3261, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:01');
INSERT INTO `sys_job_log` VALUES (3262, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:01');
INSERT INTO `sys_job_log` VALUES (3263, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:15:01');
INSERT INTO `sys_job_log` VALUES (3264, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:01');
INSERT INTO `sys_job_log` VALUES (3265, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:01');
INSERT INTO `sys_job_log` VALUES (3266, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:12');
INSERT INTO `sys_job_log` VALUES (3267, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:12');
INSERT INTO `sys_job_log` VALUES (3268, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:15:12');
INSERT INTO `sys_job_log` VALUES (3269, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:12');
INSERT INTO `sys_job_log` VALUES (3270, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:21');
INSERT INTO `sys_job_log` VALUES (3271, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:21');
INSERT INTO `sys_job_log` VALUES (3272, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:15:21');
INSERT INTO `sys_job_log` VALUES (3273, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:15:21');
INSERT INTO `sys_job_log` VALUES (3274, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:15:21');
INSERT INTO `sys_job_log` VALUES (3275, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:15:31');
INSERT INTO `sys_job_log` VALUES (3276, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:15:31');
INSERT INTO `sys_job_log` VALUES (3277, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:41');
INSERT INTO `sys_job_log` VALUES (3278, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:41');
INSERT INTO `sys_job_log` VALUES (3279, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:15:41');
INSERT INTO `sys_job_log` VALUES (3280, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:51');
INSERT INTO `sys_job_log` VALUES (3281, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:15:51');
INSERT INTO `sys_job_log` VALUES (3282, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:15:51');
INSERT INTO `sys_job_log` VALUES (3283, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:01');
INSERT INTO `sys_job_log` VALUES (3284, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:01');
INSERT INTO `sys_job_log` VALUES (3285, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:16:01');
INSERT INTO `sys_job_log` VALUES (3286, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:01');
INSERT INTO `sys_job_log` VALUES (3287, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:16:11');
INSERT INTO `sys_job_log` VALUES (3288, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:16:11');
INSERT INTO `sys_job_log` VALUES (3289, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:16:11');
INSERT INTO `sys_job_log` VALUES (3290, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:16:11');
INSERT INTO `sys_job_log` VALUES (3291, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:16:21');
INSERT INTO `sys_job_log` VALUES (3292, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:16:21');
INSERT INTO `sys_job_log` VALUES (3293, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 15:16:21');
INSERT INTO `sys_job_log` VALUES (3294, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:21');
INSERT INTO `sys_job_log` VALUES (3295, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:31');
INSERT INTO `sys_job_log` VALUES (3296, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:31');
INSERT INTO `sys_job_log` VALUES (3297, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:16:31');
INSERT INTO `sys_job_log` VALUES (3298, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:41');
INSERT INTO `sys_job_log` VALUES (3299, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:41');
INSERT INTO `sys_job_log` VALUES (3300, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:16:41');
INSERT INTO `sys_job_log` VALUES (3301, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:41');
INSERT INTO `sys_job_log` VALUES (3302, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:51');
INSERT INTO `sys_job_log` VALUES (3303, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:51');
INSERT INTO `sys_job_log` VALUES (3304, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:16:51');
INSERT INTO `sys_job_log` VALUES (3305, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:16:51');
INSERT INTO `sys_job_log` VALUES (3306, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:01');
INSERT INTO `sys_job_log` VALUES (3307, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:01');
INSERT INTO `sys_job_log` VALUES (3308, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:17:01');
INSERT INTO `sys_job_log` VALUES (3309, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:01');
INSERT INTO `sys_job_log` VALUES (3310, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:17:01');
INSERT INTO `sys_job_log` VALUES (3311, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:17:11');
INSERT INTO `sys_job_log` VALUES (3312, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:17:11');
INSERT INTO `sys_job_log` VALUES (3313, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:17:11');
INSERT INTO `sys_job_log` VALUES (3314, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:11');
INSERT INTO `sys_job_log` VALUES (3315, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:21');
INSERT INTO `sys_job_log` VALUES (3316, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:21');
INSERT INTO `sys_job_log` VALUES (3317, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:17:21');
INSERT INTO `sys_job_log` VALUES (3318, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:21');
INSERT INTO `sys_job_log` VALUES (3319, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:31');
INSERT INTO `sys_job_log` VALUES (3320, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:31');
INSERT INTO `sys_job_log` VALUES (3321, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:17:31');
INSERT INTO `sys_job_log` VALUES (3322, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:31');
INSERT INTO `sys_job_log` VALUES (3323, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:41');
INSERT INTO `sys_job_log` VALUES (3324, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:41');
INSERT INTO `sys_job_log` VALUES (3325, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:17:41');
INSERT INTO `sys_job_log` VALUES (3326, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:41');
INSERT INTO `sys_job_log` VALUES (3327, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:51');
INSERT INTO `sys_job_log` VALUES (3328, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:51');
INSERT INTO `sys_job_log` VALUES (3329, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:17:51');
INSERT INTO `sys_job_log` VALUES (3330, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:17:51');
INSERT INTO `sys_job_log` VALUES (3331, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3332, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3333, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3334, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3335, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3336, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:01');
INSERT INTO `sys_job_log` VALUES (3337, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:18:11');
INSERT INTO `sys_job_log` VALUES (3338, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:11');
INSERT INTO `sys_job_log` VALUES (3339, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:21');
INSERT INTO `sys_job_log` VALUES (3340, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:21');
INSERT INTO `sys_job_log` VALUES (3341, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:18:21');
INSERT INTO `sys_job_log` VALUES (3342, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:21');
INSERT INTO `sys_job_log` VALUES (3343, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:31');
INSERT INTO `sys_job_log` VALUES (3344, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:31');
INSERT INTO `sys_job_log` VALUES (3345, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:18:31');
INSERT INTO `sys_job_log` VALUES (3346, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:31');
INSERT INTO `sys_job_log` VALUES (3347, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:18:31');
INSERT INTO `sys_job_log` VALUES (3348, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:18:41');
INSERT INTO `sys_job_log` VALUES (3349, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:41');
INSERT INTO `sys_job_log` VALUES (3350, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:51');
INSERT INTO `sys_job_log` VALUES (3351, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:51');
INSERT INTO `sys_job_log` VALUES (3352, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:18:51');
INSERT INTO `sys_job_log` VALUES (3353, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:18:51');
INSERT INTO `sys_job_log` VALUES (3354, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:19:01');
INSERT INTO `sys_job_log` VALUES (3355, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:01');
INSERT INTO `sys_job_log` VALUES (3356, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:19:01');
INSERT INTO `sys_job_log` VALUES (3357, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:01');
INSERT INTO `sys_job_log` VALUES (3358, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:19:11');
INSERT INTO `sys_job_log` VALUES (3359, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:19:11');
INSERT INTO `sys_job_log` VALUES (3360, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:19:11');
INSERT INTO `sys_job_log` VALUES (3361, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:11');
INSERT INTO `sys_job_log` VALUES (3362, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:11');
INSERT INTO `sys_job_log` VALUES (3363, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:21');
INSERT INTO `sys_job_log` VALUES (3364, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:19:21');
INSERT INTO `sys_job_log` VALUES (3365, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:21');
INSERT INTO `sys_job_log` VALUES (3366, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:31');
INSERT INTO `sys_job_log` VALUES (3367, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:31');
INSERT INTO `sys_job_log` VALUES (3368, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:19:31');
INSERT INTO `sys_job_log` VALUES (3369, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:31');
INSERT INTO `sys_job_log` VALUES (3370, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:41');
INSERT INTO `sys_job_log` VALUES (3371, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:41');
INSERT INTO `sys_job_log` VALUES (3372, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:19:41');
INSERT INTO `sys_job_log` VALUES (3373, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:51');
INSERT INTO `sys_job_log` VALUES (3374, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:51');
INSERT INTO `sys_job_log` VALUES (3375, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:19:51');
INSERT INTO `sys_job_log` VALUES (3376, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:19:51');
INSERT INTO `sys_job_log` VALUES (3377, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:01');
INSERT INTO `sys_job_log` VALUES (3378, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:01');
INSERT INTO `sys_job_log` VALUES (3379, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:20:01');
INSERT INTO `sys_job_log` VALUES (3380, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:01');
INSERT INTO `sys_job_log` VALUES (3381, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:01');
INSERT INTO `sys_job_log` VALUES (3382, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:11');
INSERT INTO `sys_job_log` VALUES (3383, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:11');
INSERT INTO `sys_job_log` VALUES (3384, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:20:11');
INSERT INTO `sys_job_log` VALUES (3385, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:20:21');
INSERT INTO `sys_job_log` VALUES (3386, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:21');
INSERT INTO `sys_job_log` VALUES (3387, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:20:21');
INSERT INTO `sys_job_log` VALUES (3388, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:21');
INSERT INTO `sys_job_log` VALUES (3389, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:31');
INSERT INTO `sys_job_log` VALUES (3390, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:31');
INSERT INTO `sys_job_log` VALUES (3391, 'task:system:joblog', '100', '耗时 18 毫秒', '0', '', '2023-06-13 15:20:31');
INSERT INTO `sys_job_log` VALUES (3392, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:31');
INSERT INTO `sys_job_log` VALUES (3393, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:41');
INSERT INTO `sys_job_log` VALUES (3394, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:41');
INSERT INTO `sys_job_log` VALUES (3395, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:20:41');
INSERT INTO `sys_job_log` VALUES (3396, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:51');
INSERT INTO `sys_job_log` VALUES (3397, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:20:51');
INSERT INTO `sys_job_log` VALUES (3398, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:20:51');
INSERT INTO `sys_job_log` VALUES (3399, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:20:51');
INSERT INTO `sys_job_log` VALUES (3400, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3401, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3402, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3403, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3404, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3405, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:01');
INSERT INTO `sys_job_log` VALUES (3406, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:11');
INSERT INTO `sys_job_log` VALUES (3407, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:21:11');
INSERT INTO `sys_job_log` VALUES (3408, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:11');
INSERT INTO `sys_job_log` VALUES (3409, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:21');
INSERT INTO `sys_job_log` VALUES (3410, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:21');
INSERT INTO `sys_job_log` VALUES (3411, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:21:21');
INSERT INTO `sys_job_log` VALUES (3412, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:21');
INSERT INTO `sys_job_log` VALUES (3413, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:31');
INSERT INTO `sys_job_log` VALUES (3414, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:31');
INSERT INTO `sys_job_log` VALUES (3415, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:21:31');
INSERT INTO `sys_job_log` VALUES (3416, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:21:41');
INSERT INTO `sys_job_log` VALUES (3417, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:41');
INSERT INTO `sys_job_log` VALUES (3418, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:21:41');
INSERT INTO `sys_job_log` VALUES (3419, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:51');
INSERT INTO `sys_job_log` VALUES (3420, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:21:51');
INSERT INTO `sys_job_log` VALUES (3421, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:21:51');
INSERT INTO `sys_job_log` VALUES (3422, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:21:51');
INSERT INTO `sys_job_log` VALUES (3423, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:01');
INSERT INTO `sys_job_log` VALUES (3424, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:01');
INSERT INTO `sys_job_log` VALUES (3425, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:22:01');
INSERT INTO `sys_job_log` VALUES (3426, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:01');
INSERT INTO `sys_job_log` VALUES (3427, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:01');
INSERT INTO `sys_job_log` VALUES (3428, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:11');
INSERT INTO `sys_job_log` VALUES (3429, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:11');
INSERT INTO `sys_job_log` VALUES (3430, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:22:11');
INSERT INTO `sys_job_log` VALUES (3431, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:21');
INSERT INTO `sys_job_log` VALUES (3432, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:21');
INSERT INTO `sys_job_log` VALUES (3433, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:22:21');
INSERT INTO `sys_job_log` VALUES (3434, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:21');
INSERT INTO `sys_job_log` VALUES (3435, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:31');
INSERT INTO `sys_job_log` VALUES (3436, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:31');
INSERT INTO `sys_job_log` VALUES (3437, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:22:31');
INSERT INTO `sys_job_log` VALUES (3438, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:31');
INSERT INTO `sys_job_log` VALUES (3439, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:22:41');
INSERT INTO `sys_job_log` VALUES (3440, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:41');
INSERT INTO `sys_job_log` VALUES (3441, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:22:41');
INSERT INTO `sys_job_log` VALUES (3442, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:51');
INSERT INTO `sys_job_log` VALUES (3443, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:51');
INSERT INTO `sys_job_log` VALUES (3444, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:22:51');
INSERT INTO `sys_job_log` VALUES (3445, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:22:51');
INSERT INTO `sys_job_log` VALUES (3446, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:01');
INSERT INTO `sys_job_log` VALUES (3447, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:01');
INSERT INTO `sys_job_log` VALUES (3448, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:23:01');
INSERT INTO `sys_job_log` VALUES (3449, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:01');
INSERT INTO `sys_job_log` VALUES (3450, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:01');
INSERT INTO `sys_job_log` VALUES (3451, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:11');
INSERT INTO `sys_job_log` VALUES (3452, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:23:11');
INSERT INTO `sys_job_log` VALUES (3453, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:23:11');
INSERT INTO `sys_job_log` VALUES (3454, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:11');
INSERT INTO `sys_job_log` VALUES (3455, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:21');
INSERT INTO `sys_job_log` VALUES (3456, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:21');
INSERT INTO `sys_job_log` VALUES (3457, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:23:21');
INSERT INTO `sys_job_log` VALUES (3458, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:23:21');
INSERT INTO `sys_job_log` VALUES (3459, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:23:31');
INSERT INTO `sys_job_log` VALUES (3460, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:31');
INSERT INTO `sys_job_log` VALUES (3461, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:23:31');
INSERT INTO `sys_job_log` VALUES (3462, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:31');
INSERT INTO `sys_job_log` VALUES (3463, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:31');
INSERT INTO `sys_job_log` VALUES (3464, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:23:41');
INSERT INTO `sys_job_log` VALUES (3465, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:41');
INSERT INTO `sys_job_log` VALUES (3466, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:51');
INSERT INTO `sys_job_log` VALUES (3467, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:51');
INSERT INTO `sys_job_log` VALUES (3468, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:23:51');
INSERT INTO `sys_job_log` VALUES (3469, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:23:51');
INSERT INTO `sys_job_log` VALUES (3470, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3471, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3472, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3473, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3474, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3475, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:01');
INSERT INTO `sys_job_log` VALUES (3476, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:11');
INSERT INTO `sys_job_log` VALUES (3477, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:24:11');
INSERT INTO `sys_job_log` VALUES (3478, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:11');
INSERT INTO `sys_job_log` VALUES (3479, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:21');
INSERT INTO `sys_job_log` VALUES (3480, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:21');
INSERT INTO `sys_job_log` VALUES (3481, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:24:21');
INSERT INTO `sys_job_log` VALUES (3482, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:21');
INSERT INTO `sys_job_log` VALUES (3483, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:31');
INSERT INTO `sys_job_log` VALUES (3484, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:31');
INSERT INTO `sys_job_log` VALUES (3485, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:24:31');
INSERT INTO `sys_job_log` VALUES (3486, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:41');
INSERT INTO `sys_job_log` VALUES (3487, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:41');
INSERT INTO `sys_job_log` VALUES (3488, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:24:41');
INSERT INTO `sys_job_log` VALUES (3489, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:41');
INSERT INTO `sys_job_log` VALUES (3490, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:51');
INSERT INTO `sys_job_log` VALUES (3491, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:51');
INSERT INTO `sys_job_log` VALUES (3492, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:24:51');
INSERT INTO `sys_job_log` VALUES (3493, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:24:51');
INSERT INTO `sys_job_log` VALUES (3494, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:24:51');
INSERT INTO `sys_job_log` VALUES (3495, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:01');
INSERT INTO `sys_job_log` VALUES (3496, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:25:01');
INSERT INTO `sys_job_log` VALUES (3497, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:01');
INSERT INTO `sys_job_log` VALUES (3498, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:11');
INSERT INTO `sys_job_log` VALUES (3499, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:11');
INSERT INTO `sys_job_log` VALUES (3500, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:25:11');
INSERT INTO `sys_job_log` VALUES (3501, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:11');
INSERT INTO `sys_job_log` VALUES (3502, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:21');
INSERT INTO `sys_job_log` VALUES (3503, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:21');
INSERT INTO `sys_job_log` VALUES (3504, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:25:21');
INSERT INTO `sys_job_log` VALUES (3505, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:21');
INSERT INTO `sys_job_log` VALUES (3506, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:31');
INSERT INTO `sys_job_log` VALUES (3507, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:31');
INSERT INTO `sys_job_log` VALUES (3508, 'task:system:joblog', '100', '耗时 17 毫秒', '0', '', '2023-06-13 15:25:31');
INSERT INTO `sys_job_log` VALUES (3509, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:41');
INSERT INTO `sys_job_log` VALUES (3510, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:41');
INSERT INTO `sys_job_log` VALUES (3511, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:25:41');
INSERT INTO `sys_job_log` VALUES (3512, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:41');
INSERT INTO `sys_job_log` VALUES (3513, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:51');
INSERT INTO `sys_job_log` VALUES (3514, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:25:51');
INSERT INTO `sys_job_log` VALUES (3515, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:25:51');
INSERT INTO `sys_job_log` VALUES (3516, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:25:51');
INSERT INTO `sys_job_log` VALUES (3517, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:01');
INSERT INTO `sys_job_log` VALUES (3518, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:01');
INSERT INTO `sys_job_log` VALUES (3519, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:26:01');
INSERT INTO `sys_job_log` VALUES (3520, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:01');
INSERT INTO `sys_job_log` VALUES (3521, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:01');
INSERT INTO `sys_job_log` VALUES (3522, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:11');
INSERT INTO `sys_job_log` VALUES (3523, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:11');
INSERT INTO `sys_job_log` VALUES (3524, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:26:11');
INSERT INTO `sys_job_log` VALUES (3525, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:11');
INSERT INTO `sys_job_log` VALUES (3526, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:21');
INSERT INTO `sys_job_log` VALUES (3527, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:21');
INSERT INTO `sys_job_log` VALUES (3528, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:26:21');
INSERT INTO `sys_job_log` VALUES (3529, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:21');
INSERT INTO `sys_job_log` VALUES (3530, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:31');
INSERT INTO `sys_job_log` VALUES (3531, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:31');
INSERT INTO `sys_job_log` VALUES (3532, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:26:31');
INSERT INTO `sys_job_log` VALUES (3533, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:42');
INSERT INTO `sys_job_log` VALUES (3534, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:42');
INSERT INTO `sys_job_log` VALUES (3535, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:26:42');
INSERT INTO `sys_job_log` VALUES (3536, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:42');
INSERT INTO `sys_job_log` VALUES (3537, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:26:42');
INSERT INTO `sys_job_log` VALUES (3538, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:26:51');
INSERT INTO `sys_job_log` VALUES (3539, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:26:51');
INSERT INTO `sys_job_log` VALUES (3540, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:01');
INSERT INTO `sys_job_log` VALUES (3541, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:27:01');
INSERT INTO `sys_job_log` VALUES (3542, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:27:01');
INSERT INTO `sys_job_log` VALUES (3543, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:01');
INSERT INTO `sys_job_log` VALUES (3544, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:11');
INSERT INTO `sys_job_log` VALUES (3545, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:11');
INSERT INTO `sys_job_log` VALUES (3546, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:27:11');
INSERT INTO `sys_job_log` VALUES (3547, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:11');
INSERT INTO `sys_job_log` VALUES (3548, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:11');
INSERT INTO `sys_job_log` VALUES (3549, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:21');
INSERT INTO `sys_job_log` VALUES (3550, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:27:21');
INSERT INTO `sys_job_log` VALUES (3551, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:21');
INSERT INTO `sys_job_log` VALUES (3552, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:21');
INSERT INTO `sys_job_log` VALUES (3553, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:31');
INSERT INTO `sys_job_log` VALUES (3554, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:27:31');
INSERT INTO `sys_job_log` VALUES (3555, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:31');
INSERT INTO `sys_job_log` VALUES (3556, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:41');
INSERT INTO `sys_job_log` VALUES (3557, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:27:41');
INSERT INTO `sys_job_log` VALUES (3558, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:27:41');
INSERT INTO `sys_job_log` VALUES (3559, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:51');
INSERT INTO `sys_job_log` VALUES (3560, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:27:51');
INSERT INTO `sys_job_log` VALUES (3561, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:27:51');
INSERT INTO `sys_job_log` VALUES (3562, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:28:01');
INSERT INTO `sys_job_log` VALUES (3563, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:28:01');
INSERT INTO `sys_job_log` VALUES (3564, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:28:01');
INSERT INTO `sys_job_log` VALUES (3565, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:28:01');
INSERT INTO `sys_job_log` VALUES (3566, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:28:01');
INSERT INTO `sys_job_log` VALUES (3567, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:28:11');
INSERT INTO `sys_job_log` VALUES (3568, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:28:11');
INSERT INTO `sys_job_log` VALUES (3569, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 15:28:11');
INSERT INTO `sys_job_log` VALUES (3570, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3571, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3572, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3573, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3574, 'task:system:loginInfor', '100', '耗时 12 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3575, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:29:47');
INSERT INTO `sys_job_log` VALUES (3576, 'task:system:joblog', '100', '耗时 43 毫秒', '0', '', '2023-06-13 15:29:56');
INSERT INTO `sys_job_log` VALUES (3577, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:29:56');
INSERT INTO `sys_job_log` VALUES (3578, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:30:06');
INSERT INTO `sys_job_log` VALUES (3579, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:30:06');
INSERT INTO `sys_job_log` VALUES (3580, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:30:06');
INSERT INTO `sys_job_log` VALUES (3581, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:06');
INSERT INTO `sys_job_log` VALUES (3582, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:06');
INSERT INTO `sys_job_log` VALUES (3583, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:16');
INSERT INTO `sys_job_log` VALUES (3584, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:30:16');
INSERT INTO `sys_job_log` VALUES (3585, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:30:16');
INSERT INTO `sys_job_log` VALUES (3586, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:16');
INSERT INTO `sys_job_log` VALUES (3587, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:26');
INSERT INTO `sys_job_log` VALUES (3588, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:30:26');
INSERT INTO `sys_job_log` VALUES (3589, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:30:26');
INSERT INTO `sys_job_log` VALUES (3590, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:26');
INSERT INTO `sys_job_log` VALUES (3591, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:36');
INSERT INTO `sys_job_log` VALUES (3592, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:36');
INSERT INTO `sys_job_log` VALUES (3593, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:30:36');
INSERT INTO `sys_job_log` VALUES (3594, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:30:46');
INSERT INTO `sys_job_log` VALUES (3595, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:30:46');
INSERT INTO `sys_job_log` VALUES (3596, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:30:46');
INSERT INTO `sys_job_log` VALUES (3597, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:46');
INSERT INTO `sys_job_log` VALUES (3598, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:56');
INSERT INTO `sys_job_log` VALUES (3599, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:56');
INSERT INTO `sys_job_log` VALUES (3600, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:30:56');
INSERT INTO `sys_job_log` VALUES (3601, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:30:56');
INSERT INTO `sys_job_log` VALUES (3602, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:06');
INSERT INTO `sys_job_log` VALUES (3603, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:06');
INSERT INTO `sys_job_log` VALUES (3604, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:31:06');
INSERT INTO `sys_job_log` VALUES (3605, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:06');
INSERT INTO `sys_job_log` VALUES (3606, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:06');
INSERT INTO `sys_job_log` VALUES (3607, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:16');
INSERT INTO `sys_job_log` VALUES (3608, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:16');
INSERT INTO `sys_job_log` VALUES (3609, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:31:16');
INSERT INTO `sys_job_log` VALUES (3610, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:16');
INSERT INTO `sys_job_log` VALUES (3611, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:26');
INSERT INTO `sys_job_log` VALUES (3612, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:26');
INSERT INTO `sys_job_log` VALUES (3613, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:31:26');
INSERT INTO `sys_job_log` VALUES (3614, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:26');
INSERT INTO `sys_job_log` VALUES (3615, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:36');
INSERT INTO `sys_job_log` VALUES (3616, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:31:36');
INSERT INTO `sys_job_log` VALUES (3617, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:31:36');
INSERT INTO `sys_job_log` VALUES (3618, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:36');
INSERT INTO `sys_job_log` VALUES (3619, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:46');
INSERT INTO `sys_job_log` VALUES (3620, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:46');
INSERT INTO `sys_job_log` VALUES (3621, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:31:46');
INSERT INTO `sys_job_log` VALUES (3622, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:56');
INSERT INTO `sys_job_log` VALUES (3623, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:56');
INSERT INTO `sys_job_log` VALUES (3624, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:31:56');
INSERT INTO `sys_job_log` VALUES (3625, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:56');
INSERT INTO `sys_job_log` VALUES (3626, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:31:56');
INSERT INTO `sys_job_log` VALUES (3627, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:06');
INSERT INTO `sys_job_log` VALUES (3628, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:32:06');
INSERT INTO `sys_job_log` VALUES (3629, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:06');
INSERT INTO `sys_job_log` VALUES (3630, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:06');
INSERT INTO `sys_job_log` VALUES (3631, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:06');
INSERT INTO `sys_job_log` VALUES (3632, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:16');
INSERT INTO `sys_job_log` VALUES (3633, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:32:16');
INSERT INTO `sys_job_log` VALUES (3634, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:16');
INSERT INTO `sys_job_log` VALUES (3635, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:26');
INSERT INTO `sys_job_log` VALUES (3636, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:32:26');
INSERT INTO `sys_job_log` VALUES (3637, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:32:26');
INSERT INTO `sys_job_log` VALUES (3638, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:32:36');
INSERT INTO `sys_job_log` VALUES (3639, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:36');
INSERT INTO `sys_job_log` VALUES (3640, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:32:36');
INSERT INTO `sys_job_log` VALUES (3641, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:36');
INSERT INTO `sys_job_log` VALUES (3642, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:36');
INSERT INTO `sys_job_log` VALUES (3643, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:46');
INSERT INTO `sys_job_log` VALUES (3644, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:32:46');
INSERT INTO `sys_job_log` VALUES (3645, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:56');
INSERT INTO `sys_job_log` VALUES (3646, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:56');
INSERT INTO `sys_job_log` VALUES (3647, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:32:56');
INSERT INTO `sys_job_log` VALUES (3648, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:32:56');
INSERT INTO `sys_job_log` VALUES (3649, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3650, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3651, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3652, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3653, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3654, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:33:06');
INSERT INTO `sys_job_log` VALUES (3655, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:33:16');
INSERT INTO `sys_job_log` VALUES (3656, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:33:16');
INSERT INTO `sys_job_log` VALUES (3657, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:16');
INSERT INTO `sys_job_log` VALUES (3658, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:33:26');
INSERT INTO `sys_job_log` VALUES (3659, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:26');
INSERT INTO `sys_job_log` VALUES (3660, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:36');
INSERT INTO `sys_job_log` VALUES (3661, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:36');
INSERT INTO `sys_job_log` VALUES (3662, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:33:36');
INSERT INTO `sys_job_log` VALUES (3663, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:46');
INSERT INTO `sys_job_log` VALUES (3664, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:46');
INSERT INTO `sys_job_log` VALUES (3665, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:33:46');
INSERT INTO `sys_job_log` VALUES (3666, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:56');
INSERT INTO `sys_job_log` VALUES (3667, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:56');
INSERT INTO `sys_job_log` VALUES (3668, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:33:56');
INSERT INTO `sys_job_log` VALUES (3669, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:33:56');
INSERT INTO `sys_job_log` VALUES (3670, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:06');
INSERT INTO `sys_job_log` VALUES (3671, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:06');
INSERT INTO `sys_job_log` VALUES (3672, 'task:system:joblog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 15:34:06');
INSERT INTO `sys_job_log` VALUES (3673, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:06');
INSERT INTO `sys_job_log` VALUES (3674, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:06');
INSERT INTO `sys_job_log` VALUES (3675, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:16');
INSERT INTO `sys_job_log` VALUES (3676, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:16');
INSERT INTO `sys_job_log` VALUES (3677, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:34:16');
INSERT INTO `sys_job_log` VALUES (3678, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:26');
INSERT INTO `sys_job_log` VALUES (3679, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:26');
INSERT INTO `sys_job_log` VALUES (3680, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:34:26');
INSERT INTO `sys_job_log` VALUES (3681, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:26');
INSERT INTO `sys_job_log` VALUES (3682, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:36');
INSERT INTO `sys_job_log` VALUES (3683, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:36');
INSERT INTO `sys_job_log` VALUES (3684, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:34:36');
INSERT INTO `sys_job_log` VALUES (3685, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:36');
INSERT INTO `sys_job_log` VALUES (3686, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:46');
INSERT INTO `sys_job_log` VALUES (3687, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:34:46');
INSERT INTO `sys_job_log` VALUES (3688, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:34:46');
INSERT INTO `sys_job_log` VALUES (3689, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:46');
INSERT INTO `sys_job_log` VALUES (3690, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:46');
INSERT INTO `sys_job_log` VALUES (3691, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:56');
INSERT INTO `sys_job_log` VALUES (3692, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 15:34:56');
INSERT INTO `sys_job_log` VALUES (3693, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:34:56');
INSERT INTO `sys_job_log` VALUES (3694, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:35:06');
INSERT INTO `sys_job_log` VALUES (3695, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:06');
INSERT INTO `sys_job_log` VALUES (3696, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:35:06');
INSERT INTO `sys_job_log` VALUES (3697, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:06');
INSERT INTO `sys_job_log` VALUES (3698, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:16');
INSERT INTO `sys_job_log` VALUES (3699, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:16');
INSERT INTO `sys_job_log` VALUES (3700, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:35:16');
INSERT INTO `sys_job_log` VALUES (3701, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:35:26');
INSERT INTO `sys_job_log` VALUES (3702, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:35:26');
INSERT INTO `sys_job_log` VALUES (3703, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:35:26');
INSERT INTO `sys_job_log` VALUES (3704, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:26');
INSERT INTO `sys_job_log` VALUES (3705, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:36');
INSERT INTO `sys_job_log` VALUES (3706, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:36');
INSERT INTO `sys_job_log` VALUES (3707, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 15:35:36');
INSERT INTO `sys_job_log` VALUES (3708, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:36');
INSERT INTO `sys_job_log` VALUES (3709, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:46');
INSERT INTO `sys_job_log` VALUES (3710, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:35:46');
INSERT INTO `sys_job_log` VALUES (3711, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:35:46');
INSERT INTO `sys_job_log` VALUES (3712, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:46');
INSERT INTO `sys_job_log` VALUES (3713, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:56');
INSERT INTO `sys_job_log` VALUES (3714, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:56');
INSERT INTO `sys_job_log` VALUES (3715, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:35:56');
INSERT INTO `sys_job_log` VALUES (3716, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:35:56');
INSERT INTO `sys_job_log` VALUES (3717, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:06');
INSERT INTO `sys_job_log` VALUES (3718, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:06');
INSERT INTO `sys_job_log` VALUES (3719, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:36:06');
INSERT INTO `sys_job_log` VALUES (3720, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:06');
INSERT INTO `sys_job_log` VALUES (3721, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:16');
INSERT INTO `sys_job_log` VALUES (3722, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:16');
INSERT INTO `sys_job_log` VALUES (3723, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:36:16');
INSERT INTO `sys_job_log` VALUES (3724, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:26');
INSERT INTO `sys_job_log` VALUES (3725, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:26');
INSERT INTO `sys_job_log` VALUES (3726, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:36:26');
INSERT INTO `sys_job_log` VALUES (3727, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:36:36');
INSERT INTO `sys_job_log` VALUES (3728, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:36:36');
INSERT INTO `sys_job_log` VALUES (3729, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:36');
INSERT INTO `sys_job_log` VALUES (3730, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:36:36');
INSERT INTO `sys_job_log` VALUES (3731, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:46');
INSERT INTO `sys_job_log` VALUES (3732, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:36:46');
INSERT INTO `sys_job_log` VALUES (3733, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:36:46');
INSERT INTO `sys_job_log` VALUES (3734, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:36:56');
INSERT INTO `sys_job_log` VALUES (3735, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:36:56');
INSERT INTO `sys_job_log` VALUES (3736, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:36:56');
INSERT INTO `sys_job_log` VALUES (3737, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:36:56');
INSERT INTO `sys_job_log` VALUES (3738, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:37:06');
INSERT INTO `sys_job_log` VALUES (3739, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:06');
INSERT INTO `sys_job_log` VALUES (3740, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:37:06');
INSERT INTO `sys_job_log` VALUES (3741, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:06');
INSERT INTO `sys_job_log` VALUES (3742, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:06');
INSERT INTO `sys_job_log` VALUES (3743, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:16');
INSERT INTO `sys_job_log` VALUES (3744, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:16');
INSERT INTO `sys_job_log` VALUES (3745, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:37:16');
INSERT INTO `sys_job_log` VALUES (3746, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:26');
INSERT INTO `sys_job_log` VALUES (3747, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:26');
INSERT INTO `sys_job_log` VALUES (3748, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:37:26');
INSERT INTO `sys_job_log` VALUES (3749, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:37:26');
INSERT INTO `sys_job_log` VALUES (3750, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:37:36');
INSERT INTO `sys_job_log` VALUES (3751, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:36');
INSERT INTO `sys_job_log` VALUES (3752, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:37:36');
INSERT INTO `sys_job_log` VALUES (3753, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:36');
INSERT INTO `sys_job_log` VALUES (3754, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:46');
INSERT INTO `sys_job_log` VALUES (3755, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:46');
INSERT INTO `sys_job_log` VALUES (3756, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:37:46');
INSERT INTO `sys_job_log` VALUES (3757, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:56');
INSERT INTO `sys_job_log` VALUES (3758, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:56');
INSERT INTO `sys_job_log` VALUES (3759, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:37:56');
INSERT INTO `sys_job_log` VALUES (3760, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:37:56');
INSERT INTO `sys_job_log` VALUES (3761, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:06');
INSERT INTO `sys_job_log` VALUES (3762, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:06');
INSERT INTO `sys_job_log` VALUES (3763, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:38:06');
INSERT INTO `sys_job_log` VALUES (3764, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:06');
INSERT INTO `sys_job_log` VALUES (3765, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:06');
INSERT INTO `sys_job_log` VALUES (3766, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:16');
INSERT INTO `sys_job_log` VALUES (3767, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:16');
INSERT INTO `sys_job_log` VALUES (3768, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:38:16');
INSERT INTO `sys_job_log` VALUES (3769, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:38:26');
INSERT INTO `sys_job_log` VALUES (3770, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:26');
INSERT INTO `sys_job_log` VALUES (3771, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:38:26');
INSERT INTO `sys_job_log` VALUES (3772, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:36');
INSERT INTO `sys_job_log` VALUES (3773, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:36');
INSERT INTO `sys_job_log` VALUES (3774, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:38:36');
INSERT INTO `sys_job_log` VALUES (3775, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:38:36');
INSERT INTO `sys_job_log` VALUES (3776, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:38:46');
INSERT INTO `sys_job_log` VALUES (3777, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:38:46');
INSERT INTO `sys_job_log` VALUES (3778, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:38:46');
INSERT INTO `sys_job_log` VALUES (3779, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:38:46');
INSERT INTO `sys_job_log` VALUES (3780, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:38:46');
INSERT INTO `sys_job_log` VALUES (3781, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:38:56');
INSERT INTO `sys_job_log` VALUES (3782, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:39:06');
INSERT INTO `sys_job_log` VALUES (3783, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:39:06');
INSERT INTO `sys_job_log` VALUES (3784, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:39:06');
INSERT INTO `sys_job_log` VALUES (3785, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:06');
INSERT INTO `sys_job_log` VALUES (3786, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:39:06');
INSERT INTO `sys_job_log` VALUES (3787, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:39:16');
INSERT INTO `sys_job_log` VALUES (3788, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:39:16');
INSERT INTO `sys_job_log` VALUES (3789, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:39:16');
INSERT INTO `sys_job_log` VALUES (3790, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:16');
INSERT INTO `sys_job_log` VALUES (3791, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:26');
INSERT INTO `sys_job_log` VALUES (3792, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:26');
INSERT INTO `sys_job_log` VALUES (3793, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:39:26');
INSERT INTO `sys_job_log` VALUES (3794, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:36');
INSERT INTO `sys_job_log` VALUES (3795, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:36');
INSERT INTO `sys_job_log` VALUES (3796, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:39:36');
INSERT INTO `sys_job_log` VALUES (3797, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:36');
INSERT INTO `sys_job_log` VALUES (3798, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:46');
INSERT INTO `sys_job_log` VALUES (3799, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:46');
INSERT INTO `sys_job_log` VALUES (3800, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:39:46');
INSERT INTO `sys_job_log` VALUES (3801, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:46');
INSERT INTO `sys_job_log` VALUES (3802, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:56');
INSERT INTO `sys_job_log` VALUES (3803, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:56');
INSERT INTO `sys_job_log` VALUES (3804, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:39:56');
INSERT INTO `sys_job_log` VALUES (3805, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:39:56');
INSERT INTO `sys_job_log` VALUES (3806, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:06');
INSERT INTO `sys_job_log` VALUES (3807, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:06');
INSERT INTO `sys_job_log` VALUES (3808, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:40:06');
INSERT INTO `sys_job_log` VALUES (3809, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:06');
INSERT INTO `sys_job_log` VALUES (3810, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:06');
INSERT INTO `sys_job_log` VALUES (3811, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:16');
INSERT INTO `sys_job_log` VALUES (3812, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:16');
INSERT INTO `sys_job_log` VALUES (3813, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:40:16');
INSERT INTO `sys_job_log` VALUES (3814, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:26');
INSERT INTO `sys_job_log` VALUES (3815, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:40:26');
INSERT INTO `sys_job_log` VALUES (3816, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:40:26');
INSERT INTO `sys_job_log` VALUES (3817, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:36');
INSERT INTO `sys_job_log` VALUES (3818, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:36');
INSERT INTO `sys_job_log` VALUES (3819, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:40:36');
INSERT INTO `sys_job_log` VALUES (3820, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:36');
INSERT INTO `sys_job_log` VALUES (3821, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:40:46');
INSERT INTO `sys_job_log` VALUES (3822, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:46');
INSERT INTO `sys_job_log` VALUES (3823, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:40:46');
INSERT INTO `sys_job_log` VALUES (3824, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:46');
INSERT INTO `sys_job_log` VALUES (3825, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:56');
INSERT INTO `sys_job_log` VALUES (3826, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:56');
INSERT INTO `sys_job_log` VALUES (3827, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:40:56');
INSERT INTO `sys_job_log` VALUES (3828, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:40:56');
INSERT INTO `sys_job_log` VALUES (3829, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:06');
INSERT INTO `sys_job_log` VALUES (3830, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:06');
INSERT INTO `sys_job_log` VALUES (3831, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:41:06');
INSERT INTO `sys_job_log` VALUES (3832, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:06');
INSERT INTO `sys_job_log` VALUES (3833, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:06');
INSERT INTO `sys_job_log` VALUES (3834, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:16');
INSERT INTO `sys_job_log` VALUES (3835, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:16');
INSERT INTO `sys_job_log` VALUES (3836, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:41:16');
INSERT INTO `sys_job_log` VALUES (3837, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:26');
INSERT INTO `sys_job_log` VALUES (3838, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:26');
INSERT INTO `sys_job_log` VALUES (3839, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:41:26');
INSERT INTO `sys_job_log` VALUES (3840, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:26');
INSERT INTO `sys_job_log` VALUES (3841, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:26');
INSERT INTO `sys_job_log` VALUES (3842, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:41:36');
INSERT INTO `sys_job_log` VALUES (3843, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:36');
INSERT INTO `sys_job_log` VALUES (3844, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:46');
INSERT INTO `sys_job_log` VALUES (3845, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:46');
INSERT INTO `sys_job_log` VALUES (3846, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:41:46');
INSERT INTO `sys_job_log` VALUES (3847, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:41:56');
INSERT INTO `sys_job_log` VALUES (3848, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:41:56');
INSERT INTO `sys_job_log` VALUES (3849, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 15:41:56');
INSERT INTO `sys_job_log` VALUES (3850, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:41:56');
INSERT INTO `sys_job_log` VALUES (3851, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:06');
INSERT INTO `sys_job_log` VALUES (3852, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:06');
INSERT INTO `sys_job_log` VALUES (3853, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:42:06');
INSERT INTO `sys_job_log` VALUES (3854, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:06');
INSERT INTO `sys_job_log` VALUES (3855, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:06');
INSERT INTO `sys_job_log` VALUES (3856, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:16');
INSERT INTO `sys_job_log` VALUES (3857, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:16');
INSERT INTO `sys_job_log` VALUES (3858, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:42:16');
INSERT INTO `sys_job_log` VALUES (3859, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:16');
INSERT INTO `sys_job_log` VALUES (3860, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:16');
INSERT INTO `sys_job_log` VALUES (3861, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:42:26');
INSERT INTO `sys_job_log` VALUES (3862, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:26');
INSERT INTO `sys_job_log` VALUES (3863, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:26');
INSERT INTO `sys_job_log` VALUES (3864, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:36');
INSERT INTO `sys_job_log` VALUES (3865, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:42:36');
INSERT INTO `sys_job_log` VALUES (3866, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:36');
INSERT INTO `sys_job_log` VALUES (3867, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:46');
INSERT INTO `sys_job_log` VALUES (3868, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:46');
INSERT INTO `sys_job_log` VALUES (3869, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:42:46');
INSERT INTO `sys_job_log` VALUES (3870, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:46');
INSERT INTO `sys_job_log` VALUES (3871, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:56');
INSERT INTO `sys_job_log` VALUES (3872, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:56');
INSERT INTO `sys_job_log` VALUES (3873, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:42:56');
INSERT INTO `sys_job_log` VALUES (3874, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:56');
INSERT INTO `sys_job_log` VALUES (3875, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:42:56');
INSERT INTO `sys_job_log` VALUES (3876, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:06');
INSERT INTO `sys_job_log` VALUES (3877, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:43:06');
INSERT INTO `sys_job_log` VALUES (3878, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:06');
INSERT INTO `sys_job_log` VALUES (3879, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:06');
INSERT INTO `sys_job_log` VALUES (3880, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:16');
INSERT INTO `sys_job_log` VALUES (3881, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:16');
INSERT INTO `sys_job_log` VALUES (3882, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:43:16');
INSERT INTO `sys_job_log` VALUES (3883, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:16');
INSERT INTO `sys_job_log` VALUES (3884, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:26');
INSERT INTO `sys_job_log` VALUES (3885, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:26');
INSERT INTO `sys_job_log` VALUES (3886, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:43:26');
INSERT INTO `sys_job_log` VALUES (3887, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:26');
INSERT INTO `sys_job_log` VALUES (3888, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:36');
INSERT INTO `sys_job_log` VALUES (3889, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:36');
INSERT INTO `sys_job_log` VALUES (3890, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:43:36');
INSERT INTO `sys_job_log` VALUES (3891, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:36');
INSERT INTO `sys_job_log` VALUES (3892, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:36');
INSERT INTO `sys_job_log` VALUES (3893, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 15:43:46');
INSERT INTO `sys_job_log` VALUES (3894, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:43:46');
INSERT INTO `sys_job_log` VALUES (3895, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:43:56');
INSERT INTO `sys_job_log` VALUES (3896, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:56');
INSERT INTO `sys_job_log` VALUES (3897, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:43:56');
INSERT INTO `sys_job_log` VALUES (3898, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:56');
INSERT INTO `sys_job_log` VALUES (3899, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:43:56');
INSERT INTO `sys_job_log` VALUES (3900, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 15:44:06');
INSERT INTO `sys_job_log` VALUES (3901, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:06');
INSERT INTO `sys_job_log` VALUES (3902, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:06');
INSERT INTO `sys_job_log` VALUES (3903, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:16');
INSERT INTO `sys_job_log` VALUES (3904, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:16');
INSERT INTO `sys_job_log` VALUES (3905, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:44:16');
INSERT INTO `sys_job_log` VALUES (3906, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:26');
INSERT INTO `sys_job_log` VALUES (3907, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:26');
INSERT INTO `sys_job_log` VALUES (3908, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:44:26');
INSERT INTO `sys_job_log` VALUES (3909, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:26');
INSERT INTO `sys_job_log` VALUES (3910, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:36');
INSERT INTO `sys_job_log` VALUES (3911, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:36');
INSERT INTO `sys_job_log` VALUES (3912, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:44:36');
INSERT INTO `sys_job_log` VALUES (3913, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:36');
INSERT INTO `sys_job_log` VALUES (3914, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:46');
INSERT INTO `sys_job_log` VALUES (3915, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:46');
INSERT INTO `sys_job_log` VALUES (3916, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:44:46');
INSERT INTO `sys_job_log` VALUES (3917, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:56');
INSERT INTO `sys_job_log` VALUES (3918, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:56');
INSERT INTO `sys_job_log` VALUES (3919, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:44:56');
INSERT INTO `sys_job_log` VALUES (3920, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:44:56');
INSERT INTO `sys_job_log` VALUES (3921, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:06');
INSERT INTO `sys_job_log` VALUES (3922, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:06');
INSERT INTO `sys_job_log` VALUES (3923, 'task:system:joblog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:45:06');
INSERT INTO `sys_job_log` VALUES (3924, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:06');
INSERT INTO `sys_job_log` VALUES (3925, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:06');
INSERT INTO `sys_job_log` VALUES (3926, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:16');
INSERT INTO `sys_job_log` VALUES (3927, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:16');
INSERT INTO `sys_job_log` VALUES (3928, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:45:16');
INSERT INTO `sys_job_log` VALUES (3929, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:45:16');
INSERT INTO `sys_job_log` VALUES (3930, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:45:26');
INSERT INTO `sys_job_log` VALUES (3931, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 15:45:26');
INSERT INTO `sys_job_log` VALUES (3932, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:26');
INSERT INTO `sys_job_log` VALUES (3933, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:36');
INSERT INTO `sys_job_log` VALUES (3934, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:36');
INSERT INTO `sys_job_log` VALUES (3935, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:45:36');
INSERT INTO `sys_job_log` VALUES (3936, 'task:system:operlog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 15:45:36');
INSERT INTO `sys_job_log` VALUES (3937, 'task:system:operlog', '100', '耗时 12 毫秒', '0', '', '2023-06-13 15:45:46');
INSERT INTO `sys_job_log` VALUES (3938, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:45:46');
INSERT INTO `sys_job_log` VALUES (3939, 'task:system:joblog', '100', '耗时 39 毫秒', '0', '', '2023-06-13 15:45:46');
INSERT INTO `sys_job_log` VALUES (3940, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:46');
INSERT INTO `sys_job_log` VALUES (3941, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:56');
INSERT INTO `sys_job_log` VALUES (3942, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:45:56');
INSERT INTO `sys_job_log` VALUES (3943, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:45:56');
INSERT INTO `sys_job_log` VALUES (3944, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:06');
INSERT INTO `sys_job_log` VALUES (3945, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:06');
INSERT INTO `sys_job_log` VALUES (3946, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:46:06');
INSERT INTO `sys_job_log` VALUES (3947, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:06');
INSERT INTO `sys_job_log` VALUES (3948, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:46:06');
INSERT INTO `sys_job_log` VALUES (3949, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:46:16');
INSERT INTO `sys_job_log` VALUES (3950, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:46:16');
INSERT INTO `sys_job_log` VALUES (3951, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:46:16');
INSERT INTO `sys_job_log` VALUES (3952, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:16');
INSERT INTO `sys_job_log` VALUES (3953, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:26');
INSERT INTO `sys_job_log` VALUES (3954, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:26');
INSERT INTO `sys_job_log` VALUES (3955, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:46:26');
INSERT INTO `sys_job_log` VALUES (3956, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:36');
INSERT INTO `sys_job_log` VALUES (3957, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:36');
INSERT INTO `sys_job_log` VALUES (3958, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:46:36');
INSERT INTO `sys_job_log` VALUES (3959, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:36');
INSERT INTO `sys_job_log` VALUES (3960, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:46');
INSERT INTO `sys_job_log` VALUES (3961, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:46');
INSERT INTO `sys_job_log` VALUES (3962, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:46:46');
INSERT INTO `sys_job_log` VALUES (3963, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:46');
INSERT INTO `sys_job_log` VALUES (3964, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:56');
INSERT INTO `sys_job_log` VALUES (3965, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:46:56');
INSERT INTO `sys_job_log` VALUES (3966, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:46:56');
INSERT INTO `sys_job_log` VALUES (3967, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:46:56');
INSERT INTO `sys_job_log` VALUES (3968, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:06');
INSERT INTO `sys_job_log` VALUES (3969, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:06');
INSERT INTO `sys_job_log` VALUES (3970, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:47:06');
INSERT INTO `sys_job_log` VALUES (3971, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:06');
INSERT INTO `sys_job_log` VALUES (3972, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:06');
INSERT INTO `sys_job_log` VALUES (3973, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:16');
INSERT INTO `sys_job_log` VALUES (3974, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:16');
INSERT INTO `sys_job_log` VALUES (3975, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:47:16');
INSERT INTO `sys_job_log` VALUES (3976, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:47:16');
INSERT INTO `sys_job_log` VALUES (3977, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:47:26');
INSERT INTO `sys_job_log` VALUES (3978, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:26');
INSERT INTO `sys_job_log` VALUES (3979, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:47:26');
INSERT INTO `sys_job_log` VALUES (3980, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:36');
INSERT INTO `sys_job_log` VALUES (3981, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:36');
INSERT INTO `sys_job_log` VALUES (3982, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:47:36');
INSERT INTO `sys_job_log` VALUES (3983, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:36');
INSERT INTO `sys_job_log` VALUES (3984, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:46');
INSERT INTO `sys_job_log` VALUES (3985, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:46');
INSERT INTO `sys_job_log` VALUES (3986, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:47:46');
INSERT INTO `sys_job_log` VALUES (3987, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:47:56');
INSERT INTO `sys_job_log` VALUES (3988, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:47:56');
INSERT INTO `sys_job_log` VALUES (3989, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:47:56');
INSERT INTO `sys_job_log` VALUES (3990, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:47:56');
INSERT INTO `sys_job_log` VALUES (3991, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:06');
INSERT INTO `sys_job_log` VALUES (3992, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:06');
INSERT INTO `sys_job_log` VALUES (3993, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:48:06');
INSERT INTO `sys_job_log` VALUES (3994, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:06');
INSERT INTO `sys_job_log` VALUES (3995, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:06');
INSERT INTO `sys_job_log` VALUES (3996, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:16');
INSERT INTO `sys_job_log` VALUES (3997, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:16');
INSERT INTO `sys_job_log` VALUES (3998, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:48:16');
INSERT INTO `sys_job_log` VALUES (3999, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:16');
INSERT INTO `sys_job_log` VALUES (4000, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:26');
INSERT INTO `sys_job_log` VALUES (4001, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:26');
INSERT INTO `sys_job_log` VALUES (4002, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:48:26');
INSERT INTO `sys_job_log` VALUES (4003, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:26');
INSERT INTO `sys_job_log` VALUES (4004, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:36');
INSERT INTO `sys_job_log` VALUES (4005, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:36');
INSERT INTO `sys_job_log` VALUES (4006, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:48:36');
INSERT INTO `sys_job_log` VALUES (4007, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:36');
INSERT INTO `sys_job_log` VALUES (4008, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:36');
INSERT INTO `sys_job_log` VALUES (4009, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:48:46');
INSERT INTO `sys_job_log` VALUES (4010, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:46');
INSERT INTO `sys_job_log` VALUES (4011, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:56');
INSERT INTO `sys_job_log` VALUES (4012, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:56');
INSERT INTO `sys_job_log` VALUES (4013, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:48:56');
INSERT INTO `sys_job_log` VALUES (4014, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:48:56');
INSERT INTO `sys_job_log` VALUES (4015, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:06');
INSERT INTO `sys_job_log` VALUES (4016, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:06');
INSERT INTO `sys_job_log` VALUES (4017, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:49:06');
INSERT INTO `sys_job_log` VALUES (4018, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:06');
INSERT INTO `sys_job_log` VALUES (4019, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:06');
INSERT INTO `sys_job_log` VALUES (4020, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:16');
INSERT INTO `sys_job_log` VALUES (4021, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:16');
INSERT INTO `sys_job_log` VALUES (4022, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:49:16');
INSERT INTO `sys_job_log` VALUES (4023, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:16');
INSERT INTO `sys_job_log` VALUES (4024, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:16');
INSERT INTO `sys_job_log` VALUES (4025, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:26');
INSERT INTO `sys_job_log` VALUES (4026, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:49:26');
INSERT INTO `sys_job_log` VALUES (4027, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:26');
INSERT INTO `sys_job_log` VALUES (4028, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:36');
INSERT INTO `sys_job_log` VALUES (4029, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:49:36');
INSERT INTO `sys_job_log` VALUES (4030, 'task:system:loginInfor', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:49:36');
INSERT INTO `sys_job_log` VALUES (4031, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:46');
INSERT INTO `sys_job_log` VALUES (4032, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:46');
INSERT INTO `sys_job_log` VALUES (4033, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:49:46');
INSERT INTO `sys_job_log` VALUES (4034, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:49:46');
INSERT INTO `sys_job_log` VALUES (4035, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:49:56');
INSERT INTO `sys_job_log` VALUES (4036, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:49:56');
INSERT INTO `sys_job_log` VALUES (4037, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:49:56');
INSERT INTO `sys_job_log` VALUES (4038, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:50:06');
INSERT INTO `sys_job_log` VALUES (4039, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:06');
INSERT INTO `sys_job_log` VALUES (4040, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:50:06');
INSERT INTO `sys_job_log` VALUES (4041, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:06');
INSERT INTO `sys_job_log` VALUES (4042, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:06');
INSERT INTO `sys_job_log` VALUES (4043, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:16');
INSERT INTO `sys_job_log` VALUES (4044, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:16');
INSERT INTO `sys_job_log` VALUES (4045, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:50:16');
INSERT INTO `sys_job_log` VALUES (4046, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:16');
INSERT INTO `sys_job_log` VALUES (4047, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:26');
INSERT INTO `sys_job_log` VALUES (4048, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:26');
INSERT INTO `sys_job_log` VALUES (4049, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:50:26');
INSERT INTO `sys_job_log` VALUES (4050, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:50:36');
INSERT INTO `sys_job_log` VALUES (4051, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:36');
INSERT INTO `sys_job_log` VALUES (4052, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:50:36');
INSERT INTO `sys_job_log` VALUES (4053, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:50:36');
INSERT INTO `sys_job_log` VALUES (4054, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:36');
INSERT INTO `sys_job_log` VALUES (4055, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:50:46');
INSERT INTO `sys_job_log` VALUES (4056, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:46');
INSERT INTO `sys_job_log` VALUES (4057, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:50:56');
INSERT INTO `sys_job_log` VALUES (4058, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:50:56');
INSERT INTO `sys_job_log` VALUES (4059, 'task:system:operlog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:50:56');
INSERT INTO `sys_job_log` VALUES (4060, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:51:06');
INSERT INTO `sys_job_log` VALUES (4061, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:06');
INSERT INTO `sys_job_log` VALUES (4062, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:51:06');
INSERT INTO `sys_job_log` VALUES (4063, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:06');
INSERT INTO `sys_job_log` VALUES (4064, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:06');
INSERT INTO `sys_job_log` VALUES (4065, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:16');
INSERT INTO `sys_job_log` VALUES (4066, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:16');
INSERT INTO `sys_job_log` VALUES (4067, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:51:16');
INSERT INTO `sys_job_log` VALUES (4068, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:16');
INSERT INTO `sys_job_log` VALUES (4069, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:26');
INSERT INTO `sys_job_log` VALUES (4070, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:26');
INSERT INTO `sys_job_log` VALUES (4071, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:51:26');
INSERT INTO `sys_job_log` VALUES (4072, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:26');
INSERT INTO `sys_job_log` VALUES (4073, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:26');
INSERT INTO `sys_job_log` VALUES (4074, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:51:36');
INSERT INTO `sys_job_log` VALUES (4075, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:36');
INSERT INTO `sys_job_log` VALUES (4076, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:46');
INSERT INTO `sys_job_log` VALUES (4077, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:46');
INSERT INTO `sys_job_log` VALUES (4078, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:51:46');
INSERT INTO `sys_job_log` VALUES (4079, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:46');
INSERT INTO `sys_job_log` VALUES (4080, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:56');
INSERT INTO `sys_job_log` VALUES (4081, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:56');
INSERT INTO `sys_job_log` VALUES (4082, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:51:56');
INSERT INTO `sys_job_log` VALUES (4083, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:51:56');
INSERT INTO `sys_job_log` VALUES (4084, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:06');
INSERT INTO `sys_job_log` VALUES (4085, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:06');
INSERT INTO `sys_job_log` VALUES (4086, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:52:06');
INSERT INTO `sys_job_log` VALUES (4087, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:06');
INSERT INTO `sys_job_log` VALUES (4088, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:16');
INSERT INTO `sys_job_log` VALUES (4089, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:16');
INSERT INTO `sys_job_log` VALUES (4090, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:52:16');
INSERT INTO `sys_job_log` VALUES (4091, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:16');
INSERT INTO `sys_job_log` VALUES (4092, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:26');
INSERT INTO `sys_job_log` VALUES (4093, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:26');
INSERT INTO `sys_job_log` VALUES (4094, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:52:26');
INSERT INTO `sys_job_log` VALUES (4095, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:26');
INSERT INTO `sys_job_log` VALUES (4096, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:36');
INSERT INTO `sys_job_log` VALUES (4097, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:36');
INSERT INTO `sys_job_log` VALUES (4098, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:52:36');
INSERT INTO `sys_job_log` VALUES (4099, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:46');
INSERT INTO `sys_job_log` VALUES (4100, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:52:46');
INSERT INTO `sys_job_log` VALUES (4101, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:52:46');
INSERT INTO `sys_job_log` VALUES (4102, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:46');
INSERT INTO `sys_job_log` VALUES (4103, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:56');
INSERT INTO `sys_job_log` VALUES (4104, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:56');
INSERT INTO `sys_job_log` VALUES (4105, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:52:56');
INSERT INTO `sys_job_log` VALUES (4106, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:52:56');
INSERT INTO `sys_job_log` VALUES (4107, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:06');
INSERT INTO `sys_job_log` VALUES (4108, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:06');
INSERT INTO `sys_job_log` VALUES (4109, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:53:06');
INSERT INTO `sys_job_log` VALUES (4110, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:06');
INSERT INTO `sys_job_log` VALUES (4111, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:06');
INSERT INTO `sys_job_log` VALUES (4112, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:16');
INSERT INTO `sys_job_log` VALUES (4113, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:53:16');
INSERT INTO `sys_job_log` VALUES (4114, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:16');
INSERT INTO `sys_job_log` VALUES (4115, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:26');
INSERT INTO `sys_job_log` VALUES (4116, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:26');
INSERT INTO `sys_job_log` VALUES (4117, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:53:26');
INSERT INTO `sys_job_log` VALUES (4118, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:36');
INSERT INTO `sys_job_log` VALUES (4119, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:36');
INSERT INTO `sys_job_log` VALUES (4120, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:53:36');
INSERT INTO `sys_job_log` VALUES (4121, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:36');
INSERT INTO `sys_job_log` VALUES (4122, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:46');
INSERT INTO `sys_job_log` VALUES (4123, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:46');
INSERT INTO `sys_job_log` VALUES (4124, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:53:46');
INSERT INTO `sys_job_log` VALUES (4125, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:46');
INSERT INTO `sys_job_log` VALUES (4126, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:53:56');
INSERT INTO `sys_job_log` VALUES (4127, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:56');
INSERT INTO `sys_job_log` VALUES (4128, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:53:56');
INSERT INTO `sys_job_log` VALUES (4129, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:53:56');
INSERT INTO `sys_job_log` VALUES (4130, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:06');
INSERT INTO `sys_job_log` VALUES (4131, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:06');
INSERT INTO `sys_job_log` VALUES (4132, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:54:06');
INSERT INTO `sys_job_log` VALUES (4133, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:06');
INSERT INTO `sys_job_log` VALUES (4134, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:16');
INSERT INTO `sys_job_log` VALUES (4135, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:16');
INSERT INTO `sys_job_log` VALUES (4136, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:54:16');
INSERT INTO `sys_job_log` VALUES (4137, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:16');
INSERT INTO `sys_job_log` VALUES (4138, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:26');
INSERT INTO `sys_job_log` VALUES (4139, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:26');
INSERT INTO `sys_job_log` VALUES (4140, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:54:26');
INSERT INTO `sys_job_log` VALUES (4141, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:54:36');
INSERT INTO `sys_job_log` VALUES (4142, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:54:36');
INSERT INTO `sys_job_log` VALUES (4143, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:54:36');
INSERT INTO `sys_job_log` VALUES (4144, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:46');
INSERT INTO `sys_job_log` VALUES (4145, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:46');
INSERT INTO `sys_job_log` VALUES (4146, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:54:46');
INSERT INTO `sys_job_log` VALUES (4147, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:46');
INSERT INTO `sys_job_log` VALUES (4148, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:56');
INSERT INTO `sys_job_log` VALUES (4149, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:54:56');
INSERT INTO `sys_job_log` VALUES (4150, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:54:56');
INSERT INTO `sys_job_log` VALUES (4151, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:06');
INSERT INTO `sys_job_log` VALUES (4152, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:06');
INSERT INTO `sys_job_log` VALUES (4153, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:55:06');
INSERT INTO `sys_job_log` VALUES (4154, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:06');
INSERT INTO `sys_job_log` VALUES (4155, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:06');
INSERT INTO `sys_job_log` VALUES (4156, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:16');
INSERT INTO `sys_job_log` VALUES (4157, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:55:16');
INSERT INTO `sys_job_log` VALUES (4158, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:16');
INSERT INTO `sys_job_log` VALUES (4159, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:26');
INSERT INTO `sys_job_log` VALUES (4160, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:26');
INSERT INTO `sys_job_log` VALUES (4161, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:55:26');
INSERT INTO `sys_job_log` VALUES (4162, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:36');
INSERT INTO `sys_job_log` VALUES (4163, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:36');
INSERT INTO `sys_job_log` VALUES (4164, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:55:36');
INSERT INTO `sys_job_log` VALUES (4165, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:36');
INSERT INTO `sys_job_log` VALUES (4166, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:46');
INSERT INTO `sys_job_log` VALUES (4167, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:46');
INSERT INTO `sys_job_log` VALUES (4168, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:55:46');
INSERT INTO `sys_job_log` VALUES (4169, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:46');
INSERT INTO `sys_job_log` VALUES (4170, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:56');
INSERT INTO `sys_job_log` VALUES (4171, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:55:56');
INSERT INTO `sys_job_log` VALUES (4172, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:55:56');
INSERT INTO `sys_job_log` VALUES (4173, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:55:56');
INSERT INTO `sys_job_log` VALUES (4174, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:06');
INSERT INTO `sys_job_log` VALUES (4175, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:06');
INSERT INTO `sys_job_log` VALUES (4176, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:56:06');
INSERT INTO `sys_job_log` VALUES (4177, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:06');
INSERT INTO `sys_job_log` VALUES (4178, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:06');
INSERT INTO `sys_job_log` VALUES (4179, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:16');
INSERT INTO `sys_job_log` VALUES (4180, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:16');
INSERT INTO `sys_job_log` VALUES (4181, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:56:16');
INSERT INTO `sys_job_log` VALUES (4182, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:16');
INSERT INTO `sys_job_log` VALUES (4183, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:26');
INSERT INTO `sys_job_log` VALUES (4184, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:26');
INSERT INTO `sys_job_log` VALUES (4185, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 15:56:26');
INSERT INTO `sys_job_log` VALUES (4186, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:36');
INSERT INTO `sys_job_log` VALUES (4187, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:36');
INSERT INTO `sys_job_log` VALUES (4188, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 15:56:36');
INSERT INTO `sys_job_log` VALUES (4189, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:46');
INSERT INTO `sys_job_log` VALUES (4190, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:46');
INSERT INTO `sys_job_log` VALUES (4191, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:56:46');
INSERT INTO `sys_job_log` VALUES (4192, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:46');
INSERT INTO `sys_job_log` VALUES (4193, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:56');
INSERT INTO `sys_job_log` VALUES (4194, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:56:56');
INSERT INTO `sys_job_log` VALUES (4195, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 15:56:56');
INSERT INTO `sys_job_log` VALUES (4196, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:56:56');
INSERT INTO `sys_job_log` VALUES (4197, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:06');
INSERT INTO `sys_job_log` VALUES (4198, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:06');
INSERT INTO `sys_job_log` VALUES (4199, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:57:06');
INSERT INTO `sys_job_log` VALUES (4200, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:06');
INSERT INTO `sys_job_log` VALUES (4201, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:06');
INSERT INTO `sys_job_log` VALUES (4202, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:16');
INSERT INTO `sys_job_log` VALUES (4203, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 15:57:16');
INSERT INTO `sys_job_log` VALUES (4204, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:57:16');
INSERT INTO `sys_job_log` VALUES (4205, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:57:16');
INSERT INTO `sys_job_log` VALUES (4206, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:57:26');
INSERT INTO `sys_job_log` VALUES (4207, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:26');
INSERT INTO `sys_job_log` VALUES (4208, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:57:26');
INSERT INTO `sys_job_log` VALUES (4209, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:26');
INSERT INTO `sys_job_log` VALUES (4210, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:36');
INSERT INTO `sys_job_log` VALUES (4211, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:36');
INSERT INTO `sys_job_log` VALUES (4212, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:57:36');
INSERT INTO `sys_job_log` VALUES (4213, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:36');
INSERT INTO `sys_job_log` VALUES (4214, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:46');
INSERT INTO `sys_job_log` VALUES (4215, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:46');
INSERT INTO `sys_job_log` VALUES (4216, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:57:46');
INSERT INTO `sys_job_log` VALUES (4217, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:46');
INSERT INTO `sys_job_log` VALUES (4218, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:56');
INSERT INTO `sys_job_log` VALUES (4219, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:56');
INSERT INTO `sys_job_log` VALUES (4220, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:57:56');
INSERT INTO `sys_job_log` VALUES (4221, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:57:56');
INSERT INTO `sys_job_log` VALUES (4222, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:06');
INSERT INTO `sys_job_log` VALUES (4223, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:06');
INSERT INTO `sys_job_log` VALUES (4224, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:58:06');
INSERT INTO `sys_job_log` VALUES (4225, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:06');
INSERT INTO `sys_job_log` VALUES (4226, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:58:06');
INSERT INTO `sys_job_log` VALUES (4227, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:58:16');
INSERT INTO `sys_job_log` VALUES (4228, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 15:58:16');
INSERT INTO `sys_job_log` VALUES (4229, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:16');
INSERT INTO `sys_job_log` VALUES (4230, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:26');
INSERT INTO `sys_job_log` VALUES (4231, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:26');
INSERT INTO `sys_job_log` VALUES (4232, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:58:26');
INSERT INTO `sys_job_log` VALUES (4233, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:58:36');
INSERT INTO `sys_job_log` VALUES (4234, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:58:36');
INSERT INTO `sys_job_log` VALUES (4235, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:58:36');
INSERT INTO `sys_job_log` VALUES (4236, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:46');
INSERT INTO `sys_job_log` VALUES (4237, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:46');
INSERT INTO `sys_job_log` VALUES (4238, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:58:46');
INSERT INTO `sys_job_log` VALUES (4239, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:46');
INSERT INTO `sys_job_log` VALUES (4240, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:56');
INSERT INTO `sys_job_log` VALUES (4241, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:56');
INSERT INTO `sys_job_log` VALUES (4242, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 15:58:56');
INSERT INTO `sys_job_log` VALUES (4243, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:58:56');
INSERT INTO `sys_job_log` VALUES (4244, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4245, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4246, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4247, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4248, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4249, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:06');
INSERT INTO `sys_job_log` VALUES (4250, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 15:59:16');
INSERT INTO `sys_job_log` VALUES (4251, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:16');
INSERT INTO `sys_job_log` VALUES (4252, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:26');
INSERT INTO `sys_job_log` VALUES (4253, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:26');
INSERT INTO `sys_job_log` VALUES (4254, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:59:26');
INSERT INTO `sys_job_log` VALUES (4255, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:26');
INSERT INTO `sys_job_log` VALUES (4256, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:26');
INSERT INTO `sys_job_log` VALUES (4257, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:36');
INSERT INTO `sys_job_log` VALUES (4258, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 15:59:36');
INSERT INTO `sys_job_log` VALUES (4259, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:36');
INSERT INTO `sys_job_log` VALUES (4260, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:46');
INSERT INTO `sys_job_log` VALUES (4261, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:46');
INSERT INTO `sys_job_log` VALUES (4262, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:59:46');
INSERT INTO `sys_job_log` VALUES (4263, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:46');
INSERT INTO `sys_job_log` VALUES (4264, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:56');
INSERT INTO `sys_job_log` VALUES (4265, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 15:59:56');
INSERT INTO `sys_job_log` VALUES (4266, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 15:59:56');
INSERT INTO `sys_job_log` VALUES (4267, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4268, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4269, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4270, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4271, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4272, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:06');
INSERT INTO `sys_job_log` VALUES (4273, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:16');
INSERT INTO `sys_job_log` VALUES (4274, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:00:16');
INSERT INTO `sys_job_log` VALUES (4275, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:16');
INSERT INTO `sys_job_log` VALUES (4276, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:27');
INSERT INTO `sys_job_log` VALUES (4277, 'task:system:operlog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:00:27');
INSERT INTO `sys_job_log` VALUES (4278, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:00:27');
INSERT INTO `sys_job_log` VALUES (4279, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:36');
INSERT INTO `sys_job_log` VALUES (4280, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:36');
INSERT INTO `sys_job_log` VALUES (4281, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:00:36');
INSERT INTO `sys_job_log` VALUES (4282, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:36');
INSERT INTO `sys_job_log` VALUES (4283, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:46');
INSERT INTO `sys_job_log` VALUES (4284, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:46');
INSERT INTO `sys_job_log` VALUES (4285, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:00:46');
INSERT INTO `sys_job_log` VALUES (4286, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:00:56');
INSERT INTO `sys_job_log` VALUES (4287, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:00:56');
INSERT INTO `sys_job_log` VALUES (4288, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:00:56');
INSERT INTO `sys_job_log` VALUES (4289, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:06');
INSERT INTO `sys_job_log` VALUES (4290, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:06');
INSERT INTO `sys_job_log` VALUES (4291, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:01:06');
INSERT INTO `sys_job_log` VALUES (4292, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:06');
INSERT INTO `sys_job_log` VALUES (4293, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:01:16');
INSERT INTO `sys_job_log` VALUES (4294, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:01:16');
INSERT INTO `sys_job_log` VALUES (4295, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:01:16');
INSERT INTO `sys_job_log` VALUES (4296, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:26');
INSERT INTO `sys_job_log` VALUES (4297, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:01:26');
INSERT INTO `sys_job_log` VALUES (4298, 'task:system:loginInfor', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:01:26');
INSERT INTO `sys_job_log` VALUES (4299, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:26');
INSERT INTO `sys_job_log` VALUES (4300, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:26');
INSERT INTO `sys_job_log` VALUES (4301, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:36');
INSERT INTO `sys_job_log` VALUES (4302, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:01:36');
INSERT INTO `sys_job_log` VALUES (4303, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:36');
INSERT INTO `sys_job_log` VALUES (4304, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:46');
INSERT INTO `sys_job_log` VALUES (4305, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:01:46');
INSERT INTO `sys_job_log` VALUES (4306, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:01:46');
INSERT INTO `sys_job_log` VALUES (4307, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:01:46');
INSERT INTO `sys_job_log` VALUES (4308, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:01:56');
INSERT INTO `sys_job_log` VALUES (4309, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:01:56');
INSERT INTO `sys_job_log` VALUES (4310, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:01:56');
INSERT INTO `sys_job_log` VALUES (4311, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:06');
INSERT INTO `sys_job_log` VALUES (4312, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:06');
INSERT INTO `sys_job_log` VALUES (4313, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:02:06');
INSERT INTO `sys_job_log` VALUES (4314, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:06');
INSERT INTO `sys_job_log` VALUES (4315, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:06');
INSERT INTO `sys_job_log` VALUES (4316, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:16');
INSERT INTO `sys_job_log` VALUES (4317, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:16');
INSERT INTO `sys_job_log` VALUES (4318, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:02:16');
INSERT INTO `sys_job_log` VALUES (4319, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:16');
INSERT INTO `sys_job_log` VALUES (4320, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:16');
INSERT INTO `sys_job_log` VALUES (4321, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:02:26');
INSERT INTO `sys_job_log` VALUES (4322, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:02:36');
INSERT INTO `sys_job_log` VALUES (4323, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:02:36');
INSERT INTO `sys_job_log` VALUES (4324, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:02:36');
INSERT INTO `sys_job_log` VALUES (4325, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:36');
INSERT INTO `sys_job_log` VALUES (4326, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:36');
INSERT INTO `sys_job_log` VALUES (4327, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:02:46');
INSERT INTO `sys_job_log` VALUES (4328, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:02:46');
INSERT INTO `sys_job_log` VALUES (4329, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:02:56');
INSERT INTO `sys_job_log` VALUES (4330, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:56');
INSERT INTO `sys_job_log` VALUES (4331, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:02:56');
INSERT INTO `sys_job_log` VALUES (4332, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:56');
INSERT INTO `sys_job_log` VALUES (4333, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:02:56');
INSERT INTO `sys_job_log` VALUES (4334, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:06');
INSERT INTO `sys_job_log` VALUES (4335, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:03:06');
INSERT INTO `sys_job_log` VALUES (4336, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:06');
INSERT INTO `sys_job_log` VALUES (4337, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:06');
INSERT INTO `sys_job_log` VALUES (4338, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:16');
INSERT INTO `sys_job_log` VALUES (4339, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:03:16');
INSERT INTO `sys_job_log` VALUES (4340, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:16');
INSERT INTO `sys_job_log` VALUES (4341, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:26');
INSERT INTO `sys_job_log` VALUES (4342, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:26');
INSERT INTO `sys_job_log` VALUES (4343, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:03:26');
INSERT INTO `sys_job_log` VALUES (4344, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:26');
INSERT INTO `sys_job_log` VALUES (4345, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:36');
INSERT INTO `sys_job_log` VALUES (4346, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:36');
INSERT INTO `sys_job_log` VALUES (4347, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:03:36');
INSERT INTO `sys_job_log` VALUES (4348, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:36');
INSERT INTO `sys_job_log` VALUES (4349, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:46');
INSERT INTO `sys_job_log` VALUES (4350, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:46');
INSERT INTO `sys_job_log` VALUES (4351, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:03:46');
INSERT INTO `sys_job_log` VALUES (4352, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:46');
INSERT INTO `sys_job_log` VALUES (4353, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:56');
INSERT INTO `sys_job_log` VALUES (4354, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:56');
INSERT INTO `sys_job_log` VALUES (4355, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:03:56');
INSERT INTO `sys_job_log` VALUES (4356, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:03:56');
INSERT INTO `sys_job_log` VALUES (4357, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:03:56');
INSERT INTO `sys_job_log` VALUES (4358, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:04:06');
INSERT INTO `sys_job_log` VALUES (4359, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:04:06');
INSERT INTO `sys_job_log` VALUES (4360, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:06');
INSERT INTO `sys_job_log` VALUES (4361, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:06');
INSERT INTO `sys_job_log` VALUES (4362, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:16');
INSERT INTO `sys_job_log` VALUES (4363, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:16');
INSERT INTO `sys_job_log` VALUES (4364, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:04:16');
INSERT INTO `sys_job_log` VALUES (4365, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:16');
INSERT INTO `sys_job_log` VALUES (4366, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:26');
INSERT INTO `sys_job_log` VALUES (4367, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:26');
INSERT INTO `sys_job_log` VALUES (4368, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:04:26');
INSERT INTO `sys_job_log` VALUES (4369, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:36');
INSERT INTO `sys_job_log` VALUES (4370, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:36');
INSERT INTO `sys_job_log` VALUES (4371, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:04:36');
INSERT INTO `sys_job_log` VALUES (4372, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:04:46');
INSERT INTO `sys_job_log` VALUES (4373, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:04:46');
INSERT INTO `sys_job_log` VALUES (4374, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:04:46');
INSERT INTO `sys_job_log` VALUES (4375, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:04:46');
INSERT INTO `sys_job_log` VALUES (4376, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:04:56');
INSERT INTO `sys_job_log` VALUES (4377, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:04:56');
INSERT INTO `sys_job_log` VALUES (4378, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:04:56');
INSERT INTO `sys_job_log` VALUES (4379, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4380, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4381, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4382, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4383, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4384, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:06');
INSERT INTO `sys_job_log` VALUES (4385, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:05:16');
INSERT INTO `sys_job_log` VALUES (4386, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:16');
INSERT INTO `sys_job_log` VALUES (4387, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:26');
INSERT INTO `sys_job_log` VALUES (4388, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:26');
INSERT INTO `sys_job_log` VALUES (4389, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:05:26');
INSERT INTO `sys_job_log` VALUES (4390, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:36');
INSERT INTO `sys_job_log` VALUES (4391, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:36');
INSERT INTO `sys_job_log` VALUES (4392, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:05:36');
INSERT INTO `sys_job_log` VALUES (4393, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:46');
INSERT INTO `sys_job_log` VALUES (4394, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:05:46');
INSERT INTO `sys_job_log` VALUES (4395, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:05:46');
INSERT INTO `sys_job_log` VALUES (4396, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:46');
INSERT INTO `sys_job_log` VALUES (4397, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:56');
INSERT INTO `sys_job_log` VALUES (4398, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:05:56');
INSERT INTO `sys_job_log` VALUES (4399, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:05:56');
INSERT INTO `sys_job_log` VALUES (4400, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:06');
INSERT INTO `sys_job_log` VALUES (4401, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:06');
INSERT INTO `sys_job_log` VALUES (4402, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:06:06');
INSERT INTO `sys_job_log` VALUES (4403, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:06');
INSERT INTO `sys_job_log` VALUES (4404, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:06');
INSERT INTO `sys_job_log` VALUES (4405, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:16');
INSERT INTO `sys_job_log` VALUES (4406, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:16');
INSERT INTO `sys_job_log` VALUES (4407, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:06:16');
INSERT INTO `sys_job_log` VALUES (4408, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:16');
INSERT INTO `sys_job_log` VALUES (4409, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:26');
INSERT INTO `sys_job_log` VALUES (4410, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:26');
INSERT INTO `sys_job_log` VALUES (4411, 'task:system:joblog', '100', '耗时 13 毫秒', '0', '', '2023-06-13 16:06:26');
INSERT INTO `sys_job_log` VALUES (4412, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:36');
INSERT INTO `sys_job_log` VALUES (4413, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:36');
INSERT INTO `sys_job_log` VALUES (4414, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:06:36');
INSERT INTO `sys_job_log` VALUES (4415, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:06:46');
INSERT INTO `sys_job_log` VALUES (4416, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:06:46');
INSERT INTO `sys_job_log` VALUES (4417, 'task:system:loginInfor', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:06:46');
INSERT INTO `sys_job_log` VALUES (4418, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:06:56');
INSERT INTO `sys_job_log` VALUES (4419, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:06:56');
INSERT INTO `sys_job_log` VALUES (4420, 'task:system:loginInfor', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:06:56');
INSERT INTO `sys_job_log` VALUES (4421, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:06');
INSERT INTO `sys_job_log` VALUES (4422, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:06');
INSERT INTO `sys_job_log` VALUES (4423, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:07:06');
INSERT INTO `sys_job_log` VALUES (4424, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:06');
INSERT INTO `sys_job_log` VALUES (4425, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:07:16');
INSERT INTO `sys_job_log` VALUES (4426, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:07:16');
INSERT INTO `sys_job_log` VALUES (4427, 'task:system:operlog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:07:16');
INSERT INTO `sys_job_log` VALUES (4428, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:26');
INSERT INTO `sys_job_log` VALUES (4429, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:26');
INSERT INTO `sys_job_log` VALUES (4430, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:07:26');
INSERT INTO `sys_job_log` VALUES (4431, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:36');
INSERT INTO `sys_job_log` VALUES (4432, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:07:36');
INSERT INTO `sys_job_log` VALUES (4433, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:07:36');
INSERT INTO `sys_job_log` VALUES (4434, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:36');
INSERT INTO `sys_job_log` VALUES (4435, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:46');
INSERT INTO `sys_job_log` VALUES (4436, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:46');
INSERT INTO `sys_job_log` VALUES (4437, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:07:46');
INSERT INTO `sys_job_log` VALUES (4438, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:46');
INSERT INTO `sys_job_log` VALUES (4439, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:46');
INSERT INTO `sys_job_log` VALUES (4440, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:07:56');
INSERT INTO `sys_job_log` VALUES (4441, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:07:56');
INSERT INTO `sys_job_log` VALUES (4442, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:06');
INSERT INTO `sys_job_log` VALUES (4443, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:06');
INSERT INTO `sys_job_log` VALUES (4444, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:08:06');
INSERT INTO `sys_job_log` VALUES (4445, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:06');
INSERT INTO `sys_job_log` VALUES (4446, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:06');
INSERT INTO `sys_job_log` VALUES (4447, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:16');
INSERT INTO `sys_job_log` VALUES (4448, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:16');
INSERT INTO `sys_job_log` VALUES (4449, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:08:16');
INSERT INTO `sys_job_log` VALUES (4450, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:26');
INSERT INTO `sys_job_log` VALUES (4451, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:26');
INSERT INTO `sys_job_log` VALUES (4452, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:08:26');
INSERT INTO `sys_job_log` VALUES (4453, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:08:36');
INSERT INTO `sys_job_log` VALUES (4454, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:36');
INSERT INTO `sys_job_log` VALUES (4455, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:08:36');
INSERT INTO `sys_job_log` VALUES (4456, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:36');
INSERT INTO `sys_job_log` VALUES (4457, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:46');
INSERT INTO `sys_job_log` VALUES (4458, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:46');
INSERT INTO `sys_job_log` VALUES (4459, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:08:46');
INSERT INTO `sys_job_log` VALUES (4460, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:46');
INSERT INTO `sys_job_log` VALUES (4461, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:46');
INSERT INTO `sys_job_log` VALUES (4462, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:56');
INSERT INTO `sys_job_log` VALUES (4463, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:08:56');
INSERT INTO `sys_job_log` VALUES (4464, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:08:56');
INSERT INTO `sys_job_log` VALUES (4465, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:06');
INSERT INTO `sys_job_log` VALUES (4466, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:06');
INSERT INTO `sys_job_log` VALUES (4467, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:09:06');
INSERT INTO `sys_job_log` VALUES (4468, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:06');
INSERT INTO `sys_job_log` VALUES (4469, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:06');
INSERT INTO `sys_job_log` VALUES (4470, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:16');
INSERT INTO `sys_job_log` VALUES (4471, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:16');
INSERT INTO `sys_job_log` VALUES (4472, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:09:16');
INSERT INTO `sys_job_log` VALUES (4473, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:16');
INSERT INTO `sys_job_log` VALUES (4474, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:26');
INSERT INTO `sys_job_log` VALUES (4475, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:26');
INSERT INTO `sys_job_log` VALUES (4476, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:09:26');
INSERT INTO `sys_job_log` VALUES (4477, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:09:26');
INSERT INTO `sys_job_log` VALUES (4478, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:09:36');
INSERT INTO `sys_job_log` VALUES (4479, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:36');
INSERT INTO `sys_job_log` VALUES (4480, 'task:system:joblog', '100', '耗时 14 毫秒', '0', '', '2023-06-13 16:09:36');
INSERT INTO `sys_job_log` VALUES (4481, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:36');
INSERT INTO `sys_job_log` VALUES (4482, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:46');
INSERT INTO `sys_job_log` VALUES (4483, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:46');
INSERT INTO `sys_job_log` VALUES (4484, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:09:46');
INSERT INTO `sys_job_log` VALUES (4485, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:46');
INSERT INTO `sys_job_log` VALUES (4486, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:56');
INSERT INTO `sys_job_log` VALUES (4487, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:56');
INSERT INTO `sys_job_log` VALUES (4488, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:09:56');
INSERT INTO `sys_job_log` VALUES (4489, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:56');
INSERT INTO `sys_job_log` VALUES (4490, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:09:56');
INSERT INTO `sys_job_log` VALUES (4491, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:10:06');
INSERT INTO `sys_job_log` VALUES (4492, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:06');
INSERT INTO `sys_job_log` VALUES (4493, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:10:06');
INSERT INTO `sys_job_log` VALUES (4494, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:10:16');
INSERT INTO `sys_job_log` VALUES (4495, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:16');
INSERT INTO `sys_job_log` VALUES (4496, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:10:16');
INSERT INTO `sys_job_log` VALUES (4497, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:10:26');
INSERT INTO `sys_job_log` VALUES (4498, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:26');
INSERT INTO `sys_job_log` VALUES (4499, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:10:26');
INSERT INTO `sys_job_log` VALUES (4500, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:36');
INSERT INTO `sys_job_log` VALUES (4501, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:10:36');
INSERT INTO `sys_job_log` VALUES (4502, 'task:system:loginInfor', '100', '耗时 9 毫秒', '0', '', '2023-06-13 16:10:36');
INSERT INTO `sys_job_log` VALUES (4503, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:10:46');
INSERT INTO `sys_job_log` VALUES (4504, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:10:46');
INSERT INTO `sys_job_log` VALUES (4505, 'task:system:operlog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:10:46');
INSERT INTO `sys_job_log` VALUES (4506, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:46');
INSERT INTO `sys_job_log` VALUES (4507, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:56');
INSERT INTO `sys_job_log` VALUES (4508, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:10:56');
INSERT INTO `sys_job_log` VALUES (4509, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:10:56');
INSERT INTO `sys_job_log` VALUES (4510, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:10:56');
INSERT INTO `sys_job_log` VALUES (4511, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:07');
INSERT INTO `sys_job_log` VALUES (4512, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:07');
INSERT INTO `sys_job_log` VALUES (4513, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:11:07');
INSERT INTO `sys_job_log` VALUES (4514, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:07');
INSERT INTO `sys_job_log` VALUES (4515, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:07');
INSERT INTO `sys_job_log` VALUES (4516, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:16');
INSERT INTO `sys_job_log` VALUES (4517, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:16');
INSERT INTO `sys_job_log` VALUES (4518, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:11:16');
INSERT INTO `sys_job_log` VALUES (4519, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:16');
INSERT INTO `sys_job_log` VALUES (4520, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:26');
INSERT INTO `sys_job_log` VALUES (4521, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:26');
INSERT INTO `sys_job_log` VALUES (4522, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:11:26');
INSERT INTO `sys_job_log` VALUES (4523, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:36');
INSERT INTO `sys_job_log` VALUES (4524, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:36');
INSERT INTO `sys_job_log` VALUES (4525, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:11:36');
INSERT INTO `sys_job_log` VALUES (4526, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:36');
INSERT INTO `sys_job_log` VALUES (4527, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:36');
INSERT INTO `sys_job_log` VALUES (4528, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:46');
INSERT INTO `sys_job_log` VALUES (4529, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:11:46');
INSERT INTO `sys_job_log` VALUES (4530, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:46');
INSERT INTO `sys_job_log` VALUES (4531, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:56');
INSERT INTO `sys_job_log` VALUES (4532, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:11:56');
INSERT INTO `sys_job_log` VALUES (4533, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:11:56');
INSERT INTO `sys_job_log` VALUES (4534, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:11:56');
INSERT INTO `sys_job_log` VALUES (4535, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:06');
INSERT INTO `sys_job_log` VALUES (4536, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:06');
INSERT INTO `sys_job_log` VALUES (4537, 'task:system:joblog', '100', '耗时 30 毫秒', '0', '', '2023-06-13 16:12:06');
INSERT INTO `sys_job_log` VALUES (4538, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:06');
INSERT INTO `sys_job_log` VALUES (4539, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:06');
INSERT INTO `sys_job_log` VALUES (4540, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:16');
INSERT INTO `sys_job_log` VALUES (4541, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:16');
INSERT INTO `sys_job_log` VALUES (4542, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:12:16');
INSERT INTO `sys_job_log` VALUES (4543, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:16');
INSERT INTO `sys_job_log` VALUES (4544, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:26');
INSERT INTO `sys_job_log` VALUES (4545, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:26');
INSERT INTO `sys_job_log` VALUES (4546, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:12:26');
INSERT INTO `sys_job_log` VALUES (4547, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:26');
INSERT INTO `sys_job_log` VALUES (4548, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:36');
INSERT INTO `sys_job_log` VALUES (4549, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:36');
INSERT INTO `sys_job_log` VALUES (4550, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:12:36');
INSERT INTO `sys_job_log` VALUES (4551, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:46');
INSERT INTO `sys_job_log` VALUES (4552, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:12:46');
INSERT INTO `sys_job_log` VALUES (4553, 'task:system:loginInfor', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:12:46');
INSERT INTO `sys_job_log` VALUES (4554, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:46');
INSERT INTO `sys_job_log` VALUES (4555, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:12:56');
INSERT INTO `sys_job_log` VALUES (4556, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:12:56');
INSERT INTO `sys_job_log` VALUES (4557, 'task:system:operlog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:12:56');
INSERT INTO `sys_job_log` VALUES (4558, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:06');
INSERT INTO `sys_job_log` VALUES (4559, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:06');
INSERT INTO `sys_job_log` VALUES (4560, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:13:06');
INSERT INTO `sys_job_log` VALUES (4561, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:06');
INSERT INTO `sys_job_log` VALUES (4562, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:16');
INSERT INTO `sys_job_log` VALUES (4563, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:16');
INSERT INTO `sys_job_log` VALUES (4564, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:13:16');
INSERT INTO `sys_job_log` VALUES (4565, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:16');
INSERT INTO `sys_job_log` VALUES (4566, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:26');
INSERT INTO `sys_job_log` VALUES (4567, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:26');
INSERT INTO `sys_job_log` VALUES (4568, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:13:26');
INSERT INTO `sys_job_log` VALUES (4569, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:26');
INSERT INTO `sys_job_log` VALUES (4570, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:36');
INSERT INTO `sys_job_log` VALUES (4571, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:36');
INSERT INTO `sys_job_log` VALUES (4572, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:13:36');
INSERT INTO `sys_job_log` VALUES (4573, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:46');
INSERT INTO `sys_job_log` VALUES (4574, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:46');
INSERT INTO `sys_job_log` VALUES (4575, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:13:46');
INSERT INTO `sys_job_log` VALUES (4576, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:46');
INSERT INTO `sys_job_log` VALUES (4577, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:56');
INSERT INTO `sys_job_log` VALUES (4578, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:13:56');
INSERT INTO `sys_job_log` VALUES (4579, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:13:56');
INSERT INTO `sys_job_log` VALUES (4580, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:13:56');
INSERT INTO `sys_job_log` VALUES (4581, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:14:06');
INSERT INTO `sys_job_log` VALUES (4582, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:06');
INSERT INTO `sys_job_log` VALUES (4583, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:14:06');
INSERT INTO `sys_job_log` VALUES (4584, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:06');
INSERT INTO `sys_job_log` VALUES (4585, 'task:system:loginInfor', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:14:06');
INSERT INTO `sys_job_log` VALUES (4586, 'task:system:operlog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:14:16');
INSERT INTO `sys_job_log` VALUES (4587, 'task:system:joblog', '100', '耗时 24 毫秒', '0', '', '2023-06-13 16:14:16');
INSERT INTO `sys_job_log` VALUES (4588, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:16');
INSERT INTO `sys_job_log` VALUES (4589, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:26');
INSERT INTO `sys_job_log` VALUES (4590, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:26');
INSERT INTO `sys_job_log` VALUES (4591, 'task:system:joblog', '100', '耗时 10 毫秒', '0', '', '2023-06-13 16:14:26');
INSERT INTO `sys_job_log` VALUES (4592, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:36');
INSERT INTO `sys_job_log` VALUES (4593, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:14:36');
INSERT INTO `sys_job_log` VALUES (4594, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:14:36');
INSERT INTO `sys_job_log` VALUES (4595, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:14:36');
INSERT INTO `sys_job_log` VALUES (4596, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:46');
INSERT INTO `sys_job_log` VALUES (4597, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:14:46');
INSERT INTO `sys_job_log` VALUES (4598, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:46');
INSERT INTO `sys_job_log` VALUES (4599, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:56');
INSERT INTO `sys_job_log` VALUES (4600, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:56');
INSERT INTO `sys_job_log` VALUES (4601, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:14:56');
INSERT INTO `sys_job_log` VALUES (4602, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:14:56');
INSERT INTO `sys_job_log` VALUES (4603, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:06');
INSERT INTO `sys_job_log` VALUES (4604, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:06');
INSERT INTO `sys_job_log` VALUES (4605, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:15:06');
INSERT INTO `sys_job_log` VALUES (4606, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:06');
INSERT INTO `sys_job_log` VALUES (4607, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:06');
INSERT INTO `sys_job_log` VALUES (4608, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:16');
INSERT INTO `sys_job_log` VALUES (4609, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:16');
INSERT INTO `sys_job_log` VALUES (4610, 'task:system:joblog', '100', '耗时 3 毫秒', '0', '', '2023-06-13 16:15:16');
INSERT INTO `sys_job_log` VALUES (4611, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:15:16');
INSERT INTO `sys_job_log` VALUES (4612, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:15:26');
INSERT INTO `sys_job_log` VALUES (4613, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:15:26');
INSERT INTO `sys_job_log` VALUES (4614, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:15:26');
INSERT INTO `sys_job_log` VALUES (4615, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:26');
INSERT INTO `sys_job_log` VALUES (4616, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:36');
INSERT INTO `sys_job_log` VALUES (4617, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:36');
INSERT INTO `sys_job_log` VALUES (4618, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:15:36');
INSERT INTO `sys_job_log` VALUES (4619, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:15:46');
INSERT INTO `sys_job_log` VALUES (4620, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:15:46');
INSERT INTO `sys_job_log` VALUES (4621, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:15:46');
INSERT INTO `sys_job_log` VALUES (4622, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:15:46');
INSERT INTO `sys_job_log` VALUES (4623, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:15:56');
INSERT INTO `sys_job_log` VALUES (4624, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:15:56');
INSERT INTO `sys_job_log` VALUES (4625, 'task:system:joblog', '100', '耗时 50 毫秒', '0', '', '2023-06-13 16:15:56');
INSERT INTO `sys_job_log` VALUES (4626, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:15:56');
INSERT INTO `sys_job_log` VALUES (4627, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:06');
INSERT INTO `sys_job_log` VALUES (4628, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:16:06');
INSERT INTO `sys_job_log` VALUES (4629, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:06');
INSERT INTO `sys_job_log` VALUES (4630, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:16:06');
INSERT INTO `sys_job_log` VALUES (4631, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:16:16');
INSERT INTO `sys_job_log` VALUES (4632, 'task:system:loginInfor', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:16:16');
INSERT INTO `sys_job_log` VALUES (4633, 'task:system:joblog', '100', '耗时 9 毫秒', '0', '', '2023-06-13 16:16:16');
INSERT INTO `sys_job_log` VALUES (4634, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:16:16');
INSERT INTO `sys_job_log` VALUES (4635, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:16');
INSERT INTO `sys_job_log` VALUES (4636, 'task:system:joblog', '100', '耗时 21 毫秒', '0', '', '2023-06-13 16:16:26');
INSERT INTO `sys_job_log` VALUES (4637, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:36');
INSERT INTO `sys_job_log` VALUES (4638, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:36');
INSERT INTO `sys_job_log` VALUES (4639, 'task:system:joblog', '100', '耗时 4 毫秒', '0', '', '2023-06-13 16:16:36');
INSERT INTO `sys_job_log` VALUES (4640, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:36');
INSERT INTO `sys_job_log` VALUES (4641, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:36');
INSERT INTO `sys_job_log` VALUES (4642, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:46');
INSERT INTO `sys_job_log` VALUES (4643, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:16:46');
INSERT INTO `sys_job_log` VALUES (4644, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:46');
INSERT INTO `sys_job_log` VALUES (4645, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:56');
INSERT INTO `sys_job_log` VALUES (4646, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:56');
INSERT INTO `sys_job_log` VALUES (4647, 'task:system:joblog', '100', '耗时 11 毫秒', '0', '', '2023-06-13 16:16:56');
INSERT INTO `sys_job_log` VALUES (4648, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:16:56');
INSERT INTO `sys_job_log` VALUES (4649, 'task:system:loginInfor', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4650, 'task:system:operlog', '100', '耗时 0 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4651, 'task:system:joblog', '100', '耗时 5 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4652, 'task:system:noparam', '', '耗时 0 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4653, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4654, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:06');
INSERT INTO `sys_job_log` VALUES (4655, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:16');
INSERT INTO `sys_job_log` VALUES (4656, 'task:system:joblog', '100', '耗时 7 毫秒', '0', '', '2023-06-13 16:17:16');
INSERT INTO `sys_job_log` VALUES (4657, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:16');
INSERT INTO `sys_job_log` VALUES (4658, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:26');
INSERT INTO `sys_job_log` VALUES (4659, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:26');
INSERT INTO `sys_job_log` VALUES (4660, 'task:system:joblog', '100', '耗时 8 毫秒', '0', '', '2023-06-13 16:17:26');
INSERT INTO `sys_job_log` VALUES (4661, 'task:system:loginInfor', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:36');
INSERT INTO `sys_job_log` VALUES (4662, 'task:system:operlog', '100', '耗时 2 毫秒', '0', '', '2023-06-13 16:17:36');
INSERT INTO `sys_job_log` VALUES (4663, 'task:system:joblog', '100', '耗时 6 毫秒', '0', '', '2023-06-13 16:17:36');
INSERT INTO `sys_job_log` VALUES (4664, 'task:system:operlog', '100', '耗时 1 毫秒', '0', '', '2023-06-13 16:17:36');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 11:20:59');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 11:28:41');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 14:52:42');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 15:03:43');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 15:49:21');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 16:01:10');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '1', '验证码错误', '2023-06-13 16:06:33');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 16:06:43');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '1', '验证码错误', '2023-06-13 16:06:38');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 16:10:26');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '0', '登录成功', '2023-06-13 16:12:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件路径',
  `is_frame` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '#' COMMENT '菜单图标',
  `is_log` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '记录日志（0记录，1不记录）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 997, 'system', '', '1', '0', 'M', '0', '0', '', 'system', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2022-12-08 12:07:43', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 998, 'monitor', '', '1', '0', 'M', '0', '0', '', 'monitor', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2022-12-08 12:07:37', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 999, 'tool', '', '1', '0', 'M', '0', '0', '', 'tool', '0', 'admin', '2021-01-27 09:36:41', 'admin', '2022-12-08 12:07:18', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'user', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '1', '0', 'C', '0', '0', 'system:post:list', 'post', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '1', '0', 'M', '0', '0', '', 'log', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '1', '0', 'C', '1', '1', 'monitor:druid:list', 'druid', '0', '', '2021-01-27 09:36:41', '若依', '2021-05-28 00:00:18', '');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '1', '0', 'C', '1', '1', 'monitor:cache:list', 'redis', '0', '', '2021-01-27 09:36:41', '若依', '2021-05-28 00:00:27', '');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '行政区域', 1, 8, 'district', 'system/district/index', '1', '0', 'C', '0', '0', 'system:district:list', 'documentation', '', 'admin', '2022-11-16 21:05:32', 'admin', '2023-03-19 22:45:38', '');
INSERT INTO `sys_menu` VALUES (1203, '文件管理', 1, 10, 'file', '', '1', '0', 'M', '0', '0', '', 'pdf', '', 'admin', '2023-03-23 14:05:21', 'admin', '2023-05-17 13:13:32', '');
INSERT INTO `sys_menu` VALUES (1206, '驱动管理', 1203, 1, 'fileDriver', 'system/fileDriver/index', '1', '0', 'C', '0', '0', 'system:fileDriver:list', '#', '0', 'admin', '2023-03-23 14:41:22', '', NULL, '驱动配置菜单');
INSERT INTO `sys_menu` VALUES (1207, '驱动管理查询', 1206, 1, '#', '', '1', '0', 'F', '0', '0', 'system:fileDriver:query', '#', '0', 'admin', '2023-03-23 14:41:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1208, '驱动管理新增', 1206, 2, '#', '', '1', '0', 'F', '0', '0', 'system:fileDriver:add', '#', '0', 'admin', '2023-03-23 14:41:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1209, '驱动管理修改', 1206, 3, '#', '', '1', '0', 'F', '0', '0', 'system:fileDriver:edit', '#', '0', 'admin', '2023-03-23 14:41:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1210, '驱动管理删除', 1206, 4, '#', '', '1', '0', 'F', '0', '0', 'system:fileDriver:remove', '#', '0', 'admin', '2023-03-23 14:41:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1211, '文件管理', 1203, 1, 'file', 'system/file/index', '1', '0', 'C', '0', '0', 'system:file:list', '#', '0', 'admin', '2023-03-23 14:42:13', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (1212, '文件管理查询', 1211, 1, '#', '', '1', '0', 'F', '0', '0', 'system:file:query', '#', '0', 'admin', '2023-03-23 14:42:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1213, '文件管理新增', 1211, 2, '#', '', '1', '0', 'F', '0', '0', 'system:file:add', '#', '0', 'admin', '2023-03-23 14:42:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1214, '文件管理修改', 1211, 3, '#', '', '1', '0', 'F', '0', '0', 'system:file:edit', '#', '0', 'admin', '2023-03-23 14:42:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1215, '文件管理删除', 1211, 4, '#', '', '1', '0', 'F', '0', '0', 'system:file:remove', '#', '0', 'admin', '2023-03-23 14:42:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1216, '消息管理', 1, 11, 'push', '', '1', '0', 'M', '0', '0', '', 'form', '', 'admin', '2023-03-27 08:31:23', 'admin', '2023-05-17 13:13:40', '');
INSERT INTO `sys_menu` VALUES (1217, '渠道管理', 1216, 2, 'pushChannel', 'system/pushChannel/index', '1', '0', 'C', '0', '0', 'system:pushChannel:list', 'tree', '0', 'admin', '2023-03-27 08:34:07', 'admin', '2023-03-27 12:12:23', '渠道管理菜单');
INSERT INTO `sys_menu` VALUES (1218, '渠道管理查询', 1217, 1, '#', '', '1', '0', 'F', '0', '0', 'system:pushChannel:query', '#', '0', 'admin', '2023-03-27 08:34:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1219, '渠道管理新增', 1217, 2, '#', '', '1', '0', 'F', '0', '0', 'system:pushChannel:add', '#', '0', 'admin', '2023-03-27 08:34:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1220, '渠道管理修改', 1217, 3, '#', '', '1', '0', 'F', '0', '0', 'system:pushChannel:edit', '#', '0', 'admin', '2023-03-27 08:34:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1221, '渠道管理删除', 1217, 4, '#', '', '1', '0', 'F', '0', '0', 'system:pushChannel:remove', '#', '0', 'admin', '2023-03-27 08:34:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1222, '消息类型', 1216, 1, 'pushType', 'system/pushType/index', '1', '0', 'C', '0', '0', 'system:pushType:list', 'theme', '0', 'admin', '2023-03-27 09:53:12', 'admin', '2023-03-27 12:12:08', '渠道类型管理菜单');
INSERT INTO `sys_menu` VALUES (1223, '渠道类型管理查询', 1222, 1, '#', '', '1', '0', 'F', '0', '0', 'system:pushType:query', '#', '0', 'admin', '2023-03-27 09:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1224, '渠道类型管理新增', 1222, 2, '#', '', '1', '0', 'F', '0', '0', 'system:pushType:add', '#', '0', 'admin', '2023-03-27 09:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1225, '渠道类型管理修改', 1222, 3, '#', '', '1', '0', 'F', '0', '0', 'system:pushType:edit', '#', '0', 'admin', '2023-03-27 09:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1226, '渠道类型管理删除', 1222, 4, '#', '', '1', '0', 'F', '0', '0', 'system:pushType:remove', '#', '0', 'admin', '2023-03-27 09:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1227, '消息模板', 1216, 3, 'pushTemplate', 'system/pushTemplate/index', '1', '0', 'C', '0', '0', 'system:pushTemplate:list', 'documentation', '0', 'admin', '2023-03-29 16:12:54', 'admin', '2023-03-29 16:13:44', '消息模板菜单');
INSERT INTO `sys_menu` VALUES (1228, '消息模板查询', 1227, 1, '#', '', '1', '0', 'F', '0', '0', 'system:pushTemplate:query', '#', '0', 'admin', '2023-03-29 16:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1229, '消息模板新增', 1227, 2, '#', '', '1', '0', 'F', '0', '0', 'system:pushTemplate:add', '#', '0', 'admin', '2023-03-29 16:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1230, '消息模板修改', 1227, 3, '#', '', '1', '0', 'F', '0', '0', 'system:pushTemplate:edit', '#', '0', 'admin', '2023-03-29 16:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1231, '消息模板删除', 1227, 4, '#', '', '1', '0', 'F', '0', '0', 'system:pushTemplate:remove', '#', '0', 'admin', '2023-03-29 16:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1232, '数据库管理', 1, 13, 'sqlBackups', 'system/sqlBackups/index', '1', '0', 'C', '0', '0', 'system:sqlBackups:list', 'clipboard', '0', 'admin', '2023-05-16 20:16:51', 'admin', '2023-05-17 13:13:52', '数据库管理');
INSERT INTO `sys_menu` VALUES (1233, '数据库备份查询', 1232, 1, '#', '', '1', '0', 'F', '0', '0', 'system:sqlBackups:query', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1234, '数据库备份', 1232, 2, '#', '', '1', '0', 'F', '0', '0', 'system:sqlBackups:backups', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1235, '数据库恢复', 1232, 3, '#', '', '1', '0', 'F', '0', '0', 'system:sqlBackups:recover', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1236, '数据库备份删除', 1232, 4, '#', '', '1', '0', 'F', '0', '0', 'system:sqlBackups:remove', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1237, '接口管理', 1, 12, 'api', 'system/api/index', '1', '0', 'C', '0', '0', 'system:api:list', 'tool', '0', 'admin', '2023-05-16 20:16:51', 'admin', '2023-05-17 13:13:46', '接口管理菜单');
INSERT INTO `sys_menu` VALUES (1238, '接口管理查询', 1237, 1, '#', '', '1', '0', 'F', '0', '0', 'system:api:query', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1239, '接口管理新增', 1237, 2, '#', '', '1', '0', 'F', '0', '0', 'system:api:add', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1240, '接口管理修改', 1237, 3, '#', '', '1', '0', 'F', '0', '0', 'system:api:edit', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1241, '接口管理删除', 1237, 4, '#', '', '1', '0', 'F', '0', '0', 'system:api:remove', '#', '0', 'admin', '2023-05-16 20:16:51', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api`;
CREATE TABLE `sys_menu_api` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `api_id` bigint NOT NULL COMMENT '接口ID',
  PRIMARY KEY (`menu_id`,`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单接口表';

-- ----------------------------
-- Records of sys_menu_api
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求参数',
  `json_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `execute_time` int DEFAULT NULL COMMENT '耗时',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '', 0, '', 'DELETE', 1, 'admin', '', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', 'null', 0, '', '2023-06-13 11:12:12', 166);
INSERT INTO `sys_oper_log` VALUES (2, '', 0, '', 'DELETE', 1, 'admin', '', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', 'null', 0, '', '2023-06-13 11:12:29', 65);
INSERT INTO `sys_oper_log` VALUES (3, '', 0, '', 'POST', 1, 'admin', '', '/common/upload', '127.0.0.1', '内网IP', '{\"file\":{\"Filename\":\"10muxqn141.png\",\"Header\":{\"Content-Disposition\":[\"form-data; name=\\\"file\\\"; filename=\\\"10muxqn141.png\\\"\"],\"Content-Type\":[\"image/png\"]},\"Size\":37523}}', '{\"url\":\"http://localhost:8000/public/1cp68l38q60ctb707bejkrs2001kdu5y.png\",\"fileName\":\"1cp68l38q60ctb707bejkrs2001kdu5y.png\",\"newFileName\":\"\",\"name\":\"10muxqn141.png\"}', 0, '', '2023-06-13 11:12:44', 13);
INSERT INTO `sys_oper_log` VALUES (4, '', 0, '', 'DELETE', 1, 'admin', '', '/system/file', '127.0.0.1', '内网IP', '{\"ids\":[24]}', 'null', 0, '', '2023-06-13 11:13:00', 8);
INSERT INTO `sys_oper_log` VALUES (5, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"test\"}}', 'null', 0, '', '2023-06-13 11:13:51', 46);
INSERT INTO `sys_oper_log` VALUES (6, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"test\"}}', 'null', 0, '', '2023-06-13 11:14:50', 6);
INSERT INTO `sys_oper_log` VALUES (7, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"test\"}}', 'null', 0, '', '2023-06-13 11:16:13', 18);
INSERT INTO `sys_oper_log` VALUES (8, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"test\"}}', 'null', 0, '', '2023-06-13 11:16:58', 15016);
INSERT INTO `sys_oper_log` VALUES (9, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"test\"}}', 'null', 0, '', '2023-06-13 11:19:27', 57151);
INSERT INTO `sys_oper_log` VALUES (10, '', 0, '', 'POST', 1, 'admin', '', '/system/pushTemplate/test', '127.0.0.1', '内网IP', '{\"account\":\"17375854733\",\"id\":1,\"params\":{\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\",\"templateId\":\"SMS_204785114\"},\"templateParams\":{\"code\":\"123456\"}}', 'null', 0, '', '2023-06-13 11:21:32', 3897);
INSERT INTO `sys_oper_log` VALUES (11, '', 0, '', 'PUT', 1, 'admin', '', '/system/pushChannel', '127.0.0.1', '内网IP', '{\"config\":\"{\\n\\\"host\\\":\\\"smtp.qq.com\\\",\\n\\\"port\\\":465,\\n\\\"userName\\\":\\\"\\\",\\n\\\"password\\\":\\\"\\\"\\n}\",\"createBy\":\"admin\",\"createdAt\":\"2023-03-27 11:41:01\",\"deletedAt\":null,\"id\":1,\"name\":\"QQ邮箱\",\"remark\":\"\",\"status\":\"0\",\"typeId\":3,\"updateBy\":\"admin\",\"updatedAt\":\"2023-03-29 21:32:03\"}', 'null', 0, '', '2023-06-13 11:23:57', 11);
INSERT INTO `sys_oper_log` VALUES (12, '', 0, '', 'PUT', 1, 'admin', '', '/system/pushChannel', '127.0.0.1', '内网IP', '{\"config\":\"{\\n\\\"accessKey\\\":\\\"\\\",\\n\\\"region\\\":\\\"1\\\",\\n\\\"secretKey\\\":\\\"\\\",\\n\\\"signName\\\":\\\"\\\"\\n}\",\"createBy\":\"admin\",\"createdAt\":\"2023-03-27 12:40:20\",\"deletedAt\":null,\"id\":2,\"name\":\"阿里云\",\"remark\":\"\",\"status\":\"0\",\"typeId\":7,\"updateBy\":\"admin\",\"updatedAt\":\"2023-04-01 08:12:08\"}', 'null', 0, '', '2023-06-13 11:24:14', 8);
INSERT INTO `sys_oper_log` VALUES (13, '', 0, '', 'PUT', 1, 'admin', '', '/system/api/reimport', '127.0.0.1', '内网IP', '{}', 'null', 0, '', '2023-06-13 11:28:59', 200);
INSERT INTO `sys_oper_log` VALUES (14, '', 0, '', 'POST', 1, 'admin', '', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', NULL, 0, '', '2023-06-13 11:31:57', 0);
INSERT INTO `sys_oper_log` VALUES (15, '', 0, '', 'POST', 1, 'admin', '', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', NULL, 0, '', '2023-06-13 11:35:15', 1);
INSERT INTO `sys_oper_log` VALUES (16, '', 0, '', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 11:35:57', 27);
INSERT INTO `sys_oper_log` VALUES (17, '', 0, '', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 14:30:55', 9892416);
INSERT INTO `sys_oper_log` VALUES (18, '', 0, '', 'POST', 1, 'admin', '', '/sys/pushChannel/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', NULL, 0, '', '2023-06-13 14:49:03', 1);
INSERT INTO `sys_oper_log` VALUES (19, '', 0, '', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 14:52:52', 11);
INSERT INTO `sys_oper_log` VALUES (20, '', 0, '', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 14:54:40', 77738);
INSERT INTO `sys_oper_log` VALUES (21, '', 0, '', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 14:55:14', 31404);
INSERT INTO `sys_oper_log` VALUES (22, '', 0, '', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 14:59:36', 246319);
INSERT INTO `sys_oper_log` VALUES (23, '', 0, '', 'POST', 1, 'admin', '', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 14:59:48', 5609);
INSERT INTO `sys_oper_log` VALUES (24, '', 0, '', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 15:04:45', 2661);
INSERT INTO `sys_oper_log` VALUES (25, '', 0, '', 'POST', 1, 'admin', '', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 15:49:38', 2643);
INSERT INTO `sys_oper_log` VALUES (26, '', 0, '', 'POST', 1, 'admin', '', '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, 'the column number must be greater than or equal to 1 and less than or equal to 16384', '2023-06-13 15:50:37', 8);
INSERT INTO `sys_oper_log` VALUES (27, '', 0, '', 'POST', 1, 'admin', '', '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 16:06:57', 24);
INSERT INTO `sys_oper_log` VALUES (28, '', 0, '', 'POST', 1, 'admin', '', '/system/dict/data/export', '127.0.0.1', '内网IP', '{\"dictType\":\"sys_user_sex\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 16:07:02', 18);
INSERT INTO `sys_oper_log` VALUES (29, '', 0, '', 'POST', 1, 'admin', '', '/system/config/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 16:10:33', 20);
INSERT INTO `sys_oper_log` VALUES (30, '', 0, '', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', 'null', 0, '', '2023-06-13 16:12:37', 36);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-01-27 09:36:41', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_push_channel
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_channel`;
CREATE TABLE `sys_push_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道名称',
  `type_id` bigint NOT NULL COMMENT '渠道类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0开启 1禁用）',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道配置',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='消息渠道表';

-- ----------------------------
-- Records of sys_push_channel
-- ----------------------------
BEGIN;
INSERT INTO `sys_push_channel` VALUES (1, 'QQ邮箱', 3, '', '0', '{\"host\":\"smtp.qq.com\",\"port\":465,\"userName\":\"371212848@qq.com\",\"password\":\"tpyjmouawjxbjab\"}', 'admin', '2023-03-27 11:41:01', 'admin', '2023-06-13 11:23:57', NULL);
INSERT INTO `sys_push_channel` VALUES (2, '阿里云', 7, '', '0', '{\n		\"accessKey\":\"accessKey\",\n		\"region\":\"1\",\n		\"secretKey\":\"secretKey\",\n		\"signName\":\"signName\"\n	}', 'admin', '2023-03-27 12:40:20', 'admin', '2023-06-13 11:24:14', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_push_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_log`;
CREATE TABLE `sys_push_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `channel_id` bigint NOT NULL COMMENT '渠道ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `info` json NOT NULL COMMENT '渠道信息',
  `msg_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息类型',
  `shield_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '屏蔽类型',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='消息日志表';

-- ----------------------------
-- Records of sys_push_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_push_log` VALUES (4, '数据库', 0, '我是数据库', '{\"path\": \"/Users/kennyli/Documents/dev\", \"@class\": \"cn.iocoder.yudao.framework.file.core.client.db.DBFileClientConfig\", \"domain\": \"http://127.0.0.1:48080\"}', '', '', '', NULL, 'admin', '2023-03-23 20:55:07', NULL);
INSERT INTO `sys_push_log` VALUES (5, '本地磁盘', 0, '测试下本地存储', '{\"path\": \"/Users/kennyli/Documents/dev/geasy/public\", \"isDev\": \"1\", \"domain\": \"http://localhost:8000/public\"}', '', '', '', NULL, 'admin', '2023-03-24 20:10:18', NULL);
INSERT INTO `sys_push_log` VALUES (11, 'S3 - 七牛云', 0, NULL, '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', '', '', NULL, '', '2023-03-23 16:13:56', NULL);
INSERT INTO `sys_push_log` VALUES (15, 'S3 - 七牛云', 0, '', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', '', '', NULL, '', NULL, NULL);
INSERT INTO `sys_push_log` VALUES (16, 'S3 - 七牛云', 0, '', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', '', '', NULL, '', NULL, NULL);
INSERT INTO `sys_push_log` VALUES (17, 'S3 - 七牛云', 0, '', '{\"@class\": \"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\", \"bucket\": \"ruoyi-vue-pro\", \"domain\": \"http://test.yudao.iocoder.cn\", \"endpoint\": \"s3-cn-south-1.qiniucs.com\", \"accessKey\": \"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\", \"accessSecret\": \"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}', '', '', '', NULL, '', NULL, '2023-03-23 17:17:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_push_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_template`;
CREATE TABLE `sys_push_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `channel_id` bigint NOT NULL COMMENT '渠道ID',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0开启 1禁用）',
  `cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行时间(0实时，定时cron表达式)',
  `msg_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='消息模板表';

-- ----------------------------
-- Records of sys_push_template
-- ----------------------------
BEGIN;
INSERT INTO `sys_push_template` VALUES (1, '验证码', 'sms_verity_regist', 2, '{\n\"templateId\":\"SMS_204785114\",\n\"templateContent\":\"验证码{code}，您正在注册成为新用户，感谢您的支持！\"\n}', '0', '0', '2', '', 'admin', '2023-03-30 15:37:41', 'admin', '2023-04-01 08:16:50', NULL);
INSERT INTO `sys_push_template` VALUES (2, '注册成功通知', 'sms_notice_regist', 1, '{\n\"title\":\"注册成功通知\",\n\"content\":\"恭喜你注册成功{userName}\"\n}', '0', '0', '0', '', 'admin', '2023-03-30 15:52:38', 'admin', '2023-03-31 23:25:19', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_push_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_type`;
CREATE TABLE `sys_push_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上级编号',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型编码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0开启 1禁用）',
  `sort` int DEFAULT NULL COMMENT '排序',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '配置范例',
  `template_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '模板参数',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='推送渠道类型表';

-- ----------------------------
-- Records of sys_push_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_push_type` VALUES (1, 0, '0', 'PUSH通知栏', 'push', '1', 0, '', NULL, 'admin', '2023-03-27 10:06:53', 'admin', '2023-03-29 15:46:34', '2023-06-12 21:43:27');
INSERT INTO `sys_push_type` VALUES (2, 0, '0', '短信', 'sms', '0', 0, '', NULL, 'admin', '2023-03-27 10:07:03', '', '2023-03-27 10:07:03', NULL);
INSERT INTO `sys_push_type` VALUES (3, 0, '0', '邮箱', 'mail', '0', 0, '{\n\"host\":\"smtp.qq.com\",\n\"port\":465,\n\"starttlsEnable\":\"true\",\n\"auth\":true,\n\"sslEnable\":true\n}', '{\n\"title\":\"\",\n\"content\":\"\"\n}', 'admin', '2023-03-27 10:07:14', 'admin', '2023-03-30 15:18:56', NULL);
INSERT INTO `sys_push_type` VALUES (4, 0, '0', '微信', 'wx', '1', 0, '', NULL, 'admin', '2023-03-27 10:07:49', 'admin', '2023-03-29 15:46:45', '2023-06-12 21:43:51');
INSERT INTO `sys_push_type` VALUES (5, 0, '0', '钉钉', 'dingtalk', '1', 0, '', NULL, 'admin', '2023-03-27 10:08:24', 'admin', '2023-03-29 15:46:51', '2023-06-12 21:42:55');
INSERT INTO `sys_push_type` VALUES (6, 1, '0,1', '个推', 'getui', '0', 0, '{\n\"appId\":\"23423423\",\n\"appKey\":\"234234234\",\n\"masterSecret\":\"2342342342342\"\n}', NULL, 'admin', '2023-03-27 10:10:14', '', '2023-03-27 10:10:14', '2023-06-12 21:43:23');
INSERT INTO `sys_push_type` VALUES (7, 2, '0,2', '阿里云', 'aliyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:11:01', 'admin', '2023-03-30 16:38:36', NULL);
INSERT INTO `sys_push_type` VALUES (8, 2, '0,2', '百度云', 'bdyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:11:19', 'admin', '2023-03-30 16:38:42', NULL);
INSERT INTO `sys_push_type` VALUES (9, 2, '0,2', '华为云', 'hwyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:11:37', 'admin', '2023-03-29 21:30:39', NULL);
INSERT INTO `sys_push_type` VALUES (10, 2, '0,2', '七牛云', 'qiniuyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:11:53', 'admin', '2023-03-29 21:30:50', NULL);
INSERT INTO `sys_push_type` VALUES (11, 2, '0,2', '腾讯云', 'txyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '', 'admin', '2023-03-27 10:12:12', 'admin', '2023-03-29 21:30:55', NULL);
INSERT INTO `sys_push_type` VALUES (12, 2, '0,2', '又拍云', 'upyun', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:12:51', 'admin', '2023-03-29 21:31:01', NULL);
INSERT INTO `sys_push_type` VALUES (13, 2, '0,2', '云片网', 'yunpian', '0', 0, '{\n\"accessKey\":\"\",\n\"secretKey\":\"\",\n\"signName\":\"\",\n\"region\":\"\"\n}', '{\n\"templateId\":\"\",\n\"templateContent\":\"\"\n}', 'admin', '2023-03-27 10:13:24', 'admin', '2023-03-29 21:31:08', NULL);
INSERT INTO `sys_push_type` VALUES (14, 4, '0,3', '微信服务号(模板消息)', 'wxfwh', '0', 0, '', NULL, 'admin', '2023-03-27 10:35:11', '', '2023-03-27 10:35:11', '2023-06-12 21:43:48');
INSERT INTO `sys_push_type` VALUES (15, 4, '0,3', '微信小程序(订阅消息)', 'wxmin', '0', 0, '', NULL, 'admin', '2023-03-27 10:35:37', '', '2023-03-27 10:35:37', '2023-06-12 21:43:45');
INSERT INTO `sys_push_type` VALUES (16, 4, '0,3', '企业微信(应用消息)', 'wxcp', '0', 0, '', NULL, 'admin', '2023-03-27 10:36:07', '', '2023-03-27 10:36:07', '2023-06-12 21:43:42');
INSERT INTO `sys_push_type` VALUES (17, 4, '0,3', '企业微信(机器人)', 'wxcprobot', '0', 0, '', NULL, 'admin', '2023-03-27 10:36:31', '', '2023-03-27 10:36:31', '2023-06-12 21:43:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `api_check_strictly` tinyint(1) DEFAULT '1' COMMENT '接口树选择项是否关联显示',
  `dept_check_strictly` tinyint DEFAULT '1' COMMENT '部门树选择项是否关联显示（0：父子不互相关联显示 1：父子互相关联显示 ）\n',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除标识',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, 1, '0', 'admin', '2021-01-27 09:36:41', '', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '系统管理', 'super', 2, '3', 1, 1, 1, '0', 'admin', '2021-01-27 09:36:41', 'admin', '2023-06-12 21:36:43', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '111', '111', 0, '2', 1, 1, 1, '1', '', '2021-05-04 20:07:11', '若依', '2021-05-04 21:19:30', '2021-05-04 21:22:08', '111');
INSERT INTO `sys_role` VALUES (4, '11', '11', 0, '', 1, 1, 1, '0', '', '2021-05-05 20:21:05', '若依', '2021-05-05 20:21:59', '2021-05-05 20:22:06', '11');
INSERT INTO `sys_role` VALUES (5, 'test', 'test', 3, '', 1, 1, 1, '0', 'admin', NULL, '', '2022-11-05 20:18:37', '2022-11-05 20:37:47', 'test');
INSERT INTO `sys_role` VALUES (6, 'test1', 'test1', 3, '', 1, 1, 1, '1', 'admin', NULL, 'admin', '2022-11-05 22:54:03', '2022-11-06 22:07:11', '');
INSERT INTO `sys_role` VALUES (7, 'test2', 'test2', 6, '1', 1, 1, 1, '0', 'admin', '2022-11-05 22:56:45', 'admin', '2022-11-05 23:02:57', '2022-11-06 22:07:11', '');
INSERT INTO `sys_role` VALUES (8, '公司领导', 'company_leader', 4, '1', 1, 0, 1, '0', 'admin', '2022-12-07 22:55:04', 'admin', '2023-05-17 13:00:17', '2023-06-12 21:35:36', '');
INSERT INTO `sys_role` VALUES (9, '公司成员', 'company_member', 5, '1', 1, 1, 1, '0', 'admin', '2022-12-07 22:55:47', 'admin', '2023-05-17 13:11:51', '2023-06-12 21:34:38', '');
INSERT INTO `sys_role` VALUES (10, '系统管理', 'system', 3, '1', 1, 1, 1, '0', 'admin', '2022-12-08 20:50:03', 'admin', '2022-12-09 13:06:10', '2023-06-12 21:36:07', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_api`;
CREATE TABLE `sys_role_api` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `api_id` bigint NOT NULL COMMENT '接口ID',
  PRIMARY KEY (`role_id`,`api_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_api` VALUES (2, 1);
INSERT INTO `sys_role_api` VALUES (2, 2);
INSERT INTO `sys_role_api` VALUES (2, 3);
INSERT INTO `sys_role_api` VALUES (2, 4);
INSERT INTO `sys_role_api` VALUES (2, 5);
INSERT INTO `sys_role_api` VALUES (2, 6);
INSERT INTO `sys_role_api` VALUES (2, 7);
INSERT INTO `sys_role_api` VALUES (2, 8);
INSERT INTO `sys_role_api` VALUES (2, 9);
INSERT INTO `sys_role_api` VALUES (2, 10);
INSERT INTO `sys_role_api` VALUES (2, 11);
INSERT INTO `sys_role_api` VALUES (2, 12);
INSERT INTO `sys_role_api` VALUES (2, 13);
INSERT INTO `sys_role_api` VALUES (2, 14);
INSERT INTO `sys_role_api` VALUES (2, 15);
INSERT INTO `sys_role_api` VALUES (2, 16);
INSERT INTO `sys_role_api` VALUES (2, 17);
INSERT INTO `sys_role_api` VALUES (2, 18);
INSERT INTO `sys_role_api` VALUES (2, 19);
INSERT INTO `sys_role_api` VALUES (2, 20);
INSERT INTO `sys_role_api` VALUES (2, 21);
INSERT INTO `sys_role_api` VALUES (2, 22);
INSERT INTO `sys_role_api` VALUES (2, 23);
INSERT INTO `sys_role_api` VALUES (2, 24);
INSERT INTO `sys_role_api` VALUES (2, 25);
INSERT INTO `sys_role_api` VALUES (2, 26);
INSERT INTO `sys_role_api` VALUES (2, 27);
INSERT INTO `sys_role_api` VALUES (2, 28);
INSERT INTO `sys_role_api` VALUES (2, 29);
INSERT INTO `sys_role_api` VALUES (2, 30);
INSERT INTO `sys_role_api` VALUES (2, 31);
INSERT INTO `sys_role_api` VALUES (2, 32);
INSERT INTO `sys_role_api` VALUES (2, 33);
INSERT INTO `sys_role_api` VALUES (2, 34);
INSERT INTO `sys_role_api` VALUES (2, 35);
INSERT INTO `sys_role_api` VALUES (2, 36);
INSERT INTO `sys_role_api` VALUES (2, 37);
INSERT INTO `sys_role_api` VALUES (2, 38);
INSERT INTO `sys_role_api` VALUES (2, 39);
INSERT INTO `sys_role_api` VALUES (2, 40);
INSERT INTO `sys_role_api` VALUES (2, 41);
INSERT INTO `sys_role_api` VALUES (2, 42);
INSERT INTO `sys_role_api` VALUES (2, 43);
INSERT INTO `sys_role_api` VALUES (2, 44);
INSERT INTO `sys_role_api` VALUES (2, 45);
INSERT INTO `sys_role_api` VALUES (2, 46);
INSERT INTO `sys_role_api` VALUES (2, 47);
INSERT INTO `sys_role_api` VALUES (2, 48);
INSERT INTO `sys_role_api` VALUES (2, 49);
INSERT INTO `sys_role_api` VALUES (2, 50);
INSERT INTO `sys_role_api` VALUES (2, 51);
INSERT INTO `sys_role_api` VALUES (2, 52);
INSERT INTO `sys_role_api` VALUES (2, 53);
INSERT INTO `sys_role_api` VALUES (2, 54);
INSERT INTO `sys_role_api` VALUES (2, 55);
INSERT INTO `sys_role_api` VALUES (2, 56);
INSERT INTO `sys_role_api` VALUES (2, 57);
INSERT INTO `sys_role_api` VALUES (2, 58);
INSERT INTO `sys_role_api` VALUES (2, 59);
INSERT INTO `sys_role_api` VALUES (2, 60);
INSERT INTO `sys_role_api` VALUES (2, 61);
INSERT INTO `sys_role_api` VALUES (2, 62);
INSERT INTO `sys_role_api` VALUES (2, 63);
INSERT INTO `sys_role_api` VALUES (2, 64);
INSERT INTO `sys_role_api` VALUES (2, 65);
INSERT INTO `sys_role_api` VALUES (2, 66);
INSERT INTO `sys_role_api` VALUES (2, 67);
INSERT INTO `sys_role_api` VALUES (2, 68);
INSERT INTO `sys_role_api` VALUES (2, 69);
INSERT INTO `sys_role_api` VALUES (2, 70);
INSERT INTO `sys_role_api` VALUES (2, 71);
INSERT INTO `sys_role_api` VALUES (2, 72);
INSERT INTO `sys_role_api` VALUES (2, 73);
INSERT INTO `sys_role_api` VALUES (2, 74);
INSERT INTO `sys_role_api` VALUES (2, 75);
INSERT INTO `sys_role_api` VALUES (2, 76);
INSERT INTO `sys_role_api` VALUES (2, 77);
INSERT INTO `sys_role_api` VALUES (2, 78);
INSERT INTO `sys_role_api` VALUES (2, 79);
INSERT INTO `sys_role_api` VALUES (2, 80);
INSERT INTO `sys_role_api` VALUES (2, 81);
INSERT INTO `sys_role_api` VALUES (2, 82);
INSERT INTO `sys_role_api` VALUES (2, 83);
INSERT INTO `sys_role_api` VALUES (2, 84);
INSERT INTO `sys_role_api` VALUES (2, 85);
INSERT INTO `sys_role_api` VALUES (2, 86);
INSERT INTO `sys_role_api` VALUES (2, 87);
INSERT INTO `sys_role_api` VALUES (2, 88);
INSERT INTO `sys_role_api` VALUES (2, 89);
INSERT INTO `sys_role_api` VALUES (2, 90);
INSERT INTO `sys_role_api` VALUES (2, 91);
INSERT INTO `sys_role_api` VALUES (2, 92);
INSERT INTO `sys_role_api` VALUES (2, 93);
INSERT INTO `sys_role_api` VALUES (2, 94);
INSERT INTO `sys_role_api` VALUES (2, 95);
INSERT INTO `sys_role_api` VALUES (2, 96);
INSERT INTO `sys_role_api` VALUES (2, 97);
INSERT INTO `sys_role_api` VALUES (2, 98);
INSERT INTO `sys_role_api` VALUES (2, 99);
INSERT INTO `sys_role_api` VALUES (2, 100);
INSERT INTO `sys_role_api` VALUES (2, 101);
INSERT INTO `sys_role_api` VALUES (2, 102);
INSERT INTO `sys_role_api` VALUES (2, 103);
INSERT INTO `sys_role_api` VALUES (2, 104);
INSERT INTO `sys_role_api` VALUES (2, 105);
INSERT INTO `sys_role_api` VALUES (2, 106);
INSERT INTO `sys_role_api` VALUES (2, 107);
INSERT INTO `sys_role_api` VALUES (2, 108);
INSERT INTO `sys_role_api` VALUES (2, 109);
INSERT INTO `sys_role_api` VALUES (2, 110);
INSERT INTO `sys_role_api` VALUES (2, 111);
INSERT INTO `sys_role_api` VALUES (2, 112);
INSERT INTO `sys_role_api` VALUES (2, 113);
INSERT INTO `sys_role_api` VALUES (2, 114);
INSERT INTO `sys_role_api` VALUES (2, 115);
INSERT INTO `sys_role_api` VALUES (2, 116);
INSERT INTO `sys_role_api` VALUES (2, 117);
INSERT INTO `sys_role_api` VALUES (2, 118);
INSERT INTO `sys_role_api` VALUES (2, 119);
INSERT INTO `sys_role_api` VALUES (2, 120);
INSERT INTO `sys_role_api` VALUES (2, 121);
INSERT INTO `sys_role_api` VALUES (2, 122);
INSERT INTO `sys_role_api` VALUES (2, 123);
INSERT INTO `sys_role_api` VALUES (2, 124);
INSERT INTO `sys_role_api` VALUES (2, 125);
INSERT INTO `sys_role_api` VALUES (2, 126);
INSERT INTO `sys_role_api` VALUES (2, 127);
INSERT INTO `sys_role_api` VALUES (2, 128);
INSERT INTO `sys_role_api` VALUES (2, 129);
INSERT INTO `sys_role_api` VALUES (2, 130);
INSERT INTO `sys_role_api` VALUES (2, 131);
INSERT INTO `sys_role_api` VALUES (2, 132);
INSERT INTO `sys_role_api` VALUES (2, 133);
INSERT INTO `sys_role_api` VALUES (2, 134);
INSERT INTO `sys_role_api` VALUES (2, 135);
INSERT INTO `sys_role_api` VALUES (2, 136);
INSERT INTO `sys_role_api` VALUES (2, 137);
INSERT INTO `sys_role_api` VALUES (2, 138);
INSERT INTO `sys_role_api` VALUES (2, 139);
INSERT INTO `sys_role_api` VALUES (2, 140);
INSERT INTO `sys_role_api` VALUES (2, 141);
INSERT INTO `sys_role_api` VALUES (2, 142);
INSERT INTO `sys_role_api` VALUES (2, 143);
INSERT INTO `sys_role_api` VALUES (2, 144);
INSERT INTO `sys_role_api` VALUES (2, 145);
INSERT INTO `sys_role_api` VALUES (2, 146);
INSERT INTO `sys_role_api` VALUES (2, 147);
INSERT INTO `sys_role_api` VALUES (2, 148);
INSERT INTO `sys_role_api` VALUES (2, 149);
INSERT INTO `sys_role_api` VALUES (2, 150);
INSERT INTO `sys_role_api` VALUES (2, 151);
INSERT INTO `sys_role_api` VALUES (2, 152);
INSERT INTO `sys_role_api` VALUES (2, 153);
INSERT INTO `sys_role_api` VALUES (2, 154);
INSERT INTO `sys_role_api` VALUES (2, 155);
INSERT INTO `sys_role_api` VALUES (2, 156);
INSERT INTO `sys_role_api` VALUES (2, 157);
INSERT INTO `sys_role_api` VALUES (2, 158);
INSERT INTO `sys_role_api` VALUES (2, 159);
INSERT INTO `sys_role_api` VALUES (2, 160);
INSERT INTO `sys_role_api` VALUES (2, 161);
INSERT INTO `sys_role_api` VALUES (2, 162);
INSERT INTO `sys_role_api` VALUES (2, 163);
INSERT INTO `sys_role_api` VALUES (2, 164);
INSERT INTO `sys_role_api` VALUES (2, 165);
INSERT INTO `sys_role_api` VALUES (2, 166);
INSERT INTO `sys_role_api` VALUES (2, 167);
INSERT INTO `sys_role_api` VALUES (2, 168);
INSERT INTO `sys_role_api` VALUES (2, 169);
INSERT INTO `sys_role_api` VALUES (2, 170);
INSERT INTO `sys_role_api` VALUES (2, 171);
INSERT INTO `sys_role_api` VALUES (2, 172);
INSERT INTO `sys_role_api` VALUES (2, 173);
INSERT INTO `sys_role_api` VALUES (2, 174);
INSERT INTO `sys_role_api` VALUES (2, 175);
INSERT INTO `sys_role_api` VALUES (2, 176);
INSERT INTO `sys_role_api` VALUES (2, 177);
INSERT INTO `sys_role_api` VALUES (2, 178);
INSERT INTO `sys_role_api` VALUES (2, 179);
INSERT INTO `sys_role_api` VALUES (2, 180);
INSERT INTO `sys_role_api` VALUES (2, 181);
INSERT INTO `sys_role_api` VALUES (2, 182);
INSERT INTO `sys_role_api` VALUES (2, 183);
INSERT INTO `sys_role_api` VALUES (2, 184);
INSERT INTO `sys_role_api` VALUES (2, 185);
INSERT INTO `sys_role_api` VALUES (2, 186);
INSERT INTO `sys_role_api` VALUES (2, 187);
INSERT INTO `sys_role_api` VALUES (2, 188);
INSERT INTO `sys_role_api` VALUES (2, 189);
INSERT INTO `sys_role_api` VALUES (2, 190);
INSERT INTO `sys_role_api` VALUES (2, 191);
INSERT INTO `sys_role_api` VALUES (2, 192);
INSERT INTO `sys_role_api` VALUES (2, 193);
INSERT INTO `sys_role_api` VALUES (2, 194);
INSERT INTO `sys_role_api` VALUES (2, 195);
INSERT INTO `sys_role_api` VALUES (2, 196);
INSERT INTO `sys_role_api` VALUES (2, 197);
INSERT INTO `sys_role_api` VALUES (2, 198);
INSERT INTO `sys_role_api` VALUES (2, 199);
INSERT INTO `sys_role_api` VALUES (2, 200);
INSERT INTO `sys_role_api` VALUES (2, 201);
INSERT INTO `sys_role_api` VALUES (2, 202);
INSERT INTO `sys_role_api` VALUES (2, 203);
INSERT INTO `sys_role_api` VALUES (2, 204);
INSERT INTO `sys_role_api` VALUES (2, 205);
INSERT INTO `sys_role_api` VALUES (2, 206);
INSERT INTO `sys_role_api` VALUES (2, 207);
INSERT INTO `sys_role_api` VALUES (2, 208);
INSERT INTO `sys_role_api` VALUES (2, 209);
INSERT INTO `sys_role_api` VALUES (2, 210);
INSERT INTO `sys_role_api` VALUES (2, 211);
INSERT INTO `sys_role_api` VALUES (2, 212);
INSERT INTO `sys_role_api` VALUES (2, 213);
INSERT INTO `sys_role_api` VALUES (2, 214);
INSERT INTO `sys_role_api` VALUES (2, 215);
INSERT INTO `sys_role_api` VALUES (2, 216);
INSERT INTO `sys_role_api` VALUES (2, 217);
INSERT INTO `sys_role_api` VALUES (2, 218);
INSERT INTO `sys_role_api` VALUES (2, 219);
INSERT INTO `sys_role_api` VALUES (2, 220);
INSERT INTO `sys_role_api` VALUES (2, 221);
INSERT INTO `sys_role_api` VALUES (2, 222);
INSERT INTO `sys_role_api` VALUES (2, 223);
INSERT INTO `sys_role_api` VALUES (2, 224);
INSERT INTO `sys_role_api` VALUES (2, 225);
INSERT INTO `sys_role_api` VALUES (2, 226);
INSERT INTO `sys_role_api` VALUES (2, 227);
INSERT INTO `sys_role_api` VALUES (2, 228);
INSERT INTO `sys_role_api` VALUES (2, 229);
INSERT INTO `sys_role_api` VALUES (2, 230);
INSERT INTO `sys_role_api` VALUES (2, 231);
INSERT INTO `sys_role_api` VALUES (2, 232);
INSERT INTO `sys_role_api` VALUES (2, 233);
INSERT INTO `sys_role_api` VALUES (2, 234);
INSERT INTO `sys_role_api` VALUES (2, 235);
INSERT INTO `sys_role_api` VALUES (2, 236);
INSERT INTO `sys_role_api` VALUES (2, 237);
INSERT INTO `sys_role_api` VALUES (2, 238);
INSERT INTO `sys_role_api` VALUES (2, 239);
INSERT INTO `sys_role_api` VALUES (2, 240);
INSERT INTO `sys_role_api` VALUES (2, 241);
INSERT INTO `sys_role_api` VALUES (2, 242);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1203);
INSERT INTO `sys_role_menu` VALUES (2, 1206);
INSERT INTO `sys_role_menu` VALUES (2, 1207);
INSERT INTO `sys_role_menu` VALUES (2, 1208);
INSERT INTO `sys_role_menu` VALUES (2, 1209);
INSERT INTO `sys_role_menu` VALUES (2, 1210);
INSERT INTO `sys_role_menu` VALUES (2, 1211);
INSERT INTO `sys_role_menu` VALUES (2, 1212);
INSERT INTO `sys_role_menu` VALUES (2, 1213);
INSERT INTO `sys_role_menu` VALUES (2, 1214);
INSERT INTO `sys_role_menu` VALUES (2, 1215);
INSERT INTO `sys_role_menu` VALUES (2, 1216);
INSERT INTO `sys_role_menu` VALUES (2, 1217);
INSERT INTO `sys_role_menu` VALUES (2, 1218);
INSERT INTO `sys_role_menu` VALUES (2, 1219);
INSERT INTO `sys_role_menu` VALUES (2, 1220);
INSERT INTO `sys_role_menu` VALUES (2, 1221);
INSERT INTO `sys_role_menu` VALUES (2, 1222);
INSERT INTO `sys_role_menu` VALUES (2, 1223);
INSERT INTO `sys_role_menu` VALUES (2, 1224);
INSERT INTO `sys_role_menu` VALUES (2, 1225);
INSERT INTO `sys_role_menu` VALUES (2, 1226);
INSERT INTO `sys_role_menu` VALUES (2, 1227);
INSERT INTO `sys_role_menu` VALUES (2, 1228);
INSERT INTO `sys_role_menu` VALUES (2, 1229);
INSERT INTO `sys_role_menu` VALUES (2, 1230);
INSERT INTO `sys_role_menu` VALUES (2, 1231);
INSERT INTO `sys_role_menu` VALUES (2, 1232);
INSERT INTO `sys_role_menu` VALUES (2, 1233);
INSERT INTO `sys_role_menu` VALUES (2, 1234);
INSERT INTO `sys_role_menu` VALUES (2, 1235);
INSERT INTO `sys_role_menu` VALUES (2, 1236);
INSERT INTO `sys_role_menu` VALUES (2, 1237);
INSERT INTO `sys_role_menu` VALUES (2, 1238);
INSERT INTO `sys_role_menu` VALUES (2, 1239);
INSERT INTO `sys_role_menu` VALUES (2, 1240);
INSERT INTO `sys_role_menu` VALUES (2, 1241);
COMMIT;

-- ----------------------------
-- Table structure for sys_sql_backups
-- ----------------------------
DROP TABLE IF EXISTS `sys_sql_backups`;
CREATE TABLE `sys_sql_backups` (
  `backups_id` bigint NOT NULL AUTO_INCREMENT COMMENT '备份ID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '文件名称',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '加密密码',
  `file_size` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '文件大小',
  `created_at` datetime DEFAULT NULL COMMENT '备份时间',
  PRIMARY KEY (`backups_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据库备份表';

-- ----------------------------
-- Records of sys_sql_backups
-- ----------------------------
BEGIN;
INSERT INTO `sys_sql_backups` VALUES (20, 'gadmin_2023061311135199407.zip', '9bT5cqLvovXtPA6v61jbTOXiRIAZ1dSmgF', 00000000000001410307, '2023-06-13 11:13:52');
INSERT INTO `sys_sql_backups` VALUES (21, 'gadmin_2023061311145101840.zip', 'ul5vRdgEiuFUyP2UKiaeIPEGBhLof6WEPN', 00000000000001410388, '2023-06-13 11:14:52');
INSERT INTO `sys_sql_backups` VALUES (22, 'gadmin_2023061311161417096.zip', 'j087HkgLvObfiDgjvPzF3G1sjV13Ti3VbX', 00000000000001410441, '2023-06-13 11:16:15');
INSERT INTO `sys_sql_backups` VALUES (23, 'gadmin_2023061311165912046.zip', 'SIZSEeaDciNRQcbe5KIIKp861cnPgT2gVn', 00000000000001410497, '2023-06-13 11:17:00');
INSERT INTO `sys_sql_backups` VALUES (24, 'gadmin_2023061311185669237.zip', 'dc6SbxgE6HGeE5UuKjpwTAKMuoyMXAYKaC', 00000000000001410551, '2023-06-13 11:18:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '青优', '00', 'ry@163.com', '15888888888', '1', '', '$2a$14$QYWusPMk4loHpczXHuj/Z.9QpT0bfckyEuEoe0Zgos7iLb/UPNFym', '0', '127.0.0.1', '2023-06-13 16:12:30', 'admin', '2021-01-27 09:36:41', 'admin', '2023-06-13 16:12:30', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 112, 'gadmin', '青优', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$14$xL9zySMDmSDikXc4hPBS2uzMUGJ13c2S9YSfnFAOyvZNFkOE4N1Mq', '0', '127.0.0.1', '2022-12-08 08:36:33', 'admin', '2021-01-27 09:36:41', 'admin', '2023-06-12 21:35:56', NULL, '测试员1');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` bigint NOT NULL,
  `token_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `ipaddr` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录ip',
  `login_location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录地方',
  `browser` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浏览器',
  `os` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户在线状态表';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES (0, '1cp68l3gj50ctbddq5qf9wo1001lpd3l', 'x1iJRLf2Sgad0XBipu2NzSBOL3tY2g+YS0nuqB+7rCQ4lEX9p/eZE4rWubG71kCmd/Yt41TjXotBuGvwUDPmLF2ktu8n/sDBVBMTubsh7wM=', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Intel Mac OS X 10_15_7', '2023-06-13 16:12:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (49, 1);
INSERT INTO `sys_user_post` VALUES (49, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
