<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
	<head>
		<title>会员领取查询</title>
	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
		
		<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/data/date.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
	    
	    <script type="text/javascript">
	    	$(function() {
	    		$('#noticeGt').click(function() {
	    			init();
	    		});
	    		
	    		init();
	    	});
	    	
	    	function init() {
	    		var pno = $('#zh').val();
	    		
	    		var url = "../userGetInfo/list?pno=" + pno+"&s="+$("#startTime").val()+"&e="+$("#endTime").val();
	    		
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
	    			columns: [[
			            {title: '会员编号', field: 'id', width: 60, align: 'center'},
			            {title: '会员账号', field: 'pno', width: 150, align: 'center', sortable: true},
			    		{title: '捡点币数量', field: 'jpoint', width: 150, align: 'center', sortable: true},
			            {title: '拆红包', field: 'hb', width: 60,  align:'center', sortable: true},
						{title: '日期', field: 'add_date', width: 100, align: 'center', sortable: true}
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
					<td align="right" nowrap="nowrap">
						<b>会员账号:</b>
						<input id="zh" name="zh"  style="width:150px;">
						<b>日期:</b>
					</td>
						<td nowrap="nowrap">
				<input id="startTime"  onClick="WdatePicker({el:'startTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"  name="startTime"  type="text" required="true" style="width:150px;" readonly="readonly"></input>
				 <img onClick="WdatePicker({el:'startTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" src="<%=request.getContextPath()%>/data/datePicker.gif" width="16" height="22" align="absmiddle">
				
				 <b>至:</b>
				 
				  <input id="endTime"  onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"  name="endTime"  type="text" required="true" style="width:150px;" readonly="readonly"></input>
				 <img onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" src="<%=request.getContextPath()%>/data/datePicker.gif" width="16" height="22" align="absmiddle">
				 
				</td>
				</tr>
			</table>
			<div class="datagrid-toolbar">	
				<a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search" onclick="init()">查询</a>
			</div>
			<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
				<div region="center" border="false" split="false">
					<table id="noticeRs" singleSelect="true"></table>
				</div>
			</div>
		</div>
	</body>
</html>