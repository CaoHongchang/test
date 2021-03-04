<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商品类别管理</title>

  	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-form.js"></script>
    
    <script type="text/javascript">
    $(function() {

	
	$('#addNotice2').show();
	$('#addNotice3').show();
	$('#addNotice4').show();
	
	
	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){
	
	var url = "../user/sjlbgl";
	$.post(url,null,function(data){
		if(data.flag4==6){
			
			$('#addNotice2').show();
		}
		if(data.flag5==7){
			$('#addNotice3').show();
			
		}
		if(data.flag6==8){
			$('#addNotice4').show();
		}
	},"json");

var url = "../goodsType/list";
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	sortName: 'tc,zgq,jhb,jscore,tgjj,ztnum,zwnum,xfje',
	sortOrder: 'desc',
	remoteSort: false,
	pagination:true,
	url:url,
	columns:[[
	            
	            {title:'类别编号',field:'id',width:60,align:'center',sortable:true},
	            {title:'商家类别',field:'name',width:150,align:'center',sortable:true},
	            {title:'商家类别图片',field:'type_logo',width:150,align:'center',sortable:true},
	            {title:'创建人',field:'inUid',width:150,align:'center'},
	    		{title:'创建时间',field:'add_date',width:150,align:'center'},
	    		{title:'修改人',field:'uid',width:150,align:'center'},
	    		{title:'修改时间',field:'update_date',width:150,align:'center'}
			]]

});
	
	
}
function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#name1').val("");
	
    
    //loadSelct();
    	 
}
function loadSelct(){
	
    var url = "../game.php?doAction=act_area";
    $.post(url,null,function(data){
    	 $("#dl").empty();
    	 $.each(data.rows,function(index,item){  
			   
             $("#dl").append("<option value='"+item.dlqy+"'>"+item.dlqy+"</option>");
             });
	},"json");
}
function mdNotice(){
	
	$('#nId').val(2);
	var row = $('#noticeRs').datagrid('getSelected');
	if(row==null){
	alert("请选择一行进行修改");
	return;
	}
	$('#w2').window('open');
	if (row){
		//loadSelct();
		$('#name1').val(row.name);
		
	    //$('#pnum1').val(row.pnum);
	}
}

function delNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		$('#noticeRs').datagrid('deleteRow', index);
		
		//alert(row.id);
		
		var url = "../goodsType/del?id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
			}else{
				alert("发布失败！");
			}
		},"json");
	}
	
}
function closeProduct(){
	$('#w2').window('close');
	init();
}
function saveOrUpdateProductNode(){
	var url;
	if($('#nId').val()==""){
	var name = $("#name1").val();
	 	if(name==""){
	 	alert("商户类别不能为空");
	 	return;
	 	}
	   url = "../goodsType/insert?name="+$("#name1").val()+"&id=0";
	}else{
		var name = $("#name1").val();
	 	if(name==""){
	 	alert("商户类别不能为空");
	 	return;
	 	}
		var row = $('#noticeRs').datagrid('getSelected');
	   url = "../goodsType/insert?name="+$("#name1").val()+"&id="+row.id;
	}
	
	
	   var options  = {    
            url:url,    
            type:'post',    
            success:function(data)    
            {    
                var jsondata = eval("("+data+")");
                
                if(jsondata.flag==1){
					alert("发布成功！");
					$('#w2').window('close');
					init();
					//$('#w2').window('close');
				}else if(jsondata.flag==2){
					alert("用户名重名啦！");
				}else if(jsondata.flag==3){
					alert("上传图片必须是jpg格式，请确认图片格式！");
				}else{
					alert("发布失败！");
				}
                /*
                if(jsondata.error == "0"){  
                    var url = jsondata.url;  
                    alert(url)  
                    $("#img").attr("src",url);  
                }else{  
                    var message = jsondata.message;  
                    alert(message);  
                }  */
            }    
        };    
        $("#form").ajaxSubmit(options);  
    
}
    
    </script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
    <div region="center" border="false" split="false" style="overflow:hidden;">		
	<div class="datagrid-toolbar">
		    <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">新增 </a> 
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="mdNotice()">修改 </a>
		    <a id="addNotice4" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除 </a>
    </div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
   </div>
   <div id="w2"  class="easyui-window"  closed="true" title="商家类别" iconCls="icon-save" style="width:700px;height:300px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:650px;height:200px;padding:10px;background:#fff;border:1px solid #ccc;">
				      <form id="form" action="../goodsType/insert" method="post" enctype="multipart/form-data">
				   <table cellpadding=5>
			                <tr>
				                <tr>
					            <td nowrap>
					            	 <div align="right">商品图片LOGO：</div>
					            </td>
					            <td>
					                  
										 <input type="file" name="file" /> 
										
					            </td>
					            </tr>
					            <td nowrap>
					            	 <div align="right">商品类别：</div>
					            </td>
					            <td>
					            	<input id="name1" name="name1" type="text" class="text" style="width:150px;" maxlength="25" />
					            </td>
			                </tr>
			        </table>
			        </form>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>

	</div>
</body>
</html>