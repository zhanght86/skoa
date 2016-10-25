/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfoProgress;

/**
 * 项目管理DAO接口
 * @author evan
 * @version 2016-10-25
 */
@MyBatisDao
public interface ProjectInfoProgressDao extends CrudDao<ProjectInfoProgress> {
	
}