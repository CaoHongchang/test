<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>户口信息管理</title>

<script type="text/javascript">
$(function(){
	init();
});
function init(){
	showIndex('');
		if(window.top.cacheArchive.cacheDpno){
			$("#hkxxglGrid").datagrid("load",{
				dept:"daNum",
				key:window.top.cacheArchive.cacheDpno
			});
		}

}
function doSearch(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#p_no").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	$("#hkxxglGrid").datagrid("load",{
		dept:dept,
		key:key,
		pnum:pnum,
		name:name,
		age:age
	});
}
function showIndex(param){
	
	$('#hkxxglGrid').datagrid({    
		url:'<%=request.getContextPath()%>/hkxx/GetHkxxHisInformation', 
		//url:'<%=request.getContextPath()%>/hkxx/GetHkxxHisInformation1', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		//fitColumns:true,
		height: wholeHeight,
		toolbar: '#zcpshdTool',
		queryParams: {
			"param": param,
			dept:"daNum",
			key:window.top.cacheArchive.cacheDpno
		},
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
		pagination:true,
		singleSelect:true,
	    columns:[[    
	         
	         {field:'uid',title:'选择',checkbox:true,align:'center'},
	         {field:'id',title:'id',width : $(this).width() * 0.1,align:'center',hidden:true},  
	         {field:'dpno',title:'档案号',width : fixWidth(0.15),align:'center'},    
	         {field:'NAME',title:'代理人姓名',width: fixWidth(0.15),align:'center'},
	         {field:'j_date',title:'户口借出时间',width: fixWidth(0.1),align:'center'},
	         {field:'j_name',title:'户口借出人',width: fixWidth(0.1),align:'center'},
			 {field:'purpose',title:'户口借出用途',width: fixWidth(0.15),align:'center'},
	    	 {field:'b_date',title:'户口归还时间',width: fixWidth(0.1),align:'center'},
			 {field:'q_name',title:'户口归还签收人',width: fixWidth(0.15),align:'center'}
			 
			/* 这块对应的是GetHkxxHisInformation1的接口返回数据，主要是用于防止用户需求变更
			 {field:'uid',title:'选择',checkbox:true,align:'center'},
	         {field:'id',title:'id',width : $(this).width() * 0.15,align:'center',hidden:true},  
	         {field:'dpno',title:'档案号',width : fixWidth(0.1),align:'center'},    
	         {field:'NAME',title:'代理人姓名',width: fixWidth(0.1),align:'center'},
	         {field:'type',title:'借出/归还',width: fixWidth(0.1),align:'center'},
	         {field:'userName',title:'户口借出人/户口归还签收人',width: fixWidth(0.2),align:'center'},
			 {field:'USER',title:'户口借出用途',width: fixWidth(0.2),align:'center'},
	    	 {field:'j_date',title:'户口借出时间/户口归还时间',width: fixWidth(0.2),align:'center'},
			*/
	    ]] ,
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.ID;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.NAME;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.tel;//联系电话
		setArchiveHead();
	}
	});
		var pager = $('#hkxxglGrid').datagrid('getPager');
		pager.pagination({
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '/ {pages} 页',
			displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
			buttons : [ {
				iconCls : 'icon-excel',
				handler : function() {
				}
			} ]
		});
}

</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include> 

<div id="tb">
<div id="zcpshdTool"  style="background-color:#FFFFFF;"></div>
</div>
<div>
<select id="dept" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" id="p_no" data-options="iconCls:''" style="width:150px"> 
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >
&nbsp;&nbsp;
<label>年龄：</label>
<select class="easyui-combobox" value="" name="seachAge" id="searchAge" data-options="editable:false,panelHeight:null" style="width:150px;">
  <option value="">所有</option>
  <option value="30">30以下</option>
  <option value="40">31-40岁</option>
  <option value="50">41-50岁</option>
  <option value="60">51岁以上</option>
</select>
<a class="easyui-linkbutton" onclick="doSearch();" data-options="iconCls:'icon-search',plain:true">查询</a>
<table id="hkxxglGrid"></table> 
</div>

</body>
</html>
