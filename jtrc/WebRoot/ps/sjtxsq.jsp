<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商家提现申请查询</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script >
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
var url = "../user/shoptx?name="+$('#name').val()+"&state="+$('#state').val();
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
	            {title:'商家名称',field:'name',width:60,align:'center'},	
	    		{title:'提现发起账号',field:'pno',width:150,align:'center'},
	            {title:'商家提现类别',field:'stype',width:60,align:'center'},
				{title:'提现数额',field:'snum',width:100,align:'center'},
				{title:'提现换算成人民币',field:'rmb',width:100,align:'center'},
				{title:'提现前总额',field:'mtotal',width:100,align:'center'},
				{title:'提现后总额',field:'stotal',width:100,align:'center'},
				{title:'发起时间',field:'add_date',width:100,align:'center'},
				{title:'提现类型',field:'type',width:100,align:'center'},
				{title:'提现账号',field:'spno',width:100,align:'center'},
				{title:'提现账号姓名',field:'sname',width:100,align:'center'},
				{title:'状态',field:'sstate',width:100,align:'center'}
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

function mdmsg(s){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		
		
		var url = "../user/upshoptx?s="+s+"&id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("执行成功！");
				 init();
			}else{
				alert("执行失败！");
			}
		},"json");
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
 			    <td><input type="text" id="name" name="name"/><b>提现状态:</b>
 			      <select id="state">
				            	<option value="">全部</option>
				            	<option value="待审核">待审核</option>
				            	<option value="同意">已同意</option>
				            	<option value="拒绝">已拒绝</option>
				            	</select></td>
				            	
		
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 
		   <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="mdmsg('同意')">同意 </a> 
		    <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="mdmsg('拒绝')">拒绝 </a> 
		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   
</body>
</html>