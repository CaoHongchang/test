<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#searchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryBjgl(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
             <tr>
		      <td class="left">班级编码:</td>
		      <td class="right"><input id ="pno" name="pno"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		      <td class="left">班级名称:</td>
		      <td class="right"><input id ="name" name="name"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">主办单位:</td>
		      <td class="right"><input id ="enterpriseName" name="enterpriseName"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">承办单位:</td>
		      <td class="right"><input id ="cEnterpriseName" name ="cEnterpriseName"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		     
		     
		      </tr>
		       <tr>
		        <td class="left">培训内容:</td>
		      <td class="right"><input id ="content" name ="content" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">培训对象:</td>
		      <td class="right"><input class="easyui-textbox" id="objId" name="objId"  data-options="showSeconds:false" onfocus="alert('')" value=""size="20" style="width:138px"> </td>
		       <td class="left">培训类别:</td>
		      <td class="right"><input class="easyui-textbox" id="typeId" name="typeId"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
		      <td class="left">培训期限:</td>
		      <td class="right"> 
		      <input class="easyui-textbox" id="pDate" name="pDate"  data-options="showSeconds:false" value="" size="20" style="width:138px">  
	         </td>
	         
		       </tr>
		        <tr>
		        <td class="left">本期人数:</td>
		      <td class="right"><input id ="pNum" name ="pNum" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">开班时间:</td>
		      <td class="right"><input class="easyui-datebox" id="sDate" name="sDate"  data-options="showSeconds:false" onfocus="alert('')" value=""size="20" style="width:138px"> </td>
		       <td class="left">结束时间:</td>
		      <td class="right"><input class="easyui-datebox" id="eDate" name="eDate"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
		      <td class="left">班级状态:</td>
		      <td class="right"> 
		      <select  class="easyui-combobox" id="cstate" name="cstate" data-options="editable:false,valueField: 'value',
		textField: 'label',
		data: [
		{
			label: '待报名',
			value: '1'
		},
		{
			label: '成绩录入',
			value: '2'
		},
		{
			label: '执行情况录入',
			value: '3'
		},
		{
			label: '培训结束',
			value: '4'
		}
		
		]"  style="width:135px;">
			   </select> 
	         </td>
	          
		       </tr>
		        <tr>
		        <td class="left">有效性:</td>
		      <td class="right"> 
		      <select  class="easyui-combobox" id="isValid" name="isValid" data-options="editable:false,textField: 'label',
			data: [
				{
					label: '有效',
					value: '1'
				},
				{
					label: '失效',
					value: '0'
				}
				 ]"  style="width:135px;">   
			   </select> 
	         </td>
		       <td class="center" colspan="6">
		       <a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		      	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		      
		      </td>
		      </tr> 
            </table>
</form>
</body>

</html>
