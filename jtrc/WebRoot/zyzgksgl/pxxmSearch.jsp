<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>查询</title>
<body>
	<script type="text/javascript">
		function searchFun() {
			$('#searchInfo').dialog('close');
			var param = $("#searchForm").serializeArray();
			search(JSON.stringify(param));
		}

		function cleanFun() {
			$("#searchForm").form('reset');

		}
	</script>
	<form id="searchForm" method="post">
		<table class="tableSearch">
			<tr>
				<td class="left">项目编号:</td>
				<td class="right"><input id="projectNum" name="projectNum"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">项目名称:</td>
				<td class="right"><input id="projectName" name="projectName"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">主办单位:</td>
				<td class="right"><input id="hostUnit"
					name="hostUnit" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
				<td class="left">培训对象:</td>
				<td class="right"><input id="examObject"
					name="examObject" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
			</tr>
			<tr>
				<td class="left">培训内容:</td>
				<td class="right"><input id="examContent" name="examContent"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">发证单位:</td>
				<td class="right"><input class="easyui-textbox" id="issueUnit"
					name="issueUnit" data-options="showSeconds:false"
					value="" size="20" style="width:138px"></td>
				<td class="left">培训类别:</td>
				<td class="right"><select id="examType" name="examType"
						class="easyui-combobox" size="20">
							<option value="1">安全三类人员新取证考试</option>
							<option value="2">安全三类人员继续教育考试</option>
							<option value="3">安全考评员新取证考试</option>
							<option value="4">安全考评员继续教育考试</option>
							<option value="5">专业技术人员继续教育考试</option>
					</select></td>
				<td class="left">培训期限:</td>
				<td class="right"><input class="easyui-textbox" id="examTerm"
					name="examTerm" data-options="showSeconds:false" value="" size="20"
					style="width:138px"></td>
			</tr>
			<tr>
				<td class="center" colspan="6"><a onclick="searchFun();"
					class="easyui-linkbutton" style="width:60px"
					data-options="iconCls:'',plain:false">查询</a> <a
					onclick="cleanFun();" class="easyui-linkbutton" style="width:60px"
					data-options="iconCls:'',plain:false">重置</a></td>
			</tr>
		</table>
	</form>
</body>

</html>
