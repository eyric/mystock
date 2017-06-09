#
# TABLE STRUCTURE FOR: ci_account
#

DROP TABLE IF EXISTS ci_account;

CREATE TABLE `ci_account` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `amount` double DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='结算账户';

INSERT INTO ci_account (`id`, `name`, `number`, `status`, `amount`, `date`, `type`, `isDelete`) VALUES (3, '工商银行', '0002', 1, '600000', '2015-04-24', 1, 0);
INSERT INTO ci_account (`id`, `name`, `number`, `status`, `amount`, `date`, `type`, `isDelete`) VALUES (4, '农业银行', '0001', 1, '500000', '2015-04-02', 1, 0);


#
# TABLE STRUCTURE FOR: ci_account_info
#

DROP TABLE IF EXISTS ci_account_info;

CREATE TABLE `ci_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billNo` varchar(25) DEFAULT '' COMMENT '销售单号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `accId` int(11) DEFAULT '0' COMMENT '结算账户ID',
  `payment` double DEFAULT '0' COMMENT '收款金额  采购退回为正',
  `payment2` double DEFAULT '0' COMMENT '采购退回为负',
  `wayId` int(11) DEFAULT '0' COMMENT '结算方式ID',
  `settlement` varchar(50) DEFAULT '' COMMENT '结算号',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `transType` int(11) DEFAULT '0',
  `transTypeName` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='结算明细';

INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `payment2`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (68, 126, 159, 'CG201505211638484', 'PUR', '2015-05-21', 4, '-100', '100', 0, '', '', 150501, '普通采购', 0);


#
# TABLE STRUCTURE FOR: ci_address
#

DROP TABLE IF EXISTS ci_address;

CREATE TABLE `ci_address` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `shortName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT ' ',
  `postalcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkman` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`postalcode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发货地址';

INSERT INTO ci_address (`id`, `shortName`, `postalcode`, `province`, `city`, `area`, `address`, `linkman`, `phone`, `mobile`, `isdefault`, `isDelete`) VALUES (6, '苏州相城区1', '123213', '江苏省', '苏州市', '相城区', '相城大道003号', '123123', '12312', '3123', 1, 0);


#
# TABLE STRUCTURE FOR: ci_admin
#

DROP TABLE IF EXISTS ci_admin;

CREATE TABLE `ci_admin` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台用户';

INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (1, 'admin', '538b65e68ce92c40af55cfeca5fc4068', 1, '小阳', '', NULL, 0);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (2, 'admin123', 'eb1f0aad7f7ac84928f2d67989e3d620', 1, '李明芳', 'asd', '1,2,3,4,5,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,6,10,7,8,9,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83', 1);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (3, '002', 'eb1f0aad7f7ac84928f2d67989e3d620', 1, '老板', '', NULL, 1);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (4, 'aa', '93cea8d157a25fc9bbe082ecb59ed73a', 1, NULL, '13616216627', NULL, 1);


#
# TABLE STRUCTURE FOR: ci_assistingprop
#

DROP TABLE IF EXISTS ci_assistingprop;

CREATE TABLE `ci_assistingprop` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='辅助属性';

INSERT INTO ci_assistingprop (`id`, `name`, `disable`, `isDelete`) VALUES (8, '尺码', 0, 0);
INSERT INTO ci_assistingprop (`id`, `name`, `disable`, `isDelete`) VALUES (10, '颜色', 0, 0);


#
# TABLE STRUCTURE FOR: ci_assistsku
#

DROP TABLE IF EXISTS ci_assistsku;

CREATE TABLE `ci_assistsku` (
  `skuId` int(11) NOT NULL AUTO_INCREMENT,
  `skuClassId` int(11) DEFAULT '0',
  `skuAssistId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`skuId`),
  KEY `id` (`skuClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='辅助组合属性';

INSERT INTO ci_assistsku (`skuId`, `skuClassId`, `skuAssistId`, `skuName`, `isDelete`) VALUES (13, 0, '10,8', '颜色+尺码', 0);
INSERT INTO ci_assistsku (`skuId`, `skuClassId`, `skuAssistId`, `skuName`, `isDelete`) VALUES (14, 13, '39,40', '黄/L', 0);
INSERT INTO ci_assistsku (`skuId`, `skuClassId`, `skuAssistId`, `skuName`, `isDelete`) VALUES (15, 13, '39,41', '黄/M', 0);


#
# TABLE STRUCTURE FOR: ci_category
#

DROP TABLE IF EXISTS ci_category;

CREATE TABLE `ci_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(6) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '区别',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(4) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户、商品、供应商类别';

INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (1, '公司门店', 0, '1', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (2, '私人门店', 0, '2', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (3, '干货供应商', 0, '3', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (4, '调料供应商', 0, '4', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (5, '干货类', 0, '5', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (6, '工作服', 0, '6', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (7, '冻货类', 0, '7', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (8, '餐具类', 0, '8', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (9, '厨具类', 0, '9', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (10, '电器类', 17, '28,17,10', 3, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (11, '香料类', 12, '5,12,11', 4, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (12, '调料类', 5, '5,12', 2, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (13, '冻货供应商', 0, '13', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (14, '厨具供应商', 0, '14', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (15, '工作服供应商2', 0, '15', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (17, '物品类2', 28, '28,17', 2, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (19, '燃料类', 0, '19', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (20, '现金', 0, '20', 1, 0, 1, 'PayMethod', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (21, '刷卡', 0, '21', 1, 0, 1, 'PayMethod', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (23, '99999', 0, '23', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (28, '1111111', 0, '28', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (29, '213123', 0, '29', 1, 0, 1, 'raccttype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (30, '12312', 0, '30', 1, 0, 1, 'paccttype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (31, '11122222', 0, '31', 1, 0, 1, '6', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (32, '1112222', 0, '32', 1, 0, 1, '6', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (33, '司法所', 0, '33', 1, 0, 1, '6', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (34, '1212311999', 0, '34', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (35, '支付宝', 0, '35', 1, 0, 1, '', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (36, '支付宝', 0, '36', 1, 0, 1, 'PayMethod', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (37, '3333', 0, '37', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (38, '红', 0, '38', 1, 0, 1, '10', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (39, '黄', 0, '39', 1, 0, 1, '10', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (40, 'L', 0, '40', 1, 0, 1, '8', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (41, 'M', 0, '41', 1, 0, 1, '8', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (42, 'S', 0, '42', 1, 0, 1, '8', '', 1, 0, 0);


#
# TABLE STRUCTURE FOR: ci_contact
#

DROP TABLE IF EXISTS ci_contact;

CREATE TABLE `ci_contact` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '客户名称',
  `number` varchar(50) DEFAULT '0' COMMENT '客户编号',
  `cCategory` smallint(6) DEFAULT '0' COMMENT '客户类别',
  `cCategoryName` varchar(50) DEFAULT '' COMMENT '分类名称',
  `taxRate` double DEFAULT '0' COMMENT '税率',
  `amount` double DEFAULT '0' COMMENT '期初应付款',
  `periodMoney` double DEFAULT '0' COMMENT '期初预付款',
  `difMoney` double DEFAULT '0' COMMENT '初期往来余额',
  `beginDate` date DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `linkMans` text COMMENT '客户联系方式',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `type` tinyint(1) DEFAULT '-10' COMMENT '-10客户  10供应商',
  `contact` text,
  `cLevel` smallint(5) DEFAULT '1' COMMENT '客户等级ID',
  `cLevelName` varchar(50) DEFAULT '' COMMENT '客户等级',
  `pinYin` varchar(50) DEFAULT '',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='客户、供应商管理';

INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `status`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (158, '1111', '00021', 0, NULL, '17', '11', '111', '-100', '2015-03-23', '123123', '[{\"linkName\":\"2\",\"linkMobile\":\"3\",\"linkPhone\":\"1\",\"linkIm\":\"1\",\"linkFirst\":1,\"id\":0}]', 1, -10, '00021 1111', 1, '批发客户', '1111', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `status`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (159, '123', '3123123', 15, '工作服供应商2', '17', '1111', '222', '889', '2015-03-23', '123123123123', '[{\"linkName\":\"11\",\"linkMobile\":\"22\",\"linkPhone\":\"22\",\"linkIm\":\"22\",\"linkFirst\":1,\"id\":0}]', 1, 10, '3123123 123', 0, '', '123', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `status`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (160, '12112', '11111', 0, NULL, '0', '0', '111', '-111', '2015-03-23', '21211221', '[{\"linkName\":\"222\",\"linkMobile\":\"222\",\"linkPhone\":\"22\",\"linkIm\":\"22\",\"linkFirst\":1,\"id\":0}]', 1, -10, '11111 12112', 0, '零售客户', '12112', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `status`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (161, '111111', '0002', 2, '私人门店', '0', '1111', '111', '1000', '2015-03-23', '1111', '[{\"linkName\":\"11\",\"linkMobile\":\"11\",\"linkPhone\":\"11\",\"linkIm\":\"11\",\"linkFirst\":1,\"id\":0}]', 1, -10, '0002 111111', 0, '零售客户', '111111', 0, 0);


#
# TABLE STRUCTURE FOR: ci_goods
#

DROP TABLE IF EXISTS ci_goods;

CREATE TABLE `ci_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商品编号',
  `quantity` double DEFAULT '0' COMMENT '起初数量',
  `spec` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规格',
  `baseUnitId` smallint(6) DEFAULT '0' COMMENT '单位ID',
  `unitName` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单位名称',
  `categoryId` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `categoryName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分类名称',
  `purPrice` double DEFAULT '0' COMMENT '预计采购价',
  `salePrice` double DEFAULT '0' COMMENT '预计销售价',
  `unitCost` double DEFAULT '0' COMMENT '单位成本',
  `amount` double DEFAULT '0' COMMENT '期初总价',
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `goods` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `propertys` text COLLATE utf8_unicode_ci COMMENT '初期设置',
  `vipPrice` double DEFAULT '0' COMMENT '会员价',
  `lowQty` double DEFAULT '0',
  `length` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `height` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `highQty` double DEFAULT '0',
  `isSerNum` double DEFAULT '0',
  `barCode` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `discountRate1` double DEFAULT '0' COMMENT '0',
  `discountRate2` double DEFAULT '0',
  `locationId` int(11) DEFAULT '0',
  `locationName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wholesalePrice` double DEFAULT '0',
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `skuAssistId` text COLLATE utf8_unicode_ci COMMENT '辅助属性分类',
  `pinYin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `unitId` smallint(6) DEFAULT '0',
  `files` text COLLATE utf8_unicode_ci COMMENT '图片路径',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `unitTypeId` int(11) DEFAULT '0',
  `assistIds` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `assistName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `assistUnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `jianxing` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `josl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `skuClassId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `property` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `safeDays` double DEFAULT '0',
  `advanceDay` double DEFAULT '0',
  `isWarranty` double DEFAULT '0',
  `delete` int(11) DEFAULT '0',
  `weight` double DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常  1删除',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品管理';

INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (3, '1', '1234', '0', '1', 8, '桶', 10, '电器类', '1', '1', '0', '0', '', 1, '', '[{\"locationId\":6,\"quantity\":\"1.00\",\"unitCost\":0,\"amount\":0,\"skuId\":\"15\",\"skuName\":\"黄/M\",\"id\":0},{\"locationId\":6,\"quantity\":\"2.00\",\"unitCost\":0,\"amount\":0,\"skuId\":\"14\",\"skuName\":\"黄/L\",\"id\":0}]', '1', '1', '1', '1', '111', '0', '1', '1', '1', 5, '苏州仓库', '1', '1', '10,8', '1', 0, NULL, 0, 0, '', '', '', '0', '', '', '', '0', '0', '0', 0, '1', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (4, '1', '1234111', '0', '1', 8, '桶', 10, '电器类', '1', '1', '0', '0', '123123', 1, '', '[{\"locationId\":6,\"quantity\":\"1.00\",\"unitCost\":0,\"amount\":0,\"skuId\":15,\"skuName\":\"黄/M\",\"serNum\":\"[]\",\"id\":\"5\"},{\"locationId\":6,\"quantity\":\"2.00\",\"unitCost\":0,\"amount\":0,\"skuId\":14,\"skuName\":\"黄/L\",\"serNum\":\"[]\",\"id\":\"6\"}]', '1', '1', '1', '1', '111', '0', '1111', '1', '1', 5, '苏州仓库', '1', '1', '10,8', '1', 0, NULL, 0, 0, '', '', '', '0', '', '', '', '0', '0', '0', 0, '1', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (5, '雪菜555', '0012212', '0', '33', 3, '斤', 7, '冻货类', '111', '222', '0', '0', '', 1, '', '[]', '0', '1', '', '', '111', '0', '123123', '0', '0', 7, '北京仓库', '0', '', NULL, '555', 0, NULL, 0, 0, '', '', '', '0', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (6, '飞机', '2213', '0', '13', 8, '桶', 7, '冻货类', '1', '1111', '0', '0', '', 1, '', '[{\"locationId\":7,\"quantity\":\"222.00\",\"unitCost\":11,\"amount\":2442,\"id\":\"89\"},{\"locationId\":6,\"quantity\":\"111.00\",\"unitCost\":11,\"amount\":1221,\"id\":\"90\"},{\"locationId\":5,\"quantity\":\"333.00\",\"unitCost\":22,\"amount\":7326,\"id\":\"91\"}]', '0', '1', '', '', '111', '0', '6909557000294', '0', '0', 0, '', '1', '', NULL, 'ha', 0, NULL, 0, 0, '', '', '', '0', '', '', '', '0', '0', '0', 0, '0', 0);


#
# TABLE STRUCTURE FOR: ci_invoice
#

DROP TABLE IF EXISTS ci_invoice;

CREATE TABLE `ci_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` varchar(15) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='采购  销售  盘亏  盘盈 初期 单据';

INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (126, 159, 'CG201505211638484', 1, '小阳', '150501', '114', '114', '100', '2015-05-21', '', '14', '0', '0', '4', '0', 0, '', '0', '0', 0, 4, 'PUR', '2015-05-21 17:06:04', 0, '购货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (127, 161, 'XS201505211642022', 1, '小阳', '150601', '1335', '1335', '0', '2015-05-21', '', '1335', '0', '0', '4', '0', 0, '', '0', '0', 0, 0, 'SALE', NULL, 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);


#
# TABLE STRUCTURE FOR: ci_invoice_info
#

DROP TABLE IF EXISTS ci_invoice_info;

CREATE TABLE `ci_invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `goodsid` (`invId`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `type,billdate` (`transType`,`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COMMENT='单据明细';

INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (342, 127, 161, 'XS201505211642022', 150601, '1', '2015-05-21', '', 3, '1', '0', '0', '-1', 6, '0', '0', '0', -1, -1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (343, 127, 161, 'XS201505211642022', 150601, '1', '2015-05-21', '', 4, '1', '0', '0', '-1', 6, '0', '0', '0', -1, -1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (344, 127, 161, 'XS201505211642022', 150601, '222', '2015-05-21', '', 5, '222', '0', '0', '-1', 6, '0', '0', '0', -1, -1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (345, 127, 161, 'XS201505211642022', 150601, '1111', '2015-05-21', '', 6, '1111', '0', '0', '-1', 6, '0', '0', '0', -1, -1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (350, 126, 159, 'CG201505211638484', 150501, '1', '2015-05-21', '', 6, '1', '0', '0', '1', 6, '0', '0', '0', -1, -1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (351, 126, 159, 'CG201505211638484', 150501, '111', '2015-05-21', '', 5, '111', '0', '0', '1', 6, '0', '0', '0', -1, -1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (352, 126, 159, 'CG201505211638484', 150501, '1', '2015-05-21', '', 4, '1', '0', '0', '1', 6, '0', '0', '0', -1, -1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (353, 126, 159, 'CG201505211638484', 150501, '1', '2015-05-21', '', 3, '1', '0', '0', '1', 6, '0', '0', '0', -1, -1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);


#
# TABLE STRUCTURE FOR: ci_invoice_type
#

DROP TABLE IF EXISTS ci_invoice_type;

CREATE TABLE `ci_invoice_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  `number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='其他入库类型';

INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (1, '其他入库', 1, 1, 'in', 1, 150706);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (2, '盘盈', 1, 1, 'in', 0, 150701);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (3, '其他出库', -1, 1, 'out', 1, 150806);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (4, '盘亏', -1, 1, 'out', 0, 150801);


#
# TABLE STRUCTURE FOR: ci_invpo
#

DROP TABLE IF EXISTS ci_invpo;

CREATE TABLE `ci_invpo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactName` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '150501' COMMENT '150501购货 150502退货',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '已付款金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disamount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '2全部入库 0未入库',
  `deliveryDate` date DEFAULT NULL COMMENT '交货时间',
  `checkName` varchar(50) DEFAULT '' COMMENT '审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '审核状态  1已审核  0未审核',
  `totalDiscount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='采购订单';

INSERT INTO ci_invpo (`id`, `buId`, `contactName`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disamount`, `totalQty`, `totalArrears`, `billStatus`, `deliveryDate`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `totalDiscount`) VALUES (11, 159, '3123123 123', 'CGDD201505061520246', 1, '小阳', 150501, '113', '0', '0', '2015-05-06', '', '0', '0', '0', '3', '0', 0, '2015-05-06', '小阳', '19.21', '132.21', 1, '0');


#
# TABLE STRUCTURE FOR: ci_invpo_info
#

DROP TABLE IF EXISTS ci_invpo_info;

CREATE TABLE `ci_invpo_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactName` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '150501' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invNumber` varchar(50) DEFAULT '' COMMENT '商品编号',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `invName` varchar(50) DEFAULT '' COMMENT '商品名称',
  `invSpec` varchar(255) DEFAULT '' COMMENT '商品规格',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `locationName` varchar(255) DEFAULT '',
  `tax` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `mainUnit` varchar(50) DEFAULT '' COMMENT '单位',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `skuName` varchar(25) DEFAULT '',
  `inDate` date DEFAULT NULL COMMENT '入库时间',
  `deliveryDate` date DEFAULT NULL COMMENT '交货时间',
  PRIMARY KEY (`id`),
  KEY `goodsid` (`invId`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `type,billdate` (`transType`,`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='采购订单明细';

INSERT INTO ci_invpo_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invNumber`, `invId`, `invName`, `invSpec`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `locationName`, `tax`, `taxAmount`, `taxRate`, `mainUnit`, `unitId`, `skuId`, `skuName`, `inDate`, `deliveryDate`) VALUES (44, 11, 159, '3123123 123', 'CGDD201505061520246', 150501, '111', '2015-05-06', '', '0012212', 5, '雪菜', '22', '111', '0', '0', '1', 7, '北京仓库', '18.87', '129.87', '17', '斤', -1, -1, '', NULL, '2015-05-06');
INSERT INTO ci_invpo_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invNumber`, `invId`, `invName`, `invSpec`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `locationName`, `tax`, `taxAmount`, `taxRate`, `mainUnit`, `unitId`, `skuId`, `skuName`, `inDate`, `deliveryDate`) VALUES (45, 11, 159, '3123123 123', 'CGDD201505061520246', 150501, '1', '2015-05-06', '', '1234111', 4, '1', '1', '1', '0', '0', '1', 5, '苏州仓库', '0.17', '1.17', '17', '桶', -1, -1, '', NULL, '2015-05-06');
INSERT INTO ci_invpo_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invNumber`, `invId`, `invName`, `invSpec`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `locationName`, `tax`, `taxAmount`, `taxRate`, `mainUnit`, `unitId`, `skuId`, `skuName`, `inDate`, `deliveryDate`) VALUES (46, 11, 159, '3123123 123', 'CGDD201505061520246', 150501, '1', '2015-05-06', '', '2213', 6, '飞机', '13', '1', '0', '0', '1', 6, '上海仓库', '0.17', '1.17', '17', '', -1, -1, '', NULL, '2015-05-06');


#
# TABLE STRUCTURE FOR: ci_invso
#

DROP TABLE IF EXISTS ci_invso;

CREATE TABLE `ci_invso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) unsigned zerofill DEFAULT NULL COMMENT '供应商ID',
  `contactName` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '1' COMMENT '150601销货 150602退货',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '已付款金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `totalAmount` double DEFAULT '0' COMMENT '金额',
  `totaldiscount` double DEFAULT '0',
  `totalTax` double DEFAULT '0' COMMENT '总税额',
  `totalTaxAmount` double DEFAULT '0' COMMENT '优惠后金额',
  `salesId` smallint(6) DEFAULT '0',
  `salesName` varchar(25) DEFAULT '',
  `checkName` varchar(25) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0',
  `deliveryDate` date DEFAULT NULL,
  `billType` varchar(20) DEFAULT '',
  `modifyTime` datetime DEFAULT NULL,
  `inDate` date DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='销售订单';

INSERT INTO ci_invso (`id`, `buId`, `contactName`, `billNo`, `uid`, `userName`, `transType`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `totalAmount`, `totaldiscount`, `totalTax`, `totalTaxAmount`, `salesId`, `salesName`, `checkName`, `checked`, `billStatus`, `deliveryDate`, `billType`, `modifyTime`, `inDate`) VALUES (1, 000161, '111111', 'XSDD201505051016591', 1, '小阳', 150601, '0', '0', '2015-05-05', '', '0', '0', '0', '2', '0', '8', '0', '1.36', '9.36', 0, '(空)', '小阳', 1, 0, '2015-05-05', 'SALE', '2015-05-05 10:51:50', NULL);
INSERT INTO ci_invso (`id`, `buId`, `contactName`, `billNo`, `uid`, `userName`, `transType`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `totalAmount`, `totaldiscount`, `totalTax`, `totalTaxAmount`, `salesId`, `salesName`, `checkName`, `checked`, `billStatus`, `deliveryDate`, `billType`, `modifyTime`, `inDate`) VALUES (2, 000161, '111111', 'XSDD201505071411169', 1, '小阳', 150601, '0', '0', '2015-05-07', '', '0', '0', '0', '2', '0', '1333', '0', '226.61', '1559.61', 3, '苏晓云', '', 0, 0, '2015-05-07', 'SO', NULL, NULL);


#
# TABLE STRUCTURE FOR: ci_invso_info
#

DROP TABLE IF EXISTS ci_invso_info;

CREATE TABLE `ci_invso_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `contactName` varchar(50) DEFAULT '' COMMENT '客户名称',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '150601' COMMENT '150601销货 150602退货',
  `amount` double DEFAULT '0' COMMENT '销货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `invNumber` varchar(50) DEFAULT '' COMMENT '商品编号',
  `invSpec` varchar(25) DEFAULT '',
  `invName` varchar(25) DEFAULT '',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `unitId` smallint(6) DEFAULT '0',
  `mainUnit` varchar(25) DEFAULT '',
  `locationId` smallint(6) DEFAULT '0',
  `locationName` varchar(25) DEFAULT '',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `skuName` varchar(25) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `salesName` varchar(25) DEFAULT '',
  `inDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodsid` (`invId`),
  KEY `type` (`transType`),
  KEY `type,billdate` (`transType`,`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='销售订单明细';

INSERT INTO ci_invso_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `invNumber`, `invSpec`, `invName`, `price`, `deduction`, `discountRate`, `qty`, `unitId`, `mainUnit`, `locationId`, `locationName`, `tax`, `taxRate`, `taxAmount`, `skuId`, `skuName`, `salesId`, `salesName`, `inDate`, `deliveryDate`) VALUES (35, 1, 161, '111111', 'XSDD201505051016591', 150601, '5', '2015-05-05', '', 4, '1234111', '1', '1', '5', '0', '0', '1', -1, '桶', 5, '苏州仓库', '0.85', '17', '5.85', -1, '', 0, '', NULL, NULL);
INSERT INTO ci_invso_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `invNumber`, `invSpec`, `invName`, `price`, `deduction`, `discountRate`, `qty`, `unitId`, `mainUnit`, `locationId`, `locationName`, `tax`, `taxRate`, `taxAmount`, `skuId`, `skuName`, `salesId`, `salesName`, `inDate`, `deliveryDate`) VALUES (36, 1, 161, '111111', 'XSDD201505051016591', 150601, '3', '2015-05-05', '', 3, '1234', '1', '1', '3', '0', '0', '1', -1, '桶', 5, '苏州仓库', '0.51', '17', '3.51', -1, '', 0, '', NULL, NULL);
INSERT INTO ci_invso_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `invNumber`, `invSpec`, `invName`, `price`, `deduction`, `discountRate`, `qty`, `unitId`, `mainUnit`, `locationId`, `locationName`, `tax`, `taxRate`, `taxAmount`, `skuId`, `skuName`, `salesId`, `salesName`, `inDate`, `deliveryDate`) VALUES (37, 2, 161, '111111', 'XSDD201505071411169', 150601, '222', '2015-05-07', '', 5, '0012212', '22', '雪菜', '222', '0', '0', '1', -1, '斤', 7, '北京仓库', '37.74', '17', '259.74', -1, '', 3, '苏晓云', NULL, '2015-05-07');
INSERT INTO ci_invso_info (`id`, `iid`, `buId`, `contactName`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `invNumber`, `invSpec`, `invName`, `price`, `deduction`, `discountRate`, `qty`, `unitId`, `mainUnit`, `locationId`, `locationName`, `tax`, `taxRate`, `taxAmount`, `skuId`, `skuName`, `salesId`, `salesName`, `inDate`, `deliveryDate`) VALUES (38, 2, 161, '111111', 'XSDD201505071411169', 150601, '1111', '2015-05-07', '', 6, '2213', '13', '飞机', '1111', '0', '0', '1', -1, '', 6, '上海仓库', '188.87', '17', '1299.87', -1, '', 3, '苏晓云', NULL, '2015-05-07');


#
# TABLE STRUCTURE FOR: ci_log
#

DROP TABLE IF EXISTS ci_log;

CREATE TABLE `ci_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(25) DEFAULT '',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` text COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `loginName` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifyTime` datetime DEFAULT NULL COMMENT '写入日期',
  `operateTypeName` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='操作日志';

INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (1, 1, '', '小阳', '修改购货单 单据编号：CG201505191549075', 1, 'admin', '2015-05-19 16:00:35', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (2, 1, '', '小阳', '修改购货单 单据编号：CG201505191549075', 1, 'admin', '2015-05-19 16:18:14', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (3, 1, '', '小阳', '删除购货订单 单据编号：CG201505191549007', 1, 'admin', '2015-05-19 16:45:11', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (4, 1, '', '小阳', '新增其他入库 单据编号：QTRK201505191655093', 1, 'admin', '2015-05-19 16:55:09', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (5, 1, '', '小阳', '新增其他出库 单据编号：QTCK201505191701404', 1, 'admin', '2015-05-19 17:01:40', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (6, 1, '', '小阳', '修改其他出库 单据编号：QTCK201505191701404', 1, 'admin', '2015-05-19 17:01:54', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (7, 1, '', '小阳', '新增销货 单据编号：XS201505191702567', 1, 'admin', '2015-05-19 17:02:56', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (8, 1, '', '小阳', '新增调拨单编号：DB201505191722307', 1, 'admin', '2015-05-19 17:22:30', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (9, 1, '', '小阳', '修改调拨单编号：DB201505191722307', 1, 'admin', '2015-05-19 17:23:46', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (10, 1, '', '小阳', '新增付款单 单据编号：FKD201505200926049', 1, 'admin', '2015-05-20 09:26:04', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (11, 1, '', '小阳', '新增付款单 单据编号：FKD201505200955156', 1, 'admin', '2015-05-20 09:55:15', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (12, 1, '', '小阳', '修改收款单 单据编号：FKD201505200955156', 1, 'admin', '2015-05-20 09:55:34', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (13, 1, '', '小阳', '修改收款单 单据编号：FKD201505200955156', 1, 'admin', '2015-05-20 09:55:57', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (14, 1, '', '小阳', '新增收款单 单据编号：SKD201505201004248', 1, 'admin', '2015-05-20 10:04:24', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (15, 1, '', '小阳', '新增其他收入 单据编号：QTSR201505201006497', 1, 'admin', '2015-05-20 10:06:49', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (16, 1, '', '小阳', '修改其他收入 单据编号：QTSR201505201006497', 1, 'admin', '2015-05-20 10:07:05', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (17, 1, '', '小阳', '新增购货 单据编号：CG201505201142248', 1, 'admin', '2015-05-20 11:42:24', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (18, 1, '', '小阳', '新增销货 单据编号：XS201505201327133', 1, 'admin', '2015-05-20 13:27:13', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (19, 1, '', '小阳', '删除购货订单 单据编号：XS201505201327054', 1, 'admin', '2015-05-20 13:32:46', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (20, 1, '', '小阳', '删除购货订单 单据编号：XS201505201327014', 1, 'admin', '2015-05-20 13:32:53', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (21, 1, '', '小阳', '删除购货订单 单据编号：XS201505201326563', 1, 'admin', '2015-05-20 13:33:04', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (22, 1, '', '小阳', '修改购货单 单据编号：CG201505201142248', 1, 'admin', '2015-05-20 13:34:01', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (23, 1, '', '小阳', '新增销货 单据编号：XS201505201335164', 1, 'admin', '2015-05-20 13:35:16', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (24, 1, '', '小阳', '删除购货订单 单据编号：XS201505201333447', 1, 'admin', '2015-05-20 13:35:43', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (25, 1, '', '小阳', '修改销货 单据编号：XS201505201335164', 1, 'admin', '2015-05-20 13:36:55', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (26, 1, '', '小阳', '修改销货 单据编号：XS201505201335164', 1, 'admin', '2015-05-20 13:37:38', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (27, 1, '', '小阳', '修改销货 单据编号：XS201505201335164', 1, 'admin', '2015-05-20 13:37:47', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (28, 1, '', '小阳', '新增购货 单据编号：CG201505201340442', 1, 'admin', '2015-05-20 13:40:45', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (29, 1, '', '小阳', '修改购货单 单据编号：CG201505201340442', 1, 'admin', '2015-05-20 13:41:17', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (30, 1, '', '小阳', '新增购货 单据编号：CG201505201343035', 1, 'admin', '2015-05-20 13:43:03', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (31, 1, '', '小阳', '新增销货 单据编号：XS201505201343548', 1, 'admin', '2015-05-20 13:43:54', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (32, 1, '', '小阳', '修改销货 单据编号：XS201505201343548', 1, 'admin', '2015-05-20 13:44:16', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (33, 1, '', '小阳', '修改销货 单据编号：XS201505201343548', 1, 'admin', '2015-05-20 13:44:27', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (34, 1, '', '小阳', '修改购货单 单据编号：CG201505201343035', 1, 'admin', '2015-05-20 13:45:25', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (35, 1, '', '小阳', '修改销货 单据编号：XS201505201343548', 1, 'admin', '2015-05-20 13:45:49', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (36, 1, '', '小阳', '新增调拨单编号：DB201505201425325', 1, 'admin', '2015-05-20 14:25:32', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (37, 1, '', '小阳', '新增其他入库 单据编号：QTRK201505201646416', 1, 'admin', '2015-05-20 16:46:42', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (38, 1, '', '小阳', '新增其他出库 单据编号：QTCK201505201706033', 1, 'admin', '2015-05-20 17:06:04', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (39, 1, '', '小阳', '单据编号：QTCK201505201706033的单据已被审核！', 1, 'admin', '2015-05-20 17:33:34', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (40, 1, '', '小阳', '单据编号：QTCK201505201706033的单据已被反审核！', 1, 'admin', '2015-05-20 17:33:38', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (41, 1, '', '小阳', '单据编号：QTRK201505201646416的单据已被审核！', 1, 'admin', '2015-05-20 17:47:20', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (42, 1, '', '小阳', '单据编号：QTRK201505201646416的单据已被反审核！', 1, 'admin', '2015-05-20 17:47:22', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (43, 1, '', '小阳', '启用:ID:161', 1, 'admin', '2015-05-21 15:20:59', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (44, 1, '', '小阳', '启用:ID:161', 1, 'admin', '2015-05-21 15:21:00', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (45, 1, '', '小阳', '启用:ID:160', 1, 'admin', '2015-05-21 15:21:01', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (46, 1, '', '小阳', '启用:ID:160', 1, 'admin', '2015-05-21 15:21:01', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (47, 1, '', '小阳', '启用:ID:158', 1, 'admin', '2015-05-21 15:21:02', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (48, 1, '', '小阳', '启用:ID:158', 1, 'admin', '2015-05-21 15:21:03', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (49, 1, '', '小阳', '新增购货 单据编号：CG201505211638484', 1, 'admin', '2015-05-21 16:38:48', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (50, 1, '', '小阳', '新增销货 单据编号：XS201505211642022', 1, 'admin', '2015-05-21 16:42:02', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (51, 1, '', '小阳', '修改购货单 单据编号：CG201505211638484', 1, 'admin', '2015-05-21 17:00:39', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (52, 1, '', '小阳', '修改购货单 单据编号：CG201505211638484', 1, 'admin', '2015-05-21 17:06:04', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (53, 1, '', '小阳', '备份与恢复,备份文件名:201505212119082.sql', 1, 'admin', '2015-05-21 21:19:09', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (54, 1, '', '小阳', '备份与恢复,备份文件名:201505212122469.sql', 1, 'admin', '2015-05-21 21:22:46', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (55, 1, '', '小阳', '备份与恢复,备份文件名:201505212126457.sql', 1, 'admin', '2015-05-21 21:26:45', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (56, 1, '', '小阳', '备份与恢复,备份文件名:201505212127076.sql', 1, 'admin', '2015-05-21 21:27:07', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (57, 1, '', '小阳', '备份与恢复,备份文件名:201505212129278.sql', 1, 'admin', '2015-05-21 21:29:27', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (58, 1, '', '小阳', '备份与恢复,备份文件名:201505212139195.sql', 1, 'admin', '2015-05-21 21:39:19', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (59, 1, '', '小阳', '备份与恢复,删除文件名:201505212119082.sql', 1, 'admin', '2015-05-21 21:39:46', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (60, 1, '', '小阳', '备份与恢复,删除文件名:201505212122469.sql', 1, 'admin', '2015-05-21 21:39:48', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (61, 1, '', '小阳', '备份与恢复,删除文件名:201505101712348.sql', 1, 'admin', '2015-05-21 21:39:50', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (62, 1, '', '小阳', '备份与恢复,删除文件名:201504271255198.sql', 1, 'admin', '2015-05-21 21:39:52', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (63, 1, '', '小阳', '备份与恢复,删除文件名:201505212139195.sql', 1, 'admin', '2015-05-21 21:39:53', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (64, 1, '', '小阳', '备份与恢复,备份文件名:201505212141298.sql', 1, 'admin', '2015-05-21 21:41:29', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (65, 1, '', '小阳', '备份与恢复,备份文件名:201505212143028.sql', 1, 'admin', '2015-05-21 21:43:02', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (66, 1, '', '小阳', '备份与恢复,备份文件名:201505212151246.sql', 1, 'admin', '2015-05-21 21:51:25', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (67, 1, '', '小阳', '备份与恢复,备份文件名:201505212157097.sql', 1, 'admin', '2015-05-21 21:57:13', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (68, 1, '', '小阳', '备份与恢复,备份文件名:201505212158411.sql', 1, 'admin', '2015-05-21 21:58:41', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (69, 1, '', '小阳', '备份与恢复,备份文件名:201505212159535.sql', 1, 'admin', '2015-05-21 21:59:53', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (70, 1, '', '小阳', '备份与恢复,备份文件名:201505212201013.sql', 1, 'admin', '2015-05-21 22:01:01', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (71, 1, '', '小阳', '备份与恢复,备份文件名:201505212201241.sql', 1, 'admin', '2015-05-21 22:01:24', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (72, 1, '', '小阳', '备份与恢复,备份文件名:201505212207334.sql', 1, 'admin', '2015-05-21 22:07:33', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (73, 1, '', '小阳', '备份与恢复,备份文件名:201505212207586.sql', 1, 'admin', '2015-05-21 22:07:59', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (74, 1, '', '小阳', '备份与恢复,备份文件名:201505212209154.sql', 1, 'admin', '2015-05-21 22:09:15', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (75, 1, '', '小阳', '备份与恢复,备份文件名:201505212212183.sql', 1, 'admin', '2015-05-21 22:12:18', '');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`) VALUES (76, 1, '', '小阳', '备份与恢复,备份文件名:201505212212484.sql', 1, 'admin', '2015-05-21 22:12:48', '');


#
# TABLE STRUCTURE FOR: ci_menu
#

DROP TABLE IF EXISTS ci_menu;

CREATE TABLE `ci_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `pid` smallint(5) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `depth` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` smallint(6) DEFAULT '0' COMMENT '排序',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '外部链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导航管理';

INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (1, '购货单', 0, '1', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (2, '新增', 1, '1,2', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (3, '修改', 1, '1,3', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (4, '删除', 1, '1,4', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (5, '导出', 1, '1,5', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (6, '销货单', 0, '6', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (7, '新增', 6, '6,7', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (8, '修改', 6, '6,8', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (9, '删除', 6, '6,9', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (10, '导出', 6, '6,10', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (11, '盘点', 0, '11', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (12, '生成盘点记录', 11, '11,12', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (13, '导出', 11, '11,13', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (14, '其他入库', 0, '14', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (15, '新增', 14, '14,15', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (16, '修改', 14, '14,16', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (17, '删除', 14, '14,17', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (18, '其他出库', 0, '18', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (19, '新增', 18, '18,19', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (20, '修改', 18, '18,20', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (21, '删除', 18, '18,21', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (22, '采购明细表', 0, '22', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (23, '导出', 22, '22,23', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (24, '打印', 22, '22,24', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (25, '采购汇总表（按商品）', 0, '25', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (26, '导出', 25, '25,26', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (27, '打印', 25, '25,27', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (28, '采购汇总表（按供应商）', 0, '28', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (29, '导出', 28, '28,29', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (30, '打印', 28, '28,30', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (31, '销售明细表', 0, '31', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (32, '导出', 31, '31,32', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (33, '打印', 31, '31,33', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (34, '销售汇总表（按商品）', 0, '34', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (35, '导出', 34, '34,35', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (36, '打印', 34, '34,36', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (37, '销售汇总表（按客户）', 0, '37', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (38, '导出', 37, '37,38', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (39, '打印', 37, '37,39', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (40, '商品库存余额表', 0, '40', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (41, '导出', 40, '40,41', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (42, '打印', 40, '40,42', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (43, '商品收发明细表', 0, '43', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (44, '导出', 43, '43,44', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (45, '打印', 43, '43,45', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (46, '商品收发汇总表', 0, '46', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (47, '导出', 46, '46,47', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (48, '打印', 46, '46,48', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (49, '往来单位欠款表', 0, '49', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (50, '导出', 49, '49,50', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (51, '打印', 49, '49,51', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (52, '应付账款明细表', 0, '52', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (53, '导出', 52, '52,53', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (54, '打印', 52, '52,54', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (55, '应收账款明细表', 0, '55', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (56, '导出', 55, '55,56', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (57, '打印', 55, '55,57', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (58, '客户管理', 0, '58', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (59, '新增', 58, '58,59', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (60, '修改', 58, '58,60', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (61, '删除', 58, '58,61', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (62, '导出', 58, '58,62', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (63, '供应商管理', 0, '63', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (64, '新增', 63, '63,64', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (65, '修改', 63, '63,65', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (66, '删除', 63, '63,66', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (67, '导出', 63, '63,67', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (68, '商品管理', 0, '68', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (69, '新增', 68, '68,69', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (70, '修改', 68, '68,70', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (71, '删除', 68, '68,71', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (72, '导出', 68, '68,72', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (73, '客户类别', 0, '73', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (74, '新增', 73, '73,74', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (75, '修改', 73, '73,75', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (76, '删除', 73, '73,76', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (77, '计量单位', 0, '77', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (78, '新增', 77, '77,78', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (79, '修改', 77, '77,79', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (80, '删除', 77, '77,80', 2, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (81, '系统参数', 0, '81', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (82, '权限设置', 0, '82', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (83, '操作日志', 0, '83', 1, 99, '', 1);
INSERT INTO ci_menu (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES (84, '数据备份', 0, '84', 1, 99, '', 0);


#
# TABLE STRUCTURE FOR: ci_options
#

DROP TABLE IF EXISTS ci_options;

CREATE TABLE `ci_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统设置';

INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (1, 'system', 'a:10:{s:11:\"companyName\";s:15:\"进销存系统\";s:11:\"companyAddr\";s:6:\"123213\";s:5:\"phone\";s:5:\"12312\";s:3:\"fax\";s:3:\"312\";s:8:\"postcode\";s:4:\"3123\";s:9:\"qtyPlaces\";s:1:\"2\";s:11:\"pricePlaces\";s:1:\"2\";s:12:\"amountPlaces\";s:1:\"2\";s:10:\"valMethods\";s:13:\"movingAverage\";s:18:\"requiredCheckStore\";s:1:\"1\";}', 'yes');


#
# TABLE STRUCTURE FOR: ci_payment_info
#

DROP TABLE IF EXISTS ci_payment_info;

CREATE TABLE `ci_payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='付款明细';

INSERT INTO ci_payment_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (32, 0, 0, 1078, 'XSDD201504170958434', 'SALE', '2015-04-17', '290', '0', '0', '150', '销货');
INSERT INTO ci_payment_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (50, 199, 0, 186, 'XS201505071306585', 'SALE', '2015-05-08', '45', '0', '0', '50', '销货');


#
# TABLE STRUCTURE FOR: ci_receipt_info
#

DROP TABLE IF EXISTS ci_receipt_info;

CREATE TABLE `ci_receipt_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='收款明细';

INSERT INTO ci_receipt_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (32, 0, 0, 1078, 'XSDD201504170958434', 'SALE', '2015-04-17', '290', '0', '0', '150', '销货');
INSERT INTO ci_receipt_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (50, 199, 0, 186, 'XS201505071306585', 'SALE', '2015-05-08', '45', '0', '0', '50', '销货');


#
# TABLE STRUCTURE FOR: ci_settlement
#

DROP TABLE IF EXISTS ci_settlement;

CREATE TABLE `ci_settlement` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='结算方式';

INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (1, '个', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (2, '件', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (3, '斤', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (4, '包', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (5, '台', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (6, '箱', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (7, '套', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (8, '桶', 1);
INSERT INTO ci_settlement (`id`, `name`, `status`) VALUES (9, '辆', 1);


#
# TABLE STRUCTURE FOR: ci_staff
#

DROP TABLE IF EXISTS ci_staff;

CREATE TABLE `ci_staff` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用  1禁用',
  `allowsms` tinyint(4) DEFAULT '0',
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `commissionrate` tinyint(4) DEFAULT '0',
  `creatorId` int(11) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empId` int(11) DEFAULT '0',
  `empType` tinyint(4) DEFAULT '1',
  `fullId` int(11) DEFAULT '0',
  `leftDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `parentId` smallint(6) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职员';

INSERT INTO ci_staff (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES (3, '苏晓云', '0002', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);
INSERT INTO ci_staff (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES (4, '石峰', '0001', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);


#
# TABLE STRUCTURE FOR: ci_storage
#

DROP TABLE IF EXISTS ci_storage;

CREATE TABLE `ci_storage` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `locationNo` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态 0正常  1锁定',
  `allowNeg` tinyint(4) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `empId` int(11) DEFAULT '0',
  `groupx` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`locationNo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库';

INSERT INTO ci_storage (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES (5, '苏州仓库', '0002', 0, 0, 0, 0, NULL, NULL, 0, '', 0);
INSERT INTO ci_storage (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES (6, '上海仓库', '0001', 0, 0, 0, 0, NULL, NULL, 0, '', 0);
INSERT INTO ci_storage (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES (7, '北京仓库1', '0003', 0, 0, 0, 0, NULL, NULL, 0, '', 0);
INSERT INTO ci_storage (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES (8, '23213', '009', 0, 0, 0, 0, NULL, NULL, 0, '', 0);


#
# TABLE STRUCTURE FOR: ci_unit
#

DROP TABLE IF EXISTS ci_unit;

CREATE TABLE `ci_unit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `unitTypeId` smallint(6) DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `rate` tinyint(1) DEFAULT '0',
  `guid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='计量单位';

INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (3, '斤', 1, 0, 1, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (4, '包', 1, 0, 1, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (5, '台', 1, 0, 1, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (6, '箱', 1, 0, 1, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (7, '套', 1, 8, 1, 1, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (8, '桶', 1, 0, 1, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (9, '辆1', 1, 0, 0, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (10, '堆', 1, 0, 0, 0, '', 0);


#
# TABLE STRUCTURE FOR: ci_unittype
#

DROP TABLE IF EXISTS ci_unittype;

CREATE TABLE `ci_unittype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='计量单位';

INSERT INTO ci_unittype (`id`, `name`, `status`, `isDelete`) VALUES (8, '桶', 1, 0);
INSERT INTO ci_unittype (`id`, `name`, `status`, `isDelete`) VALUES (11, '啊啊是', 1, 0);


