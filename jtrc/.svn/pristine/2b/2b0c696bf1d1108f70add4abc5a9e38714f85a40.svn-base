<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>填写论文专著鉴定</title>

<body>
<script type="text/javascript">

$("#uploadify").uploadify({
				debug			: false, 
				swf 			: basePath+'js/uploadify/uploadify.swf',	
				method			: 'post',	
				uploader		: basePath+'zcps/lwUpload',//ffmc
				preventCaching	: true,		
				buttonCursor	: 'hand',	
				buttonText		: '选择文件'	,
				height			: 20	, 
				width			: 80	, 
				fileObjName		: 'filedata',	
				fileSizeLimit	: 1048	,		
				fileTypeDesc	: '图片格式必须为.jpg、.jpeg、.gif、.png，每个扫描文件小于等于1M'	,	
				fileTypeExts	: '*.jpg;*.jpeg;*.gif;*.png',		
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

                                     
								},
                
                onUploadSuccess : function(file, data, response) {

                                    var result = $.parseJSON(data);  
									if(result.flag ==true){
									    //展示数据
										$('#fjlbGrid').datagrid('appendRow',result.rows);
									}else{
									      $.messager.alert('错误','操作失败！','error');
									}
                                    
                                    
                                  }

			});



</script>

<form id="sblwAddForm" method="post" enctype="multipart/form-data">
	 <input name="activityId" id="activityId" type="hidden">
      <table class="table2" style="margin:5px 0px">
      <tr>
      <td class="left">论文题目</td>
      <td class="right"><input  id="dissetationName" name="dissetationName" class="easyui-textbox" size="20"  data-options="required:true" style="height:32px"></td>
      <td class="left">刊出交流时间</td>
      <td class="right"><input id="jDateStr" name="jDateStr" class="easyui-datebox"  size="20" data-options="required:true,editable:false" style="height:32px"></td>
      <td class="left">结束时间</td>
      <td class="right"><input id="overDateStr" name="overDateStr" class="easyui-datebox"  size="20" data-options="required:true,editable:false" style="height:32px"></td>
      </tr>
      <tr>
      <td class="left">刊出交流情况（刊物及会议名称、刊号等）</td>
      <td class="right"><input class="easyui-textbox"  id="jMsg" name="jMsg" size="20" data-options="required:true,prompt:'输入限制在150字之内'" style="height:32px"></td>
       <td class="left">是否作为送审代表作</td>
      <td class="right"><input class="regular-checkbox" type="checkbox" id="isSendStr" name="isSendStr" size="20" style="height:32px"></td>
       <td class="left">备注</td>
      <td class="right"><input class="easyui-textbox" name="remark" id="remark" size="20"  style="height:32px" data-options="prompt:'输入限制在150字之内'"></td>
      </tr>
	  <tr>
		<!--  <td class="left">上传论文</td>
		  <td class="right"><input  data-options="buttonText:'选择文件'" class="easyui-filebox"  name="file" size="20" style="width:135px;height:22px" >
		  <input class="easyui-textbox" name="url" size="20" style="width:240px;height:22px">
		  </td>  -->
		  <td>上传论文</td>
      <td>
      <div style="float: left"><span id="uploadify"></span></div>
		  </td>
		  
      </tr> 
      </table>  
       <div  style="margin-left: 50px; padding-left: 10px"> <label style="color: red">*附件大小不超过1M、图片格式必须为.jpg、.jpeg、.gif、.png.</label></div>
</form>

<table class="table3">
       <tr>
      <td class="left"></td>
      <td class="right" style="text-align:left;padding-left:20px" >
      <table id="fjlbGrid" style="width:615px;"></table>
      <script type="text/javascript">
         
   //附件列表
    function fjListFuc(aid){
    var href='';
    if(aid!='' && aid!=null){
    href=basePath+"zcps/lwglfjList?aid="+aid;
    }
    
    $('#fjlbGrid').datagrid({    
    url:href, 
    title:'论文列表',
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
		     return '<a href="#" style="color: blue;" <a href="#" style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		    
 		     
		  }   
		}
  
    ]]    
     });
     }
      
      function deleteFj(index){
        var row = $('#fjlbGrid').datagrid("getSelections");
            if(row.length==1){
               $('#fjlbGrid').datagrid('deleteRow',0);
            }else
            $('#fjlbGrid').datagrid('deleteRow',index);
      
      }
      
      </script>
      </td>
      </tr>      
     </table>

</body>

</html>
