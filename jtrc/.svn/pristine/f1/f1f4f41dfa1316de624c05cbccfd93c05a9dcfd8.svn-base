<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
    </script>

<body style="margin: 1px;">
<form id="htForm"  method="post" enctype="multipart/form-data">
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">
    <div class="easyui-panel" data-options="region:'north',border:false" style="padding:5px">
	<table>   
		<tr>
			<td><input class="easyui-textbox"  id="key" name="key"/></td>
			<td><a onclick="searchHtGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
		</tr>
	</table>
	</div>
    <div data-options="region:'center',title:'合同模板列表',border:false" style="">
        <table id="htGrid"></table>
    </div>
    <div class="easyui-panel" data-options="region:'south',border:true" style="padding:5px">
    <table width="100%">   
		<tr style="text-align: left;align:left;width:100%">
		    <td width="13%">合同文件：</td>
			<td style="text-align: left;align:left;"  width="87%">
			<input id ="file" name="file" data-options="buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true" class="easyui-filebox" size="40" value=""  style="height:22px">  
			</td>
		</tr>
		<tr>
		    <td style="color:red;" colspan="2">*只允许上传DOC、DOCX文件，且大小不超过5M</td>
		</tr>
	</table>
	</div>
</div>
</form>	
</body>
</html>
