/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.restful.modules.client.utils;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.restful.modules.client.entity.HmacClient;
import com.thinkgem.jeesite.restful.modules.client.service.HmacClientService;

/**
 * 内容管理工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class HmacClientUtils {
	
	private static HmacClientService hmacClientService = SpringContextHolder.getBean(HmacClientService.class);
	private static final String HMACCLIENT_CACHE = "hmacClientCache";

	/**
	 * 根据appId获取HmacClient对象
	 * @param appId
	 * @return
	 */
	public static HmacClient getByAppId(String appId){
		HmacClient hmacClient = (HmacClient)CacheUtils.get(HMACCLIENT_CACHE, appId);
		if (hmacClient == null){
			hmacClient=hmacClientService.getByAppId(appId);
			CacheUtils.put(HMACCLIENT_CACHE, appId, hmacClient);
		}
		return hmacClient;
	}
	

	// ============== Cms Cache ==============
	
	public static Object getCache(String key) {
		return CacheUtils.get(HMACCLIENT_CACHE, key);
	}

	public static void putCache(String key, Object value) {
		CacheUtils.put(HMACCLIENT_CACHE, key, value);
	}

	public static void removeCache(String key) {
		CacheUtils.remove(HMACCLIENT_CACHE, key);
	}

}