/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.restful.modules.client.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.restful.modules.client.entity.HmacClient;
import org.apache.ibatis.annotations.Param;

/**
 * restfulDAO接口
 * @author evan
 * @version 2016-11-08
 */
@MyBatisDao
public interface HmacClientDao extends CrudDao<HmacClient> {

	/**
	 * 根据appId来获取HmacClient
	 * @param appId
	 * @return
	 */
	HmacClient findByAppId(@Param("appId") String appId);
}