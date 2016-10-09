/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50545
 Source Host           : localhost
 Source Database       : jflow

 Target Server Version : 50545
 File Encoding         : utf-8

 Date: 10/09/2016 09:21:49 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `MS_DutyAndPower`
-- ----------------------------
DROP TABLE IF EXISTS `MS_DutyAndPower`;
CREATE TABLE `MS_DutyAndPower` (
  `No` varchar(10) NOT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `FK_Main` varchar(200) DEFAULT NULL,
  `StationName` varchar(500) DEFAULT NULL,
  `Duty` varchar(1000) DEFAULT NULL,
  `PowerOfRight` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MS_NODEDTL`
-- ----------------------------
DROP TABLE IF EXISTS `MS_NODEDTL`;
CREATE TABLE `MS_NODEDTL` (
  `FK_Node` int(11) NOT NULL,
  `FK_ZhiDuDtl` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_ZhiDuDtl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MS_Sort`
-- ----------------------------
DROP TABLE IF EXISTS `MS_Sort`;
CREATE TABLE `MS_Sort` (
  `No` varchar(4) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `ParentNo` varchar(4) DEFAULT NULL,
  `TreeNo` varchar(60) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL,
  `Abbr` varchar(60) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MS_ZhiDu`
-- ----------------------------
DROP TABLE IF EXISTS `MS_ZhiDu`;
CREATE TABLE `MS_ZhiDu` (
  `No` varchar(5) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FK_Sort` varchar(200) DEFAULT NULL,
  `WebPath` varchar(400) DEFAULT NULL,
  `RelDept` varchar(200) DEFAULT NULL,
  `ZDNo` varchar(200) DEFAULT NULL,
  `ZDVersion` varchar(200) DEFAULT NULL,
  `ZDProperty` varchar(200) DEFAULT NULL,
  `ExternalNo` varchar(200) DEFAULT NULL,
  `OID` varchar(200) DEFAULT NULL,
  `IsDelete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MS_ZhiDuDept`
-- ----------------------------
DROP TABLE IF EXISTS `MS_ZhiDuDept`;
CREATE TABLE `MS_ZhiDuDept` (
  `No` varchar(5) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FK_Dept` varchar(200) DEFAULT NULL,
  `ZDMax` varchar(400) DEFAULT NULL,
  `ZDNo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `MS_ZhiDuDtl`
-- ----------------------------
DROP TABLE IF EXISTS `MS_ZhiDuDtl`;
CREATE TABLE `MS_ZhiDuDtl` (
  `No` varchar(5) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `DocLevel` varchar(20) DEFAULT NULL,
  `ParagraphIndex` varchar(20) DEFAULT NULL,
  `ParentParagraphIndex` varchar(20) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `FK_Main` varchar(5) DEFAULT NULL,
  `DocText` text,
  `DocHtml` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PORT_DEPTDUTY`
-- ----------------------------
DROP TABLE IF EXISTS `PORT_DEPTDUTY`;
CREATE TABLE `PORT_DEPTDUTY` (
  `FK_Dept` varchar(15) NOT NULL,
  `FK_Duty` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Dept`,`FK_Duty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PORT_DEPTSEARCHSCORP`
-- ----------------------------
DROP TABLE IF EXISTS `PORT_DEPTSEARCHSCORP`;
CREATE TABLE `PORT_DEPTSEARCHSCORP` (
  `FK_Emp` varchar(50) NOT NULL,
  `FK_Dept` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Emp`,`FK_Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PORT_DEPTSTATION`
-- ----------------------------
DROP TABLE IF EXISTS `PORT_DEPTSTATION`;
CREATE TABLE `PORT_DEPTSTATION` (
  `FK_Dept` varchar(15) NOT NULL,
  `FK_Station` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Dept`,`FK_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PORT_EMPSTATION`
-- ----------------------------
DROP TABLE IF EXISTS `PORT_EMPSTATION`;
CREATE TABLE `PORT_EMPSTATION` (
  `FK_Emp` varchar(100) NOT NULL,
  `FK_Station` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Emp`,`FK_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PORT_EMPSTATION`
-- ----------------------------
BEGIN;
INSERT INTO `PORT_EMPSTATION` VALUES ('fuhui', '09'), ('guobaogeng', '10'), ('guoxiangbin', '04'), ('liping', '06'), ('liyan', '11'), ('qifenglin', '03'), ('yangyilei', '05'), ('zhanghaicheng', '02'), ('zhangyifan', '07'), ('zhoupeng', '01'), ('zhoushengyu', '07'), ('zhoutianjiao', '08');
COMMIT;

-- ----------------------------
--  Table structure for `Port_Dept`
-- ----------------------------
DROP TABLE IF EXISTS `Port_Dept`;
CREATE TABLE `Port_Dept` (
  `No` varchar(50) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `NameOfPath` varchar(300) DEFAULT NULL,
  `ParentNo` varchar(100) DEFAULT NULL,
  `TreeNo` varchar(100) DEFAULT NULL,
  `Leader` varchar(100) DEFAULT NULL,
  `Tel` varchar(100) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL,
  `FK_DeptType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Port_Dept`
-- ----------------------------
BEGIN;
INSERT INTO `Port_Dept` VALUES ('1', '总经理室', null, '0', null, null, null, null, null, null), ('2', '市场部', null, '1', null, null, null, null, null, null), ('3', '研发部', null, '1', null, null, null, null, null, null), ('4', '服务部', null, '1', null, null, null, null, null, null), ('5', '财务部', null, '1', null, null, null, null, null, null), ('6', '人力资源部', null, '1', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `Port_DeptEmp`
-- ----------------------------
DROP TABLE IF EXISTS `Port_DeptEmp`;
CREATE TABLE `Port_DeptEmp` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Emp` varchar(50) DEFAULT NULL,
  `FK_Dept` varchar(50) DEFAULT NULL,
  `FK_Duty` varchar(50) DEFAULT NULL,
  `DutyLevel` int(11) DEFAULT NULL,
  `Leader` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Port_DeptEmp`
-- ----------------------------
BEGIN;
INSERT INTO `Port_DeptEmp` VALUES ('1_zhoupeng', 'zhoupeng', '1', null, null, null), ('2_zhanghaicheng', 'zhanghaicheng', '2', null, null, null), ('2_zhangyifan', 'zhangyifan', '2', null, null, null), ('2_zhoushengyu', 'zhoushengyu', '2', null, null, null), ('3_qifenglin', 'qifenglin', '3', null, null, null), ('3_zhoutianjiao', 'zhoutianjiao', '3', null, null, null), ('4_guoxiangbin', 'guoxiangbin', '4', null, null, null), ('4_fuhui', 'fuhui', '4', null, null, null), ('5_yangyilei', 'yangyilei', '5', null, null, null), ('5_guobaogeng', 'guobaogeng', '5', null, null, null), ('6_liping', 'liping', '6', null, null, null), ('6_liyan', 'liyan', '6', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `Port_DeptEmpStation`
-- ----------------------------
DROP TABLE IF EXISTS `Port_DeptEmpStation`;
CREATE TABLE `Port_DeptEmpStation` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Dept` varchar(50) DEFAULT NULL,
  `FK_Station` varchar(50) DEFAULT NULL,
  `FK_Emp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Port_DeptType`
-- ----------------------------
DROP TABLE IF EXISTS `Port_DeptType`;
CREATE TABLE `Port_DeptType` (
  `No` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Port_Duty`
-- ----------------------------
DROP TABLE IF EXISTS `Port_Duty`;
CREATE TABLE `Port_Duty` (
  `No` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Port_Emp`
-- ----------------------------
DROP TABLE IF EXISTS `Port_Emp`;
CREATE TABLE `Port_Emp` (
  `No` varchar(20) NOT NULL,
  `EmpNo` varchar(20) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `FK_Duty` varchar(20) DEFAULT NULL,
  `Leader` varchar(50) DEFAULT NULL,
  `SID` varchar(36) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `NumOfDept` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Port_Emp`
-- ----------------------------
BEGIN;
INSERT INTO `Port_Emp` VALUES ('admin', null, 'admin', 'pub', '1', null, null, null, null, null, null, null), ('zhoupeng', null, '周朋', 'pub', '1', null, null, null, null, null, null, null), ('zhanghaicheng', null, '张海成', 'pub', '2', null, null, null, null, null, null, null), ('zhangyifan', null, '张一帆', 'pub', '2', null, null, null, null, null, null, null), ('zhoushengyu', null, '周升雨', 'pub', '2', null, null, null, null, null, null, null), ('qifenglin', null, '祁凤林', 'pub', '3', null, null, null, null, null, null, null), ('zhoutianjiao', null, '周天娇', 'pub', '3', null, null, null, null, null, null, null), ('guoxiangbin', null, '郭祥斌', 'pub', '4', null, null, null, null, null, null, null), ('fuhui', null, '福惠', 'pub', '4', null, null, null, null, null, null, null), ('yangyilei', null, '杨依雷', 'pub', '5', null, null, null, null, null, null, null), ('guobaogeng', null, '郭宝庚', 'pub', '5', null, null, null, null, null, null, null), ('liping', null, '李萍', 'pub', '6', null, null, null, null, null, null, null), ('liyan', null, '李言', 'pub', '6', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `Port_Station`
-- ----------------------------
DROP TABLE IF EXISTS `Port_Station`;
CREATE TABLE `Port_Station` (
  `No` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DutyReq` text,
  `Makings` text,
  `FK_StationType` varchar(100) DEFAULT NULL,
  `StaGrade` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Port_Station`
-- ----------------------------
BEGIN;
INSERT INTO `Port_Station` VALUES ('01', '总经理', null, null, '1', ''), ('02', '市场部经理', null, null, '2', ''), ('03', '研发部经理', null, null, '2', ''), ('04', '客服部经理', null, null, '2', ''), ('05', '财务部经理', null, null, '2', ''), ('06', '人力资源部经理', null, null, '2', ''), ('07', '销售人员岗', null, null, '3', ''), ('08', '程序员岗', null, null, '3', ''), ('09', '技术服务岗', null, null, '3', ''), ('10', '出纳岗', null, null, '3', ''), ('11', '人力资源助理岗', null, null, '3', '');
COMMIT;

-- ----------------------------
--  Table structure for `Port_StationType`
-- ----------------------------
DROP TABLE IF EXISTS `Port_StationType`;
CREATE TABLE `Port_StationType` (
  `No` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Port_StationType`
-- ----------------------------
BEGIN;
INSERT INTO `Port_StationType` VALUES ('0', '未分类'), ('1', '高层'), ('2', '中层'), ('3', '基层');
COMMIT;

-- ----------------------------
--  Table structure for `Pub_Day`
-- ----------------------------
DROP TABLE IF EXISTS `Pub_Day`;
CREATE TABLE `Pub_Day` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Pub_ND`
-- ----------------------------
DROP TABLE IF EXISTS `Pub_ND`;
CREATE TABLE `Pub_ND` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Pub_NY`
-- ----------------------------
DROP TABLE IF EXISTS `Pub_NY`;
CREATE TABLE `Pub_NY` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Pub_YF`
-- ----------------------------
DROP TABLE IF EXISTS `Pub_YF`;
CREATE TABLE `Pub_YF` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_CFIELD`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CFIELD`;
CREATE TABLE `SYS_CFIELD` (
  `EnsName` varchar(100) NOT NULL,
  `FK_Emp` varchar(100) NOT NULL,
  `Attrs` text,
  PRIMARY KEY (`EnsName`,`FK_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_RPTDEPT`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_RPTDEPT`;
CREATE TABLE `SYS_RPTDEPT` (
  `FK_Rpt` varchar(15) NOT NULL,
  `FK_Dept` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Rpt`,`FK_Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_RPTEMP`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_RPTEMP`;
CREATE TABLE `SYS_RPTEMP` (
  `FK_Rpt` varchar(15) NOT NULL,
  `FK_Emp` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Rpt`,`FK_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `SYS_RPTSTATION`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_RPTSTATION`;
CREATE TABLE `SYS_RPTSTATION` (
  `FK_Rpt` varchar(15) NOT NULL,
  `FK_Station` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Rpt`,`FK_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_Contrast`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Contrast`;
CREATE TABLE `Sys_Contrast` (
  `MyPK` varchar(100) NOT NULL,
  `ContrastKey` varchar(20) DEFAULT NULL,
  `KeyVal1` varchar(20) DEFAULT NULL,
  `KeyVal2` varchar(20) DEFAULT NULL,
  `SortBy` varchar(20) DEFAULT NULL,
  `KeyOfNum` varchar(20) DEFAULT NULL,
  `GroupWay` int(11) DEFAULT NULL,
  `OrderWay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_DataRpt`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DataRpt`;
CREATE TABLE `Sys_DataRpt` (
  `MyPK` varchar(100) NOT NULL,
  `ColCount` varchar(50) DEFAULT NULL,
  `RowCount` varchar(50) DEFAULT NULL,
  `Val` float DEFAULT NULL,
  `RefOID` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_DefVal`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DefVal`;
CREATE TABLE `Sys_DefVal` (
  `OID` int(11) NOT NULL,
  `FK_MapData` varchar(100) DEFAULT NULL,
  `AttrKey` varchar(50) DEFAULT NULL,
  `LB` int(11) DEFAULT NULL,
  `FK_Emp` varchar(100) DEFAULT NULL,
  `CurValue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_DocFile`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DocFile`;
CREATE TABLE `Sys_DocFile` (
  `MyPK` varchar(100) NOT NULL,
  `FileName` varchar(200) DEFAULT NULL,
  `FileSize` int(11) DEFAULT NULL,
  `FileType` varchar(50) DEFAULT NULL,
  `D1` text,
  `D2` text,
  `D3` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_Domain`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Domain`;
CREATE TABLE `Sys_Domain` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `DBLink` varchar(130) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_EnCfg`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_EnCfg`;
CREATE TABLE `Sys_EnCfg` (
  `No` varchar(100) NOT NULL,
  `GroupTitle` varchar(2000) DEFAULT NULL,
  `FJSavePath` varchar(100) DEFAULT NULL,
  `FJWebPath` varchar(100) DEFAULT NULL,
  `Datan` varchar(200) DEFAULT NULL,
  `UI` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_EnsAppCfg`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_EnsAppCfg`;
CREATE TABLE `Sys_EnsAppCfg` (
  `MyPK` varchar(100) NOT NULL,
  `EnsName` varchar(100) DEFAULT NULL,
  `CfgKey` varchar(100) DEFAULT NULL,
  `CfgVal` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_Enum`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Enum`;
CREATE TABLE `Sys_Enum` (
  `MyPK` varchar(100) NOT NULL,
  `Lab` varchar(80) DEFAULT NULL,
  `EnumKey` varchar(40) DEFAULT NULL,
  `IntKey` int(11) DEFAULT NULL,
  `Lang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Sys_Enum`
-- ----------------------------
BEGIN;
INSERT INTO `Sys_Enum` VALUES ('UploadFileCheck_CH_0', '不控制', 'UploadFileCheck', '0', 'CH'), ('UploadFileCheck_CH_1', '上传附件个数不能为0', 'UploadFileCheck', '1', 'CH'), ('UploadFileCheck_CH_2', '每个类别下面的个数不能为0', 'UploadFileCheck', '2', 'CH'), ('CodeStruct_CH_0', '普通的编码表(具有No,Name)', 'CodeStruct', '0', 'CH'), ('CodeStruct_CH_1', '树结构(具有No,Name,ParentNo)', 'CodeStruct', '1', 'CH'), ('CodeStruct_CH_2', '行政机构编码表(编码以两位编号标识级次树形关系)', 'CodeStruct', '2', 'CH'), ('TabType_CH_0', '本地表或者视图', 'TabType', '0', 'CH'), ('TabType_CH_1', '通过一个SQL确定的一个外部数据源', 'TabType', '1', 'CH'), ('TabType_CH_2', '通过WebServices获得的一个数据源', 'TabType', '2', 'CH'), ('DtlAddRecModel_CH_0', '按设置的数量初始化空白行', 'DtlAddRecModel', '0', 'CH'), ('DtlAddRecModel_CH_1', '用按钮增加空白行', 'DtlAddRecModel', '1', 'CH'), ('DtlSaveModel_CH_0', '自动存盘(失去焦点自动存盘)', 'DtlSaveModel', '0', 'CH'), ('DtlSaveModel_CH_1', '手动存盘(保存按钮触发存盘)', 'DtlSaveModel', '1', 'CH'), ('MyDataType_CH_1', '字符串String', 'MyDataType', '1', 'CH'), ('MyDataType_CH_2', '整数类型Int', 'MyDataType', '2', 'CH'), ('MyDataType_CH_3', '浮点类型AppFloat', 'MyDataType', '3', 'CH'), ('MyDataType_CH_4', '判断类型Boolean', 'MyDataType', '4', 'CH'), ('MyDataType_CH_5', '双精度类型Double', 'MyDataType', '5', 'CH'), ('MyDataType_CH_6', '日期型Date', 'MyDataType', '6', 'CH'), ('MyDataType_CH_7', '时间类型Datetime', 'MyDataType', '7', 'CH'), ('MyDataType_CH_8', '金额类型AppMoney', 'MyDataType', '8', 'CH'), ('DtlShowModel_CH_0', '表格', 'DtlShowModel', '0', 'CH'), ('DtlShowModel_CH_1', '卡片(自由模式)', 'DtlShowModel', '1', 'CH'), ('DtlShowModel_CH_2', '卡片(傻瓜模式)', 'DtlShowModel', '2', 'CH'), ('PopValFormat_CH_0', 'No(仅编号)', 'PopValFormat', '0', 'CH'), ('PopValFormat_CH_1', 'Name(仅名称)', 'PopValFormat', '1', 'CH'), ('PopValFormat_CH_2', 'No,Name(编号与名称,比如zhangsan,张三;lisi,李四;)', 'PopValFormat', '2', 'CH'), ('DTSearchWay_CH_0', '不启用', 'DTSearchWay', '0', 'CH'), ('DTSearchWay_CH_1', '按日期', 'DTSearchWay', '1', 'CH'), ('DTSearchWay_CH_2', '按日期时间', 'DTSearchWay', '2', 'CH'), ('CtrlWay_CH_0', '按岗位', 'CtrlWay', '0', 'CH'), ('CtrlWay_CH_1', '按部门', 'CtrlWay', '1', 'CH'), ('CtrlWay_CH_2', '按人员', 'CtrlWay', '2', 'CH'), ('CtrlWay_CH_3', '按SQL', 'CtrlWay', '3', 'CH'), ('FrmUrlShowWay_CH_0', '不显示', 'FrmUrlShowWay', '0', 'CH'), ('FrmUrlShowWay_CH_1', '自动大小', 'FrmUrlShowWay', '1', 'CH'), ('FrmUrlShowWay_CH_2', '指定大小', 'FrmUrlShowWay', '2', 'CH'), ('FrmUrlShowWay_CH_3', '新窗口', 'FrmUrlShowWay', '3', 'CH'), ('TBModel_CH_0', '单行文本', 'TBModel', '0', 'CH'), ('TBModel_CH_1', '多行文本', 'TBModel', '1', 'CH'), ('TBModel_CH_2', '富文本', 'TBModel', '2', 'CH'), ('CHAlertRole_CH_0', '不提示', 'CHAlertRole', '0', 'CH'), ('CHAlertRole_CH_1', '每天1次', 'CHAlertRole', '1', 'CH'), ('CHAlertRole_CH_2', '每天2次', 'CHAlertRole', '2', 'CH'), ('CHAlertWay_CH_0', '邮件', 'CHAlertWay', '0', 'CH'), ('CHAlertWay_CH_1', '短信', 'CHAlertWay', '1', 'CH'), ('CHAlertWay_CH_2', 'CCIM即时通讯', 'CHAlertWay', '2', 'CH'), ('NodeFormType_CH_0', '傻瓜表单(ccflow6取消支持)', 'NodeFormType', '0', 'CH'), ('NodeFormType_CH_1', '自由表单', 'NodeFormType', '1', 'CH'), ('NodeFormType_CH_2', '嵌入式表单', 'NodeFormType', '2', 'CH'), ('NodeFormType_CH_3', 'SDK表单', 'NodeFormType', '3', 'CH'), ('NodeFormType_CH_4', 'SL表单(ccflow6取消支持)', 'NodeFormType', '4', 'CH'), ('NodeFormType_CH_5', '表单树', 'NodeFormType', '5', 'CH'), ('NodeFormType_CH_6', '动态表单树', 'NodeFormType', '6', 'CH'), ('NodeFormType_CH_7', '公文表单(WebOffice)', 'NodeFormType', '7', 'CH'), ('NodeFormType_CH_8', 'Excel表单(测试中)', 'NodeFormType', '8', 'CH'), ('NodeFormType_CH_9', 'Word表单(测试中)', 'NodeFormType', '9', 'CH'), ('NodeFormType_CH_100', '禁用(对多表单流程有效)', 'NodeFormType', '100', 'CH'), ('WhoIsPK_CH_0', '工作ID是主键', 'WhoIsPK', '0', 'CH'), ('WhoIsPK_CH_1', '流程ID是主键', 'WhoIsPK', '1', 'CH'), ('WhoIsPK_CH_2', '父流程ID是主键', 'WhoIsPK', '2', 'CH'), ('WhoIsPK_CH_3', '延续流程ID是主键', 'WhoIsPK', '3', 'CH'), ('TSpan_CH_0', '本周', 'TSpan', '0', 'CH'), ('TSpan_CH_1', '上周', 'TSpan', '1', 'CH'), ('TSpan_CH_2', '两周以前', 'TSpan', '2', 'CH'), ('TSpan_CH_3', '三周以前', 'TSpan', '3', 'CH'), ('TSpan_CH_4', '更早', 'TSpan', '4', 'CH'), ('WFSta_CH_0', '运行中', 'WFSta', '0', 'CH'), ('WFSta_CH_1', '已完成', 'WFSta', '1', 'CH'), ('WFSta_CH_2', '其他', 'WFSta', '2', 'CH'), ('SaveModel_CH_0', '仅节点表', 'SaveModel', '0', 'CH'), ('SaveModel_CH_1', '节点表与Rpt表', 'SaveModel', '1', 'CH'), ('AuthorWay_CH_0', '不授权', 'AuthorWay', '0', 'CH'), ('AuthorWay_CH_1', '全部流程授权', 'AuthorWay', '1', 'CH'), ('AuthorWay_CH_2', '指定流程授权', 'AuthorWay', '2', 'CH'), ('PRI_CH_0', '低', 'PRI', '0', 'CH'), ('PRI_CH_1', '中', 'PRI', '1', 'CH'), ('PRI_CH_2', '高', 'PRI', '2', 'CH'), ('SelectAccepterEnable_CH_0', '不启用', 'SelectAccepterEnable', '0', 'CH'), ('SelectAccepterEnable_CH_1', '单独启用', 'SelectAccepterEnable', '1', 'CH'), ('SelectAccepterEnable_CH_2', '在发送前打开', 'SelectAccepterEnable', '2', 'CH'), ('SelectAccepterEnable_CH_3', '转入新页面', 'SelectAccepterEnable', '3', 'CH'), ('DeliveryWay_CH_0', '按岗位智能计算', 'DeliveryWay', '0', 'CH'), ('DeliveryWay_CH_1', '按部门计算', 'DeliveryWay', '1', 'CH'), ('DeliveryWay_CH_2', '按SQL计算', 'DeliveryWay', '2', 'CH'), ('DeliveryWay_CH_3', '按设置的人员计算', 'DeliveryWay', '3', 'CH'), ('DeliveryWay_CH_4', '由上一步发送人选择', 'DeliveryWay', '4', 'CH'), ('DeliveryWay_CH_5', '按上一节点表单SysSendEmps字段计算', 'DeliveryWay', '5', 'CH'), ('DeliveryWay_CH_6', '按上一步操作人员', 'DeliveryWay', '6', 'CH'), ('DeliveryWay_CH_7', '按上一步操作人员并自动跳转', 'DeliveryWay', '7', 'CH'), ('DeliveryWay_CH_8', '按指定节点的工作人员计算', 'DeliveryWay', '8', 'CH'), ('DeliveryWay_CH_9', '按岗位与部门交集计算', 'DeliveryWay', '9', 'CH'), ('DeliveryWay_CH_10', '按岗位计算(以部门集合为纬度)', 'DeliveryWay', '10', 'CH'), ('DeliveryWay_CH_11', '按指定节点的人员岗位计算', 'DeliveryWay', '11', 'CH'), ('DeliveryWay_CH_12', '按SQL确定子线程接受人与数据源', 'DeliveryWay', '12', 'CH'), ('DeliveryWay_CH_13', '由上一节点的明细表来决定子线程的接受人', 'DeliveryWay', '13', 'CH'), ('DeliveryWay_CH_14', '仅按岗位计算', 'DeliveryWay', '14', 'CH'), ('DeliveryWay_CH_100', '按ccflow的BPM模式处理', 'DeliveryWay', '100', 'CH'), ('JumpWay_CH_0', '不能跳转', 'JumpWay', '0', 'CH'), ('JumpWay_CH_1', '只能向后跳转', 'JumpWay', '1', 'CH'), ('JumpWay_CH_2', '只能向前跳转', 'JumpWay', '2', 'CH'), ('JumpWay_CH_3', '任意节点跳转', 'JumpWay', '3', 'CH'), ('JumpWay_CH_4', '按指定规则跳转', 'JumpWay', '4', 'CH'), ('ReturnRole_CH_0', '不能退回', 'ReturnRole', '0', 'CH'), ('ReturnRole_CH_1', '只能退回上一个节点', 'ReturnRole', '1', 'CH'), ('ReturnRole_CH_2', '可退回以前任意节点', 'ReturnRole', '2', 'CH'), ('ReturnRole_CH_3', '可退回指定的节点', 'ReturnRole', '3', 'CH'), ('ReturnRole_CH_4', '由流程图设计的退回路线决定', 'ReturnRole', '4', 'CH'), ('CCRole_CH_0', '不能抄送', 'CCRole', '0', 'CH'), ('CCRole_CH_1', '手工抄送', 'CCRole', '1', 'CH'), ('CCRole_CH_2', '自动抄送', 'CCRole', '2', 'CH'), ('CCRole_CH_3', '手工与自动', 'CCRole', '3', 'CH'), ('CCRole_CH_4', '按表单SysCCEmps字段计算', 'CCRole', '4', 'CH'), ('DelEnable_CH_0', '不能删除', 'DelEnable', '0', 'CH'), ('DelEnable_CH_1', '逻辑删除', 'DelEnable', '1', 'CH'), ('DelEnable_CH_2', '记录日志方式删除', 'DelEnable', '2', 'CH'), ('DelEnable_CH_3', '彻底删除', 'DelEnable', '3', 'CH'), ('DelEnable_CH_4', '让用户决定删除方式', 'DelEnable', '4', 'CH'), ('EventDoType_CH_0', '禁用', 'EventDoType', '0', 'CH'), ('EventDoType_CH_1', '执行存储过程', 'EventDoType', '1', 'CH'), ('EventDoType_CH_2', '执行SQL语句', 'EventDoType', '2', 'CH'), ('EventDoType_CH_3', '执行URL', 'EventDoType', '3', 'CH'), ('EventDoType_CH_4', 'WebServices(未完成)', 'EventDoType', '4', 'CH'), ('EventDoType_CH_5', '执行ddl文件的类与方法', 'EventDoType', '5', 'CH'), ('EventDoType_CH_6', 'EventBase类', 'EventDoType', '6', 'CH'), ('WFState_CH_0', '空白', 'WFState', '0', 'CH'), ('WFState_CH_1', '草稿', 'WFState', '1', 'CH'), ('WFState_CH_2', '运行中', 'WFState', '2', 'CH'), ('WFState_CH_3', '已完成', 'WFState', '3', 'CH'), ('WFState_CH_4', '挂起', 'WFState', '4', 'CH'), ('WFState_CH_5', '退回', 'WFState', '5', 'CH'), ('WFState_CH_6', '转发', 'WFState', '6', 'CH'), ('WFState_CH_7', '删除', 'WFState', '7', 'CH'), ('WFState_CH_8', '加签', 'WFState', '8', 'CH'), ('WFState_CH_9', '冻结', 'WFState', '9', 'CH'), ('WFState_CH_10', '批处理', 'WFState', '10', 'CH'), ('WFState_CH_11', '加签回复状态', 'WFState', '11', 'CH'), ('WFStateApp_CH_2', '运行中', 'WFStateApp', '2', 'CH'), ('WFStateApp_CH_3', '已完成', 'WFStateApp', '3', 'CH'), ('WFStateApp_CH_4', '挂起', 'WFStateApp', '4', 'CH'), ('WFStateApp_CH_5', '退回', 'WFStateApp', '5', 'CH'), ('WFStateApp_CH_6', '转发', 'WFStateApp', '6', 'CH'), ('WFStateApp_CH_7', '删除', 'WFStateApp', '7', 'CH'), ('WFStateApp_CH_8', '加签', 'WFStateApp', '8', 'CH'), ('WFStateApp_CH_9', '冻结', 'WFStateApp', '9', 'CH'), ('WFStateApp_CH_10', '批处理', 'WFStateApp', '10', 'CH'), ('RunModel_CH_0', '普通', 'RunModel', '0', 'CH'), ('RunModel_CH_1', '合流', 'RunModel', '1', 'CH'), ('RunModel_CH_2', '分流', 'RunModel', '2', 'CH'), ('RunModel_CH_3', '分合流', 'RunModel', '3', 'CH'), ('RunModel_CH_4', '子线程', 'RunModel', '4', 'CH'), ('FLRole_CH_0', '按接受人', 'FLRole', '0', 'CH'), ('FLRole_CH_1', '按部门', 'FLRole', '1', 'CH'), ('FLRole_CH_2', '按岗位', 'FLRole', '2', 'CH'), ('FJOpen_CH_0', '关闭附件', 'FJOpen', '0', 'CH'), ('FJOpen_CH_1', '操作员', 'FJOpen', '1', 'CH'), ('FJOpen_CH_2', '工作ID', 'FJOpen', '2', 'CH'), ('FJOpen_CH_3', '流程ID', 'FJOpen', '3', 'CH'), ('DocType_CH_0', '正式公文', 'DocType', '0', 'CH'), ('DocType_CH_1', '便函', 'DocType', '1', 'CH'), ('FlowRunWay_CH_0', '手工启动', 'FlowRunWay', '0', 'CH'), ('FlowRunWay_CH_1', '指定人员按时启动', 'FlowRunWay', '1', 'CH'), ('FlowRunWay_CH_2', '数据集按时启动', 'FlowRunWay', '2', 'CH'), ('FlowRunWay_CH_3', '触发式启动', 'FlowRunWay', '3', 'CH'), ('AppType_CH_0', '外部Url连接', 'AppType', '0', 'CH'), ('AppType_CH_1', '本地可执行文件', 'AppType', '1', 'CH'), ('AlertType_CH_0', '短信', 'AlertType', '0', 'CH'), ('AlertType_CH_1', '邮件', 'AlertType', '1', 'CH'), ('AlertType_CH_2', '邮件与短信', 'AlertType', '2', 'CH'), ('AlertType_CH_3', '系统(内部)消息', 'AlertType', '3', 'CH'), ('AlertWay_CH_0', '不接收', 'AlertWay', '0', 'CH'), ('AlertWay_CH_1', '短信', 'AlertWay', '1', 'CH'), ('AlertWay_CH_2', '邮件', 'AlertWay', '2', 'CH'), ('AlertWay_CH_3', '内部消息', 'AlertWay', '3', 'CH'), ('AlertWay_CH_4', 'QQ消息', 'AlertWay', '4', 'CH'), ('AlertWay_CH_5', 'RTX消息', 'AlertWay', '5', 'CH'), ('AlertWay_CH_6', 'MSN消息', 'AlertWay', '6', 'CH'), ('Target_CH_0', '新窗口', 'Target', '0', 'CH'), ('Target_CH_1', '本窗口', 'Target', '1', 'CH'), ('Target_CH_2', '父窗口', 'Target', '2', 'CH'), ('SharingType_CH_0', '共享', 'SharingType', '0', 'CH'), ('SharingType_CH_1', '私有', 'SharingType', '1', 'CH'), ('TaskSta_CH_0', '未开始', 'TaskSta', '0', 'CH'), ('TaskSta_CH_1', '进行中', 'TaskSta', '1', 'CH'), ('TaskSta_CH_2', '完成', 'TaskSta', '2', 'CH'), ('TaskSta_CH_3', '推迟', 'TaskSta', '3', 'CH'), ('JMCD_CH_0', '一般', 'JMCD', '0', 'CH'), ('JMCD_CH_1', '保密', 'JMCD', '1', 'CH'), ('JMCD_CH_2', '秘密', 'JMCD', '2', 'CH'), ('JMCD_CH_3', '机密', 'JMCD', '3', 'CH');
COMMIT;

-- ----------------------------
--  Table structure for `Sys_EnumMain`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_EnumMain`;
CREATE TABLE `Sys_EnumMain` (
  `No` varchar(40) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `CfgVal` varchar(1500) DEFAULT NULL,
  `Lang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FileManager`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FileManager`;
CREATE TABLE `Sys_FileManager` (
  `OID` int(11) NOT NULL,
  `AttrFileName` varchar(50) DEFAULT NULL,
  `AttrFileNo` varchar(50) DEFAULT NULL,
  `EnName` varchar(50) DEFAULT NULL,
  `RefVal` varchar(50) DEFAULT NULL,
  `WebPath` varchar(100) DEFAULT NULL,
  `MyFileName` varchar(100) DEFAULT NULL,
  `MyFilePath` varchar(100) DEFAULT NULL,
  `MyFileExt` varchar(10) DEFAULT NULL,
  `MyFileH` int(11) DEFAULT NULL,
  `MyFileW` int(11) DEFAULT NULL,
  `MyFileSize` float DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Rec` varchar(50) DEFAULT NULL,
  `Doc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FormTree`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FormTree`;
CREATE TABLE `Sys_FormTree` (
  `No` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ParentNo` varchar(100) DEFAULT NULL,
  `DBSrc` varchar(100) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Sys_FormTree`
-- ----------------------------
BEGIN;
INSERT INTO `Sys_FormTree` VALUES ('01', '表单类别1', '0', 'local', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `Sys_FrmAttachment`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmAttachment`;
CREATE TABLE `Sys_FrmAttachment` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `NoOfObj` varchar(50) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Exts` varchar(50) DEFAULT NULL,
  `SaveTo` varchar(150) DEFAULT NULL,
  `Sort` varchar(500) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `IsUpload` int(11) DEFAULT NULL,
  `IsDelete` int(11) DEFAULT NULL,
  `IsDownload` int(11) DEFAULT NULL,
  `IsOrder` int(11) DEFAULT NULL,
  `IsAutoSize` int(11) DEFAULT NULL,
  `IsNote` int(11) DEFAULT NULL,
  `IsShowTitle` int(11) DEFAULT NULL,
  `UploadType` int(11) DEFAULT NULL,
  `CtrlWay` int(11) DEFAULT NULL,
  `AthUploadWay` int(11) DEFAULT NULL,
  `AtPara` varchar(3000) DEFAULT NULL,
  `RowIdx` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmAttachmentDB`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmAttachmentDB`;
CREATE TABLE `Sys_FrmAttachmentDB` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `FK_FrmAttachment` varchar(500) DEFAULT NULL,
  `RefPKVal` varchar(50) DEFAULT NULL,
  `Sort` varchar(200) DEFAULT NULL,
  `FileFullName` varchar(700) DEFAULT NULL,
  `FileName` varchar(500) DEFAULT NULL,
  `FileExts` varchar(50) DEFAULT NULL,
  `FileSize` float DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Rec` varchar(50) DEFAULT NULL,
  `RecName` varchar(50) DEFAULT NULL,
  `MyNote` text,
  `NodeID` varchar(50) DEFAULT NULL,
  `IsRowLock` int(11) DEFAULT NULL,
  `UploadGUID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmBtn`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmBtn`;
CREATE TABLE `Sys_FrmBtn` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `Text` text,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `IsView` int(11) DEFAULT NULL,
  `IsEnable` int(11) DEFAULT NULL,
  `BtnType` int(11) DEFAULT NULL,
  `UAC` int(11) DEFAULT NULL,
  `UACContext` text,
  `EventType` int(11) DEFAULT NULL,
  `EventContext` text,
  `MsgOK` varchar(500) DEFAULT NULL,
  `MsgErr` varchar(500) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmEle`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmEle`;
CREATE TABLE `Sys_FrmEle` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `EleType` varchar(50) DEFAULT NULL,
  `EleID` varchar(50) DEFAULT NULL,
  `EleName` varchar(200) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `IsEnable` int(11) DEFAULT NULL,
  `Tag1` varchar(50) DEFAULT NULL,
  `Tag2` varchar(50) DEFAULT NULL,
  `Tag3` varchar(50) DEFAULT NULL,
  `Tag4` varchar(50) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmEleDB`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmEleDB`;
CREATE TABLE `Sys_FrmEleDB` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `EleID` varchar(50) DEFAULT NULL,
  `RefPKVal` varchar(50) DEFAULT NULL,
  `Tag1` text,
  `Tag2` text,
  `Tag3` text,
  `Tag4` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmEvent`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmEvent`;
CREATE TABLE `Sys_FrmEvent` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Event` varchar(400) DEFAULT NULL,
  `FK_MapData` varchar(400) DEFAULT NULL,
  `DoType` int(11) DEFAULT NULL,
  `DoDoc` varchar(400) DEFAULT NULL,
  `MsgOK` varchar(400) DEFAULT NULL,
  `MsgError` varchar(400) DEFAULT NULL,
  `MsgCtrl` int(11) DEFAULT NULL,
  `MsgMailEnable` int(11) DEFAULT NULL,
  `MailTitle` varchar(200) DEFAULT NULL,
  `MailDoc` text,
  `SMSEnable` int(11) DEFAULT NULL,
  `SMSDoc` text,
  `MobilePushEnable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmImg`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmImg`;
CREATE TABLE `Sys_FrmImg` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `ImgAppType` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `ImgURL` varchar(200) DEFAULT NULL,
  `ImgPath` varchar(200) DEFAULT NULL,
  `LinkURL` varchar(200) DEFAULT NULL,
  `LinkTarget` varchar(200) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL,
  `Tag0` varchar(500) DEFAULT NULL,
  `SrcType` int(11) DEFAULT NULL,
  `IsEdit` int(11) DEFAULT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `EnPK` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmImgAth`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmImgAth`;
CREATE TABLE `Sys_FrmImgAth` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `CtrlID` varchar(200) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `IsEdit` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmImgAthDB`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmImgAthDB`;
CREATE TABLE `Sys_FrmImgAthDB` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `FK_FrmImgAth` varchar(50) DEFAULT NULL,
  `RefPKVal` varchar(50) DEFAULT NULL,
  `FileFullName` varchar(700) DEFAULT NULL,
  `FileName` varchar(500) DEFAULT NULL,
  `FileExts` varchar(50) DEFAULT NULL,
  `FileSize` float DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Rec` varchar(50) DEFAULT NULL,
  `RecName` varchar(50) DEFAULT NULL,
  `MyNote` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmLab`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmLab`;
CREATE TABLE `Sys_FrmLab` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `Text` text,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `FontSize` int(11) DEFAULT NULL,
  `FontColor` varchar(50) DEFAULT NULL,
  `FontName` varchar(50) DEFAULT NULL,
  `FontStyle` varchar(50) DEFAULT NULL,
  `FontWeight` varchar(50) DEFAULT NULL,
  `IsBold` int(11) DEFAULT NULL,
  `IsItalic` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmLine`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmLine`;
CREATE TABLE `Sys_FrmLine` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `X1` float DEFAULT NULL,
  `Y1` float DEFAULT NULL,
  `X2` float DEFAULT NULL,
  `Y2` float DEFAULT NULL,
  `BorderWidth` float DEFAULT NULL,
  `BorderColor` varchar(30) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmLink`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmLink`;
CREATE TABLE `Sys_FrmLink` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `Text` varchar(500) DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  `Target` varchar(20) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `FontSize` int(11) DEFAULT NULL,
  `FontColor` varchar(50) DEFAULT NULL,
  `FontName` varchar(50) DEFAULT NULL,
  `FontStyle` varchar(50) DEFAULT NULL,
  `IsBold` int(11) DEFAULT NULL,
  `IsItalic` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmRB`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmRB`;
CREATE TABLE `Sys_FrmRB` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `KeyOfEn` varchar(30) DEFAULT NULL,
  `EnumKey` varchar(30) DEFAULT NULL,
  `Lab` varchar(90) DEFAULT NULL,
  `IntKey` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmRePortField`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmRePortField`;
CREATE TABLE `Sys_FrmRePortField` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `KeyOfEn` varchar(100) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `UIWidth` varchar(100) DEFAULT NULL,
  `UIVisible` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmRpt`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmRpt`;
CREATE TABLE `Sys_FrmRpt` (
  `No` varchar(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `PTable` varchar(30) DEFAULT NULL,
  `SQLOfColumn` varchar(300) DEFAULT NULL,
  `SQLOfRow` varchar(300) DEFAULT NULL,
  `RowIdx` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `IsShowSum` int(11) DEFAULT NULL,
  `IsShowIdx` int(11) DEFAULT NULL,
  `IsCopyNDData` int(11) DEFAULT NULL,
  `IsHLDtl` int(11) DEFAULT NULL,
  `IsReadonly` int(11) DEFAULT NULL,
  `IsShowTitle` int(11) DEFAULT NULL,
  `IsView` int(11) DEFAULT NULL,
  `IsExp` int(11) DEFAULT NULL,
  `IsImp` int(11) DEFAULT NULL,
  `IsInsert` int(11) DEFAULT NULL,
  `IsDelete` int(11) DEFAULT NULL,
  `IsUpdate` int(11) DEFAULT NULL,
  `IsEnablePass` int(11) DEFAULT NULL,
  `IsEnableAthM` int(11) DEFAULT NULL,
  `IsEnableM2M` int(11) DEFAULT NULL,
  `IsEnableM2MM` int(11) DEFAULT NULL,
  `WhenOverSize` int(11) DEFAULT NULL,
  `DtlOpenType` int(11) DEFAULT NULL,
  `DtlShowModel` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `FrmW` float DEFAULT NULL,
  `FrmH` float DEFAULT NULL,
  `MTR` varchar(3000) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_FrmSln`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_FrmSln`;
CREATE TABLE `Sys_FrmSln` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Flow` varchar(4) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_MapData` varchar(100) DEFAULT NULL,
  `KeyOfEn` varchar(200) DEFAULT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `EleType` varchar(20) DEFAULT NULL,
  `UIIsEnable` int(11) DEFAULT NULL,
  `UIVisible` int(11) DEFAULT NULL,
  `IsSigan` int(11) DEFAULT NULL,
  `IsNotNull` int(11) DEFAULT NULL,
  `RegularExp` varchar(500) DEFAULT NULL,
  `IsWriteToFlowTable` int(11) DEFAULT NULL,
  `DefVal` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_GloVar`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_GloVar`;
CREATE TABLE `Sys_GloVar` (
  `No` varchar(30) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Val` varchar(120) DEFAULT NULL,
  `GroupKey` varchar(120) DEFAULT NULL,
  `Note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_GroupEnsTemplate`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_GroupEnsTemplate`;
CREATE TABLE `Sys_GroupEnsTemplate` (
  `OID` int(11) NOT NULL,
  `EnName` varchar(500) DEFAULT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `EnsName` varchar(90) DEFAULT NULL,
  `OperateCol` varchar(90) DEFAULT NULL,
  `Attrs` varchar(90) DEFAULT NULL,
  `Rec` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_GroupField`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_GroupField`;
CREATE TABLE `Sys_GroupField` (
  `OID` int(11) NOT NULL,
  `Lab` varchar(500) DEFAULT NULL,
  `EnName` varchar(200) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_M2M`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_M2M`;
CREATE TABLE `Sys_M2M` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(20) DEFAULT NULL,
  `M2MNo` varchar(20) DEFAULT NULL,
  `EnOID` int(11) DEFAULT NULL,
  `DtlObj` varchar(20) DEFAULT NULL,
  `Doc` text,
  `ValsName` text,
  `ValsSQL` text,
  `NumSelected` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapAttr`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapAttr`;
CREATE TABLE `Sys_MapAttr` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(200) DEFAULT NULL,
  `KeyOfEn` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `DefVal` text,
  `UIContralType` int(11) DEFAULT NULL,
  `MyDataType` int(11) DEFAULT NULL,
  `LGType` int(11) DEFAULT NULL,
  `UIWidth` float DEFAULT NULL,
  `UIHeight` float DEFAULT NULL,
  `MinLen` int(11) DEFAULT NULL,
  `MaxLen` int(11) DEFAULT NULL,
  `UIBindKey` varchar(100) DEFAULT NULL,
  `UIRefKey` varchar(30) DEFAULT NULL,
  `UIRefKeyText` varchar(30) DEFAULT NULL,
  `UIVisible` int(11) DEFAULT NULL,
  `UIIsEnable` int(11) DEFAULT NULL,
  `UIIsLine` int(11) DEFAULT NULL,
  `UIIsInput` int(11) DEFAULT NULL,
  `IDX` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `IsSigan` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL,
  `Tag` varchar(100) DEFAULT NULL,
  `EditType` int(11) DEFAULT NULL,
  `ColSpan` int(11) DEFAULT NULL,
  `AtPara` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapData`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapData`;
CREATE TABLE `Sys_MapData` (
  `No` varchar(200) NOT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `EnPK` varchar(10) DEFAULT NULL,
  `PTable` varchar(500) DEFAULT NULL,
  `Url` varchar(500) DEFAULT NULL,
  `Dtls` varchar(500) DEFAULT NULL,
  `FrmW` int(11) DEFAULT NULL,
  `FrmH` int(11) DEFAULT NULL,
  `TableCol` int(11) DEFAULT NULL,
  `TableWidth` int(11) DEFAULT NULL,
  `DBURL` int(11) DEFAULT NULL,
  `Tag` varchar(500) DEFAULT NULL,
  `FrmType` int(11) DEFAULT NULL,
  `FK_FrmSort` varchar(500) DEFAULT NULL,
  `FK_FormTree` varchar(500) DEFAULT NULL,
  `AppType` int(11) DEFAULT NULL,
  `DBSrc` varchar(100) DEFAULT NULL,
  `BodyAttr` varchar(100) DEFAULT NULL,
  `Note` varchar(4000) DEFAULT NULL,
  `Designer` varchar(500) DEFAULT NULL,
  `DesignerUnit` varchar(500) DEFAULT NULL,
  `DesignerContact` varchar(500) DEFAULT NULL,
  `AtPara` text,
  `Idx` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL,
  `Ver` varchar(30) DEFAULT NULL,
  `OfficeOpenLab` varchar(50) DEFAULT '打开本地',
  `OfficeOpenEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeOpenTemplateLab` varchar(50) DEFAULT '打开模板',
  `OfficeOpenTemplateEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeSaveLab` varchar(50) DEFAULT '保存',
  `OfficeSaveEnable` int(11) NOT NULL DEFAULT '1',
  `OfficeAcceptLab` varchar(50) DEFAULT '接受修订',
  `OfficeAcceptEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeRefuseLab` varchar(50) DEFAULT '拒绝修订',
  `OfficeRefuseEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeOverLab` varchar(50) DEFAULT '套红按钮',
  `OfficeOverEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeMarksEnable` int(11) NOT NULL DEFAULT '1',
  `OfficePrintLab` varchar(50) DEFAULT '打印按钮',
  `OfficePrintEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeSealLab` varchar(50) DEFAULT '签章按钮',
  `OfficeSealEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeInsertFlowLab` varchar(50) DEFAULT '插入流程',
  `OfficeInsertFlowEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeNodeInfo` int(11) NOT NULL DEFAULT '0',
  `OfficeReSavePDF` int(11) NOT NULL DEFAULT '0',
  `OfficeDownLab` varchar(50) DEFAULT '下载',
  `OfficeDownEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeIsMarks` int(11) NOT NULL DEFAULT '1',
  `OfficeTemplate` varchar(100) DEFAULT '',
  `OfficeIsParent` int(11) NOT NULL DEFAULT '1',
  `OfficeTHEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeTHTemplate` varchar(200) DEFAULT '',
  `FK_Flow` varchar(50) DEFAULT NULL,
  `RightViewWay` int(11) NOT NULL DEFAULT '0',
  `RightViewTag` text,
  `RightDeptWay` int(11) NOT NULL DEFAULT '0',
  `RightDeptTag` text,
  `FormRunType` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapDtl`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapDtl`;
CREATE TABLE `Sys_MapDtl` (
  `No` varchar(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `PTable` varchar(30) DEFAULT NULL,
  `GroupField` varchar(50) DEFAULT NULL,
  `Model` int(11) DEFAULT NULL,
  `ImpFixTreeSql` varchar(500) DEFAULT NULL,
  `ImpFixDataSql` varchar(500) DEFAULT NULL,
  `RowIdx` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `RowsOfList` int(11) DEFAULT NULL,
  `IsEnableGroupField` int(11) DEFAULT NULL,
  `IsShowSum` int(11) DEFAULT NULL,
  `IsShowIdx` int(11) DEFAULT NULL,
  `IsCopyNDData` int(11) DEFAULT NULL,
  `IsHLDtl` int(11) DEFAULT NULL,
  `IsReadonly` int(11) DEFAULT NULL,
  `IsShowTitle` int(11) DEFAULT NULL,
  `IsView` int(11) DEFAULT NULL,
  `IsInsert` int(11) DEFAULT NULL,
  `IsDelete` int(11) DEFAULT NULL,
  `IsUpdate` int(11) DEFAULT NULL,
  `IsEnablePass` int(11) DEFAULT NULL,
  `IsEnableAthM` int(11) DEFAULT NULL,
  `IsEnableM2M` int(11) DEFAULT NULL,
  `IsEnableM2MM` int(11) DEFAULT NULL,
  `WhenOverSize` int(11) DEFAULT NULL,
  `DtlOpenType` int(11) DEFAULT NULL,
  `DtlShowModel` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `FrmW` float DEFAULT NULL,
  `FrmH` float DEFAULT NULL,
  `MTR` varchar(3000) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `AtPara` varchar(300) DEFAULT NULL,
  `IsExp` int(11) DEFAULT NULL,
  `IsImp` int(11) DEFAULT NULL,
  `IsEnableSelectImp` int(11) DEFAULT NULL,
  `ImpSQLSearch` varchar(500) DEFAULT NULL,
  `ImpSQLInit` varchar(500) DEFAULT NULL,
  `ImpSQLFull` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapExt`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapExt`;
CREATE TABLE `Sys_MapExt` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `ExtType` varchar(30) DEFAULT NULL,
  `DoWay` int(11) DEFAULT NULL,
  `AttrOfOper` varchar(30) DEFAULT NULL,
  `AttrsOfActive` varchar(900) DEFAULT NULL,
  `Doc` text,
  `Tag` varchar(2000) DEFAULT NULL,
  `Tag1` varchar(2000) DEFAULT NULL,
  `Tag2` varchar(2000) DEFAULT NULL,
  `Tag3` varchar(2000) DEFAULT NULL,
  `AtPara` varchar(2000) DEFAULT NULL,
  `DBSrc` varchar(20) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `FK_DBSrc` varchar(100) DEFAULT NULL,
  `PRI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapFrame`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapFrame`;
CREATE TABLE `Sys_MapFrame` (
  `MyPK` varchar(100) NOT NULL,
  `NoOfObj` varchar(20) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `URL` varchar(3000) DEFAULT NULL,
  `W` varchar(20) DEFAULT NULL,
  `H` varchar(20) DEFAULT NULL,
  `IsAutoSize` int(11) DEFAULT NULL,
  `RowIdx` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `GUID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_MapM2M`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_MapM2M`;
CREATE TABLE `Sys_MapM2M` (
  `MyPK` varchar(100) NOT NULL,
  `FK_MapData` varchar(30) DEFAULT NULL,
  `NoOfObj` varchar(20) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `DBOfLists` text,
  `DBOfObjs` text,
  `DBOfGroups` text,
  `H` float DEFAULT NULL,
  `W` float DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `ShowWay` int(11) DEFAULT NULL,
  `M2MType` int(11) DEFAULT NULL,
  `RowIdx` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `Cols` int(11) DEFAULT NULL,
  `IsDelete` int(11) DEFAULT NULL,
  `IsInsert` int(11) DEFAULT NULL,
  `IsCheckAll` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_RptTemplate`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RptTemplate`;
CREATE TABLE `Sys_RptTemplate` (
  `MyPK` varchar(100) NOT NULL,
  `EnsName` varchar(500) DEFAULT NULL,
  `FK_Emp` varchar(20) DEFAULT NULL,
  `D1` varchar(90) DEFAULT NULL,
  `D2` varchar(90) DEFAULT NULL,
  `D3` varchar(90) DEFAULT NULL,
  `AlObjs` varchar(90) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `IsSumBig` int(11) DEFAULT NULL,
  `IsSumLittle` int(11) DEFAULT NULL,
  `IsSumRight` int(11) DEFAULT NULL,
  `PercentModel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_SFDBSrc`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_SFDBSrc`;
CREATE TABLE `Sys_SFDBSrc` (
  `No` varchar(20) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `DBName` varchar(30) DEFAULT NULL,
  `DBSrcType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_SFTable`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_SFTable`;
CREATE TABLE `Sys_SFTable` (
  `No` varchar(20) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `FK_Val` varchar(50) DEFAULT NULL,
  `TableDesc` varchar(50) DEFAULT NULL,
  `DefVal` varchar(200) DEFAULT NULL,
  `SrcType` int(11) DEFAULT NULL,
  `CodeStruct` int(11) DEFAULT NULL,
  `CashDT` varchar(200) DEFAULT NULL,
  `CashMinute` int(11) DEFAULT NULL,
  `FK_SFDBSrc` varchar(100) DEFAULT NULL,
  `SrcTable` varchar(50) DEFAULT NULL,
  `ColumnValue` varchar(50) DEFAULT NULL,
  `ColumnText` varchar(50) DEFAULT NULL,
  `ParentValue` varchar(50) DEFAULT NULL,
  `SelectStatement` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_SMS`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_SMS`;
CREATE TABLE `Sys_SMS` (
  `MyPK` varchar(100) NOT NULL,
  `Sender` varchar(200) DEFAULT NULL,
  `SendTo` varchar(200) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Mobile` varchar(30) DEFAULT NULL,
  `MobileSta` int(11) DEFAULT NULL,
  `MobileInfo` varchar(1000) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `EmailSta` int(11) DEFAULT NULL,
  `EmailTitle` varchar(3000) DEFAULT NULL,
  `EmailDoc` text,
  `SendDT` varchar(50) DEFAULT NULL,
  `IsRead` int(11) DEFAULT NULL,
  `IsAlert` int(11) DEFAULT NULL,
  `MsgFlag` varchar(200) DEFAULT NULL,
  `MsgType` varchar(200) DEFAULT NULL,
  `AtPara` varchar(500) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_Serial`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Serial`;
CREATE TABLE `Sys_Serial` (
  `CfgKey` varchar(100) NOT NULL,
  `IntVal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Sys_Serial`
-- ----------------------------
BEGIN;
INSERT INTO `Sys_Serial` VALUES ('BP.WF.Template.FlowSort', '102');
COMMIT;

-- ----------------------------
--  Table structure for `Sys_UserLogT`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_UserLogT`;
CREATE TABLE `Sys_UserLogT` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Emp` varchar(30) DEFAULT NULL,
  `IP` varchar(200) DEFAULT NULL,
  `LogFlag` varchar(300) DEFAULT NULL,
  `Docs` varchar(300) DEFAULT NULL,
  `RDT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_UserRegedit`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_UserRegedit`;
CREATE TABLE `Sys_UserRegedit` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Emp` varchar(30) DEFAULT NULL,
  `CfgKey` varchar(200) DEFAULT NULL,
  `Vals` varchar(2000) DEFAULT NULL,
  `GenerSQL` varchar(2000) DEFAULT NULL,
  `Paras` varchar(2000) DEFAULT NULL,
  `NumKey` varchar(300) DEFAULT NULL,
  `OrderBy` varchar(300) DEFAULT NULL,
  `OrderWay` varchar(300) DEFAULT NULL,
  `SearchKey` varchar(300) DEFAULT NULL,
  `MVals` varchar(300) DEFAULT NULL,
  `IsPic` int(11) DEFAULT NULL,
  `DTFrom` varchar(20) DEFAULT NULL,
  `DTTo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `Sys_WFSealData`
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WFSealData`;
CREATE TABLE `Sys_WFSealData` (
  `MyPK` varchar(100) NOT NULL,
  `OID` varchar(200) DEFAULT NULL,
  `FK_Node` varchar(200) DEFAULT NULL,
  `FK_MapData` varchar(300) DEFAULT NULL,
  `SealData` text,
  `RDT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `V_Todolist`
-- ----------------------------
DROP TABLE IF EXISTS `V_Todolist`;
CREATE TABLE `V_Todolist` (
  `MyPK` varchar(100) NOT NULL,
  `FK_FlowSort` varchar(100) DEFAULT NULL,
  `FK_Flow` varchar(100) DEFAULT NULL,
  `TodoSta0` int(11) DEFAULT NULL,
  `TodoSta1` int(11) DEFAULT NULL,
  `TodoSta2` int(11) DEFAULT NULL,
  `TodoSta3` int(11) DEFAULT NULL,
  `TodoSta4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_AccepterRole`
-- ----------------------------
DROP TABLE IF EXISTS `WF_AccepterRole`;
CREATE TABLE `WF_AccepterRole` (
  `OID` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FK_Node` varchar(100) DEFAULT NULL,
  `FK_Mode` int(11) DEFAULT NULL,
  `Tag0` varchar(999) DEFAULT NULL,
  `Tag1` varchar(999) DEFAULT NULL,
  `Tag2` varchar(999) DEFAULT NULL,
  `Tag3` varchar(999) DEFAULT NULL,
  `Tag4` varchar(999) DEFAULT NULL,
  `Tag5` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Bill`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Bill`;
CREATE TABLE `WF_Bill` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `FK_Flow` varchar(4) DEFAULT NULL,
  `FK_BillType` varchar(300) DEFAULT NULL,
  `Title` varchar(900) DEFAULT NULL,
  `FK_Starter` varchar(50) DEFAULT NULL,
  `StartDT` varchar(50) DEFAULT NULL,
  `Url` varchar(2000) DEFAULT NULL,
  `FullPath` varchar(2000) DEFAULT NULL,
  `FK_Emp` varchar(100) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `FK_NY` varchar(100) DEFAULT NULL,
  `Emps` text,
  `FK_Node` varchar(30) DEFAULT NULL,
  `FK_Bill` varchar(500) DEFAULT NULL,
  `MyNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_BillTemplate`
-- ----------------------------
DROP TABLE IF EXISTS `WF_BillTemplate`;
CREATE TABLE `WF_BillTemplate` (
  `No` varchar(190) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `NodeID` int(11) DEFAULT NULL,
  `BillFileType` int(11) DEFAULT NULL,
  `FK_BillType` varchar(4) DEFAULT NULL,
  `IDX` varchar(200) DEFAULT NULL,
  `ExpField` varchar(800) DEFAULT NULL,
  `ReplaceVal` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_BillType`
-- ----------------------------
DROP TABLE IF EXISTS `WF_BillType`;
CREATE TABLE `WF_BillType` (
  `No` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `FK_Flow` varchar(50) DEFAULT NULL,
  `IDX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CCDEPT`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CCDEPT`;
CREATE TABLE `WF_CCDEPT` (
  `FK_Node` int(11) NOT NULL,
  `FK_Dept` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CCEMP`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CCEMP`;
CREATE TABLE `WF_CCEMP` (
  `FK_Node` int(11) NOT NULL,
  `FK_Emp` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CCList`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CCList`;
CREATE TABLE `WF_CCList` (
  `MyPK` varchar(100) NOT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `FK_Flow` varchar(3) DEFAULT NULL,
  `FlowName` varchar(200) DEFAULT NULL,
  `NDFrom` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `NodeName` varchar(500) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `Doc` text,
  `Rec` varchar(50) DEFAULT NULL,
  `RecDept` varchar(50) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Sta` int(11) DEFAULT NULL,
  `CCTo` varchar(50) DEFAULT NULL,
  `CCToDept` varchar(50) DEFAULT NULL,
  `CCToName` varchar(50) DEFAULT NULL,
  `CheckNote` varchar(600) DEFAULT NULL,
  `CDT` varchar(50) DEFAULT NULL,
  `PFlowNo` varchar(100) DEFAULT NULL,
  `PWorkID` int(11) DEFAULT NULL,
  `InEmpWorks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CCSTATION`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CCSTATION`;
CREATE TABLE `WF_CCSTATION` (
  `FK_Node` int(11) NOT NULL,
  `FK_Station` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CH`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CH`;
CREATE TABLE `WF_CH` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `Title` varchar(900) DEFAULT NULL,
  `FK_Flow` varchar(100) DEFAULT NULL,
  `FK_FlowT` varchar(50) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_NodeT` varchar(50) DEFAULT NULL,
  `DTFrom` varchar(50) DEFAULT NULL,
  `DTTo` varchar(50) DEFAULT NULL,
  `SDT` varchar(50) DEFAULT NULL,
  `TSpan` varchar(50) DEFAULT NULL,
  `UseMinutes` int(11) DEFAULT NULL,
  `UseTime` varchar(50) DEFAULT NULL,
  `OverMinutes` int(11) DEFAULT NULL,
  `OverTime` varchar(50) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `FK_DeptT` varchar(50) DEFAULT NULL,
  `FK_Emp` varchar(100) DEFAULT NULL,
  `FK_EmpT` varchar(50) DEFAULT NULL,
  `FK_NY` varchar(100) DEFAULT NULL,
  `WeekNum` int(11) DEFAULT NULL,
  `CHSta` int(11) DEFAULT NULL,
  `MyNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_CHEval`
-- ----------------------------
DROP TABLE IF EXISTS `WF_CHEval`;
CREATE TABLE `WF_CHEval` (
  `MyPK` varchar(100) NOT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `FK_Flow` varchar(7) DEFAULT NULL,
  `FlowName` varchar(100) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `NodeName` varchar(100) DEFAULT NULL,
  `Rec` varchar(50) DEFAULT NULL,
  `RecName` varchar(50) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `EvalEmpNo` varchar(50) DEFAULT NULL,
  `EvalEmpName` varchar(50) DEFAULT NULL,
  `EvalCent` varchar(20) DEFAULT NULL,
  `EvalNote` varchar(20) DEFAULT NULL,
  `FK_Dept` varchar(50) DEFAULT NULL,
  `DeptName` varchar(100) DEFAULT NULL,
  `FK_NY` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Cond`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Cond`;
CREATE TABLE `WF_Cond` (
  `MyPK` varchar(100) NOT NULL,
  `CondType` int(11) DEFAULT NULL,
  `DataFrom` int(11) DEFAULT NULL,
  `FK_Flow` varchar(60) DEFAULT NULL,
  `NodeID` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Attr` varchar(80) DEFAULT NULL,
  `AttrKey` varchar(60) DEFAULT NULL,
  `AttrName` varchar(500) DEFAULT NULL,
  `FK_Operator` varchar(60) DEFAULT NULL,
  `OperatorValue` text,
  `OperatorValueT` text,
  `ToNodeID` int(11) DEFAULT NULL,
  `ConnJudgeWay` int(11) DEFAULT NULL,
  `MyPOID` int(11) DEFAULT NULL,
  `PRI` int(11) DEFAULT NULL,
  `CondOrAnd` int(11) DEFAULT NULL,
  `AtPara` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_DataApply`
-- ----------------------------
DROP TABLE IF EXISTS `WF_DataApply`;
CREATE TABLE `WF_DataApply` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `NodeId` int(11) DEFAULT NULL,
  `RunState` int(11) DEFAULT NULL,
  `ApplyDays` int(11) DEFAULT NULL,
  `ApplyData` varchar(50) DEFAULT NULL,
  `Applyer` varchar(100) DEFAULT NULL,
  `ApplyNote1` text,
  `ApplyNote2` text,
  `Checker` varchar(100) DEFAULT NULL,
  `CheckerData` varchar(50) DEFAULT NULL,
  `CheckerDays` int(11) DEFAULT NULL,
  `CheckerNote1` text,
  `CheckerNote2` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_DeptFlowSearch`
-- ----------------------------
DROP TABLE IF EXISTS `WF_DeptFlowSearch`;
CREATE TABLE `WF_DeptFlowSearch` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Emp` varchar(50) DEFAULT NULL,
  `FK_Flow` varchar(50) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Direction`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Direction`;
CREATE TABLE `WF_Direction` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Flow` varchar(3) DEFAULT NULL,
  `Node` int(11) DEFAULT NULL,
  `ToNode` int(11) DEFAULT NULL,
  `DirType` int(11) DEFAULT NULL,
  `IsCanBack` int(11) DEFAULT NULL,
  `Dots` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Emp`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Emp`;
CREATE TABLE `WF_Emp` (
  `No` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `UseSta` int(11) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `TM` varchar(50) DEFAULT NULL,
  `AlertWay` int(11) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `AuthorDate` varchar(50) DEFAULT NULL,
  `AuthorWay` int(11) DEFAULT NULL,
  `AuthorToDate` varchar(50) DEFAULT NULL,
  `AuthorFlows` varchar(1000) DEFAULT NULL,
  `Stas` varchar(3000) DEFAULT NULL,
  `Depts` varchar(100) DEFAULT NULL,
  `FtpUrl` varchar(50) DEFAULT NULL,
  `Msg` text,
  `Style` text,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_FLOWEMP`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FLOWEMP`;
CREATE TABLE `WF_FLOWEMP` (
  `FK_Flow` varchar(100) NOT NULL,
  `FK_Emp` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Flow`,`FK_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_FLOWNODE`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FLOWNODE`;
CREATE TABLE `WF_FLOWNODE` (
  `FK_Flow` varchar(20) NOT NULL,
  `FK_Node` varchar(20) NOT NULL,
  PRIMARY KEY (`FK_Flow`,`FK_Node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_FindWorkerRole`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FindWorkerRole`;
CREATE TABLE `WF_FindWorkerRole` (
  `OID` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `SortVal0` varchar(200) DEFAULT NULL,
  `SortText0` varchar(200) DEFAULT NULL,
  `SortVal1` varchar(200) DEFAULT NULL,
  `SortText1` varchar(200) DEFAULT NULL,
  `SortVal2` varchar(200) DEFAULT NULL,
  `SortText2` varchar(200) DEFAULT NULL,
  `SortVal3` varchar(200) DEFAULT NULL,
  `SortText3` varchar(200) DEFAULT NULL,
  `TagVal0` varchar(1000) DEFAULT NULL,
  `TagVal1` varchar(1000) DEFAULT NULL,
  `TagVal2` varchar(1000) DEFAULT NULL,
  `TagVal3` varchar(1000) DEFAULT NULL,
  `TagText0` varchar(1000) DEFAULT NULL,
  `TagText1` varchar(1000) DEFAULT NULL,
  `TagText2` varchar(1000) DEFAULT NULL,
  `TagText3` varchar(1000) DEFAULT NULL,
  `IsEnable` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Flow`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Flow`;
CREATE TABLE `WF_Flow` (
  `No` varchar(10) NOT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `FK_FlowSort` varchar(100) DEFAULT NULL,
  `SysType` varchar(100) DEFAULT NULL,
  `FlowRunWay` int(11) DEFAULT NULL,
  `RunObj` varchar(4000) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `RunSQL` varchar(2000) DEFAULT NULL,
  `NumOfBill` int(11) DEFAULT NULL,
  `NumOfDtl` int(11) DEFAULT NULL,
  `FlowAppType` int(11) DEFAULT NULL,
  `ChartType` int(11) DEFAULT NULL,
  `IsCanStart` int(11) DEFAULT NULL,
  `AvgDay` float DEFAULT NULL,
  `IsFullSA` int(11) DEFAULT NULL,
  `IsMD5` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `TimelineRole` int(11) DEFAULT NULL,
  `Paras` varchar(400) DEFAULT NULL,
  `PTable` varchar(30) DEFAULT NULL,
  `Draft` int(11) DEFAULT NULL,
  `DataStoreModel` int(11) DEFAULT NULL,
  `TitleRole` varchar(150) DEFAULT NULL,
  `FlowMark` varchar(150) DEFAULT NULL,
  `FlowEventEntity` varchar(150) DEFAULT NULL,
  `HistoryFields` varchar(500) DEFAULT NULL,
  `IsGuestFlow` int(11) DEFAULT NULL,
  `BillNoFormat` varchar(50) DEFAULT NULL,
  `FlowNoteExp` varchar(500) DEFAULT NULL,
  `DRCtrlType` int(11) DEFAULT NULL,
  `StartLimitRole` int(11) DEFAULT NULL,
  `StartLimitPara` varchar(500) DEFAULT NULL,
  `StartLimitAlert` varchar(4000) DEFAULT NULL,
  `StartLimitWhen` int(11) DEFAULT NULL,
  `StartGuideWay` int(11) DEFAULT NULL,
  `StartGuidePara1` varchar(500) DEFAULT NULL,
  `StartGuidePara2` varchar(500) DEFAULT NULL,
  `StartGuidePara3` varchar(500) DEFAULT NULL,
  `IsResetData` int(11) DEFAULT NULL,
  `IsLoadPriData` int(11) DEFAULT NULL,
  `CFlowWay` int(11) DEFAULT NULL,
  `CFlowPara` varchar(100) DEFAULT NULL,
  `IsBatchStart` int(11) DEFAULT NULL,
  `BatchStartFields` varchar(500) DEFAULT NULL,
  `IsAutoSendSubFlowOver` int(11) DEFAULT NULL,
  `Ver` varchar(20) DEFAULT NULL,
  `DType` int(11) DEFAULT NULL,
  `AtPara` varchar(1000) DEFAULT NULL,
  `DTSWay` int(11) DEFAULT NULL,
  `DTSDBSrc` varchar(200) DEFAULT NULL,
  `DTSBTable` varchar(200) DEFAULT NULL,
  `DTSBTablePK` varchar(50) DEFAULT NULL,
  `DTSTime` int(11) DEFAULT NULL,
  `DTSSpecNodes` varchar(200) DEFAULT NULL,
  `DTSField` int(11) DEFAULT NULL,
  `DTSFields` varchar(2000) DEFAULT NULL,
  `HelpUrl` varchar(300) DEFAULT '',
  `DesignerNo` varchar(32) DEFAULT '',
  `DesignerName` varchar(100) DEFAULT '',
  `PStarter` int(11) NOT NULL DEFAULT '1',
  `PWorker` int(11) NOT NULL DEFAULT '1',
  `PCCer` int(11) NOT NULL DEFAULT '1',
  `PMyDept` int(11) NOT NULL DEFAULT '1',
  `PPMyDept` int(11) NOT NULL DEFAULT '1',
  `PPDept` int(11) NOT NULL DEFAULT '1',
  `PSameDept` int(11) NOT NULL DEFAULT '1',
  `PSpecDept` int(11) NOT NULL DEFAULT '1',
  `PSpecDeptExt` varchar(200) DEFAULT '',
  `PSpecSta` int(11) NOT NULL DEFAULT '1',
  `PSpecStaExt` varchar(200) DEFAULT '',
  `PSpecGroup` int(11) NOT NULL DEFAULT '1',
  `PSpecGroupExt` varchar(200) DEFAULT '',
  `PSpecEmp` int(11) NOT NULL DEFAULT '1',
  `PSpecEmpExt` varchar(200) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_FlowFormTree`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FlowFormTree`;
CREATE TABLE `WF_FlowFormTree` (
  `No` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ParentNo` varchar(100) DEFAULT NULL,
  `TreeNo` varchar(100) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL,
  `FK_Flow` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_FlowSort`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FlowSort`;
CREATE TABLE `WF_FlowSort` (
  `No` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ParentNo` varchar(100) DEFAULT NULL,
  `TreeNo` varchar(100) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `IsDir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `WF_FlowSort`
-- ----------------------------
BEGIN;
INSERT INTO `WF_FlowSort` VALUES ('01', '流程树', '0', '01', '0', '1'), ('100', '日常办公类', '01', '00', '0', '0'), ('101', '财务类', '01', '1.0', '0', '0'), ('102', '人力资源类', '01', '2.0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `WF_FrmNode`
-- ----------------------------
DROP TABLE IF EXISTS `WF_FrmNode`;
CREATE TABLE `WF_FrmNode` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Frm` varchar(32) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Flow` varchar(20) DEFAULT NULL,
  `OfficeOpenLab` varchar(50) DEFAULT NULL,
  `OfficeOpenEnable` int(11) DEFAULT NULL,
  `OfficeOpenTemplateLab` varchar(50) DEFAULT NULL,
  `OfficeOpenTemplateEnable` int(11) DEFAULT NULL,
  `OfficeSaveLab` varchar(50) DEFAULT NULL,
  `OfficeSaveEnable` int(11) DEFAULT NULL,
  `OfficeAcceptLab` varchar(50) DEFAULT NULL,
  `OfficeAcceptEnable` int(11) DEFAULT NULL,
  `OfficeRefuseLab` varchar(50) DEFAULT NULL,
  `OfficeRefuseEnable` int(11) DEFAULT NULL,
  `OfficeOverLab` varchar(50) DEFAULT NULL,
  `OfficeOverEnable` int(11) DEFAULT NULL,
  `OfficeMarksEnable` int(11) DEFAULT NULL,
  `OfficePrintLab` varchar(50) DEFAULT NULL,
  `OfficePrintEnable` int(11) DEFAULT NULL,
  `OfficeSealLab` varchar(50) DEFAULT NULL,
  `OfficeSealEnable` int(11) DEFAULT NULL,
  `OfficeInsertFlowLab` varchar(50) DEFAULT NULL,
  `OfficeInsertFlowEnable` int(11) DEFAULT NULL,
  `OfficeNodeInfo` int(11) DEFAULT NULL,
  `OfficeReSavePDF` int(11) DEFAULT NULL,
  `OfficeDownLab` varchar(50) DEFAULT NULL,
  `OfficeDownEnable` int(11) DEFAULT NULL,
  `OfficeIsMarks` int(11) DEFAULT NULL,
  `OfficeTemplate` varchar(100) DEFAULT NULL,
  `OfficeIsParent` int(11) DEFAULT NULL,
  `OfficeTHEnable` int(11) DEFAULT NULL,
  `OfficeTHTemplate` varchar(200) DEFAULT NULL,
  `FrmType` varchar(20) DEFAULT '0',
  `IsEdit` int(11) NOT NULL DEFAULT '1',
  `IsPrint` int(11) NOT NULL DEFAULT '0',
  `IsEnableLoadData` int(11) NOT NULL DEFAULT '0',
  `Idx` int(11) NOT NULL DEFAULT '0',
  `FrmSln` int(11) NOT NULL DEFAULT '0',
  `WhoIsPK` int(11) NOT NULL DEFAULT '0',
  `Is1ToN` int(11) NOT NULL DEFAULT '0',
  `HuiZong` varchar(300) DEFAULT '',
  `FrmEnableRole` int(11) NOT NULL DEFAULT '0',
  `FrmEnableExp` varchar(900) DEFAULT '',
  `TempleteFile` varchar(500) DEFAULT '',
  `IsEnable` int(11) NOT NULL DEFAULT '1',
  `GuanJianZiDuan` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_GenerFH`
-- ----------------------------
DROP TABLE IF EXISTS `WF_GenerFH`;
CREATE TABLE `WF_GenerFH` (
  `FID` int(11) NOT NULL,
  `Title` text,
  `GroupKey` varchar(3000) DEFAULT NULL,
  `FK_Flow` varchar(500) DEFAULT NULL,
  `ToEmpsMsg` text,
  `FK_Node` int(11) DEFAULT NULL,
  `WFState` int(11) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_GenerWorkFlow`
-- ----------------------------
DROP TABLE IF EXISTS `WF_GenerWorkFlow`;
CREATE TABLE `WF_GenerWorkFlow` (
  `WorkID` int(11) NOT NULL,
  `StarterName` varchar(200) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `WFSta` int(11) DEFAULT NULL,
  `NodeName` varchar(100) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `BillNo` varchar(100) DEFAULT NULL,
  `FlowNote` text,
  `FK_FlowSort` varchar(100) DEFAULT NULL,
  `FK_Flow` varchar(100) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `WFState` int(11) DEFAULT NULL,
  `FK_NY` varchar(100) DEFAULT NULL,
  `MyNum` int(11) DEFAULT NULL,
  `FlowName` varchar(100) DEFAULT '',
  `Starter` varchar(200) DEFAULT '',
  `Sender` varchar(200) DEFAULT '',
  `DeptName` varchar(100) DEFAULT '',
  `PRI` int(11) NOT NULL DEFAULT '1',
  `SDTOfNode` varchar(50) DEFAULT NULL,
  `SDTOfFlow` varchar(50) DEFAULT NULL,
  `PFlowNo` varchar(3) DEFAULT '',
  `PWorkID` int(11) NOT NULL DEFAULT '0',
  `PNodeID` int(11) NOT NULL DEFAULT '0',
  `PFID` int(11) NOT NULL DEFAULT '0',
  `PEmp` varchar(32) DEFAULT '',
  `CFlowNo` varchar(3) DEFAULT '',
  `CWorkID` int(11) NOT NULL DEFAULT '0',
  `GuestNo` varchar(100) DEFAULT '',
  `GuestName` varchar(100) DEFAULT '',
  `TodoEmps` text,
  `TodoEmpsNum` int(11) NOT NULL DEFAULT '0',
  `TaskSta` int(11) NOT NULL DEFAULT '0',
  `AtPara` varchar(2000) DEFAULT '',
  `Emps` text,
  `GUID` varchar(36) DEFAULT '',
  `SysType` varchar(10) DEFAULT '',
  `WeekNum` int(11) NOT NULL DEFAULT '0',
  `TSpan` int(11) NOT NULL DEFAULT '0',
  `TodoSta` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_GenerWorkerlist`
-- ----------------------------
DROP TABLE IF EXISTS `WF_GenerWorkerlist`;
CREATE TABLE `WF_GenerWorkerlist` (
  `WorkID` int(11) NOT NULL,
  `FK_Emp` varchar(20) NOT NULL,
  `FK_Node` int(11) NOT NULL,
  `FID` int(11) DEFAULT NULL,
  `FK_EmpText` varchar(30) DEFAULT NULL,
  `FK_NodeText` varchar(100) DEFAULT NULL,
  `FK_Flow` varchar(3) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `SDT` varchar(50) DEFAULT NULL,
  `DTOfWarning` varchar(50) DEFAULT NULL,
  `WarningDays` float DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `CDT` varchar(50) DEFAULT NULL,
  `IsEnable` int(11) DEFAULT NULL,
  `IsRead` int(11) DEFAULT NULL,
  `IsPass` int(11) DEFAULT NULL,
  `WhoExeIt` int(11) DEFAULT NULL,
  `Sender` varchar(200) DEFAULT NULL,
  `PRI` int(11) DEFAULT NULL,
  `PressTimes` int(11) DEFAULT NULL,
  `DTOfHungUp` varchar(50) DEFAULT NULL,
  `DTOfUnHungUp` varchar(50) DEFAULT NULL,
  `HungUpTimes` int(11) DEFAULT NULL,
  `GuestNo` varchar(30) DEFAULT NULL,
  `GuestName` varchar(100) DEFAULT NULL,
  `AtPara` text,
  `WarningHour` float(50,2) DEFAULT '0.00',
  PRIMARY KEY (`WorkID`,`FK_Emp`,`FK_Node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_HungUp`
-- ----------------------------
DROP TABLE IF EXISTS `WF_HungUp`;
CREATE TABLE `WF_HungUp` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `HungUpWay` int(11) DEFAULT NULL,
  `Note` text,
  `Rec` varchar(50) DEFAULT NULL,
  `DTOfHungUp` varchar(50) DEFAULT NULL,
  `DTOfUnHungUp` varchar(50) DEFAULT NULL,
  `DTOfUnHungUpPlan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_LabNote`
-- ----------------------------
DROP TABLE IF EXISTS `WF_LabNote`;
CREATE TABLE `WF_LabNote` (
  `MyPK` varchar(100) NOT NULL,
  `Name` varchar(3000) DEFAULT NULL,
  `FK_Flow` varchar(100) DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Listen`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Listen`;
CREATE TABLE `WF_Listen` (
  `OID` int(11) NOT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `Nodes` varchar(400) DEFAULT NULL,
  `NodesDesc` varchar(400) DEFAULT NULL,
  `Title` varchar(400) DEFAULT NULL,
  `Doc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODECANCEL`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODECANCEL`;
CREATE TABLE `WF_NODECANCEL` (
  `FK_Node` int(11) NOT NULL,
  `CancelTo` int(11) NOT NULL,
  PRIMARY KEY (`FK_Node`,`CancelTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODEDEPT`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODEDEPT`;
CREATE TABLE `WF_NODEDEPT` (
  `FK_Node` int(11) NOT NULL,
  `FK_Dept` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODEEMP`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODEEMP`;
CREATE TABLE `WF_NODEEMP` (
  `FK_Node` int(11) NOT NULL,
  `FK_Emp` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODEFLOW`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODEFLOW`;
CREATE TABLE `WF_NODEFLOW` (
  `FK_Node` int(11) NOT NULL,
  `FK_Flow` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Flow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODERETURN`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODERETURN`;
CREATE TABLE `WF_NODERETURN` (
  `FK_Node` int(11) NOT NULL,
  `ReturnTo` int(11) NOT NULL,
  `Dots` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`FK_Node`,`ReturnTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NODESTATION`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NODESTATION`;
CREATE TABLE `WF_NODESTATION` (
  `FK_Node` int(11) NOT NULL,
  `FK_Station` varchar(100) NOT NULL,
  PRIMARY KEY (`FK_Node`,`FK_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Node`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Node`;
CREATE TABLE `WF_Node` (
  `NodeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `SFSta` int(11) DEFAULT NULL,
  `SFShowModel` int(11) DEFAULT NULL,
  `SFCaption` varchar(100) DEFAULT NULL,
  `SFDefInfo` varchar(50) DEFAULT NULL,
  `SFActiveFlows` varchar(100) DEFAULT NULL,
  `SF_X` float DEFAULT NULL,
  `SF_Y` float DEFAULT NULL,
  `SF_H` float DEFAULT NULL,
  `SF_W` float DEFAULT NULL,
  `SFFields` varchar(1000) DEFAULT NULL,
  `SFShowCtrl` int(11) DEFAULT NULL,
  `FWCSta` int(11) NOT NULL DEFAULT '0',
  `FWCShowModel` int(11) NOT NULL DEFAULT '1',
  `FWCType` int(11) NOT NULL DEFAULT '0',
  `FWCNodeName` varchar(100) DEFAULT '',
  `FWCAth` int(11) NOT NULL DEFAULT '0',
  `FWCTrackEnable` int(11) NOT NULL DEFAULT '1',
  `FWCListEnable` int(11) NOT NULL DEFAULT '1',
  `FWCIsShowAllStep` int(11) NOT NULL DEFAULT '0',
  `FWCOpLabel` varchar(50) DEFAULT '审核',
  `FWCDefInfo` varchar(50) DEFAULT '同意',
  `SigantureEnabel` int(11) NOT NULL DEFAULT '0',
  `FWCIsFullInfo` int(11) NOT NULL DEFAULT '1',
  `FWC_X` float(50,2) DEFAULT '5.00',
  `FWC_Y` float(50,2) DEFAULT '5.00',
  `FWC_H` float(50,2) DEFAULT '300.00',
  `FWC_W` float(50,2) DEFAULT '400.00',
  `FWCFields` varchar(1000) DEFAULT '',
  `Step` int(11) NOT NULL DEFAULT '0',
  `FK_Flow` varchar(10) DEFAULT '',
  `CheckNodes` varchar(800) DEFAULT '',
  `DeliveryWay` int(11) NOT NULL DEFAULT '0',
  `Tip` varchar(100) DEFAULT '',
  `ICON` varchar(50) DEFAULT '',
  `NodeWorkType` int(11) NOT NULL DEFAULT '0',
  `SubThreadType` int(11) NOT NULL DEFAULT '0',
  `IsGuestNode` int(11) NOT NULL DEFAULT '0',
  `FlowName` varchar(100) DEFAULT '',
  `FK_FlowSort` varchar(4) DEFAULT '',
  `FK_FlowSortT` varchar(100) DEFAULT '',
  `FrmAttr` varchar(300) DEFAULT '',
  `IsBUnit` int(11) NOT NULL DEFAULT '0',
  `TSpanDay` float(50,2) DEFAULT '0.00',
  `TSpanHour` float(50,2) DEFAULT '8.00',
  `TAlertRole` int(11) NOT NULL DEFAULT '0',
  `TAlertWay` int(11) NOT NULL DEFAULT '0',
  `WarningDay` float(50,2) DEFAULT '0.00',
  `WarningHour` float(50,2) DEFAULT '4.00',
  `WAlertRole` int(11) NOT NULL DEFAULT '0',
  `WAlertWay` int(11) NOT NULL DEFAULT '0',
  `TCent` float(50,2) DEFAULT '2.00',
  `CHWay` int(11) NOT NULL DEFAULT '0',
  `Doc` varchar(100) DEFAULT '',
  `IsTask` int(11) NOT NULL DEFAULT '1',
  `ReturnRole` int(11) NOT NULL DEFAULT '2',
  `IsExpSender` int(11) NOT NULL DEFAULT '1',
  `CancelRole` int(11) NOT NULL DEFAULT '0',
  `WhenNoWorker` int(11) NOT NULL DEFAULT '0',
  `DeliveryParas` varchar(500) DEFAULT '',
  `NodeFrmID` varchar(50) DEFAULT '',
  `CCRole` int(11) NOT NULL DEFAULT '0',
  `CCWriteTo` int(11) NOT NULL DEFAULT '0',
  `DelEnable` int(11) NOT NULL DEFAULT '0',
  `IsEval` int(11) NOT NULL DEFAULT '0',
  `SaveModel` int(11) NOT NULL DEFAULT '0',
  `IsCanRpt` int(11) NOT NULL DEFAULT '1',
  `IsCanOver` int(11) NOT NULL DEFAULT '0',
  `IsSecret` int(11) NOT NULL DEFAULT '0',
  `IsCanDelFlow` int(11) NOT NULL DEFAULT '0',
  `ThreadKillRole` int(11) NOT NULL DEFAULT '0',
  `TodolistModel` int(11) NOT NULL DEFAULT '0',
  `IsAllowRepeatEmps` int(11) NOT NULL DEFAULT '0',
  `IsBackTracking` int(11) NOT NULL DEFAULT '0',
  `IsRM` int(11) NOT NULL DEFAULT '1',
  `IsHandOver` int(11) NOT NULL DEFAULT '0',
  `PassRate` float(50,2) DEFAULT '100.00',
  `RunModel` int(11) NOT NULL DEFAULT '0',
  `BlockModel` int(11) NOT NULL DEFAULT '0',
  `BlockExp` varchar(700) DEFAULT '',
  `BlockAlert` varchar(700) DEFAULT '',
  `WhoExeIt` int(11) NOT NULL DEFAULT '0',
  `ReadReceipts` int(11) NOT NULL DEFAULT '0',
  `CondModel` int(11) NOT NULL DEFAULT '0',
  `AutoJumpRole0` int(11) NOT NULL DEFAULT '0',
  `AutoJumpRole1` int(11) NOT NULL DEFAULT '0',
  `AutoJumpRole2` int(11) NOT NULL DEFAULT '0',
  `BatchRole` int(11) NOT NULL DEFAULT '0',
  `BatchListCount` int(11) NOT NULL DEFAULT '12',
  `BatchParas` varchar(300) DEFAULT NULL,
  `PrintDocEnable` int(11) NOT NULL DEFAULT '0',
  `OutTimeDeal` int(11) NOT NULL DEFAULT '0',
  `DoOutTime` varchar(300) DEFAULT '',
  `FormType` int(11) NOT NULL DEFAULT '1',
  `FormUrl` varchar(2000) DEFAULT 'http://',
  `TurnToDeal` int(11) NOT NULL DEFAULT '0',
  `TurnToDealDoc` varchar(1000) DEFAULT '',
  `NodePosType` int(11) NOT NULL DEFAULT '0',
  `IsCCFlow` int(11) NOT NULL DEFAULT '0',
  `HisStas` text,
  `HisDeptStrs` text,
  `HisToNDs` varchar(400) DEFAULT '',
  `HisBillIDs` varchar(200) DEFAULT '',
  `HisSubFlows` varchar(50) DEFAULT '',
  `PTable` varchar(100) DEFAULT '',
  `ShowSheets` varchar(100) DEFAULT '',
  `GroupStaNDs` varchar(200) DEFAULT '',
  `X` int(11) NOT NULL DEFAULT '0',
  `Y` int(11) NOT NULL DEFAULT '0',
  `FocusField` varchar(50) DEFAULT NULL,
  `JumpToNodes` varchar(200) DEFAULT '',
  `AtPara` varchar(500) DEFAULT '',
  `SubFlowStartWay` int(11) NOT NULL DEFAULT '0',
  `SubFlowStartParas` varchar(100) DEFAULT '',
  `DocLeftWord` varchar(200) DEFAULT '',
  `DocRightWord` varchar(200) DEFAULT '',
  `AutoRunEnable` int(11) NOT NULL DEFAULT '0',
  `AutoRunParas` varchar(500) DEFAULT '',
  `SendLab` varchar(50) DEFAULT '发送',
  `SendJS` varchar(999) DEFAULT NULL,
  `JumpWayLab` varchar(50) DEFAULT '跳转',
  `JumpWay` int(11) NOT NULL DEFAULT '0',
  `SaveLab` varchar(50) DEFAULT '保存',
  `SaveEnable` int(11) NOT NULL DEFAULT '1',
  `ThreadLab` varchar(50) DEFAULT '子线程',
  `ThreadEnable` int(11) NOT NULL DEFAULT '0',
  `SubFlowLab` varchar(50) DEFAULT '子流程',
  `SubFlowCtrlRole` int(11) NOT NULL DEFAULT '0',
  `ReturnLab` varchar(50) DEFAULT '退回',
  `ReturnField` varchar(50) DEFAULT '',
  `CCLab` varchar(50) DEFAULT '抄送',
  `ShiftLab` varchar(50) DEFAULT '移交',
  `ShiftEnable` int(11) NOT NULL DEFAULT '1',
  `DelLab` varchar(50) DEFAULT '删除流程',
  `EndFlowLab` varchar(50) DEFAULT '结束流程',
  `EndFlowEnable` int(11) NOT NULL DEFAULT '0',
  `HungLab` varchar(50) DEFAULT '挂起',
  `HungEnable` int(11) NOT NULL DEFAULT '0',
  `PrintDocLab` varchar(50) DEFAULT '打印单据',
  `TrackLab` varchar(50) DEFAULT '轨迹',
  `TrackEnable` int(11) NOT NULL DEFAULT '1',
  `SelectAccepterLab` varchar(50) DEFAULT '接受人',
  `SelectAccepterEnable` int(11) NOT NULL DEFAULT '0',
  `SearchLab` varchar(50) DEFAULT '查询',
  `SearchEnable` int(11) NOT NULL DEFAULT '1',
  `WorkCheckLab` varchar(50) DEFAULT '审核',
  `WorkCheckEnable` int(11) NOT NULL DEFAULT '0',
  `BatchLab` varchar(50) DEFAULT '批量审核',
  `BatchEnable` int(11) NOT NULL DEFAULT '0',
  `AskforLab` varchar(50) DEFAULT '加签',
  `AskforEnable` int(11) NOT NULL DEFAULT '0',
  `TCLab` varchar(50) DEFAULT '流转自定义',
  `TCEnable` int(11) NOT NULL DEFAULT '0',
  `WebOffice` varchar(50) DEFAULT '公文',
  `WebOfficeEnable` int(11) NOT NULL DEFAULT '0',
  `PRILab` varchar(50) DEFAULT '重要性',
  `PRIEnable` int(11) NOT NULL DEFAULT '0',
  `CHLab` varchar(50) DEFAULT '节点时限',
  `CHEnable` int(11) NOT NULL DEFAULT '0',
  `FocusLab` varchar(50) DEFAULT '关注',
  `FocusEnable` int(11) NOT NULL DEFAULT '1',
  `OfficeOpenLab` varchar(50) DEFAULT '打开本地',
  `OfficeOpenEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeOpenTemplateLab` varchar(50) DEFAULT '打开模板',
  `OfficeOpenTemplateEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeSaveLab` varchar(50) DEFAULT '保存',
  `OfficeSaveEnable` int(11) NOT NULL DEFAULT '1',
  `OfficeAcceptLab` varchar(50) DEFAULT '接受修订',
  `OfficeAcceptEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeRefuseLab` varchar(50) DEFAULT '拒绝修订',
  `OfficeRefuseEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeOverLab` varchar(50) DEFAULT '套红',
  `OfficeOverEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeMarksEnable` int(11) NOT NULL DEFAULT '1',
  `OfficePrintLab` varchar(50) DEFAULT '打印',
  `OfficePrintEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeSealLab` varchar(50) DEFAULT '签章',
  `OfficeSealEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeInsertFlowLab` varchar(50) DEFAULT '插入流程',
  `OfficeInsertFlowEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeNodeInfo` int(11) NOT NULL DEFAULT '0',
  `OfficeReSavePDF` int(11) NOT NULL DEFAULT '0',
  `OfficeDownLab` varchar(50) DEFAULT '下载',
  `OfficeDownEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeIsMarks` int(11) NOT NULL DEFAULT '1',
  `OfficeTemplate` varchar(100) DEFAULT '',
  `OfficeIsParent` int(11) NOT NULL DEFAULT '1',
  `OfficeTHEnable` int(11) NOT NULL DEFAULT '0',
  `OfficeTHTemplate` varchar(200) DEFAULT '',
  `OfficeOpen` varchar(50) DEFAULT '打开本地',
  `OfficeOpenTemplate` varchar(50) DEFAULT '打开模板',
  `OfficeSave` varchar(50) DEFAULT '保存',
  `OfficeAccept` varchar(50) DEFAULT '接受修订',
  `OfficeRefuse` varchar(50) DEFAULT '拒绝修订',
  `OfficeOver` varchar(50) DEFAULT '套红按钮',
  `OfficeMarks` int(11) NOT NULL DEFAULT '1',
  `OfficeReadOnly` int(11) NOT NULL DEFAULT '0',
  `OfficePrint` varchar(50) DEFAULT '打印按钮',
  `OfficeSeal` varchar(50) DEFAULT '签章按钮',
  `OfficeSealEnabel` int(11) NOT NULL DEFAULT '0',
  `OfficeInsertFlow` varchar(50) DEFAULT '插入流程',
  `OfficeInsertFlowEnabel` int(11) NOT NULL DEFAULT '0',
  `OfficeIsDown` int(11) NOT NULL DEFAULT '0',
  `OfficeIsTrueTH` int(11) NOT NULL DEFAULT '0',
  `CCIsStations` int(11) NOT NULL DEFAULT '0',
  `CCIsDepts` int(11) NOT NULL DEFAULT '0',
  `CCIsEmps` int(11) NOT NULL DEFAULT '0',
  `CCIsSQLs` int(11) NOT NULL DEFAULT '0',
  `CCCtrlWay` int(11) NOT NULL DEFAULT '0',
  `CCSQL` varchar(500) DEFAULT '',
  `CCTitle` varchar(500) DEFAULT '',
  `CCDoc` text,
  `SFLab` varchar(200) DEFAULT '子流程',
  `FrmThreadLab` varchar(200) DEFAULT '子线程',
  `FrmThreadSta` int(11) NOT NULL DEFAULT '0',
  `FrmThread_X` float(50,2) DEFAULT '5.00',
  `FrmThread_Y` float(50,2) DEFAULT '5.00',
  `FrmThread_H` float(50,2) DEFAULT '300.00',
  `FrmThread_W` float(50,2) DEFAULT '400.00',
  `FrmTrackLab` varchar(200) DEFAULT '轨迹',
  `FrmTrackSta` int(11) NOT NULL DEFAULT '0',
  `FrmTrack_X` float(50,2) DEFAULT '5.00',
  `FrmTrack_Y` float(50,2) DEFAULT '5.00',
  `FrmTrack_H` float(50,2) DEFAULT '300.00',
  `FrmTrack_W` float(50,2) DEFAULT '400.00',
  `FrmTransferCustomLab` varchar(200) DEFAULT '流转自定义',
  `FrmTransferCustomSta` int(11) NOT NULL DEFAULT '0',
  `FrmTransferCustom_X` float(50,2) DEFAULT '5.00',
  `FrmTransferCustom_Y` float(50,2) DEFAULT '5.00',
  `FrmTransferCustom_H` float(50,2) DEFAULT '300.00',
  `FrmTransferCustom_W` float(50,2) DEFAULT '400.00',
  `DTFrom` varchar(50) DEFAULT NULL,
  `DTTo` varchar(50) DEFAULT NULL,
  `ReturnAlert` varchar(999) DEFAULT '',
  `MPhone_WorkModel` int(11) NOT NULL DEFAULT '0',
  `MPhone_SrcModel` int(11) NOT NULL DEFAULT '0',
  `MPad_WorkModel` int(11) NOT NULL DEFAULT '0',
  `MPad_SrcModel` int(11) NOT NULL DEFAULT '0',
  `DoOutTimeCond` varchar(100) DEFAULT '',
  `SelectorDBShowWay` int(11) NOT NULL DEFAULT '0',
  `SelectorModel` int(11) NOT NULL DEFAULT '0',
  `SelectorP1` text,
  `SelectorP2` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_NodeToolbar`
-- ----------------------------
DROP TABLE IF EXISTS `WF_NodeToolbar`;
CREATE TABLE `WF_NodeToolbar` (
  `OID` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `showwhere` int(11) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `MyFileName` varchar(100) DEFAULT NULL,
  `MyFilePath` varchar(100) DEFAULT NULL,
  `MyFileExt` varchar(10) DEFAULT NULL,
  `WebPath` varchar(200) DEFAULT NULL,
  `MyFileH` int(11) DEFAULT NULL,
  `MyFileW` int(11) DEFAULT NULL,
  `MyFileSize` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_PushMsg`
-- ----------------------------
DROP TABLE IF EXISTS `WF_PushMsg`;
CREATE TABLE `WF_PushMsg` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Event` varchar(15) DEFAULT NULL,
  `PushWay` int(11) DEFAULT NULL,
  `PushDoc` text,
  `Tag` varchar(500) DEFAULT NULL,
  `SMSPushWay` int(11) DEFAULT NULL,
  `SMSField` varchar(100) DEFAULT NULL,
  `SMSDoc` text,
  `MailPushWay` int(11) DEFAULT NULL,
  `MailAddress` varchar(100) DEFAULT NULL,
  `MailTitle` varchar(200) DEFAULT NULL,
  `MailDoc` text,
  `MsgMailEnable` int(11) NOT NULL DEFAULT '1',
  `SMSEnable` int(11) NOT NULL DEFAULT '0',
  `MobilePushEnable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_RememberMe`
-- ----------------------------
DROP TABLE IF EXISTS `WF_RememberMe`;
CREATE TABLE `WF_RememberMe` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Emp` varchar(30) DEFAULT NULL,
  `Objs` text,
  `ObjsExt` text,
  `Emps` text,
  `EmpsExt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_ReturnWork`
-- ----------------------------
DROP TABLE IF EXISTS `WF_ReturnWork`;
CREATE TABLE `WF_ReturnWork` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `ReturnNode` int(11) DEFAULT NULL,
  `ReturnNodeName` varchar(200) DEFAULT NULL,
  `Returner` varchar(20) DEFAULT NULL,
  `ReturnerName` varchar(200) DEFAULT NULL,
  `ReturnToNode` int(11) DEFAULT NULL,
  `ReturnToEmp` text,
  `Note` text,
  `RDT` varchar(50) DEFAULT NULL,
  `IsBackTracking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_SelectAccper`
-- ----------------------------
DROP TABLE IF EXISTS `WF_SelectAccper`;
CREATE TABLE `WF_SelectAccper` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FK_Emp` varchar(20) DEFAULT NULL,
  `EmpName` varchar(20) DEFAULT NULL,
  `AccType` int(11) DEFAULT NULL,
  `Rec` varchar(20) DEFAULT NULL,
  `Info` varchar(200) DEFAULT NULL,
  `IsRemember` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `Tag` varchar(200) DEFAULT NULL,
  `TSpanDay` int(11) DEFAULT NULL,
  `TSpanHour` float DEFAULT NULL,
  `ADT` varchar(50) DEFAULT NULL,
  `SDT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_SelectInfo`
-- ----------------------------
DROP TABLE IF EXISTS `WF_SelectInfo`;
CREATE TABLE `WF_SelectInfo` (
  `MyPK` varchar(100) NOT NULL,
  `AcceptNodeID` int(11) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `InfoLeft` varchar(200) DEFAULT NULL,
  `InfoCenter` varchar(200) DEFAULT NULL,
  `InfoRight` varchar(200) DEFAULT NULL,
  `AccType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_ShiftWork`
-- ----------------------------
DROP TABLE IF EXISTS `WF_ShiftWork`;
CREATE TABLE `WF_ShiftWork` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Emp` varchar(40) DEFAULT NULL,
  `FK_EmpName` varchar(40) DEFAULT NULL,
  `ToEmp` varchar(40) DEFAULT NULL,
  `ToEmpName` varchar(40) DEFAULT NULL,
  `RDT` varchar(50) DEFAULT NULL,
  `Note` varchar(2000) DEFAULT NULL,
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Task`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Task`;
CREATE TABLE `WF_Task` (
  `MyPK` varchar(100) NOT NULL,
  `FK_Flow` varchar(200) DEFAULT NULL,
  `Starter` varchar(200) DEFAULT NULL,
  `Paras` text,
  `TaskSta` int(11) DEFAULT NULL,
  `Msg` text,
  `StartDT` varchar(20) DEFAULT NULL,
  `RDT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_Track`
-- ----------------------------
DROP TABLE IF EXISTS `WF_Track`;
CREATE TABLE `WF_Track` (
  `MyPK` int(11) NOT NULL,
  `ActionType` int(11) DEFAULT NULL,
  `ActionTypeText` varchar(30) DEFAULT NULL,
  `FID` int(11) DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `NDFrom` int(11) DEFAULT NULL,
  `NDFromT` varchar(300) DEFAULT NULL,
  `NDTo` int(11) DEFAULT NULL,
  `NDToT` varchar(999) DEFAULT NULL,
  `EmpFrom` varchar(20) DEFAULT NULL,
  `EmpFromT` varchar(30) DEFAULT NULL,
  `EmpTo` varchar(2000) DEFAULT NULL,
  `EmpToT` varchar(2000) DEFAULT NULL,
  `RDT` varchar(20) DEFAULT NULL,
  `WorkTimeSpan` float DEFAULT NULL,
  `Msg` text,
  `NodeData` text,
  `Tag` varchar(300) DEFAULT NULL,
  `Exer` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_TransferCustom`
-- ----------------------------
DROP TABLE IF EXISTS `WF_TransferCustom`;
CREATE TABLE `WF_TransferCustom` (
  `MyPK` varchar(100) NOT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `Worker` varchar(200) DEFAULT NULL,
  `WorkerName` varchar(200) DEFAULT NULL,
  `SubFlowNo` varchar(3) DEFAULT NULL,
  `PlanDT` varchar(50) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  `TodolistModel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_TurnTo`
-- ----------------------------
DROP TABLE IF EXISTS `WF_TurnTo`;
CREATE TABLE `WF_TurnTo` (
  `MyPK` varchar(100) NOT NULL,
  `TurnToType` int(11) DEFAULT NULL,
  `FK_Flow` varchar(60) DEFAULT NULL,
  `FK_Node` int(11) DEFAULT NULL,
  `FK_Attr` varchar(80) DEFAULT NULL,
  `AttrKey` varchar(80) DEFAULT NULL,
  `AttrT` varchar(80) DEFAULT NULL,
  `FK_Operator` varchar(60) DEFAULT NULL,
  `OperatorValue` varchar(60) DEFAULT NULL,
  `OperatorValueT` varchar(60) DEFAULT NULL,
  `TurnToURL` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WF_WorkFlowDeleteLog`
-- ----------------------------
DROP TABLE IF EXISTS `WF_WorkFlowDeleteLog`;
CREATE TABLE `WF_WorkFlowDeleteLog` (
  `OID` int(11) NOT NULL,
  `FID` int(11) DEFAULT NULL,
  `FK_Dept` varchar(100) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `FlowStarter` varchar(100) DEFAULT NULL,
  `FlowStartRDT` varchar(50) DEFAULT NULL,
  `FK_NY` varchar(100) DEFAULT NULL,
  `FK_Flow` varchar(100) DEFAULT NULL,
  `FlowEnderRDT` varchar(50) DEFAULT NULL,
  `FlowEndNode` int(11) DEFAULT NULL,
  `FlowDaySpan` int(11) DEFAULT NULL,
  `MyNum` int(11) DEFAULT NULL,
  `FlowEmps` varchar(100) DEFAULT NULL,
  `Oper` varchar(20) DEFAULT NULL,
  `OperDept` varchar(20) DEFAULT NULL,
  `OperDeptName` varchar(200) DEFAULT NULL,
  `DeleteNote` text,
  `DeleteDT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  View structure for `port_empdept`
-- ----------------------------
DROP VIEW IF EXISTS `port_empdept`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `port_empdept` AS select `port_emp`.`No` AS `FK_Emp`,`port_emp`.`FK_Dept` AS `FK_Dept` from `port_emp`;

-- ----------------------------
--  View structure for `v_flowstarter`
-- ----------------------------
DROP VIEW IF EXISTS `v_flowstarter`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_flowstarter` AS select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`FK_Emp` AS `FK_Emp` from ((`wf_node` `a` join `wf_nodestation` `b`) join `port_empstation` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Station` = `c`.`FK_Station`) and (`a`.`DeliveryWay` = 0)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`No` AS `No` from ((`wf_node` `a` join `wf_nodedept` `b`) join `port_emp` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Dept` = `c`.`FK_Dept`) and (`a`.`DeliveryWay` = 1)) union select `A`.`FK_Flow` AS `FK_Flow`,`A`.`FlowName` AS `FlowName`,`B`.`FK_Emp` AS `FK_Emp` from (`wf_node` `A` join `wf_nodeemp` `B`) where ((`A`.`NodePosType` = 0) and ((`A`.`WhoExeIt` = 0) or (`A`.`WhoExeIt` = 2)) and (`A`.`NodeID` = `B`.`FK_Node`) and (`A`.`DeliveryWay` = 3));

-- ----------------------------
--  View structure for `v_flowstarterbpm`
-- ----------------------------
DROP VIEW IF EXISTS `v_flowstarterbpm`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_flowstarterbpm` AS select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`FK_Emp` AS `FK_Emp` from ((`wf_node` `a` join `wf_nodestation` `b`) join `port_deptempstation` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Station` = `c`.`FK_Station`) and (`a`.`DeliveryWay` = 0)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`FK_Emp` AS `FK_Emp` from ((`wf_node` `a` join `wf_nodedept` `b`) join `port_deptemp` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Dept` = `c`.`FK_Dept`) and (`a`.`DeliveryWay` = 1)) union select `A`.`FK_Flow` AS `FK_Flow`,`A`.`FlowName` AS `FlowName`,`B`.`FK_Emp` AS `FK_Emp` from (`wf_node` `A` join `wf_nodeemp` `B`) where ((`A`.`NodePosType` = 0) and ((`A`.`WhoExeIt` = 0) or (`A`.`WhoExeIt` = 2)) and (`A`.`NodeID` = `B`.`FK_Node`) and (`A`.`DeliveryWay` = 3));

-- ----------------------------
--  View structure for `v_totalch`
-- ----------------------------
DROP VIEW IF EXISTS `v_totalch`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_totalch` AS select `wf_ch`.`FK_Emp` AS `FK_Emp`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`)) AS `AllNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `ASNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` >= 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `CSNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 0) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `JiShi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `ANQI`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `YuQi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 3) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) AS `ChaoQi`,round((((select cast(count(`A`.`MyPK`) as decimal(10,0)) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) / (select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`))) * 100),2) AS `WCRate` from `wf_ch` group by `wf_ch`.`FK_Emp`;

-- ----------------------------
--  View structure for `v_totalchweek`
-- ----------------------------
DROP VIEW IF EXISTS `v_totalchweek`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_totalchweek` AS select `wf_ch`.`FK_Emp` AS `FK_Emp`,`wf_ch`.`WeekNum` AS `WeekNum`,`wf_ch`.`FK_NY` AS `FK_NY`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `AllNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `ASNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` >= 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `CSNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 0) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `JiShi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `AnQi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `YuQi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 3) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) AS `ChaoQi`,round((((select cast(count(`A`.`MyPK`) as decimal(10,0)) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`))) / (select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`WeekNum` = `wf_ch`.`WeekNum`)))) * 100),2) AS `WCRate` from `wf_ch` group by `wf_ch`.`FK_Emp`,`wf_ch`.`WeekNum`,`wf_ch`.`FK_NY`;

-- ----------------------------
--  View structure for `v_totalchyf`
-- ----------------------------
DROP VIEW IF EXISTS `v_totalchyf`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_totalchyf` AS select `wf_ch`.`FK_Emp` AS `FK_Emp`,`wf_ch`.`FK_NY` AS `FK_NY`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `AllNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `ASNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` >= 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `CSNum`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 0) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `JiShi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `AnQi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 2) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `YuQi`,(select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` = 3) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) AS `ChaoQi`,round((((select cast(count(`A`.`MyPK`) as decimal(10,0)) AS `Num` from `wf_ch` `A` where ((`A`.`CHSta` <= 1) and (`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`))) / (select count(`A`.`MyPK`) AS `Num` from `wf_ch` `A` where ((`A`.`FK_Emp` = `wf_ch`.`FK_Emp`) and (`A`.`FK_NY` = `wf_ch`.`FK_NY`)))) * 100),2) AS `WCRate` from `wf_ch` group by `wf_ch`.`FK_Emp`,`wf_ch`.`FK_NY`;

-- ----------------------------
--  View structure for `wf_empworks`
-- ----------------------------
DROP VIEW IF EXISTS `wf_empworks`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_empworks` AS select `A`.`PRI` AS `PRI`,`A`.`WorkID` AS `WorkID`,`B`.`IsRead` AS `IsRead`,`A`.`Starter` AS `Starter`,`A`.`StarterName` AS `StarterName`,`A`.`WFState` AS `WFState`,`A`.`FK_Dept` AS `FK_Dept`,`A`.`DeptName` AS `DeptName`,`A`.`FK_Flow` AS `FK_Flow`,`A`.`FlowName` AS `FlowName`,`A`.`PWorkID` AS `PWorkID`,`A`.`PFlowNo` AS `PFlowNo`,`B`.`FK_Node` AS `FK_Node`,`B`.`FK_NodeText` AS `NodeName`,`B`.`FK_Dept` AS `WorkerDept`,`A`.`Title` AS `Title`,`A`.`RDT` AS `RDT`,`B`.`RDT` AS `ADT`,`B`.`SDT` AS `SDT`,`B`.`FK_Emp` AS `FK_Emp`,`B`.`FID` AS `FID`,`A`.`FK_FlowSort` AS `FK_FlowSort`,`A`.`SysType` AS `SysType`,`A`.`SDTOfNode` AS `SDTOfNode`,`B`.`PressTimes` AS `PressTimes`,`A`.`GuestNo` AS `GuestNo`,`A`.`GuestName` AS `GuestName`,`A`.`BillNo` AS `BillNo`,`A`.`FlowNote` AS `FlowNote`,`A`.`TodoEmps` AS `TodoEmps`,`A`.`TodoEmpsNum` AS `TodoEmpsNum`,`A`.`TodoSta` AS `TodoSta`,`A`.`TaskSta` AS `TaskSta`,0 AS `ListType`,`A`.`Sender` AS `Sender`,(`B`.`AtPara` or `A`.`AtPara`) AS `AtPara`,1 AS `MyNum` from (`wf_generworkflow` `A` join `wf_generworkerlist` `B`) where ((`B`.`IsEnable` = 1) and (`B`.`IsPass` = 0) and (`A`.`WorkID` = `B`.`WorkID`) and (`A`.`FK_Node` = `B`.`FK_Node`)) union select `A`.`PRI` AS `PRI`,`A`.`WorkID` AS `WorkID`,`B`.`Sta` AS `IsRead`,`A`.`Starter` AS `Starter`,`A`.`StarterName` AS `StarterName`,2 AS `WFState`,`A`.`FK_Dept` AS `FK_Dept`,`A`.`DeptName` AS `DeptName`,`A`.`FK_Flow` AS `FK_Flow`,`A`.`FlowName` AS `FlowName`,`A`.`PWorkID` AS `PWorkID`,`A`.`PFlowNo` AS `PFlowNo`,`B`.`FK_Node` AS `FK_Node`,`B`.`NodeName` AS `NodeName`,`B`.`CCToDept` AS `WorkerDept`,`A`.`Title` AS `Title`,`A`.`RDT` AS `RDT`,`B`.`RDT` AS `ADT`,`B`.`RDT` AS `SDT`,`B`.`CCTo` AS `FK_Emp`,`B`.`FID` AS `FID`,`A`.`FK_FlowSort` AS `FK_FlowSort`,`A`.`SysType` AS `SysType`,`A`.`SDTOfNode` AS `SDTOfNode`,0 AS `PressTimes`,`A`.`GuestNo` AS `GuestNo`,`A`.`GuestName` AS `GuestName`,`A`.`BillNo` AS `BillNo`,`A`.`FlowNote` AS `FlowNote`,`A`.`TodoEmps` AS `TodoEmps`,`A`.`TodoEmpsNum` AS `TodoEmpsNum`,0 AS `TodoSta`,0 AS `TaskSta`,1 AS `ListType`,`B`.`Rec` AS `Sender`,('@IsCC=1' or `A`.`AtPara`) AS `AtPara`,1 AS `MyNum` from (`wf_generworkflow` `A` join `wf_cclist` `B`) where ((`A`.`WorkID` = `B`.`WorkID`) and (`B`.`Sta` <= 1) and (`B`.`InEmpWorks` = 1));

SET FOREIGN_KEY_CHECKS = 1;
