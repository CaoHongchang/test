<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>班级修改</title>
<body>

	<form id="addFm" method="post">
	<input hidden="hidden" id="classId" name="classId"> 
		<div>
			<table class="table2">
				<tr>
					<td class="left">班级编号</td>
					<td class="right"><input id="classNum" name="classNum" size="25"
						class="easyui-textbox" readonly="readonly" 
						style="height:22px">
					</td>
					<td class="left"></td>
					<td class="right"></td>
				</tr>
				<tr>
					<td class="left">项目名称</td>
					<td class="right">
					<input id="projectId" name="projectId" size="25"
						class="easyui-textbox"    data-options="editable:false,readonly:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">班级名称</td>
					<td class="right"><input id="className" name="className"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">班级人数上限</td>
					<td class="right"><input id="classSum" name="classSum"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">班级开设时间</td>
					<td class="right"><input class="easyui-datebox" id="openTime"
						name="openTime" size="25" data-options="required:true" 
						style="height:22px"></td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>
