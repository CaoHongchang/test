<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>导入报名</title>

<script type="text/javascript">
 

function up11111loadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
      
     if(fileName !=""){   
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: "<%=request.getContextPath()%>/userBgTrol/leadInExcelQuestionBank?",
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 				            var resObj = eval("("+data+")");
 				            if(resObj.flag == '0'){
 				            	var obj = resObj.returnList;
 				            	 
 					        }else{
 					        	 $.messager.alert('系统提示','新增失败：'+resObj.errorMsg);
 						    }
 			                ////////////////////

 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }  
 

</script>


<body style="margin: 1px;">
<form id="questionTypesManage"  method="post" enctype="multipart/form-data">  
   选择文件：　<input id="uploadExcel" name="uploadExcel" class="easyui-filebox" style="width:200px" data-options="prompt:'请选择文件...'">  
      　     　　　　　      
</form> 
<%--<table id="tempTb">
   <tr>
       <td>班级编号</td>   
   </tr>
</table>

--%></body>
</html>
