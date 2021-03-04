<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#searchInfo').dialog('close');
 var params=$("#searchForm").serializeArray();
 var param={};
	$.each(params,function(index,value){
		param[value.name]=value.value;
	});
 $('#zjGrid').datagrid('load',param);
 $("#searchForm").form('reset');
}

function cleanFun(){
$("#searchForm").form('reset');
}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
	 		 <tr>
				<td class="left">专家编码:</td>
	 		 	<td class="right">
	 		 	 <input id ="zpno_serch" name="zpno_serch"  class="easyui-textbox"  size="20" data-options="" style="height:22px"> 
			  	</td>
	 		 	<td class="left">专家姓名:</td>
	 		 	<td class="right">
	 		 	 <input id="zj_name_serch" name="zj_name_serch" class="easyui-textbox"  size="20" data-options="" style="height:22px"> 
	 		 	</td>
	 		 </tr>
	 		 <tr>
	 		 	<td class="left">专家身份证号:</td>
		        <td class="right"><input class="easyui-textbox" id="pnum_serch" name="pnum_serch" size="20" style="width:138px"> </td>
		      	<td class="left">专家专业类别:</td>
		        <td class="right"><input class="easyui-textbox" id="pro_type_serch" name="pro_type_serch"   size="20" style="width:138px"> </td>
	 		 </tr>
	 		<tr>
	 			<td class="left">专家资格级别:</td>
	 		 	<td class="right"><input class="easyui-textbox" id="zg_level_serch" name="zg_level_serch"  size="20" style="width:138px"> </td>
	 		</tr>
		      <tr>
		      		<td class="center" colspan="6">
		       		<a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		      		<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		      </td>
		      </tr>
            </table>
</form>
</body>

</html>
