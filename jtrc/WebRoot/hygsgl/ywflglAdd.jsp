<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>业务分类新增</title>

<body>
<script type="text/javascript">
//保存
function saveYwflFuc(){
    var r = $("#ywflForm").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#ywflForm").serializeArray();
 param=JSON.stringify(param); 
 
$("#ywflForm").ajaxSubmit({ 
		
			url : basePath+"ywfl/addYwfl",
			async : true,
			 data: {
                'param': param
            },
			success : function(data) {
			if(data.flag ==true){
			    
			    $('#ywflGrid').datagrid('reload');
			    $.messager.alert('提示信息','操作成功！','info');
			    //$('#ywflglAddInfo').dialog('close');
			     /* $.messager.show({
			title:'提示信息',
			msg:'操作成功',
			showType:'show',
			timeout:2000 
			});*/
			
			}else{
			   $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}

</script>



	<form id="ywflForm" method="post">
   <input type="hidden" id="id" name="id">
    <table class="table3">
      <tr>
      <td class="left">分类编码</td>
      <td class="right"><input id ="pno" name="pno" class="easyui-textbox" size="60"  data-options="required:true,readonly:true" style="height:22px;width:375px"></td>
      </tr>
      <tr>
      <td class="left">分类名称</td>
      <td class="right" style=""><input id ="name" name="name" class="easyui-textbox" size="60"  data-options="required:true,validType:['length[0,50]']" style="height:22px;width:375px"></td>
      </tr>
      <tr>
      <td class="left">业务对象</td>
      <td class="right" >
      <select id="objectName" class="easyui-combobox" data-options="editable:false" name="objectName" style="width:375px;"> 
       <!--<option value="">请选择</option>-->
       <option value="个人">个人</option>
       <option value="企业">企业</option>
       </select>   

      
      </td>
      </tr> 
     
   
      
      </table>  
      
      
       

    </form> 

</body>

</html>
