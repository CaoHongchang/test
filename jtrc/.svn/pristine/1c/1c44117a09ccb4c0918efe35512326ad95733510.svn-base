<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#zyjjSearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 zyjsFun(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
             <tr>
		      <td class="left">活动名称:</td>
		      <td class="right"><input id ="hdmc" name="hdmc"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">证书编号:</td>
		      <td class="right"><input id ="zsbh" name="zsbh"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">级别:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="jb" name="jb" data-options="editable:false"  style="width:135px;">   
			   <option value="">全部</option>
			   <option value="技术师">技术师</option>
				<option value="助理工程师">助理工程师</option>
				<option value="工程师">工程师</option>
				<option value="高级工程师">高级工程师</option>
				<option value="教授级工程师">教授级工程师</option>    
			   </select> 
		      </td>
		      <td></td>
		      <td></td>
		     
		      </tr>
		       <tr>
		        <td class="left">姓名:</td>
		      <td class="right"><input id ="xm" name ="xm" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">审批时间:</td>
		      <td class="right"><input class="easyui-datebox" id="startTime" name="startTime"  data-options="showSeconds:false"  value=""size="20" style="width:138px"> </td>
		       <td class="left">至:</td>
		      <td class="right"><input class="easyui-datebox" id="endTime" name="endTime"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
		      <td class="left"></td>
		      <td class="right"> 
		       <a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		       	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
	         </td>
	          
		       </tr>
		       
		        
            </table>
</form>
</body>

</html>
