package com.thinkgem.jeesite.common.servlet;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfoProgress;
import com.thinkgem.jeesite.modules.project.service.ProjectInfoProgressService;
import com.thinkgem.jeesite.modules.project.service.ProjectInfoService;
import com.thinkgem.jeesite.modules.sys.utils.ProjectInfoUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.util.UriUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * 查看CK上传的图片
 * @author ThinkGem
 * @version 2014-06-25
 */
public class UserfilesDownloadServlet extends HttpServlet {

	private ProjectInfoService projectInfoService;
	private ProjectInfoProgressService projectInfoProgressService;

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(getClass());

	public void fileOutputStream(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String filepath = req.getRequestURI();
		//1.根据项目进度路径判断是否有访问权限
		if(filepath.indexOf("/project/projectInfoProgress/")>=0){
			String projectProgressId=req.getParameter("id");
			if(StringUtils.isBlank(projectProgressId)){
				req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
				req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
			}
			//2.获取进度
			ProjectInfoProgress projectInfoProgress=getProjectInfoProgressService().get(projectProgressId);
			if(null==projectInfoProgress){
				req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
				req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
			}
			//3.获取项目,并还原项目的项目进度
			ProjectInfo projectInfo=getProjectInfoService().get(projectInfoProgress.getProjectInfo());
			projectInfo.setProjectProgress(projectInfoProgress.getStatusCurrent());
			//4.判断该项目在某个项目进度下是否可以允许查看
			if(!ProjectInfoUtils.viewableProject(projectInfo)){
				req.setAttribute("exception", new RuntimeException("无权访问该文件"));
				req.getRequestDispatcher("/WEB-INF/views/error/403.jsp").forward(req, resp);
			}
		}
		int index = filepath.indexOf(Global.USERFILES_BASE_URL);
		if(index >= 0) {
			filepath = filepath.substring(index + Global.USERFILES_BASE_URL.length());
		}
		try {
			filepath = UriUtils.decode(filepath, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			logger.error(String.format("解释文件路径失败，URL地址为%s", filepath), e1);
		}
		File file = new File(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL + filepath);
		try {
			FileCopyUtils.copy(new FileInputStream(file), resp.getOutputStream());
			resp.setHeader("Content-Type", "application/octet-stream");
			return;
		} catch (FileNotFoundException e) {
			req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
			req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}

	public ProjectInfoProgressService getProjectInfoProgressService() {
		if (projectInfoProgressService == null){
			projectInfoProgressService = SpringContextHolder.getBean(ProjectInfoProgressService.class);
		}
		return projectInfoProgressService;
	}
	public ProjectInfoService getProjectInfoService() {
		if (projectInfoService == null){
			projectInfoService = SpringContextHolder.getBean(ProjectInfoService.class);
		}
		return projectInfoService;
	}
}
