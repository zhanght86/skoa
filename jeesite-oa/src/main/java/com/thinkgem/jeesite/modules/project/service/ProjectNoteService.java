/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.project.dao.ProjectInfoDao;
import com.thinkgem.jeesite.modules.project.dao.ProjectNoteDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.project.entity.ProjectNote;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 项目动态表管理Service
 * @author lhy
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
public class ProjectNoteService extends CrudService<ProjectNoteDao, ProjectNote> {

	@Autowired
	private OaNotifyService oaNotifyService;

	@Autowired
	private ProjectInfoDao projectInfoDao;

	public ProjectNote get(String id) {
		return super.get(id);
	}
	
	public List<ProjectNote> findList(ProjectNote projectNote) {
		return super.findList(projectNote);
	}
	
	public Page<ProjectNote> findPage(Page<ProjectNote> page, ProjectNote projectNote) {
		return super.findPage(page, projectNote);
	}
	
	@Transactional(readOnly = false)
	public void save(ProjectNote projectNote) {
		if (StringUtils.isNotBlank(projectNote.getAtUserids())) {
			String atUserids = projectNote.getAtUserids();
			if(atUserids.contains(",")&&atUserids.length()>1){
				if (atUserids.startsWith(",")) {
					atUserids = atUserids.substring(1, atUserids.length());
				}
				if (atUserids.endsWith(",")) {
					atUserids = atUserids.substring(0, atUserids.length() - 1);
				}
			}
			projectNote.setAtUserids(atUserids);

			ProjectInfo projectInfo=projectInfoDao.get(projectNote.getProjectId());
			//String[] userids=atUserids.split(",");
			//邮件通知等(预留)

			//添加到我的通告
			OaNotify oaNotify = new OaNotify();
			oaNotify.setType("4");
			oaNotify.setTitle(projectInfo.getProjectName());
			oaNotify.setContent(projectNote.getContent());
			oaNotify.setStatus("1");
			oaNotify.setOaNotifyRecordIds(atUserids);
			oaNotify.setRemarks(projectInfo.getId());
			oaNotifyService.save(oaNotify);

		}
		super.save(projectNote);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProjectNote projectNote) {
		super.delete(projectNote);
	}
	
}