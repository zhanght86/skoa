/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Office;

import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * 岗位管理Entity
 * @author lhy
 * @version 2016-10-19
 */
public class Station extends TreeEntity<Station> {

	private static final long serialVersionUID = 1L;
	private Station parent;		// 父级编号
	private String parentIds;		// 所有父级编号
	private Office office;		// 归属机构
	private String name;		// 岗位名称
	private String enname;		// 英文名称
	private String code;		// 编码
	private String stationType; // 岗位类型
	private Integer sort;		// 排序

    private User user;		// 根据用户ID查询岗位列表


    public Station() {
		super();
	}

	public Station(String id){
		super(id);
	}

    public Station(User user) {
        this();
        this.user = user;
    }

	@JsonBackReference
	@NotNull(message="父级编号不能为空")
	public Station getParent() {
		return parent;
	}

	public void setParent(Station parent) {
		this.parent = parent;
	}

	@Length(min=1, max=2000, message="所有父级编号长度必须介于 1 和 2000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	@Length(min=1, max=100, message="岗位名称长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=0, max=255, message="英文名称长度必须介于 0 和 255 之间")
	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}

	@Length(min=0, max=255, message="编码长度必须介于 0 和 255 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Length(min=0, max=255, message="角色类型长度必须介于 0 和 255 之间")
	public String getStationType() {
		return stationType;
	}

	public void setStationType(String stationType) {
		this.stationType = stationType;
	}

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @NotNull(message="排序不能为空")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}