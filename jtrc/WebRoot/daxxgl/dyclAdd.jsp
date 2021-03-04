<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
 

  </head>
  
  <body style="margin:10px;">
    <script type="text/javascript">
$(document).ready(function(){  
	 var cache=window.top.cacheArchive;
    var dpno=cache.cacheDpno;
    $.parser.parse();
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
				//formData		: {'id':'1', 'name':'myFile'} , 
				multi			: true ,	
				progressData	: 'speed',	
				queueID			: 'fileQueue',
				queueSizeLimit	: 99999	,	
				removeCompleted : false	,	
				removeTimeout	: 10000	,
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
  
  
  <form id="fm"  method="post" enctype="multipart/form-data" >
    <div class="easyui-layout" style="height:500px;width:1000px" data-options="fit:true">
     <div  data-options="region:'north',title:'材料信息'" style="height:250px">    
     
      <table class="table2">
      <tr>
      <td class="left">入党时间</td>
      <td class="right">
      <input class="easyui-datebox" name="partydate" id="partydate" size="20" data-options="editable:false" value="" style="height:22px">
	  </td>
	  <td class="left">是否正式党员</td>
      <td class="right">
       <input type="radio" name="isparty" checked="checked" value="1"/>是 <input type="radio" name="isparty" value="2"/>否
      </td>
	  <td class="left">组织关系转入日期</td>
      <td class="right">
            <input class="easyui-datebox" name="indate" id="indate" size="20" data-options="editable:false" value="" style="height:22px">
	  </td>
	  </tr>
	  
	  <tr>
	   <td class="left">预备党员转正日期</td>
       <td class="right">
            <input class="easyui-datebox" name="zzdate" id="zzdate" size="20" data-options="editable:false" value="" style="height:22px">
      </td>
       <td class="left">组织关系转出日期</td>
       <td class="right">
      <input class="easyui-datebox" name="outdate" id="outdate" size="20" data-options="editable:false" value="" style="height:22px">
      </td>
       <td class="left">党费交至日期</td>
       <td class="right">
      <input class="easyui-datebox" name="jzdate" id="jzdate" size="20" data-options="editable:false" value="" style="height:22px">
      </td>
	  </tr>
	  
	  <tr>
	   <td class="left">转入组织</td>
       <td class="right">
      <input class="easyui-textbox"  name="inorg" id="inorg" size="20"  style="height:22px">
      </td>
       <td class="left">转出组织</td>
       <td class="right">
      <input class="easyui-textbox"  name="outorg" id="outorg" size="20"  style="height:22px">
      </td>
       <td class="left"></td>
       <td class="right">
      </td>
	  </tr>
      </table>
      </div>   
       <div  data-options="region:'south',title:'材料上传'" style="height:200px">    
      <table class="table2">
	   <tr>
	   <td class="left">材料名称</td>
      <td class="right">
      <input class="easyui-textbox" name="pname" id="pname" size="20"  style="height:22px;" data-options="required:true" >
	  </td>
	   <td class="left"></td>
      <td class="right">
       <div style="display: none"><input class="easyui-filebox"  name="uploadFile" id="uploadFile" size="20"  style="height:22px;" data-options="buttonText:'选择文件'" ></div>
	  </td>
	  </tr> 
	  
	   <tr>
	   <td class="left">真实时间</td>
      <td class="right"><input class="easyui-datebox" name="pdate" id="pdate" size="20"  style="height:22px;" data-options="editable:false,buttons:buttons" ></td>
      <td class="left">页数</td>
      <td class="right">
      <input class="easyui-numberbox" name="page_num" id="page_num"  size="20"  style="height:22px;"  >
	  </td>
      </tr>
      
      
      
      <tr>
      <td class="left">备注</td>
      <td class="right" colspan="3"> <input class="easyui-textbox"   name="remark" id="remark" data-options="multiline:true" size="120" style="height: 70px"></td>
     <!--  <td class="left"></td>
      <td class="right"></td> -->
      </tr>
      
      </table>
  </div>
  </div>
  </form>
   <span id="llUploadify"></span>	 
      <table id="llfjlbGrid" style="width: 100%"></table>  
      
      <script type="text/javascript">      
      function deleteFj(index){
    	  
    	  
    	  //modify yahuking 2018/9/27
    	  var row = $('#llfjlbGrid').datagrid('getSelected');
			 if (row) {
		       var rowIndex = $('#llfjlbGrid').datagrid('getRowIndex', row);
		       $('#llfjlbGrid').datagrid('deleteRow', rowIndex);  
		 	}
			 
          // var row = $('#llfjlbGrid').datagrid("getSelections");
           // if(row.length==1){
             //  $('#llfjlbGrid').datagrid('deleteRow',0);
           // }else
           // $('#llfjlbGrid').datagrid('deleteRow',index);
      
      }
   
      </script>
  </body>
</html>
