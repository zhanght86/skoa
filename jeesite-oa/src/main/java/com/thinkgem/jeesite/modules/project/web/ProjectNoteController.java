/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.web;

import com.google.common.base.Splitter;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.json.JsonResultModel;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.project.entity.ProjectNote;
import com.thinkgem.jeesite.modules.project.service.ProjectNoteService;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.websocket.SystemWebSocketHandler;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目动态表管理Controller
 * @author lhy
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/project/projectNote")
public class ProjectNoteController extends BaseController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private ProjectNoteService projectNoteService;
	@Autowired
	private SystemWebSocketHandler systemWebSocketHandler;

	protected JsonResultModel jsonResultModel=new JsonResultModel();

	/*@Bean
	public SystemWebSocketHandler systemWebSocketHandler() {
		return new SystemWebSocketHandler();
	}*/

	@ModelAttribute
	public ProjectNote get(@RequestParam(required=false) String id) {
		ProjectNote entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = projectNoteService.get(id);
		}
		if (entity == null){
			entity = new ProjectNote();
		}
		return entity;
	}
	
	@RequiresPermissions("project:projectNote:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProjectNote projectNote, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProjectNote> page = projectNoteService.findPage(new Page<ProjectNote>(request, response), projectNote); 
		model.addAttribute("page", page);
		return "modules/project/projectNoteList";
	}

	@RequiresPermissions("project:projectNote:view")
	@RequestMapping(value = "form")
	public String form(ProjectNote projectNote, Model model) {
		model.addAttribute("projectNote", projectNote);
		return "modules/project/projectNoteForm";
	}

	@RequiresPermissions("project:projectNote:edit")
	@RequestMapping(value = "save")
	public String save(ProjectNote projectNote, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, projectNote)){
			return form(projectNote, model);
		}
		projectNoteService.save(projectNote);
		addMessage(redirectAttributes, "保存项目动态成功");
		return "redirect:"+Global.getAdminPath()+"/project/projectNote/?repage";
	}
	
	@RequiresPermissions("project:projectNote:edit")
	@RequestMapping(value = "delete")
	public String delete(ProjectNote projectNote, RedirectAttributes redirectAttributes) {
		projectNoteService.delete(projectNote);
		addMessage(redirectAttributes, "删除项目动态成功");
		return "redirect:"+Global.getAdminPath()+"/project/projectNote/?repage";
	}


	//ajax保存
	@RequestMapping(value = "/saveProjectNote", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public JsonResultModel saveProjectNote(ProjectNote projectNote) {
		try {
			//处理atUserids;传递过来的是loginName，我们需要转化为用户id
			String atUserids = projectNote.getAtUserids();

			List<User> userList=null;
			if (StringUtils.isNotBlank(atUserids)) {
				List<String> usesrids=Splitter.on(',').trimResults().omitEmptyStrings().splitToList(atUserids);
				//查询出用户,获取ID
				userList = userDao.findUserByLoginNames(usesrids);
				projectNote.setAtUserids(Collections3.extractToString(userList,"id",","));
			}

			projectNoteService.save(projectNote);

			//websocket推送给在线用户 未阅读的消息数;
			if(!Collections3.isEmpty(userList)) {
				systemWebSocketHandler.sendOaNotifyCountMessageToUser(userList);
			}

			jsonResultModel.setStateSuccess();
			Map resultMap=new HashMap();
			resultMap.put("name",projectNote.getCreateBy().getName());
			resultMap.put("content",projectNote.getContent());
			resultMap.put("createDate", DateUtils.formatDateTime(projectNote.getCreateDate()));
			jsonResultModel.setData(resultMap);
		}catch (Exception e){
			e.printStackTrace();
			logger.error("参数校验失败：", e);
			jsonResultModel.setMessage(e.getMessage());
			jsonResultModel.setStateError();
		}
		return jsonResultModel;
	}

}