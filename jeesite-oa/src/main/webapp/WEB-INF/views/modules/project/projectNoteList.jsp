<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目动态管理</title>
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
		<li class="active"><a href="${ctx}/project/projectNote/">项目动态列表</a></li>
		<shiro:hasPermission name="project:projectNote:edit"><li><a href="${ctx}/project/projectNote/form">项目动态添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="projectNote" action="${ctx}/project/projectNote/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>项目编号：</label>
				<form:input path="projectId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${projectNote.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>项目编号</th>
				<th>通知人员id(多个人员id使用逗号分隔)</th>
				<th>内容</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>删除标记</th>
				<shiro:hasPermission name="project:projectNote:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="projectNote">
			<tr>
				<td><a href="${ctx}/project/projectNote/form?id=${projectNote.id}">
					${projectNote.id}
				</a></td>
				<td>
					${projectNote.projectId}
				</td>
				<td>
					${projectNote.atUserids}
				</td>
				<td>
					${projectNote.content}
				</td>
				<td>
					${projectNote.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${projectNote.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${projectNote.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(projectNote.delFlag, 'del_flag', '')}
				</td>
				<shiro:hasPermission name="project:projectNote:edit"><td>
    				<a href="${ctx}/project/projectNote/form?id=${projectNote.id}">修改</a>
					<a href="${ctx}/project/projectNote/delete?id=${projectNote.id}" onclick="return confirmx('确认要删除该项目动态吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>