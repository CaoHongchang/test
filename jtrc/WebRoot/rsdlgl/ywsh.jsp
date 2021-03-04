<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
   <title>业务审核</title>
</head>

<body>
	<form id="fm" method="post">
	    <input type="hidden" name="id" id="id"/>
		<div id="tb">
			<table class="table2" id="shTable">
				<tr>
					<td class="left">
						发起时间:
					</td>
					<td class="right">
						<input name="addDate" id="addDate" type="text" readonly="readonly"/>
					</td>
					<td class="left">
						发起人:
					</td>
					<td class="right">
						<input name="userName" id="userName" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="left">
						身份证号:
					</td>
					<td class="right">
						<input name="pnum" id="pnum" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="left">
						业务分类:
					</td>
					<td class="right">
						<input name="typeName" id="typeName" type="text" readonly="readonly"/>
					</td>
					<td class="left">
						业务名称:
					</td>
					<td class="right">
						<input name="businessName" id="businessName" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="left">
						快递公司:
					</td>
					<td class="right">
						<input name="kCompany" id="kCompany" type="text" readonly="readonly"/>
					</td>
					<td class="left">
						快递单号:
					</td>
					<td class="right">
					    <input name="kpno" id="kpno" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="left">
						寄出时间:
					</td>
					<td class="right">
						<input name="kDate" id="kDate" type="text" readonly="readonly"/>
					</td>
				</tr>
			    <tr>
                    <td class="left">其他说明：</td>
                    <td class="right" colspan="3" >
                        <input class="easyui-textbox" name="remark" id="remark" data-options="multiline:true" readonly="readonly"  style="width:100%;height:100px">
                    </td>
                 </tr>
          </table>
          <table class="table2">
				<tr>
					<td class="left">
						审核结果：
					</td>
					<td class="right">
						<select name="shState" id="shState" editable="false" class="easyui-combobox" data-options="required:true" style="width:150px;height: 22px">
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="left">
						审核意见：
					</td>
					<td class="right" colspan="3">
						<input maxlength="150" class="easyui-textbox" name="sider" id="sider" data-options="multiline:true,required:true" style="width:100%;height:100px">
					</td>
				</tr>
			</table>
			<label style="margin-left: 120px;" >审核意见仅限150字</label>
		</div>
	</form> 
</body>

</html>

