<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目浏览</title>
	<meta name="decorator" content="default"/>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/project/projectInfo/">项目列表</a></li>
		<li class="active">
			<a href="${ctx}/project/projectInfo/view?id=${projectInfo.id}">
				项目浏览
			</a>
		</li>
	</ul><br/>


	<div class="form-horizontal">
		<div class="control-group">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				${projectInfo.office.name}
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">归属区域：</label>
			<div class="controls">
				${projectInfo.area.name}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目名称：</label>
			<div class="controls">
				${projectInfo.projectName}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目级别：</label>
			<div class="controls">
				${fns:getDictLabel(projectInfo.projectGrade, 'projectGrade', '暂无级别')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目负责人：</label>
			<div class="controls">
				${projectInfo.primaryPerson.name}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目小组成员：</label>
			<div class="controls">
				${projectInfo.teamMemberNames}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行业领域：</label>
			<div class="controls">
				${fns:getDictLabel(projectInfo.industryDomain, 'industryDomain', '暂无行业领域')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主营业务：</label>
			<div class="controls">
				${projectInfo.mainBusiness}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件路径：</label>
			<div class="controls">
				<input type="hidden" id="filepath" />
				<sys:ckfinder input="filepath" type="files" uploadPath="/project/projectInfo" selectMultiple="true" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年收入：</label>
			<div class="controls">
				${projectInfo.annualIncome}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年净利润：</label>
			<div class="controls">
				${projectInfo.annualNetProfit}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目进度：</label>
			<div class="controls">
				${fns:getDictLabel(projectInfo.projectProgress, 'projectProgress', '暂无进度')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目的开始时间：</label>
			<div class="controls">
				<fmt:formatDate value="${projectInfo.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目推荐人：</label>
			<div class="controls">
				${projectInfo.recommendedMan}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目的推荐时间：</label>
			<div class="controls">
				<fmt:formatDate value="${projectInfo.recommendedDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目类型：</label>
			<div class="controls">
				${fns:getDictLabel(projectInfo.projectType, 'projectType', '暂无类型')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">拟投金额：</label>
			<div class="controls">
				${projectInfo.intendedMoney}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目状态：</label>
			<div class="controls">
				${fns:getDictLabel(projectInfo.projectStatus, 'projectStatus', '暂无状态')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				${projectInfo.remarks}
			</div>
		</div>
		<c:if test="${!fns:isProjectInfoNew(projectInfo)}">
			<div class="control-group">
				<table class="table table-hover">
					<thead>
					<tr>
						<th>序号</th>
						<th>进度变更</th>
						<th>附件</th>
						<th>备注</th>
						<th>操作者</th>
						<th>日期</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${not empty projectInfo.projectInfoProgressList}">
						<c:forEach items="${projectInfo.projectInfoProgressList}" var="pp" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>
										${fns:getDictLabel(pp.statusOrigin, 'projectProgress', '暂无进度')}=>${fns:getDictLabel(pp.statusCurrent, 'projectProgress', '暂无进度')}
								</td>
								<td>
									<input id="filepathProgress_${pp.id}" type="hidden" value="${pp.filepath}"/>
									<sys:ckfinder input="filepathProgress_${pp.id}" type="files" uploadPath="/project/projectInfo" selectMultiple="true" readonly="true"/>
								</td>
								<td>${pp.remarks}</td>
								<td>${pp.createBy.name}</td>
								<td>
									<fmt:formatDate value="${pp.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
		</c:if>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</div>
</body>
</html>