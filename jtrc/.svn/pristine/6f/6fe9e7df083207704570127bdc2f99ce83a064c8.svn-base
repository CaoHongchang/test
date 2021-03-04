<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案信息管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
	$(function(){
   $('#xljytjlGrid').datagrid({    
    url:'../userInfoTrol/getxltjlist', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	height: '80%',
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
	singleSelect:false,
    columns:[[    
         {field:'org_name',title:'机构名称',align:'center'},
		 {field:'name',title:'姓名',align:'center'},
		 {field:'dpno',title:'档案号',align:'center'},
		 {field:'pnum',title:'身份证号码',align:'center'},
		 {field:'sex',title:'性别',align:'center'},
		 {field:'zzmm',title:'政治面貌',align:'center'},
		 {field:'domicile',title:'户籍地',align:'center'},
		 {field:'human_out1',title:'外包单位',align:'center'},
		 {field:'bd_unit',title:'派遣单位',align:'center'},
		 {field:'point_proxy1',title:'代理单位',align:'center'},
		 {field:'work_name',title:'工作单位',align:'center'},
		 {field:'in_point',title:'调入单位',align:'center'},
		 {field:'in_date',title:'调入时间',align:'center'},
		 
		 {field:'doctor_school_name',title:'博士研究生毕业院校',align:'center'},
		 {field:'doctor_graduation_date',title:'博士研究生毕业时间',align:'center'},
		 {field:'doctor_major',title:'学习专业',align:'center'},
		
		 {field:'master_school_name',title:'硕士研究生毕业学校',align:'center'},
		 {field:'master_graduation_date',title:'硕士研究生毕业时间',align:'center'},
		 {field:'master_major',title:'学习专业',align:'center'},
		 
		 {field:'bachelor_school_name',title:'大学本科毕业学校',align:'center'},
		 {field:'bachelor_graduation_date',title:'大学本科毕业时间',align:'center'},
		 {field:'bachelor_major',title:'学习专业',align:'center'},
		 
		 {field:'specialized_school_name',title:'大学专科毕业学校',align:'center'},
		 {field:'specialized_graduation_date',title:'大学专科毕业时间',align:'center'},
		 {field:'specialized_major',title:'学习专业',align:'center'},
		  
		 {field:'high_school_name',title:'高中毕业学校',align:'center'},
		 {field:'high_graduation_date',title:'高中毕业时间',align:'center'},
		 
		 
		 {field:'technical_school_name',title:'中专毕业学校',align:'center'}	,
		 {field:'technical_graduation_date',title:'中专毕业时间',align:'center'},
		 {field:'technical_major',title:'学习专业',align:'center'}
    ]],
    onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.id;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.name;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.tel;//联系电话
		setArchiveHead();
	}
});  

var pager = $('#xljytjlGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
		}} ]
	});
});



function query(){
	var key = $("#key").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	$("#xljytjlGrid").datagrid("load",{
		key:key,
		pnum:pnum,
		name:name
	});
}

function Exportexecl(){
	 $.messager.progress({ // 显示进度条  
       title:"材料目录下载",  
           text:"正在下载...",  
           interval:500  
          });  
	window.location='<%=request.getContextPath()%>/userInfoTrol/exportxltjlist';
	 setTimeout(function(){
		  $.messager.progress('close'); 
	   },70000); 
}


</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="Exportexecl();" id="a" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">导出execl</a>
	</div>
</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<label>档案号：</label>
<input class="easyui-textbox" value="${sessionUserName}" data-options="iconCls:''" id="key" style="width:150px">
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >

<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="xljytjlGrid" ></table>  
</div>
</body>
</html>
