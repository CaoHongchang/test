<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#gzglSearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryGzgl(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
             <tr>
		      <td class="left">组织机构代码:</td>
		      <td class="right"><input id ="zzjgdm" name="zzjgdm"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">企业名称:</td>
		      <td class="right"><input id ="qymc" name="qymc"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">企业性质:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="qyxz" name="qyxz" data-options="editable:false"  style="width:135px;">   
			   <option value="">全部</option>
			   <option value="0">私企</option>
			   <option value="1">国企</option> 
			   <option value="2">外企</option>   
			   <option value="3">合资</option>     
			   </select> 
		      </td>
		       <td class="left">身份证:</td>
		      <td class="right"><input id ="sfz" name ="sfz"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		     
		     
		      </tr>
		       <tr>
		        <td class="left">姓名:</td>
		      <td class="right"><input id ="xm" name ="xm" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">工资发放时间:</td>
		      <td class="right"><input class="easyui-datebox" id="startdate" name="startdate"  data-options="showSeconds:false" onfocus="alert('')" value=""size="20" style="width:138px"> </td>
		       <td class="left">至:</td>
		      <td class="right"><input class="easyui-datebox" id="enddate" name="enddate"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
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
