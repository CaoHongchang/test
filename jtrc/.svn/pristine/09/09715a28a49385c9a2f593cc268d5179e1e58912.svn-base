<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>资讯新增</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<script type="text/javascript">
   
$("#uploadify").uploadify({
				debug			: false, 
				swf 			: basePath+'js/uploadify/uploadify.swf',	
				method			: 'post',	
				uploader		: basePath+'zxgl/zxUpload',//ffmc
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


   
   
   
   $(function(){
	   CKEDITOR.replace("content");
   });
	     
	     
	     
</script>
<form id="fm" method="post" enctype="multipart/form-data">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >序列</td>
                <td class="right"><input id ="orderNo" name="orderNo" class="easyui-numberbox"  data-options="min:1,editable:false"  ></td>
           		              <td class="left">资讯标题</td>
                <td class="right"><input id ="title" name="title"  data-options="required:true,validType:['stringDescValidate[]']" class="easyui-textbox"  size="20"  ></td>
            </tr>
            <tr>
                <td class="left">发布人</td>
                <td class="right"><input id ="creator" name="creator" data-options="required:false,editable:true,validType:['stringDescValidate[]']" class="easyui-textbox" size="20"></td>
          		 <td class="left">资讯分类</td>
                <td class="right">
                    <select id="typeId" class="easyui-combotree" url="../zxgl/listTypeInfoTree" name="typeId" data-options="required:true" style="width:130px">
                    </select>
                </td>
            </tr>
            <tr>
                <td class="left">资讯类型</td>
                <td class="right">
                    <select id="msgType" class="easyui-combobox" name="msgType" data-options="required:true,editable:false,panelHeight:null" style="width: 130px" >
                        <option value="1">信息展示</option>
                        <option value="2">新闻</option>
                        <option value="3">链接</option>
                        <option value="4">下载</option>
                    </select>
                </td>
                <td class="left">URL</td>
                <td class="right">
                    <input id="url" class="easyui-textbox" name="url" data-options="required:false,editable:false"  size="20" />
                </td>
            </tr>
            <tr>
                <!-- <td class="left">附件</td>
                <td class="right">
                   
                    
                </td> -->
                 <td class="left">部门</td>
                <td class="right">
                <div style=" display: none">
                 <input id="file"class="easyui-filebox" name="file" data-options="buttonText:'选择文件'">
                </div>
                <input id ="departm" name="departm" data-options="required:false,editable:true,validType:['stringDescValidate[]']" class="easyui-textbox" size="20"  value="" ></td>    		
                 <td class="left">发布日期</td>
                 <td class="right">
                    <input id="publishDate" class="easyui-datetimebox" name="publishDate" data-options="required:true,editable:false" >
                </td>
            </tr>
           
			<tr>
			    <td class="left">资讯内容</td>
				<td class="right" colspan="3"><textarea id="content" name="content" cols="10" rows="5" class="ckeditor" disalbed="enable"></textarea></td>
			</tr>
			<tr>
            <td class="left">     
            </td>
            <td class="right" colspan="3">
           <div style="float: left"><span id="uploadify"></span></div><div  style="float: left;padding-left: 10px"> <label style="color: red">*附件大小不超过2M</label></div>
            
            </td>
             </tr>
        </table>
    </div>



</form>
<table class="table3">
   
       <tr>
      <td class="left"><input type="hidden" id="aid" >   </td>
      <td class="right" style="text-align:left;padding-left:60px" >
      <table id="fjlbGrid" style="width:650px;"></table>
      <script type="text/javascript">
      
  //附件列表
    function fjListFuc(aid){debugger;
    var href='';
    
  
    
    if(aid!='' && aid!=null){
    href=basePath+"zxgl/zxglfjList?aid="+aid;
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
       {field:'aid',title:'业务id',width:450,hidden:true},    
          
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

<script type="text/javascript">
   $(document).ready(function(){debugger;
   
   
	 fjListFuc(aid);
/*
信息展示类：标题和资讯内容必填
新闻类：标题、发布人、发布时间、资讯内容必填
链接：标题和URL必填
下载：标题和附件必填
*/
	$('#msgType').combobox({
    	onChange:function(newValue,oldValue){
    	    if(newValue==1){
    	    	//信息展示：.信息展示（标题+内容（可含图片）
				$('#creator').textbox({required:false,editable:false});
				$('#url').textbox({required:false,editable:false});
				$('#file').filebox({required:false,accept:"image/png,image/jpeg,image/tiff"});
				
				
				
    	    }else if(newValue==2){
			    //新闻：标题+发布人+发布时间+内容（可含图片）
				$('#creator').textbox({required:true,editable:true});
				$('#url').textbox({required:false,editable:false});
				$('#file').filebox({required:false,accept:"image/png,image/jpeg,image/tiff"});
			
				
			}
        	else if(newValue == 3){
                //链接：只有标题，点击跳转
				$('#creator').textbox({required:false,editable:false});
				$('#url').textbox({required:true,editable:true});
				$('#file').filebox({required:false,editable:false,enabled:false});
			
				
        	} 
			else if(newValue == 4){
                //下载：只有标题，点击下载附件
				$('#creator').textbox({required:false,editable:false});
				$('#url').textbox({required:false,editable:false});
				$('#file').filebox({required:false,accept:"image/png,image/jpeg,image/tiff,aplication/zip,application/x-rar-compressed,"
                    +"application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,"
                    +"application/vnd.ms-excel,"
                    +"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
				
        	}
			$.parser.parse($('#creator'));
			$.parser.parse($('#url'));
			$.parser.parse($('#file'));
		
			
    	}
	});
     $('#creator').textbox({
		onChange:function(newValue,oldValue){
			$.ajax({
				url:'../users/isUserNameExist',
				type:'post',
				data:{
					username:$('#creator').textbox('getValue')
				},
				success:function(result){
					if(!result.flag){
						$.messager.alert('系统提示','该用户不存在！');
					    $('#creator').textbox('setValue','');
					}
				}
			});
		} 
	 });
	 $.parser.parse($('#creator'));
	 
	 
	  
	 
});

</script>
</body>

</html>