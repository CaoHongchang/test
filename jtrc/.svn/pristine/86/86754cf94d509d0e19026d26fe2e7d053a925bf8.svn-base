<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>会员充值查询</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
   
    <script>
    $(function() {

	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){
	/*
	var url = "../game.php?doAction=act_getdk";
	$.post(url,null,function(data){
		if(data.flag==1){
			$("#add").hide();
		}
		if(data.flag1==1){
			$("#del").hide();
		}
		if(data.flag2==1){
			$("#md").hide();
		}
	},"json");
	*/
var url = "../user/usercz?pno="+$('#pno').val()+"&startTime="+$('#startTime').val()+"&endTime="+$('#endTime').val();
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
	            {title:'会员账号',field:'id',width:60,align:'center'},
	            {title:'充值类型',field:'stype',width:150,align:'center',sortable:true},
	    		{title:'充值渠道',field:'squdao',width:150,align:'center',sortable:true},
	            {title:'充值账号',field:'spno',width:60,align:'center',sortable:true},
				{title:'充值账号归属人',field:'name',width:100,align:'center',sortable:true},
				{title:'充值时间',field:'add_date',width:100,align:'center',sortable:true},
				{title:'充值人民币',field:'rmb',width:100,align:'center',sortable:true},
				{title:'充值点币数',field:'spoint',width:100,align:'center',sortable:true}
			]]

});
	
}
    </script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
		<table class="table-edit" width="100%" >				
							<%   
          java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
          java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
          String str_date = formatter.format(currentTime); //将日期时间格式化 
 			%> 
 			<tr>
 			  <td align="right" nowrap="nowrap">
 			    <b>会员账号:</b>
 			   <input id="pno" name="pno"  style="width:150px;">
 			   <b>充值时间:</b>
				<td nowrap="nowrap">
				<input id="startTime"  onClick="WdatePicker({el:'startTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"  name="startTime"  type="text" required="true" style="width:150px;" readonly="readonly"></input>
				 <img onClick="WdatePicker({el:'startTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" src="<%=request.getContextPath()%>/data/datePicker.gif" width="16" height="22" align="absmiddle">
				
				 <b>至:</b>
				 
				  <input id="endTime"  onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"  name="endTime"  type="text" required="true" style="width:150px;" readonly="readonly"></input>
				 <img onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" src="<%=request.getContextPath()%>/data/datePicker.gif" width="16" height="22" align="absmiddle">
				 
				</td>
				
				</tr>
				</table>
				<div class="datagrid-toolbar" >	
		    <a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search" onclick="init()">查询</a>
		    </div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
  
</body>
</html>