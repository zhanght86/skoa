<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户端管理</title>
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
		<li class="active"><a href="${ctx}/client/hmacClient/">客户端列表</a></li>
		<shiro:hasPermission name="client:hmacClient:edit"><li><a href="${ctx}/client/hmacClient/form">客户端添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmacClient" action="${ctx}/client/hmacClient/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>客户端名称：</label>
				<form:input path="clientName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>client_id：</label>
				<form:input path="clientId" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>client_secret：</label>
				<form:input path="clientSecret" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>客户端名称</th>
				<th>client_id</th>
				<th>client_secret</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="client:hmacClient:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmacClient">
			<tr>
				<td><a href="${ctx}/client/hmacClient/form?id=${hmacClient.id}">
					${hmacClient.clientName}
				</a></td>
				<td>
					${hmacClient.clientId}
				</td>
				<td>
					${hmacClient.clientSecret}
				</td>
				<td>
					<fmt:formatDate value="${hmacClient.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hmacClient.remarks}
				</td>
				<shiro:hasPermission name="client:hmacClient:edit"><td>
    				<a href="${ctx}/client/hmacClient/form?id=${hmacClient.id}">修改</a>
					<a href="${ctx}/client/hmacClient/delete?id=${hmacClient.id}" onclick="return confirmx('确认要删除该客户端吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>