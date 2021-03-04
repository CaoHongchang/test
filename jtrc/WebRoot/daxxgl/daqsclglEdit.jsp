<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案缺失材料修改</title>

<body>

<script type="text/javascript">
$(document).ready(function(){  
   // $.parser.parse();
    
    
  
    $("#daqUploadify").uploadify({
				debug			: false, 
				swf 			: basePath+'js/uploadify/uploadify.swf',	
				method			: 'post',	
				uploader		: basePath+'gdcl/fjUpload',//ffmc
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
				queueSizeLimit	: 99	,	
				removeCompleted : false	,	
				removeTimeout	: 10	,
				requeueErrors	: true,	
				uploadLimit		: 20,	
				successTimeout	: 30	,
				onDialogOpen : function () { },
				onFallback : function(){ },
				
				onUploadError : function(file, errorCode, errorMsg, errorString){ 
								},
                onUploadSuccess : function(file, data, response) {
                                    var result = $.parseJSON(data);  
									if(result.flag ==true){
									    //展示数据
										$('#daqfjlbGrid').datagrid('loadData',{ total: 0, rows: [result.rows] });
									}else{
									      $.messager.alert('错误','操作失败！','error');
									}
                                  }

			});
    
    
});
</script>
		
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
             <form id="fmEdit" method="post">
              <input type="hidden" id="fjParam" name="fjParam">
		<input type="hidden" name="id" id="id"> 
       <input type="hidden" name="d_id" id="d_id"> 
              <table class="table2">
      <tr>
	      <td class="left">调档函号</td>
	      <td class="right">
	       <input class="easyui-textbox" id="d_no" name="d_no"  size="20" style="height:22px">
		 </td>
	 </tr>
      <tr>
      <td class="left">档案（缺失）材料</td>
      <td class="right" > <input class="easyui-textbox" id="m1" name="m1"   size="60" data-options="required:true,multiline:true" style="height:60px;"></td>
      </tr>
      <tr>
      	<td colspan="2" align="left" style="color:red">*多材料的请用+号连接</td>
      </tr>
      <tr>
      <td class="left">备注</td>
      <td class="right" > <input class="easyui-textbox" id="remark" name="remark"   size="60" data-options="multiline:true" style="height:60px;width: "></td>
      </tr>
      <tr id="daqUploadifyTr">
	   <td class="left">材料上传</td>
      <td class="right">
           <span id="daqUploadify"></span>
       
	  </td>
	  </tr>
      </table>  
       </form> 
       
 <table class="table3">
       <tr>
      <td class="left"></td>
      <td class="right" style="text-align:left;padding-left:32px" >
      <table id="daqfjlbGrid"></table>  
      
      <script type="text/javascript">      
      function deleteFj(index){
           var row = $('#daqfjlbGrid').datagrid("getSelections");
            if(row.length==1){
               $('#daqfjlbGrid').datagrid('deleteRow',0);
            }else
            $('#daqfjlbGrid').datagrid('deleteRow',index);
            
      }
      function downFj(id){
       window.location.href=basePath+"gdcl/downFj?id="+id;
      }
      
      </script>
       </td>
      </tr>      
     </table>
         
       
      </div>   
   
       </div>

      

             
   

</body>

</html>
