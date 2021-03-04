<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="qzzp" uri="http://www.qzzp.org" %>
<html>
<head>
	<link rel="stylesheet" href="<%=basePath%>/css/detail.css" type="text/css" />
</head>
<body>
<form id="fm" method="post">
	<div id="tt" class="easyui-tabs" style="width:100%;height:100%;min-height:450px;">   
	    <div title="基本信息" class="glxt" style="padding:20px;display:none;">   
	    	<div class="form">
				<li>
					<label><em class="f-dark-red">* </em>姓名：</label><input type="text" name="" value="${resumeInfo.fullName }" />
					<label><em class="f-dark-red">* </em>性别：</label>
					<label style="width:48px"><input type="radio" class="regular-radio" name="regular-radio" <c:if test="${resumeInfo.sex == '男' }">checked="checked"</c:if> /> 
					<span class="f12">男</span></label><label style="width:60px">
					<input type="radio" class="regular-radio" name="regular-radio" <c:if test="${resumeInfo.sex == '女' }">checked="checked"</c:if>/> <span class="f12">女</span></label>
					<label><em class="f-dark-red">* </em>民族：</label><input type="text" name="" value="${resumeInfo.nation }" />
					<!-- <span class="select-bg mr10">
					<select>
						<option value="请选择">请选择</option>
						<option value="选项一">汉族</option>
						<option value="选项二">56个民族</option>
					</select>
					</span> -->
				</li>
				<li>
					<label><em class="f-dark-red">* </em>身份证号：</label>
					<input type="text" name="" value="${resumeInfo.idNumber }" disabled="disabled" readonly="readonly" onfocus="this.blur()" style="font-size:11px; padding-left:5px; color:#888" />
					<label><em class="f-dark-red">* </em>出生年月：</label><input type="text" name="" value="<fmt:formatDate value="${resumeInfo.birthDate }" pattern="yyyy-MM-dd"/>"/>
					<label>籍贯：</label><input type="text" name="" value="${resumeInfo.nativePlace }" />
				</li>
				<li>
					<label>户口所在地：</label><input type="text" name="" value="${resumeInfo.residence }" />
					<label><em class="f-dark-red">* </em>政治面貌：</label><input type="text" name="" value="${resumeInfo.politicalStatus }" />
					<label><em class="f-dark-red">* </em>婚姻状况：</label><input type="text" name="" value="${resumeInfo.maritalStatus }" />
					<!-- <span class="select-bg mr10">
					<select>
						<option value="请选择">请选择</option>
						<option value="未婚">未婚</option>
						<option value="已婚">已婚</option>
						<option value="离异">离异</option>
					</select>
					</span> -->
				</li>
				<li>
					<label><em class="f-dark-red">* </em>文化程度：</label>
					<input type="text" name="" value="<qzzp:dict dictCode="ENTERPRISE_EDU_LEVEL" value="${resumeInfo.eduLevel }" readonly="true"/>" />
					<!-- <span class="select-bg mr0">
					<select>
						<option value="请选择">请选择</option>
						<option value="选项一">选项一</option>
						<option value="选项二">选项二</option>
					</select> -->
					</span>
					<label>毕业院校：</label><input type="text" name="" value="${resumeInfo.graduateSchool }" />
					<label>毕业时间：</label><input type="text" name="" value="<fmt:formatDate value="${resumeInfo.graduateDate }" pattern="yyyy-MM-dd"/>" />
				</li>
				<li>
					<label><em class="f-dark-red">* </em>所学专业：</label><input type="text" name="" value="${resumeInfo.eduMajor }" />
					<label><em class="f-dark-red">* </em>邮政编码：</label><input type="text" name="" value="${resumeInfo.postCode }" />
					<label><em class="f-dark-red">* </em>个人移动电话：</label><input type="text" name="" value="${resumeInfo.mobile }" />
				</li>
				<li>
					<label><em class="f-dark-red">* </em>工作年限：</label>
					<input type="text" name="" value="<qzzp:dict dictCode="WORK_LIFE" value="${resumeInfo.workLife }" readonly="true"/>" />
					<!-- <span class="select-bg mr0">
					<select>
						<option value="请选择">请选择</option>
						<option value="选项一">选项一</option>
						<option value="选项二">选项二</option>
					</select>
					</span> -->
					<label>电子邮箱：</label><input type="text" name="" value="${resumeInfo.email }"/>
				</li>
				<li>
					<label><em class="f-dark-red">* </em>通讯地址：</label><input type="text" name="" value="${resumeInfo.address }" style="width:596px" />
				</li>
			</div>
	    </div>   
	    <div title="学习经历" data-options="" style="overflow:auto;padding:20px;display:none;">   
	        <table id="learnId"></table>
	    </div>   
	    <div title="工作经历" data-options="" style="padding:20px;display:none;">   
	        <table id="workId"></table>
	    </div> 
	    <div title="求职意向" data-options="" style="padding:20px;display:none;">   
	        <table id="jobId"></table>
	    </div>   
	</div> 
</form> 
<script type="text/javascript">
$(function(){
	$("#fm input").attr("disabled", "disabled");
	$('#learnId').datagrid({
		border : true,
		url : eve.path + '/jobfair/resumeinfo/queryLearn?resumeid=${id}',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40 ],
		striped : true,
		collapsible : true,
		fitColumns : true,
		height : '380',
		pagination : true,
		singleSelect :true,
		remoteSort : false,
		columns : [ [ {
			field : 'school',
			title : '就读院校',
			width : 30,
			align : 'center'
		}, {
			field : 'startDateStr',
			title : '就读时间',
			width : 30,
			align : 'center'
		}, {
			field : 'endDateStr',
			title : '毕业时间',
			width : 30,
			align : 'center'
		}, {
			field : 'major',
			title : '所学专业',
			width : 30,
			align: 'center'
		} , {
			field : 'eduSystem',
			title : '学制',
			width : 20,
			align : 'center'
		}, {
			field : 'eduWay',
			title : '取得方式',
			width : 20,
			align : 'center'
		}, {
			field : 'eduLevel',
			title : '学历',
			width : 20,
			align : 'center',
			formatter : function(value, row) {
			    if(value == 0){
				    return '不限';
				}else if(value == 1){
					return '初中及以下';
				}else if(value == 2){
					return '高中/中技/中专';
				}else if(value == 3){
					return '大专';
				}else if(value == 4){
					return '本科';
				}else if(value == 5){
					return '硕士';
				}else if(value == 6){
					return '博士';
				}
			}
		}, {
			field : 'eduDegree',
			title : '学位',
			width : 20,
			align : 'center'
		}  
       ]]
	});
	
	
	$('#workId').datagrid({
		border : true,
		url : eve.path + '/jobfair/resumeinfo/queryWork?resumeid=${id}',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40 ],
		striped : true,
		collapsible : true,
		fitColumns : true,
		height : '380',
		pagination : true,
		singleSelect :true,
		remoteSort : false,
		columns : [ [ {
			field : 'startDateStr',
			title : '开始时间',
			width : 30,
			align : 'center'
		}, {
			field : 'endDateStr',
			title : '结束时间',
			width : 30,
			align : 'center'
		}, {
			field : 'company',
			title : '工作单位',
			width : 30,
			align : 'center'
		}, {
			field : 'jobDepartment',
			title : '部门',
			width : 30,
			align: 'center'
		} , {
			field : 'position',
			title : '职务',
			width : 20,
			align : 'center'
		} 
       ]]
	});
	
	
	
	$('#jobId').datagrid({
		border : true,
		url : eve.path + '/jobfair/resumeinfo/queryJobIntension?resumeid=${id}',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40 ],
		striped : true,
		collapsible : true,
		fitColumns : true,
		height : '380',
		pagination : true,
		singleSelect :true,
		remoteSort : false,
		columns : [ [ {
			field : 'position',
			title : '意向岗位',
			width : 30,
			align : 'center'
		}, {
			field : 'place',
			title : '意向工作地点',
			width : 30,
			align : 'center'
		}, {
			field : 'salary',
			title : '意向薪资',
			width : 30,
			align: 'center'
		} 
       ]]
	});
	
});
</script>
</body>
</html>
