/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目管理Entity
 * @author evan
 * @version 2016-10-25
 */
public class ProjectInfoProgress extends DataEntity<ProjectInfoProgress> {
	
	private static final long serialVersionUID = 1L;
	private ProjectInfo projectInfo;		// 项目id 父类
	private String statusOrigin;		// 项目进度-更新前
	private String statusCurrent;		// 项目进度-更新后
	private String filepath;		// 附件路径
	
	public ProjectInfoProgress() {
		super();
	}

	public ProjectInfoProgress(String id){
		super(id);
	}

	public ProjectInfoProgress(ProjectInfo projectInfo){
		this.projectInfo = projectInfo;
	}

	@Length(min=0, max=64, message="项目id长度必须介于 0 和 64 之间")
	public ProjectInfo getProjectInfo() {
		return projectInfo;
	}

	public void setProjectInfo(ProjectInfo projectInfo) {
		this.projectInfo = projectInfo;
	}
	
	@Length(min=0, max=2, message="项目进度-更新前长度必须介于 0 和 2 之间")
	public String getStatusOrigin() {
		return statusOrigin;
	}

	public void setStatusOrigin(String statusOrigin) {
		this.statusOrigin = statusOrigin;
	}
	
	@Length(min=0, max=2, message="项目进度-更新后长度必须介于 0 和 2 之间")
	public String getStatusCurrent() {
		return statusCurrent;
	}

	public void setStatusCurrent(String statusCurrent) {
		this.statusCurrent = statusCurrent;
	}
	
	@Length(min=0, max=2000, message="附件路径长度必须介于 0 和 2000 之间")
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}