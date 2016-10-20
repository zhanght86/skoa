/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Station;

/**
 * 岗位管理DAO接口
 * @author lhy
 * @version 2016-10-19
 */
@MyBatisDao
public interface StationDao extends TreeDao<Station> {
	
}