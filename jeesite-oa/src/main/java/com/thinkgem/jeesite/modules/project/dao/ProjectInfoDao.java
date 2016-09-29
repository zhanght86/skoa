/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;

/**
 * 项目表管理DAO接口
 * @author evan
 * @version 2016-09-23
 */
@MyBatisDao
public interface ProjectInfoDao extends CrudDao<ProjectInfo> {
	
}