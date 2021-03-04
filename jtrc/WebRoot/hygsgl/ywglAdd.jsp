<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>业务新增</title>

<body>
<script type="text/javascript">

$("#uploadify").uploadify({
				debug			: false, 
				swf 			: basePath+'js/uploadify/uploadify.swf',	
				method			: 'post',	
				uploader		: basePath+'ywgl/ywUpload',//ffmc
				preventCaching	: true,		
				buttonCursor	: 'hand',	
				buttonText		: '选择文件'	,
				height			: 20	, 
				width			: 80	, 
				fileObjName		: 'filedata',	
				fileSizeLimit	: 2048	,		
				fileTypeDesc	: 'any'	,	
				fileTypeExts	: '*.*',	
				//formData		: {'id':'1', 'name':'myFile'} , 
				multi			: true ,	
				progressData	: 'speed',	
				queueID			: 'fileQueue',
				queueSizeLimit	: 99	,	
				removeCompleted : false	,	
				removeTimeout	: 10	,
				requeueErrors	: true,	
				uploadLimit		: 20,	
				successTimeout	: 30	,
				onDialogOpen : function () { /*alert( 'please select files' ) */ },
				onFallback : function(){ },
				
				onUploadError : function(file, errorCode, errorMsg, errorString){ 
                                   /*  alert(
                                        file.name + ' upload failed! ' + 
                                        'errorCode: ' + errorCode +
                                        'errorMsg:' + errorMsg +
                                        'errorString:' + errorString
                                    ); */
                                   /*   $.messager.alert('错误','操作失败！'+errorMsg,'error');
                                     return; */
                                     
								},
                
                onUploadSuccess : function(file, data, response) {
                                   //successMsg();
                                  /*  alert(
                                        file.name + ' 上传成功!  ' +
                                        '  server-side returned data:' + data +
                                        '  response: ' + response
                                    ); */
                                    var result = $.parseJSON(data);  
									if(result.flag ==true){
									    //展示数据
										$('#fjlbGrid').datagrid('appendRow',result.rows);
									}else{
									      $.messager.alert('错误','操作失败！','error');
									}
                                    
                                    
                                  }

			});




//保存
function saveYwglFuc(){
    var r = $("#yfglForm").form('enableValidation').form('validate');
    
	if(!r) {
		return false;
	}

 var param=$("#yfglForm").serializeArray();
 param=JSON.stringify(param); 

 var fjParam= $("#fjlbGrid").datagrid("getData");
 if(fjParam.rows.length>0){
 fjParam=JSON.stringify(fjParam.rows); 
 }else{
 fjParam=null;
 }
 var id=$('#id').val();
$("#yfglForm").ajaxSubmit({ 
		
			url : basePath+"ywgl/addYwgl",
			async : false,
			 data: {
                'param': param,
                'fjParam': fjParam,
                'id':id
            },
			success : function(data) {
			if(data.flag ==true){
			    successMsg();
			    $('#ywflglAddInfo').dialog('close');
			     $('#ywGrid').datagrid('reload');
			    
			}else{
			   $.messager.alert('错误','操作失败！'+data.cause,'error');
			}
		},
		error : function(data) {
			   errorMsg();
		}
	});


}
var pno='00001'+randomNum(5);
$('#pno').val(pno);	

//添加附件
function fjFuc(){

$("#fjForm").ajaxSubmit({
		dataType:"html",
		url : basePath+"ywgl/ywUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $("#fjForm")[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			   
			    //展示数据
				$('#fjlbGrid').datagrid('appendRow',result.rows);
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
 <div style="display: none;" id="fileQueue"></div>
	<form id="yfglForm" method="post">
    <input id="id" name="id" type="hidden">
    <input id="isAdd" name="isAdd" type="hidden">
    <table class="table3">
      <tr>
      <td class="left">业务编码</td>
      <td class="right"><input id ="pno" name="pno" class="easyui-textbox" maxlength="20" size="100" style="width:615px;"  data-options="required:true,readonly:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">业务名称</td>
      <td class="right" style=""><input id ="name" name="name" class="easyui-textbox" maxlength="50" size="100" style="width:615px;" data-options="required:true,validType:['length[0,50]']" style="height:22px"> </td>
      </tr>
      <tr>
      <td class="left">业务分类</td>
      <td class="right"><select id="typeId" name="typeId" class="easyui-combobox"  style="width:615px;" data-options=" required:true,editable:false,   
        valueField: 'id',    
        textField: 'name',    
        url: basePath+'ywfl/ywflData',
           onSelect:function(values){
             $('#objId').textbox('setValue', values.object_name);
             $('#objId2').val(values.object_name);
        }    
       " >   </select>
      </td>
      </tr> 
       <tr>
      <td class="left">业务对象</td>
      <td class="right"  >
      <input type="hidden" id="objId2" name="objId2">
      <select id="objId" name="objId"   data-options="required:true,disabled:true" class="easyui-combobox"  style="width:615px;">   
      <!--  <option value="个人">个人</option>
       <option value="企业">企业</option> -->
      </select>
      </td>
      </tr>
     
           
     <tr>
      <td class="left">业务说明</td>
      <td class="right"  style="height: 150px;padding-left: 60px;padding-right: 60px">
        
      <textarea name="remark" cols="" rows="10" id="remark" class="span1-2" style="width:90%;">
		</textarea>
      </td>
      </tr> 
       </table>  
      </form> 
       
       <form id="fjForm" method="post">
       <table class="table3">
       <tr>
      <td class="left">附件</td>
      <td class="right"  style="text-align:left;padding-left:60px">
     
       <!-- <a href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:false">
       <input  onchange="fjFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">选择文件</a> -->
     <div style="float: left"><span id="uploadify"></span></div><div  style="float: left;padding-left: 10px"> <label style="color: red">*附件大小不超过2M</label></div>
      </td>
      </tr>  
       </table>  
      </form> 
       <table class="table3">
       <tr>
      <td class="left"></td>
      <td class="right" style="text-align:left;padding-left:60px" >
      <table id="fjlbGrid" style="width:615px;"></table>
      <script type="text/javascript">
          
   //附件列表
    function fjListFuc(bid){
    var href='';
    if(bid!='' && bid!=null){
    href=basePath+"ywgl/ywglfjList?bid="+bid;
    }
    
    $('#fjlbGrid').datagrid({    
    url:href, 
    title:'附件列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	//fitColumns:true,
	height: 200,
	width:615,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'',title:'选择',checkbox:true,width:100}, 
       {field:'name',title:'文件名称',width:450},
       {field:'url',title:'文件路径',width:450,hidden:true}, 
       {field:'bid',title:'业务id',width:450,hidden:true},    
          
       {title:'操作',field:'id',width: 100,align:'center',
		    formatter: function(value,row,index){
		     var isAdd=$('#isAdd').val();
		     if(isAdd=='true'){
		     return '<a href="#" style="color: blue;" <a href="#" style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		     }else{
		     return '<a href="#" style="color: blue;"  onclick="downFj('+value+')">下载</a> <a href="#" style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		     }
 		     
		  }   
		}
  
    ]]    
     });
     }
      
      function deleteFj(index){
        $('#fjlbGrid').datagrid('deleteRow',index);
      
      }
      function downFj(id){
       window.location.href=basePath+"ywgl/downFj?id="+id;
      
      }
      </script>
      </td>
      </tr>      
     </table>
    
       

    

</body>

</html>
