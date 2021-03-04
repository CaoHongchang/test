<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>开设课程</title>

<body>
<script type="text/javascript">

 $("#uid").val(sessionUserId);



//保存
function saveKsbjFuc(){
    var r = $("#xsbjForm").form('enableValidation').form('validate');
    
	if(!r) {
		return false;
	}
var editor = CKEDITOR.instances.remark1;
             editor.updateElement();
$("#remark").val(editor.getData());

 var param=$("#xsbjForm3").serializeArray();
 param=JSON.stringify(param); 

 
 var id=$('#id').val();
$("#xsbjForm3").ajaxSubmit({ 
		
			url : basePath+"xljy/addKsbj",
			async : false,
			 data: {
                'param': param,
                //'fjParam': fjParam,
                'id':id
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			    $('#xljyInfo').dialog('close');
			     $('#xljyGrid').datagrid('reload');
			    
			}else{
			   $.messager.alert('错误','操作失败！'+data.cause,'error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}
/* var educationNum='JY'+randomNum(5);
$('#educationNum').val(educationNum);	
$('#educationNum1').val(educationNum);	
 */
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
			$('#learnType').combobox('loadData',result);  
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
			$('#status').combobox('loadData',result);  
		    },error : function(data) {
			   errorMsg();
		   }  
	      });


</script>
 <div style="display: none;" id="fileQueue"></div>
	<form id="xsbjForm3" method="post">
    <input id="id" name="id" type="hidden">
    <input id="uid" name="uid" type="hidden">
    <table class="table3">
      <tr>
      <td class="left">教育编号</td>
     
      <td class="right">
     
      <input id ="educationNum" name="educationNum" class="easyui-textbox" size="100" style="width:615px;"  data-options="readonly:true" style="height:22px">
      </td>
      </tr> 
       <tr>
      <td class="left">报考层次</td>
      <td class="right">
      <select id="registerLevel" id="registerLevel" name="registerLevel"   data-options="valueField:'value',textField:'name',required:true,editable:false" class="easyui-combobox"  style="width:615px;">   
        
      </select>
      </td>
      </tr>
      
      <tr>
      <td class="left">学习形式</td>
      <td class="right">
      <select  id="learnType" name="learnType"   data-options="valueField:'value',textField:'name',required:true,editable:false" class="easyui-combobox"  style="width:615px;">   
      </select>
      </td>
      </tr>
      
      <!-- <tr>
      <td class="left">有效性</td>
      <td class="right">
      <select id="status" name="status"   data-options="valueField:'value',textField:'name',required:true,editable:false" class="easyui-combobox"  style="width:615px;">   
      </select>
      </td>
      </tr> -->
      
      
      
      <tr>
      <td class="left">报考院校</td>
      <td class="right" style=""><input id ="educationSchool" name="educationSchool" class="easyui-textbox" size="100" style="width:615px;" data-options="required:true,validType:['length[0,150]']" style="height:22px"> </td>
      </tr>
      
      
       <tr>
      <td class="left">报考专业</td>
      <td class="right" style=""><input id ="educationMajor" name="educationMajor" class="easyui-textbox" size="100" style="width:615px;" data-options="required:true,validType:['length[0,150]']" style="height:22px"> </td>
      </tr>
      
       <tr>
      <td class="left">开始时间</td>
      <td class="right" style=""><input class="easyui-datebox" id ="startTime" name="startTime" size="100" style="width:615px;" data-options="required:true" style="height:22px"></td>
      </tr>
     
       <tr>
      <td class="left">结束时间</td>
      <td class="right" style=""><input class="easyui-datebox" id ="endTime" name="endTime"  size="100" style="width:615px;" data-options="required:true" style="height:22px"></td>
      </tr>
           
     <tr>
      <td class="left">招生简章</td>
      <td class="right"  style="height: 150px;padding-left: 60px;padding-right: 60px">
         <input id="remark" name="remark" type="hidden">
      <textarea name="remark1" cols="" rows="10" id="remark1" class="span1-2" >
		</textarea>
      </td>
      </tr> 
       </table>  
      </form> 

       
       

    

</body>

</html>
