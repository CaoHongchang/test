<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
	<head>
		<title>商家发放查询</title>
	
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
	    		$('#cc').combobox({
	    			url: '../shopFfInfo/selectTitle',
	    			valueField: 'id',
	    			textField: 'title'
	    		});
	    		
	    		$('#noticeGt').click(function() {
	    			init();
	    		});
	    		
	    		init();
	    	});
	    	
	    	function init() {
	    		var name = $('#mc').val();
	    		var pno = $('#zh').val();
	    		
	    		var url ="../shopFfInfo/list?name=" + name + "&pno=" + pno+"&title="+$("#cc").val()+"&s="+$("#startTime").val()+"&e="+$("#endTime").val();
	    		
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
	    				{title: '商家名称', field:'name', width:60, align:'center'},
			            {title: '商家账号', field:'pno', width:150, align:'center', sortable: true},
			    		{title: '商家类别', field:'title', width:150, align:'center', sortable: true},
			            {title: '发放类型', field:'f_type', width:60, align:'center', sortable: true},
						{title: '日期', field:'add_date', width:100, align:'center', sortable: true},
						{title: '发放点币数量', field:'point', width:100, align:'center', sortable: true},
						{title: '每份点币数量', field:'e_point', width:100, align:'center', sortable: true},
						{title: '当日发放份数', field:'d_point', width:100, align:'center', sortable: true}
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
						<b>商家名称:</b>
						<input id="mc" name="mc"  style="width:150px;">
						<b>商家账号:</b>
						<input id="zh" name="zh"  style="width:150px;">
						<b>商家类别:</b>
						<input id="cc" name="dept" value="">  
						<b>发放日期:</b>
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