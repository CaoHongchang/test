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
				{field:'acName',title:'招聘活动名称',width:$(this).width()*0.2,align:'center'},
				{field:'code',title:'组织机构代码',width:$(this).width()*0.2,align:'center'},
				{field:'postCode',title:'岗位代码',width:$(this).width()*0.2,align:'center'},
				{field:'postName',title:'岗位名称',width:$(this).width()*0.2,align:'center'},
				{field:'recruitmentNum',title:'招考人数',width:$(this).width()*0.2,align:'center'},
				{field:'ageRange',title:'年龄',width:$(this).width()*0.1,align:'center'},
				{field:'genderRange',title:'性别',width:$(this).width()*0.1,align:'center'},
				{field:'nationRange',title:'民族',width:$(this).width()*0.1,align:'center'},
				{field:'politicalStatusRange',title:'政治面貌',width:$(this).width()*0.2,align:'center'},
				{field:'educationRange',title:'文化程度',width:$(this).width()*0.2,align:'center'},
				{field:'schoolRange',title:'学位',width:$(this).width()*0.1,align:'center'},
				{field:'educationTypeRange',title:'学历',width:$(this).width()*0.1,align:'center'},
				{field:'professionRange',title:'专业',width:$(this).width()*0.1,align:'center'},
				{field:'paperStyle',title:'试卷类型',width:$(this).width()*0.2,align:'center'},
				{field:'examinationName',title:'考试名称',width:$(this).width()*0.2,align:'center'},
				{field:'examinationPlace',title:'考试地点',width:$(this).width()*0.25,align:'center'},
				{field:'examinationSubject',title:'考试科目',width:$(this).width()*0.2,align:'center'},
				{field:'isStart',title:'是否开考',width:$(this).width()*0.2,align:'center'},
				{field:'othersRange',title:'其他要求',width:$(this).width()*0.2,align:'center'},
				{field:'remark',title:'备注',width:$(this).width()*0.3,align:'center'},
				{field:'errMsg',title:'错误提示',width:$(this).width()*0.3,align:'center',nowrap:false}
				]]
		  });
		});
		
  </script>
     <form id="fm" method="post" >
		<table id="fileImportGrid"></table>
	 </form>
  </body>
  
</html>
