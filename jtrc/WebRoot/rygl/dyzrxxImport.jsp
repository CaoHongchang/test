<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>党员转入</title>

<script type="text/javascript"> 
	$(function(){
   
   $('#dyzrImGrid').datagrid({    
    url:'', 
    border:true,
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'bjbm',title:'序号',width: 100, align:'center'},
         {field:'sfzh',title:'身份证',width: 200, align:'center'},
         {field:'whcd',title:'组织关系介绍信编号',width: 200, align:'center'},
         {field:'dh',title:'转入时间',width: 200, align:'center'},
         {field:'bz',title:'转入地',width: 150, align:'center'},
         {field:'cwts',title:'错误信息',width: 150, align:'center'}
    ]]    
});  
});
 
  
 
</script>


<body style="margin: 1px;">
<table id="dyzrImGrid"></table>  
</body>
</html>
