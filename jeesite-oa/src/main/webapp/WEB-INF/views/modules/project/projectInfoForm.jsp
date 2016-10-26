<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/project/projectInfo/">项目列表</a></li>
		<li class="active"><a href="${ctx}/project/projectInfo/form?id=${projectInfo.id}">项目<shiro:hasPermission name="project:projectInfo:edit">${not empty projectInfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="project:projectInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="projectInfo" action="${ctx}/project/projectInfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${projectInfo.office.id}" labelName="office.name" labelValue="${projectInfo.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属区域：</label>
			<div class="controls">
				<sys:treeselect id="area" name="area.id" value="${projectInfo.area.id}" labelName="area.name" labelValue="${projectInfo.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目名称：</label>
			<div class="controls">
				<form:input path="projectName" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目级别：</label>
			<div class="controls">
				<form:select path="projectGrade" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectGrade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目负责人：</label>
			<div class="controls">
				<sys:treeselect id="primaryPerson" name="primaryPerson.id" value="${projectInfo.primaryPerson.id}" labelName="primaryPerson.name" labelValue="${projectInfo.primaryPerson.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目小组成员：</label>
			<div class="controls">
				<sys:treeselect id="teamMembers" name="teamMembers" value="${projectInfo.teamMembers}" labelName="teamMemberNames" labelValue="${projectInfo.teamMemberNames}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="input-xxlarge" allowClear="true" notAllowSelectParent="true" checked="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行业领域：</label>
			<div class="controls">
				<form:select path="industryDomain" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('industryDomain')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主营业务：</label>
			<div class="controls">
				<form:input path="mainBusiness" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件路径：</label>
			<div class="controls">
				<form:hidden id="filepath" path="filepath" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<sys:ckfinder input="filepath" type="files" uploadPath="/project/projectInfo" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年收入：</label>
			<div class="controls">
				<form:input path="annualIncome" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年净利润：</label>
			<div class="controls">
				<form:input path="annualNetProfit" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">项目进度：</label>
			<div class="controls">
				<form:select path="projectProgress" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectProgress')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">项目的开始时间：</label>
			<div class="controls">
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${projectInfo.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目推荐人：</label>
			<div class="controls">
				<form:input path="recommendedMan" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目的推荐时间：</label>
			<div class="controls">
				<input name="recommendedDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${projectInfo.recommendedDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目类型：</label>
			<div class="controls">
				<form:select path="projectType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">拟投金额：</label>
			<div class="controls">
				<form:input path="intendedMoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目状态：</label>
			<div class="controls">
				<form:select path="projectStatus" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">项目进度变更表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>项目进度-更新前</th>
								<th>项目进度-更新前名称</th>
								<th>项目进度-更新后</th>
								<th>项目进度-更新后名称</th>
								<th>附件路径</th>
								<th>进度更新备注</th>
								<shiro:hasPermission name="project:projectInfo:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="projectInfoProgressList">
						</tbody>
						<shiro:hasPermission name="project:projectInfo:edit"><tfoot>
							<tr><td colspan="8"><a href="javascript:" onclick="addRow('#projectInfoProgressList', projectInfoProgressRowIdx, projectInfoProgressTpl);projectInfoProgressRowIdx = projectInfoProgressRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="projectInfoProgressTpl">//<!--
						<tr id="projectInfoProgressList{{idx}}">
							<td class="hide">
								<input id="projectInfoProgressList{{idx}}_id" name="projectInfoProgressList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="projectInfoProgressList{{idx}}_delFlag" name="projectInfoProgressList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="projectInfoProgressList{{idx}}_statusOrigin" name="projectInfoProgressList[{{idx}}].statusOrigin" type="text" value="{{row.statusOrigin}}" maxlength="2" class="input-small "/>
							</td>
							<td>
								<input id="projectInfoProgressList{{idx}}_statusOriginName" name="projectInfoProgressList[{{idx}}].statusOriginName" type="text" value="{{row.statusOriginName}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="projectInfoProgressList{{idx}}_statusCurrent" name="projectInfoProgressList[{{idx}}].statusCurrent" type="text" value="{{row.statusCurrent}}" maxlength="2" class="input-small "/>
							</td>
							<td>
								<input id="projectInfoProgressList{{idx}}_statusCurrentName" name="projectInfoProgressList[{{idx}}].statusCurrentName" type="text" value="{{row.statusCurrentName}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="projectInfoProgressList{{idx}}_filepath" name="projectInfoProgressList[{{idx}}].filepath" type="text" value="{{row.filepath}}" maxlength="200" class="input-small "/>
							</td>
							<td>
								<textarea id="projectInfoProgressList{{idx}}_remarks" name="projectInfoProgressList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<shiro:hasPermission name="project:projectInfo:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#projectInfoProgressList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var projectInfoProgressRowIdx = 0, projectInfoProgressTpl = $("#projectInfoProgressTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(projectInfo.projectInfoProgressList)};
							for (var i=0; i<data.length; i++){
								addRow('#projectInfoProgressList', projectInfoProgressRowIdx, projectInfoProgressTpl, data[i]);
								projectInfoProgressRowIdx = projectInfoProgressRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<%--<shiro:hasPermission name="project:projectInfo:edit">--%>
				<c:if test="${fns:isProjectInfoNew(projectInfo) || fns:editableProject(projectInfo)}">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
				</c:if>
			<%--</shiro:hasPermission>--%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>