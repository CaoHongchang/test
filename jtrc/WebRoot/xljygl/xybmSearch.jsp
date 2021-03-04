<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>查询</title>

<body>
<script type="text/javascript">
function searchFun(){
 $('#xybmSearchInfo').dialog('close');
 var param=$("#searchForm").serializeArray();
 queryXygl(JSON.stringify(param));
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
 var url2 = basePath+'xljy/getDataItemValueByName?attName=learn_type';  
            $.ajax({  
		    type:'post',  
		    url:url2,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			$('#learnType1').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            
//学习形式
var  url3 = basePath+'xljy/getDataItemValueByName?attName=source_type';  
            $.ajax({  
		    type:'post',  
		    url:url3,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			$('#sourceType').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
            
            //学习形式
var  url4 = basePath+'xljy/getDataItemValueByName?attName=is_want';  
            $.ajax({  
		    type:'post',  
		    url:url4,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data);
			$('#isWant').combobox('loadData',result);  
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
		       <td class="left">身份证</td>
		      <td class="right"><input class="easyui-textbox" id="pnum" name="pnum"  data-options="" size="20"> </td>
		       <td class="left">信息来源</td>
		      <td class="right">
		         <select  class="easyui-combobox" id="sourceType" name="sourceType" data-options="valueField:'value',textField:'name',editable:false"  style="width:135px;">   
			   </select> 
		      <td class="left">是否录取</td>
		      <td class="right"> 
		        <select  class="easyui-combobox" id="isWant" name="isWant" data-options="valueField:'value',textField:'name',editable:false"  style="width:135px;">   
			    </select>
	           </td>
		       </tr>
		       
		       
		     <tr>
		        <td class="left"></td>
		      <td class="right"></td>
		       <td class="left"></td>
		      <td class="right"></td>
		       <td class="left"></td>
		      <td class="right">
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
