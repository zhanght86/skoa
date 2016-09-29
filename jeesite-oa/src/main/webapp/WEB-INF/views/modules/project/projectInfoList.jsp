<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/project/projectInfo/">项目列表</a></li>
		<shiro:hasPermission name="project:projectInfo:edit"><li><a href="${ctx}/project/projectInfo/form">项目添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="projectInfo" action="${ctx}/project/projectInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${projectInfo.office.id}" labelName="office.name" labelValue="${projectInfo.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属区域：</label>
				<sys:treeselect id="area" name="area.id" value="${projectInfo.area.id}" labelName="area.name" labelValue="${projectInfo.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>项目名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>项目级别：</label>
				<form:select path="projectGrade" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectGrade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>行业领域：</label>
				<form:select path="industryDomain" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('industryDomain')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>项目进度：</label>
				<form:select path="projectProgress" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectProgress')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>项目类型：</label>
				<form:select path="projectType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>项目名称</th>
				<th>项目负责人</th>
				<th>行业领域</th>
				<th>年收入</th>
				<th>年净利润</th>
				<th>项目进度</th>
				<th>项目类型</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="project:projectInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="projectInfo">
			<tr>
				<td><a href="${ctx}/project/projectInfo/form?id=${projectInfo.id}">
					${projectInfo.projectName}
				</a></td>
				<td>
					${projectInfo.primaryPerson.name}
				</td>
				<td>
					${fns:getDictLabel(projectInfo.industryDomain, 'industryDomain', '')}
				</td>
				<td>
					${projectInfo.annualIncome}
				</td>
				<td>
					${projectInfo.annualNetProfit}
				</td>
				<td>
					${fns:getDictLabel(projectInfo.projectProgress, 'projectProgress', '')}
				</td>
				<td>
					${fns:getDictLabel(projectInfo.projectType, 'projectType', '')}
				</td>
				<td>
					<fmt:formatDate value="${projectInfo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${projectInfo.remarks}
				</td>
				<shiro:hasPermission name="project:projectInfo:edit"><td>
    				<a href="${ctx}/project/projectInfo/form?id=${projectInfo.id}">修改</a>
					<a href="${ctx}/project/projectInfo/delete?id=${projectInfo.id}" onclick="return confirmx('确认要删除该项目吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>