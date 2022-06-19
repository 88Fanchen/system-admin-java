/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50732
Source Host           : localhost:3306
Source Database       : system_admin

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2021-12-18 20:55:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access_register
-- ----------------------------
DROP TABLE IF EXISTS `access_register`;
CREATE TABLE `access_register` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `type` int(1) DEFAULT NULL COMMENT '出入类型（1：出校 0：入校）',
  `card` varchar(80) DEFAULT NULL COMMENT '身份证号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='出入登记表';

-- ----------------------------
-- Records of access_register
-- ----------------------------
INSERT INTO `access_register` VALUES ('1', '范晨', '17730312784', '1', '342623199906214418', '持有假条出校', '软件186', 'admin', '2021-12-17 14:39:37', '2021-12-17 14:39:37', '0');
INSERT INTO `access_register` VALUES ('2', '范晨', '17730312784', '0', '342623199906214418', '正常返校', '软件186', 'admin', '2021-12-17 18:04:10', '2021-12-17 18:04:10', '0');
INSERT INTO `access_register` VALUES ('3', '杜东亮', '19851920126', '1', '34262319990901159x', '正常请假出校', '软件186', 'admin', '2021-12-17 18:20:27', '2021-12-17 18:20:27', '0');

-- ----------------------------
-- Table structure for access_return
-- ----------------------------
DROP TABLE IF EXISTS `access_return`;
CREATE TABLE `access_return` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(60) DEFAULT NULL COMMENT '手机号码',
  `card` varchar(80) DEFAULT NULL COMMENT '身份证号码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='未归用户表';

-- ----------------------------
-- Records of access_return
-- ----------------------------
INSERT INTO `access_return` VALUES ('1', '杜东亮', '19851920126', '34262319990901159x', '正常请假出校', '软件186', '2021-12-17 18:20:27');

-- ----------------------------
-- Table structure for good_info
-- ----------------------------
DROP TABLE IF EXISTS `good_info`;
CREATE TABLE `good_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物资信息id',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `name` varchar(50) DEFAULT NULL COMMENT '物资名称',
  `img` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `size` varchar(50) DEFAULT NULL COMMENT '物资规格',
  `unit` varchar(50) DEFAULT NULL COMMENT '物资单位',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `total` int(11) DEFAULT NULL COMMENT '库存',
  `status` int(1) DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  `version` int(11) DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='物资信息表';

-- ----------------------------
-- Records of good_info
-- ----------------------------
INSERT INTO `good_info` VALUES ('1', '1', '冰露饮用水', 'http://localhost:8081/img/2021/12/562b13fd7f6a4d5184c02533a79e58c0.jpeg', '打', '20瓶/打', 'admin', '必不可少的饮用水', '40', '1', '2021-12-10 09:31:46', '2021-12-17 12:47:25', '0', '6');
INSERT INTO `good_info` VALUES ('2', '4', '医用口罩', 'http://localhost:8081/img/2021/12/09e810d48ec648bca761ad662a04f0a3.jpg', '包', '10只/包', 'admin', '普通的医用口罩', '40', '1', '2021-12-10 15:39:32', '2021-12-17 12:47:25', '0', '3');
INSERT INTO `good_info` VALUES ('3', '4', 'N95口罩', 'http://localhost:8081/img/2021/12/3f6850caac0c411ab8c518231d14eb4e.jpg', '盒', '15只/盒', 'admin', '防护性很强的口罩 安全', '50', '1', '2021-12-10 18:13:04', '2021-12-13 14:12:48', '0', '2');
INSERT INTO `good_info` VALUES ('4', '1', '葡萄糖', 'http://localhost:8081/img/2021/12/203982b07f884c66abd5a75b37b3bb6a.jpg', '盒', '10只/盒', 'admin', '点滴必备', '60', '1', '2021-12-10 18:23:26', '2021-12-18 20:11:39', '0', '3');
INSERT INTO `good_info` VALUES ('5', '3', '酒精棉', 'http://localhost:8081/img/2021/12/daa919ce70ea4b2f8b11fa9a5bba631a.jpg', '箱', '20包/箱', 'admin', '消毒用', '30', '1', '2021-12-11 09:18:15', '2021-12-11 09:29:44', '0', '3');

-- ----------------------------
-- Table structure for good_stock
-- ----------------------------
DROP TABLE IF EXISTS `good_stock`;
CREATE TABLE `good_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '出入库信息id',
  `accept` varchar(60) DEFAULT NULL COMMENT '去向',
  `create_by` varchar(50) DEFAULT NULL COMMENT '操作人',
  `good_num` int(11) DEFAULT NULL COMMENT '物资数量',
  `good_size` varchar(50) DEFAULT NULL COMMENT '物资规格',
  `good_name` varchar(50) DEFAULT NULL COMMENT '物资名',
  `people_name` varchar(50) DEFAULT NULL COMMENT '联系人',
  `people_phone` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `operate_type` int(1) DEFAULT '1' COMMENT '操作类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  `version` int(11) DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='物资出入库表';

-- ----------------------------
-- Records of good_stock
-- ----------------------------
INSERT INTO `good_stock` VALUES ('1', '大数据学院仓库', 'admin', '20', '打', '冰露饮用水', '范晨', '17730312784', '0', '第一次物品入库', '2021-12-11 19:12:44', '2021-12-11 19:12:44', '0', '1');
INSERT INTO `good_stock` VALUES ('2', '大数据学院仓库', 'admin', '10', '打', '冰露饮用水', '范晨', '17730312784', '0', '第二次物资入库', '2021-12-11 19:18:23', '2021-12-11 19:18:23', '0', '1');
INSERT INTO `good_stock` VALUES ('3', '大数据学院仓库', 'admin', '10', '包', '医用口罩', '范晨', '17730312784', '0', '第二次物资入库', '2021-12-11 19:18:23', '2021-12-11 19:18:23', '0', '1');
INSERT INTO `good_stock` VALUES ('4', '大数据学院仓库', 'admin', '10', '盒', '葡萄糖', '范晨', '17730312784', '0', '第二次物资入库', '2021-12-11 19:18:23', '2021-12-11 19:18:23', '0', '1');
INSERT INTO `good_stock` VALUES ('5', '西太湖保安厅', 'admin', '5', '打', '冰露饮用水', '杜东亮', '19851920613', '1', '给保安搞点水喝喝', '2021-12-11 20:52:31', '2021-12-11 20:52:31', '0', '1');
INSERT INTO `good_stock` VALUES ('6', '刘国钧学院仓库', '赵丹妮', '30', '盒', 'N95口罩', '赵丹妮', '18855331293', '0', '入库刘国钧学院仓库', '2021-12-13 14:12:48', '2021-12-13 14:12:48', '0', '1');
INSERT INTO `good_stock` VALUES ('7', '大数据学院仓库', 'admin', '5', '打', '冰露饮用水', '范晨', '17730312784', '0', '入库', '2021-12-17 12:47:25', '2021-12-17 12:47:25', '0', '1');
INSERT INTO `good_stock` VALUES ('8', '大数据学院仓库', 'admin', '10', '包', '医用口罩', '范晨', '17730312784', '0', '入库', '2021-12-17 12:47:25', '2021-12-17 12:47:25', '0', '1');

-- ----------------------------
-- Table structure for good_type
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物资类型id',
  `type` varchar(30) DEFAULT NULL COMMENT '物资类型',
  `order_num` int(4) DEFAULT NULL COMMENT '排序',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  `version` int(11) DEFAULT '1' COMMENT '乐观锁',
  `remark` varchar(80) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='物资类型表';

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('1', '食物', '1', '1', 'admin', '2021-12-09 16:22:33', '2021-12-09 16:22:36', '0', '1', '可食用的食物');
INSERT INTO `good_type` VALUES ('2', '衣物', '2', '0', 'admin', '2021-12-09 19:04:58', '2021-12-18 20:12:20', '0', '5', '穿的衣服');
INSERT INTO `good_type` VALUES ('3', '医疗用具', '3', '1', 'admin', '2021-12-09 19:06:21', '2021-12-11 09:18:55', '0', '4', '医疗必备');
INSERT INTO `good_type` VALUES ('4', '防护用具', '4', '1', 'admin', '2021-12-09 19:08:08', '2021-12-10 15:10:26', '0', '5', '医护人员穿戴的防护用具');

-- ----------------------------
-- Table structure for health_clock
-- ----------------------------
DROP TABLE IF EXISTS `health_clock`;
CREATE TABLE `health_clock` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '打卡id',
  `username` varchar(50) DEFAULT NULL COMMENT '姓名',
  `health_type` int(1) DEFAULT NULL COMMENT '健康状况',
  `temperature` float(6,1) DEFAULT NULL COMMENT '温度',
  `middle_high` int(1) DEFAULT NULL COMMENT '中高风险',
  `diagnosis` int(1) DEFAULT NULL COMMENT '确诊',
  `return_info` int(1) DEFAULT NULL COMMENT '境外返回',
  `address` varchar(60) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='打卡健康表';

-- ----------------------------
-- Records of health_clock
-- ----------------------------
INSERT INTO `health_clock` VALUES ('1', 'admin', '2', '38.0', '1', '1', '1', '江苏省-苏州市-昆山市', '2021-12-15 14:24:57', '2021-12-15 14:24:57', '103', '0');
INSERT INTO `health_clock` VALUES ('2', 'admin', '2', '38.0', '1', '1', '1', '北京市-市辖区-海淀区', '2021-12-15 14:28:15', '2021-12-15 14:28:15', '103', '0');
INSERT INTO `health_clock` VALUES ('3', 'student', '2', '38.0', '1', '1', '1', '江苏省-南京市-玄武区', '2021-12-15 14:45:49', '2021-12-15 14:45:49', '103', '0');
INSERT INTO `health_clock` VALUES ('4', 'student', '2', '36.9', '1', '1', '1', '江苏省-南京市-建邺区', '2021-12-16 12:30:04', '2021-12-16 12:30:04', '103', '0');
INSERT INTO `health_clock` VALUES ('5', 'admin', '2', '37.1', '1', '1', '1', '江苏省-南京市-秦淮区', '2021-12-16 15:26:04', '2021-12-16 15:26:04', '103', '0');
INSERT INTO `health_clock` VALUES ('6', 'admin', '2', '37.3', '1', '1', '1', '安徽省-芜湖市-无为县', '2021-12-18 20:14:05', '2021-12-18 20:14:05', '103', '0');

-- ----------------------------
-- Table structure for health_report
-- ----------------------------
DROP TABLE IF EXISTS `health_report`;
CREATE TABLE `health_report` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint(11) DEFAULT NULL COMMENT '部门id',
  `phone_number` varchar(50) DEFAULT NULL COMMENT '手机号',
  `img3` varchar(255) DEFAULT NULL COMMENT '核酸报告',
  `img2` varchar(255) DEFAULT NULL COMMENT '行程码',
  `img1` varchar(255) DEFAULT NULL COMMENT '健康码',
  `type` int(1) DEFAULT NULL COMMENT '返校情况',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='二码一报告表';

-- ----------------------------
-- Records of health_report
-- ----------------------------
INSERT INTO `health_report` VALUES ('1', 'admin', '103', '17730312784', 'http://localhost:8081/img/2021/12/09a5984e9a1448a5989396ae02ee2218.jpg', 'http://localhost:8081/img/2021/12/70b927c1e2474706bb7d96e5bf515af7.jpg', 'http://localhost:8081/img/2021/12/ca5ed73630a94883864215d2b4d5ba07.jpg', '1', '2021-12-16 15:05:52', '2021-12-16 15:05:52');
INSERT INTO `health_report` VALUES ('2', 'admin', '103', '17730312784', 'http://localhost:8081/img/2021/12/73054455739a4e4a90999af1badef193.jpg', 'http://localhost:8081/img/2021/12/1ea4667c7734445ebcee993c8166830f.jpg', 'http://localhost:8081/img/2021/12/2402dbf4d1a34efca35abec5d7288770.jpg', '1', '2021-12-16 15:08:29', '2021-12-16 15:08:29');
INSERT INTO `health_report` VALUES ('3', 'admin', '103', '17730312784', 'http://localhost:8081/img/2021/12/3bd20328127a4913880a103997789fa4.jpg', 'http://localhost:8081/img/2021/12/efb111d5de62419ab771d6c310a1e64c.jpg', 'http://localhost:8081/img/2021/12/fe54d296d493481abf39d5b5a197390f.jpg', '0', '2021-12-16 15:13:04', '2021-12-16 15:13:04');
INSERT INTO `health_report` VALUES ('4', 'student', '103', '17730312784', 'http://localhost:8081/img/2021/12/b1fb6d36d7d446d282efa082c4d18887.jpg', 'http://localhost:8081/img/2021/12/d37c7ab0149c407a9487b91926d6a8f9.jpg', 'http://localhost:8081/img/2021/12/73caed944b514424a2f22c32f26701f5.jpg', '0', '2021-12-16 15:15:17', '2021-12-16 15:15:17');
INSERT INTO `health_report` VALUES ('5', 'admin', '103', '17730312784', 'http://localhost:8081/img/2021/12/d8b797f1567c471eae9176232d1d97ad.jpg', 'http://localhost:8081/img/2021/12/41d62d3b8e314ee4b575b238cd9c8bdd.jpg', 'http://localhost:8081/img/2021/12/351a3a4da719497097f7781c5d1e33e1.jpg', '1', '2021-12-18 20:15:04', '2021-12-18 20:15:04');

-- ----------------------------
-- Table structure for leave_apply
-- ----------------------------
DROP TABLE IF EXISTS `leave_apply`;
CREATE TABLE `leave_apply` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint(11) DEFAULT NULL COMMENT '部门id',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假原因',
  `leave_type` int(1) DEFAULT NULL COMMENT '请假类型（1：事假 2：病假）',
  `status` int(1) DEFAULT NULL COMMENT '状态（0：撤销 1：待审核 2：审核通过 3：审核不通过）',
  `student_type` int(1) DEFAULT NULL COMMENT '学生类型（1：本科生 2：研究生 3：博士生）',
  `nickname` varchar(64) DEFAULT NULL COMMENT '学生姓名',
  `time` varchar(64) DEFAULT NULL COMMENT '请假时间区间',
  `day` varchar(50) DEFAULT NULL COMMENT '请假天数',
  `address` varchar(100) DEFAULT NULL COMMENT '目的地',
  `traffic` varchar(50) DEFAULT NULL COMMENT '交通工具',
  `clazz` int(1) DEFAULT NULL COMMENT '是否有课程（1：没有 0：有）',
  `dormitory` varchar(50) DEFAULT NULL COMMENT '宿舍',
  `phone_number` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `exam` int(1) DEFAULT NULL COMMENT '考试（1：没有 0：有）',
  `opinion` varchar(120) DEFAULT NULL COMMENT '审核意见',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='请假审批表';

-- ----------------------------
-- Records of leave_apply
-- ----------------------------
INSERT INTO `leave_apply` VALUES ('1', 'student', '103', '元旦回家和女朋友约会', '1', '2', '3', '学生用户', '2022-01-01 至 2022-01-03', '3', '安徽芜湖', '高铁G7774', '1', '7-540', '17730312784', '1', '合情合理 允许你请假', '2021-12-18 13:30:12', '2021-12-18 20:20:53', '0');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` int(1) DEFAULT '1' COMMENT '部门状态（1正常 0停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(1) DEFAULT '0',
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '常州大学', '0', '校长', '15888888888', 'asdas@qq.com', '1', 'admin', '2021-11-29 18:52:24', '', '2021-12-17 19:37:07', '0', '4');
INSERT INTO `sys_dept` VALUES ('101', '100', '西太湖校区', '1', '范晨', '16888888888', '1571025887@qq.com', '1', 'admin', '2021-11-29 18:52:24', '', '2021-12-03 18:51:45', '0', '2');
INSERT INTO `sys_dept` VALUES ('102', '100', '科教城校区', '2', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-03 18:52:18', '0', '2');
INSERT INTO `sys_dept` VALUES ('103', '101', '阿里云大数据学院', '1', '杜东亮', '19851922596', '2473786752@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:35:27', '0', '3');
INSERT INTO `sys_dept` VALUES ('104', '101', '刘国钧学院', '2', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:35:40', '0', '2');
INSERT INTO `sys_dept` VALUES ('105', '101', '商学院', '3', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:35:58', '0', '2');
INSERT INTO `sys_dept` VALUES ('106', '101', '机械学院', '4', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:36:09', '0', '2');
INSERT INTO `sys_dept` VALUES ('107', '101', '运维部门', '5', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', null, '1', '1');
INSERT INTO `sys_dept` VALUES ('108', '102', '艺术学院', '1', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:36:18', '0', '2');
INSERT INTO `sys_dept` VALUES ('109', '102', '工学院', '2', '范晨', '15888888888', 'ry@qq.com', '1', 'admin', '2021-11-29 18:52:25', '', '2021-12-17 19:36:38', '0', '2');
INSERT INTO `sys_dept` VALUES ('200', '102', '石油化工学院', '3', '倪兴林', '19851920126', 'xigongnei942@163.com', '1', '', '2021-12-03 18:57:54', '', '2021-12-17 19:36:55', '0', '2');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ip` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(100) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` int(1) DEFAULT '1' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(100) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES ('1', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 10:20:26');
INSERT INTO `sys_login_info` VALUES ('2', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 12:32:23');
INSERT INTO `sys_login_info` VALUES ('3', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 14:03:27');
INSERT INTO `sys_login_info` VALUES ('4', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 14:47:12');
INSERT INTO `sys_login_info` VALUES ('5', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 16:23:23');
INSERT INTO `sys_login_info` VALUES ('6', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 18:24:31');
INSERT INTO `sys_login_info` VALUES ('7', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-05 21:41:17');
INSERT INTO `sys_login_info` VALUES ('8', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 13:01:58');
INSERT INTO `sys_login_info` VALUES ('9', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 14:31:34');
INSERT INTO `sys_login_info` VALUES ('10', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 15:42:14');
INSERT INTO `sys_login_info` VALUES ('11', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 16:01:26');
INSERT INTO `sys_login_info` VALUES ('12', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 16:07:06');
INSERT INTO `sys_login_info` VALUES ('13', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 16:30:32');
INSERT INTO `sys_login_info` VALUES ('14', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 16:30:55');
INSERT INTO `sys_login_info` VALUES ('15', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 18:53:25');
INSERT INTO `sys_login_info` VALUES ('16', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:02:58');
INSERT INTO `sys_login_info` VALUES ('17', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:05:28');
INSERT INTO `sys_login_info` VALUES ('18', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:09:25');
INSERT INTO `sys_login_info` VALUES ('19', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '用户名或密码错误', '2021-12-06 19:16:06');
INSERT INTO `sys_login_info` VALUES ('20', 'admin1', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:16:40');
INSERT INTO `sys_login_info` VALUES ('21', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:17:02');
INSERT INTO `sys_login_info` VALUES ('22', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:35:17');
INSERT INTO `sys_login_info` VALUES ('23', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '用户名或密码错误', '2021-12-06 19:57:32');
INSERT INTO `sys_login_info` VALUES ('24', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:57:51');
INSERT INTO `sys_login_info` VALUES ('25', 'test', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 19:59:26');
INSERT INTO `sys_login_info` VALUES ('26', 'test', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '用户名或密码错误', '2021-12-06 20:01:01');
INSERT INTO `sys_login_info` VALUES ('27', 'test', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-06 20:01:14');
INSERT INTO `sys_login_info` VALUES ('28', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 09:28:34');
INSERT INTO `sys_login_info` VALUES ('29', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '验证码错误', '2021-12-07 10:41:03');
INSERT INTO `sys_login_info` VALUES ('30', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 10:41:07');
INSERT INTO `sys_login_info` VALUES ('31', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 11:43:56');
INSERT INTO `sys_login_info` VALUES ('32', 'test', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '用户名或密码错误', '2021-12-07 12:14:09');
INSERT INTO `sys_login_info` VALUES ('33', 'test', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 12:14:20');
INSERT INTO `sys_login_info` VALUES ('34', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 12:16:33');
INSERT INTO `sys_login_info` VALUES ('35', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 12:26:31');
INSERT INTO `sys_login_info` VALUES ('36', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 16:00:07');
INSERT INTO `sys_login_info` VALUES ('37', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 17:03:06');
INSERT INTO `sys_login_info` VALUES ('38', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 18:09:38');
INSERT INTO `sys_login_info` VALUES ('39', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 18:37:20');
INSERT INTO `sys_login_info` VALUES ('40', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 18:37:46');
INSERT INTO `sys_login_info` VALUES ('41', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 19:42:42');
INSERT INTO `sys_login_info` VALUES ('42', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-07 21:32:25');
INSERT INTO `sys_login_info` VALUES ('43', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 12:28:54');
INSERT INTO `sys_login_info` VALUES ('44', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 15:14:29');
INSERT INTO `sys_login_info` VALUES ('45', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 16:32:03');
INSERT INTO `sys_login_info` VALUES ('46', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 17:49:09');
INSERT INTO `sys_login_info` VALUES ('47', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 18:53:35');
INSERT INTO `sys_login_info` VALUES ('48', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 19:57:49');
INSERT INTO `sys_login_info` VALUES ('49', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-08 21:04:41');
INSERT INTO `sys_login_info` VALUES ('50', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 08:39:57');
INSERT INTO `sys_login_info` VALUES ('51', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 10:30:19');
INSERT INTO `sys_login_info` VALUES ('52', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 12:36:52');
INSERT INTO `sys_login_info` VALUES ('53', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 13:37:37');
INSERT INTO `sys_login_info` VALUES ('54', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 14:41:41');
INSERT INTO `sys_login_info` VALUES ('55', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 16:23:46');
INSERT INTO `sys_login_info` VALUES ('56', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 17:44:18');
INSERT INTO `sys_login_info` VALUES ('57', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-09 19:04:44');
INSERT INTO `sys_login_info` VALUES ('58', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 09:28:29');
INSERT INTO `sys_login_info` VALUES ('59', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 10:29:36');
INSERT INTO `sys_login_info` VALUES ('60', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 13:07:19');
INSERT INTO `sys_login_info` VALUES ('61', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 14:46:01');
INSERT INTO `sys_login_info` VALUES ('62', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 15:53:24');
INSERT INTO `sys_login_info` VALUES ('63', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 16:54:44');
INSERT INTO `sys_login_info` VALUES ('64', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 17:57:29');
INSERT INTO `sys_login_info` VALUES ('65', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 19:20:48');
INSERT INTO `sys_login_info` VALUES ('66', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 20:24:18');
INSERT INTO `sys_login_info` VALUES ('67', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-10 22:18:53');
INSERT INTO `sys_login_info` VALUES ('68', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 07:52:13');
INSERT INTO `sys_login_info` VALUES ('69', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 09:17:08');
INSERT INTO `sys_login_info` VALUES ('70', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 09:40:51');
INSERT INTO `sys_login_info` VALUES ('71', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 09:41:21');
INSERT INTO `sys_login_info` VALUES ('72', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 10:45:31');
INSERT INTO `sys_login_info` VALUES ('73', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 12:28:38');
INSERT INTO `sys_login_info` VALUES ('74', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 13:29:34');
INSERT INTO `sys_login_info` VALUES ('75', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 14:30:06');
INSERT INTO `sys_login_info` VALUES ('76', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 16:01:33');
INSERT INTO `sys_login_info` VALUES ('77', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 17:28:57');
INSERT INTO `sys_login_info` VALUES ('78', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 18:30:18');
INSERT INTO `sys_login_info` VALUES ('79', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 19:30:34');
INSERT INTO `sys_login_info` VALUES ('80', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-11 20:30:51');
INSERT INTO `sys_login_info` VALUES ('81', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 13:18:41');
INSERT INTO `sys_login_info` VALUES ('82', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 14:34:38');
INSERT INTO `sys_login_info` VALUES ('83', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 15:37:44');
INSERT INTO `sys_login_info` VALUES ('84', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 19:07:58');
INSERT INTO `sys_login_info` VALUES ('85', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 19:18:01');
INSERT INTO `sys_login_info` VALUES ('86', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 19:25:10');
INSERT INTO `sys_login_info` VALUES ('87', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-12 23:21:08');
INSERT INTO `sys_login_info` VALUES ('88', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 13:12:16');
INSERT INTO `sys_login_info` VALUES ('89', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 14:04:41');
INSERT INTO `sys_login_info` VALUES ('90', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 14:08:15');
INSERT INTO `sys_login_info` VALUES ('91', '范晨', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 14:09:01');
INSERT INTO `sys_login_info` VALUES ('92', '赵丹妮', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 14:11:37');
INSERT INTO `sys_login_info` VALUES ('93', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-13 20:43:55');
INSERT INTO `sys_login_info` VALUES ('94', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 09:09:51');
INSERT INTO `sys_login_info` VALUES ('95', 'danny', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 09:11:29');
INSERT INTO `sys_login_info` VALUES ('96', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 09:12:44');
INSERT INTO `sys_login_info` VALUES ('97', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 10:12:54');
INSERT INTO `sys_login_info` VALUES ('98', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 10:41:29');
INSERT INTO `sys_login_info` VALUES ('99', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 10:41:43');
INSERT INTO `sys_login_info` VALUES ('100', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 11:44:14');
INSERT INTO `sys_login_info` VALUES ('101', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 17:55:28');
INSERT INTO `sys_login_info` VALUES ('102', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 18:57:59');
INSERT INTO `sys_login_info` VALUES ('103', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 18:59:04');
INSERT INTO `sys_login_info` VALUES ('104', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-14 18:59:38');
INSERT INTO `sys_login_info` VALUES ('105', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 09:47:39');
INSERT INTO `sys_login_info` VALUES ('106', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 12:06:44');
INSERT INTO `sys_login_info` VALUES ('107', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 13:07:31');
INSERT INTO `sys_login_info` VALUES ('108', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 14:24:36');
INSERT INTO `sys_login_info` VALUES ('109', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 14:44:19');
INSERT INTO `sys_login_info` VALUES ('110', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 14:44:34');
INSERT INTO `sys_login_info` VALUES ('111', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 14:45:29');
INSERT INTO `sys_login_info` VALUES ('112', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 14:46:26');
INSERT INTO `sys_login_info` VALUES ('113', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 15:57:33');
INSERT INTO `sys_login_info` VALUES ('114', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 17:20:42');
INSERT INTO `sys_login_info` VALUES ('115', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 18:27:34');
INSERT INTO `sys_login_info` VALUES ('116', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 18:30:38');
INSERT INTO `sys_login_info` VALUES ('117', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-15 18:31:18');
INSERT INTO `sys_login_info` VALUES ('118', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 12:25:41');
INSERT INTO `sys_login_info` VALUES ('119', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 12:26:14');
INSERT INTO `sys_login_info` VALUES ('120', 'danny', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 12:26:30');
INSERT INTO `sys_login_info` VALUES ('121', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 12:27:54');
INSERT INTO `sys_login_info` VALUES ('122', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 12:29:43');
INSERT INTO `sys_login_info` VALUES ('123', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 13:45:43');
INSERT INTO `sys_login_info` VALUES ('124', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 14:59:34');
INSERT INTO `sys_login_info` VALUES ('125', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:12:42');
INSERT INTO `sys_login_info` VALUES ('126', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:14:39');
INSERT INTO `sys_login_info` VALUES ('127', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:15:00');
INSERT INTO `sys_login_info` VALUES ('128', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:15:42');
INSERT INTO `sys_login_info` VALUES ('129', 'danny', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:17:13');
INSERT INTO `sys_login_info` VALUES ('130', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:17:39');
INSERT INTO `sys_login_info` VALUES ('131', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:17:57');
INSERT INTO `sys_login_info` VALUES ('132', 'danny', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:32:20');
INSERT INTO `sys_login_info` VALUES ('133', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 15:32:55');
INSERT INTO `sys_login_info` VALUES ('134', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 17:21:11');
INSERT INTO `sys_login_info` VALUES ('135', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '用户名或密码错误', '2021-12-16 18:02:48');
INSERT INTO `sys_login_info` VALUES ('136', 'fanchen', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 18:03:00');
INSERT INTO `sys_login_info` VALUES ('137', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 18:03:29');
INSERT INTO `sys_login_info` VALUES ('138', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-16 19:07:23');
INSERT INTO `sys_login_info` VALUES ('139', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 12:15:24');
INSERT INTO `sys_login_info` VALUES ('140', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 13:19:53');
INSERT INTO `sys_login_info` VALUES ('141', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 14:22:15');
INSERT INTO `sys_login_info` VALUES ('142', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 15:24:34');
INSERT INTO `sys_login_info` VALUES ('143', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 17:46:10');
INSERT INTO `sys_login_info` VALUES ('144', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 18:47:52');
INSERT INTO `sys_login_info` VALUES ('145', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 19:54:22');
INSERT INTO `sys_login_info` VALUES ('146', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 20:28:05');
INSERT INTO `sys_login_info` VALUES ('147', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-17 20:46:07');
INSERT INTO `sys_login_info` VALUES ('148', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 10:30:19');
INSERT INTO `sys_login_info` VALUES ('149', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 12:00:58');
INSERT INTO `sys_login_info` VALUES ('150', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 13:15:28');
INSERT INTO `sys_login_info` VALUES ('151', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 14:16:14');
INSERT INTO `sys_login_info` VALUES ('152', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 15:08:07');
INSERT INTO `sys_login_info` VALUES ('153', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 16:38:51');
INSERT INTO `sys_login_info` VALUES ('154', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 16:39:02');
INSERT INTO `sys_login_info` VALUES ('155', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 16:39:33');
INSERT INTO `sys_login_info` VALUES ('156', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 16:39:56');
INSERT INTO `sys_login_info` VALUES ('157', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 17:41:54');
INSERT INTO `sys_login_info` VALUES ('158', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 17:42:53');
INSERT INTO `sys_login_info` VALUES ('159', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 18:16:49');
INSERT INTO `sys_login_info` VALUES ('160', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 18:42:38');
INSERT INTO `sys_login_info` VALUES ('161', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 18:45:36');
INSERT INTO `sys_login_info` VALUES ('162', 'service', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 18:49:35');
INSERT INTO `sys_login_info` VALUES ('163', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 19:51:25');
INSERT INTO `sys_login_info` VALUES ('164', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 19:59:34');
INSERT INTO `sys_login_info` VALUES ('165', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 20:01:08');
INSERT INTO `sys_login_info` VALUES ('166', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 20:17:08');
INSERT INTO `sys_login_info` VALUES ('167', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '0', '验证码错误', '2021-12-18 20:18:27');
INSERT INTO `sys_login_info` VALUES ('168', 'teacher', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 20:18:33');
INSERT INTO `sys_login_info` VALUES ('169', 'student', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 20:21:08');
INSERT INTO `sys_login_info` VALUES ('170', 'admin', '127.0.0.1', ' 本机地址', 'Chrome 9', 'Windows 10', '1', '登陆成功', '2021-12-18 20:21:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(64) NOT NULL COMMENT '菜单名',
  `path` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(255) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `component` varchar(255) DEFAULT NULL,
  `type` int(5) NOT NULL COMMENT '类型     0：目录   1：菜单   2：按钮',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(5) NOT NULL,
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', 'sys:manage', '', '0', 'el-icon-s-operation', '1', '2021-01-15 18:58:18', '2021-01-15 18:58:20', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', '/sys/user', 'sys:user:list', 'sys/User', '1', 'el-icon-s-custom', '1', '2021-01-15 19:03:45', '2021-01-15 19:03:48', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', '/sys/role', 'sys:role:list', 'sys/Role', '1', 'el-icon-s-promotion', '2', '2021-01-15 19:03:45', '2021-12-01 18:12:43', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', '/sys/menu', 'sys:menu:list', 'sys/Menu', '1', 'el-icon-menu', '3', '2021-01-15 19:03:45', '2021-01-15 19:03:48', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('5', '0', '系统工具', '', 'sys:tools', null, '0', 'el-icon-s-tools', '2', '2021-01-15 19:06:11', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('6', '5', '登录日志', '/sys/loginInfo', 'sys:login:list', 'sys/LoginInfo', '1', 'el-icon-s-order', '1', '2021-01-15 19:07:18', '2021-12-04 19:03:11', '1', '0', '6');
INSERT INTO `sys_menu` VALUES ('7', '3', '添加角色', '', 'sys:role:save', '', '2', '', '1', '2021-01-15 23:02:25', '2021-01-17 21:53:14', '0', '0', '1');
INSERT INTO `sys_menu` VALUES ('9', '2', '添加用户', null, 'sys:user:save', null, '2', null, '1', '2021-01-17 21:48:32', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('10', '2', '修改用户', null, 'sys:user:update', null, '2', null, '2', '2021-01-17 21:49:03', '2021-01-17 21:53:04', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('11', '2', '删除用户', null, 'sys:user:delete', null, '2', null, '3', '2021-01-17 21:49:21', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('12', '2', '分配角色', null, 'sys:user:role', null, '2', null, '4', '2021-01-17 21:49:58', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('13', '2', '重置密码', null, 'sys:user:repass', null, '2', null, '5', '2021-01-17 21:50:36', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('14', '3', '修改角色', null, 'sys:role:update', null, '2', null, '2', '2021-01-17 21:51:14', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('15', '3', '删除角色', null, 'sys:role:delete', null, '2', null, '3', '2021-01-17 21:51:39', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('16', '3', '分配权限', null, 'sys:role:perm', null, '2', null, '4', '2021-01-17 21:52:02', '2021-12-03 14:54:45', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('17', '4', '添加菜单', null, 'sys:menu:save', null, '2', null, '1', '2021-01-17 21:53:53', '2021-01-17 21:55:28', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('18', '4', '修改菜单', null, 'sys:menu:update', null, '2', null, '2', '2021-01-17 21:56:12', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('19', '4', '删除菜单', null, 'sys:menu:delete', null, '2', null, '3', '2021-01-17 21:56:36', null, '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('21', '1', '部门管理', '/sys/dept', 'sys:dept:list', 'sys/Dept', '1', 'el-icon-s-data', '4', '2021-12-03 14:50:45', '2021-12-03 14:51:08', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('22', '21', '添加部门', null, 'sys:dept:save', null, '2', '', '1', '2021-12-03 14:52:52', '2021-12-03 14:52:52', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('23', '21', '修改部门', null, 'sys:dept:update', null, '2', '', '2', '2021-12-03 14:53:25', '2021-12-03 14:53:25', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('24', '21', '删除部门', null, 'sys:dept:delete', null, '2', '', '3', '2021-12-03 14:53:52', '2021-12-03 14:53:52', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('25', '5', '数据监控', '/monitor/druid', 'monitor:druid:list', 'monitor/Druid', '1', 'el-icon-set-up', '3', '2021-12-03 21:00:35', '2021-12-07 19:35:06', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('26', '5', '系统接口', '/monitor/swagger', 'monitor:swagger:list', 'monitor/Swagger', '1', 'el-icon-more', '5', '2021-12-03 22:01:41', '2021-12-07 19:35:18', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('27', '5', '服务监控', '/monitor/server', 'monitor:server:list', 'monitor/Server', '1', 'el-icon-cpu', '4', '2021-12-03 22:59:56', '2021-12-03 22:59:56', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('28', '5', '操作日志', '/monitor/operate', 'monitor:operate:list', 'monitor/Operate', '1', 'el-icon-s-platform', '2', '2021-12-05 14:45:08', '2021-12-07 19:35:01', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('29', '6', '删除登录日志', null, 'sys:login:delete', null, '2', '', '1', '2021-12-07 18:31:50', '2021-12-07 18:34:56', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('30', '6', '清空登录日志', null, 'sys:login:clear', null, '2', '', '2', '2021-12-07 18:32:10', '2021-12-07 18:35:03', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('32', '28', '删除操作日志', null, 'monitor:operate:delete', null, '2', '', '1', '2021-12-07 18:35:20', '2021-12-07 18:35:20', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('33', '28', '清空操作日志', null, 'monitor:operate:clear', null, '2', '', '1', '2021-12-07 18:35:36', '2021-12-07 18:35:36', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('34', '0', '物资管理', null, 'good:manage', null, '0', 'el-icon-goods', '3', '2021-12-09 14:42:21', '2021-12-09 14:42:21', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('35', '34', '物资资料', '/good/info', 'good:info:list', 'good/Info', '1', 'el-icon-odometer', '1', '2021-12-09 14:52:35', '2021-12-09 14:52:35', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('36', '34', '物资分类', '/good/type', 'good:type:list', 'good/Type', '1', 'el-icon-s-open', '2', '2021-12-09 15:07:51', '2021-12-09 15:07:51', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('37', '34', '物资库存', '/good/total', 'good:total:list', 'good/Total', '1', 'el-icon-set-up', '3', '2021-12-10 18:31:27', '2021-12-10 18:31:27', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('38', '34', '物资出入库', '/good/stock', 'good:stock:list', 'good/Stock', '1', 'el-icon-s-data', '4', '2021-12-11 09:39:26', '2021-12-11 09:39:26', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('39', '35', '添加物资', null, 'good:info:save', null, '2', '', '1', '2021-12-12 15:19:21', '2021-12-12 15:19:21', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('40', '35', '更新物资', null, 'good:info:update', null, '2', '', '2', '2021-12-12 15:20:10', '2021-12-12 15:20:57', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('41', '35', '删除物资', null, 'good:info:delete', null, '2', '', '3', '2021-12-12 15:20:51', '2021-12-12 15:20:51', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('42', '36', '添加分类', null, 'good:type:save', null, '2', '', '1', '2021-12-12 15:21:48', '2021-12-12 15:21:48', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('43', '36', '更新分类', null, 'good:type:update', null, '2', '', '2', '2021-12-12 15:22:08', '2021-12-12 15:22:35', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('44', '36', '删除分类', null, 'good:type:delete', null, '2', '', '3', '2021-12-12 15:22:30', '2021-12-12 15:22:30', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('45', '38', '出入库', null, 'good:stock:operate', null, '2', '', '1', '2021-12-12 15:23:35', '2021-12-12 15:23:35', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('46', '0', '健康管理', null, 'health:manage', null, '0', 'el-icon-location', '4', '2021-12-13 20:44:35', '2021-12-13 20:44:35', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('47', '46', '健康打卡', '/health/clock', 'health:clock:save', 'health/Clock', '1', 'el-icon-s-promotion', '1', '2021-12-14 09:17:41', '2021-12-14 09:17:41', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('48', '46', '打卡信息', '/health/clockInfo', 'health:clock:list', 'health/ClockInfo', '1', 'el-icon-s-opportunity', '2', '2021-12-14 09:19:59', '2021-12-14 09:22:09', '1', '0', '2');
INSERT INTO `sys_menu` VALUES ('49', '46', '二码一报告', '/health/report', 'health:report:save', 'health/Report', '1', 'el-icon-chat-round', '3', '2021-12-14 09:21:57', '2021-12-14 09:21:57', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('50', '46', '报告信息', '/health/reportInfo', 'health:report:list', 'health/ReportInfo', '1', 'el-icon-s-data', '4', '2021-12-14 09:23:48', '2021-12-14 09:23:48', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('51', '0', '出行管理', null, 'access:manage', null, '0', 'el-icon-user-solid', '5', '2021-12-16 18:45:38', '2021-12-16 18:45:38', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('52', '51', '出入登记', '/access/register', 'access:register:list', 'access/Register', '1', 'el-icon-s-platform', '1', '2021-12-16 18:50:55', '2021-12-16 18:50:55', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('53', '51', '未归人员', '/access/return', 'access:return:list', 'access/Return', '1', 'el-icon-phone', '2', '2021-12-17 15:17:30', '2021-12-17 15:17:30', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('54', '0', '请假管理', '', 'leave:manage', null, '0', 'el-icon-paperclip', '6', '2021-12-17 18:25:58', '2021-12-17 18:25:58', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('55', '54', '请假申请', '/leave/apply', 'leave:apply:list', 'leave/Apply', '1', 'el-icon-s-promotion', '1', '2021-12-17 18:28:13', '2021-12-17 18:28:13', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('56', '54', '请假记录', '/leave/record', 'leave:record:list', 'leave/Record', '1', 'el-icon-s-platform', '2', '2021-12-17 18:29:23', '2021-12-17 18:29:23', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('58', '52', '添加记录', null, 'access:register:save', null, '2', '', '1', '2021-12-18 18:57:18', '2021-12-18 18:57:18', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('59', '55', '新增请假', null, 'leave:apply:save', null, '2', '', '1', '2021-12-18 18:58:10', '2021-12-18 18:58:10', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('60', '56', '审核请假', null, 'leave:record:examine', null, '2', '', '1', '2021-12-18 18:59:24', '2021-12-18 18:59:24', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('61', '55', '修改请假', null, 'leave:apply:update', null, '2', '', '2', '2021-12-18 19:08:52', '2021-12-18 19:08:52', '1', '0', '1');

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_log`;
CREATE TABLE `sys_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(50) DEFAULT '' COMMENT '业务类型',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `oper_name` varchar(50) DEFAULT NULL COMMENT '操作人',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '1' COMMENT '操作状态（1正常 0异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_operate_log
-- ----------------------------
INSERT INTO `sys_operate_log` VALUES ('1', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1638711692585,\"remark\":\"test test test test test\",\"avatar\":\"https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png\",\"version\":10,\"phoneNumber\":\"15751852211\",\"createTime\":1638497336000,\"id\":3,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-05 21:41:33');
INSERT INTO `sys_operate_log` VALUES ('2', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1638711765927,\"remark\":\"test test test test test\",\"avatar\":\"https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png\",\"version\":11,\"phoneNumber\":\"15751852211\",\"createTime\":1638497336000,\"id\":3,\"username\":\"fanchen\",\"status\":0}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-05 21:42:46');
INSERT INTO `sys_operate_log` VALUES ('3', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1638711768726,\"remark\":\"test test test test test\",\"avatar\":\"https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png\",\"version\":12,\"phoneNumber\":\"15751852211\",\"createTime\":1638497336000,\"id\":3,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-05 21:42:49');
INSERT INTO `sys_operate_log` VALUES ('4', '用户管理', '分配角色', 'com.fanchen.controller.SysUserController.userRole()', 'POST', '/sys/user/userRole/3', '127.0.0.1', ' 本机地址', '{} [8,9] {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"操作成功！\"}', '1', '', '2021-12-05 21:43:34');
INSERT INTO `sys_operate_log` VALUES ('5', '用户管理', '重置密码', 'com.fanchen.controller.SysUserController.resetPwd()', 'POST', '/sys/user/reset', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1638711918135,\"remark\":\"test test test test test\",\"avatar\":\"https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png\",\"version\":13,\"password\":\"$2a$10$fZAJlgvWX8CDdAgyPEc3neyY.47mS2s0sBXXDIPsyfbw/noALntRW\",\"phoneNumber\":\"15751852211\",\"createTime\":1638497336000,\"id\":3,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"重置密码成功！\"}', '1', '', '2021-12-05 21:45:18');
INSERT INTO `sys_operate_log` VALUES ('6', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"normal\",\"isDelete\":0,\"remark\":\"只有基本查看功能\",\"updateTime\":1638792009692,\"version\":10,\"createTime\":1609726154000,\"name\":\"普通用户\",\"id\":3,\"menuIds\":[1,2,3,4,21],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-06 20:00:10');
INSERT INTO `sys_operate_log` VALUES ('7', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873110215,\"type\":2,\"parentId\":6,\"createTime\":1638873110215,\"children\":[],\"name\":\"删除日志\",\"perms\":\"sys:login:delete\",\"id\":29,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-07 18:31:50');
INSERT INTO `sys_operate_log` VALUES ('8', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":2,\"updateTime\":1638873130225,\"type\":2,\"parentId\":6,\"createTime\":1638873130225,\"children\":[],\"name\":\"清空日志\",\"perms\":\"sys:login:clear\",\"id\":30,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-07 18:32:10');
INSERT INTO `sys_operate_log` VALUES ('9', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1638873167023,\"version\":9,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,25,26,27,28],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 18:32:47');
INSERT INTO `sys_operate_log` VALUES ('10', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873296337,\"type\":2,\"version\":2,\"parentId\":6,\"createTime\":1638873110000,\"children\":[],\"name\":\"删除登录日志\",\"perms\":\"sys:login:delete\",\"id\":29,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 18:34:56');
INSERT INTO `sys_operate_log` VALUES ('11', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"\",\"orderNum\":2,\"updateTime\":1638873302727,\"type\":2,\"version\":2,\"parentId\":6,\"createTime\":1638873130000,\"children\":[],\"name\":\"清空登录日志\",\"perms\":\"sys:login:clear\",\"id\":30,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 18:35:03');
INSERT INTO `sys_operate_log` VALUES ('12', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873319925,\"type\":2,\"parentId\":28,\"createTime\":1638873319925,\"children\":[],\"name\":\"删除操作日志\",\"perms\":\"monitor:operate:delete\",\"id\":32,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-07 18:35:20');
INSERT INTO `sys_operate_log` VALUES ('13', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873336370,\"type\":2,\"parentId\":28,\"createTime\":1638873336370,\"children\":[],\"name\":\"清空操作日志\",\"perms\":\"monitor:operate:clear\",\"id\":33,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-07 18:35:36');
INSERT INTO `sys_operate_log` VALUES ('14', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1638873410685,\"version\":10,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,25,26,27,28,32,33],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 18:36:51');
INSERT INTO `sys_operate_log` VALUES ('15', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"el-icon-s-platform\",\"orderNum\":2,\"updateTime\":1638876900659,\"type\":1,\"version\":2,\"parentId\":5,\"path\":\"/monitor/operate\",\"component\":\"monitor/Operate\",\"createTime\":1638686708000,\"children\":[{\"isDelete\":0,\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873320000,\"type\":2,\"version\":1,\"parentId\":28,\"createTime\":1638873320000,\"children\":[],\"name\":\"删除操作日志\",\"perms\":\"monitor:operate:delete\",\"id\":32,\"status\":1},{\"isDelete\":0,\"icon\":\"\",\"orderNum\":1,\"updateTime\":1638873336000,\"type\":2,\"version\":1,\"parentId\":28,\"createTime\":1638873336000,\"children\":[],\"name\":\"清空操作日志\",\"perms\":\"monitor:operate:clear\",\"id\":33,\"status\":1}],\"name\":\"操作日志\",\"perms\":\"monitor:operate:list\",\"id\":28,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 19:35:01');
INSERT INTO `sys_operate_log` VALUES ('16', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"el-icon-set-up\",\"orderNum\":3,\"updateTime\":1638876905903,\"type\":1,\"version\":2,\"parentId\":5,\"path\":\"/monitor/druid\",\"component\":\"monitor/Druid\",\"createTime\":1638536435000,\"children\":[],\"name\":\"数据监控\",\"perms\":\"monitor:druid:list\",\"id\":25,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 19:35:06');
INSERT INTO `sys_operate_log` VALUES ('17', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"el-icon-more\",\"orderNum\":5,\"updateTime\":1638876917831,\"type\":1,\"version\":2,\"parentId\":5,\"path\":\"/monitor/swagger\",\"component\":\"monitor/Swagger\",\"createTime\":1638540101000,\"children\":[],\"name\":\"系统接口\",\"perms\":\"monitor:swagger:list\",\"id\":26,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-07 19:35:18');
INSERT INTO `sys_operate_log` VALUES ('18', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-goods\",\"orderNum\":3,\"updateTime\":1639032141219,\"type\":0,\"parentId\":0,\"createTime\":1639032141219,\"children\":[],\"name\":\"物资管理\",\"id\":34,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-09 14:42:21');
INSERT INTO `sys_operate_log` VALUES ('19', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-odometer\",\"orderNum\":1,\"updateTime\":1639032755265,\"type\":1,\"parentId\":34,\"path\":\"/good/info\",\"component\":\"good/Info\",\"createTime\":1639032755265,\"children\":[],\"name\":\"物资资料\",\"perms\":\"good:info:list\",\"id\":35,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-09 14:52:35');
INSERT INTO `sys_operate_log` VALUES ('20', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639032923803,\"version\":11,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-09 14:55:24');
INSERT INTO `sys_operate_log` VALUES ('21', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-open\",\"orderNum\":2,\"updateTime\":1639033671181,\"type\":1,\"parentId\":34,\"path\":\"/good/type\",\"component\":\"good/Type\",\"createTime\":1639033671181,\"children\":[],\"name\":\"物资分类\",\"perms\":\"good:type:list\",\"id\":36,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-09 15:07:51');
INSERT INTO `sys_operate_log` VALUES ('22', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639034398564,\"version\":12,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-09 15:19:59');
INSERT INTO `sys_operate_log` VALUES ('23', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-07 12:11:42\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/d421e67bfa2141599175399bfedbd5c0.jpg\",\"version\":43,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 15:53:47');
INSERT INTO `sys_operate_log` VALUES ('24', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 15:53:47\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/6a4c999026dc4299adc885033a6b9b2d.jpg\",\"version\":44,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 15:55:26');
INSERT INTO `sys_operate_log` VALUES ('25', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 15:55:26\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/ccd679f7804e4f4b9da3da4009312d4f.jpg\",\"version\":45,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 15:56:36');
INSERT INTO `sys_operate_log` VALUES ('26', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 15:56:36\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/ea0f5b64bb5445f08b2fdc10268c4228.jpg\",\"version\":46,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 17:07:09');
INSERT INTO `sys_operate_log` VALUES ('27', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 15:56:36\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/ea0f5b64bb5445f08b2fdc10268c4228.jpg\",\"version\":46,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"头像上传失败！\",\"code\":400}', '1', '', '2021-12-10 17:07:53');
INSERT INTO `sys_operate_log` VALUES ('28', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 17:07:08\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/5fa05b6e88004f56847de4034ff3254f.jpg\",\"version\":47,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 17:08:25');
INSERT INTO `sys_operate_log` VALUES ('29', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 17:07:08\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/5fa05b6e88004f56847de4034ff3254f.jpg\",\"version\":47,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"头像上传失败！\",\"code\":400}', '1', '', '2021-12-10 17:08:54');
INSERT INTO `sys_operate_log` VALUES ('30', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 17:08:24\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/46af828cb93e464c829a5fca06f2383f.jpg\",\"version\":48,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 17:12:49');
INSERT INTO `sys_operate_log` VALUES ('31', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-10 17:12:49\",\"remark\":\"admin用户的备注信息\",\"avatar\":\"http://localhost:8081/img/2021/12/59d7346f3dc0478087d9e1ad817aa0f9.jpg\",\"version\":49,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-10 17:13:10');
INSERT INTO `sys_operate_log` VALUES ('32', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-set-up\",\"orderNum\":3,\"updateTime\":1639132286734,\"type\":1,\"parentId\":34,\"path\":\"/good/total\",\"component\":\"good/Total\",\"createTime\":1639132286734,\"children\":[],\"name\":\"物资库存\",\"perms\":\"good:total:list\",\"id\":37,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-10 18:31:27');
INSERT INTO `sys_operate_log` VALUES ('33', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639132336612,\"version\":13,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36,37],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-10 18:32:17');
INSERT INTO `sys_operate_log` VALUES ('34', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-data\",\"orderNum\":4,\"updateTime\":1639186766250,\"type\":1,\"parentId\":34,\"path\":\"/good/stock\",\"component\":\"good/Stock\",\"createTime\":1639186766250,\"children\":[],\"name\":\"物资出入库\",\"perms\":\"good:stock:list\",\"id\":38,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-11 09:39:26');
INSERT INTO `sys_operate_log` VALUES ('35', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639186814754,\"version\":14,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36,37,38],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-11 09:40:15');
INSERT INTO `sys_operate_log` VALUES ('36', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"normal\",\"isDelete\":0,\"remark\":\"只有基本查看功能\",\"updateTime\":1639291640620,\"version\":11,\"createTime\":1609726154000,\"name\":\"学生用户\",\"id\":3,\"menuIds\":[1,2,3,4,21],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 14:47:21');
INSERT INTO `sys_operate_log` VALUES ('37', '角色管理', '删除角色', 'com.fanchen.controller.SysRoleController.delete()', 'DELETE', '/sys/role', '127.0.0.1', ' 本机地址', 'org.apache.catalina.util.ParameterMap@24882089', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"删除成功！\"}', '1', '', '2021-12-12 14:47:34');
INSERT INTO `sys_operate_log` VALUES ('38', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"测试专用账户\",\"updateTime\":1639291701934,\"version\":11,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[5,6],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 14:48:22');
INSERT INTO `sys_operate_log` VALUES ('39', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"student\",\"isDelete\":0,\"remark\":\"只有基本查看功能\",\"updateTime\":1639291713523,\"version\":12,\"createTime\":1609726154000,\"name\":\"学生用户\",\"id\":3,\"menuIds\":[1,2,3,4,21],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 14:48:34');
INSERT INTO `sys_operate_log` VALUES ('40', '角色管理', '添加角色', 'com.fanchen.controller.SysRoleController.add()', 'POST', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"service\",\"remark\":\"后勤用户\",\"updateTime\":1639291757635,\"createTime\":1639291757635,\"name\":\"后勤用户\",\"id\":10,\"menuIds\":[34,35,36,37,38],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 14:49:18');
INSERT INTO `sys_operate_log` VALUES ('41', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"service\",\"isDelete\":0,\"remark\":\"后勤的用户角色\",\"updateTime\":1639291802328,\"version\":2,\"createTime\":1639291757000,\"name\":\"后勤用户\",\"id\":10,\"menuIds\":[34,35,36,37,38],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 14:50:02');
INSERT INTO `sys_operate_log` VALUES ('42', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639293561396,\"type\":2,\"parentId\":35,\"createTime\":1639293561396,\"children\":[],\"name\":\"添加物资\",\"perms\":\"good:info:save\",\"id\":39,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:19:21');
INSERT INTO `sys_operate_log` VALUES ('43', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":2,\"updateTime\":1639293610140,\"type\":2,\"parentId\":35,\"createTime\":1639293610140,\"children\":[],\"name\":\"物资更新\",\"perms\":\"good:info:update\",\"id\":40,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:20:10');
INSERT INTO `sys_operate_log` VALUES ('44', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":3,\"updateTime\":1639293650525,\"type\":2,\"parentId\":35,\"createTime\":1639293650525,\"children\":[],\"name\":\"删除物资\",\"perms\":\"good:info:delete\",\"id\":41,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:20:51');
INSERT INTO `sys_operate_log` VALUES ('45', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"\",\"orderNum\":2,\"updateTime\":1639293656792,\"type\":2,\"version\":2,\"parentId\":35,\"createTime\":1639293610000,\"children\":[],\"name\":\"更新物资\",\"perms\":\"good:info:update\",\"id\":40,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 15:20:57');
INSERT INTO `sys_operate_log` VALUES ('46', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639293708279,\"type\":2,\"parentId\":36,\"createTime\":1639293708279,\"children\":[],\"name\":\"添加分类\",\"perms\":\"good:type:save\",\"id\":42,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:21:48');
INSERT INTO `sys_operate_log` VALUES ('47', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639293727549,\"type\":2,\"parentId\":36,\"createTime\":1639293727549,\"children\":[],\"name\":\"更新分类\",\"perms\":\"good:type:update\",\"id\":43,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:22:08');
INSERT INTO `sys_operate_log` VALUES ('48', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":3,\"updateTime\":1639293750401,\"type\":2,\"parentId\":36,\"createTime\":1639293750401,\"children\":[],\"name\":\"删除分类\",\"perms\":\"good:type:delete\",\"id\":44,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:22:30');
INSERT INTO `sys_operate_log` VALUES ('49', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"\",\"orderNum\":2,\"updateTime\":1639293754662,\"type\":2,\"version\":2,\"parentId\":36,\"createTime\":1639293728000,\"children\":[],\"name\":\"更新分类\",\"perms\":\"good:type:update\",\"id\":43,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-12 15:22:35');
INSERT INTO `sys_operate_log` VALUES ('50', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639293814976,\"type\":2,\"parentId\":38,\"createTime\":1639293814976,\"children\":[],\"name\":\"出入库\",\"perms\":\"good:stock:operate\",\"id\":45,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-12 15:23:35');
INSERT INTO `sys_operate_log` VALUES ('51', '用户管理', '用户更新信息', 'com.fanchen.controller.SysUserController.updateInfo()', 'POST', '/sys/user/updateInfo', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"updateTime\":1639375763176,\"remark\":\"无\",\"phoneNumber\":\"17730312784\",\"id\":2,\"username\":\"范晨\"} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{}],\"principal\":\"范晨\"}', '范晨', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"更新个人信息成功！\"}', '1', '', '2021-12-13 14:09:23');
INSERT INTO `sys_operate_log` VALUES ('52', '物资库存', '物资出入库', 'com.fanchen.controller.GoodStockController.save()', 'POST', '/good/stock', '127.0.0.1', ' 本机地址', '{\"peopleName\":\"赵丹妮\",\"operateType\":0,\"remark\":\"入库刘国钧学院仓库\",\"list\":[{\"goodSize\":\"盒\",\"goodName\":\"N95口罩\",\"id\":3,\"goodNum\":30}],\"accept\":\"刘国钧学院仓库\",\"peoplePhone\":\"18855331293\"} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{}],\"principal\":\"赵丹妮\"}', '赵丹妮', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"操作成功！\"}', '1', '', '2021-12-13 14:12:48');
INSERT INTO `sys_operate_log` VALUES ('53', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-location\",\"orderNum\":4,\"updateTime\":1639399474672,\"type\":0,\"parentId\":0,\"createTime\":1639399474672,\"children\":[],\"name\":\"健康管理\",\"id\":46,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-13 20:44:35');
INSERT INTO `sys_operate_log` VALUES ('54', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"student\",\"isDelete\":0,\"remark\":\"只有健康管理功能\",\"updateTime\":1639399553803,\"version\":13,\"createTime\":1609726154000,\"name\":\"学生用户\",\"id\":3,\"menuIds\":[2,3,4,21,46],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-13 20:45:54');
INSERT INTO `sys_operate_log` VALUES ('55', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"测试专用账户\",\"updateTime\":1639399571974,\"version\":12,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-13 20:46:12');
INSERT INTO `sys_operate_log` VALUES ('56', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639399594261,\"version\":13,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-13 20:46:34');
INSERT INTO `sys_operate_log` VALUES ('57', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"service\",\"isDelete\":0,\"remark\":\"后勤用户 负责管理物资\",\"updateTime\":1639399614403,\"version\":3,\"createTime\":1639291757000,\"name\":\"后勤用户\",\"id\":10,\"menuIds\":[34,35,36,37,38],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-13 20:46:54');
INSERT INTO `sys_operate_log` VALUES ('58', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639399621341,\"version\":15,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36,37,38,46],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-13 20:47:01');
INSERT INTO `sys_operate_log` VALUES ('59', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1639444246032,\"remark\":\"无\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":2,\"phoneNumber\":\"17730312784\",\"createTime\":1639375664000,\"id\":2,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:10:46');
INSERT INTO `sys_operate_log` VALUES ('60', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"deptId\":104,\"updateTime\":1639444253028,\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":2,\"phoneNumber\":\"18855331293\",\"createTime\":1639375873000,\"id\":3,\"username\":\"danny\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:10:53');
INSERT INTO `sys_operate_log` VALUES ('61', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":104,\"updateTime\":1639444261685,\"remark\":\"无\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":3,\"phoneNumber\":\"18855331293\",\"createTime\":1639375873000,\"id\":3,\"username\":\"danny\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:11:02');
INSERT INTO `sys_operate_log` VALUES ('62', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":104,\"updateTime\":\"2021-12-14 09:11:02\",\"remark\":\"无\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":3,\"password\":\"\",\"phoneNumber\":\"18855331293\",\"createTime\":\"2021-12-13 14:11:13\",\"id\":3,\"username\":\"danny\",\"status\":1}', 'danny', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-14 09:12:09');
INSERT INTO `sys_operate_log` VALUES ('63', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-promotion\",\"orderNum\":1,\"updateTime\":1639444660768,\"type\":1,\"parentId\":46,\"path\":\"/health/clock\",\"component\":\"health/Clock\",\"createTime\":1639444660768,\"children\":[],\"name\":\"健康打卡\",\"perms\":\"health:clock:save\",\"id\":47,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-14 09:17:41');
INSERT INTO `sys_operate_log` VALUES ('64', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639444717619,\"version\":16,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36,37,38,46,47],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:18:38');
INSERT INTO `sys_operate_log` VALUES ('65', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-opportunity\",\"orderNum\":2,\"updateTime\":1639444799395,\"type\":1,\"parentId\":46,\"path\":\"/health/clockInfo\",\"component\":\"health/clockInfo\",\"createTime\":1639444799395,\"children\":[],\"name\":\"打卡信息\",\"perms\":\"health:clock:list\",\"id\":48,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-14 09:19:59');
INSERT INTO `sys_operate_log` VALUES ('66', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-chat-round\",\"orderNum\":3,\"updateTime\":1639444917373,\"type\":1,\"parentId\":46,\"path\":\"/health/report\",\"component\":\"health/Report\",\"createTime\":1639444917373,\"children\":[],\"name\":\"二码一报告\",\"perms\":\"health:report:save\",\"id\":49,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-14 09:21:57');
INSERT INTO `sys_operate_log` VALUES ('67', '菜单管理', '修改菜单', 'com.fanchen.controller.SysMenuController.edit()', 'PUT', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"icon\":\"el-icon-s-opportunity\",\"orderNum\":2,\"updateTime\":1639444929164,\"type\":1,\"version\":2,\"parentId\":46,\"path\":\"/health/clockInfo\",\"component\":\"health/ClockInfo\",\"createTime\":1639444799000,\"children\":[],\"name\":\"打卡信息\",\"perms\":\"health:clock:list\",\"id\":48,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:22:09');
INSERT INTO `sys_operate_log` VALUES ('68', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-data\",\"orderNum\":4,\"updateTime\":1639445028177,\"type\":1,\"parentId\":46,\"path\":\"/health/reportInfo\",\"component\":\"health/ReportInfo\",\"createTime\":1639445028177,\"children\":[],\"name\":\"报告信息\",\"perms\":\"health:report:list\",\"id\":50,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-14 09:23:48');
INSERT INTO `sys_operate_log` VALUES ('69', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639445602577,\"version\":17,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,36,37,38,46,47,48,49,50],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-14 09:33:23');
INSERT INTO `sys_operate_log` VALUES ('70', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"student\",\"isDelete\":0,\"remark\":\"只有健康管理功能\",\"updateTime\":1639550693266,\"version\":14,\"createTime\":1609726154000,\"name\":\"学生用户\",\"id\":3,\"menuIds\":[2,3,4,21,46,47,48,49,50],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-15 14:44:53');
INSERT INTO `sys_operate_log` VALUES ('71', '用户管理', '分配角色', 'com.fanchen.controller.SysUserController.userRole()', 'POST', '/sys/user/userRole/1', '127.0.0.1', ' 本机地址', '{} [3,6,8,10] {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"操作成功！\"}', '1', '', '2021-12-15 17:56:40');
INSERT INTO `sys_operate_log` VALUES ('72', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639564851708,\"version\":18,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,39,40,41,36,42,43,44,37,38,45,46,47,48,49,50],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-15 18:40:52');
INSERT INTO `sys_operate_log` VALUES ('73', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639628890096,\"version\":14,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46,48,50],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-16 12:28:10');
INSERT INTO `sys_operate_log` VALUES ('74', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639639998206,\"version\":15,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46,48,49,50],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-16 15:33:18');
INSERT INTO `sys_operate_log` VALUES ('75', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"isDelete\":0,\"deptId\":200,\"updateTime\":1639640219762,\"remark\":\"老师用户\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":2,\"phoneNumber\":\"13966346765\",\"createTime\":1639628861000,\"id\":4,\"username\":\"teacher\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-16 15:37:00');
INSERT INTO `sys_operate_log` VALUES ('76', '用户管理', '重置密码', 'com.fanchen.controller.SysUserController.resetPwd()', 'POST', '/sys/user/reset', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1639649022474,\"remark\":\"无\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":3,\"password\":\"$2a$10$iBMPjT2Dibhhys7VnJ3Kcu4eh3u7LOBZLNC3g4TMl0reFheB7VJku\",\"phoneNumber\":\"17730312784\",\"createTime\":1639375664000,\"id\":2,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"重置密码成功！\"}', '1', '', '2021-12-16 18:03:43');
INSERT INTO `sys_operate_log` VALUES ('77', '用户管理', '重置密码', 'com.fanchen.controller.SysUserController.resetPwd()', 'POST', '/sys/user/reset', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":104,\"updateTime\":1639649027674,\"remark\":\"无\",\"avatar\":\"http://localhost:8081/img/2021/12/59b880040d6443b28956519118c2d507.jpg\",\"version\":5,\"password\":\"$2a$10$FGHwBaJaHOg/7.Rig7McOOaMx18CMfpqmFYRBFzHOgNffdUEym84O\",\"phoneNumber\":\"18855331293\",\"createTime\":1639375873000,\"id\":3,\"username\":\"danny\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"重置密码成功！\"}', '1', '', '2021-12-16 18:03:48');
INSERT INTO `sys_operate_log` VALUES ('78', '用户管理', '重置密码', 'com.fanchen.controller.SysUserController.resetPwd()', 'POST', '/sys/user/reset', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"isDelete\":0,\"deptId\":200,\"updateTime\":1639649031945,\"remark\":\"老师用户\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":3,\"password\":\"$2a$10$KPoiHuWzMXmT5WenDTq8heKQejAm4TvFL5SHsFUUrlab72jHPhU02\",\"phoneNumber\":\"13966346765\",\"createTime\":1639628861000,\"id\":4,\"username\":\"teacher\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"重置密码成功！\"}', '1', '', '2021-12-16 18:03:52');
INSERT INTO `sys_operate_log` VALUES ('79', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-user-solid\",\"orderNum\":5,\"updateTime\":1639651538172,\"type\":0,\"parentId\":0,\"createTime\":1639651538172,\"children\":[],\"name\":\"出行管理\",\"id\":51,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-16 18:45:38');
INSERT INTO `sys_operate_log` VALUES ('80', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-platform\",\"orderNum\":1,\"updateTime\":1639651855161,\"type\":1,\"parentId\":51,\"path\":\"/access/register\",\"component\":\"access/Register\",\"createTime\":1639651855161,\"children\":[],\"name\":\"出入登记\",\"perms\":\"access:register:list\",\"id\":52,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-16 18:50:55');
INSERT INTO `sys_operate_log` VALUES ('81', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639652856386,\"version\":19,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,39,40,41,36,42,43,44,37,38,45,46,47,48,49,50,51,52],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-16 19:07:37');
INSERT INTO `sys_operate_log` VALUES ('82', '物资库存', '物资出入库', 'com.fanchen.controller.GoodStockController.save()', 'POST', '/good/stock', '127.0.0.1', ' 本机地址', '{\"peopleName\":\"范晨\",\"operateType\":0,\"remark\":\"入库\",\"list\":[{\"goodSize\":\"打\",\"goodName\":\"冰露饮用水\",\"id\":1,\"goodNum\":5},{\"goodSize\":\"包\",\"goodName\":\"医用口罩\",\"id\":2,\"goodNum\":10}],\"accept\":\"大数据学院仓库\",\"peoplePhone\":\"17730312784\"} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"操作成功！\"}', '1', '', '2021-12-17 12:47:25');
INSERT INTO `sys_operate_log` VALUES ('83', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-phone\",\"orderNum\":2,\"updateTime\":1639725450353,\"type\":1,\"parentId\":51,\"path\":\"/access/return\",\"component\":\"access/Return\",\"createTime\":1639725450353,\"children\":[],\"name\":\"未归人员\",\"perms\":\"access:return:list\",\"id\":53,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-17 15:17:30');
INSERT INTO `sys_operate_log` VALUES ('84', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639725546758,\"version\":20,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,39,40,41,36,42,43,44,37,38,45,46,47,48,49,50,51,52,53],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 15:19:07');
INSERT INTO `sys_operate_log` VALUES ('85', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-paperclip\",\"orderNum\":6,\"updateTime\":1639736757682,\"type\":0,\"parentId\":0,\"createTime\":1639736757681,\"children\":[],\"name\":\"请假管理\",\"id\":54,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-17 18:25:58');
INSERT INTO `sys_operate_log` VALUES ('86', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-promotion\",\"orderNum\":1,\"updateTime\":1639736893288,\"type\":1,\"parentId\":54,\"path\":\"/leave/apply\",\"component\":\"leave/Apply\",\"createTime\":1639736893288,\"children\":[],\"name\":\"请假申请\",\"perms\":\"leave:apply:list\",\"id\":55,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-17 18:28:13');
INSERT INTO `sys_operate_log` VALUES ('87', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-s-platform\",\"orderNum\":2,\"updateTime\":1639736963207,\"type\":1,\"parentId\":54,\"path\":\"/leave/record\",\"component\":\"leave/Record\",\"createTime\":1639736963207,\"children\":[],\"name\":\"请假记录\",\"perms\":\"leave:record:list\",\"id\":56,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-17 18:29:23');
INSERT INTO `sys_operate_log` VALUES ('88', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639737064539,\"version\":21,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,39,40,41,36,42,43,44,37,38,45,46,47,48,49,50,51,52,53,54,55,56],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 18:31:05');
INSERT INTO `sys_operate_log` VALUES ('89', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"el-icon-lock\",\"orderNum\":3,\"updateTime\":1639737289641,\"type\":1,\"parentId\":54,\"path\":\"/leave/examine\",\"component\":\"leave/Examine\",\"createTime\":1639737289641,\"children\":[],\"name\":\"请假审批\",\"perms\":\"leave:examine:list\",\"id\":57,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-17 18:34:50');
INSERT INTO `sys_operate_log` VALUES ('90', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"admin\",\"isDelete\":0,\"remark\":\"系统默认最高权限，不可以编辑和任意修改\",\"updateTime\":1639737365856,\"version\":22,\"createTime\":1610774943000,\"name\":\"超级管理员\",\"id\":6,\"menuIds\":[1,2,9,10,11,12,13,3,7,14,15,16,4,17,18,19,21,22,23,24,5,6,29,30,28,32,33,25,27,26,34,35,39,40,41,36,42,43,44,37,38,45,46,47,48,49,50,51,52,53,54,55,56,57],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 18:36:06');
INSERT INTO `sys_operate_log` VALUES ('91', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"芜湖\",\"isDelete\":0,\"deptId\":104,\"updateTime\":1639740185787,\"remark\":\"后勤用户\",\"avatar\":\"http://localhost:8081/img/2021/12/59b880040d6443b28956519118c2d507.jpg\",\"version\":6,\"phoneNumber\":\"18855331293\",\"createTime\":1639375873000,\"id\":3,\"username\":\"service\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:23:06');
INSERT INTO `sys_operate_log` VALUES ('92', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"常州\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1639740197273,\"remark\":\"学生用户\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":4,\"phoneNumber\":\"17730312784\",\"createTime\":1639375664000,\"id\":2,\"username\":\"fanchen\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:23:17');
INSERT INTO `sys_operate_log` VALUES ('93', '用户管理', '修改用户', 'com.fanchen.controller.SysUserController.update()', 'PUT', '/sys/user', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1639740328575,\"remark\":\"超级管理员\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":51,\"phoneNumber\":\"17730312784\",\"createTime\":1610460833000,\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:25:29');
INSERT INTO `sys_operate_log` VALUES ('94', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"阿里云大数据学院\",\"leader\":\"杜东亮\",\"isDelete\":0,\"deptId\":103,\"orderNum\":1,\"updateTime\":1639740926993,\"version\":3,\"parentId\":101,\"createBy\":\"admin\",\"phone\":\"19851922596\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"2473786752@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:35:27');
INSERT INTO `sys_operate_log` VALUES ('95', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"刘国钧学院\",\"leader\":\"范晨\",\"isDelete\":0,\"deptId\":104,\"orderNum\":2,\"updateTime\":1639740940488,\"version\":2,\"parentId\":101,\"createBy\":\"admin\",\"phone\":\"15888888888\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"ry@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:35:41');
INSERT INTO `sys_operate_log` VALUES ('96', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"商学院\",\"leader\":\"范晨\",\"isDelete\":0,\"deptId\":105,\"orderNum\":3,\"updateTime\":1639740958240,\"version\":2,\"parentId\":101,\"createBy\":\"admin\",\"phone\":\"15888888888\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"ry@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:35:58');
INSERT INTO `sys_operate_log` VALUES ('97', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"机械学院\",\"leader\":\"范晨\",\"isDelete\":0,\"deptId\":106,\"orderNum\":4,\"updateTime\":1639740969366,\"version\":2,\"parentId\":101,\"createBy\":\"admin\",\"phone\":\"15888888888\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"ry@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:36:09');
INSERT INTO `sys_operate_log` VALUES ('98', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"艺术学院\",\"leader\":\"范晨\",\"isDelete\":0,\"deptId\":108,\"orderNum\":1,\"updateTime\":1639740977803,\"version\":2,\"parentId\":102,\"createBy\":\"admin\",\"phone\":\"15888888888\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"ry@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:36:18');
INSERT INTO `sys_operate_log` VALUES ('99', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"工学院\",\"leader\":\"范晨\",\"isDelete\":0,\"deptId\":109,\"orderNum\":2,\"updateTime\":1639740998078,\"version\":2,\"parentId\":102,\"createBy\":\"admin\",\"phone\":\"15888888888\",\"createTime\":1638183145000,\"updateBy\":\"\",\"email\":\"ry@qq.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:36:38');
INSERT INTO `sys_operate_log` VALUES ('100', '部门管理', '修改部门', 'com.fanchen.controller.SysDeptController.update()', 'PUT', '/sys/dept', '127.0.0.1', ' 本机地址', '{\"deptName\":\"石油化工学院\",\"leader\":\"倪兴林\",\"isDelete\":0,\"deptId\":200,\"orderNum\":3,\"updateTime\":1639741015222,\"version\":2,\"parentId\":102,\"createBy\":\"\",\"phone\":\"19851920126\",\"createTime\":1638529074000,\"updateBy\":\"\",\"email\":\"xigongnei942@163.com\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-17 19:36:55');
INSERT INTO `sys_operate_log` VALUES ('101', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"student\",\"isDelete\":0,\"remark\":\"只有健康管理功能\",\"updateTime\":1639811305714,\"version\":15,\"createTime\":1609726154000,\"name\":\"学生用户\",\"id\":3,\"menuIds\":[2,3,4,21,46,47,48,49,50,54,55,56],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-18 15:08:26');
INSERT INTO `sys_operate_log` VALUES ('102', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639816814666,\"version\":16,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46,48,49,50,54,56,57],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-18 16:40:15');
INSERT INTO `sys_operate_log` VALUES ('103', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639824429729,\"version\":17,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46,48,50,54,56],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-18 18:47:10');
INSERT INTO `sys_operate_log` VALUES ('104', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"service\",\"isDelete\":0,\"remark\":\"后勤用户 负责管理物资\",\"updateTime\":1639824543213,\"version\":4,\"createTime\":1639291757000,\"name\":\"后勤用户\",\"id\":10,\"menuIds\":[34,35,39,40,41,36,42,43,44,37,38,45,51,52,53],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-18 18:49:03');
INSERT INTO `sys_operate_log` VALUES ('105', '角色管理', '修改角色', 'com.fanchen.controller.SysRoleController.edit()', 'PUT', '/sys/role', '127.0.0.1', ' 本机地址', '{\"code\":\"teacher\",\"isDelete\":0,\"remark\":\"老师用户 查看健康管理和审批功能\",\"updateTime\":1639824595061,\"version\":18,\"createTime\":1638422134000,\"name\":\"老师用户\",\"id\":8,\"menuIds\":[6,46,48,50,51,53,54,56],\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功！\"}', '1', '', '2021-12-18 18:49:55');
INSERT INTO `sys_operate_log` VALUES ('106', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639825038390,\"type\":2,\"parentId\":52,\"createTime\":1639825038390,\"children\":[],\"name\":\"添加记录\",\"perms\":\"access:register:save\",\"id\":58,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-18 18:57:18');
INSERT INTO `sys_operate_log` VALUES ('107', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639825090272,\"type\":2,\"parentId\":55,\"createTime\":1639825090272,\"children\":[],\"name\":\"新增请假\",\"perms\":\"leave:apply:save\",\"id\":59,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-18 18:58:10');
INSERT INTO `sys_operate_log` VALUES ('108', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":1,\"updateTime\":1639825164089,\"type\":2,\"parentId\":56,\"createTime\":1639825164089,\"children\":[],\"name\":\"审核请假\",\"perms\":\"leave:record:examine\",\"id\":60,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-18 18:59:24');
INSERT INTO `sys_operate_log` VALUES ('109', '菜单管理', '添加菜单', 'com.fanchen.controller.SysMenuController.add()', 'POST', '/sys/menu', '127.0.0.1', ' 本机地址', '{\"icon\":\"\",\"orderNum\":2,\"updateTime\":1639825732402,\"type\":2,\"parentId\":55,\"createTime\":1639825732402,\"children\":[],\"name\":\"修改请假\",\"perms\":\"leave:apply:update\",\"id\":61,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"添加成功！\"}', '1', '', '2021-12-18 19:08:53');
INSERT INTO `sys_operate_log` VALUES ('110', '用户管理', '用户修改头像', 'com.fanchen.controller.SysUserController.avatar()', 'POST', '/sys/user/avatar', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":\"2021-12-17 19:25:29\",\"remark\":\"超级管理员\",\"avatar\":\"http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg\",\"version\":51,\"password\":\"\",\"phoneNumber\":\"17730312784\",\"createTime\":\"2021-01-12 22:13:53\",\"nickname\":\"超级管理员\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"头像上传成功！\"}', '1', '', '2021-12-18 20:03:33');
INSERT INTO `sys_operate_log` VALUES ('111', '用户管理', '重置密码', 'com.fanchen.controller.SysUserController.resetPwd()', 'POST', '/sys/user/reset', '127.0.0.1', ' 本机地址', '{\"city\":\"江苏南京\",\"isDelete\":0,\"deptId\":103,\"updateTime\":1639829099538,\"remark\":\"超级管理员\",\"avatar\":\"http://localhost:8081/img/2021/12/97b195d7383b47a08cbc6b88aaed3b2a.jpg\",\"version\":53,\"password\":\"$2a$10$THwIXnfNljeDVbG6tYNB2ukKLxOqur7xY/Cf7g4dG3xD6FEnDKfvW\",\"phoneNumber\":\"17730312784\",\"createTime\":1610460833000,\"nickname\":\"超级管理员\",\"id\":1,\"username\":\"admin\",\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"重置密码成功！\"}', '1', '', '2021-12-18 20:05:00');
INSERT INTO `sys_operate_log` VALUES ('112', '物资资料', '修改物资', 'com.fanchen.controller.GoodInfoController.update()', 'PUT', '/good/info', '127.0.0.1', ' 本机地址', '{\"img\":\"http://localhost:8081/img/2021/12/34997315ebc44e4eb0b70aedaea7c276.jpg\",\"isDelete\":0,\"remark\":\"点滴必备\",\"updateTime\":\"2021-12-11 19:18:23\",\"version\":2,\"unit\":\"10只/盒\",\"createBy\":\"admin\",\"total\":60,\"size\":\"盒\",\"createTime\":\"2021-12-10 18:23:26\",\"name\":\"葡萄糖\",\"typeId\":1,\"id\":4,\"status\":1}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改成功\"}', '1', '', '2021-12-18 20:11:39');
INSERT INTO `sys_operate_log` VALUES ('113', '物资类型', '更新类型', 'com.fanchen.controller.GoodTypeController.update()', 'PUT', '/good/type', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"orderNum\":2,\"updateTime\":1639829537541,\"remark\":\"穿的衣服\",\"type\":\"衣物\",\"version\":4,\"createBy\":\"admin\",\"createTime\":1639047898000,\"id\":2,\"status\":1} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改类型成功！\"}', '1', '', '2021-12-18 20:12:18');
INSERT INTO `sys_operate_log` VALUES ('114', '物资类型', '更新类型', 'com.fanchen.controller.GoodTypeController.update()', 'PUT', '/good/type', '127.0.0.1', ' 本机地址', '{\"isDelete\":0,\"orderNum\":2,\"updateTime\":1639829539568,\"remark\":\"穿的衣服\",\"type\":\"衣物\",\"version\":5,\"createBy\":\"admin\",\"createTime\":1639047898000,\"id\":2,\"status\":0} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"修改类型成功！\"}', '1', '', '2021-12-18 20:12:20');
INSERT INTO `sys_operate_log` VALUES ('115', '健康打卡', '添加打卡', 'com.fanchen.controller.HealthClockController.save()', 'POST', '/health/clock', '127.0.0.1', ' 本机地址', '{\"address\":\"安徽省-芜湖市-无为县\",\"deptId\":103,\"diagnosis\":1,\"healthType\":2,\"updateTime\":1639829644548,\"middleHigh\":1,\"returnInfo\":1,\"createTime\":1639829644548,\"temperature\":37.3,\"id\":6,\"username\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"打卡成功\"}', '1', '', '2021-12-18 20:14:05');
INSERT INTO `sys_operate_log` VALUES ('116', '二码一报告', '添加报告', 'com.fanchen.controller.HealthReportController.save()', 'POST', '/health/report', '127.0.0.1', ' 本机地址', '{} {\"authenticated\":true,\"authorities\":[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}],\"principal\":\"admin\"}', 'admin', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"上报成功\"}', '1', '', '2021-12-18 20:15:04');
INSERT INTO `sys_operate_log` VALUES ('117', '请假管理', '修改请假', 'com.fanchen.controller.LeaveApplyController.update()', 'PUT', '/leave/apply', '127.0.0.1', ' 本机地址', '{\"reason\":\"元旦回家\",\"studentType\":3,\"address\":\"安徽芜湖\",\"isDelete\":0,\"dormitory\":\"7-540\",\"deptId\":103,\"updateTime\":1639829843661,\"opinion\":\"合情合理 允许请假\",\"exam\":1,\"phoneNumber\":\"17730312784\",\"leaveType\":1,\"createTime\":1639805412000,\"nickname\":\"学生用户\",\"id\":1,\"time\":\"2022-01-01 至 2022-01-03\",\"day\":\"3\",\"clazz\":1,\"username\":\"student\",\"status\":0,\"traffic\":\"高铁G7774\"}', 'student', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"更新成功！\"}', '1', '', '2021-12-18 20:17:24');
INSERT INTO `sys_operate_log` VALUES ('118', '请假管理', '修改请假', 'com.fanchen.controller.LeaveApplyController.update()', 'PUT', '/leave/apply', '127.0.0.1', ' 本机地址', '{\"reason\":\"元旦回家和女朋友约会\",\"studentType\":3,\"address\":\"安徽芜湖\",\"isDelete\":0,\"dormitory\":\"7-540\",\"deptId\":103,\"updateTime\":1639829856740,\"opinion\":\"合情合理 允许请假\",\"exam\":1,\"phoneNumber\":\"17730312784\",\"leaveType\":1,\"createTime\":1639805412000,\"nickname\":\"学生用户\",\"id\":1,\"time\":\"2022-01-01 至 2022-01-03\",\"day\":\"3\",\"clazz\":1,\"username\":\"student\",\"status\":0,\"traffic\":\"高铁G7774\"}', 'student', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"更新成功！\"}', '1', '', '2021-12-18 20:17:37');
INSERT INTO `sys_operate_log` VALUES ('119', '请假管理', '修改请假', 'com.fanchen.controller.LeaveApplyController.update()', 'PUT', '/leave/apply', '127.0.0.1', ' 本机地址', '{\"reason\":\"元旦回家和女朋友约会\",\"studentType\":3,\"address\":\"安徽芜湖\",\"isDelete\":0,\"dormitory\":\"7-540\",\"deptId\":103,\"updateTime\":1639829859517,\"opinion\":\"合情合理 允许请假\",\"exam\":1,\"phoneNumber\":\"17730312784\",\"leaveType\":1,\"createTime\":1639805412000,\"nickname\":\"学生用户\",\"id\":1,\"time\":\"2022-01-01 至 2022-01-03\",\"day\":\"3\",\"clazz\":1,\"username\":\"student\",\"status\":1,\"traffic\":\"高铁G7774\"}', 'student', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"更新成功！\"}', '1', '', '2021-12-18 20:17:40');
INSERT INTO `sys_operate_log` VALUES ('120', '请假管理', '修改请假', 'com.fanchen.controller.LeaveApplyController.update()', 'PUT', '/leave/apply', '127.0.0.1', ' 本机地址', '{\"reason\":\"元旦回家和女朋友约会\",\"studentType\":3,\"address\":\"安徽芜湖\",\"isDelete\":0,\"dormitory\":\"7-540\",\"deptId\":103,\"updateTime\":1639830052602,\"opinion\":\"合情合理 允许你请假\",\"exam\":1,\"phoneNumber\":\"17730312784\",\"leaveType\":1,\"createTime\":1639805412000,\"nickname\":\"学生用户\",\"id\":1,\"time\":\"2022-01-01 至 2022-01-03\",\"day\":\"3\",\"clazz\":1,\"username\":\"student\",\"status\":2,\"traffic\":\"高铁G7774\"}', 'teacher', '{\"msg\":\"操作成功\",\"code\":200,\"data\":\"更新成功！\"}', '1', '', '2021-12-18 20:20:53');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(5) NOT NULL,
  `is_delete` int(1) DEFAULT '0',
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3', '学生用户', 'student', '只有健康管理功能', '2021-01-04 10:09:14', '2021-12-18 15:08:26', '1', '0', '15');
INSERT INTO `sys_role` VALUES ('6', '超级管理员', 'admin', '系统默认最高权限，不可以编辑和任意修改', '2021-01-16 13:29:03', '2021-12-17 18:36:06', '1', '0', '22');
INSERT INTO `sys_role` VALUES ('8', '老师用户', 'teacher', '老师用户 查看健康管理和审批功能', '2021-12-02 13:15:34', '2021-12-18 18:49:55', '1', '0', '18');
INSERT INTO `sys_role` VALUES ('10', '后勤用户', 'service', '后勤用户 负责管理物资', '2021-12-12 14:49:17', '2021-12-18 18:49:03', '1', '0', '4');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('818', '6', '1');
INSERT INTO `sys_role_menu` VALUES ('819', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('820', '6', '9');
INSERT INTO `sys_role_menu` VALUES ('821', '6', '10');
INSERT INTO `sys_role_menu` VALUES ('822', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('823', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('824', '6', '13');
INSERT INTO `sys_role_menu` VALUES ('825', '6', '3');
INSERT INTO `sys_role_menu` VALUES ('826', '6', '7');
INSERT INTO `sys_role_menu` VALUES ('827', '6', '14');
INSERT INTO `sys_role_menu` VALUES ('828', '6', '15');
INSERT INTO `sys_role_menu` VALUES ('829', '6', '16');
INSERT INTO `sys_role_menu` VALUES ('830', '6', '4');
INSERT INTO `sys_role_menu` VALUES ('831', '6', '17');
INSERT INTO `sys_role_menu` VALUES ('832', '6', '18');
INSERT INTO `sys_role_menu` VALUES ('833', '6', '19');
INSERT INTO `sys_role_menu` VALUES ('834', '6', '21');
INSERT INTO `sys_role_menu` VALUES ('835', '6', '22');
INSERT INTO `sys_role_menu` VALUES ('836', '6', '23');
INSERT INTO `sys_role_menu` VALUES ('837', '6', '24');
INSERT INTO `sys_role_menu` VALUES ('838', '6', '5');
INSERT INTO `sys_role_menu` VALUES ('839', '6', '6');
INSERT INTO `sys_role_menu` VALUES ('840', '6', '29');
INSERT INTO `sys_role_menu` VALUES ('841', '6', '30');
INSERT INTO `sys_role_menu` VALUES ('842', '6', '28');
INSERT INTO `sys_role_menu` VALUES ('843', '6', '32');
INSERT INTO `sys_role_menu` VALUES ('844', '6', '33');
INSERT INTO `sys_role_menu` VALUES ('845', '6', '25');
INSERT INTO `sys_role_menu` VALUES ('846', '6', '27');
INSERT INTO `sys_role_menu` VALUES ('847', '6', '26');
INSERT INTO `sys_role_menu` VALUES ('848', '6', '34');
INSERT INTO `sys_role_menu` VALUES ('849', '6', '35');
INSERT INTO `sys_role_menu` VALUES ('850', '6', '39');
INSERT INTO `sys_role_menu` VALUES ('851', '6', '40');
INSERT INTO `sys_role_menu` VALUES ('852', '6', '41');
INSERT INTO `sys_role_menu` VALUES ('853', '6', '36');
INSERT INTO `sys_role_menu` VALUES ('854', '6', '42');
INSERT INTO `sys_role_menu` VALUES ('855', '6', '43');
INSERT INTO `sys_role_menu` VALUES ('856', '6', '44');
INSERT INTO `sys_role_menu` VALUES ('857', '6', '37');
INSERT INTO `sys_role_menu` VALUES ('858', '6', '38');
INSERT INTO `sys_role_menu` VALUES ('859', '6', '45');
INSERT INTO `sys_role_menu` VALUES ('860', '6', '46');
INSERT INTO `sys_role_menu` VALUES ('861', '6', '47');
INSERT INTO `sys_role_menu` VALUES ('862', '6', '48');
INSERT INTO `sys_role_menu` VALUES ('863', '6', '49');
INSERT INTO `sys_role_menu` VALUES ('864', '6', '50');
INSERT INTO `sys_role_menu` VALUES ('865', '6', '51');
INSERT INTO `sys_role_menu` VALUES ('866', '6', '52');
INSERT INTO `sys_role_menu` VALUES ('867', '6', '53');
INSERT INTO `sys_role_menu` VALUES ('868', '6', '54');
INSERT INTO `sys_role_menu` VALUES ('869', '6', '55');
INSERT INTO `sys_role_menu` VALUES ('870', '6', '56');
INSERT INTO `sys_role_menu` VALUES ('871', '6', '57');
INSERT INTO `sys_role_menu` VALUES ('872', '3', '2');
INSERT INTO `sys_role_menu` VALUES ('873', '3', '3');
INSERT INTO `sys_role_menu` VALUES ('874', '3', '4');
INSERT INTO `sys_role_menu` VALUES ('875', '3', '21');
INSERT INTO `sys_role_menu` VALUES ('876', '3', '46');
INSERT INTO `sys_role_menu` VALUES ('877', '3', '47');
INSERT INTO `sys_role_menu` VALUES ('878', '3', '48');
INSERT INTO `sys_role_menu` VALUES ('879', '3', '49');
INSERT INTO `sys_role_menu` VALUES ('880', '3', '50');
INSERT INTO `sys_role_menu` VALUES ('881', '3', '54');
INSERT INTO `sys_role_menu` VALUES ('882', '3', '55');
INSERT INTO `sys_role_menu` VALUES ('883', '3', '56');
INSERT INTO `sys_role_menu` VALUES ('898', '10', '34');
INSERT INTO `sys_role_menu` VALUES ('899', '10', '35');
INSERT INTO `sys_role_menu` VALUES ('900', '10', '39');
INSERT INTO `sys_role_menu` VALUES ('901', '10', '40');
INSERT INTO `sys_role_menu` VALUES ('902', '10', '41');
INSERT INTO `sys_role_menu` VALUES ('903', '10', '36');
INSERT INTO `sys_role_menu` VALUES ('904', '10', '42');
INSERT INTO `sys_role_menu` VALUES ('905', '10', '43');
INSERT INTO `sys_role_menu` VALUES ('906', '10', '44');
INSERT INTO `sys_role_menu` VALUES ('907', '10', '37');
INSERT INTO `sys_role_menu` VALUES ('908', '10', '38');
INSERT INTO `sys_role_menu` VALUES ('909', '10', '45');
INSERT INTO `sys_role_menu` VALUES ('910', '10', '51');
INSERT INTO `sys_role_menu` VALUES ('911', '10', '52');
INSERT INTO `sys_role_menu` VALUES ('912', '10', '53');
INSERT INTO `sys_role_menu` VALUES ('913', '8', '6');
INSERT INTO `sys_role_menu` VALUES ('914', '8', '46');
INSERT INTO `sys_role_menu` VALUES ('915', '8', '48');
INSERT INTO `sys_role_menu` VALUES ('916', '8', '50');
INSERT INTO `sys_role_menu` VALUES ('917', '8', '51');
INSERT INTO `sys_role_menu` VALUES ('918', '8', '53');
INSERT INTO `sys_role_menu` VALUES ('919', '8', '54');
INSERT INTO `sys_role_menu` VALUES ('920', '8', '56');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL,
  `phone_number` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `is_delete` int(1) DEFAULT '0',
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$THwIXnfNljeDVbG6tYNB2ukKLxOqur7xY/Cf7g4dG3xD6FEnDKfvW', '超级管理员', 'http://localhost:8081/img/2021/12/97b195d7383b47a08cbc6b88aaed3b2a.jpg', '17730312784', '江苏南京', '103', '2021-01-12 22:13:53', '2021-12-18 20:05:00', '超级管理员', '1', '0', '53');
INSERT INTO `sys_user` VALUES ('2', 'student', '$2a$10$iBMPjT2Dibhhys7VnJ3Kcu4eh3u7LOBZLNC3g4TMl0reFheB7VJku', '学生用户', 'http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg', '17730312784', '常州', '103', '2021-12-13 14:07:44', '2021-12-17 19:23:17', '学生用户', '1', '0', '4');
INSERT INTO `sys_user` VALUES ('3', 'service', '$2a$10$FGHwBaJaHOg/7.Rig7McOOaMx18CMfpqmFYRBFzHOgNffdUEym84O', '后勤用户', 'http://localhost:8081/img/2021/12/59b880040d6443b28956519118c2d507.jpg', '18855331293', '芜湖', '104', '2021-12-13 14:11:13', '2021-12-17 19:23:06', '后勤用户', '1', '0', '6');
INSERT INTO `sys_user` VALUES ('4', 'teacher', '$2a$10$KPoiHuWzMXmT5WenDTq8heKQejAm4TvFL5SHsFUUrlab72jHPhU02', '老师用户', 'http://localhost:8081/img/2021/12/400bba2995ec46fc97249cece09f9ca4.jpg', '13966346765', '常州', '200', '2021-12-16 12:27:41', '2021-12-16 18:03:52', '老师用户', '1', '0', '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('19', '2', '3');
INSERT INTO `sys_user_role` VALUES ('20', '3', '10');
INSERT INTO `sys_user_role` VALUES ('21', '1', '3');
INSERT INTO `sys_user_role` VALUES ('22', '1', '6');
INSERT INTO `sys_user_role` VALUES ('23', '1', '8');
INSERT INTO `sys_user_role` VALUES ('24', '1', '10');
INSERT INTO `sys_user_role` VALUES ('25', '4', '8');
