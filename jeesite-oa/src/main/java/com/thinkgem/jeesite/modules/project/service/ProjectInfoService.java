/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.project.dao.ProjectInfoDao;
import com.thinkgem.jeesite.modules.project.dao.ProjectInfoProgressDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfoProgress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 项目管理Service
 * @author evan
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class ProjectInfoService extends CrudService<ProjectInfoDao, ProjectInfo> {

	@Autowired
	private ProjectInfoProgressDao projectInfoProgressDao;
	
	public ProjectInfo get(String id) {
		ProjectInfo projectInfo = super.get(id);
		projectInfo.setProjectInfoProgressList(projectInfoProgressDao.findList(new ProjectInfoProgress(projectInfo)));
		return projectInfo;
	}
	
	public List<ProjectInfo> findList(ProjectInfo projectInfo) {
		return super.findList(projectInfo);
	}
	
	public Page<ProjectInfo> findPage(Page<ProjectInfo> page, ProjectInfo projectInfo) {
		return super.findPage(page, projectInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(ProjectInfo projectInfo) {
		super.save(projectInfo);
		for (ProjectInfoProgress projectInfoProgress : projectInfo.getProjectInfoProgressList()){
			if (projectInfoProgress.getId() == null){
				continue;
			}
			if (ProjectInfoProgress.DEL_FLAG_NORMAL.equals(projectInfoProgress.getDelFlag())){
				if (StringUtils.isBlank(projectInfoProgress.getId())){
					projectInfoProgress.setProjectInfo(projectInfo);
					projectInfoProgress.preInsert();
					projectInfoProgressDao.insert(projectInfoProgress);
				}else{
					projectInfoProgress.preUpdate();
					projectInfoProgressDao.update(projectInfoProgress);
				}
			}else{
				projectInfoProgressDao.delete(projectInfoProgress);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ProjectInfo projectInfo) {
		super.delete(projectInfo);
		projectInfoProgressDao.delete(new ProjectInfoProgress(projectInfo));
	}
	
}