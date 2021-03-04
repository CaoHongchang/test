<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>相关部门审核</title>

<body>
<script type="text/javascript">

 $("#sUid").val(sessionUserId);
 $("#sUname").val(sessionRealName);



//保存
function saveXgbmshFuc(){
    if(sessionUserId==null||sessionUserId==''){
    	$.messager.alert('提示','用户未登录无法操作！');
			return false;
    
    }
    var r = $("#xgbmshForm").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#xgbmshForm").serializeArray();
 param=JSON.stringify(param); 
 
$("#xgbmshForm").ajaxSubmit({ 
		
			url : basePath+"ywslsh/addYwsl",
			async : true,
			 data: {
                'param': param
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			   
			    $('#xgbmshglGrid').datagrid('reload');
			    
			}else{
			    $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}



	

$('#sstate').combobox({    
   onSelect: function(rec){
        if(rec.value=='3'){//审核失败
      
         $('#sMsg').textbox({required: true}); 
          $('#zdSUid').combobox({required: false}); 
          $('#zdSUid').combobox('setValue',''); 
          $('#zdSUid').combobox('readonly',true);
        
           $('#remark').combobox({required: false}); 
          $('#remark').combobox('setValue',''); 
          $('#remark').combobox('readonly',true);
         
        }
        if(rec.value=='2'){//已审核
       
         $('#sMsg').textbox({required:false}); 
        
          $('#remark').combobox('readonly',false);
          $('#remark').combobox({required: true});
          $('#remark').combobox('setValue','3');
        
        
          
            var url = basePath+'ywslsh/ywslUserData?roleId=3'; 
            $('#zdSUid').combobox('readonly',false);  
            $('#zdSUid').combobox('reload', url); 
            $('#zdSUid').combobox({required: true}); 
           
        }
        }
}); 

</script>
	<form id="xgbmshForm" method="post">
   <input type="hidden" id="id" name="id">
    <table class="table3">
      <tr>
      <td class="left">业务经办人</td>
      <td class="right">
      <input type="hidden" id="sUid" name="sUid" value="">
      <input id ="sUname" name="sUname"  class="easyui-textbox" size="60"  data-options="required:true,readonly:true" style="height:22px;width:375px"></td>
      </tr>
      <tr>
      <td class="left">审核状态</td>
      <td class="right" style="">
      <select id="sstate" class="easyui-combobox" name="sstate" style="width:375px;"data-options="" >  
      <option value="2" selected="selected">已审核</option> <!--0:已受理  1:驳回   2:已审核 3:审核失败4：未审核-->
      <option value="3">审核失败</option>
     
      </select></td>
      </tr>

      <tr>
      <td class="left">审核意见</td>
      <td class="right" >   
        <input id ="sMsg" name="sMsg" class="easyui-textbox" size="60"  data-options="multiline:true,validType:['length[0,150]']" style="height:60px;width:375px">
      </td>
      </tr>
      
      <tr>
      <td class="left" ><h1 style="color: red;">下一步转交</h1></td>
      <td class="right" >   
      </td>
      </tr>
      
       <tr>
      <td class="left">转交角色</td>
      <td class="right" style="">
      <select id="remark" class="easyui-combobox" name="remark" style="width:375px;"data-options="    
       editable:false,
        onSelect: function(rec){ 
         $('#zdSUid').combobox('setValue',''); 
            var roleId='-1';
            var v=rec.value;
            if(v=='1'){//受理人
             roleId='6';
            }
            else if(v=='2'){//关联业务经办人
             roleId='2';
            }
            else if(v=='3'){//宏业公司
            roleId='3';
            }
            else if(v=='4'){//指定相关部门
            roleId='4';
            }
            else if(v=='5'){//领导
            roleId='5';
            }
            var url = basePath+'ywslsh/ywslUserData?roleId='+roleId;  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    success:function(data) {
			//转成Json对象
			var result = eval(data)
			debugger;
			$('#zdSUid').combobox('loadData',result)  
		    },error : function(data) {
			   errorMsg();
		   }  
	        });
            
              
            //$('#zdSUid').combobox('reload', url);    
        }">
      <option value=""></option>
      <option value="3" selected="selected">宏业公司</option>
      
      </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">指定审核人</td>
      <td class="right" style="">
      <select id="zdSUid" class="easyui-combobox" name="zdSUid" style="width:375px;"data-options="valueField:'userId',textField:'userName',required:true,editable:false" >
      <option value=""></option>
      </select></td>
      </tr>
      </table>  
      
      
       

    </form> 

</body>

</html>
