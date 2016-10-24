/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Station;
import com.thinkgem.jeesite.modules.sys.service.StationService;

/**
 * 岗位管理Controller
 * @author lhy
 * @version 2016-10-19
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/station")
public class StationController extends BaseController {

	@Autowired
	private StationService stationService;
	
	@ModelAttribute
	public Station get(@RequestParam(required=false) String id) {
		Station entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = stationService.get(id);
		}
		if (entity == null){
			entity = new Station();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:station:view")
	@RequestMapping(value = {"list", ""})
	public String list(Station station, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Station> list = stationService.findList(station); 
		model.addAttribute("list", list);
		return "modules/sys/stationList";
	}

	@RequiresPermissions("sys:station:view")
	@RequestMapping(value = "form")
	public String form(Station station, Model model) {
		if (station.getParent()!=null && StringUtils.isNotBlank(station.getParent().getId())){
			station.setParent(stationService.get(station.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(station.getId())){
				Station stationChild = new Station();
				stationChild.setParent(new Station(station.getParent().getId()));
				List<Station> list = stationService.findList(station); 
				if (list.size() > 0){
					station.setSort(list.get(list.size()-1).getSort());
					if (station.getSort() != null){
						station.setSort(station.getSort() + 30);
					}
				}
			}
		}
		if (station.getSort() == null){
			station.setSort(30);
		}
		model.addAttribute("station", station);
		return "modules/sys/stationForm";
	}

	@RequiresPermissions("sys:station:edit")
	@RequestMapping(value = "save")
	public String save(Station station, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, station)){
			return form(station, model);
		}
		stationService.save(station);
		addMessage(redirectAttributes, "保存岗位成功");
		return "redirect:"+Global.getAdminPath()+"/sys/station/?repage";
	}
	
	@RequiresPermissions("sys:station:edit")
	@RequestMapping(value = "delete")
	public String delete(Station station, RedirectAttributes redirectAttributes) {
		stationService.delete(station);
		addMessage(redirectAttributes, "删除岗位成功");
		return "redirect:"+Global.getAdminPath()+"/sys/station/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Station> list = stationService.findList(new Station());
		for (int i=0; i<list.size(); i++){
			Station e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}



	/**
	 * 获取岗位数据。（选择控件）
	 * @param extId 排除的ID
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeDataStation")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId,
											  @RequestParam(required=false) Long grade,
											  @RequestParam(required=false) Boolean isAll,
											  HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Station> list = stationService.findList(new Station());
		for (int i=0; i<list.size(); i++){
			Station e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}