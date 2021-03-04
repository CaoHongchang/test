<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商家充值查询</title>

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
	var Request = new Object();
	Request = GetRequest();
	$('#ssname').val(Request['name']);
	init();

	$('#noticeGt').click(function() {
		
	    init();

	});
	   var url = "../user/shopinit";
	$.post(url,null,function(data){
		 $("#sjlb").empty();
		 $("#sjlb").append("<option value=''></option>");
		 $.each(data,function(index,item){  		   
			$("#sjlb").append("<option value='"+item.id+"'>"+item.title+" </option>");
		 });
	},"json");
});
function GetRequest() { 
var url = location.search; //获取url中"?"符后的字串 
var theRequest = new Object(); 
if (url.indexOf("?") != -1) { 
var str = url.substr(1); 
strs = str.split("&"); 
for(var i = 0; i < strs.length; i ++) { 
theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]); 
} 
} 
return theRequest; 
} 
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
var url = "../user/shopcz?name="+$('#ssname').val()+"&pno="+$("#spno").val()+"&type="+$("#sjlb").val();
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
	            {title:'商家名称',field:'sname',width:60,align:'center'},	
	    		{title:'商家账号',field:'pno',width:150,align:'center'},
	            {title:'商家类别',field:'sstype',width:60,align:'center'},
				{title:'充值类型',field:'stype',width:100,align:'center'},
				{title:'充值渠道',field:'squdao',width:100,align:'center'},
				{title:'充值账号',field:'spno',width:100,align:'center'},
				{title:'充值账号归属人',field:'name',width:100,align:'center'},
				{title:'充值时间',field:'add_date',width:100,align:'center'},
				{title:'充值人民币',field:'rmb',width:100,align:'center'},
				{title:'充值点币数',field:'spoint',width:100,align:'center'}
				
			]]

});
	
}

    </script>
    
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >	
			<tr>
			
 				<td align="right" nowrap="nowrap"><b>商家名称:</b></td>
 			    <td><input type="text" id="ssname" name="ssname"/></td>
 			    	<td align="right" nowrap="nowrap"><b>商家账号:</b></td>
 			    <td><input type="text" id="spno" name="spno"/></td>
 			    <td align="right" nowrap="nowrap"><b>商家类别:</b>
 			      <select id="sjlb">
				            	<option></option>
				            	</select></td>
				            	
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 
	
		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
  
</body>
</html>