<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){

 
 var param=$("#searchForm").serializeArray();
 var shType=$('#shType').val();

 if(shType=='1'){
    $('#slshSearchInfo').dialog('close');
    ywslshFun(JSON.stringify(param));
 }
 if(shType=='2'){
    $('#glywSearchInfo').dialog('close');
    glywFuc(JSON.stringify(param));
 }
 if(shType=='3'){
    $('#hygsSearchInfo').dialog('close');
    hygsFuc(JSON.stringify(param));
 }
 if(shType=='4'){
    $('#xgshSearchInfo').dialog('close');
    xgbmFuc(JSON.stringify(param));
 }
  if(shType=='5'){
    $('#ldshSearchInfo').dialog('close');
    ldshFuc(JSON.stringify(param));
 }
 
 
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <input type="hidden" id="shType" name="shType"><!-- 审核环节 -->
	 <table class="tableSearch">
             <tr>
		      <td class="left">受理编号:</td>
		      <td class="right"><input id ="pno" name="pno"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">受理人:</td>
		      <td class="right"><input id ="username" name="username"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">审核状态:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="sstate" name="sstate" data-options="editable:false"  style="width:135px;">   
			   <option value="">全部</option>
			   <option value="0">已受理</option>
			   <option value="1">驳回</option> 
			   <option value="2">已审核</option>   
			   <option value="3">审核失败</option> 
			   <option value="4">未审核</option> 
			   <option value="5">办结</option>   
			   </select> 
		      </td>
		       <td class="left">审核意见:</td>
		      <td class="right"><input id ="remark" name ="remark"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		    
		     
		      </tr>
		      <tr>
		       <td class="left"></td>
		     <td class="right" colspan="7">
		     	<a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		     	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		     
		     </td>
		      </tr>
		      <!--  <tr>
		        <td class="left">姓名:</td>
		      <td class="right"><input id ="xm" name ="xm" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">出生年月:</td>
		      <td class="right"><input class="easyui-datebox" id="startBirthday" name="startBirthday"  data-options="showSeconds:false" onfocus="alert('')" value=""size="20" style="width:138px"> </td>
		       <td class="left">至:</td>
		      <td class="right"><input class="easyui-datebox" id="endBirthday" name="endBirthday"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
		      <td class="left">性别:</td>
		      <td class="right"> 
		      <select  class="easyui-combobox" id="xb" name="xb" data-options="editable:false"  style="width:135px;">   
			   <option value="男">男</option>
			   <option value="女">女</option>   
			   </select> 
	         </td>
	         
		       </tr> -->
		       
		       <!--  <tr>
		      <td class="left">用工形式:</td>
		      <td class="right"> 
		      <input id ="zhmc2"  class="easyui-textbox" id="ygxs" name="ygxs"  size="20" data-options="" style="height:22px">
	         </td> 
		         <td class="left">审核状态:</td>
		      <td class="right"> 
		      <select  class="easyui-combobox" data-options="editable:false"  id="shzt" name="shzt" style="width:135px;">   
			   <option value="0">未审核</option>
	           <option value="1">已审核</option>     
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
		      </tr>  -->
            </table>
</form>
</body>

</html>
