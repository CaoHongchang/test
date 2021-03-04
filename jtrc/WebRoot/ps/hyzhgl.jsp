<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>会员账号管理</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script>
    $(function() {

	//alert("dd");
	//$('#addNotice1').hide();
	//$('#addNotice2').hide();
	//$('#addNotice3').hide();
	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){

	var url = "../game.php?doAction=act_popri";
	$.post(url,null,function(data){
		if(data.flag7==10){
			
			$('#addNotice1').show();
			
			
		}
		if(data.flag8==11){
			$('#addNotice2').show();
			
			
		}
		if(data.flag9==12){
			$('#addNotice3').show();
		}
	},"json");
var url = "../user/userinit?pno="+$('#pno1').val();
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
	            {title:'会员编号',field:'ids',width:60,align:'center'},
	            {title:'会员账号',field:'pno',width:60,align:'center'},	
	    		{title:'会员昵称',field:'name',width:150,align:'center'},
	            {title:'会员姓名',field:'real_name',width:60,align:'center'},
				{title:'会员身份证号',field:'pnum',width:100,align:'center'},
				{title:'拥有点币数',field:'point',width:100,align:'center'},
				{title:'账户现金余额',field:'rmb',width:100,align:'center'},
				{title:'注册时间',field:'add_date',width:100,align:'center'},
				{title:'账号状态',field:'pstate',width:100,align:'center'}
				
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

function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#pno').val("");
    $('#name').val("");
    $('#real_name').val("");
    $('#pnum').val("");
    $('#rmb').val("");
    $('#point').val("");
  

}
function mdNotice(){
	
	  
	    
	$('#w2').window('open');
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		$('#pno').val(row.pno);
	    $('#real_name').val(row.real_name);
	    $('#name').val(row.name);
	    $('#pnum').val(row.pnum);
	    $('#rmb').val(row.rmb);
	    $('#point').val(row.point);
	    $('#nId').val(row.id);

	}
}
function upNotice(d){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		//$('#noticeRs').datagrid('deleteRow', index);
		//alert(row.id);
		
		var url = "../user/upuser?id="+row.id+"&s="+d;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("启用成功！");
				init();
			}else{
				alert("操作失败！");
			}
		},"json");
	}
	
}
function closeProduct(){
	$('#w2').window('close');
	init();
}
function saveOrUpdateProductNode(){
	var url = "../user/upuser1?id="+$('#nId').val()+"&name="+$('#name').val()+"&real_name="+$('#real_name').val()+"&point="+$('#point').val()+"&rmb="+$('#rmb').val()+"&pnum="+$('#pnum').val()+"&pno="+$('#pno').val();	
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("更新成功！");
			$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else{
			alert("更新失败！");
		}
	},"json");
}
    
    </script>    
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >	
			<tr>
			
 				<td align="right" nowrap="nowrap"><b>会员账号:</b></td>
 			    <td><input type="text" id="pno1" name="pno1"/></td>
 			
				            	
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 

		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="upNotice('启用')">启用</a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="upNotice('不启用')">不启用</a>
		       <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="mdNotice()">修改 </a>
		   <!--  <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">查看账号收支历史 </a> -->
		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="会员账号信息" iconCls="icon-save" style="width:300px;height:350px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:250px;height:250px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">会员账号：</div>
				            </td>
				            <td>
				            	<input id="pno" name="pno"  style="width:150px;"></input>
				            </td>
				            </tr>
				            <tr><td nowrap> <div align="right">会员昵称：</div></td> 
				             <td> <input id="name" name="name"  style="width:150px;"></input></td></tr>
				            <tr>
				             <td nowrap>
				            	 <div align="right">会员姓名：</div>
				            </td>
				            <td>
				            	 <input id="real_name" name="real_name"  style="width:150px;"></input>
				            </td>
			            </tr>
			             <tr>
				            	<td nowrap>
				            	 <div align="right">会员身份证号：</div>
				            </td>
				            <td>
				            	<input id="pnum" name="pnum" style="width:150px;">
				            </td>
				            	</tr>
				            	 <tr>
				            	<td nowrap>
				            	 <div align="right">拥有点币数：</div>
				            </td>
				            <td>
				            	<input id="point" name="point" style="width:150px;">
				            </td>
				            	</tr>
				            	 <tr>
				            	<td nowrap>
				            	 <div align="right">账户现金余额：</div>
				            </td>
				            <td>
				            	<input id="rmb" name="rmb" style="width:150px;" > 
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