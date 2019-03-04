/*
Navicat MySQL Data Transfer

Source Server         : wanglei
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-04 14:35:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', '18565188318', '1234', '1991000000', '1');

-- ----------------------------
-- Table structure for shop_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(45) DEFAULT NULL,
  `address_tel` char(11) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `address_detail` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`address_id`),
  KEY `fk_shop_address_shop_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_address
-- ----------------------------
INSERT INTO `shop_address` VALUES ('1', 'zahngsna', '123345', 'nsau', 'qw', '2', '0', '2');

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `buy_number` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1未删除 2已删除',
  `ctime` int(11) DEFAULT NULL,
  `utime` int(11) DEFAULT NULL,
  `is_del` int(4) DEFAULT '1',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
INSERT INTO `shop_cart` VALUES ('1', '2', '2', '1', '1', '1551339765', '1551339765', '2');

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(20) DEFAULT NULL,
  `cate_show` tinyint(4) DEFAULT NULL,
  `cate_navshow` tinyint(4) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO `shop_category` VALUES ('1', '鞋靴', '1', '1', '0', '1543480216');
INSERT INTO `shop_category` VALUES ('2', '服装服饰', '1', '1', '0', '1543480263');
INSERT INTO `shop_category` VALUES ('3', '腕表首饰', '1', '1', '0', '1543480272');
INSERT INTO `shop_category` VALUES ('4', '母婴用品', '1', '1', '0', '1543480283');
INSERT INTO `shop_category` VALUES ('5', '玩具', '1', '1', '0', '1543480290');
INSERT INTO `shop_category` VALUES ('6', '美妆护肤', '1', '1', '0', '1543480297');
INSERT INTO `shop_category` VALUES ('7', '家居厨具 ', '1', '1', '0', '1543480311');
INSERT INTO `shop_category` VALUES ('8', '电子数码', '1', '1', '0', '1543480322');
INSERT INTO `shop_category` VALUES ('9', '户外运动', '1', '1', '0', '1543480334');
INSERT INTO `shop_category` VALUES ('10', '办公用品', '1', '1', '0', '1543480341');
INSERT INTO `shop_category` VALUES ('11', '女鞋', '1', '2', '1', '1543480370');
INSERT INTO `shop_category` VALUES ('12', '男鞋', '1', '2', '1', '1543480370');
INSERT INTO `shop_category` VALUES ('13', '童鞋', '1', '2', '1', '1543480370');
INSERT INTO `shop_category` VALUES ('14', '运动户外鞋', '1', '2', '1', '1543480370');
INSERT INTO `shop_category` VALUES ('15', '热门运动鞋', '1', '2', '1', '1543480370');
INSERT INTO `shop_category` VALUES ('16', '女装', '1', '2', '2', '1543480473');
INSERT INTO `shop_category` VALUES ('17', '男装', '1', '2', '2', '1543480473');
INSERT INTO `shop_category` VALUES ('18', '童装', '1', '2', '2', '1543480473');
INSERT INTO `shop_category` VALUES ('19', '时尚包袋', '1', '2', '3', '1543480568');
INSERT INTO `shop_category` VALUES ('20', '双肩背包', '1', '2', '3', '1543480568');
INSERT INTO `shop_category` VALUES ('21', '钱包、卡包', '1', '2', '3', '1543480568');
INSERT INTO `shop_category` VALUES ('22', '喂养用品', '1', '2', '4', '1543480794');
INSERT INTO `shop_category` VALUES ('23', '童车推车', '1', '2', '4', '1543480794');
INSERT INTO `shop_category` VALUES ('24', '安全用品', '1', '2', '4', '1543480794');
INSERT INTO `shop_category` VALUES ('25', '婴幼服饰', '1', '2', '4', '1543480794');
INSERT INTO `shop_category` VALUES ('26', '动漫玩具', '1', '2', '5', '1543480924');
INSERT INTO `shop_category` VALUES ('27', '益智科教', '1', '2', '5', '1543480941');
INSERT INTO `shop_category` VALUES ('28', '遥控电动', '1', '2', '5', '1543480954');
INSERT INTO `shop_category` VALUES ('29', '拼图', '1', '2', '5', '1543480966');
INSERT INTO `shop_category` VALUES ('30', '面部护肤', '1', '2', '6', '1543480979');
INSERT INTO `shop_category` VALUES ('31', '彩妆', '1', '2', '6', '1543480988');
INSERT INTO `shop_category` VALUES ('32', '美发护发', '1', '2', '6', '1543481002');
INSERT INTO `shop_category` VALUES ('33', '身体护理', '1', '2', '6', '1543481011');
INSERT INTO `shop_category` VALUES ('34', '厨房电器', '1', '2', '7', '1543481021');
INSERT INTO `shop_category` VALUES ('35', '水具', '1', '2', '7', '1543481030');
INSERT INTO `shop_category` VALUES ('36', '锅具壶具', '1', '2', '7', '1543481061');
INSERT INTO `shop_category` VALUES ('37', '居家电器', '1', '2', '7', '1543481073');
INSERT INTO `shop_category` VALUES ('38', '电脑', '1', '2', '8', '1543481092');
INSERT INTO `shop_category` VALUES ('39', '电脑组件', '1', '2', '8', '1543481096');
INSERT INTO `shop_category` VALUES ('40', '外设产品', '1', '2', '8', '1543481104');
INSERT INTO `shop_category` VALUES ('41', '存储', '1', '2', '8', '1543481116');
INSERT INTO `shop_category` VALUES ('42', '数码影音', '1', '2', '8', '1543481164');
INSERT INTO `shop_category` VALUES ('43', '运动服饰', '1', '2', '9', '1543481179');
INSERT INTO `shop_category` VALUES ('44', '运动鞋', '1', '2', '9', '1543481188');
INSERT INTO `shop_category` VALUES ('45', '热门运动', '1', '2', '9', '1543481210');
INSERT INTO `shop_category` VALUES ('46', '潮流运动', '1', '2', '9', '1543481221');
INSERT INTO `shop_category` VALUES ('47', '书写工具', '1', '2', '10', '1543481236');
INSERT INTO `shop_category` VALUES ('48', '办公设备', '1', '2', '10', '1543481251');
INSERT INTO `shop_category` VALUES ('49', '办公耗材', '1', '2', '10', '1543481257');
INSERT INTO `shop_category` VALUES ('50', '教具文具', '1', '2', '10', '1543481266');
INSERT INTO `shop_category` VALUES ('51', '财务用品', '1', '2', '10', '1543481276');
INSERT INTO `shop_category` VALUES ('52', '运动服装', '1', '2', '2', '1543481339');
INSERT INTO `shop_category` VALUES ('53', '内衣', '1', '2', '2', '1543481348');
INSERT INTO `shop_category` VALUES ('54', '腕表', '1', '2', '3', '1543481377');
INSERT INTO `shop_category` VALUES ('55', '首饰', '1', '2', '3', '1543481381');
INSERT INTO `shop_category` VALUES ('56', '高跟鞋', '1', '2', '11', '1543481463');
INSERT INTO `shop_category` VALUES ('57', '芭蕾鞋', '1', '2', '11', '1543481463');
INSERT INTO `shop_category` VALUES ('58', '乐福鞋', '1', '2', '11', '1543481463');
INSERT INTO `shop_category` VALUES ('59', '穆勒鞋', '1', '2', '11', '1543481463');
INSERT INTO `shop_category` VALUES ('60', '商务休闲鞋', '1', '2', '12', '1543481463');
INSERT INTO `shop_category` VALUES ('61', '休闲鞋', '1', '2', '12', '1543481463');
INSERT INTO `shop_category` VALUES ('62', '靴子', '1', '2', '12', '1543481463');
INSERT INTO `shop_category` VALUES ('63', '凉鞋', '1', '2', '12', '1543481463');
INSERT INTO `shop_category` VALUES ('64', '女童鞋', '1', '2', '13', '1543481463');
INSERT INTO `shop_category` VALUES ('65', '男童鞋', '1', '2', '13', '1543481463');
INSERT INTO `shop_category` VALUES ('66', '女婴鞋', '1', '2', '13', '1543481463');
INSERT INTO `shop_category` VALUES ('67', '男婴鞋', '1', '2', '13', '1543481463');
INSERT INTO `shop_category` VALUES ('68', '女士休闲运动鞋', '1', '2', '14', '1543481463');
INSERT INTO `shop_category` VALUES ('69', '男士休闲运动鞋', '1', '2', '14', '1543481463');
INSERT INTO `shop_category` VALUES ('70', '男士运动户外鞋', '1', '2', '14', '1543481463');
INSERT INTO `shop_category` VALUES ('71', 'Shechers', '1', '2', '15', '1543481463');
INSERT INTO `shop_category` VALUES ('72', 'Mizuno', '1', '2', '15', '1543481463');
INSERT INTO `shop_category` VALUES ('73', 'Puma', '1', '2', '15', '1543481463');
INSERT INTO `shop_category` VALUES ('74', 'Mizuno', '1', '2', '15', '1543481463');
INSERT INTO `shop_category` VALUES ('75', '裙子', '1', '2', '16', '1543481463');
INSERT INTO `shop_category` VALUES ('76', '衬衫、雪纺衫', '1', '2', '16', '1543481463');
INSERT INTO `shop_category` VALUES ('77', '牛仔裤', '1', '2', '16', '1543481463');
INSERT INTO `shop_category` VALUES ('78', '衬衫', '1', '2', '17', '1543481463');
INSERT INTO `shop_category` VALUES ('79', '卫衣', '1', '2', '17', '1543481463');
INSERT INTO `shop_category` VALUES ('80', '牛仔裤', '1', '2', '17', '1543481463');
INSERT INTO `shop_category` VALUES ('81', '男童装', '1', '2', '18', '1543481463');
INSERT INTO `shop_category` VALUES ('82', '女童装', '1', '2', '18', '1543481463');
INSERT INTO `shop_category` VALUES ('83', '男婴服装', '1', '2', '18', '1543481463');
INSERT INTO `shop_category` VALUES ('84', '女士运动服', '1', '2', '52', '1543481463');
INSERT INTO `shop_category` VALUES ('85', '男士运动服', '1', '2', '52', '1543481463');
INSERT INTO `shop_category` VALUES ('86', '女童运动服', '1', '2', '52', '1543481463');
INSERT INTO `shop_category` VALUES ('87', '女士内衣', '1', '2', '53', '1543481463');
INSERT INTO `shop_category` VALUES ('88', '男士内衣', '1', '2', '53', '1543481463');
INSERT INTO `shop_category` VALUES ('89', '儿童内衣', '1', '2', '53', '1543481463');
INSERT INTO `shop_category` VALUES ('90', '手拎包', '1', '2', '19', '1543481463');
INSERT INTO `shop_category` VALUES ('91', '手拿包', '1', '2', '19', '1543481463');
INSERT INTO `shop_category` VALUES ('92', '单肩包', '1', '2', '19', '1543481463');
INSERT INTO `shop_category` VALUES ('93', '运动户外包', '1', '2', '20', '1543481463');
INSERT INTO `shop_category` VALUES ('94', '运动商务公文包', '1', '2', '20', '1543481463');
INSERT INTO `shop_category` VALUES ('95', '休闲背包', '1', '2', '20', '1543481463');
INSERT INTO `shop_category` VALUES ('96', '女士钱包', '1', '2', '21', '1543481463');
INSERT INTO `shop_category` VALUES ('97', '男士钱包', '1', '2', '21', '1543481463');
INSERT INTO `shop_category` VALUES ('98', '奶粉', '1', '2', '22', '1543481463');
INSERT INTO `shop_category` VALUES ('99', '奶瓶', '1', '2', '22', '1543481463');
INSERT INTO `shop_category` VALUES ('100', '母乳喂养', '1', '2', '22', '1543481463');
INSERT INTO `shop_category` VALUES ('101', '安抚奶嘴', '1', '2', '22', '1543481463');
INSERT INTO `shop_category` VALUES ('102', '四轮推车', '1', '2', '23', '1543481463');
INSERT INTO `shop_category` VALUES ('103', '三轮推车', '1', '2', '23', '1543481463');
INSERT INTO `shop_category` VALUES ('104', '童车配件', '1', '2', '23', '1543481463');
INSERT INTO `shop_category` VALUES ('105', '运安全座椅', '1', '2', '24', '1543481463');
INSERT INTO `shop_category` VALUES ('106', '安全门栏', '1', '2', '24', '1543481463');
INSERT INTO `shop_category` VALUES ('107', '婴儿监视器', '1', '2', '24', '1543481463');
INSERT INTO `shop_category` VALUES ('108', '男婴', '1', '2', '25', '1543481463');
INSERT INTO `shop_category` VALUES ('109', '女婴', '1', '2', '25', '1543481463');
INSERT INTO `shop_category` VALUES ('110', '婴幼儿鞋', '1', '2', '25', '1543481463');
INSERT INTO `shop_category` VALUES ('111', '箱包配件', '1', '2', '25', '1543481463');
INSERT INTO `shop_category` VALUES ('112', '模型收藏', '1', '2', '26', '1543481463');
INSERT INTO `shop_category` VALUES ('113', '火车模型', '1', '2', '26', '1543481463');
INSERT INTO `shop_category` VALUES ('114', '角色模型', '1', '2', '26', '1543481463');
INSERT INTO `shop_category` VALUES ('115', '电子学习', '1', '2', '27', '1543481463');
INSERT INTO `shop_category` VALUES ('116', '科学类玩具', '1', '2', '27', '1543481463');
INSERT INTO `shop_category` VALUES ('117', '考古与生物', '1', '2', '27', '1543481463');
INSERT INTO `shop_category` VALUES ('118', '汽车遥控', '1', '2', '28', '1543481463');
INSERT INTO `shop_category` VALUES ('119', '机器人', '1', '2', '28', '1543481463');
INSERT INTO `shop_category` VALUES ('120', '飞机遥控', '1', '2', '28', '1543481463');
INSERT INTO `shop_category` VALUES ('121', '纸质拼图', '1', '2', '29', '1543481463');
INSERT INTO `shop_category` VALUES ('122', '3D立体拼图', '1', '2', '29', '1543481463');
INSERT INTO `shop_category` VALUES ('123', '地板拼图', '1', '2', '29', '1543481463');
INSERT INTO `shop_category` VALUES ('124', '面部清洁', '1', '2', '30', '1543481463');
INSERT INTO `shop_category` VALUES ('125', '乳液面霜', '1', '2', '30', '1543481463');
INSERT INTO `shop_category` VALUES ('126', '化妆水', '1', '2', '30', '1543481463');
INSERT INTO `shop_category` VALUES ('127', '面部', '1', '2', '31', '1543481463');
INSERT INTO `shop_category` VALUES ('128', '眼部', '1', '2', '31', '1543481463');
INSERT INTO `shop_category` VALUES ('129', '唇部', '1', '2', '31', '1543481463');
INSERT INTO `shop_category` VALUES ('130', '洗发', '1', '2', '32', '1543481463');
INSERT INTO `shop_category` VALUES ('131', '护发', '1', '2', '32', '1543481463');
INSERT INTO `shop_category` VALUES ('132', '造型用品', '1', '2', '32', '1543481463');
INSERT INTO `shop_category` VALUES ('133', '沐浴', '1', '2', '33', '1543481463');
INSERT INTO `shop_category` VALUES ('134', '身体保养', '1', '2', '33', '1543481463');
INSERT INTO `shop_category` VALUES ('135', '手足护理', '1', '2', '33', '1543481463');
INSERT INTO `shop_category` VALUES ('136', '榨汁/搅拌机', '1', '2', '34', '1543481463');
INSERT INTO `shop_category` VALUES ('137', '咖啡机', '1', '2', '34', '1543481463');
INSERT INTO `shop_category` VALUES ('138', '电饭煲', '1', '2', '34', '1543481463');
INSERT INTO `shop_category` VALUES ('139', '保温杯', '1', '2', '35', '1543481463');
INSERT INTO `shop_category` VALUES ('140', '高端茶具', '1', '2', '35', '1543481463');
INSERT INTO `shop_category` VALUES ('141', '随手杯', '1', '2', '35', '1543481463');
INSERT INTO `shop_category` VALUES ('142', '煎锅/平底锅', '1', '2', '36', '1543481463');
INSERT INTO `shop_category` VALUES ('143', '汤锅', '1', '2', '36', '1543481463');
INSERT INTO `shop_category` VALUES ('144', '炒锅', '1', '2', '36', '1543481463');
INSERT INTO `shop_category` VALUES ('145', '空气净化器', '1', '2', '37', '1543481463');
INSERT INTO `shop_category` VALUES ('146', '吸尘器', '1', '2', '37', '1543481463');
INSERT INTO `shop_category` VALUES ('147', '加湿器', '1', '2', '37', '1543481463');
INSERT INTO `shop_category` VALUES ('148', '笔记本', '1', '2', '38', '1543481463');
INSERT INTO `shop_category` VALUES ('149', '台式机', '1', '2', '38', '1543481463');
INSERT INTO `shop_category` VALUES ('150', '平板电脑', '1', '2', '38', '1543481463');
INSERT INTO `shop_category` VALUES ('151', '内存', '1', '2', '39', '1543481463');
INSERT INTO `shop_category` VALUES ('152', '显示器', '1', '2', '39', '1543481463');
INSERT INTO `shop_category` VALUES ('153', '硬盘', '1', '2', '39', '1543481463');
INSERT INTO `shop_category` VALUES ('154', '鼠标键盘', '1', '2', '40', '1543481463');
INSERT INTO `shop_category` VALUES ('155', '笔记本配件', '1', '2', '40', '1543481463');
INSERT INTO `shop_category` VALUES ('156', '平板电脑配件', '1', '2', '40', '1543481463');
INSERT INTO `shop_category` VALUES ('157', '内置硬盘', '1', '2', '41', '1543481463');
INSERT INTO `shop_category` VALUES ('158', '移动硬盘', '1', '2', '41', '1543481463');
INSERT INTO `shop_category` VALUES ('159', 'U盘', '1', '2', '41', '1543481463');
INSERT INTO `shop_category` VALUES ('160', '耳机', '1', '2', '42', '1543481463');
INSERT INTO `shop_category` VALUES ('161', '音响', '1', '2', '42', '1543481463');
INSERT INTO `shop_category` VALUES ('162', '智能穿戴', '1', '2', '42', '1543481463');
INSERT INTO `shop_category` VALUES ('163', '运动休闲服', '1', '2', '43', '1543481463');
INSERT INTO `shop_category` VALUES ('164', '瑜伽服', '1', '2', '43', '1543481463');
INSERT INTO `shop_category` VALUES ('165', '跑步服', '1', '2', '43', '1543481463');
INSERT INTO `shop_category` VALUES ('166', '男士运动鞋', '1', '2', '44', '1543481463');
INSERT INTO `shop_category` VALUES ('167', '男士户外鞋', '1', '2', '44', '1543481463');
INSERT INTO `shop_category` VALUES ('168', '女士运动鞋', '1', '2', '44', '1543481463');
INSERT INTO `shop_category` VALUES ('169', '跑步', '1', '2', '45', '1543481463');
INSERT INTO `shop_category` VALUES ('170', '瑜伽', '1', '2', '45', '1543481463');
INSERT INTO `shop_category` VALUES ('171', '健身', '1', '2', '45', '1543481463');
INSERT INTO `shop_category` VALUES ('172', '钓鱼', '1', '2', '46', '1543481463');
INSERT INTO `shop_category` VALUES ('173', '高尔夫', '1', '2', '46', '1543481463');
INSERT INTO `shop_category` VALUES ('174', '骑行', '1', '2', '46', '1543481463');
INSERT INTO `shop_category` VALUES ('175', '拳击', '1', '2', '46', '1543481463');
INSERT INTO `shop_category` VALUES ('176', '钢笔', '1', '2', '47', '1543481463');
INSERT INTO `shop_category` VALUES ('177', '圆珠笔', '1', '2', '47', '1543481463');
INSERT INTO `shop_category` VALUES ('178', '铅笔', '1', '2', '47', '1543481463');
INSERT INTO `shop_category` VALUES ('179', '单功能打印机', '1', '2', '48', '1543481463');
INSERT INTO `shop_category` VALUES ('180', '投影仪', '1', '2', '48', '1543481463');
INSERT INTO `shop_category` VALUES ('181', '监控设备', '1', '2', '48', '1543481463');
INSERT INTO `shop_category` VALUES ('182', '硒鼓', '1', '2', '49', '1543481463');
INSERT INTO `shop_category` VALUES ('183', '墨粉', '1', '2', '49', '1543481463');
INSERT INTO `shop_category` VALUES ('184', '打印标签', '1', '2', '49', '1543481463');
INSERT INTO `shop_category` VALUES ('185', '文件档案管理', '1', '2', '50', '1543481463');
INSERT INTO `shop_category` VALUES ('186', '桌上用品', '1', '2', '50', '1543481463');
INSERT INTO `shop_category` VALUES ('187', '粘胶紧固用品', '1', '2', '50', '1543481463');
INSERT INTO `shop_category` VALUES ('188', '计算器', '1', '2', '51', '1543481463');
INSERT INTO `shop_category` VALUES ('189', '账簿', '1', '2', '51', '1543481463');
INSERT INTO `shop_category` VALUES ('190', '印章', '1', '2', '51', '1543481463');
INSERT INTO `shop_category` VALUES ('191', '男表', '1', '2', '54', '1543481463');
INSERT INTO `shop_category` VALUES ('192', '女表', '1', '2', '54', '1543481463');
INSERT INTO `shop_category` VALUES ('193', '钟', '1', '2', '54', '1543481463');
INSERT INTO `shop_category` VALUES ('194', '女士饰品', '1', '2', '55', '1543481463');
INSERT INTO `shop_category` VALUES ('195', '男士饰品', '1', '2', '55', '1543481463');
INSERT INTO `shop_category` VALUES ('196', '饰品配件', '1', '2', '55', '1543481463');

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_selfprice` float DEFAULT NULL,
  `goods_marketprice` float DEFAULT NULL,
  `goods_up` tinyint(4) DEFAULT NULL,
  `goods_new` tinyint(4) NOT NULL DEFAULT '2',
  `goods_best` tinyint(4) NOT NULL DEFAULT '2',
  `sale_num` int(11) DEFAULT NULL,
  `goods_hot` tinyint(4) NOT NULL DEFAULT '2',
  `goods_num` int(11) DEFAULT NULL,
  `goods_des` text,
  `goods_score` int(11) DEFAULT NULL,
  `goods_img` varchar(60) DEFAULT NULL,
  `goods_imgs` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `fk_shop_goods_shop_category_idx` (`cate_id`),
  KEY `fk_shop_goods_shop_brand1_idx` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES ('1', 'TAMARIS 女 低跟鞋', '299', '400', '1', '1', '1', '12313', '2', '10', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '299', '20181205\\3fb95cae319c8330fada42a01b5c34bc.jpg', '|20181129\\1b10ec8a523e9c3d90c0e43388a90256.jpg|20181129\\1637e95ec8d2490a1ae49035dffaeb77.jpg|20181129\\08dc29c46ed51004c18eb513a46cfbeb.jpg|20181205\\ad02835cc12cd19445c6f5a76424bb3c.jpg', '1543492224', '56', '1');
INSERT INTO `shop_goods` VALUES ('2', 'ZAXY POP BOW II系列 女 芭蕾鞋', '199', '300', '1', '1', '1', '123123', '2', '6', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '299', '20181205\\31f8f32b40221065dba7b1ae85a6f03d.jpg', '|20181129\\60c31e90d17c563ba1ab162c667f3e39.jpg|20181129\\b3caeb8fe077148377501511400a533a.jpg|20181129\\9cfd1eb92d2d14dd294e3fb01c6fe992.jpg|20181205\\dfc0f88603b6b6f706cb8de0c6909bab.jpg', '1543492343', '57', '2');
INSERT INTO `shop_goods` VALUES ('3', 'Clarks 女士 Juliet Lora 乐福鞋', '359', '450', '1', '1', '1', '4534534', '2', '4', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '299', '20181205\\5919517b5144afcff1233d1fa6d43855.jpg', '|20181129\\98ea60915a8862d8ec68303c201ad193.jpg|20181129\\08705574d0c0322d3919dea67ed7c790.jpg|20181129\\32412ba22b907e4c1141486f17a77e7a.jpg|20181205\\88cea120c672e5f6cb3e2004bd061c4f.jpg', '1543492471', '58', '3');
INSERT INTO `shop_goods` VALUES ('4', 'Crocs 卡骆驰 中性卡骆班洞洞鞋', '159', '200', '1', '1', '1', '123123', '2', '10', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '159', '20181205\\79d3f2ad92319cd3cf352aa33f6821f4.jpg', '|20181129\\c181e52c61b780120a20ab5d443cfa63.jpg|20181129\\bddda5591a119b2c9fd5ae5f90a84ddc.jpg|20181129\\11892b8f622c6c4b89cbaaeb2d7d442d.jpg|20181205\\e8d017311e574c33274e37a7e5fbdaca.jpg', '1543492577', '59', '4');
INSERT INTO `shop_goods` VALUES ('5', 'Clarks 男士 cotrell 边缘牛津鞋', '349', '500', '1', '1', '1', '434', '2', '500', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '349', '20181205\\77ed3c55e4c2c1198bee4cfd93ebc7b1.jpg', '|20181129\\10a3dd16f02254e98c77c0d57d47e4d6.jpg|20181129\\e15d1885f265feb7a170cf6462d5e38d.jpg|20181129\\763335f857aca5efcac28aef30ae2204.jpg', '1543492729', '60', '5');
INSERT INTO `shop_goods` VALUES ('6', '春秋款 真皮时尚男鞋', '239', '500', '1', '1', '1', '1245', '2', '7', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '349', '20181129\\ce76ba8b0dfcd8285ec83c2e9615350b.jpg', '|20181129\\c60fa51a529ab19605c94e2f28964787.jpg|20181129\\7ee569fd031046bbba93ab8e3cfebff4.jpg|20181129\\8100715a599a11035677b78c2528078c.jpg', '1543492840', '61', '6');
INSERT INTO `shop_goods` VALUES ('7', '无袖蕾丝花边中长裙 ', '239', '500', '1', '1', '1', '12', '2', '500', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '349', '20181206\\8822d72148a41239618873b6d7ddfe90.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493248', '75', '7');
INSERT INTO `shop_goods` VALUES ('8', '多层式字母图案上衣', '250', '250', '1', '1', '1', '31', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\c4758e67fd69636b6c93d82ba4e5529b.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jp', '1543493329', '76', '8');
INSERT INTO `shop_goods` VALUES ('9', 'Lee Women\'s Classic-Fit Monroe Straight-Leg', '250', '250', '1', '1', '1', '3123', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\8543b9202c9760ee84cdc3a38421b00b.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493368', '77', '9');
INSERT INTO `shop_goods` VALUES ('10', 'Lee 男式长袖牛津衬衫', '250', '250', '1', '1', '1', '123', '1', '248', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181205\\d2cb3c772385945f3661c08a362c97fe.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493416', '78', '10');
INSERT INTO `shop_goods` VALUES ('11', 'Powerblend套头卫衣', '250', '250', '1', '1', '1', '33', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\aeb4d6e179f9031346d7bfdd68b22216.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493446', '79', '11');
INSERT INTO `shop_goods` VALUES ('12', 'Diver Japanese 自动手表 ', '600', '700', '1', '1', '1', '1212', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\d99d5a6feac0631a60b627a775bca307.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493758', '191', '11');
INSERT INTO `shop_goods` VALUES ('13', '玫瑰金色方晶锆石独特时尚环状耳环女士礼品 ', '100', '300', '1', '1', '1', '23', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\31ba5485b9066516e8b1882a9a6bd392.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493805', '191', '11');
INSERT INTO `shop_goods` VALUES ('14', '鳄鱼皮派对手包女士时尚单肩包 ', '1112', '300', '1', '1', '1', '121231', '1', '247', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\e351ec3d85d6f6c642cc35abbdc20a7a.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493920', '91', '11');
INSERT INTO `shop_goods` VALUES ('15', 'Mombella Mimi 蘑菇牙胶', '1112', '300', '1', '1', '1', '13', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\10799801ee415a1b9cd96b2ef62b7111.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543493988', '101', '11');
INSERT INTO `shop_goods` VALUES ('16', '可折叠加长门带门烧烤壁炉保护防火门 ', '838', '300', '1', '1', '1', '312312', '1', '250', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '250', '20181129\\167c546e5ae45c6c0f7855b8449eabcb.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543494040', '106', '11');
INSERT INTO `shop_goods` VALUES ('17', '轻便婴儿推车柠檬黄', '1500', '1600', '1', '2', '2', '876345', '2', '123', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '1500', '20181203\\6145b8e2bcdb26aeb327c6b2883ca4ce.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543825600', '102', '12');
INSERT INTO `shop_goods` VALUES ('18', '六层纱布大号蘑菇睡袋 ', '250', '300', '1', '2', '2', '12312', '2', '123', '<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\a5.jpg\" alt=\"aaa\">', '1500', '20181203\\bc5972dfe2712e1f8ab52843044422f5.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpgg', '1543825700', '110', '13');
INSERT INTO `shop_goods` VALUES ('19', 'b.box 防水罩围嘴', '250', '300', '1', '2', '2', '21', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\fe4b69f197bc8541037fdfaeabf5be4a.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543825754', '109', '13');
INSERT INTO `shop_goods` VALUES ('20', 'Fisher-Price Think & Learn Rocktopus', '400', '410', '1', '2', '2', '1212', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\7ee464f71a92a67a5d1794e4b760da44.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543825810', '116', '14');
INSERT INTO `shop_goods` VALUES ('21', '儿童遥控飞机玩具(豪华双游戏套装)', '899', '900', '1', '2', '2', '1', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\902876b69824fbc34dfde4747bd03fa0.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543825867', '120', '15');
INSERT INTO `shop_goods` VALUES ('22', '益智玩具 木质门锁和门闩游戏板', '200', '215', '1', '2', '2', '11', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\b8d80f6ea275ab04e97d15141a2fda21.jpg', '|20181206\\bc96cabd588eb6e3d6757f8f42ae503f.jpg|20181206\\8ce02b12919318a64134a02fbc1d91f8.jpg|20181206\\f8ff0805ae61cfef57a8f96621b06b35.jpg', '1543825924', '120', '15');
INSERT INTO `shop_goods` VALUES ('23', '圣诞老人快速圣诞火车套装', '400', '430', '1', '2', '2', '5353', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\480986e03459a6c9173f5ca9c6b0909c.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543825998', '113', '15');
INSERT INTO `shop_goods` VALUES ('24', 'SONIC透肤声波洁面仪(粉红色)', '804', '810', '1', '2', '2', '111', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\c90d580282d0c801034662dbe048ed42.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826118', '124', '11');
INSERT INTO `shop_goods` VALUES ('25', 'SONIC透肤声波洁面仪(紫红色)', '750', '760', '1', '2', '2', '545645', '2', '120', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\824e0e958c74a7c28f0e9d519ad2a663.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826136', '124', '11');
INSERT INTO `shop_goods` VALUES ('26', 'SONIC透肤声波洁面仪(天蓝色)', '701', '710', '1', '2', '2', '2312', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\41bf0820a44f30cc3a7b1992f2931136.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826155', '124', '11');
INSERT INTO `shop_goods` VALUES ('27', '资生堂丝蓓绮蓝椿无硅洗护套装', '70', '71', '1', '2', '2', '112', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\f7c031132f21317b7e4fa9bdc5fc3bcd.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826307', '131', '11');
INSERT INTO `shop_goods` VALUES ('28', 'Tree Hut牛油果磨砂膏', '160', '71', '1', '2', '2', '45345', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\48abcbceb9a954669895bc501a9655b2.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826368', '133', '9');
INSERT INTO `shop_goods` VALUES ('29', 'DIOR 迪奥 克丽斯汀 魅惑润唇膏001', '269', '270', '1', '2', '2', '78678', '2', '122', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\33c74fa496884fa8c3f4d0d5fa8bec31.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826559', '129', '14');
INSERT INTO `shop_goods` VALUES ('30', 'Essenza Mini 胶囊咖啡机', '561', '580', '1', '2', '2', '45678', '2', '122', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181205\\6cfb0270559735198afa8104a167151b.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826867', '137', '4');
INSERT INTO `shop_goods` VALUES ('31', '德国WMF福腾宝意大利进口不粘锅', '1400', '1500', '1', '2', '2', '789', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\3d3d2e079304590ced2de266cab91d96.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826920', '142', '7');
INSERT INTO `shop_goods` VALUES ('32', 'Contigo Autospout Striker Chill儿童不锈钢水杯', '1400', '1500', '1', '2', '2', '789', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\a4cf3a6ab534c304d193a2266e3a8a0a.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543826990', '141', '15');
INSERT INTO `shop_goods` VALUES ('33', '领豪 复古 21682-56 烤面包机 ', '500', '600', '1', '2', '2', '7897', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\34fd1953bb15e83fa0a1d5213664797e.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827067', '138', '10');
INSERT INTO `shop_goods` VALUES ('34', 'Wedgwood Wonderlust 蓝色 Pagoda 3 件套茶具', '1199', '1200', '1', '2', '2', '9898', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\4aaec4b97e52f708c76d482626ae43bb.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827151', '140', '10');
INSERT INTO `shop_goods` VALUES ('35', '珐琅铸铁炖锅', '1196', '1200', '1', '2', '2', '777', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\19e7c3a1b1001836d242643b6587209a.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827230', '143', '13');
INSERT INTO `shop_goods` VALUES ('36', '联想 Thinkpad X1 Yoga * 3 代', '14157', '15000', '1', '2', '2', '7867', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\f9d703f273aaae0f01fae2ad1fe340b1.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827320', '148', '11');
INSERT INTO `shop_goods` VALUES ('37', 'ASUS ROG Zephyrus S 超薄游戏笔记本电脑', '11894', '12000', '1', '2', '2', '1212', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\34f37f06f9f33f2b71c38b7834587f69.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827387', '148', '15');
INSERT INTO `shop_goods` VALUES ('38', '联想 Thinkpad X1 Yoga * 3 代', '14157', '15000', '1', '2', '2', '212', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\f9d703f273aaae0f01fae2ad1fe340b1.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827320', '148', '11');
INSERT INTO `shop_goods` VALUES ('39', 'ASUS ROG Zephyrus S 超薄游戏笔记本电脑', '11894', '12000', '1', '2', '2', '120', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\34f37f06f9f33f2b71c38b7834587f69.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827387', '148', '15');
INSERT INTO `shop_goods` VALUES ('40', '联想 Thinkpad X1 Yoga * 3 代', '14157', '15000', '1', '2', '2', '213', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\f9d703f273aaae0f01fae2ad1fe340b1.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827320', '148', '11');
INSERT INTO `shop_goods` VALUES ('41', 'ASUS ROG Zephyrus S 超薄游戏笔记本电脑', '11894', '12000', '1', '2', '2', '878', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\34f37f06f9f33f2b71c38b7834587f69.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827387', '148', '15');
INSERT INTO `shop_goods` VALUES ('42', '联想 Thinkpad X1 Yoga * 3 代', '14157', '15000', '1', '2', '2', '6969', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\f9d703f273aaae0f01fae2ad1fe340b1.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827320', '148', '11');
INSERT INTO `shop_goods` VALUES ('43', 'ASUS ROG Zephyrus S 超薄游戏笔记本电脑', '11894', '12000', '1', '2', '2', '852', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\34f37f06f9f33f2b71c38b7834587f69.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827387', '148', '15');
INSERT INTO `shop_goods` VALUES ('48', '90 Degree BY reflex 女式 POWER FLEX 瑜伽裤 5', '150', '150', '1', '2', '2', '121', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\7c8e5e9abeb8dcdcda7eed561b9d1587.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827532', '164', '9');
INSERT INTO `shop_goods` VALUES ('52', 'STAEDTLER施德楼 速动中车圆规 550 02  4', '99', '100', '1', '2', '2', '1', '2', '123', '狗是人类的好朋友<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\timg.jpg\" alt=\"aaa\">', '1500', '20181203\\997843249e2cc2795cd9e55ba549175f.jpg', '|20181203\\ac74ee98eeccc65074f638dccc62e1d9.jpg|20181203\\10448b20439f4b98530c6536b5900b7e.jpg|20181203\\07d092b3dc3f03df21d29b969d5071ea.jpg', '1543827632', '186', '10');
INSERT INTO `shop_goods` VALUES ('54', 'ASUS ROG Zephyrus S 超薄游戏笔记本电脑6', '11894', '12000', '1', '1', '2', null, '2', '99', '华硕笔记本，给你不一样的体验<img src=\"http://www.myshop.com/public/uploads/editimg/20181205\\fc9694f7dbbffefe242c4e2503a3c503.jpg\" alt=\"aaa\">', '11894', '20181205\\5b518e1c06724371958c1f474d0dbe94.jpg', '|20181205\\2b10e35f682e58964adce660d3927fe3.jpg|20181205\\1bfe784e109e2a3888cc5c61ce1a77e4.jpg|20181205\\dbb5e2f274d7d2e1a35ee4988d1eebac.jpg', '1543990162', '148', '7');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_amount` float DEFAULT NULL,
  `order_score` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT '1' COMMENT '支付方式 1 支付宝 2 货到 3转账',
  `pay_status` tinyint(4) DEFAULT '1' COMMENT '1 待支付 2 已支付',
  `order_message` varchar(100) DEFAULT '1' COMMENT '1 待支付 2已取消 3已支付 4已确认 5已发货 6已签署 7已完成',
  `order_status` tinyint(4) DEFAULT '1',
  `pay_time` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('1', '119022827019', '2', '0', '0', '1', '1', '1', '1', null, null);

-- ----------------------------
-- Table structure for shop_order_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_address`;
CREATE TABLE `shop_order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `o_province` varchar(20) DEFAULT NULL,
  `o_city` varchar(20) DEFAULT NULL,
  `o_district` varchar(20) DEFAULT NULL,
  `consignee_name` varchar(30) DEFAULT NULL,
  `consignee_tel` char(11) DEFAULT NULL,
  `detailed_address` varchar(50) DEFAULT '',
  `address_status` tinyint(4) DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_address
-- ----------------------------
INSERT INTO `shop_order_address` VALUES ('1', '2', '1', '河北', '衡水', null, '123', '1856588888', '啥好端端哈', '1', null);
INSERT INTO `shop_order_address` VALUES ('2', null, null, '山东', '济南', '付出', null, null, '安徽u', '1', null);

-- ----------------------------
-- Table structure for shop_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE `shop_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(30) DEFAULT NULL,
  `goods_selfprice` decimal(10,0) DEFAULT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `buy_number` int(11) DEFAULT NULL,
  `express_number` int(11) DEFAULT NULL,
  `goods_status` tinyint(4) DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_detail
-- ----------------------------
INSERT INTO `shop_order_detail` VALUES ('1', '2', '1', '2', 'ZAXY POP BOW II系列 女 芭蕾鞋', '199', '20181205\\31f8f32b40221065dba7b1ae85a6f03d.jpg', '1', null, '2', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18565188312', '268e27056a3e52cf3755d193cbeb0594');
INSERT INTO `user` VALUES ('2', '18565188311', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `user` VALUES ('3', '18565188319', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `user` VALUES ('4', '18565188318', 'e10adc3949ba59abbe56e057f20f883e');
