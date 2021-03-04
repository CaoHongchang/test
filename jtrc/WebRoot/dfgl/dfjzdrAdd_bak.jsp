<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>党费基准导入</title>
</head>

<body>
	<form id="fm" method="post">
		<div data-options="region:'center',border:false" style="">
	         <div id="dfjjTool"  style="background-color:#FFFFFF;">
	            <a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
			</div>
			<div>
			   <table id="dfjzGrid"></table>  
			</div>
	    </div>   
	</form> 
	<script type="text/javascript">
	$(function(){
        dfjzList();
	});

	function dfjzList(){
		var dg = $('#dfjzGrid').datagrid( {
		 data : [
					{"code1":"FI-SW-01","name1":"Koi1","name2":11.00,"name3":"P1"},
					{"code1":"FI-SW-01","name1":"Koi2","name2":10.00,"name3":"P2"},
					{"code1":"FI-SW-01","name1":"Koi3","name2":10.00,"name3":"P3"}
				  ],
			border : true,
			rownumbers:true,
			singleSelect:false,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
			columns:[[    
	            {field:'code1',title:'身份证',width:150},    
	            {field:'name1',title:'年份',width:100},    
	            {field:'name2',title:'缴费基准',width:150},    
	            {field:'name3',title:'错误信息',width:200} 
	        ]]
		});
			 		
    }

    function del(){
    	var row = $('#dfjzGrid').datagrid('getSelections');  
    	if (row.length>0) {  
    		$.messager.confirm('Confirm', '确定删除吗?', function(r) {  
    		    $('#dfjzGrid').datagrid('reload');  
    		});  
    	}  
    		    	
    }
	</script>
</body>

</html>

