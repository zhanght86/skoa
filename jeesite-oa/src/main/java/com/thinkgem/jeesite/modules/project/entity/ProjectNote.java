/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目动态表管理Entity
 * @author lhy
 * @version 2016-11-07
 */
public class ProjectNote extends DataEntity<ProjectNote> {
	
	private static final long serialVersionUID = 1L;
	private String projectId;		// 项目编号
	private String atUserids;		// 通知人员id(多个人员id使用逗号分隔)
	private String content;		// 内容
	
	public ProjectNote() {
		super();
	}

	public ProjectNote(String id){
		super(id);
	}

	@Length(min=0, max=64, message="项目编号长度必须介于 0 和 64 之间")
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	@Length(min=0, max=2000, message="通知人员id(多个人员id使用逗号分隔)长度必须介于 0 和 2000 之间")
	public String getAtUserids() {
		return atUserids;
	}

	public void setAtUserids(String atUserids) {
		this.atUserids = atUserids;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}