<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#searchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 setListDate(JSON.stringify(param),"");
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
	 		 <tr>
	 		 	<td class="left">申报开始时间:</td>
		        <td class="right"><input class="easyui-datetimebox" id="sb_date" name="sb_date" size="20" style="width:138px"> </td>
	 		 	<td class="left">申报结束时间:</td>
	 		 	<td class="right"><input class="easyui-datetimebox" id="se_date" name="se_date" style="width:138px"> </td>
	 		 	<td class="left">姓名:</td>
	 		 	<td class="right"><input id ="u1_name" name="u1_name"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
	 		 	<td class="left">身份证号:</td>
	 		 	<td class="right"><input id ="pnum" name="pnum"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
	 		 </tr>
	 		 <tr>
	 		 	<td class="left">申报级别:</td>
	 		 	<td class="right"><input id ="s_level" name="s_level"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
	 		 	<td class="left">申报资格名称:</td>
	 		 	<td class="right"><input id="s_name" name="s_name" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
				<td class="left">申报专业:</td>
	 		 	<td class="right"><input id ="s_pro" name="s_pro"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      	<td class="left">审核状态:</td>
		      	<td class="right">
		      	<select  class="easyui-combobox" id="s_state" name="s_state" data-options="editable:false"  style="width:135px;">
		      	    <option value="">全部</option>
	 		 		<option value="0">未审核</option>
	 		 		<option value="1">已审核</option>
	 		 		<option value="2">审核失败</option>
			   </select> 
			   </td>
	 		 </tr>
             <tr>
		      <td class="left">审核说明:</td>
		      <td class="right"><input id ="remark" name="remark"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">审核人:</td>
		      <td class="right"><input id ="sh_name" name="sh_name"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">审核开始时间:</td>
		        <td class="right"><input class="easyui-datebox" id="sh_b_date" name="sh_b_date"  data-options="showSeconds:true" readonly="readonly" size="20" style="width:138px"> </td>
	 		 	<td class="left">审核结束时间:</td>
	 		 	<td class="right"><input class="easyui-datebox" id="sh_e_date" name="sh_e_date"  data-options="showSeconds:true" readonly="readonly" size="20" style="width:138px"> </td></tr>
		       <tr>
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
