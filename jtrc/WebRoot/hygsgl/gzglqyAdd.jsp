<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>工资新增</title>

<body>
<script type="text/javascript">
 $("#sUid").val(sessionUserId);
 
//新增保存
function saveSygzxz(){
    var r = $("#gzqyForm2").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#gzqyForm2").serializeArray();
 param=JSON.stringify(param); 
 
$("#gzqyForm2").ajaxSubmit({ 
		
			url : basePath+"gzgl/addGzQy",
			async : true,
			 data: {
                'param': param
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			    $('#gzglGrid').datagrid('reload');
			    $('#gzglInfo').dialog('close');
			    
			}else{
			  $.messager.alert('错误','操作失败！'+data.cause,'error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}

//修改保存
function saveEditgz(){
    var r = $("#gzqyForm2").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#gzqyForm2").serializeArray();
 param=JSON.stringify(param); 
 
$("#gzqyForm2").ajaxSubmit({ 
		
			url : basePath+"gzgl/addQyGzEdit",
			async : true,
			 data: {
                'param': param
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			    $('#gzglGrid').datagrid('reload');
			    $('#gzglInfo').dialog('close');
			    
			}else{
			  $.messager.alert('错误','操作失败！'+data.cause,'error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}


//根据身份证获取用户信息
function getGzMsg(id,gzlxId){

 //页面表单数据加载
     $.ajax({
                url: basePath+"gzgl/queryGz?id="+id+"&gzlxId="+gzlxId,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
                $("#gzqyForm2").form('load', data.rows);//赋值给表单
               
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });


}
</script>


		<form id="gzqyForm2" method="post">
     <input type="hidden" id="sUid" name="sUid"><!-- 登录id -->		
	 <input type="hidden" id="id" name="id">	<!-- 工资id -->	
     <input type="hidden" id="enterpriseId" name="enterpriseId"> <!-- 企业id -->
     <input type="hidden" id="uid" name="uid"> <!-- 工资用户id -->
    <div id="aa" class="easyui-accordion" style="height:150px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">工资发放时间</td>
      <td class="right">
      <input id ="salaryDate" name ="salaryDate"  class="easyui-datebox"  size="20" data-options="required:true,validType:'date'" style="height:22px">
	</td>
      <td class="left">企业名称</td>
      <td class="right"><select id ="qymc" name ="qymc" class="easyui-combobox" data-options="required:true" style="width:135px;">   
	   
	   </select></td>
      </tr>
      <tr>
      <td class="left">企业性质</td>
      <td class="right">
      <select id ="qyxz" name ="qyxz" class="easyui-combobox" data-options="required:true,readonly:true"  style="width:135px;">   
	   </select></td>
      
    <td class="left">身份证</td>
      <td class="right">
<!--       <input class="easyui-validatebox textbox" id ="sfz" name ="sfz" onBlur=""  size="20" data-options="required:true,validType:'idcard'" style="height:22px">
 -->     
      <select id ="sfz" name ="sfz" class="easyui-combobox" data-options="required:true,validType:'idcard'"  style="width:135px;">   
	   </select>
     </td>
      
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input class="easyui-textbox" id ="xm" name ="xm"  size="20" data-options="required:true,readonly:true"  style="height:22px"></td>
     <td class="left">性别</td>
      <td class="right">
      <select class="easyui-combobox" data-options="required:true,readonly:true" id ="xb" name ="xb" style="width:135px;">   
	   </select>
      </td>
      </tr>
     
      </table>  

      </div>   
   
       </div>

       <div id="aa" class="easyui-accordion" style="height:280px;">   
       <div title="工资状况" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
             
      <table class="table2">
      <tr>
      <td class="left">职务岗位</td>
      <td class="right">
      <input id ="pos" name="pos"  class="easyui-textbox"  size="20" data-options="validType:['length[0,50]']" style="height:22px">
	</td>
      <td class="left">基本工资</td>
      <td class="right"> <input id ="salaryBase" name="salaryBase"  class="easyui-textbox"  size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">工龄工资</td>
      <td class="right">
     <input id ="salary" name="salary" class="easyui-textbox"  size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
       <td class="left">津贴补贴</td>
      <td class="right"><input id="allowance" name="allowance" class="easyui-textbox"   size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">月奖金</td>
      <td class="right"><input class="easyui-textbox" id="subsistence" name="subsistence" size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
     <td class="left">加班工资</td>
      <td class="right">
    <input class="easyui-textbox" id="basic" name="basic" size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px">
      </td>
      </tr>
     
     <!--  <tr>
      <td class="left">保留工资</td>
      <td class="right"><input class="easyui-textbox" id="keepSalary" name="keepSalary" size="20" data-options="required:true,validType:'intOrFloat'" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
     <td class="left">其他工资</td>
      <td class="right">
    <input class="easyui-textbox"  size="20" id="otherWages" name="otherWages" data-options="required:true,validType:'intOrFloat'" missingMessage="该输入项必须为数值" value="0" style="height:22px">
      </td>
      </tr> -->
      
       <tr>
      <td class="left">绩效工资</td>
      <td class="right"><input class="easyui-textbox" id="higher" name="higher"  size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
     <td class="left">其他工资1</td>
      <td class="right">
    <input class="easyui-textbox" id="keepSalary" name="keepSalary" size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0"  style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">其它工资2</td>
      <td class="right"><input class="easyui-textbox" id="otherWages" name="otherWages"  size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0" style="height:22px"></td>
     <td class="left">其它</td>
      <td class="right">
    <input class="easyui-textbox" id="other" name="other" size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0"  style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">工资总额</td>
      <td class="right"><input class="easyui-textbox" id="allSalary" name="allSalary"  size="20" data-options="required:true,validType:['intOrFloat','length[0,11]']" missingMessage="该输入项必须为数值" value="0"  style="height:22px"></td>
     <td class="left"></td>
      <td class="right">
   
      </td>
      </tr>
      </table>  
             
             
              
              </div>
              </div>

             
    </form> 

</body>

</html>
