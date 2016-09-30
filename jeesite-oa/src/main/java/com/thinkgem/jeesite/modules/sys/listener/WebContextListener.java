package com.thinkgem.jeesite.modules.sys.listener;

import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

/**
 * 控制台 打印 欢迎使用 Global.getConfig("productName")  - Powered By 字样
 */
public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!SystemService.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
}
