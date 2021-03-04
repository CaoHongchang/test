<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>职称评审论文管理</title>

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
	<form id="fm" name="fm" method="post">
	<input id="id" name="id" type="hidden">
   
    <table class="table3" style="text-align: left;">
      <tr>
      <td >论文题目</td>
      <td ><input id ="dissetation_name" name="dissetation_name" class="easyui-textbox" style="width: 600px"  data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
      <td >刊出交流时间</td>
      <td  ><input class="easyui-datetimebox" name="j_date"  name="j_date"  style="width: 600px"  data-options="required:true,showSeconds:false" value="" > </td>
      </tr>
      
       <tr>
      <td>刊出交流情况（刊物及会议名称、刊号等）</td>
      <td><input class="easyui-textbox" id="j_msg" name="j_msg"  style="width: 600px" data-options="prompt:'期刊交流字数限制150字之内',required:true" style="height:52px" placeholder="期刊交流字数限制150字"></td>
      </tr> 
      
       <tr>
      <td >备注</td>
      <td><input class="easyui-textbox" id="remark" name="remark"style="width: 600px" style="height:22px" data-options="prompt:'备注字数限制150字之内'"></td>
      </tr>
    
      <tr>
      <td>是否作为送审代表作 </td>
      <td ><input id="is_send" name="is_send" type="checkbox" onchange="on"></td>
      </tr>
             </table>  
    </form> 
    
     <form id="fjForm" method="post">
       <table class="table3" style="text-align: left;padding-left:40px">
     <tr>
      <td>上传论文</td>
      <td>
      <div style="float: left;"><span id="uploadify"></span></div><div  style="float: left;padding-left: 10px"> <label style="color: red">*附件大小不超过1M，上传格式为.jpg、.jpeg、.gif、.png。</label></div>
      
     <!--  <textarea name="aboutusDescription" class="span1-2" id="aboutusDescription" cols="" rows="5"  >
	  </textarea> -->
	  <!-- <script type="text/javascript">
	  	CKEDITOR.replace('aboutusDescription');
	  	</script> -->
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
        $('#fjlbGrid').datagrid('deleteRow',index);
      
      }
      
      </script>
      </td>
      </tr>      
     </table>

</body>

</html>
