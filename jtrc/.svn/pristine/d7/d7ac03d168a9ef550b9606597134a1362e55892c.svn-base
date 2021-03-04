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
				<td class="left">班级编号:</td>
				<td class="right"><input id="classNum" name="classNum"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">项目名称:</td>
				<td class="right"><input id="projectName" name="projectName"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">班级名称:</td>
				<td class="right"><input id="className"
					name="className" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
				<td class="left">班级人数上限:</td>
				<td class="right"><input id="classSum"
					name="classSum" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
			</tr>
			<tr>
				<td class="left">班级开设时间:</td>
				<td class="right"><input id="openTime" name="openTime"
					class="easyui-datebox" size="20" data-options=""
					style="height:22px">
				</td>
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
