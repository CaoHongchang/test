<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#ywflSearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryYwfl(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
             <tr>
		      <td class="left">分类编码:</td>
		      <td class="right"><input id ="pno" name="pno"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">分类名称:</td>
		      <td class="right"><input id ="name" name="name"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">业务对象:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="objectName" name="objectName" data-options="editable:false"  style="width:135px;">   
			   <option value=""></option>
			  <option value="个人">个人</option>
              <option value="企业">企业</option>    
			   </select> 
		      </td>
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
