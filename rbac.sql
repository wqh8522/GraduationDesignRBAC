/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-05-08 20:37:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `ID` varchar(64) DEFAULT NULL,
  `TITLE` varchar(64) DEFAULT NULL,
  `STARTTIME` varchar(64) DEFAULT NULL,
  `ENDTIME` varchar(64) DEFAULT NULL,
  `ALLDAY` varchar(64) DEFAULT NULL,
  `COLOR` varchar(64) DEFAULT NULL,
  `USERID` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendar
-- ----------------------------
INSERT INTO `calendar` VALUES ('e867a6b44d1e4f5ab5644db4d15efd83', '好哈哈哈哈', '2018-03-21', '', '1', '#f30', '1');
INSERT INTO `calendar` VALUES ('1e141cb0ba38402f93839cbff0ef47d6', '阿大声道', '2018-03-15', '', '1', '#f30', '1');

-- ----------------------------
-- Table structure for monitor
-- ----------------------------
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `CPU` varchar(64) DEFAULT NULL COMMENT 'cpu使用率',
  `JVM` varchar(64) DEFAULT NULL COMMENT 'jvm使用率',
  `RAM` varchar(64) DEFAULT NULL COMMENT '内存使用率',
  `TOEMAIL` varchar(64) DEFAULT NULL COMMENT '警告通知邮件',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of monitor
-- ----------------------------
INSERT INTO `monitor` VALUES ('1', '40', '99', '40', '1061185762@qq.com');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `DEL_FLAG` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `TITLE` text COMMENT '新闻标题',
  `TYPE` varchar(64) DEFAULT NULL COMMENT '类型',
  `FILE_ID` varchar(200) DEFAULT NULL COMMENT '文件id',
  `CONTENT` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻管理';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('c81e994016074912854c00498bc6bef6', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 15:02:17.538000', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 15:02:17.538000', null, '0', '12123', '', null, '123213123');
INSERT INTO `news` VALUES ('cab0f64a811a44b49541d1365e627134', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:36:51.101000', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:36:51.101000', null, '0', '1111111', '', null, '1111111111111111111111111111111');
INSERT INTO `news` VALUES ('SAFASDFAS', '1', '2018-05-05 11:20:15.000000', '1', '2018-05-05 11:20:21.000000', null, '0', 'WEQWEQW', '1', 'QWEQE', 'QWEQW');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `ID` varchar(64) NOT NULL,
  `PARENT_ID` varchar(64) NOT NULL,
  `PARENT_IDS` text NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SORT` decimal(10,0) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `CREATE_BY` varchar(64) NOT NULL,
  `CREATE_DATE` datetime(6) NOT NULL,
  `UPDATE_BY` varchar(64) NOT NULL,
  `UPDATE_DATE` datetime(6) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SYS_AREA_DEL_FLAG` (`DEL_FLAG`),
  KEY `SYS_AREA_PARENT_ID` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2016-02-19 16:55:10.000000', '1', '2016-02-19 16:55:10.000000', null, '0');
INSERT INTO `sys_area` VALUES ('364a832bee8a42afa333e338813330de', 'c11497c3311a4be29253f29bd59ab485', '0,1,c11497c3311a4be29253f29bd59ab485,', '南京', '30', null, '3', '1', '2016-02-19 16:55:10.000000', '1', '2016-02-19 16:55:10.000000', null, '0');
INSERT INTO `sys_area` VALUES ('6789d13450fa4cc6858d19fc21958253', '1', '0,1,', '江西', '30', '330000', '2', '1', '2018-05-05 14:54:39.979000', '1', '2018-05-05 14:54:39.979000', '', '0');
INSERT INTO `sys_area` VALUES ('8806ecc2ef7b4a5490dae918f2d3829a', 'a10bb0b156d2480c97edfd33394a2eb8', '0,1,6789d13450fa4cc6858d19fc21958253,a10bb0b156d2480c97edfd33394a2eb8,', '青山湖区', '30', '3325', '4', '1', '2018-05-05 14:55:23.587000', '1', '2018-05-05 14:55:28.838000', '', '0');
INSERT INTO `sys_area` VALUES ('a10bb0b156d2480c97edfd33394a2eb8', '6789d13450fa4cc6858d19fc21958253', '0,1,6789d13450fa4cc6858d19fc21958253,', '南昌', '30', '330001', '3', '1', '2018-05-05 14:55:02.699000', '1', '2018-05-05 14:55:02.699000', '', '0');
INSERT INTO `sys_area` VALUES ('c11497c3311a4be29253f29bd59ab485', '1', '0,1,', '江苏', '30', null, '2', '1', '2016-02-19 16:55:10.000000', '1', '2016-02-19 16:55:10.000000', null, '0');
INSERT INTO `sys_area` VALUES ('e418dc99691d4e29961d53ca218ece8b', '1', '0,1,', '福建', '30', '0100', '2', '1', '2016-02-19 16:55:10.000000', '1', '2016-02-19 16:55:10.000000', null, '0');
INSERT INTO `sys_area` VALUES ('ee38f91df4444529b00f093be5a07b7a', 'e418dc99691d4e29961d53ca218ece8b', '0,1,e418dc99691d4e29961d53ca218ece8b,', '福州', '30', '0200', '1', '1', '2016-02-19 16:55:10.000000', '1', '2016-02-19 16:55:10.000000', null, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `SMTP` varchar(64) DEFAULT NULL COMMENT '邮箱服务器地址',
  `PORT` varchar(64) DEFAULT NULL COMMENT '邮箱服务器端口',
  `MAILNAME` varchar(64) DEFAULT NULL COMMENT '系统邮箱地址',
  `MAILPASSWORD` varchar(64) DEFAULT NULL COMMENT '系统邮箱密码',
  `SMSNAME` varchar(64) DEFAULT NULL COMMENT '短信用户名',
  `SMSPASSWORD` varchar(64) DEFAULT NULL COMMENT '短信密码',
  `SYSNAME` varchar(255) DEFAULT NULL,
  `LOGINBACK` varchar(255) DEFAULT NULL,
  `SYSLOGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'smtp.qq.com', '25', 'xxxxx@com', 'test', 'xxxx', 'xxx', null, null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `ID` varchar(64) NOT NULL,
  `VALUE` varchar(100) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `TYPE` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SORT` decimal(10,0) NOT NULL,
  `PARENT_ID` varchar(64) DEFAULT NULL,
  `CREATE_BY` varchar(64) NOT NULL,
  `CREATE_DATE` datetime(6) NOT NULL,
  `UPDATE_BY` varchar(64) NOT NULL,
  `UPDATE_DATE` datetime(6) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('09f94c6561ae472a8e45935231db41e5', '2', '多选题', 'sys_survey_type', '问卷试题类型', '1', '0', '1', '2017-07-19 16:38:27.000000', '1', '2017-07-19 20:48:06.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('0a22f3278a624882a822e0820f27efcb', '1', '主表', 'table_type', '表类型', '20', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2016-02-19 17:05:33.000000', '1', '2016-02-19 17:05:33.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('1f1611980a7c4dfa9b0770f89bbb7ee5', '1', '国家', 'sys_area_type', '区域类型', '10', null, '1', '2018-05-05 14:47:58.506000', '1', '2018-05-05 14:47:58.506000', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '学校', 'sys_office_type', '机构类型', '5', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-27 21:19:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('211788d168b7495daf08d790d3db3226', '0', '不发布', 'sys_survey_publish', '是否发布', '2', '0', '1', '2017-07-19 23:58:24.000000', '1', '2017-07-19 23:59:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '党群部门', 'sys_office_type', '机构类型', '4', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-27 21:19:52.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '行政部门', 'sys_office_type', '机构类型', '3', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-27 21:20:06.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '教学部门', 'sys_office_type', '机构类型', '2', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-27 21:20:27.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('3139b025c5a142e2bb1daf8f01fc3118', '5', '科研机构', 'sys_office_type', '机构类型', '1', '0', '1', '2017-07-27 21:18:39.000000', '1', '2017-07-27 21:20:40.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在顶级机构及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-15 11:44:11.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在顶级机构数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-15 11:44:33.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '学生', 'sys_user_type', '用户类型', '10', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-11 11:22:13.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('3d4a8d13cdd744baa273ee4f8e08a682', '1', '单选题', 'sys_survey_type', '问卷试题类型', '2', '0', '1', '2017-07-19 16:38:11.000000', '1', '2017-07-19 20:48:20.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2016-02-19 17:05:34.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '教职工', 'sys_user_type', '用户类型', '20', '0', '1', '2016-02-19 17:05:34.000000', '1', '2017-07-11 11:22:20.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('49bab6d8013041c9869ee94b8ebd6c70', '1', '通知公告', 'sys_msg_type', '消息类型', '10', '0', '1', '2017-07-19 03:24:32.000000', '1', '2017-07-19 03:24:32.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('5b899603552c48519e7ba8eb9da0b41f', '0', '单表', 'table_type', '表类型', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('6b2b4180c89340b3b93603fe9c2f0424', '1', '发布', 'sys_survey_publish', '是否发布', '1', '0', '1', '2017-07-19 23:58:06.000000', '1', '2017-07-19 23:59:41.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('78', 'a;', 'a;', 'gen_query_type', '查询方式', '30', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('79', 'a;', 'a;', 'gen_query_type', '查询方式', '40', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('7f2a50a35e00473c9096a71a8d596896', '2', '调查问卷', 'sys_msg_type', '消息类型', '20', '0', 'c459adae196a47278fe27730231f9736', '2017-07-20 03:38:03.000000', 'c459adae196a47278fe27730231f9736', '2017-07-20 03:38:03.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2016-02-19 17:05:35.000000', '1', '2016-02-19 17:05:35.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('8a761f8943a14d76b633804eb437f199', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', null, '1', '2018-05-05 14:48:15.874000', '1', '2018-05-05 14:48:35.107000', '', '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\\0\\0\\0\\0', '40', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('979c9cd4798d46ef9d756e9d7c43f1cd', '3', '地市', 'sys_area_type', '区域类型', '30', null, '1', '2018-05-05 14:48:25.785000', '1', '2018-05-05 14:48:31.582000', '', '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '1');
INSERT INTO `sys_dict` VALUES ('a7d8948b56414fe08fd8c5cfcd2d0720', '4', '区县', 'sys_area_type', '区域类型', '40', null, '1', '2018-05-05 14:48:53.310000', '1', '2018-05-05 14:48:53.310000', '', '0');
INSERT INTO `sys_dict` VALUES ('bde6043665ef4571b85d0edab667cd15', '3', '树结构表', 'table_type', '表类型', '40', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '0');
INSERT INTO `sys_dict` VALUES ('cc94b0c5df554a46894991210a5fc486', '2', '附表', 'table_type', '表类型', '30', '0', '1', '2016-02-19 17:05:36.000000', '1', '2016-02-19 17:05:36.000000', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` varchar(64) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `CREATE_BY` varchar(64) DEFAULT NULL,
  `CREATE_DATE` datetime(6) DEFAULT NULL,
  `REMOTE_ADDR` varchar(255) DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `REQUEST_URI` varchar(255) DEFAULT NULL,
  `METHOD` varchar(5) DEFAULT NULL,
  `PARAMS` text,
  `EXCEPTION` text,
  PRIMARY KEY (`ID`),
  KEY `SYS_LOG_CREATE_BY` (`CREATE_BY`),
  KEY `SYS_LOG_CREATE_DATE` (`CREATE_DATE`),
  KEY `SYS_LOG_REQUEST_URI` (`REQUEST_URI`),
  KEY `SYS_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('01f6131c24b3436bb508f3421a991160', '1', '系统登录', '1', '2018-03-25 17:27:36.261000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('02632b0387424dd09b94f75fabb410f2', '1', '系统登录', '1', '2018-03-25 16:51:57.741000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('035b5b22af1e42009e086ed24e28e320', '1', '删除用户[3333]', '1', '2018-04-15 11:52:17.879000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0390ba67ec644f3a811bf110780d9a5e', '1', '系统登录', '1', '2018-04-15 16:25:53.477000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('045059a7bd3e4a89a5ecc4c6d1995425', '1', '新增机构[软件学院]', '1', '2018-04-18 11:32:47.819000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('05790bf7a9304d189fc206761f27d8e6', '1', '修改角色[一般用户]', '1', '2018-03-25 17:09:47.567000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('05d0b6414e14470b97362efbbd17f753', '1', '系统登录', '1', '2018-04-17 16:07:23.564000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('06da0f8b435a46df8ffb9da376dd654b', '1', '修改角色[校级管理员]', '1', '2018-04-18 11:08:45.207000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('06e343894ebf4e23b435c59b66016948', '1', '修改菜单[删除]', '1', '2018-05-05 10:43:04.604000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('071c8b23bb814d1db388b165816abb5c', '1', '修改机构[计算机与信息工程学院]', '1', '2018-05-05 14:55:55.896000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('071d11ae0aef49ec9438006fdade5fa9', '1', '删除字典[111-测试]', '1', '2018-04-15 10:31:50.708000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('072a084534a0492cb8c41cef823ae065', '1', '修改角色[学生]', '1', '2018-05-05 14:35:18.214000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('081b74172dc344b5b2a2363bc2e2124b', '1', '删除区域[上海]', '1', '2018-05-05 14:38:02.358000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('082f0a57693a44c1a3c2e6258f980fc2', '1', '系统登录', '1', '2018-04-15 11:04:23.812000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0848da5590d8461aa5b7b86d28f7ca57', '1', '修改区域[青山湖区]', '1', '2018-05-05 14:55:28.835000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('0877a2e6318a48f29bdb16548de1ea28', '1', '系统登录', '1', '2018-04-18 11:45:21.302000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/tag/treeselect', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('08967932109443698560b1099eac3e86', '1', '修改菜单[代码生成]', '1', '2018-03-25 13:37:18.091000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('09336848918f4fe491ca49aa72d85880', '1', '系统登录', '1', '2018-04-12 10:23:42.179000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0968e136156447a88a04a1b374412d8c', '1', '删除字典[通知通告状态-未读]', '1', '2018-03-25 17:51:45.180000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0bfd7f4da3474e10ab2339f83455f1c6', '1', '系统登出', '1', '2018-03-25 11:34:19.966000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0c73bfd4979248b1aa5b5625416bbdf5', '1', '修改用户[111111]', '1', '2018-03-25 16:45:05.657000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('0cc2172449b14f70832ca75f25b011b6', '1', '系统登录', '1', '2018-04-18 17:10:28.326000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0cd983fd2e4b4bf68b2fbbac2a35955c', '1', '系统登录', '1', '2018-05-05 11:09:32.398000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0d4537691f5a4a1fb062d963069505c6', '2', '', '1', '2018-05-05 11:35:15.905000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news/', 'POST', null, 'org.apache.jasper.JasperException: Unable to compile class for JSP');
INSERT INTO `sys_log` VALUES ('0d4f3c49e92544798052a7054e357506', '1', '系统登录', '1', '2018-05-05 15:02:35.501000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0e4c3761b21143ef836b7811699399f2', '1', '修改菜单[测试11]', '1', '2018-04-18 20:10:00.008000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('0e558329da654443b8a6f2ef316e685c', '1', '删除用户[万庆华]', '1', '2018-03-25 15:47:40.463000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('0f8222eee8124f0db659b97ca7c356bc', '1', '新增字典[1111-22222]', '1', '2018-04-15 10:35:42.944000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('10f0c56179034da5a798e6c6ab0d864c', '1', '删除用户[3333]', '1', '2018-04-15 10:31:11.889000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('110f8003309449b3bdaefe6a8136915f', '1', '系统登录', '1', '2018-03-30 11:53:23.415000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('11114f18214448549fe2383fb72ca120', '1', '保存用户[123]角色', '1', '2018-05-05 15:01:53.225000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1195eaff7ebd4069968014ab6f64c31f', '1', '修改机构[计科1402]', '1', '2018-05-05 14:56:11.352000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('11fef6b4368e47119d4214a98bdc0d8c', '1', '新增字典[区域类型-省份、直辖市]', '1', '2018-05-05 14:48:15.874000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('12a4301ce49f48e99846196f372b17c7', '1', '系统登录', '1', '2018-05-05 22:46:57.887000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('149b5a604cc7448da450fdb95a1bbea9', '1', '修改角色[一般用户]', '1', '2018-03-25 17:04:50.234000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1640beef5c3c41f58a4622e40819c5b5', '1', '系统登录', '1', '2018-04-15 10:53:56.106000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('166ba90a3b514a3f86cefdbfc7164497', '1', '删除用户[3332]', '1', '2018-04-15 11:32:46.955000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1851313245be46ce913e1c0969942370', '1', '删除字典[&aelig;&micro;&egrave;&macr;222]', '1', '2018-03-30 11:59:40.119000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('19110f4d362a4cafbe55c08d26df4bfe', '1', '修改菜单[编辑]', '1', '2018-05-05 10:43:09.924000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1962fc440d834a6ab5ffabf7be4aff9d', '1', '系统登录', '1', '2018-04-15 15:50:40.929000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('19b520fad0e9426ca270d8bda71e6452', '1', '清空登录日志', '1', '2018-03-25 11:36:21.637000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log1/empty', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('19e5cac56c7744c8b804efc15ae80454', '1', '修改用户[111111]', '1', '2018-03-25 14:54:50.474000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1a3f6763d4984b0994d9459eacfc362d', '1', '系统登录', '1', '2018-05-05 15:00:33.482000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1add761a369c412abf8c9ac3e8b9b62f', '1', '修改菜单[测试]', '1', '2018-04-18 14:21:37.375000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1bb513781eff4ebaaa8e9e2a95ae26a5', '1', '新增机构[软件学院]', '1', '2018-04-18 11:35:21.674000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1c73b7ecd15048f79822393b9568088f', '1', '系统登录', '1', '2018-03-25 14:59:03.816000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1d5f7168d3f746ba81ef7bd7fb481ace', '1', '修改角色[一般用户]', '1', '2018-03-25 17:14:53.689000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1d81c216b57243dd9496de23a7c21641', '1', '系统登录', '1', '2018-05-06 09:26:16.703000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a;JSESSIONID=ae3d829ba52c4d6e9665aaf54814788e', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1e2dcae2d87746c3b94cac2723ba3fd9', '1', '删除机构[景德镇陶瓷大学]', '1', '2018-04-18 11:24:35.846000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1e57ce2166d74cf38db2abb4fa9a2311', '1', '修改角色[测试]', '1', '2018-04-17 16:18:06.920000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1eeb05d409344a408432fa5a660145c3', '1', '系统登录', '1', '2018-04-18 11:33:28.063000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('1ef4cfc9827c45d0b9d56934fa0d5f82', '1', '保存用户[12311]角色', '1', '2018-03-25 14:50:05.526000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('1f9800f4d86d4947b943e40f61c32f34', '1', '新增机构[计科1401]', '1', '2018-05-05 14:27:00.640000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('202fad3f31e34b7b84d8f0ad2fa8d4c4', '1', '删除用户[3331]', '1', '2018-04-15 11:10:03.607000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2082ce27875945a4b9982abcece2cbb4', '1', '系统登录', '1', '2018-04-15 10:29:36.378000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('20bdd6438a87406e8a98d398cdf3f862', '1', '系统登录', '1', '2018-04-18 11:17:12.934000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('217fe396fb53468caf08dc7e624ed482', '1', '系统登录', '1', '2018-03-25 18:12:55.348000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('22421f103acb4b1eb4530dfc93ab679f', '1', '系统登录', '1', '2018-04-18 19:47:37.733000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('23852246940743c79f6f3079d63c3ca6', '1', '系统登出', '1', '2018-05-05 10:40:39.607000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('23bc5157c0974c1c91241960722f7699', '1', '删除用户[3332]', '1', '2018-04-15 11:35:56.609000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('23dc50ffda2c46ebad281bef22159c65', '1', '系统登录', '1', '2018-04-17 16:35:05.270000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2457af68d31943b6ac2d3fd5c25a47e7', '1', '修改用户[111111]', '1', '2018-03-25 16:22:44.545000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('247775e08ad84d938b2f2043ff8fb6ef', '1', '系统登录', '1', '2018-05-05 14:26:41.151000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('24fad3c9a9f0487aada11e1cd7d76498', '1', '系统登录', '1', '2018-03-25 17:44:13.326000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('27923e072ab249e89cf28e0961ba5110', '1', '删除字典[undefined]', '1', '2018-03-25 18:11:44.577000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('287646bae0644fc390d446b93c9de12c', '1', '删除字典[颜色值-灰色]', '1', '2018-04-15 10:46:56.819000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2957e7bf80814f039858cc6dc66f70ed', '1', '新增字典[2-22]', '1', '2018-03-30 12:00:27.252000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('2a8d955cb85742ac8f550e48fc6af812', '1', '系统登录', '1', '2018-05-05 14:46:00.520000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2bb92840e36447e785b03ad47ea7bc91', '1', '系统登录', '1', '2018-03-25 17:34:04.713000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2c4af8af422348339209574e395dab26', '1', '新增机构[计算机与信息工程学院]', '1', '2018-03-25 16:58:30.122000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('2c4b82b6c105402e9104f55cc1af836a', '1', '修改角色[测试]', '1', '2018-04-17 16:17:43.263000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('2c520020bd0d46088b593d728ec5b8b5', '1', '系统登录', '1', '2018-03-25 17:05:08.700000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2c57159dbd274f2b8286787eeb75a494', '1', '系统登录', '1', '2018-03-25 17:28:48.407000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2ca84fdca0a34195945271beaf41e6ef', '1', '删除用户[3333]', '1', '2018-04-15 11:10:03.651000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('2dd53550082242ae833820a84744c80c', '1', '修改角色[一般用户]', '1', '2018-03-25 17:09:54.494000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('2e1b1da3195b428aa973707dcb09f29b', '1', '修改角色[一般用户]', '1', '2018-03-25 17:14:15.558000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('2ffcf072cf4e48ae8b5f3a13519d5e9f', '1', '删除用户[3331]', '1', '2018-04-15 10:21:01.732000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3093c820a98e46e1aaedad652feabc5c', '1', '系统登录', '1', '2018-05-06 20:31:30.250000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('30b2dc02610e4611a0689457d9d78798', '1', '删除字典[22]', '1', '2018-03-30 12:02:53.473000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('31a29e9a37dc41d7bfbbb3af2314347b', '1', '新增字典[ceshi-null]', '1', '2018-03-25 17:34:22.329000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('334c9cfa84e240b2944176afdbb5acb1', '1', '新增字典[111-测试]', '1', '2018-04-15 10:31:38.742000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('33763bed463149d48fb7b0f022d3e1fe', '1', '修改角色[老师]', '1', '2018-05-05 15:01:36.021000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('3392ce8856054edc90812edbe3ccbf42', '1', '系统登录', '1', '2018-04-18 10:52:44.196000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('346b7bb4ec2c4020a39c7d7ed0700b2f', '1', '修改用户[111111]', '1', '2018-03-25 14:55:48.706000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('34cd1af02b4c4b0289305a9bdd4c5ced', '1', '删除字典[颜色值-绿色]', '1', '2018-04-15 10:48:04.303000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3528b858d2af44108e55b8dd887f2cb0', '1', '修改菜单[用户管理]', '1', '2018-03-25 13:21:37.054000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('355a8068614e4d9382e33458a5032eb9', '1', '新增区域[江西]', '1', '2018-05-05 14:54:39.964000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('355e58f3a0184386a62de0d5864822a1', '1', '删除用户[万庆华]', '1', '2018-03-25 15:45:57.129000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('35abb68620ad4acca14c3bcd4226975e', '1', '修改机构[农学院]', '1', '2018-04-18 14:13:00.034000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('364acd54d254472086ca68e4fd16e616', '1', '删除用户[3331]', '1', '2018-04-15 11:04:45.865000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('365e6f04129a4df9b9242fab674ec6ca', '1', '系统登录', '1', '2018-04-18 11:14:42.973000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/auth', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('36c31367c5484653a788cc951b87e0d4', '1', '修改菜单[查看]', '1', '2018-05-05 10:43:16.014000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('37f78d86d40b4b96a127d63e9f9adb89', '1', '系统登录', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:35:48.288000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('38c8daaf45c042bdacc7d087fdeff6a1', '1', '修改菜单[系统监控]', '1', '2018-04-13 09:22:19.210000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('39d50f28758d432a8e824d338e60a053', '1', '修改字典[日志类型-异常日志]', '1', '2018-03-25 11:31:10.165000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('3a0d4c0a2d454d529a46071b2518b205', '1', '系统登录', '1', '2018-03-30 11:12:58.486000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3b546304ad8345b6a6355739bc616402', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:06:01.485000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('3b7d0381d11840fd8a7afd390d5714bf', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:06:04.431000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.error._500_jsp');
INSERT INTO `sys_log` VALUES ('3b8eb771e1624e158a9303c5003467d0', '1', '删除字典[oa_notify_ty]', '1', '2018-03-25 18:16:23.778000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3cb62211db124c19810294438ea90f63', '1', '系统登录', '1', '2018-04-18 16:45:34.368000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3cec32c631cf4a19b24799add06f6d49', '1', '删除区域[新疆]', '1', '2018-05-05 14:37:58.676000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3d58880db75243cfb657ede837631a9d', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:05:02.244000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('3dbf266585bc489aa30b29c1b6dddb3c', '1', '系统登出', '1', '2018-04-18 11:45:24.995000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3e1eaec2b9934009b84c8be0443fb102', '1', '删除字典[&aelig;&micro;&egrave;&macr;111]', '1', '2018-03-30 11:59:36.066000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3eaba8cbf9bd4c36a592c8cc4ceeb334', '1', '修改用户[万庆华]', '1', '2018-03-25 16:51:21.571000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('3efde32305aa4af0ab0221751885f4a4', '1', '删除角色[顶顶顶]', '1', '2018-04-11 21:41:07.222000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('3f15d68cddaf47ceac6ebd030624b318', '2', '工作管理-新闻报道管理-查看/工作管理-新闻报道管理-增加/编辑', '1', '2018-05-05 12:18:32.395000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news/form', 'GET', null, 'javax.el.PropertyNotFoundException: Property [file] not found on type [com.wqh.modules.sys.entity.News]');
INSERT INTO `sys_log` VALUES ('3f6f43a126bf4b038da99d4424f4b4c6', '1', '删除菜单[兼职导入]', '1', '2018-04-15 11:01:36.086000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4136a738ea9d4366b1bb6311ca6e87b7', '1', '系统登录', '1', '2018-04-15 11:28:13.218000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('41a2dc25dffd4034989cf1434f49d8ee', '1', '删除用户[23224]', '1', '2018-05-05 22:59:00.192000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('42022cbbebd84b618c91ffc8e507ab54', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:06:24.627000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('42c28a85d79b4344b2edae5887d4e487', '1', '修改用户[管理员]', '1', '2018-04-18 11:25:44.103000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('430c9871c6a24c06bde19e32c7629701', '1', '删除用户[3333]', '1', '2018-04-15 12:19:57.805000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('434a556d685e439bb04030ad6b628adc', '1', '系统登录', '1', '2018-05-05 12:25:57.337000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('43d0fbcedaa84ab79eaf0ab4bb85a93e', '1', '系统登录', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 14:59:55.519000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('44ac3f447d9e48e490948df0f8b64127', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:31:56.035000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.modules.sys.news.newsList_jsp');
INSERT INTO `sys_log` VALUES ('46eda08a32e9405eb9024a59a5aaf17e', '1', '修改机构[江西农业大学]', '1', '2018-04-18 11:42:47.656000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4768b10f27cd4b8cb5eceeaeef9629d3', '1', '系统登录', '1', '2018-04-15 20:12:34.814000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('47a9accb1dfd4069b9d351118864a38d', '1', '系统登录', '1', '2018-05-05 14:35:25.858000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4aae4911511a41a5ad03ac642d491089', '1', '修改角色[老师]', '1', '2018-05-05 14:33:47.189000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4b23001e63f14ef0be230ddda5c483bf', '1', '删除用户[3331]', '1', '2018-04-15 11:52:17.836000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4b6c326c564f4cb3b5d064de4bc1f467', '1', '修改用户[万庆华]', '1', '2018-05-05 14:18:31.054000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4ba4ea1163904e0f8576c039f5a1c7c9', '1', '删除字典[undefined]', '1', '2018-03-25 18:11:14.289000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4bd7719d74ae4653aec0e0d2d0e420ab', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:11:30.796000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('4be2dc52c7064864be862838bb2e1995', '1', '系统登出', '1', '2018-04-11 21:46:14.867000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4ca3baa01e794b89a878f9ff1fe61e8d', '1', '新增机构[软件学院]', '1', '2018-04-18 11:38:35.640000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4d39166c572e4b19b6e845ae7e536e6b', '1', '修改菜单[导出]', '1', '2018-05-05 10:43:25.805000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4e4387ab596e4ae18f816175bf9a10ec', '1', '系统登录', '1', '2018-04-17 16:17:25.718000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4e86d27d58b3444ca194ee77d87ca36e', '1', '修改角色[学生]', '1', '2018-05-05 14:20:09.319000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('4edc884399cf403c9ec6ba804dd5dbd7', '1', '系统登录', '1', '2018-04-15 12:17:44.186000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4ef93a2e126e41cb9beb8abe8ff2f53c', '1', '删除用户[万庆华]', '1', '2018-03-25 15:48:22.697000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('4fe2b962b97e400c8ac0a807d39a25da', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:05:11.516000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('4ff78fe60031493d98b3b3b6fe7c6ad6', '1', '系统登出', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:36:55.854000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('508333318f97465a93bd2c74229f3b07', '1', '删除字典[checkbox]', '1', '2018-03-25 18:12:37.815000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('50bd90fcc5e44706946b2801c0355fd5', '1', '系统登录', '1', '2018-04-13 09:21:16.388000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('50fa398e4eaf44ab95a73e6c139bd265', '1', '修改字典[日志类型-异常日志]', '1', '2018-03-25 11:32:24.196000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('51f6c6d27b8746e0b0cbb5076696a76b', '1', '新增机构[计科1402]', '1', '2018-05-05 14:27:09.889000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5354d42a04ec4e86a204be1e62e86454', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:10:45.726000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('53bc38c178e145b3b734fb5de2aff8f8', '1', '新增字典[测试-测试]', '1', '2018-03-30 11:58:43.432000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5463774f24834afdb548c869afc198f9', '1', '系统登录', '1', '2018-04-15 10:19:04.144000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/import', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('549aa35519f14cdbb158b3f47e0d8534', '1', '删除用户[3333]', '1', '2018-04-15 11:46:29.553000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('553c5d6dec9241eb88456bde8684657e', '1', '删除用户[3333]', '1', '2018-04-15 11:35:56.643000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('555ad4b97fd84adaa96724a697c84d8e', '1', '删除字典[oa_notify_status]', '1', '2018-03-25 18:16:00.099000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5580a0d4829f4ef08fb3baf3ed20ca90', '1', '系统登录', '1', '2018-04-18 11:28:58.598000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/usertorole', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5620cdd6293b4042a2aec64fecb5b90c', '1', '删除用户[3333]', '1', '2018-04-15 11:04:45.910000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('56b4eb534b214731bfd049699f7c7559', '1', '系统登出', '1', '2018-05-05 15:01:59.049000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5726043832854cdd93c361279e9f0274', '1', '修改角色[老师]', '1', '2018-05-05 14:20:26.912000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('572f1e3c5b174bc59203aaff66e069c0', '1', '新增字典[区域类型-1]', '1', '2018-04-15 10:32:18.051000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('584434e6fdd945988b5b4e975bdb48ac', '1', '新增用户[user]到角色[班主任]', '1', '2018-05-05 15:04:41.915000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/assignrole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('58f79852ca6a4675a2ab1f927f4b80bc', '1', '删除用户[3331]', '1', '2018-04-15 11:07:46.498000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('59a46a0b43c946e5875b7e222ad163b3', '1', '系统登录', '1', '2018-05-05 10:40:25.750000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5ada801d2c424e279c6343a29f55031a', '1', '修改字典[区域类型-省份、直辖市]', '1', '2018-05-05 14:48:35.114000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5b223dfcd7dd4f49901dab898a4287eb', '1', '系统登录', '1', '2018-05-06 20:24:21.664000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5bb55caa93094aca9ceaf07878309f29', '1', '系统登录', '1', '2018-03-25 17:16:30.414000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5bb7a2281d9e443b8d42b30fbe1035c5', '1', '新增字典[区域类型-区县]', '1', '2018-05-05 14:48:53.297000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5c335ad893a04d539e79f01718e86905', '1', '系统登录', '1', '2018-03-30 14:42:38.086000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5c6fe0d839c347ecac987c2928dedaf8', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:07:24.611000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.error._500_jsp');
INSERT INTO `sys_log` VALUES ('5ce87ca443944795bcc2c5c0478a96d4', '1', '保存用户[user]角色', '1', '2018-04-15 10:08:14.396000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5cf058cf1fdc4f549991ecfb3971001c', '1', '修改用户[111111]', '1', '2018-03-25 16:48:39.526000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5d0b93aaebd34eaaacefbf3e20ce4434', '1', '系统登录', '1', '2018-05-06 20:25:39.071000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5e1625c394f14cf7ab07a5480e96039e', '1', '清空操作日志', '1', '2018-03-25 11:28:16.355000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log3/empty', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5e5e3eb4ac0a493abc5e5741b6aae986', '1', '系统登录', '1', '2018-05-05 14:56:03.692000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('5edf248755434e40b91cfef6e7d8f655', '1', '删除字典[undefined]', '1', '2018-03-25 18:04:18.633000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('5fa0473fc7964c1abe10e8c0ded17130', '1', '修改机构[阿萨阿萨111]', '1', '2018-03-25 16:58:40.542000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('622bc2de2ea643f28ccc841af26b56b8', '1', '系统登录', '1', '2018-03-25 13:50:34.030000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/tag/treeselect', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('65648f403177453aaf70dfa6665f0bba', '1', '修改菜单[字典管理]', '1', '2018-03-25 13:36:51.512000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('65651bae2c9e473fb4c4245aed7fa00d', '1', '系统登录', '1', '2018-04-15 11:08:49.450000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('667a7595260e435ebaa1e261470be904', '1', '系统登出', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 15:02:19.719000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6705d89e588f47c1879253ed771f961f', '1', '新增字典[审核结果-审核通过]', '1', '2018-04-15 10:45:59.981000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('676d044f4d8c4990b3167f891b05f026', '1', '删除用户[3331]', '1', '2018-04-15 11:46:29.523000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('68f87ad2beb748e797535b563e7b45ea', '1', '删除字典[interface_type]', '1', '2018-03-25 18:15:18.933000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('699b29660ad0495d970dd759542ad787', '1', '删除字典[通知通告类型-会议通知]', '1', '2018-03-25 17:51:58.136000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6a868057e2b049039bdc012ea4bdc767', '1', '系统登录', '1', '2018-04-18 14:30:24.012000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6ad425aed4c54a46a9b4465fa116797c', '1', '系统登出', '1', '2018-03-25 17:16:27.292000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6aedf2b6fea34c189619291dc8a01f1a', '1', '系统登录', '1', '2018-05-06 09:38:45.248000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6bb23f3ce6334c8eb1a467f5a51291f4', '1', '清空错误日志', '1', '2018-03-25 11:36:14.076000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log4/empty', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6be509a4b6cc4620985bb70ec286f291', '1', '删除机构[阿萨阿萨111]', '1', '2018-03-25 16:58:43.361000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6c841898e9264af3a1323469f5da0747', '1', '修改用户[12311]', '1', '2018-03-25 16:44:59.782000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('6d3d68274f594f049fccd49433dae0e5', '1', '系统登出', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 15:00:31.032000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6db0a245c08d419292603f417742b609', '1', '新增机构[测试]', '1', '2018-04-18 14:14:46.077000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('6edaca94a09047c7a646af4cf8008729', '1', '系统登出', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 15:02:34.030000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6f057a327db54d2b9208bab1fb9a8999', '1', '系统登出', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:35:24.092000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('6f078ef073eb4561b92116836701da52', '1', '修改用户[111111]', '1', '2018-03-25 13:36:28.686000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('6f0d9874b82547e693a199a29b91926e', '1', '系统登录', '1', '2018-05-05 23:06:41.857000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('70c2028bbd4b4554b5bac605f0612585', '1', '修改菜单[用户管理]', '1', '2018-03-25 13:34:43.431000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('70d08389175c4371856a0bc70f9facba', '1', '系统登录', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:34:47.707000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('742bb6d7fadf431a933ce36a1dfa31ea', '1', '删除字典[null-null]', '1', '2018-03-30 11:59:57.255000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('746e3618ebb94099879d2119ff5b5351', '1', '修改角色[班主任]', '1', '2018-03-25 17:14:28.616000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('75e92e689c3d4a23b9195ed1a42b6a09', '1', '删除字典[sys_notice_type]', '1', '2018-04-18 17:26:13.991000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7679166895fe4f7cbed813eaa3f5c190', '1', '删除用户[王五1]', '1', '2018-04-11 21:39:52.432000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('76e62c52a6244491bfda8b96329a7fa2', '1', '新增机构[软件学院]', '1', '2018-04-18 11:33:37.255000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('7720284143d543e08118f742e51ae195', '1', '新增机构[系统管理员]', '1', '2018-04-18 11:24:51.404000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('7755973d46e94db18e3bc1c3b5454faa', '1', '修改用户[23224]', '1', '2018-03-25 16:47:49.518000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('7756b8f954544724938c71bcbd6ba3c1', '1', '新增字典[2-2]', '1', '2018-03-30 11:59:01.498000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('778613350d2e49169a943f9f1f4cb558', '1', '新增机构[农学院]', '1', '2018-04-18 14:12:27.993000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('77aafe1d926b4b739433f1fef60627f4', '1', '删除用户[3331]', '1', '2018-04-15 11:06:26.627000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('792a0a28e3c24110bdfaa1f17151c17a', '1', '删除菜单[代码生成]', '1', '2018-04-13 09:23:25.277000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('79380cd9dccc4433a5d87d9fa9d2f1e3', '1', '修改机构[计科1402]', '1', '2018-05-05 14:27:15.842000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('7a118a28d5e742c08bd2203a3279dcc7', '1', '删除角色[助理]', '1', '2018-05-05 14:20:12.923000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7b2c978a397d45239c2873ac6d06f2d8', '1', '修改角色[班主任]', '1', '2018-05-05 15:01:14.603000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('7ba0544fa0b24462a6bd41be14db7e09', '1', '删除字典[1111-22222]', '1', '2018-04-15 10:35:48.503000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7c0fe9fdc8c3446ca56dd4bd024da91b', '1', '系统登录', '1', '2018-03-25 11:46:52.439000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/index', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7c85f11812e74da8a85ff9a4457e8128', '1', '系统登出', '1', '2018-05-05 14:35:27.853000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7cdf014bc4fb48a8800772ce0e99181c', '1', '删除用户[3333]', '1', '2018-04-15 11:31:29.057000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('7ee77ad354524ea38d5dec473fcf80ec', '1', '删除字典[区域类型-1]', '1', '2018-04-15 10:32:58.953000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('80936d79266e4987950165d50cf60825', '1', '修改用户[万庆华]', '1', '2018-04-18 11:31:57.845000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('8100c03c36a54e638f246983586fe3c0', '1', '系统登录', '1', '2018-05-05 16:33:08.700000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('812cf96cfd1c4362847a193f6773166f', '1', '修改用户[万庆华]', '1', '2018-05-05 14:27:50.541000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('8208bbe9fb3a4844ac885427d47d9ae7', '1', '系统登录', '1', '2018-04-11 21:46:19.449000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('83badc197a4a462b9eda35f9f9371c65', '1', '系统登出', '1', '2018-05-05 14:36:33.175000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('84fc5a919ac74508aeabf14ca7bf50ee', '1', '修改菜单[用户管理]', '1', '2018-03-25 15:51:15.493000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('8663a0146932440fb0a4279dbee070e2', '1', '新增区域[青山湖]', '1', '2018-05-05 14:55:23.591000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('866b0f70a6f44a65a69bda27576d1d23', '1', '系统登录', '1', '2018-03-25 16:55:07.820000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('86a8912de59d48f2967d592a504365ed', '1', '系统登录', 'fdcd831627c447c28411aa82963d2db6', '2018-05-05 15:02:03.736000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('86deba5c04bc4301b728e4f1cd71d3d8', '1', '新增字典[1111-111]', '1', '2018-04-15 10:35:32.070000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('88c0b31f5ccd4a45a8a0acdfe576ce00', '1', '系统登录', '1', '2018-04-18 20:09:43.648000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('88daba4686764df8a89c1a8cdf4ca080', '1', '删除字典[2-2]', '1', '2018-03-30 12:00:05.861000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('88fdea3c79f14e58827a3a144d2494c5', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:07:25.567000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.error._500_jsp');
INSERT INTO `sys_log` VALUES ('890efec4047d4ea694f5ff7bd6322fc6', '1', '新增字典[区域类型-地市]', '1', '2018-05-05 14:48:25.785000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('892c87bc17104d1497799e052e353ba7', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:33:27.138000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name \'News\' available as request attribute');
INSERT INTO `sys_log` VALUES ('8aa9830a635b4ed3983015880d71595a', '1', '清空错误日志', '1', '2018-03-25 11:28:24.321000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log4/empty', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('8cca9dae5c1642ada3f56a0ac4d53c4a', '1', '系统登录', '1', '2018-05-05 14:36:58.445000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('8f6916e0fee742a1820f8371a868f663', '1', '系统登录', '1', '2018-03-25 13:30:18.581000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('8fd25132ed4042fd9ddb31ce5db611d8', '1', '保存用户[user]角色', '1', '2018-05-05 15:04:55.909000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('8fda7dd4400941d5a322be30eba64a40', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:32:33.448000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.modules.sys.news.newsList_jsp');
INSERT INTO `sys_log` VALUES ('8ffff1cc738640cca1d930b10f18cada', '1', '系统登录', '1', '2018-05-05 11:31:54.203000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('90672d5b59a646839ff1c8aa48bea16f', '1', '修改用户[123]', '1', '2018-05-05 22:59:32.695000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('909ffcadae754042a5a988169161afe6', '1', '删除用户[3333]', '1', '2018-04-15 11:45:27.840000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('912c8addb2f943219fb4807c6398aab8', '1', '删除用户[3332]', '1', '2018-04-15 11:46:29.548000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('913fc6563c194eb88a7f07e6bfa92087', '1', '系统登录', '1', '2018-04-11 21:38:26.434000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('92141d3324c949ec904468d75bd2e982', '1', '清空错误日志', '1', '2018-03-25 11:28:35.004000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log4/empty', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('940c1514d0fc4a6cbc8289d665074591', '1', '修改用户[111111]', '1', '2018-03-25 14:59:20.703000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('94a7be2eb8704b1f8ad2759e9e978af5', '1', '删除字典[undefined]', '1', '2018-03-25 18:11:23.342000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('95a2d79a97cf4dc5b25a55c846c496c7', '1', '修改角色[老师]', '1', '2018-05-05 15:02:58.187000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('95b82bbfb0704443a4d2d4eacc8da748', '1', '删除字典[interface_type]', '1', '2018-03-25 18:14:33.714000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('96065d36bb3c403e9c545a26beeee325', '1', '修改用户[12311]', '1', '2018-03-25 15:27:20.908000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('96d813709dda4533900cc8a8c56bf78c', '1', '修改用户[user]', '1', '2018-03-30 14:46:28.516000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('96e1ca93dbb54dc19b87e1519cc19286', '1', '新增机构[软件学院]', '1', '2018-04-18 11:41:24.735000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('97f96ed2f3304994a8d0ee1547360c5e', '1', '新增机构[软件学院]', '1', '2018-04-18 11:32:29.794000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('980a35d867fb4ecf97e50f35366c2c5a', '1', '系统登录', '1', '2018-03-25 15:52:54.539000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('98f131a23c6849f186975c2be72e6f41', '1', '删除机构[农学院]', '1', '2018-05-05 14:19:33.039000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('98f6436bb03948229fd82f4a9fe88c85', '1', '保存用户[万庆华]角色', '1', '2018-05-05 14:28:40.197000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('992c287871314132aa55b85ed48126a9', '1', '系统登录', '1', '2018-05-05 22:58:34.259000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('9935b882175c497880073692978a71f8', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:07:23.631000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('99cb8fb33ca9401eaf2a6807a06e1f16', '1', '删除用户[12311]', '1', '2018-04-11 21:38:57.833000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('9ab501dfb05e44ebbbe70a1eb7eb83b3', '1', '修改用户[111111]', '1', '2018-03-25 16:42:45.990000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('9b93cf0b004545fcbf643f63c97a888e', '1', '系统登录', '1', '2018-04-15 10:43:24.303000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('9bc416a40b124f6ca8194dc59c5ff602', '1', '删除字典[checkbox]', '1', '2018-03-25 18:12:37.792000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('9ef2b3e6be0141d8b73aef09a5b62216', '1', '系统登录', '1', '2018-04-18 14:06:58.308000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('9f9bab42b85f4fe88417930914c34075', '1', '删除字典[oa_n]', '1', '2018-03-25 18:15:04.986000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a00ab4d2f9ec4dc59b5f0936026d5264', '1', '删除用户[3331]', '1', '2018-04-15 11:32:46.930000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a0bdd284f0ea4a1194e2020be1e8b712', '1', '系统登录', '1', '2018-03-25 14:44:49.443000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a11aee9dd9e94cd38bfd7b618cdf426f', '1', '系统登录', '1', '2018-04-18 19:40:23.555000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a133c6722ed8463ab044088b870643df', '1', '删除用户[111111]', '1', '2018-04-18 11:26:06.036000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a14292c605c14638a1e2413de913e2d2', '1', '系统登录', '1', '2018-04-15 20:30:48.616000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a2621084aa7b4c08bcb03586ed66b946', '1', '修改菜单[测试]', '1', '2018-05-06 09:40:03.228000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('a51846f793bc4a33809d7ccb8c22a419', '1', '删除字典[checkbox]', '1', '2018-03-25 18:12:37.802000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a54686b2def440daaab59c0b5334d341', '1', '新增机构[软件1401]', '1', '2018-05-05 14:27:27.646000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('a5ae6576866a4680b692616f7f415d2a', '1', '删除字典[oa_notify_read]', '1', '2018-03-25 18:15:04.963000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a7e41a73df4945dc8095b82034f7922c', '1', '系统登录', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 14:36:41.560000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a7f9ec7d1ff24eb1875b8dadc462fa75', '1', '新增字典[区域类型-国家]', '1', '2018-05-05 14:47:58.507000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('a800795169d44cd6adf3e17e86445205', '1', '修改菜单[工作管理]', '1', '2018-05-05 10:41:55.191000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('a81b37a72453417096f362284500d092', '1', '系统登录', '1', '2018-04-18 14:20:39.169000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('a9db793fef8949c0a92c72b904f5e0f5', '1', '系统登录', '1', '2018-04-18 14:09:18.472000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('aba4e71b6b24412682ac4c24f07af609', '1', '修改角色[测试]', '1', '2018-04-18 11:19:34.705000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('ac70e8d1196444f3b4bec12fb90c356d', '1', '修改角色[一般用户]', '1', '2018-04-18 11:15:44.348000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('ad2137c700a744b79aa611e314527048', '1', '删除用户[3332]', '1', '2018-04-15 11:07:46.516000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ad4c6ef8362049e3ae6f20f3b8ccf495', '1', '删除字典[sys_notice_column]', '1', '2018-04-18 17:26:13.944000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ad5470e73e5e47109e2e040262c9b9a9', '1', '删除区域[软件大道]', '1', '2018-05-05 14:38:10.185000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ad5a74f3f1364a8e971ae435993d0fae', '1', '删除字典[通知通告类型-放假通知]', '1', '2018-03-25 17:51:58.173000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('af03d04bc88d444c8ef6c52680ae8812', '1', '修改用户[111111]', '1', '2018-03-25 16:42:40.252000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('af821b7429ef48ef83002123608a513b', '1', '修改用户[管理员]', '1', '2018-05-05 14:58:59.690000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('afbd6a5ade714875988e70c3511b200e', '1', '删除用户[3332]', '1', '2018-04-15 12:19:57.787000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('aff5c91000104a698b0f2ab113f40735', '1', '系统登录', '1', '2018-05-05 14:16:57.625000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b018f90a35174cc8bd2f5fa11694772d', '1', '系统登出', '1', '2018-03-25 11:32:36.087000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b094a093183644998d582775e2ba324a', '1', '保存用户[user]角色', '1', '2018-05-05 14:28:45.385000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/saverole', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('b0987125b73c4537976d9fc9d1f5ef9e', '1', '系统登出', '1', '2018-04-11 21:49:01.315000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b0b725adc70847a5a5a6179f4f2473ea', '1', '系统登录', '1', '2018-03-25 14:54:50.499000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b0be714209f943fea5b0369d5a3ae82b', '1', '修改角色[班主任]', '1', '2018-03-25 17:11:55.456000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('b22a4dedcd234a06a1f41e1b93f06bda', '1', '删除错误日志', '1', '2018-03-25 11:28:22.270000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/log4/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b258c8cc7caf4ec1bd51f8ba8d37ae0f', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:07:31.535000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('b289f6f226254feea8202cfc7a156f82', '1', '删除字典[1]', '1', '2018-03-30 12:02:53.384000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b3770fa09d3a4f5e8e88556769cec26f', '2', '工作管理-新闻报道管理-查看/工作管理-新闻报道管理-增加/编辑', '1', '2018-05-05 12:26:05.051000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news/form', 'GET', null, 'javax.el.PropertyNotFoundException: Property [file] not found on type [com.wqh.modules.sys.entity.News]');
INSERT INTO `sys_log` VALUES ('b5b227c8f80e43419d2ff2ef54d4c4c4', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:07:46.927000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('b5f2511bd0c74f33ae00c9c30c8be7f1', '1', '删除字典[通知通告状态-已读]', '1', '2018-03-25 17:51:45.191000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b60712fe6f28487993aa6f86e5894744', '1', '系统登录', '1', '2018-03-30 11:31:49.990000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b6782c25d56542068c632468fc1b2bb8', '1', '系统登录', '1', '2018-05-05 11:20:45.182000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('b9b1e222866d4a5c84d18c9af7f64085', '1', '系统登录', '1', '2018-05-05 23:08:01.357000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('bb40f10351f041f5a1a786bb74da5aa9', '1', '修改用户[12311]', '1', '2018-03-25 16:51:44.739000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('bbc732c76efd46fab0bf549b1a94d6df', '1', '修改用户[万庆华]', '1', '2018-05-05 14:18:39.555000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('bc011020ea9348b880aea54eec2d8375', '1', '删除机构[测试]', '1', '2018-05-05 14:19:23.369000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('bc2e5e69baf74f1dbd5c0a59f2403c7e', '1', '修改用户[111]', '1', '2018-05-05 23:15:55.962000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('bc3d2201fe6040ff847025922f459eb4', '1', '删除用户[3332]', '1', '2018-04-15 11:04:45.887000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('bd5044b160964cfc9a8e8737bd912909', '1', '修改菜单[角色管理]', '1', '2018-05-06 09:38:52.852000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('bd890f5ebd54492993928585f30fc3b0', '1', '删除用户[3331]', '1', '2018-04-15 12:19:57.773000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('be7a792eda884644b0acbedf8b8b29a6', '1', '系统登录', '1', '2018-04-11 21:41:01.648000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('be96df7847824fc29e58a05b9d1b9294', '1', '系统登录', '1', '2018-05-05 11:02:37.674000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('beee5183927248338667ab52cbea3f83', '1', '修改菜单[增加]', '1', '2018-05-05 10:41:06.194000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('bfa1822c55d84ed7a47f41ae602b7ca4', '1', '系统登录', '1', '2018-04-18 20:01:09.223000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c0b3c5558759498095b47a5b5d2676da', '1', '修改用户[user]', '1', '2018-05-05 14:28:00.850000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('c1a99f9218e449a4952ddfc87b56afbf', '1', '删除字典[undefined]', '1', '2018-03-30 11:59:53.546000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c1b196c9d0724bf48d664a5cc0ed4bc7', '2', '工作管理-新闻报道管理-查看/工作管理-新闻报道管理-增加/编辑', '1', '2018-05-05 12:18:34.950000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news/form', 'GET', null, 'javax.el.PropertyNotFoundException: Property [file] not found on type [com.wqh.modules.sys.entity.News]');
INSERT INTO `sys_log` VALUES ('c1b8a5a957d34106ae6ace0067a2f612', '1', '系统登录', '1', '2018-03-25 15:22:29.337000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/index', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c240a44c2cc84a7c9b4e1488b92054c1', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:29:26.676000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.modules.sys.news.newsList_jsp');
INSERT INTO `sys_log` VALUES ('c2450c7fdffd412bb522a085b6eccff9', '1', '系统登录', '1', '2018-04-15 11:44:48.756000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c471f5def07e45e49ee227247d89e623', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:04:16.899000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('c773373ed00d42999390a17eec326d4d', '1', '删除用户[3332]', '1', '2018-04-15 11:52:17.860000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c77bbafc28914b7691eac2c53421bea7', '1', '删除字典[interface_type]', '1', '2018-03-25 18:13:52.050000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c785fce4848b4e9c99bd849e221f468b', '1', '系统登录', '1', '2018-03-25 14:12:32.093000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c84d5d082bf04e0db27818fbe2fa212f', '1', '系统登录', '1', '2018-04-15 10:05:35.884000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c8b1a32ab340424faaa1777cfc21915c', '1', '系统登录', '1', '2018-03-25 14:22:36.926000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/index', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('c97edbec55a14f8bbc5a628602dff286', '1', '删除字典[sys_]', '1', '2018-03-30 11:56:09.168000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ca2b94c9a0c3416eb58f12187415bca0', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:06:03.071000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.error._500_jsp');
INSERT INTO `sys_log` VALUES ('cafe3ee0dedb448980fd8119ffb79a42', '1', '系统登录', '1', '2018-03-25 15:42:46.149000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/import/template', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cb31f6d84a414c9a8557e5ac0ae0b48f', '1', '删除用户[3333]', '1', '2018-04-15 11:06:26.689000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cc6c6b3cdffc4f3cb3c496e5ef03f845', '1', '新增区域[南昌]', '1', '2018-05-05 14:55:02.701000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/area/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('cc73c4b9319d40c79070be91262beb1e', '1', '系统登录', '1', '2018-04-18 16:32:36.468000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cd0d63769e1342a1baddfceac7c175f4', '1', '系统登录', '1', '2018-05-05 10:40:42.062000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cd763ee2391641daa550f6e2e1a29e71', '1', '删除字典[oa_notify_stat]', '1', '2018-03-25 18:15:18.956000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cda21f209b1a466b808e7bc6006ac8be', '1', '修改用户[111111]', '1', '2018-03-25 16:52:30.661000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('ce576f2f8bf3484dbd2c1025ae74c1cd', '1', '系统登录', '1', '2018-04-15 09:53:58.244000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ceb02675b5ee411a86a44c95b900df69', '1', '系统登录', '1', '2018-03-25 13:19:52.760000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cf1b78dd9d674ea6bd172f4414cf5ee3', '1', '系统登录', '1', '2018-05-05 23:07:37.285000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('cf8751a188fd4d1a9eb7a0d444c04f14', '1', '修改字典[区域类型-地市]', '1', '2018-05-05 14:48:31.585000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('cf8acca3ea3a4b528f9bffceaea612f2', '1', '删除用户[3332]', '1', '2018-04-15 11:45:27.824000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d033df2861314b92846276ad18271b5e', '1', '系统登录', '1', '2018-04-18 14:23:08.785000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d086d0bb253843a1bb690eb75939a7e2', '1', '修改用户[111111]', '1', '2018-03-25 13:44:31.003000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('d149d9b5cb09449ea543bf495f4e2d53', '1', '系统登录', '1', '2018-04-15 11:35:14.216000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d1f3dc1fa3d34821b686ce96f9972420', '1', '系统登录', '1', '2018-03-25 15:10:01.662000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/index', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d30c075753cb42049ce4f7463b5c1c5b', '1', '保存日历事件[阿大声道]', '1', '2018-03-25 15:38:14.735000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/myCalendar/add', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('d39a69baaea54323abc16956693a9b1d', '1', '系统登录', '1', '2018-03-25 13:40:25.404000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d496be161b314beabf829aa44493a425', '1', '删除字典[interface_type]', '1', '2018-03-25 18:13:15.016000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d4b064c58f01433eac5c9cc916cd4592', '1', '修改角色[老师]', '1', '2018-05-05 14:20:45.854000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('d4f9819441c84de7b86a059bf66eafd6', '1', '系统登录', '1', '2018-04-15 12:26:33.848000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d525d32c52a1465aabeb3f1f6f875c78', '1', '系统登录', '1', '2018-03-25 16:41:53.312000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d5520945ac1e41bea11d5e72a2b2c2db', '1', '系统登录', '1', '2018-05-05 12:15:38.878000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d5be64b9cb9c4e3197cf5180756a6990', '1', '删除用户[3332]', '1', '2018-04-15 11:31:29.021000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d5f81be905ce43b58efb0becc205c49f', '1', '删除角色[测试]', '1', '2018-05-05 14:19:47.742000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d69e10cab7ce43deb3aa0c3715d19812', '1', '删除用户[3331]', '1', '2018-04-15 11:37:33.832000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d7c1d2a4c12243d6a39770fa9051730a', '1', '删除用户[3331]', '1', '2018-04-15 11:45:27.809000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d8aeeccc6bfb4b609704a2be1a52daf4', '1', '系统登出', '1', '2018-03-25 11:34:35.954000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d8f4381d279a4e8bba7eab228be2e98d', '1', '删除用户[3332]', '1', '2018-04-15 11:06:26.661000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('d957b3d2d63840e18fe6cf11c4c65c34', '1', '系统登录', '1', '2018-04-18 11:03:38.209000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('da27fd294b6a442e91ad1df57009983b', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:06:09.106000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('da7f53a405d84914af7a1034a58aa15b', '1', '修改机构[计科1401]', '1', '2018-05-05 14:56:03.697000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('db127eb1a5464026af65cd768e026a9a', '1', '删除用户[3332]', '1', '2018-04-15 11:10:03.625000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('db6452a563c64f4da5ed64d84031a606', '1', '系统登录', '1', '2018-03-25 15:34:06.352000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/index', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('db939ae929004d338c20186923079881', '1', '系统登录', '1', '2018-04-18 17:26:13.925000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('dc3012a387514c198e3c8b7c850d5d8b', '1', '系统登录', '1', '2018-05-05 13:40:35.438000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('dc9e7b4b2ced4afaa6899fb64dfecc18', '1', '修改用户[111111]', '1', '2018-03-25 16:45:12.236000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('decd6d2e0ee544d893247f1818d6bdff', '1', '系统登录', '1', '2018-04-15 20:19:31.106000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('df3596606bcc405383957e9a1e89eec3', '1', '新增字典[1111-2222]', '1', '2018-04-15 10:37:42.122000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e1a6ae5bd2ec47b68e29a3d1094415c5', '1', '修改用户[123]', '1', '2018-05-05 14:59:37.805000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e1fb93efed634c3da6a1f365cf23c092', '1', '修改角色[校级管理员]', '1', '2018-03-25 17:48:56.938000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e2c45467508248cdac825fbbb247bc0c', '1', '删除字典[null-null]', '1', '2018-04-15 10:39:01.530000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('e35d3bf33d834fcf8d26fb36c532fb05', '1', '系统登出', '1', '2018-04-18 11:42:07.602000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('e370d762072c40ebadc11ae5c6d9f54a', '1', '删除字典[通知通告类型-部门通告]', '1', '2018-03-25 17:51:58.197000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('e423a9f8242f4f1fb9fc4f049a122408', '1', '修改角色[学生]', '1', '2018-05-05 14:33:23.502000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e433cf2bf55c4cab82b650ac9fdc9d32', '1', '修改用户[管理员]', '1', '2018-03-25 14:18:05.246000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e4bd126881c945edacb3abc1cd501a1f', '1', '修改机构[江西农业大学]', '1', '2018-05-05 14:55:48.353000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/office/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e612b11f812b45b1b47a02eb5c6513bc', '1', '删除用户[3332]', '1', '2018-04-15 10:31:11.882000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('e6699d15026845abbb4e9b0ed217c8b4', '1', '修改菜单[角色管理11]', '1', '2018-05-06 09:27:44.796000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e68e7fbc3a7445099b8331253d1fa171', '1', '删除字典[oa_notify_read]', '1', '2018-03-25 18:14:00.817000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('e729c8864fa043e29a444a7dbb700c4f', '1', '新增字典[111-123]', '1', '2018-03-30 12:00:18.210000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e95966ec2b23468db71a51a887eedd18', '1', '修改菜单[系统监控]', '1', '2018-04-11 21:48:48.731000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('e95efd3c54b7471aae49815cc01daf30', '1', '系统登出', '1', '2018-05-05 14:59:47.751000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/logout', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('eb07402f8f0f4a4a9988f44669150966', '1', '删除字典[sys_act_audit]', '1', '2018-04-15 10:46:10.543000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('eb60a14745bd40d0a65cab02122a18b4', '1', '修改角色[一般用户]', '1', '2018-03-25 17:09:42.314000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('eb8efaa8dc554cf2a57546001de2e9f4', '1', '删除用户[3331]', '1', '2018-04-15 11:35:56.574000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ec2122221cc345268bd1a5a77d9e5d68', '1', '系统登录', '1', '2018-03-25 18:02:52.462000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ed0080610f1b452c8c9b8ab65ccb1da7', '1', '删除字典[测试-测试]', '1', '2018-03-30 12:00:02.283000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ed68241382b54a7da84f395ffe47dac7', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:05:04.192000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, 'java.lang.ClassNotFoundException: org.apache.jsp.webpage.error._500_jsp');
INSERT INTO `sys_log` VALUES ('ed86720b158c4e21805c67dfde15bb0d', '2', '工作管理-新闻报道管理', '1', '2018-05-05 11:13:19.956000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/news', 'GET', null, null);
INSERT INTO `sys_log` VALUES ('edad1beaf06c43c485c1ae771ee851d2', '1', '系统登录', '1', '2018-04-15 11:51:50.411000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('edda99e6754c46bd9ec3a52c802a6cd5', '1', '删除字典[undefined]', '1', '2018-03-25 18:11:44.553000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ee85ce0455ca4ba586acea6d89f2f52a', '1', '系统登录', '1', '2018-03-25 16:22:36.060000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('eeaabccbd5ef4dd5b850d59772072184', '1', '系统登录', '1', '2018-04-18 11:45:18.396000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ef1397522c3b4779a501b529bbd9690a', '1', '删除用户[3331]', '1', '2018-04-15 11:31:28.989000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ef1e1a878a0a4be2a1d56b43648681ee', '1', '系统登录', '1', '2018-04-18 20:21:14.409000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f1be9b0ffd3d4cef8f1e7b1a8f303685', '1', '修改角色[班主任]', '1', '2018-05-05 15:00:58.784000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('f30e602340fa44b29cc751de9c9200bd', '1', '系统登录', '1', '2018-04-18 16:59:52.275000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/form', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f39b56223b79444a8f5e2ba733ce347c', '1', '系统登录', 'b09849a908c745dfa6b0b72a873975c4', '2018-05-05 15:02:30.613000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f42ee93d61d1480f8516d1af6acf5ad1', '1', '删除用户[3333]', '1', '2018-04-15 11:32:46.961000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f5598a619c8549a3911647e34e774f91', '1', '删除字典[审核结果-审核通过]', '1', '2018-04-15 10:45:48.195000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f5ce8d76984747d1bedac8d5d91fbb6c', '1', '系统登录', '1', '2018-03-25 16:40:31.025000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f5dfb9a54c5a4c4cba417993b032db9f', '1', '删除字典[null-null]', '1', '2018-03-30 11:59:59.054000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/delete', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f6702416f0254d319ee74fbcb275c720', '1', '删除字典[颜色值-蓝色]', '1', '2018-04-15 10:46:56.807000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f6b2e3d2485645bab8f6494abf2de220', '1', '删除用户[3333]', '1', '2018-04-15 11:07:46.531000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f74a2824c84f45aa8c4e6d61496d6c19', '1', '删除字典[oa_n]', '1', '2018-03-25 18:14:41.783000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f76000892003471d8d9af8ae5e5eb4d1', '1', '修改用户[万庆华]', '1', '2018-05-05 14:34:14.621000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('f80b511cf6814336b59167fb505f1884', '1', '删除用户[3332]', '1', '2018-04-15 11:37:33.851000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f8582da6bfa84018a7aabc17ec1b8d26', '1', '系统登录', '1', '2018-05-05 10:10:39.045000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f92a9e1095cb4d9ab7a3a4e162ed3ba1', '1', '删除字典[oa_notify_read]', '1', '2018-03-25 18:13:15.014000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f97b56a6e50644aa90e3e5e8c93892ae', '1', '系统登录', '1', '2018-03-25 17:15:16.053000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/role/', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f994d1b8f373460e9ffb27e12529ee90', '1', '删除用户[3333]', '1', '2018-04-15 11:37:33.872000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/user/deleteAll', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('f9c549a4956a4e9bad116fdb2a65238c', '1', '系统登录', '1', '2018-04-18 11:42:09.301000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('faee3b2e20ee43d7a4a5ed076173e08d', '1', '修改字典[1111-2222]', '1', '2018-04-15 10:37:48.648000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('fb0481ea407d4aac980985e954628483', '1', '系统登录', '1', '2018-04-18 11:45:27.284000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('fc9812cd875640e49e44c360a0de35b8', '1', '修改菜单[导入]', '1', '2018-05-05 10:43:21.418000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/menu/save', 'POST', null, '');
INSERT INTO `sys_log` VALUES ('fcd5616a66b941d6bfcbace9e33a5148', '1', '系统登录', '1', '2018-03-25 16:07:48.497000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('fe4948c4901a4266bf139cf6a4bdd227', '1', '系统登录', '1', '2018-03-30 12:03:48.223000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/list', 'GET', null, '');
INSERT INTO `sys_log` VALUES ('ff3c4f285d764aa39bf48e610df2b33d', '1', '删除字典[oa_notify_type]', '1', '2018-03-30 11:56:09.112000', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36', '/a/sys/dict/deleteAll', 'GET', null, '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` varchar(64) NOT NULL,
  `PARENT_ID` varchar(64) NOT NULL,
  `PARENT_IDS` text NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SORT` decimal(10,0) NOT NULL,
  `HREF` text,
  `TARGET` varchar(20) DEFAULT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `IS_SHOW` char(1) NOT NULL,
  `PERMISSION` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(64) NOT NULL,
  `CREATE_DATE` datetime(6) NOT NULL,
  `UPDATE_BY` varchar(64) NOT NULL,
  `UPDATE_DATE` datetime(6) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  `SFWB` varchar(10) DEFAULT NULL,
  `WBLJ` text,
  PRIMARY KEY (`ID`),
  KEY `SYS_MENU_DEL_FLAG` (`DEL_FLAG`),
  KEY `SYS_MENU_PARENT_ID` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0220529e83a54f77a6d8447239ef7c8e', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '删除', '60', '', '', '', '0', 'dzjg:news:del', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:43:04.567000', '', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('0680bbffa99c4e2aba6a1b70d8c30260', '1', '0,1,', '工作管理', '1015', '', '', 'fa-battery-2', '1', '', '1', '2018-04-18 14:21:37.350000', '1', '2018-05-05 10:41:55.175000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,3,', '字典管理', '60', '/sys/dict/list', '', 'th-list', '1', 'sys:dict:list', '1', '2016-02-19 18:01:43.000000', '1', '2018-03-25 13:36:51.494000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('14', '3', '0,1,3,', '区域管理', '50', '/sys/area/', null, 'th', '1', 'sys:area:list', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('14efed1d306c4c9f9dc4d88b17d3cb6a', '2e36816eeb7c4d7bb9f7666df8b6e856', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,', '错误日志', '120', '/sys/log4', null, null, '1', 'sys:log4:list', '1', '2017-07-29 01:28:06.000000', '1', '2017-07-29 01:28:06.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,3,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,3,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('17', '3', '0,1,3,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', 'sys:office:index', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('17fccd658e2240d5a538fb2cbc117e99', '67', '0,1,67,', '系统配置', '100', '/sys/systemConfig', '', '', '0', 'sys:systemConfig:index', '1', '2016-03-13 23:53:27.000000', '1', '2018-03-25 10:02:56.336000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,3,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,3,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('20', '3', '0,1,3,', '用户管理', '30', '/sys/user', '', 'icon-adjust', '1', 'sys:user:index', '1', '2016-02-19 18:01:43.000000', '1', '2018-03-25 15:51:15.462000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,3,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,3,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '个人中心', '10', null, null, 'fa-columns', '1', null, '1', '2016-02-19 18:01:43.000000', '1', '2017-07-06 00:59:20.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('277862baa2044c53b4aa381716ff7f04', '20', '0,1,3,20,', '角色设置', '190', null, null, null, '0', 'sys:user:roleset', '1', '2017-07-06 01:02:30.000000', '1', '2017-07-06 01:02:30.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '0,1,27,', '个人信息', '30', '/sys/user/info', null, 'icon-adjust', '1', null, '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('2a0f940fbe304a05a6b4040ddf6df279', '20', '0,1,3,20,', '增加', '70', null, null, null, '0', 'sys:user:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('2e36816eeb7c4d7bb9f7666df8b6e856', '67', '0,1,67,', '系统日志', '130', null, null, null, '1', null, '1', '2017-07-29 01:25:53.000000', '1', '2017-07-29 01:25:53.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('3', '1', '0,1,', '系统设置', '500', null, null, 'fa-cog', '1', null, '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('3c1c639c76f14f6f9903b0143371ea09', '7', '0,1,3,7,', '添加', '70', null, null, null, '0', 'sys:role:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', 'sys:menu:list', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,3,4,', '增加', '30', null, null, null, '0', 'sys:menu:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('5239527958e94d418997b584b85d8b80', '14', '0,1,3,14,', '删除', '100', null, null, null, '0', 'sys:area:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('55d185bc749d40ed993729127d5ec33d', '67', '0,1,67,', '系统监控管理', '70', '/monitor/info', null, null, '1', null, '1', '2016-03-13 23:51:23.000000', '1', '2016-03-13 23:51:23.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('576ca49c74cb47a1984ca57fdaa56ba4', '14efed1d306c4c9f9dc4d88b17d3cb6a', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,14efed1d306c4c9f9dc4d88b17d3cb6a,', '删除', '30', '', '', '', '0', 'sys:log4:del', '1', '2018-03-25 11:04:57.079000', '1', '2018-03-25 11:04:57.079000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('5f1b2f12927f472fa00edbd1925d0eef', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '导入', '150', '', '', '', '0', 'dzjg:news:import', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:43:21.401000', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('6509eed6eb634030a46723a18814035c', '7', '0,1,3,7,', '分配用户', '100', null, null, null, '0', 'sys:role:assign', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('67', '1', '0,1,', '系统监控', '985', '', '', 'fa-desktop', '1', '', '1', '2016-02-19 18:01:43.000000', '1', '2018-04-13 09:22:19.134000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('68f9151151174868ab436e11e03bf548', '4', '0,1,3,4,', '删除', '70', null, null, null, '0', 'sys:menu:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('6d3a6777693f47c98e9b3051cacbcfdb', '10', '0,1,3,10,', '增加', '70', null, null, null, '0', 'sys:dict:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,3,', '角色管理', '50', '/sys/role/', '', 'lock', '1', 'sys:role:list', '1', '2016-02-19 18:01:43.000000', '1', '2018-05-06 09:38:52.827000', '', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('7807730c3d25496b9468fcfd0cf6fe7f', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '导出', '180', '', '', '', '0', 'dzjg:news:export', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:43:25.791000', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('79f0ffa47dbe43ffa8824d97612d344f', '4', '0,1,3,4,', '保存排序', '100', null, null, null, '0', 'sys:menu:updateSort', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('79fca849d3da4a82a4ade3f6b9f45126', '20', '0,1,3,20,', '删除', '100', null, null, null, '0', 'sys:user:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('7ae95603671940d68e7a3d0854855cb0', '2e36816eeb7c4d7bb9f7666df8b6e856', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,', '登陆日志', '30', '/sys/log1', null, null, '1', 'sys:log1:list', '1', '2017-07-29 01:26:40.000000', '1', '2017-07-29 01:26:40.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('8564ce62dbf14f048ae0cee24a8b2752', '2e36816eeb7c4d7bb9f7666df8b6e856', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,', '登出日志', '60', '/sys/log2', null, null, '1', 'sys:log2:list', '1', '2017-07-29 01:27:14.000000', '1', '2017-07-29 01:27:14.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('8930e4aad1ba4a1c958d303968d8c442', '17', '0,1,3,17,', '删除', '100', null, null, null, '0', 'sys:office:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('8e4ef973471b4c5681624a3961921d93', '7ae95603671940d68e7a3d0854855cb0', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,7ae95603671940d68e7a3d0854855cb0,', '删除', '30', '', '', '', '0', 'sys:log1:del', '1', '2018-03-25 10:50:01.376000', '1', '2018-03-25 10:50:01.376000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('9bc1aa1053144a608b73f6fbd841d1c6', '10', '0,1,3,10,', '删除', '100', null, null, null, '0', 'sys:dict:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('a2cc13530a8c4d8093443a3889a36f2b', '0680bbffa99c4e2aba6a1b70d8c30260', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,', '新闻报道管理', '1018', '/news', null, null, '1', 'dzjg:news:list', '1', '2017-12-14 09:24:01.000000', '1', '2017-12-14 09:51:54.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('a4c3dcee6cbc4fc6a0bf617d8619edf3', '17', '0,1,3,17,', '增加', '70', null, null, null, '0', 'sys:office:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('a7d000612a5b4c30a9904e75653e6d0f', '8564ce62dbf14f048ae0cee24a8b2752', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,8564ce62dbf14f048ae0cee24a8b2752,', '删除', '30', '', '', '', '0', 'sys:log2:del', '1', '2018-03-25 11:03:23.562000', '1', '2018-03-25 11:04:11.832000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('a9f47de3c8094c3f84f83d1cea1071c3', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '增加', '30', '', '', '', '0', 'dzjg:news:add', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:41:06.184000', '', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('b901c707e8aa4c939ebc60ff189af73d', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '编辑', '90', '', '', '', '0', 'dzjg:news:edit', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:43:09.902000', '', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('b9a776f5d7194406bb466388e3af9d08', '20', '0,1,3,20,', '导出', '160', null, null, null, '0', 'sys:user:export', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('c53454f75bea48849729031cbbd54e98', 'a2cc13530a8c4d8093443a3889a36f2b', '0,1,0680bbffa99c4e2aba6a1b70d8c30260,a2cc13530a8c4d8093443a3889a36f2b,', '查看', '120', '', '', '', '0', 'dzjg:news:view', '1', '2017-12-14 09:24:01.000000', '1', '2018-05-05 10:43:15.967000', '', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('c6e0080e06014abd9240f870aadf3200', '14', '0,1,3,14,', '增加', '70', null, null, null, '0', 'sys:area:add', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('dba62a47db6842e2b61179928a70e559', '2e36816eeb7c4d7bb9f7666df8b6e856', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,', '操作日志', '90', '/sys/log3', null, null, '1', 'sys:log3:list', '1', '2017-07-29 01:27:37.000000', '1', '2017-07-29 01:27:37.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('de7c50d276454f80881c41a096ecf55c', '7', '0,1,3,7,', '删除', '160', null, null, null, '0', 'sys:role:del', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('e190aea2a5bd4b07bcf8a899f09346ba', 'dba62a47db6842e2b61179928a70e559', '0,1,67,2e36816eeb7c4d7bb9f7666df8b6e856,dba62a47db6842e2b61179928a70e559,', '删除', '30', '', '', '', '0', 'sys:log3:del', '1', '2018-03-25 11:04:25.699000', '1', '2018-03-25 11:04:25.699000', '', '0', '0', '');
INSERT INTO `sys_menu` VALUES ('ebac51a8ac4a4f8283a245b424699bbd', '27', '0,1,27,', '测试', '60', '', '', '', '1', '', '1', '2018-05-06 09:40:03.203000', '1', '2018-05-06 09:40:03.203000', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('ec7cf7a144a440cab217aabd4ffb7788', '4', '0,1,3,4,', '查看', '130', null, null, null, '0', 'sys:menu:view', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('f34887a78fa245c1977603ca7dc98e11', '20', '0,1,3,20,', '导入', '130', null, null, null, '0', 'sys:user:import', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('f93f9a3a2226461dace3b8992cf055ba', '7', '0,1,3,7,', '权限设置', '130', null, null, null, '0', 'sys:role:auth', '1', '2016-02-19 18:01:43.000000', '1', '2016-02-19 18:01:43.000000', null, '0', '0', null);

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `ID` varchar(64) NOT NULL,
  `PARENT_ID` varchar(64) NOT NULL,
  `PARENT_IDS` text NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SORT` decimal(10,0) NOT NULL,
  `AREA_ID` varchar(64) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `TYPE` char(1) NOT NULL,
  `GRADE` char(1) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `ZIP_CODE` varchar(100) DEFAULT NULL,
  `MASTER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL,
  `FAX` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `USEABLE` varchar(64) DEFAULT NULL,
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL,
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL,
  `CREATE_BY` varchar(64) NOT NULL,
  `CREATE_DATE` datetime(6) NOT NULL,
  `UPDATE_BY` varchar(64) NOT NULL,
  `UPDATE_DATE` datetime(6) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SYS_OFFICE_DEL_FLAG` (`DEL_FLAG`),
  KEY `SYS_OFFICE_PARENT_ID` (`PARENT_ID`),
  KEY `SYS_OFFICE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('37deda73e0b542769caf3b42a268c3ee', '0', '0,', '江西农业大学', '30', '8806ecc2ef7b4a5490dae918f2d3829a', '11111', '1', '1', '11111', '', '', '', '', '', '1', '', '', '1', '2018-03-24 16:32:04.124000', '1', '2018-05-05 14:55:48.354000', '', '0');
INSERT INTO `sys_office` VALUES ('396fa2a37f7645739b4d924fceef726b', '4847afa7ceb545d6bcfc53780342b139', '0,37deda73e0b542769caf3b42a268c3ee,4847afa7ceb545d6bcfc53780342b139,', '软件1401', '30', '1', '11111002001', '1', null, '', null, null, '', '', '', null, null, null, '1', '2018-05-05 14:27:27.652000', '1', '2018-05-05 14:27:27.652000', '', '0');
INSERT INTO `sys_office` VALUES ('4847afa7ceb545d6bcfc53780342b139', '37deda73e0b542769caf3b42a268c3ee', '0,37deda73e0b542769caf3b42a268c3ee,', '软件学院', '30', '1', '11111002', '2', null, '', null, null, '', '', '', null, null, null, '1', '2018-04-18 11:41:24.735000', '1', '2018-04-18 11:41:24.735000', '', '0');
INSERT INTO `sys_office` VALUES ('68cbaaca36cd4b8790c1a4379eaad908', 'faedb239bcd943b3bf4e2d2691ef39ee', '0,37deda73e0b542769caf3b42a268c3ee,faedb239bcd943b3bf4e2d2691ef39ee,', '计科1401', '30', '8806ecc2ef7b4a5490dae918f2d3829a', '11111001001', '1', null, '', null, null, '', '', '', null, null, null, '1', '2018-05-05 14:27:00.651000', '1', '2018-05-05 14:56:03.699000', '', '0');
INSERT INTO `sys_office` VALUES ('c564b18f01cb4c7eb9d2fa89e4c5a049', 'faedb239bcd943b3bf4e2d2691ef39ee', '0,37deda73e0b542769caf3b42a268c3ee,faedb239bcd943b3bf4e2d2691ef39ee,', '计科1402', '30', '8806ecc2ef7b4a5490dae918f2d3829a', '11111001002', '1', null, '', null, null, '', '', '', null, null, null, '1', '2018-05-05 14:27:09.894000', '1', '2018-05-05 14:56:11.356000', '', '0');
INSERT INTO `sys_office` VALUES ('faedb239bcd943b3bf4e2d2691ef39ee', '37deda73e0b542769caf3b42a268c3ee', '0,37deda73e0b542769caf3b42a268c3ee,', '计算机与信息工程学院', '30', '8806ecc2ef7b4a5490dae918f2d3829a', '11111001', '4', '1', '', '', '', '', '', '', '1', '', '', '1', '2018-03-25 16:58:30.128000', '1', '2018-05-05 14:55:55.892000', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` varchar(64) NOT NULL,
  `OFFICE_ID` varchar(64) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `ENNAME` varchar(255) DEFAULT NULL,
  `ROLE_TYPE` varchar(255) DEFAULT NULL,
  `DATA_SCOPE` char(1) DEFAULT NULL,
  `IS_SYS` varchar(64) DEFAULT NULL,
  `USEABLE` varchar(64) DEFAULT NULL,
  `CREATE_BY` varchar(64) NOT NULL,
  `CREATE_DATE` datetime(6) NOT NULL,
  `UPDATE_BY` varchar(64) NOT NULL,
  `UPDATE_DATE` datetime(6) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SYS_ROLE_DEL_FLAG` (`DEL_FLAG`),
  KEY `SYS_ROLE_ENNAME` (`ENNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1', '院系管理员', 'system', 'user', '9', '0', '1', 'cee381b613f147f39c4d5ab0fc1ced18', '2016-02-19 18:15:11.000000', '1', '2017-08-26 16:55:59.000000', null, '0');
INSERT INTO `sys_role` VALUES ('91766cc228e34269a65f0564ba956bd7', '', '学生', 'student', 'user', '8', '1', '1', '1', '2016-02-19 18:15:11.000000', '1', '2018-05-05 14:35:18.199000', '', '0');
INSERT INTO `sys_role` VALUES ('a94e568c27d14929a074f58a7026e257', '37deda73e0b542769caf3b42a268c3ee', '老师', 'teacher', 'user', '4', '1', '1', '1', '2018-05-05 14:20:26.896000', '1', '2018-05-05 15:02:58.172000', '', '0');
INSERT INTO `sys_role` VALUES ('caacf61017114120bcf7bf1049b6d4c3', null, '部门管理员', 'tech', 'security-role', '4', '0', '1', '1', '2016-02-19 18:15:11.000000', '1', '2017-07-11 22:36:40.000000', null, '0');
INSERT INTO `sys_role` VALUES ('d8728abbd38e4e64958547278505cfcc', null, '班主任', 'class-master', 'user', '4', '0', '1', '1', '2017-07-12 23:33:29.000000', '1', '2018-05-05 15:01:14.509000', '', '0');
INSERT INTO `sys_role` VALUES ('dace0cab49a7428584eb57c163f45082', 'fbb66fe570b24f6b9b8eca3d832e6e2f', '校级管理员', 'xjgly', 'user', '1', '1', '1', '1', '2016-02-19 18:15:11.000000', '1', '2018-04-18 11:08:45.153000', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `ROLE_ID` varchar(64) NOT NULL,
  `MENU_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '1');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '10');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '11');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '12');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '14');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '15');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '16');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '17');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '18');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '19');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '20');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '21');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '22');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '27');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '29');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '3');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '30');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '3945952858c54ff6b928265e76416aa2');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '4');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '485c63cf6af1448880bb35b7b3f2bb1b');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '4d463414bc974236941a6a14dc53c73a');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '5');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '54afcfd125024b6eaeab9c5c3cea0009');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '56');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '57');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '58');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '59');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '5dfd09e5790b41388b8691ea9993eba5');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '6');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '62');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '63');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '64');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '65');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '66');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '67');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '68');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '69');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '7');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '70');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '70de7eac2f3e4632b1b7aa3cd536b35a');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '72');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '73');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '74');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '75');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '79');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '79f0ffa47dbe43ffa8824d97612d344f');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '7bd4484bd13c441395e44ab86772da00');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '7ec930fe50fb41d0a9c7aeaa01804d16');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '8');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '80');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '81');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '82');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '83');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '84');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '86');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '87');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '88');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '89');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '8930e4aad1ba4a1c958d303968d8c442');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '9');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '90');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'a4cfc713c3c04c32a274fb59c71e34ed');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'af0a174b4f424bc09a8cc0db83a64105');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'c99753f4ad0a4a458337b255c3b49095');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'e2565667b9a745eb870debfd0830c46f');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'e3e131bb489f43dd865280e4f5932b6d');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'e4e64e24aa134deaa9d69c3b9495c997');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'ec7cf7a144a440cab217aabd4ffb7788');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('03fcd9c5c28948eb827fcd3b852494a6', 'f9fe62186f0a4d7eada6c6827de79b26');
INSERT INTO `sys_role_menu` VALUES ('1', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('1', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('1', '0fde32c6c8204f92a6846714821491f7');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '1dc794e30998444489db19eec02915c3');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '872d2edc3b61405eb1448355e8f2c556');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('1', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('1', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('1', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('1', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('1', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('1', 'dcea8b88d08c4723878d372d2139448d');
INSERT INTO `sys_role_menu` VALUES ('1', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '1');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '1eab3abbe8cd47fc80fd5e23b5d941da');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '20');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '21');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '22');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '27');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '277862baa2044c53b4aa381716ff7f04');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '29');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '3');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '44969ea516ad42a79b57681c4f97a57b');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '7264f79c72e147d0b6a65b1c2d17edbd');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '8a1f3c40891641eeb871d0e477eaa7e5');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '8f65b682a6b34badbda261c249f3c159');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', 'ac5f7caad684406fb1ad53d2874821a7');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('1247b9f3f7cc4fccbf7ce17d201bbafc', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '05113289b218498f82d2e64227999c3d');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '10');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '11');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '12');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '14');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '15');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '16');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '17');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '18');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '19');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1eab3abbe8cd47fc80fd5e23b5d941da');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '20');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '21');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '22');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '27');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '277862baa2044c53b4aa381716ff7f04');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '29');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '3');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '3c1c639c76f14f6f9903b0143371ea09');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '4');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '44969ea516ad42a79b57681c4f97a57b');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '4d7e73a0c21340439ada526c549e28c0');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '5');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '50e8034eadba42d6a4abbda0fabdeb3f');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '5239527958e94d418997b584b85d8b80');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '6');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '6509eed6eb634030a46723a18814035c');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '67');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '6c672b854d2b4821b89297640df5fc26');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '6d3a6777693f47c98e9b3051cacbcfdb');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '7');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '7264f79c72e147d0b6a65b1c2d17edbd');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '79');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '79f0ffa47dbe43ffa8824d97612d344f');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '8');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '82');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '84');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '8930e4aad1ba4a1c958d303968d8c442');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '8a1f3c40891641eeb871d0e477eaa7e5');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '8f65b682a6b34badbda261c249f3c159');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '9');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '9bc1aa1053144a608b73f6fbd841d1c6');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b470bde535234ed0ba1148a2d4172f46');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b706093ce0b84ff7a533cdb71aeb206d');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c3de25a76785419b8a6820db3935941d');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c6e0080e06014abd9240f870aadf3200');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd3f1b6f292904ef5b95f7800cc777a48');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd64d25d7b3014f9ba7736867cb2ffc43');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd75f64438d994fc4830b1b3d138cde32');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'de7c50d276454f80881c41a096ecf55c');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e03f8b6a5e454addb04fc08033b6f60b');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e824b7c20bb34c9ca9ad023e8873e67b');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'ec7cf7a144a440cab217aabd4ffb7788');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f14d71cb7ed74812b14ccaea70209a1b');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f93f9a3a2226461dace3b8992cf055ba');
INSERT INTO `sys_role_menu` VALUES ('2', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('2', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('2', '0fde32c6c8204f92a6846714821491f7');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '1dc794e30998444489db19eec02915c3');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '73');
INSERT INTO `sys_role_menu` VALUES ('2', '74');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '88');
INSERT INTO `sys_role_menu` VALUES ('2', '89');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '90');
INSERT INTO `sys_role_menu` VALUES ('2', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('2', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('2', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('2', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('2', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('2', 'dcea8b88d08c4723878d372d2139448d');
INSERT INTO `sys_role_menu` VALUES ('2', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('3', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('3', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');
INSERT INTO `sys_role_menu` VALUES ('3', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('3', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('3', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('3', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('3', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('3', 'dcea8b88d08c4723878d372d2139448d');
INSERT INTO `sys_role_menu` VALUES ('3', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('460d5338a4e8492987b413d1c6ae1a81', '1');
INSERT INTO `sys_role_menu` VALUES ('460d5338a4e8492987b413d1c6ae1a81', '3');
INSERT INTO `sys_role_menu` VALUES ('460d5338a4e8492987b413d1c6ae1a81', '4');
INSERT INTO `sys_role_menu` VALUES ('460d5338a4e8492987b413d1c6ae1a81', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('5', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '10');
INSERT INTO `sys_role_menu` VALUES ('5', '11');
INSERT INTO `sys_role_menu` VALUES ('5', '12');
INSERT INTO `sys_role_menu` VALUES ('5', '14');
INSERT INTO `sys_role_menu` VALUES ('5', '15');
INSERT INTO `sys_role_menu` VALUES ('5', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '17');
INSERT INTO `sys_role_menu` VALUES ('5', '18');
INSERT INTO `sys_role_menu` VALUES ('5', '19');
INSERT INTO `sys_role_menu` VALUES ('5', '20');
INSERT INTO `sys_role_menu` VALUES ('5', '21');
INSERT INTO `sys_role_menu` VALUES ('5', '22');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '30');
INSERT INTO `sys_role_menu` VALUES ('5', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('5', '4d463414bc974236941a6a14dc53c73a');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '57');
INSERT INTO `sys_role_menu` VALUES ('5', '58');
INSERT INTO `sys_role_menu` VALUES ('5', '59');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '62');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '64');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '67');
INSERT INTO `sys_role_menu` VALUES ('5', '68');
INSERT INTO `sys_role_menu` VALUES ('5', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('5', '69');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '70');
INSERT INTO `sys_role_menu` VALUES ('5', '70de7eac2f3e4632b1b7aa3cd536b35a');
INSERT INTO `sys_role_menu` VALUES ('5', '72');
INSERT INTO `sys_role_menu` VALUES ('5', '73');
INSERT INTO `sys_role_menu` VALUES ('5', '74');
INSERT INTO `sys_role_menu` VALUES ('5', '75');
INSERT INTO `sys_role_menu` VALUES ('5', '79');
INSERT INTO `sys_role_menu` VALUES ('5', '79f0ffa47dbe43ffa8824d97612d344f');
INSERT INTO `sys_role_menu` VALUES ('5', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('5', '7ec930fe50fb41d0a9c7aeaa01804d16');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '80');
INSERT INTO `sys_role_menu` VALUES ('5', '81');
INSERT INTO `sys_role_menu` VALUES ('5', '82');
INSERT INTO `sys_role_menu` VALUES ('5', '83');
INSERT INTO `sys_role_menu` VALUES ('5', '84');
INSERT INTO `sys_role_menu` VALUES ('5', '86');
INSERT INTO `sys_role_menu` VALUES ('5', '87');
INSERT INTO `sys_role_menu` VALUES ('5', '88');
INSERT INTO `sys_role_menu` VALUES ('5', '89');
INSERT INTO `sys_role_menu` VALUES ('5', '8930e4aad1ba4a1c958d303968d8c442');
INSERT INTO `sys_role_menu` VALUES ('5', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '90');
INSERT INTO `sys_role_menu` VALUES ('5', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('5', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
INSERT INTO `sys_role_menu` VALUES ('5', 'a4cfc713c3c04c32a274fb59c71e34ed');
INSERT INTO `sys_role_menu` VALUES ('5', 'af0a174b4f424bc09a8cc0db83a64105');
INSERT INTO `sys_role_menu` VALUES ('5', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('5', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('5', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('5', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('5', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('5', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('5', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('5', 'e2565667b9a745eb870debfd0830c46f');
INSERT INTO `sys_role_menu` VALUES ('5', 'e4e64e24aa134deaa9d69c3b9495c997');
INSERT INTO `sys_role_menu` VALUES ('5', 'ec7cf7a144a440cab217aabd4ffb7788');
INSERT INTO `sys_role_menu` VALUES ('5', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('5', 'f9fe62186f0a4d7eada6c6827de79b26');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '1');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '1eab3abbe8cd47fc80fd5e23b5d941da');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '27');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '29');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '44969ea516ad42a79b57681c4f97a57b');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '7264f79c72e147d0b6a65b1c2d17edbd');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '8a1f3c40891641eeb871d0e477eaa7e5');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '8f65b682a6b34badbda261c249f3c159');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('74b5acaa6edd46f99973d054c8654667', 'ac5f7caad684406fb1ad53d2874821a7');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '1');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '10');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '11');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '12');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '14');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '15');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '16');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '17');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '18');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '19');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '20');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '21');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '22');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '27');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '29');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '3');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '30');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '3945952858c54ff6b928265e76416aa2');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '4');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '485c63cf6af1448880bb35b7b3f2bb1b');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '4d463414bc974236941a6a14dc53c73a');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '5');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '54afcfd125024b6eaeab9c5c3cea0009');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '56');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '57');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '58');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '59');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '5dfd09e5790b41388b8691ea9993eba5');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '6');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '62');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '63');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '64');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '65');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '66');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '67');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '68');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '69');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '7');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '70');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '70de7eac2f3e4632b1b7aa3cd536b35a');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '72');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '73');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '74');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '75');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '79');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '79f0ffa47dbe43ffa8824d97612d344f');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '7bd4484bd13c441395e44ab86772da00');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '7ec930fe50fb41d0a9c7aeaa01804d16');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '8');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '80');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '81');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '82');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '83');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '84');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '85');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '86');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '87');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '88');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '89');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '8930e4aad1ba4a1c958d303968d8c442');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '9');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '90');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'a4cfc713c3c04c32a274fb59c71e34ed');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'af0a174b4f424bc09a8cc0db83a64105');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'c99753f4ad0a4a458337b255c3b49095');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'e2565667b9a745eb870debfd0830c46f');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'e3e131bb489f43dd865280e4f5932b6d');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'e4e64e24aa134deaa9d69c3b9495c997');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'ec7cf7a144a440cab217aabd4ffb7788');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('78cf5521ff9e43ed80266adeff67d5ed', 'f9fe62186f0a4d7eada6c6827de79b26');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '0220529e83a54f77a6d8447239ef7c8e');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '0680bbffa99c4e2aba6a1b70d8c30260');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '1');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '27');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '29');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '5f1b2f12927f472fa00edbd1925d0eef');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', '7807730c3d25496b9468fcfd0cf6fe7f');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', 'a2cc13530a8c4d8093443a3889a36f2b');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', 'a9f47de3c8094c3f84f83d1cea1071c3');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', 'b901c707e8aa4c939ebc60ff189af73d');
INSERT INTO `sys_role_menu` VALUES ('91766cc228e34269a65f0564ba956bd7', 'c53454f75bea48849729031cbbd54e98');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '0fde32c6c8204f92a6846714821491f7');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '1');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '10');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '11');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '12');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '13');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '14');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '15');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '16');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '17');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '18');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '19');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '1dc794e30998444489db19eec02915c3');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '20');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '21');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '22');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '27');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '29');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '3');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '30');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '31');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '32');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '33');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '34');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '35');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '36');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '37');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '38');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '39');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '4');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '40');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '41');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '42');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '43');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '44');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '45');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '46');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '47');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '48');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '49');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '4d463414bc974236941a6a14dc53c73a');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '5');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '50');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '51');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '52');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '53');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '54');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '55');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '56');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '57');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '58');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '59');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '5e72ae5a7d56478c8db2a7975883f367');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '6');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '60');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '61');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '62');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '63');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '64');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '65');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '66');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '67');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '68');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '69');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '7');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '70');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '70de7eac2f3e4632b1b7aa3cd536b35a');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '72');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '73');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '74');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '79');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '7ec930fe50fb41d0a9c7aeaa01804d16');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '8');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '80');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '81');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '82');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '84');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '88');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '89');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '9');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '90');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'a4cfc713c3c04c32a274fb59c71e34ed');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'af0a174b4f424bc09a8cc0db83a64105');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'dcea8b88d08c4723878d372d2139448d');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'df7ce823c5b24ff9bada43d992f373e2');
INSERT INTO `sys_role_menu` VALUES ('a74b7da6e0e0458298316798e89e70ea', 'f9fe62186f0a4d7eada6c6827de79b26');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '0220529e83a54f77a6d8447239ef7c8e');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '0680bbffa99c4e2aba6a1b70d8c30260');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '1');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '27');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '29');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '5f1b2f12927f472fa00edbd1925d0eef');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', '7807730c3d25496b9468fcfd0cf6fe7f');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', 'a2cc13530a8c4d8093443a3889a36f2b');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', 'a9f47de3c8094c3f84f83d1cea1071c3');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', 'b901c707e8aa4c939ebc60ff189af73d');
INSERT INTO `sys_role_menu` VALUES ('a94e568c27d14929a074f58a7026e257', 'c53454f75bea48849729031cbbd54e98');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '1');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '10');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '11');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '12');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '14');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '15');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '16');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '17');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '18');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '19');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '20');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '21');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '22');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '27');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '277862baa2044c53b4aa381716ff7f04');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '29');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '3');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '3c1c639c76f14f6f9903b0143371ea09');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '4');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '44969ea516ad42a79b57681c4f97a57b');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '5');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '5239527958e94d418997b584b85d8b80');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '6');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '6509eed6eb634030a46723a18814035c');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '6d3a6777693f47c98e9b3051cacbcfdb');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '7');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '7264f79c72e147d0b6a65b1c2d17edbd');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '79f0ffa47dbe43ffa8824d97612d344f');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '8');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '8930e4aad1ba4a1c958d303968d8c442');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '8a1f3c40891641eeb871d0e477eaa7e5');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '8f65b682a6b34badbda261c249f3c159');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '9');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '95a6a82dc5fc4d07b46e5df57a0606a3');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '9bc1aa1053144a608b73f6fbd841d1c6');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'ac5f7caad684406fb1ad53d2874821a7');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'c6e0080e06014abd9240f870aadf3200');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'de7c50d276454f80881c41a096ecf55c');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'ec7cf7a144a440cab217aabd4ffb7788');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('caacf61017114120bcf7bf1049b6d4c3', 'f93f9a3a2226461dace3b8992cf055ba');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '0220529e83a54f77a6d8447239ef7c8e');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '0680bbffa99c4e2aba6a1b70d8c30260');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '1');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '20');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '21');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '22');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '27');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '277862baa2044c53b4aa381716ff7f04');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '29');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '3');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '5f1b2f12927f472fa00edbd1925d0eef');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '7807730c3d25496b9468fcfd0cf6fe7f');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'a2cc13530a8c4d8093443a3889a36f2b');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'a9f47de3c8094c3f84f83d1cea1071c3');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'b901c707e8aa4c939ebc60ff189af73d');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'c53454f75bea48849729031cbbd54e98');
INSERT INTO `sys_role_menu` VALUES ('d8728abbd38e4e64958547278505cfcc', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '1');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '10');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '11');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '12');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '20');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '21');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '22');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '27');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '277862baa2044c53b4aa381716ff7f04');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '29');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '3');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '6d3a6777693f47c98e9b3051cacbcfdb');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', '9bc1aa1053144a608b73f6fbd841d1c6');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('dace0cab49a7428584eb57c163f45082', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '0fde32c6c8204f92a6846714821491f7');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '1');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '10');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '11');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '12');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '13');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '14');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '15');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '16');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '17');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '18');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '19');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '1dc794e30998444489db19eec02915c3');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '20');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '21');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '22');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '27');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '29');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '3');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '30');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '31');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '32');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '33');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '34');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '35');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '36');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '37');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '38');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '39');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '4');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '40');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '41');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '42');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '43');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '44');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '45');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '46');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '47');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '48');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '49');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '4d463414bc974236941a6a14dc53c73a');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '5');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '50');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '51');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '52');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '53');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '54');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '55');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '56');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '57');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '58');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '59');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '6');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '60');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '61');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '62');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '63');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '64');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '65');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '66');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '67');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '68');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '69');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '7');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '70');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '72');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '73');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '74');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '79');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '8');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '80');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '81');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '82');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '84');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '88');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '89');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '9');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', '90');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'af0a174b4f424bc09a8cc0db83a64105');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'dcea8b88d08c4723878d372d2139448d');
INSERT INTO `sys_role_menu` VALUES ('f6d2f215ed734cc09273928acab6e136', 'df7ce823c5b24ff9bada43d992f373e2');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `ROLE_ID` varchar(64) NOT NULL,
  `OFFICE_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`OFFICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '000d7380e6b94d86aadff3e9b3a2d071');
INSERT INTO `sys_role_office` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '0549884129874bf5a67db617c575f4c8');
INSERT INTO `sys_role_office` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1');
INSERT INTO `sys_role_office` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '100b56a373594336a3adf5479f8208df');
INSERT INTO `sys_role_office` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '22380970a8d84b319a330ff29acd924b');
INSERT INTO `sys_role_office` VALUES ('22a819f70aaa416f91a8dfa051c5eaac', '5');
INSERT INTO `sys_role_office` VALUES ('22a819f70aaa416f91a8dfa051c5eaac', '89422fefb5cd4e0eaacab55f5358e355');
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');
INSERT INTO `sys_role_office` VALUES ('abe1769eb0fb433eb8b3d3af116b0189', '000d7380e6b94d86aadff3e9b3a2d071');
INSERT INTO `sys_role_office` VALUES ('abe1769eb0fb433eb8b3d3af116b0189', '100b56a373594336a3adf5479f8208df');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(64) NOT NULL,
  `COMPANY_ID` varchar(64) DEFAULT NULL,
  `OFFICE_ID` varchar(64) NOT NULL,
  `LOGIN_NAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `NO` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL,
  `MOBILE` varchar(200) DEFAULT NULL,
  `USER_TYPE` char(1) DEFAULT NULL,
  `PHOTO` text,
  `LOGIN_IP` varchar(100) DEFAULT NULL,
  `LOGIN_DATE` datetime(6) DEFAULT NULL,
  `LOGIN_FLAG` varchar(64) DEFAULT NULL,
  `CREATE_BY` varchar(64) DEFAULT NULL,
  `CREATE_DATE` datetime(6) DEFAULT NULL,
  `UPDATE_BY` varchar(64) DEFAULT NULL,
  `UPDATE_DATE` datetime(6) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `DEL_FLAG` char(1) DEFAULT NULL,
  `QRCODE` text,
  `SIGN` varchar(255) DEFAULT NULL,
  `OTHER_ORG_IDS` text,
  `OTHER_ORG_NAMES` text,
  PRIMARY KEY (`ID`),
  KEY `SYS_USER_COMPANY_ID` (`COMPANY_ID`),
  KEY `SYS_USER_DEL_FLAG` (`DEL_FLAG`),
  KEY `SYS_USER_LOGIN_NAME` (`LOGIN_NAME`),
  KEY `SYS_USER_OFFICE_ID` (`OFFICE_ID`),
  KEY `SYS_USER_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, '37deda73e0b542769caf3b42a268c3ee', 'admin', 'd703133711f26df7bbcf77f231a48027b311db9b2865d8438eb08053', '0001', '管理员', 'test@163.com', '11111323', '18779883569', '2', '/jckj/userfiles/1/images/u=2581335220,2051962541&fm=117&gp=0.jpg', '0:0:0:0:0:0:0:1', '2018-05-06 20:31:30.241000', '1', '1', '2017-12-01 15:39:23.000000', '1', '2018-05-05 14:58:59.642000', '系统管理员', '0', '/jeeplus/userfiles/1/qrcode/1.png', null, '4', '财务部');
INSERT INTO `sys_user` VALUES ('6202b1d820b14ccebe4bf9adc29a70a1', null, 'c564b18f01cb4c7eb9d2fa89e4c5a049', 'user', 'fceff4d4175e6740c0d7f6e5e3815d29cea2e78adaa2a45901177cbc', '1111', 'user', '', '', '', '1', null, null, null, '1', '1', '2018-03-30 14:46:28.461000', '1', '2018-05-05 15:04:55.893000', '', '0', null, null, null, null);
INSERT INTO `sys_user` VALUES ('681ab961d7454236bdfe9042900d8310', null, '396fa2a37f7645739b4d924fceef726b', '123', '77c765bc077e05c22c7a5c9cc99024ce001226fc8fc80c4837dab4b0', '123123', '123', '', '', '', '1', null, null, null, '1', '1', '2018-05-05 22:59:32.681000', '1', '2018-05-05 22:59:32.681000', '', '0', null, null, null, null);
INSERT INTO `sys_user` VALUES ('768629a4abac410091bcb1239542b014', null, '68cbaaca36cd4b8790c1a4379eaad908', '1111', 'bb21f6917c29bc3b2ec5e32637010e8e425cf7d7eb7274acc8019604', '1111', '111', 't1111t@163.com', '1111111', '', '1', null, null, null, '1', '1', '2018-05-05 23:15:21.306000', '1', '2018-05-05 23:15:55.934000', '系统管理员', '0', null, null, null, null);
INSERT INTO `sys_user` VALUES ('b09849a908c745dfa6b0b72a873975c4', null, '68cbaaca36cd4b8790c1a4379eaad908', 'wanqh', '5a5080630402d677e5975521ac4c7fd211bd869a0a7a080d29cf0051', '20142330', '万庆华', '123@qq.com', '13156', '15180181487', '1', null, '0:0:0:0:0:0:0:1', '2018-05-05 15:02:30.608000', '1', '1', '2018-03-25 15:48:29.240000', '1', '2018-05-05 14:34:14.611000', '', '0', null, null, null, null);
INSERT INTO `sys_user` VALUES ('fdcd831627c447c28411aa82963d2db6', null, '68cbaaca36cd4b8790c1a4379eaad908', '003', '024b52b97fbc5931c8975ab6eec10e582cd93c9c6ce9920d19fb86d2', '001', '123', '', '', '', '2', null, '0:0:0:0:0:0:0:1', '2018-05-05 15:02:03.729000', '1', '1', '2018-05-05 14:59:37.794000', '1', '2018-05-05 15:01:53.211000', '', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ID` varchar(64) NOT NULL,
  `ROLE_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('02c4142679194cd3bc4a089a6db7b025', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('0403490e821041d1849e4b4aec18e95e', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('0403490e821041d1849e4b4aec18e95e', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('0b6d16e1c9f9494394f0c393a5d5bb20', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('0e01985207154708a01e53ca07965665', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('0f7017853ec24648872e01fe9c930969', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('1', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('10', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('11', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('12', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('1432acd56da34d108bf32b1efa8470c4', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('1432acd56da34d108bf32b1efa8470c4', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('1690569548d2400b893e4348b5445468', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('16fd36c4218c4c43881c2e6a4b9f3263', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('16fd36c4218c4c43881c2e6a4b9f3263', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('19e655ebcd844747aa0e46efe9870169', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('19e655ebcd844747aa0e46efe9870169', '5');
INSERT INTO `sys_user_role` VALUES ('19e655ebcd844747aa0e46efe9870169', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('19e655ebcd844747aa0e46efe9870169', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('1f139eff62b642ccae9c390424d9c929', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('2', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('22b4d1d5444e464fa57a31d85c8758ce', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('22b4d1d5444e464fa57a31d85c8758ce', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('288514dd0dc142a8b10cf23b109d0bab', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('2cc5ed78b507432ea663e91416bf2746', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('2e6214ad951548f09aa58c943a897240', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('2e6214ad951548f09aa58c943a897240', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('3', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('3', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('30b322abf09c4cfc86248a4e6503e5be', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('3182087104d044c3a80bc4cb06e1f61f', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('34f134c11a3b460a8382310b29303222', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('34f134c11a3b460a8382310b29303222', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('3f7ef2d4761f445e946413ab9bea23db', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('4', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('40b2c4d2921648aeb475555d5e5460b6', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('42f5435f943a4e8cbcd86ec07b1d922a', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('45f8002c452d4a54a82f113379c7b853', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('45f8002c452d4a54a82f113379c7b853', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('4639f877ec7149258cadcf145b4182a7', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('4639f877ec7149258cadcf145b4182a7', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('5', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('5091ca619fbf49209bce020859103ba5', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('5091ca619fbf49209bce020859103ba5', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('51938e17b432476bbe489a2c523183a4', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('5ad0d1f9efdc44b481b02c26b67e832e', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('5ad0d1f9efdc44b481b02c26b67e832e', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('5b61eb41f80f43c5b8e485866178f63d', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('5b7ff20cb8584011a473a5c0052737e2', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('5b7ff20cb8584011a473a5c0052737e2', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('5f316d15afa14968a9a0ea36eba30db9', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('5f316d15afa14968a9a0ea36eba30db9', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('6', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('607b0136b4fa4803875495b717cbd4bd', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('607b0136b4fa4803875495b717cbd4bd', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('6202b1d820b14ccebe4bf9adc29a70a1', 'd8728abbd38e4e64958547278505cfcc');
INSERT INTO `sys_user_role` VALUES ('6474fda3f35c4d1580b646a42f190cf7', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('6678c74ebb0e441b957bf069ba6edf80', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('6678c74ebb0e441b957bf069ba6edf80', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('681ab961d7454236bdfe9042900d8310', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('6be10c78cb074694931536f1a7041351', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('6d69972a880f4228b88f28254c3e417e', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('7', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('7', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('74c4dff9f02b4813a87dd3418be895d6', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('74c4dff9f02b4813a87dd3418be895d6', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('768629a4abac410091bcb1239542b014', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('768629a4abac410091bcb1239542b014', 'a94e568c27d14929a074f58a7026e257');
INSERT INTO `sys_user_role` VALUES ('7a037497ef0441e4b494ae4eef793046', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('7a037497ef0441e4b494ae4eef793046', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('7a41ae46fe7a4f688d5ee1cd24220b7c', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('7a41ae46fe7a4f688d5ee1cd24220b7c', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('7b516c61e6314fa087ea1f5a27944199', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('7e9cac2b269c4671a17c5121877b5ecd', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('7e9cac2b269c4671a17c5121877b5ecd', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('8', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('83a8c6459ce84fe5a2f33f216c5138ab', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('83a8c6459ce84fe5a2f33f216c5138ab', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('87523dbfa54241f5aa12133daffda7b8', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('87523dbfa54241f5aa12133daffda7b8', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('8b454376c0434e2792a1dc57edf80dbd', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('8f1497e7ceb44af19c366ca8627df816', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('8f3ff51c459f44c9b56ce8a973139c97', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('8f3ff51c459f44c9b56ce8a973139c97', 'd8728abbd38e4e64958547278505cfcc');
INSERT INTO `sys_user_role` VALUES ('9', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('9', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('94f7a6b3805c45af8e4ac422e9825997', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('95b3b09fa0b34ac6b95907237c744c55', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('97bcb9ac6705460abb9e13e7e0918268', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('97bcb9ac6705460abb9e13e7e0918268', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('a187149d248144dc909f18230646ff93', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('a187149d248144dc909f18230646ff93', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('a4723905aefa4b0e9ded1bda07362cde', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('a4723905aefa4b0e9ded1bda07362cde', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('a4c19ad2b9bc415aaf8592a74b846450', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('a4c19ad2b9bc415aaf8592a74b846450', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('a65bc6e428f845c5843a0713427369cb', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('a65bc6e428f845c5843a0713427369cb', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('a68dfe143da9485b9b6c0335c3a70618', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('a68dfe143da9485b9b6c0335c3a70618', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('a6bb754d86ae472896dfad016bb40965', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('a91be50880744e4787a77e0f97f8dbb5', '03fcd9c5c28948eb827fcd3b852494a6');
INSERT INTO `sys_user_role` VALUES ('a91be50880744e4787a77e0f97f8dbb5', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('a91be50880744e4787a77e0f97f8dbb5', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('a91be50880744e4787a77e0f97f8dbb5', 'f6d2f215ed734cc09273928acab6e136');
INSERT INTO `sys_user_role` VALUES ('a921ce21560a42898dd5ff0861c73e57', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('a921ce21560a42898dd5ff0861c73e57', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('ac1bd9df7da24dcf95f9b61e11b2726d', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('ad84061bb43a494c8261dcd06f474ec2', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('ad84061bb43a494c8261dcd06f474ec2', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('b09849a908c745dfa6b0b72a873975c4', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('b2228c44940240f4a47a64f9d4a253d1', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('b787439ee29a4322a3a3b2b24373e3bf', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('b787439ee29a4322a3a3b2b24373e3bf', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('bb81a0c098a444e69028380e80852d91', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('bb81a0c098a444e69028380e80852d91', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('be473ba8c64448bca05c7410bd8b04da', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('be473ba8c64448bca05c7410bd8b04da', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('c3a7b05c401049219adbe1c6991ff40f', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('c3a7b05c401049219adbe1c6991ff40f', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('c459adae196a47278fe27730231f9736', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('cb176ef0bce14c80ac5c2809861b560a', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('cb176ef0bce14c80ac5c2809861b560a', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('cb359e3089224f97adae46cf03c0ed94', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('cd8c3611c8c743c2a0a5b1d374674f2c', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('cd8c3611c8c743c2a0a5b1d374674f2c', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('cee381b613f147f39c4d5ab0fc1ced18', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('cee381b613f147f39c4d5ab0fc1ced18', 'abe1769eb0fb433eb8b3d3af116b0189');
INSERT INTO `sys_user_role` VALUES ('d355e9e6b4ad48a59fa0a983e8b7b583', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('d42378c9621b4551a0c4c63c82f0aa33', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('d42378c9621b4551a0c4c63c82f0aa33', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('d42378c9621b4551a0c4c63c82f0aa33', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('d7fcfbf7668f48ddb1d395c001143273', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('d86633e31b634cca8521812a3235faf1', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('d86633e31b634cca8521812a3235faf1', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('d8de25a1f872404e82f669c04091685e', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('da60c61cf2aa4cb2810c629c7045c538', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('dc4059ad753e44fe9a22b5f06b0af049', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('dc4059ad753e44fe9a22b5f06b0af049', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('dc9663e71aaa42f0a2634770896ec74c', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('dc9663e71aaa42f0a2634770896ec74c', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('e69af034d8d646d4be091bb0279b3f35', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('eca1a51b803449d59ce4e2a3b0f4f787', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('eca1a51b803449d59ce4e2a3b0f4f787', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('eedf59cb73cd413cbb14c42c2f797482', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('ef40b2bbae144c05a5be85b48669eea2', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('ef40b2bbae144c05a5be85b48669eea2', '91766cc228e34269a65f0564ba956bd7');
INSERT INTO `sys_user_role` VALUES ('f12330474f634e2897878e8f56a910ae', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('f6679e1c07b94e2f9b66d69b271e1bbe', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('f6679e1c07b94e2f9b66d69b271e1bbe', 'abe1769eb0fb433eb8b3d3af116b0189');
INSERT INTO `sys_user_role` VALUES ('f6a799f807384880a2c7bb8b866b14f7', 'dace0cab49a7428584eb57c163f45082');
INSERT INTO `sys_user_role` VALUES ('f7b42b73974640f0a68d185825beea8c', '22a819f70aaa416f91a8dfa051c5eaac');
INSERT INTO `sys_user_role` VALUES ('f7b42b73974640f0a68d185825beea8c', 'caacf61017114120bcf7bf1049b6d4c3');
INSERT INTO `sys_user_role` VALUES ('fdcd831627c447c28411aa82963d2db6', 'a94e568c27d14929a074f58a7026e257');

-- ----------------------------
-- Table structure for t_attachs
-- ----------------------------
DROP TABLE IF EXISTS `t_attachs`;
CREATE TABLE `t_attachs` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `FILE_NAME` text COMMENT '文件名',
  `MODULE_ID` varchar(64) DEFAULT NULL COMMENT '模块ID',
  `FILE_PATH` text COMMENT '文件路径',
  `FILE_TYPE` varchar(64) DEFAULT NULL COMMENT '文件格式',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of t_attachs
-- ----------------------------
INSERT INTO `t_attachs` VALUES ('20a6a9d3a0bd4d9ba5a4df6da9352c13', '新建文本文档.txt', '5f03a56dacaa4659a980a773e934e177', 'D:/workspace/eclipse/jckj/build/classes/attachs\\eb3523ca033c4ab4b169585ab2bdfb6f.txt', 'txt');
INSERT INTO `t_attachs` VALUES ('2718b5c967504d96ad0acb08756fd564', '2016年慕课网新年特献.html', 'f438f5f7aa734c658ce81bd3400d0deb', 'E:/workspace/eclipse/jckj/build/classes/attachs\\8b6b5199a002423a834973550f849233.html', 'html');
INSERT INTO `t_attachs` VALUES ('29368234353e4af3a719a328ca96fa92', '问卷试题数据导入模板.xlsx', '5f03a56dacaa4659a980a773e934e177', 'D:/workspace/eclipse/jckj/build/classes/attachs\\836fe9bc36114cd69967f64be5cbe982.xlsx', 'xlsx');
INSERT INTO `t_attachs` VALUES ('598a4ae1037840b2a7b660f261d0c173', 'chrome_child.dll.sig', '3e609e99feb84b0e9b9ff8804bae96f9', 'E:/workspace/eclipse/jckj/build/classes/attachs\\a77b268f2d6141fbb18375538e247e89.sig', 'sig');
INSERT INTO `t_attachs` VALUES ('5ea1d750c9154cc68002917e99e514fd', null, '826a891602fb4bd2a27edcac96efdcd0', 'E:/workspace/eclipse/jckj/build/classes/attachs\\92f57099b366411e88dc7eca76e8cc81.', null);
INSERT INTO `t_attachs` VALUES ('6824ac6127ac4810a92775c6557c7fb8', null, 'a0edc9add06248cc9bcd6fd73e9289b3', 'E:/workspace/eclipse/jckj/build/classes/attachs\\7bad1d45a8814b348c34e5cf4430a0fb.', null);
INSERT INTO `t_attachs` VALUES ('6f40e274858441e980a53e7c3904bdcd', 'QQ截图20170717215620.png', 'f438f5f7aa734c658ce81bd3400d0deb', 'E:/workspace/eclipse/jckj/build/classes/attachs\\d4a6135241c4453681bf13d1ad1a3515.png', 'png');
INSERT INTO `t_attachs` VALUES ('8e33611951254460a5109a295701b3bc', 'eventlog_provider.dll', '7d82172f91ef4860af27b05ae328ba42', 'E:/workspace/eclipse/jckj/build/classes/attachs\\d371f5a8affc41d49d0014aa6af0ad3f.dll', 'dll');
INSERT INTO `t_attachs` VALUES ('a7d1fea9bd06458f9faf90184bdef429', 'p1_imooc.png', '47041b51d06d4c2ca2922179bfdbe0db', 'E:/workspace/eclipse/jckj/build/classes/attachs\\5b16afecd4ec4d4c903308ffe6da3eb2.png', 'png');
INSERT INTO `t_attachs` VALUES ('b3b9119b5c4f4053b84e6d89963ba9f7', null, '884cb756ef32460483932865a3a86cf6', 'E:/workspace/eclipse/jckj/build/classes/attachs\\e3b2769de8804f84aaaa28377c665708.', null);
INSERT INTO `t_attachs` VALUES ('c4002403b8774eefa4b30a2ebe62f0b2', 'chrome_child.dll.sig', '1d644c3da35249e08afa7aa41fc2c4d1', 'E:/workspace/eclipse/jckj/build/classes/attachs\\1b521e9727ef45129365eb1ae0df6447.sig', 'sig');
INSERT INTO `t_attachs` VALUES ('cb06212378d34943972d4507f30589b4', null, '1e4c22d432bd47cf87bf2a505f17a202', 'E:/workspace/eclipse/jckj/build/classes/attachs\\2e7d95f9f7c443aabadbd6aed15dfcc4.', null);
INSERT INTO `t_attachs` VALUES ('d6449b768d4646b680ba2cd2c0668fd6', 'eventlog_provider.dll', '432eb9f32c7b44e4872e32cda2e83f8a', 'E:/workspace/eclipse/jckj/build/classes/attachs\\d6b931676e3b4931913028c043ec06d0.dll', 'dll');
INSERT INTO `t_attachs` VALUES ('f408e27285b5495f83700fcf00d884b6', null, 'f5e3ffbd11c64815b8635a1f662d5124', 'E:/workspace/eclipse/jckj/build/classes/attachs\\67ad4051fe1a44909f345a8576669c45.', null);
