/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.restful.modules.client.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.restful.modules.client.entity.HmacClient;
import com.thinkgem.jeesite.restful.modules.client.service.HmacClientService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * restfulController
 * @author evan
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/client/hmacClient")
public class HmacClientController extends BaseController {

	@Autowired
	private HmacClientService hmacClientService;
	
	@ModelAttribute
	public HmacClient get(@RequestParam(required=false) String id) {
		HmacClient entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmacClientService.get(id);
		}
		if (entity == null){
			entity = new HmacClient();
		}
		return entity;
	}
	
	@RequiresPermissions("client:hmacClient:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmacClient hmacClient, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmacClient> page = hmacClientService.findPage(new Page<HmacClient>(request, response), hmacClient); 
		model.addAttribute("page", page);
		return "modules/client/hmacClientList";
	}

	@RequiresPermissions("client:hmacClient:view")
	@RequestMapping(value = "form")
	public String form(HmacClient hmacClient, Model model) {
		model.addAttribute("hmacClient", hmacClient);
		return "modules/client/hmacClientForm";
	}

	@RequiresPermissions("client:hmacClient:edit")
	@RequestMapping(value = "regernate")
	public String regernate(HmacClient hmacClient, Model model,RedirectAttributes redirectAttributes) {
		hmacClient.setRegernate(true);
		hmacClientService.save(hmacClient);
		addMessage(redirectAttributes, "重新生成该客户端appId,appKey成功");
		return "redirect:"+Global.getAdminPath()+"/client/hmacClient/?repage";
	}

	@RequiresPermissions("client:hmacClient:edit")
	@RequestMapping(value = "save")
	public String save(HmacClient hmacClient, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmacClient)){
			return form(hmacClient, model);
		}
		hmacClientService.save(hmacClient);
		addMessage(redirectAttributes, "保存客户端成功");
		return "redirect:"+Global.getAdminPath()+"/client/hmacClient/?repage";
	}
	
	@RequiresPermissions("client:hmacClient:edit")
	@RequestMapping(value = "delete")
	public String delete(HmacClient hmacClient, RedirectAttributes redirectAttributes) {
		hmacClientService.delete(hmacClient);
		addMessage(redirectAttributes, "删除客户端成功");
		return "redirect:"+Global.getAdminPath()+"/client/hmacClient/?repage";
	}

}