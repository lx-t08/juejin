/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : juejin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-16 14:34:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `menu_id` int(11) NOT NULL COMMENT '栏目id',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0-未发布；1-已发布',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `publish_date` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('2', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('3', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('4', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('5', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('6', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('7', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('8', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('9', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('10', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('11', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('12', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '1', '0', '2018-03-14 19:30:16', '2018-03-16 11:22:59', '2018-03-14 19:32:01');
INSERT INTO `t_article` VALUES ('13', '刘德华罕见和老婆女儿同框 出动12人护驾阵仗大', '刘德华自从受伤恢复好身体后，就开始慢慢对老婆和女儿的隐私渐渐放开，我们也几次看到刘天王女儿Hanna的真容。原来在2月份他的老婆朱丽倩带着女儿一起回到马来西亚祭祖，其实朱丽倩每年这个时间段也是回马来西亚祭祖。不过这次刘德华竟然和老婆女儿一起同框现身回大马，这是非常罕见的。一般他都是和老婆女儿分开搭不同班次回马来西亚的。而这次媒体拍到他们一家三口在大马祭祖回到香港机场的画面，当时他们出动了12人护驾。', '2', '5', '1', '2018-03-14 19:30:16', '2018-03-16 12:17:29', '2018-03-14 19:32:01');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级评论的id：0-表示一级评论；其他值为一级评论的id',
  `content` varchar(200) NOT NULL COMMENT '评论内容',
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级栏目的id：0-表示一级栏目；其他值为一级栏目的id',
  `name` varchar(20) NOT NULL COMMENT '栏目名称',
  `description` varchar(100) DEFAULT NULL COMMENT '栏目描述',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '0', '前端', '关于前端的技术', '2018-03-16 11:20:20', '2018-03-16 11:20:20');
INSERT INTO `t_menu` VALUES ('2', '1', 'Node.js', 'Node.js', '2018-03-16 11:20:44', '2018-03-16 11:20:44');
INSERT INTO `t_menu` VALUES ('3', '1', 'Vue.js', 'Vue.js', '2018-03-16 11:21:07', '2018-03-16 11:21:07');
INSERT INTO `t_menu` VALUES ('4', '0', 'Bootstract', 'Bootstract', '2018-03-16 11:21:27', '2018-03-16 11:21:27');
INSERT INTO `t_menu` VALUES ('5', '0', '后端', '关于后端的技术', '2018-03-16 11:22:07', '2018-03-16 11:22:07');
INSERT INTO `t_menu` VALUES ('6', '5', 'Java', 'Java', '2018-03-16 11:22:22', '2018-03-16 11:22:22');
INSERT INTO `t_menu` VALUES ('7', '5', 'Spring', 'Spring', '2018-03-16 11:22:48', '2018-03-16 11:22:48');

-- ----------------------------
-- Table structure for t_sys_function
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_function`;
CREATE TABLE `t_sys_function` (
  `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '权限父ID',
  `FUNCTION_NAME` varchar(100) DEFAULT NULL COMMENT '权限名',
  `FUNCTION_URL` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `FUNCTION_TYPE` tinyint(1) DEFAULT '0' COMMENT '权限类型 1菜单 2功能',
  `PERMISSION` varchar(200) NOT NULL DEFAULT '' COMMENT '权限标识',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of t_sys_function
-- ----------------------------
INSERT INTO `t_sys_function` VALUES ('1', '0', '管理员菜单', '/', '0', 'admin:menu', '2017-04-11 22:46:29', '0');
INSERT INTO `t_sys_function` VALUES ('2', '1', '用户管理', '/user', '0', 'user:users', '2017-04-11 22:46:29', '1');
INSERT INTO `t_sys_function` VALUES ('3', '1', '角色管理', '/role', '0', 'role:roles', '2017-04-11 22:46:29', '2');
INSERT INTO `t_sys_function` VALUES ('4', '1', '权限管理', '/function', '0', 'function:functions', '2017-04-11 22:46:29', '3');
INSERT INTO `t_sys_function` VALUES ('5', '1', '文章管理', '/article', '0', 'article:articles', '2017-04-11 22:46:29', '4');
INSERT INTO `t_sys_function` VALUES ('6', '5', '新增文章', '/article/add', '1', 'article:add', '2017-04-11 22:46:29', '1');
INSERT INTO `t_sys_function` VALUES ('7', '5', '修改文章', '/article/update', '1', 'article:update', '2017-04-11 22:46:29', '2');
INSERT INTO `t_sys_function` VALUES ('8', '5', '删除文章', '/article/delete', '1', 'article:delete', '2017-04-11 22:46:29', '3');
INSERT INTO `t_sys_function` VALUES ('9', '5', '查看文章', '/article/view', '1', 'article:view', '2017-04-11 22:46:29', '3');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名',
  `DESCRIPTION` varchar(100) DEFAULT '' COMMENT '角色描述',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '超级管理员', '超级管理员', '2017-04-11 22:45:12');
INSERT INTO `t_sys_role` VALUES ('2', '主编', '主编', '2018-03-14 17:09:28');
INSERT INTO `t_sys_role` VALUES ('3', '小编', '小编', '2018-03-14 17:09:28');

-- ----------------------------
-- Table structure for t_sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_function`;
CREATE TABLE `t_sys_role_function` (
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '角色ID',
  `FUNCTION_ID` int(11) DEFAULT '0' COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of t_sys_role_function
-- ----------------------------
INSERT INTO `t_sys_role_function` VALUES ('1', '1');
INSERT INTO `t_sys_role_function` VALUES ('1', '2');
INSERT INTO `t_sys_role_function` VALUES ('1', '3');
INSERT INTO `t_sys_role_function` VALUES ('1', '4');
INSERT INTO `t_sys_role_function` VALUES ('1', '6');
INSERT INTO `t_sys_role_function` VALUES ('1', '7');
INSERT INTO `t_sys_role_function` VALUES ('1', '5');
INSERT INTO `t_sys_role_function` VALUES ('1', '8');
INSERT INTO `t_sys_role_function` VALUES ('1', '9');
INSERT INTO `t_sys_role_function` VALUES ('2', '5');
INSERT INTO `t_sys_role_function` VALUES ('2', '6');
INSERT INTO `t_sys_role_function` VALUES ('2', '7');
INSERT INTO `t_sys_role_function` VALUES ('2', '8');
INSERT INTO `t_sys_role_function` VALUES ('2', '9');
INSERT INTO `t_sys_role_function` VALUES ('3', '5');
INSERT INTO `t_sys_role_function` VALUES ('3', '6');
INSERT INTO `t_sys_role_function` VALUES ('3', '7');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `PASSWORD` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `REAL_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实姓名名',
  `STATUS` tinyint(1) DEFAULT '0' COMMENT '状态.0: 正常,1:冻结,2：删除',
  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `TEL` varchar(12) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', '0', '2017-04-11 22:44:24', null, '2017-04-11 22:43:57', null, null);
INSERT INTO `t_sys_user` VALUES ('2', 'editor', 'e10adc3949ba59abbe56e057f20f883e', '编辑', '0', '2017-04-11 22:44:24', '', '2017-04-11 22:43:57', '', '');
INSERT INTO `t_sys_user` VALUES ('3', 'editor2', 'e10adc3949ba59abbe56e057f20f883e', '编辑', '0', '2017-04-11 22:44:24', '', '2017-04-11 22:43:57', '', '');

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES ('1', '1');
INSERT INTO `t_sys_user_role` VALUES ('2', '2');
INSERT INTO `t_sys_user_role` VALUES ('3', '3');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(32) NOT NULL COMMENT '密码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
