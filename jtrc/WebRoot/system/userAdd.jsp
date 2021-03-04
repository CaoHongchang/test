<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>平台账号新增</title>

<body>
<script type="text/javascript">
$('#username').textbox({    
 onChange: function(newValue,oldValue){    
             if(newValue!=''){
               $.post('../users/isUserNameExist',{username:$('#username').val()},function(result){
                   if(result.flag){
                      $.messager.alert('系统提示','该账户名称已经存在！','error');
                      $('#username').textbox('setValue','');
                   }
               },'json');
           }
        }
  
});

</script>
	<form id="fm" method="post" >

   <div>
    <table class="tableUserAdd">
      <tr>
      <td class="left">账户名称</td>
      <td> <input id ="username" name="username" class="easyui-textbox" data-options="required:true" style="width:100%;height:22px"> </td>
      </tr>
      <tr>
      <td class="left">密码</td>
      <td><input class="easyui-textbox" name="password" data-options="required:true" style="width:100%;height:22px"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td><input class="easyui-textbox" name="realName" data-options="required:true" style="width:100%;height:22px"></td>
      </tr>
      <tr>
      	<td class="left">公司</td>
      	<td class="right"><input class="easyui-combotree" name="enterpriseId" data-options="url:'../zzgl/listOrgMenuTree',onSelect:function(node){
		    $.post('../zzgl/listDeptInfo',{orgId:node.id},function(result){
		       $('#departmentId').combobox('loadData',result.rows);
		       if(result.rows.length==0){
		           $('#departmentId').combobox('clear');
		       }
		    },'json');
      	}" style="width:100%;height:22px"/></td>
      </tr>
      <tr>
        <td class="left">部门</td>
        <td class="right"><input class="easyui-combobox" id="departmentId" name="departmentId" data-options="editable:false" style="width:100%;height:22px" /></td>
      </tr>
      </table>   
     
       <table id="userAddGrid"  data-options="
				iconCls: 'icon-edit',
				singleSelect: true"></table>
        </div>
        	<div id="userAddTool" style="background-color:#FFFFFF">
		     <a onclick="startUsing()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">启动/关闭</a>
	        </div>
    </form> 
<script type="text/javascript">
     $(function(){
    	  $('#departmentId').combobox({valueField:'id1',textField:'deptName'});
     });
</script>
</body>

</html>
