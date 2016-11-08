/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.restful.modules.client.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.restful.modules.client.dao.HmacClientDao;
import com.thinkgem.jeesite.restful.modules.client.entity.HmacClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * restfulService
 * @author evan
 * @version 2016-11-08
 */
@Service
@Transactional(readOnly = true)
public class HmacClientService extends CrudService<HmacClientDao, HmacClient> {
	@Autowired
	private HmacClientDao hmacClientDao;

	public HmacClient get(String id) {
		return super.get(id);
	}
	
	public List<HmacClient> findList(HmacClient hmacClient) {
		return super.findList(hmacClient);
	}
	
	public Page<HmacClient> findPage(Page<HmacClient> page, HmacClient hmacClient) {
		return super.findPage(page, hmacClient);
	}
	
	@Transactional(readOnly = false)
	public void save(HmacClient hmacClient) {
		hmacClient.setClientId(UUID.randomUUID().toString());
		hmacClient.setClientSecret(UUID.randomUUID().toString());

		super.save(hmacClient);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmacClient hmacClient) {
		super.delete(hmacClient);
	}

	public HmacClient getByAppId(String appId) {
		return hmacClientDao.findByAppId(appId);
	}
	
}