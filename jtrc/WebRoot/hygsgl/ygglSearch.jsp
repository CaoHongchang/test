<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#yyglSearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryYygl(JSON.stringify(param));
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
		       <td class="left">出生年月:</td>
		      <td class="right"><input class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM',readOnly:true})" id="startBirthday" name="startBirthday"   value=""size="20" style="width:138px"> </td>
		       <td class="left">至:</td>
		      <td class="right"><input class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM',readOnly:true})" id="endBirthday" name="endBirthday"   value="" size="20" style="width:138px">  </td>
		      <td class="left">性别:</td>
		      <td class="right"> 
		      <select  class="easyui-combobox" id="xb" name="xb" data-options="editable:false"  style="width:135px;">   
			   <option value="">全部</option>
			   <option value="男">男</option>
			   <option value="女">女</option>   
			   </select> 
	         </td>
	         
		       </tr>
		       
		        <tr>
		      <td class="left">用工形式:</td>
		      <td class="right"> 
		      <input  class="easyui-textbox" id="ygxs" name="ygxs"  size="20" data-options="" style="height:22px">
	         </td> 
		         <td class="left">审核状态:</td>
		      <td class="right"> 
		      <select class="easyui-combobox" data-options="editable:false"  id="shzt" name="shzt" style="width:135px;">   
			   <option value="">全部</option>
			   <option value="1">审核通过</option>
	           <option value="2">审核未通过</option>     
			   </select> 
	         </td>
		       <td class="left">审核意见:</td>
		      <td class="right"><input id ="shyj" name="shyj"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">
		       <a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		       </td>
		      <td class="right">
		      	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		      
		      </td>
		      </tr> 
            </table>
</form>
</body>

</html>
