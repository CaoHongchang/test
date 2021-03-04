<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
  </head>
  
  <body style="margin: 1px;">
  <script type="text/javascript">
        $(function(){
			//定义datagrid
			 $("#fileImportGrid").datagrid({
			    title:'',
				url:'',
				border:true,
                striped: true,
                collapsible:false,
                fitColumns:true,
				height:600,
				width:'100%',
				pageSize:10,
                pageList:[10,20,30,40],
				pagination:true,
				columns:[[
				{field:'name',title:'姓名',width:$(this).width()*0.05,align:'center'},
				{field:'sex',title:'性别',width:$(this).width()*0.05,align:'center'},
				{field:'pnum',title:'身份证号码',width:$(this).width()*0.1,align:'center'},
				{field:'birthDate',title:'出生年月',width:$(this).width()*0.1,align:'center'},
				{field:'school',title:'毕业院校',width:$(this).width()*0.1,align:'center'},
				{field:'major',title:'所属专业',width:$(this).width()*0.1,align:'center'},
				{field:'graduationTime',title:'毕业时间',width:$(this).width()*0.1,align:'center'},
				{field:'dpno',title:'档案号',width:$(this).width()*0.1,align:'center'},
				{field:'DState',title:'档案状态',width:$(this).width()*0.1,align:'center'},
				{field:'ZDate',title:'转入时间',width:$(this).width()*0.1,align:'center'},
				{field:'errMsg',title:'错误提示',width:$(this).width()*0.1,align:'center',nowrap:false}
				]]
		  });
		});
		
  </script>
     <form id="fm" method="post" >
		<table id="fileImportGrid"></table>
	 </form>
  </body>
  
</html>
