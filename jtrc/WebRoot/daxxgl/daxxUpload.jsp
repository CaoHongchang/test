<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
   <title>材料信息</title>
  </head>

  <body >
<script type="text/javascript">
$(document).ready(function(){  
   // $.parser.parse();
    
    var cache=window.top.cacheArchive;
    var dpno=cache.cacheDpno;
  	var submit=false;
    $("#llUploadify").uploadify({
				debug			: false, 
				swf 			: basePath+'js/uploadify/uploadify.swf',	
				method			: 'post',	
				uploader		: basePath+'gdcl/fjUpload?dpno='+dpno,//ffmc
				preventCaching	: true,		
				buttonCursor	: 'hand',	
				buttonText		: '选择文件'	,
				height			: 20	, 
				width			: 80	, 
				fileObjName		: 'filedata',	
				fileSizeLimit	: 20480	,		
				fileTypeDesc	: 'any'	,	
				fileTypeExts	: '*.*',	
				progressData	:'percentage',
				//formData		: {'id':'1', 'name':'myFile'} , 
				multi			: true ,	
				progressData	: 'speed',	
				queueID			: 'fileQueue',
				queueSizeLimit	: 9999	,	
				removeCompleted : false	,	
				removeTimeout	: 1000	,
				requeueErrors	: true,	
				uploadLimit		: 9999,	
				successTimeout	: 30	,
				onDialogOpen : function () { /*alert( 'please select files' ) */ },
				onFallback : function(){ },
				onUploadStart:function(){
						 if(!submit){
						 $.messager.progress({ // 显示进度条  
       						title:"材料上传",  
          					 text:"正在上传...",  
          					 interval:500  
          				}); 
          				} 
          				submit=true;
				},
				onQueueComplete:function(){
					submit=false;
					$.messager.progress('close');
				},
				onUploadError : function(file, errorCode, errorMsg, errorString){ 
                                   /*  alert(
                                        file.name + ' upload failed! ' + 
                                        'errorCode: ' + errorCode +
                                        'errorMsg:' + errorMsg +
                                        'errorString:' + errorString
                                    ); */
                                   /*   $.messager.alert('错误','操作失败！'+errorMsg,'error');
                                     return; */
                                    //   $.messager.progress('close'); 
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
										$('#llfjlbGrid').datagrid('appendRow',result.rows);
									}else{
									      $.messager.alert('错误',result.cause,'error');
									}
                                    
                                   //  $.messager.progress('close');
                                  }

			});
    
    
});
var buttons = $.extend([], $.fn.datebox.defaults.buttons);
buttons.splice(1, 0, {
    text: '清空',
    handler: function (target) {//target对象就是当前的inupt对象，不需要写死id
        $(target).datebox('setValue', '');
    }
});
</script>
<input type="hidden" id="ptype">
<input type="hidden" id="aid">

      <form id="fm" enctype="multipart/form-data" method="post">
       <div style="display: none"><input  class="easyui-filebox"  name="uploadFile" id="uploadFile" size="60" data-options="buttonText:'选择文件'" style="height:32px;" /></div>
      <table class="table2"  style="">
      <tr>
      <td class="left">材料名称</td>
      <td class="right">
      <input class="easyui-textbox" name="pname" id="pname" size="100" data-options="required:true" style="height:32px;width:100%" />
	  </td>
	  </tr>
	  
	  
	  <tr>
      <td class="left">页数</td>
      <td class="right">
      <input class="easyui-numberbox" name="page_num" id="page_num"  size="100"  style="height:32px;width:100%">
	  </td>
	  </tr>
      <tr>
      <td class="left">真实时间</td>
      <td class="right"><input class="easyui-datebox" name="pdate" id="pdate"  size="100" data-options="editable:false,buttons:buttons" style="height:32px;width:100%" /></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right" > <input class="easyui-textbox"  name="remark" id="remark"  size="100" data-options="multiline:true" style="height:80px;width:100%" /></td>
      </tr>
      <tr id="llUploadifyTr">
	   <td class="left">材料上传</td>
      <td class="right">
           <span id="llUploadify"></span>
     
	  </td>
	  </tr>
      
      </table>
  </form> 
  <table class="table3">
       <tr>
      <td class="left"></td>
      <td class="right" style="text-align:left;padding-left:42px" >
      <table id="llfjlbGrid"></table>  
      
      
      <script type="text/javascript">      
      function deleteFj(index){
    	  
    	  
    	  var row = $('#llfjlbGrid').datagrid('getSelected');
 		 if (row) {
 		       var rowIndex = $('#llfjlbGrid').datagrid('getRowIndex', row);
 		       $('#llfjlbGrid').datagrid('deleteRow', rowIndex);  
 		 }
 		 
 		   //2018/9/23 yahuking
           //var row = $('#llfjlbGrid').datagrid("getSelections");
            //if(row.length==1){
              // $('#llfjlbGrid').datagrid('deleteRow',0);
            //}else
           // $('#llfjlbGrid').datagrid('deleteRow',index);
            
      
      }
      function downFj(id){
       window.location.href=basePath+"gdcl/downFj?id="+id;
      
      }
      
      function preview(id) { 
     
     
    $('#previewDialog').dialog({
	title: '图片预览',
    width: 300,
    height: 300,
    closed: false,
    cache: false,
    href: '../daxxgl/preview.jsp',
    modal: false,
    buttons:[{text:'关闭',iconCls:'icon-cancel',handler:function(){
    	$('#previewDialog').dialog('close');
    }}],
    onLoad:function(){ 
    var adr='';
     $.ajax({
                url: basePath+"gdcl/getImgView?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
               	  adr=basePath+data.rows.fileUrl;
                    
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
            
    var imgid=document.getElementById('previewImage');
	imgid.src=adr;
   
	}
	});  
}
      </script>
       </td>
      </tr>      
     </table>
  
  </body>
</html>
