<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商家账号管理</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
  
    <script type="text/javascript">
      $(function() {
      info();
      
     var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb1").empty();
		 $("#sjlb1").append("<option value=''></option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb1").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
      });
      function info(){
      var url = "../user/shopuserinfo?name="+$('#name1').val()+"&account_name="+$('#account_name1').val()+"&type="+$('#sjlb1').val()+"&sstate="+$('#cstate1').val();
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	url:url,
	fitColumns:false,
	pagination:true,
	columns:[[
	            {field:'id',checkbox:true},
	            {title:'商家编号',field:'pno',width:60,align:'center'},
	            {title:'商家名称',field:'name',width:160,align:'center'},	
	    		{title:'商家账号',field:'account_name',width:150,align:'center'},
	            {title:'商家类别',field:'type_id',width:60,align:'center'},
				{title:'账号状态',field:'sstate',width:100,align:'center'}
				
			]],
			singleSelect: false,
			selectOnCheck: true,
			checkOnSelect: true,
			onLoadSuccess:function(data){ 
			
			if(data){
			$.each(data.rows, function(index, item){
			if(item.checked){
				$('#noticeRs').datagrid('checkRow', index);
			}
			
			});
			}
			}
			

});
      }
 function qNotice(s){
    var row = $('#noticeRs').datagrid('getSelected');
		if (row){
	    
	    var  url="../user/upzshopaccountinfo?id="+row.id+"&s="+s;
	    $.post(url,null,function(data){
		if(data.flag==1){
			alert("执行成功！");
			
			info();
			//$('#w2').window('close');
		}else{
			alert("执行失败！");
		}
	},"json");
	    }
    }
    function delNotice(){

				
var ids="";
var rows = $('#noticeRs').datagrid('getSelections');
for(var i=0;i<rows.length;i++){

ids+=rows[i].id+",";
};     

 if (ids.length > 0) { 

        ids = ids.substr(0, ids.length - 1); 

    }
		//alert(row.id);
		
		var url = "../user/delshopaccountinfo?ids="+ids;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
					info();
			}else{
				alert("删除失败！");
			}
		},"json");
	
}
function closeProduct(){
	$('#w2').window('close');
	info();
}
function saveOrUpdateProductNode(){
	var url;
	
	var isstate="启用";
	var isSelected = $("#isstate2").attr("checked"); 
	if (isSelected )
		isstate = "不启用";
	if($('#nId').val()=="")
	   url = "../user/upshopaccountinfo?name="+$('#name2').val()+"&account_name="+$('#account_name').val()+"&isstate="+isstate+"&id=0";
	else
	   url = "../user/upshopaccountinfo?name="+$('#name2').val()+"&account_name="+$('#account_name').val()+"&isstate="+isstate+"&id="+$('#nId').val();
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("执行成功！");
			$('#w2').window('close');
			info();
			//$('#w2').window('close');
		}else if(data.flag==2){
			alert("该商家不存在哦");
			$('#w2').window('close');
			info();
			//$('#w2').window('close');
		}else{
			alert("执行失败！");
		}
	},"json");
}
function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#name').val("");
    $('#account_name').val("");
  
    /*
    var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb").empty();
		 $("#sjlb").append("<option value=''>全部</option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
     */
  
}
		function mdNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
	
			$('#w2').window('open');
	    $('#nId').val(row.id);
	$('#name2').val(row.name);
    $('#account_name').val(row.account_name);
	 
	}else{
	alert("请选择记录!");
	}
		}
    </script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >	
			<tr>
			
 				<td align="right" nowrap="nowrap"><b>商家名称:</b></td>
 			    <td><input type="text" id="name1" name="name1"/></td>
 			    	<td align="right" nowrap="nowrap"><b>商家账号:</b></td>
 			    <td><input type="text" id="account_name1" name="account_name1"/></td>
 			    <td align="right" nowrap="nowrap"><b>商家类别:</b>
 			      <select id="sjlb1">
				            	<option></option>
				            	</select></td>
				            	
				            
 			    <td align="right" nowrap="nowrap"><b>账号状态:</b>
 			      <select id="cstate1">
				            	<option value="">全部</option>
				            	<option value="14">启用</option>
				            	<option value="15">不启用</option>
				            	<option value="16">删除</option>
				            	</select></td>
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="info()">查询 </a> 
		    <a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">新增 </a>
		       <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="mdNotice()">修改 </a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除 </a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="qNotice('启用')">启用</a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="qNotice('不启用')">不启用</a>
		     <!-- <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">改密码 </a> -->
		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="商家账号信息" iconCls="icon-save" style="width:300px;height:350px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:250px;height:250px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">商家名称：</div>
				            </td>
				            <td>
				            	<input id="name2" name="name2"  style="width:150px;" maxlength="50"></input>
				            </td>
				            </tr>
				     
				            <td nowrap>
				            	 <div align="right">商家账号：</div>
				            </td>
				            <td>
				            	<input id="account_name" name="account_name"  style="width:150px;" maxlength="50"></input>
				            </td>
			            </tr>
			   
			     
				            			                 <tr>
				            			            <td nowrap>
				            	 <div align="right">账号状态：</div>
				            </td>
				            <td>
				            	启用<input id="isstate1" name="isstate" type="radio" checked value="0">  不启用<input name="isstate" id="isstate2" type="radio" value="1">
				            </td>
				            			            </tr>
			             			        </table>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>

	</div>
</body>
</html>