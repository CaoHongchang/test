<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>意见反馈</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ps/yjfkgl.js"></script>
     <script>
     $(function() {

	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function del(){



			
var ids="";
var rows = $('#noticeRs').datagrid('getSelections');
for(var i=0;i<rows.length;i++){

ids+=rows[i].id+",";
};     

 if (ids.length > 0) { 

        ids = ids.substr(0, ids.length - 1); 

    }

	   var url = "../user/upadviceinfo?ids="+ids;
			
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
				 init();
			}else{
				alert("删除失败！");
			}
		},"json");
	
}
function show(){
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		alert(row.content);
	}else{
		alert("请选择查看内容");
	}
}
function init(){
	
var url = "../user/adviceinfo";
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
	            {field:'id',checkbox:true },
	    		{title:'反馈账号',field:'title',width:150,align:'center'},
	            {title:'反馈内容',field:'content',width:560,align:'center'},
	            {title:'反馈时间',field:'add_date',width:120,align:'center'}
				
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
     
     </script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >				
					<%   
          java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
          java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
          String str_date = formatter.format(currentTime); //将日期时间格式化 
 			%> 
	
			</table>
		    <div class="datagrid-toolbar" >	
		    <a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="show()">查看内容 </a>
		   		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="del()">删除 </a>
		    </div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
  
</body>
</html>