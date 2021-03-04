<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">


	
	
	$.ajax({
   		url:basePath+"zcps/queryPageList",
   	    dataType: 'JSON',
   	    data: {page:1,rows:1000},
   	    type: "POST",   //请求方式
   	    success: function(data) {
   	    	if(data){
   	    		$("#activityId").combobox("loadData", data.rows);
   	    	}
   	    }
	});
	



function searchFun(){
 $('#searchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 setListDate(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
	 		 <tr>
	 		 	<td class="left">姓名:</td>
	 		 	<td class="right"><input id ="u1_name" name="u1_name"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
	 		 	<td class="left">身份证号:</td>
	 		 	<td class="right"><input id ="pnum" name="pnum"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
				<td class="left">申报类别:</td>
	 		 	<td class="right">
	 		 	<!-- <input id ="s_type_id" name="s_type_id"  class="easyui-textbox"  size="20" data-options="" style="height:22px"> -->
	 		 	<select  class="easyui-combobox" id="s_type_id" name="s_type_id" data-options="editable:false"  style="width:135px;">   
	 		 		<option value="">全部</option>
	 		 		<option value="职称评审">职称评审</option>
					<option value="职称确认">职称确认</option>
			   </select> 
			   </td>
	 		 	<td class="left">申报资格级别:</td>
	 		 	<td class="right">
	 		 	<!-- <input id="s_level" name="s_level" class="easyui-textbox"  size="20" data-options="" style="height:22px"> -->
	 		 	<select  class="easyui-combobox" id="s_level" name="s_level" data-options="editable:false"  style="width:135px;">   
	 		 		<option value="">全部</option>
	 		 		<option value="初级">初级</option>
					<option value="中级">中级</option>
					
					<option value="副高级" >副高级</option>
					<option value="正高级" >正高级</option>
			   </select> 
	 		 	
	 		 	</td>
	 		 </tr>
	 		 	<tr>
	 		 	<td class="left">论文题目:</td>
		        <td class="right"><input class="easyui-textbox" id="dissetation_name" name="dissetation_name" size="20" style="width:138px"> </td>
		      	<td class="left">刊出交流开始时间:</td>
		        <td class="right"><input class="easyui-datebox" id="j_b_date" name="j_b_date"  data-options="showSeconds:true" readonly="readonly" size="20" style="width:138px"> </td>
	 		 	<td class="left">刊出交流结束时间:</td>
	 		 	<td class="right"><input class="easyui-datebox" id="j_e_date" name="j_e_date"  data-options="showSeconds:true" readonly="readonly" size="20" style="width:138px"> </td>
	 		 	<td class="left">活动选择:</td>
	 		 	<td class="right">
	 		 	<!-- <input id="s_level" name="s_level" class="easyui-textbox"  size="20" data-options="" style="height:22px"> -->
	 		 	<select  class="easyui-combobox" id="activityId" name="activityId" data-options="editable:false,valueField:'id', textField:'name'"   style="width:135px;">   
			   </select> 
	 		 	
	 		 	</td>
	 		 </tr>
	 		 <tr>
	 		 	<td class="left">刊出交流情况:</td>
	 		 	<td class="right"><input id ="j_msg" name="j_msg"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
	 		 	<td class="left">是否作为送审:</td>
	 		 	<td class="right">
					<select  class="easyui-combobox" id="is_send" name="is_send" data-options="editable:false"  style="width:135px;">   
	 		 		<option value="1">是</option>
	 		 		<option value="0">否</option>
			   </select> 
				</td>
				<td class="left">被分配次数:</td>
	 		 	<td class="right"><input id ="f_num" name="f_num"  class="easyui-textbox"  size="20" style="height:22px">
	 		 	</td>
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
