/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.utils.excel.fieldtype;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Station;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

import java.util.List;

/**
 * 字段类型转换
 * @author ThinkGem
 * @version 2013-5-29
 */
public class StationListType {

	private static SystemService systemService = SpringContextHolder.getBean(SystemService.class);
	
	/**
	 * 获取对象值（导入）
	 */
	public static Object getValue(String val) {
		List<Station> roleList = Lists.newArrayList();
		List<Station> allStationList = systemService.findAllStation();
		for (String s : StringUtils.split(val, ",")){
			for (Station e : allStationList){
				if (StringUtils.trimToEmpty(s).equals(e.getName())){
					roleList.add(e);
				}
			}
		}
		return roleList.size()>0?roleList:null;
	}

	/**
	 * 设置对象值（导出）
	 */
	public static String setValue(Object val) {
		if (val != null){
			@SuppressWarnings("unchecked")
			List<Station> stationList = (List<Station>)val;
			return Collections3.extractToString(stationList, "name", ", ");
		}
		return "";
	}
	
}
