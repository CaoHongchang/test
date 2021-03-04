<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>业务受理</title>

<body>
<script type="text/javascript">

 $("#sUid").val(sessionUserId);
  $("#sUname").val(sessionRealName);
//保存
function saveYwflFuc(){
  if(sessionUserId==null||sessionUserId==''){
    	$.messager.alert('提示','用户未登录无法操作！');
			return false;
    
    }
    var r = $("#ywslForm").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#ywslForm").serializeArray();
 param=JSON.stringify(param); 
$("#ywslForm").ajaxSubmit({ 
		
			url : basePath+"ywslsh/addYwsl",
			async : true,
			 data: {
                'param': param
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			   
			    $('#ywslshglGrid').datagrid('reload');
			    
			}else{
			  $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}



	

$('#sstate2').combobox({    
   onSelect: function(rec){
        if(rec.value=='1'){//驳回
       
       // sstate='1';
         $('#sMsg2').textbox({required: true}); 
          $('#zdSUid2').combobox({required: false}); 
          $('#zdSUid2').combobox('setValue',''); 
          $('#zdSUid2').combobox('readonly',true);
        
           $('#remark2').combobox({required: false}); 
          $('#remark2').combobox('setValue',''); 
          $('#remark2').combobox('readonly',true);
         
        }
        if(rec.value=='0'){//已受理
        // sstate='0';
         $('#sMsg2').textbox({required:false}); 
        
          $('#remark2').combobox('readonly',false);
          $('#remark2').combobox({required: true});
          $('#remark2').combobox('setValue','2');
        
        
          
           
            var url = basePath+'ywslsh/ywslUserData?roleId=2'; 
            $('#zdSUid2').combobox('readonly',false);  
            $('#zdSUid2').combobox('reload', url); 
            $('#zdSUid2').combobox({required: true}); 
           
        }
        }
}); 

</script>
	<form id="ywslForm" method="post">
   <input type="hidden" id="curRemark" name="curRemark" value="1"><!--当前环节 1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核 -->	
   <input type="hidden" id="id" name="id">
    <table class="table3">
      <tr>
      <td class="left">受理人</td>
      <td class="right">
      <input type="hidden" id="sUid" name="sUid" value=""><!-- 登录用户id -->
      <input id ="sUname" name="sUname" class="easyui-textbox" size="60"  data-options="required:true,readonly:true" style="height:22px;width:375px"></td>
      </tr>
      <tr>
      <td class="left">受理状态</td>
      <td class="right" style="">
      <select id="sstate2" class="easyui-combobox" name="sstate2" style="width:375px;"data-options="editable:false" >  
      <option value="0" >已受理</option><!--0:已受理  1:驳回   2:已审核 3:审核失败4：未审核-->
      <option value="1">驳回</option>
      </select></td>
      </tr>
    <!--   <tr>
      <td class="left">受理时间</td>
      <td class="right" >   
        <input id ="sbDate" name="sbDate" class="easyui-textbox" size="60"  data-options="required:false,readonly:true" style="height:22px;width:375px">
      </td>
      </tr>  -->
     
      <tr>
      <td class="left">业务受理人审核意见</td>
      <td class="right" >   
        <input id ="sMsg2" name="sMsg2" class="easyui-textbox" size="60"  data-options="multiline:true,validType:['length[0,150]']" style="height:60px;width:375px">
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
      <select id="remark2" class="easyui-combobox" name="remark2" style="width:375px;"data-options="    
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
      <option value="2" selected="selected">关联业务经办人</option>
      <option value="3">宏业公司</option>
   
      </select>
      </td>
      </tr>
      
       <tr>
      <td class="left">指定审核人</td>
      <td class="right" style="">
      <select id="zdSUid2" class="easyui-combobox" name="zdSUid2" style="width:375px;"data-options="valueField:'userId',textField:'userName', editable:false,required:true" >
      <option value=""></option>
      </select></td>
      </tr>
      </table>  
      
      
       

    </form> 

</body>

</html>
