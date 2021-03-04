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
      <td class="left">教育类型</td>
      <td class="right">
        <select  class="easyui-combobox" name="stype" id="stype" style="width:135px;" data-options="editable:false,panelHeight:null">
        <option value="0">--空--</option>
          <option value="1">统招</option>
          <option value="2">自考</option>
          <option value="3">成考</option>
        </select>
	  </td>
	  <td class="left">在学年级</td>
      <td class="right">
      <input class="easyui-textbox" name="onlinestage" id="onlinestage"  size="20"  style="height:22px">
      </td>
	  <td class="left"></td>
      <td class="right">
	  </td>
	  </tr>
	  <tr>
	   <td class="left">学习（培训单位）名称</td>
       <td class="right">
      <input class="easyui-textbox"  name="schoolname" id="schoolname" size="20"  style="height:22px">
      </td>
       <td class="left">入学日期</td>
       <td class="right">
      <input class="easyui-datebox" name="indate" id="indate" size="20" data-options="editable:false" value="" style="height:22px">
      </td>
       <td class="left">毕业（授予）日期</td>
       <td class="right">
      <input class="easyui-datebox" name="sdate" id="sdate" size="20" data-options="editable:false" value="" style="height:22px">
      </td>
	  </tr>	  
	  <tr>
	   <td class="left">新学专业（培训内容）</td>
       <td class="right">
      <input class="easyui-textbox"  name="content" id="content" size="20" style="height:22px">
      </td>
       <td class="left">学历</td>
       <td class="right">
        <select  class="easyui-combobox" name="education" id="education" style="width:135px;" data-options="editable:false,panelHeight:null">
        <option value="0">--空--</option>
        <option value="1">小学</option>
        <option value="2">初中</option>
        <option value="3">高中</option>
        <option value="4">中专</option>
        <option value="5">大专</option>
        <option value="6">本科</option>
        <option value="7">研究生</option>
        </select>
      </td>
       <td class="left">学位</td>
       <td class="right">
        <select  class="easyui-combobox" name="degree" id="degree" style="width:135px;" data-options="editable:false,panelHeight:null">
        	<option value="0">--空--</option>
        	<option value="1">学士</option>
        	<option value="2">硕士</option>
        	<option value="3">博士</option>
        </select>
      </td>
	  </tr>
	  <tr>
	   <td class="left">证书名称</td>
       <td class="right">
      <input class="easyui-textbox" name="zname" id="zname"  size="20"  style="height:22px">
      </td>
       <td class="left">证书编号</td>
       <td class="right">
      <input class="easyui-textbox"  name="zno" id="zno" size="20"  style="height:22px">
      </td>
       <td class="left">发证机关</td>
       <td class="right">
      <input class="easyui-textbox" name="fzname" id="fzname"  size="20"  style="height:22px">
      </td>
	  </tr>
      </table>
      </div>   
       <div  data-options="region:'south',title:'材料上传'" style="height:200px">    
      <table class="table2">
	  <tr>
	   <td class="left">材料名称</td>
      <td class="right">
      <input class="easyui-textbox"  name="pname" id="pname" size="20"  style="height:22px;" data-options="required:true" >
	  </td>
	   <td class="left"></td>
      <td class="right">
       <div style="display: none"><input class="easyui-filebox" name="uploadFile" id="uploadFile" size="20"  style="height:22px;" data-options="buttonText:'选择文件'" ></div>
	  </td>
	  
	  </tr>
       <tr>
	   <td class="left">真实时间</td>
      <td class="right"><input class="easyui-datebox" name="pdate" id="pdate" size="20"  style="height:22px;" data-options="editable:false,buttons:buttons" ></td>
        <td class="left">页数</td>
      <td class="right">
      <input class="easyui-numberbox" name="page_num" id="page_num"  size="20"  style="height:22px;" >
	  </td>
	  </tr>
	  
	  <tr>
	  <td class="left">材料类型</td>
      <td class="right" colspan="3">
        <select  class="easyui-combobox"  name="ptypeName" id="ptypeName" style="width:128px;" data-options="panelHeight:null,editable:false">
         <option value="1">4-1学历学位材料</option>
         <option value="2">4-2技术职务材料</option>
         <option value="3">4-3科研学术材料</option>
         <option value="4">4-4培训材料</option>
        </select>
	  </td>
	  
	  </tr>
	  
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="3"> <input class="easyui-textbox" name="remark" id="remark" size="120"  data-options="multiline:true" style="height:60px;"></td>
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
