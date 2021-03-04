<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
   <title>业务分类新增</title>
</head>

<body>
	<div>
		<table class="table2">
			<tr>
				<td class="left">
					分类编码
				</td>
				<td class="right">
					<input id="pnoAdd" class="easyui-textbox" size="20" readonly="readonly" disabled="disabled"
						data-options="required:true" style="height: 22px">
				</td>
			</tr>
			<tr>
				<td class="left">
					分类名称
				</td>
				<td class="right">
					<input id="nameAdd" class="easyui-textbox" size="20"
						data-options="required:true" style="height: 22px">
				</td>
			</tr>
		</table>
	</div>
</body>

</html>