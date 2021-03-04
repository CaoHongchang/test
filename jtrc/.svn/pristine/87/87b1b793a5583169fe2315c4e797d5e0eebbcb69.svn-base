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
     <div  data-options="region:'north',title:'材料信息'" style="height:300px">    
      <table class="table2">
      <tr>
      <td class="left">单位名称</td>
      <td class="right">
      <input class="easyui-textbox" name="pointname" id="pointname"  size="20"  style="height:22px">
	  </td>
	  <td class="left">考核日期</td>
      <td class="right">
      <input class="easyui-datebox" name="khdate" id="khdate" size="20" data-options="editable:false" style="height:22px">
	  </td>
	   <td class="left">被考核人意见</td>
       <td class="right">
      <input class="easyui-textbox"  name="khadvice" id="khadvice" size="20"  style="height:22px">
      </td>
	  </tr>
	  
	  <tr>
	   <td class="left">政治态度与遵纪守法</td>
       <td class="right">
        <select  class="easyui-combobox" name="zzstate" id="zzstate" style="width:160px;" data-options="editable:false,panelHeight:null">
           <option value="0">--空--</option>
           <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
       <td class="left">工作态度</td>
       <td class="right">
        <select  class="easyui-combobox" name="workstate" id="workstate" style="width:160px;" data-options="editable:false,panelHeight:null">
           <option value="0">--空--</option>
           <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
       <td class="left">工作成果</td>
       <td class="right">
        <select  class="easyui-combobox" name="workresult" id="workresult" style="width:160px;" data-options="editable:false,panelHeight:null">
        	
        	<option value="0">--空--</option>
        	 <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
	  </tr>
	  
	  <tr>
	   <td class="left">解决实际问题能力</td>
       <td class="right">
        <select  class="easyui-combobox" name="dealmsg" id="dealmsg" style="width:160px;" data-options="editable:false,panelHeight:null">
        	<option value="0">--空--</option>
        	 <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
       <td class="left">创新能力</td>
       <td class="right">
        <select  class="easyui-combobox" name="cxability" id="cxability" style="width:160px;" data-options="editable:false,panelHeight:null">
        	 <option value="0">--空--</option>
        	 <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
       <td class="left">沟通能力</td>
       <td class="right">
        <select  class="easyui-combobox" name="gtability" id="gtability" style="width:160px;" data-options="editable:false,panelHeight:null">
        	<option value="0">--空--</option>
        	 <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
	  </tr>
	  
	  <tr>
	   <td class="left">组织能力</td>
       <td class="right">
        <select  class="easyui-combobox" name="zzability" id="zzability" style="width:160px;" data-options="editable:false,panelHeight:null">
        	<option value="0">--空--</option>
        	 <option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
       <td class="left">单位综合考核成果</td>
       <td class="right">
        <select  class="easyui-combobox" name="khresult" id="khresult" style="width:160px;" data-options="editable:false,panelHeight:null">
        	<option value="0">--空--</option>
        	<option value="1">优秀</option>
           <option value="2">良好</option>
           <option value="3">合格</option>
           <option value="4">不合格</option>
        </select>
      </td>
        <td class="left">年度考核</td>
       <td class="right">
        <select  class="easyui-combobox" name="yearkh" id="yearkh" style="width:160px;" data-options="editable:false,panelHeight:null">
           <option value="0">--空--</option>
           <option value="1">优秀</option>
           <option value="2">合格</option>
           <option value="3">不合格</option>
        </select>
      </td>
	  </tr>
	
	  <tr>
	    <td class="left">主管部门意见</td>
       <td class="right" colspan="5" >
        <input  class="easyui-textbox" name="zgadvice" id="zgadvice" style="height:40px;width:400px" data-options="multiline:true" />
      </td>
      </tr>
      <tr>
      <td class="left">个人总结</td>
      <td class="right" colspan="5"> <input class="easyui-textbox" maxlength="60" value="备注限制在60字之内" name="grall" id="grall" data-options="multiline:true" style="height:40px;width:400px"></td>
   
	  </tr>
       
      </table>
      </div>   
       <div  data-options="region:'south',title:'材料上传'" style="height:190px;margin-top:0px">    
      <table class="table2">
	  <tr>
	   <td class="left" style="width:220px;" >材料名称</td>
      <td class="right">
      <input class="easyui-textbox"  name="pname" id="pname" size="20"  style="height:22px;" data-options="required:true" >
	  </td>
	   <td class="left"></td>
      <td class="right">
	          <div style="display: none"><input class="easyui-filebox" name="uploadFile" id="uploadFile" size="20"  style="height:22px;" data-options="buttonText:'选择文件'" ></div>
	  
	  </td>
	    
	  </tr>
    
       <tr>
        <td class="left">页数</td>
      <td class="right">
      <input class="easyui-numberbox" name="page_num" id="page_num"  size="20"  style="height:22px;"  >
	  </td>
	   <td class="left">真实时间</td>
      <td class="right"><input class="easyui-datebox" name="pdate" id="pdate" size="20"  style="height:22px;" data-options="editable:false,buttons:buttons" ></td>
       </tr>
    
       <tr>
	  
      <td class="left">备注</td>
      <td class="right" colspan="3"> 
        <input class="easyui-textbox" maxlength="150"  style="width:500px;height:90px" name="remark" id="remark" data-options="prompt:'备注限制在150字之内',multiline:true" value=""  style="height:70px;">
      </td>
      
      </tr>
      <tr>
      
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
			 
           //var row = $('#llfjlbGrid').datagrid("getSelections");
           // if(row.length==1){
            //   $('#llfjlbGrid').datagrid('deleteRow',0);
           // }else
            //$('#llfjlbGrid').datagrid('deleteRow',index);
      
      }
   
      </script>
   
  </body>
</html>
