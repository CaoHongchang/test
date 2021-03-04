<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
   <title>填写快递单号</title>
</head>

<body>
	<form id="fm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">
						业务编码
					</td>
					<td class="right">
						<input id="code" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						业务名称
					</td>
					<td class="right">
						<input id="typeName" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
				</tr>
				<tr>
					<td class="left">
						业务分类
					</td>
					<td class="right">
						<input id="typeName" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						材料递送方向
					</td>
					<td class="right">
						<input id="typeName" class="easyui-textbox" size="20"
							data-options="required:true" style="height: 22px">
					</td>
				</tr>
				<tr>
                    <td class="left">业务说明</td>
                    <td class="right" colspan="3" style="height: 200px;width:90px;">
                        <div id="aa" class="easyui-accordion" style="height:180px;">   
	                        <div title="工具栏" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;">   
	                        </div>   
                        </div> 
                    </td>
                 </tr>
			</table>
		</div>
	</form> 
</body>

</html>

