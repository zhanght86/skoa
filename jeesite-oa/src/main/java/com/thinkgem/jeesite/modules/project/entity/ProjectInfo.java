/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.entity;

import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目表管理Entity
 * @author evan
 * @version 2016-09-23
 */
public class ProjectInfo extends DataEntity<ProjectInfo> {
	
	private static final long serialVersionUID = 1L;
	private Office office;		// 归属部门
	private Area area;		// 归属区域
	private String projectName;		// 项目名称
	private String projectGrade;		// 项目级别
	private User primaryPerson;		// 项目负责人
	private User deputyPerson;		// 项目副负责人
	private String industryDomain;		// 行业领域
	private String mainBusiness;		// 主营业务
	private String filepath;		// 附件路径
	private String filename;		// 附件名称
	private String annualIncome;		// 年收入
	private String annualNetProfit;		// 年净利润
	private String projectProgress;		// 项目进度
	private Date progressUpdateDate;		// 进度更新时间
	private String progressUpdateBy;		// 进度更新者
	private String progressUpdateRemarks;		// 进度更新备注
	private Date startDate;		// 项目的开始时间
	private String recommendedMan;		// 项目推荐人
	private Date recommendedDate;		// 项目的推荐时间
	private String projectType;		// 项目类型
	private BigDecimal intendedMoney;		// 拟投金额
	private String projectStatus;		// 项目状态
	
	public ProjectInfo() {
		super();
	}

	public ProjectInfo(String id){
		super(id);
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=200, message="项目名称长度必须介于 0 和 200 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=2, message="项目级别长度必须介于 0 和 2 之间")
	public String getProjectGrade() {
		return projectGrade;
	}

	public void setProjectGrade(String projectGrade) {
		this.projectGrade = projectGrade;
	}
	
	public User getPrimaryPerson() {
		return primaryPerson;
	}

	public void setPrimaryPerson(User primaryPerson) {
		this.primaryPerson = primaryPerson;
	}
	
	public User getDeputyPerson() {
		return deputyPerson;
	}

	public void setDeputyPerson(User deputyPerson) {
		this.deputyPerson = deputyPerson;
	}
	
	@Length(min=0, max=2, message="行业领域长度必须介于 0 和 2 之间")
	public String getIndustryDomain() {
		return industryDomain;
	}

	public void setIndustryDomain(String industryDomain) {
		this.industryDomain = industryDomain;
	}
	
	@Length(min=0, max=100, message="主营业务长度必须介于 0 和 100 之间")
	public String getMainBusiness() {
		return mainBusiness;
	}

	public void setMainBusiness(String mainBusiness) {
		this.mainBusiness = mainBusiness;
	}
	
	@Length(min=0, max=200, message="附件路径长度必须介于 0 和 200 之间")
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	@Length(min=0, max=200, message="附件名称长度必须介于 0 和 200 之间")
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Length(min=0, max=100, message="年收入长度必须介于 0 和 100 之间")
	public String getAnnualIncome() {
		return annualIncome;
	}

	public void setAnnualIncome(String annualIncome) {
		this.annualIncome = annualIncome;
	}
	
	@Length(min=0, max=100, message="年净利润长度必须介于 0 和 100 之间")
	public String getAnnualNetProfit() {
		return annualNetProfit;
	}

	public void setAnnualNetProfit(String annualNetProfit) {
		this.annualNetProfit = annualNetProfit;
	}
	
	@Length(min=0, max=2, message="项目进度长度必须介于 0 和 2 之间")
	public String getProjectProgress() {
		return projectProgress;
	}

	public void setProjectProgress(String projectProgress) {
		this.projectProgress = projectProgress;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getProgressUpdateDate() {
		return progressUpdateDate;
	}

	public void setProgressUpdateDate(Date progressUpdateDate) {
		this.progressUpdateDate = progressUpdateDate;
	}
	
	@Length(min=0, max=64, message="进度更新者长度必须介于 0 和 64 之间")
	public String getProgressUpdateBy() {
		return progressUpdateBy;
	}

	public void setProgressUpdateBy(String progressUpdateBy) {
		this.progressUpdateBy = progressUpdateBy;
	}
	
	@Length(min=0, max=255, message="进度更新备注长度必须介于 0 和 255 之间")
	public String getProgressUpdateRemarks() {
		return progressUpdateRemarks;
	}

	public void setProgressUpdateRemarks(String progressUpdateRemarks) {
		this.progressUpdateRemarks = progressUpdateRemarks;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@Length(min=0, max=50, message="项目推荐人长度必须介于 0 和 50 之间")
	public String getRecommendedMan() {
		return recommendedMan;
	}

	public void setRecommendedMan(String recommendedMan) {
		this.recommendedMan = recommendedMan;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRecommendedDate() {
		return recommendedDate;
	}

	public void setRecommendedDate(Date recommendedDate) {
		this.recommendedDate = recommendedDate;
	}
	
	@Length(min=0, max=2, message="项目类型长度必须介于 0 和 2 之间")
	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	
	public BigDecimal getIntendedMoney() {
		return intendedMoney;
	}

	public void setIntendedMoney(BigDecimal intendedMoney) {
		this.intendedMoney = intendedMoney;
	}
	
	@Length(min=1, max=1, message="项目状态长度必须介于 1 和 1 之间")
	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	
}