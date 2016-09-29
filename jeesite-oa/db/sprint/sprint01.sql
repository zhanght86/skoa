SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
DROP TABLE IF EXISTS project_info;


/* 项目表 */
CREATE TABLE project_info
(
	id varchar(64) NOT NULL COMMENT '编号',
	office_id varchar(64) COMMENT '归属部门',
	area_id varchar(64) COMMENT '归属区域',
	project_name varchar(200) COMMENT '项目名称',
	project_grade char(2) COMMENT '项目级别',
	PRIMARY_PERSON varchar(64) COMMENT '项目负责人',
	DEPUTY_PERSON varchar(64) COMMENT '项目副负责人',
  industry_domain char(2) COMMENT '行业领域',
  main_business VARCHAR(100) COMMENT '主营业务',
  filepath varchar(200) COMMENT '附件路径',
  filename varchar(200) COMMENT '附件名称',
  annual_income VARCHAR(100) COMMENT '年收入',
  annual_net_profit VARCHAR(100) COMMENT '年净利润',
  project_progress char(2) COMMENT '项目进度',
  progress_update_date datetime COMMENT '进度更新时间',
  progress_update_by varchar(64) COMMENT '进度更新者',
  progress_update_remarks varchar(255) COMMENT '进度更新备注',

	start_date datetime COMMENT '项目的开始时间',
	recommended_man VARCHAR(50) COMMENT '项目推荐人',
	recommended_date datetime COMMENT '项目的推荐时间',
	project_type char(2) COMMENT '项目类型',
  intended_money DECIMAL(20,2) DEFAULT NULL COMMENT '拟投金额',

  project_status char(1) DEFAULT '0' NOT NULL COMMENT '项目状态:0,初始录入状态;1暂停;2完成',

	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '项目表';

/* Create Indexes */
CREATE INDEX project_info_del_flag ON project_info (del_flag ASC);


/* 创建自动生成方案 */
INSERT INTO `gen_table` VALUES ('14d81388bfb94a25a6badd115fe4fb97', 'project_info', '项目表', 'ProjectInfo', '', '', '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', '', '0');

INSERT INTO `gen_scheme` VALUES
('cec9776a357c4eabae8193f012d33d59', '项目表', 'curd', 'com.thinkgem.jeesite.modules', 'project', '', '项目表管理', '项目', 'evan', '14d81388bfb94a25a6badd115fe4fb97', '1', '2016-09-22 17:06:43', '1', '2016-09-23 10:41:32', '', '0');

INSERT INTO jeesite.gen_table_column (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES ('040d1328ffb64223a884e9db68254f7f', '14d81388bfb94a25a6badd115fe4fb97', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, 280, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('076956d9e3df47748141b138bbf5e6cb', '14d81388bfb94a25a6badd115fe4fb97', 'start_date', '项目的开始时间', 'datetime', 'java.util.Date', 'startDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, 180, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('1735c8876d194f238c638c9d9d8f9d3f', '14d81388bfb94a25a6badd115fe4fb97', 'area_id', '归属区域', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '1', '=', 'areaselect', '', null, 30, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('1a19378f0c304a30bc497a3cfe77255b', '14d81388bfb94a25a6badd115fe4fb97', 'progress_update_date', '进度更新时间', 'datetime', 'java.util.Date', 'progressUpdateDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, 150, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('48042835b2ef4ad19024d6af90ccfaf4', '14d81388bfb94a25a6badd115fe4fb97', 'annual_net_profit', '年净利润', 'varchar(100)', 'String', 'annualNetProfit', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, 130, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('4947ee03d6b246848b30f777bf30e5c5', '14d81388bfb94a25a6badd115fe4fb97', 'primary_person', '项目负责人', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'primaryPerson.id|name', '0', '1', '1', '1', '1', '0', '=', 'userselect', '', null, 60, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('4cdf76ffc7aa4d28ae4a0ed839ad7324', '14d81388bfb94a25a6badd115fe4fb97', 'project_name', '项目名称', 'varchar(200)', 'String', 'projectName', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, 40, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('5052d2816388427c946f2b050c1a33c5', '14d81388bfb94a25a6badd115fe4fb97', 'filename', '附件名称', 'varchar(200)', 'String', 'filename', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 110, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('54bb542e89814ad48173103672c94dbf', '14d81388bfb94a25a6badd115fe4fb97', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, 240, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('64a510d2a8c74348b7e8e8d664728689', '14d81388bfb94a25a6badd115fe4fb97', 'annual_income', '年收入', 'varchar(100)', 'String', 'annualIncome', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, 120, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('69254197d68549f0af727490e4d7202c', '14d81388bfb94a25a6badd115fe4fb97', 'project_status', '项目状态', 'char(1)', 'String', 'projectStatus', '0', '0', '1', '1', '0', '0', '=', 'select', 'projectStatus', null, 230, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('80cc680c974f44259770da4a03d04cb3', '14d81388bfb94a25a6badd115fe4fb97', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 290, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('8355f8c31f5f409b834108005362aed9', '14d81388bfb94a25a6badd115fe4fb97', 'main_business', '主营业务', 'varchar(100)', 'String', 'mainBusiness', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 90, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('89b74a58e0fc4c108186ed74c4546e26', '14d81388bfb94a25a6badd115fe4fb97', 'intended_money', '拟投金额', 'decimal(20,2)', 'java.math.BigDecimal', 'intendedMoney', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 220, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('9512a5bb72404175b11ac9c862a1e753', '14d81388bfb94a25a6badd115fe4fb97', 'progress_update_remarks', '进度更新备注', 'varchar(255)', 'String', 'progressUpdateRemarks', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 170, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('97e5cfc7e45c4894ab434e236a7cb72f', '14d81388bfb94a25a6badd115fe4fb97', 'filepath', '附件路径', 'varchar(200)', 'String', 'filepath', '0', '1', '1', '1', '0', '0', '=', 'fileselect', '', null, 100, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('9b10dc3e3d4e4bb3a96861f4f670c18b', '14d81388bfb94a25a6badd115fe4fb97', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, 270, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('a089cd44f4ef4ab3978a5ff18088d728', '14d81388bfb94a25a6badd115fe4fb97', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, 250, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('a61761e3eba64f329490bc5f3d0f41c9', '14d81388bfb94a25a6badd115fe4fb97', 'deputy_person', '项目副负责人', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'deputyPerson.id|name', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', null, 70, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('ac159062f1bd40969193c5ce8437ced7', '14d81388bfb94a25a6badd115fe4fb97', 'project_progress', '项目进度', 'char(2)', 'String', 'projectProgress', '0', '1', '1', '1', '1', '1', '=', 'select', 'projectProgress', null, 140, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('b276160a3d6c4c8c8688becba2d4c3e5', '14d81388bfb94a25a6badd115fe4fb97', 'project_grade', '项目级别', 'char(2)', 'String', 'projectGrade', '0', '1', '1', '1', '0', '1', '=', 'select', 'projectGrade', null, 50, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('bf38534e14ec4be0bcfae8601d33d84c', '14d81388bfb94a25a6badd115fe4fb97', 'industry_domain', '行业领域', 'char(2)', 'String', 'industryDomain', '0', '1', '1', '1', '1', '1', '=', 'select', 'industryDomain', null, 80, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('dc4e932ca9254142bb8039d3279356df', '14d81388bfb94a25a6badd115fe4fb97', 'project_type', '项目类型', 'char(2)', 'String', 'projectType', '0', '1', '1', '1', '1', '1', '=', 'select', 'projectType', null, 210, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('f0c8c5f6debd48fbaa25437e5f24f9de', '14d81388bfb94a25a6badd115fe4fb97', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, 10, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('f1b6a836b2f84c998e644b0be1de6478', '14d81388bfb94a25a6badd115fe4fb97', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, 260, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('f2d4c09457234f8883bc0e46379447d1', '14d81388bfb94a25a6badd115fe4fb97', 'recommended_man', '项目推荐人', 'varchar(50)', 'String', 'recommendedMan', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 190, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('f737bba362564bc2af02239aefd23a7d', '14d81388bfb94a25a6badd115fe4fb97', 'office_id', '归属部门', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '1', '=', 'officeselect', '', null, 20, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('f8bf6d2f3e6f48459d3b86a7a0f5c3b1', '14d81388bfb94a25a6badd115fe4fb97', 'progress_update_by', '进度更新者', 'varchar(64)', 'String', 'progressUpdateBy', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, 160, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0'),
('fad4cdc2f3164744858cda887831f65b', '14d81388bfb94a25a6badd115fe4fb97', 'recommended_date', '项目的推荐时间', 'datetime', 'java.util.Date', 'recommendedDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, 200, '1', '2016-09-22 17:04:24', '1', '2016-09-23 09:56:00', null, '0');

/* 项目管理 菜单添加 */
INSERT INTO jeesite.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES ('5c503ff8bdef4172a68233b2dfd8b048', '1', '0,1,', '燕园办公', 300, '', '', '', '1', '', '1', '2016-09-22 17:10:12', '1', '2016-09-22 17:13:12', '', '0'),
('bf267b11cd124363b33b5ab5128be3b2', 'e22d3ad2e03b415fa1ceb212cd76ed5a', '0,1,5c503ff8bdef4172a68233b2dfd8b048,e22d3ad2e03b415fa1ceb212cd76ed5a,', '项目列表', 30, '/project/projectInfo', '', '', '1', 'project:projectInfo:view,project:projectInfo:edit', '1', '2016-09-22 17:16:49', '1', '2016-09-22 17:18:56', '', '0'),
('e22d3ad2e03b415fa1ceb212cd76ed5a', '5c503ff8bdef4172a68233b2dfd8b048', '0,1,5c503ff8bdef4172a68233b2dfd8b048,', '项目管理', 30, '', '', '', '1', '', '1', '2016-09-22 17:13:44', '1', '2016-09-22 17:16:07', '', '0');

/* 项目有关的字典数据 */
INSERT INTO jeesite.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES ('1277ee67ceae466d89ae050175ffdba6', '3', '项目完成', 'projectStatus', '项目负责人设置项目完成状态', 40, '0', '1', '2016-09-23 09:55:47', '1', '2016-09-23 09:55:47', '项目负责人设置项目完成状态', '0'),
('1d8569f1e4964186b4c0441c04ba4d00', '0', '推介人编辑', 'projectStatus', '推介人编辑', 10, '0', '1', '2016-09-23 09:52:18', '1', '2016-09-23 09:52:18', '推介人编辑状态，项目的基础资料录入', '0'),
('2c9591ec55584b91a904d07635eee438', '2', '项目暂停', 'projectStatus', '项目负责人设置项目暂停状态', 30, '0', '1', '2016-09-23 09:55:26', '1', '2016-09-23 09:55:26', '项目负责人设置项目暂停状态', '0'),
('3bda1ee6467d41f788068efbc39a89b6', '1', 'A轮', 'projectType', 'A轮', 10, '0', '1', '2016-09-23 09:45:47', '1', '2016-09-23 09:45:47', '', '0'),
('4335f6bc4d7a4823b5b26f4d98139f0d', '2', '项目暂停', 'projectStatus', '项目负责人设置项目暂停状态', 30, '0', '1', '2016-09-23 09:54:10', '1', '2016-09-23 09:54:10', '项目负责人设置项目暂停状态', '1'),
('4d7e982b28ac47249943b310a0e2476a', '0', '先进制造', 'industryDomain', '行业领域', 10, '0', '1', '2016-09-22 17:23:36', '1', '2016-09-22 17:23:36', '', '0'),
('c5c0266161c74f3bb7dd4f29c2af31da', 'A1', 'A1', 'projectGrade', '项目级别', 10, '0', '1', '2016-09-22 17:22:23', '1', '2016-09-22 17:22:23', '', '0'),
('d324e9a9e8824390a9a63c46ecf41f8c', '3', '预研10%', 'projectProgress', '项目进度', 10, '0', '1', '2016-09-22 17:24:22', '1', '2016-09-22 17:24:22', '', '0'),
('fdf311be46774255beb71b0da142df1a', '1', '负责人管理', 'projectStatus', '项目负责人管理状态', 20, '0', '1', '2016-09-23 09:53:25', '1', '2016-09-23 09:53:25', '项目负责人对项目进行管理维护', '0');
