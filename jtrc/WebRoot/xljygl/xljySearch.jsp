<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#xljySearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryXljy(JSON.stringify(param));
}

function cleanFun(){
$("#searchForm").form('reset');

}


//报考层次
var url = basePath+'xljy/getDataItemValueByName?attName=register_level';  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			
			$('#registerLevel').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            

//学习形式
 url = basePath+'xljy/getDataItemValueByName?attName=learn_type';  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			$('#learnType1').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            
//有效性
 url = basePath+'xljy/getDataItemValueByName?attName=academic_status';  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);			
			$('#academic_status1').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });

</script>
	 <form id="searchForm" method="post"> 
	 <table class="tableSearch">
             <tr>
		      <td class="left">教育编码:</td>
		      <td class="right"><input id ="educationNum" name="educationNum"  class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		     
		       <td class="left">报考层次:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="registerLevel" name="registerLevel" data-options="valueField:'value',textField:'name',editable:false"  style="width:135px;">   
			    
			   </select> 
		      </td>
		      
		      <td class="left">学习形式:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="learnType1" name="learnType1" data-options="valueField:'value',textField:'name',editable:false"  style="width:135px;">   
			    
			   </select> 
		      </td>
		      
		       <td class="left">报考学校:</td>
		      <td class="right"><input id ="educationSchool" name="educationSchool"   class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left"></td>
		      <td class="right"></td>
		     
		     
		      </tr>
		       <tr>
		        <td class="left">报考专业:</td>
		      <td class="right"><input id ="educationMajor" name ="educationMajor" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		       <td class="left">开始时间:</td>
		      <td class="right"><input class="easyui-datebox" id="startTime" name="startTime"  data-options="showSeconds:false" onfocus="alert('')" value=""size="20" style="width:138px"> </td>
		       <td class="left">结束时间:</td>
		      <td class="right"><input class="easyui-datebox" id="endTime" name="endTime"  data-options="showSeconds:false" value="" size="20" style="width:138px">  </td>
		      <td class="left">有效性</td>
		      <td class="right"> 
		           <select  class="easyui-combobox" id="academic_status1" name="academic_status1" data-options="valueField:'value',textField:'name',editable:false"  style="width:135px;">   
			   </select>
	          </td>
	          
	          
	          
		       </tr>
		       
		        <tr>
		        <td colspan="8" style="text-align: center;">
		            <a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		        	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		        <td>
		        </tr>  
            </table>
</form>
</body>

</html>
