package com.thinkgem.jeesite.modules.sys.utils;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;

/**
 * 关于项目的工具类.
 */
public class ProjectInfoUtils {
	/**
	 * 判断当前用户是否是某个项目的负责人
	 * @param projectInfo
	 * @return
	 */
	public static Boolean isProjectInfoPrimaryPerson(ProjectInfo projectInfo){
		if(null==projectInfo||null==projectInfo.getPrimaryPerson())
			return false;
		return UserUtils.getUser().getId().equals(projectInfo.getPrimaryPerson().getId());
	}

	/**
	 * 判断当前用户是否是某个项目的创建者
	 * @param projectInfo
	 * @return
	 */
	public static Boolean isProjectInfoCreator(ProjectInfo projectInfo){
		if(null==projectInfo||null==projectInfo.getCreateBy())
			return false;
		return UserUtils.getUser().getId().equals(projectInfo.getCreateBy().getId());
	}

	/**
	 * 判断当前用户是否可以编辑或删除该项目
	 * @param projectInfo
	 * @return
	 */
	public static Boolean editableProject(ProjectInfo projectInfo) {
		//1.如果当前用户是项目的创建者,并且该项目的状态为推介人编辑时,则可以编辑该项目
		if(ProjectInfoUtils.isProjectInfoCreator(projectInfo)&&"0".equals(projectInfo.getProjectStatus()))
			return true;

		//2.如果当前用户是项目的负责人,则可以编辑该项目
		if(ProjectInfoUtils.isProjectInfoPrimaryPerson(projectInfo))
			return true;
		return false;
	}
	/**
	 * 判断当前用户是否可以编辑或删除该项目 (提供jstl fn自定义函数接口)
	 * @param projectInfo
	 * @return
	 */
	public static Boolean editableProject(Object projectInfo) {
		ProjectInfo _projectInfo=null;
		if(projectInfo instanceof  ProjectInfo) {
			_projectInfo= (ProjectInfo) projectInfo;
			return ProjectInfoUtils.editableProject(_projectInfo);
		}
		return false;
	}

	/**
	 * 判断当前用户是否新增项目(提供jstl fn自定义函数接口)
	 * @param projectInfo
	 * @return
	 */
	public static Boolean isProjectInfoNew(Object projectInfo){
		if(projectInfo!=null){
			ProjectInfo _projectInfo=null;
			if(projectInfo instanceof  ProjectInfo) {
				_projectInfo= (ProjectInfo) projectInfo;

				return StringUtils.isBlank(_projectInfo.getId());
			}
		}
		return true;
	}

	/**
	 * 判断当前用户是否为项目负责人(提供jstl fn自定义函数接口)
	 * @param projectInfo
	 * @return
	 */
	public static Boolean isProjectInfoPrimaryPerson(Object projectInfo){
		ProjectInfo _projectInfo=null;
		if(projectInfo instanceof  ProjectInfo) {
			_projectInfo= (ProjectInfo) projectInfo;
			return ProjectInfoUtils.isProjectInfoPrimaryPerson(_projectInfo);
		}
		return false;
	}
}
