/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectNote;

/**
 * 项目动态表管理DAO接口
 * @author lhy
 * @version 2016-11-07
 */
@MyBatisDao
public interface ProjectNoteDao extends CrudDao<ProjectNote> {
	
}