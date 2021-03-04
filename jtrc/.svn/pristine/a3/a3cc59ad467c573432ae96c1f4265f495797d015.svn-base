<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
	<head>
		<title>消息管理</title>
	
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
	    		var title = $('#title').val();
	    		
	    		var url = '../notice/list?title=' + title;
	    		
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
	    				{title: '序号', field:'id', width:60, align:'center', sortable: true},
	    				{title: '消息标题', field:'title', width:60, align:'center', sortable: true},
			            {title: '消息内容', field:'content', width:150, align:'center', sortable: true},
			            {title: '发布时间', field:'p_date', width:60, align:'center', sortable: true}
						
	    			]]
	    		});
	    	}
	    	function closeProduct(){
			$('#w2').window('close');
			init();
		}
		function mdNotice(){
		
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
	
	   $('#w2').window('open');
	    $('#nId').val(row.id);
	    $('#title2').val(row.title);
	    $('#content').val(row.content);
	   $('#endTime').val(row.p_date);
	}else{
	  alert("请选择记录!");
	}
		}
		function publicNotice(){
			$('#w2').window('open');
			$('#nId').val("");
			$('#title2').val("");
		    $('#content').val("");
		    $('#endTime').val("");
		  }
		function saveOrUpdateProductNode(){
	var url;
	if($('#nId').val()=="")
	   url = "../notice/addMsg?title="+$('#title2').val()+"&content="+$('#content').val()+"&id=0&s="+$('#endTime').val();
	else
	   url = "../notice/addMsg?title="+$('#title2').val()+"&content="+$('#content').val()+"&id="+$('#nId').val()+"&s="+$('#endTime').val();
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("执行成功！");
			$('#w2').window('close');
			init();
			
		}else{
			alert("执行失败！");
		}
	},"json");
}
 function delNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
	
	 	var url = "../notice/delMsg?id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
					init();
			}else{
				alert("删除失败！");
			}
		},"json");
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
					<td align="center" nowrap="nowrap">
						<b>消息标题:</b>
						<input id="title" name="title"  style="width:150px;">
					</td>
				</tr>
			</table>
			<div class="datagrid-toolbar">	
				<a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search" onclick="init()">查询</a>
				<a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">新增 </a>
		       <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="mdNotice()">修改 </a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除 </a>
			</div>
			<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
				<div region="center" border="false" split="false">
					<table id="noticeRs" singleSelect="true"></table>
				</div>
			</div>
		</div>
		
		  <div id="w2"  class="easyui-window"  closed="true" title="信息" iconCls="icon-save" style="width:300px;height:350px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:250px;height:250px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">标题：</div>
				            </td>
				            <td>
				            	<input id="title2" name="title2"  style="width:150px;" maxlength="50"></input>
				            </td>
				            </tr>
				     <tr>
				            <td nowrap>
				            	 <div align="right">内容：</div>
				            </td>
				            <td>
				            	<textarea id="content" name="content"  style="width:150px;" maxlength="50"></textarea>
				            </td>
			            </tr>
		
		 <tr>
				            <td nowrap>
				            	 <div align="right">发布时间：</div>
				            </td>
				            <td>
		  <input id="endTime"  onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"  name="endTime"  type="text" required="true" style="width:150px;" readonly="readonly"></input>
				 <img onClick="WdatePicker({el:'endTime',skin:'whyGreen',startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" src="<%=request.getContextPath()%>/data/datePicker.gif" width="16" height="22" align="absmiddle">
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