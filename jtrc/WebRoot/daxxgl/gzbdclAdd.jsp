<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
 

  </head>
  
  <body style="margin:10px;">
  <script type="text/javascript">
$(document).ready(function(){  
	var cache=window.top.cacheArchive;
    var dpno=cache.cacheDpno; 
    var submit=false;
    $.parser.parse();
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
      <td class="left">变动时间</td>
      <td class="right">
      <input class="easyui-datebox" name="changedate" id="changedate" size="20" data-options="editable:false" value="" style="height:22px">
	  </td>
	  <td class="left">工资职级</td>
      <td class="right">
      <input class="easyui-textbox"  name="salarylevel" id="salarylevel" size="20"  style="height:22px">
      </td>
	  <td class="left">职务岗位工资</td>
      <td class="right">
            <input class="easyui-numberbox" name="zwsalary" id="zwsalary"   size="20" data-options="precision:2,min:0" style="height:22px">
	  </td>
	  </tr>
	  <tr>
	   <td class="left">津贴</td>
       <td class="right">
      <input class="easyui-numberbox"  name="jsalary" id="jsalary" size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">薪级工资</td>
       <td class="right">
      <input class="easyui-numberbox" name="xjsalary" id="xjsalary"  size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">绩效工资</td>
       <td class="right">
      <input class="easyui-numberbox"  name="jxsalary" id="jxsalary" size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
	  </tr>
	  <tr>
	   <td class="left">岗位津贴</td>
       <td class="right">
      <input class="easyui-numberbox" name="gwsalary" id="gwsalary"   size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">职务津贴</td>
       <td class="right">
      <input class="easyui-numberbox"  name="possalary" id="possalary" size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">地区补贴</td>
       <td class="right">
      <input class="easyui-numberbox" name="areasalary" id="areasalary"   size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
	  </tr>
	  
	  <tr>
	   <td class="left">考勤奖</td>
       <td class="right">
      <input class="easyui-numberbox" name="kqsalary" id="kqsalary"  size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">特岗津贴</td>
       <td class="right">
      <input class="easyui-numberbox"  name="spsalary" id="spsalary" size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">提租补贴</td>
       <td class="right">
      <input class="easyui-numberbox" name="tzsalary" id="tzsalary"  size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
	  </tr>
	  
       <tr>
	   <td class="left">未定级工资</td>
       <td class="right">
      <input class="easyui-numberbox" name="nlevel" id="nlevel"  size="20" data-options="precision:2,min:0" style="height:22px">
      </td>
       <td class="left">变动依据</td>
       <td class="right">
      <input class="easyui-textbox" name="changeorder" id="changeorder" size="20" data-options="showSeconds:false" value="" style="height:22px">
      </td>
       <td class="left"></td>
       <td class="right">
      </td>
	  </tr> 
      </table>
      </div>   
       <div  data-options="region:'south',title:'材料上传'" style="height:200px;margin-top:0px">    
      <table class="table2">
	  <tr>
	   <td class="left">材料名称</td>
      <td class="right">
      <input class="easyui-textbox" name="pname" id="pname"  size="20" style="height:22px" data-options="required:true" >
	  </td>
	   
	     <td class="left">页数</td>
      <td class="right">
      <input class="easyui-numberbox" name="page_num" id="page_num"  size="20" style="height:22px"  style="height:32px">
	  </td>
	  <td class="left"></td>
      <td class="right">
      <div style="display: none">  <input class="easyui-filebox"  name="uploadFile" id="uploadFile" size="20" style="height:22px" data-options="buttonText:'选择文件'" ></div>
	  </td>
	  </tr>
       <tr>
	   <td class="left">真实时间</td>
      <td class="right"><input class="easyui-datebox"  name="pdate" id="pdate" size="20" style="height:22px" data-options="editable:false,buttons:buttons" ></td>
      <td class="left">材料类型</td>
      <td class="right" colspan="5">
        <select  class="easyui-combobox"  name="ptypeName" id="ptypeName" style="width:130px;" data-options="panelHeight:null,editable:false">
         <option value="1">9-1工资类</option>
         <option value="2">9-2任免类</option>
         <option value="3">9-3出国类</option>
         <option value="4">9-4会议类</option>
        </select>
	  </td>
	  </tr>
	  <tr>
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="5"> <input class="easyui-textbox"  name="remark" id="remark"  data-options="multiline:true" style="height:60px;width:450px"></td>
      
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
