<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>查询</title>
<body>
	<script type="text/javascript">
		function searchFun() {
			$('#searchInfo').dialog('close');
			var param = $("#searchForm").serializeArray();
			loadList(JSON.stringify(param));
		}

		function cleanFun() {
			$("#searchForm").form('reset');

		}
	</script>
	<form id="searchForm" method="post">
		<table class="tableSearch">
			<tr>
				<td class="left">项目名称:</td>
				<td class="right"><input id="projectName" name="projectName"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">班级编号:</td>
				<td class="right"><input id="classNum" name="classNum"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">班级名称:</td>
				<td class="right"><input id="className" name="className"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">身份证:</td>
				<td class="right"><input id="cardId"
					name="cardId" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
			</tr>
			<tr>
				<td class="left">姓名:</td>
				<td class="right"><input id="userName"
					name="userName" class="easyui-textbox" size="20"
					data-options="" style="height:22px">
				</td>
				<td class="left">证书编号:</td>
				<td class="right"><input id="certificateNum" name="certificateNum"
					class="easyui-textbox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">证书名称:</td>
				<td class="right"><input class="easyui-textbox" id="certificateName"
					name="certificateName" data-options="showSeconds:false"
					value="" size="20" style="width:138px"></td>
				<td class="left">证书类型:</td>
				<td class="right"><input class="easyui-textbox" id="certificateType"
					name="certificateType" data-options="showSeconds:false"
					value="" size="20" style="width:138px"></td>
			</tr>
			<tr>
				<td class="left">发证时间(开始):</td>
				<td class="right"><input id="certificateTimeBegin"
					name="certificateTimeBegin" class="easyui-datebox" size="20"
					data-options="" style="height:22px">
				</td>
				<td class="left">发证时间(结束):</td>
				<td class="right"><input id="certificateTimeEnd" name="certificateTimeEnd"
					class="easyui-datebox" size="20" data-options=""
					style="height:22px">
				</td>
				<td class="left">有效期至(开始):</td>
				<td class="right"><input class="easyui-datebox" id="expiryDateBegin"
					name="expiryDateBegin" data-options=""
					value="" size="20" style="width:138px"></td>
				<td class="left">有效期至(结束):</td>
				<td class="right"><input class="easyui-datebox" id="expiryDateEnd"
					name="expiryDateEnd" data-options=""
					value="" size="20" style="width:138px"></td>
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
