/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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

	@Autowired
	private SystemService systemService;

	@Autowired
	private OfficeService officeService;
	
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


	/**
	 * 岗位分配页面
	 * @param station
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:station:edit")
	@RequestMapping(value = "assign")
	public String assign(Station station, Model model) {
		List<User> userList = systemService.findUser(new User(new Station(station.getId())));
		model.addAttribute("userList", userList);
		return "modules/sys/stationAssign";
	}

	/**
	 * 岗位分配 -- 打开岗位分配对话框
	 * @param station
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:station:view")
	@RequestMapping(value = "usertostation")
	public String selectUserToStation(Station station, Model model) {
		List<User> userList = systemService.findUser(new User(new Station(station.getId())));
		model.addAttribute("station", station);
		model.addAttribute("userList", userList);
		model.addAttribute("selectIds", Collections3.extractToString(userList, "name", ","));
		model.addAttribute("officeList", officeService.findAll());
		return "modules/sys/selectUserToStation";
	}

	/**
	 * 岗位分配 -- 根据部门编号获取用户列表
	 * @param officeId
	 * @param response
	 * @return
	 */
	@RequiresPermissions("sys:station:view")
	@ResponseBody
	@RequestMapping(value = "users")
	public List<Map<String, Object>> users(String officeId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		User user = new User();
		user.setOffice(new Office(officeId));
		Page<User> page = systemService.findUser(new Page<User>(1, -1), user);
		for (User e : page.getList()) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", 0);
			map.put("name", e.getName());
			mapList.add(map);
		}
		return mapList;
	}

	/**
	 * 岗位分配 -- 从岗位中移除用户
	 * @param userId
	 * @param stationId
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:station:edit")
	@RequestMapping(value = "outstation")
	public String outstation(String userId, String stationId, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/station/assign?id="+stationId;
		}
		Station station = stationService.get(stationId);
		User user = systemService.getUser(userId);
		if (UserUtils.getUser().getId().equals(userId)) {
			addMessage(redirectAttributes, "无法从岗位【" + station.getName() + "】中移除用户【" + user.getName() + "】自己！");
		}else {
//			if (user.getStationList().size() <= 1){
//				addMessage(redirectAttributes, "用户【" + user.getName() + "】从岗位【" + station.getName() + "】中移除失败！这已经是该用户的唯一岗位，不能移除。");
//			}else{
				Boolean flag = systemService.outUserInStation(station, user);
				if (!flag) {
					addMessage(redirectAttributes, "用户【" + user.getName() + "】从岗位【" + station.getName() + "】中移除失败！");
				}else {
					addMessage(redirectAttributes, "用户【" + user.getName() + "】从岗位【" + station.getName() + "】中移除成功！");
				}
//			}
		}
		return "redirect:" + adminPath + "/sys/station/assign?id="+station.getId();
	}

	/**
	 * 岗位分配
	 * @param station
	 * @param idsArr
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:station:edit")
	@RequestMapping(value = "assignstation")
	public String assignStation(Station station, String[] idsArr, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/station/assign?id="+station.getId();
		}
		StringBuilder msg = new StringBuilder();
		int newNum = 0;
		for (int i = 0; i < idsArr.length; i++) {
			User user = systemService.assignUserToStation(station, systemService.getUser(idsArr[i]));
			if (null != user) {
				msg.append("<br/>新增用户【" + user.getName() + "】到岗位【" + station.getName() + "】！");
				newNum++;
			}
		}
		addMessage(redirectAttributes, "已成功分配 "+newNum+" 个用户"+msg);
		return "redirect:" + adminPath + "/sys/station/assign?id="+station.getId();
	}
	
}