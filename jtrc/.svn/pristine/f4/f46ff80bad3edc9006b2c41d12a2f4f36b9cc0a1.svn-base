<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>部门长和相关部门审核</title>

<script type="text/javascript">
	$(function(){
   
   $('#xgbmbmzshGrid').datagrid({    
    url:'', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#xgbmbmzTool',
	pagination: true, 
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'code2',title:'业务类型',width : $(this).width() * 0.1,align:'center'},    
        {field:'name3',title:'申请人',width : $(this).width() * 0.1,align:'center'},    
        {field:'price4',title:'用工单位',width: $(this).width() * 0.1,align:'center'},
         {field:'zt5',title:'申请时间',width: $(this).width() * 0.1,align:'center'},
         {field:'sbkssj6',title:'受理状态',width: $(this).width() * 0.1,align:'center'},
         {field:'sbjssj7',title:'受理时间',width: $(this).width() * 0.1,align:'center'},
         {field:'pskssj8',title:'驳回意见',width: $(this).width() * 0.1,align:'center'},
         {field:'hdjssj10',title:'部门长审核状态',width: $(this).width() * 0.1,align:'center'},
         {field:'hdjssj11',title:'部门长审核意见',width: $(this).width() * 0.1,align:'center'},
         {field:'hdjssj12',title:'相关部门审核状态',width: $(this).width() * 0.1,align:'center'},
         {field:'hdjssj13',title:'相关部门审核意见',width: $(this).width() * 0.1,align:'center'},
         
         /* {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="">修改</a> <a href="#" style="color: blue;"  onclick="">删除</a>';
				}   
				}
          */
    ]]    
});  
	var pager = $('#xgbmbmzshGrid').datagrid('getPager');
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
	
	
	
	
	});








</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="xgbmbmzTool"  style="background-color:#FFFFFF;">
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
	    <a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">相关部门审核</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>

		
	</div>

</div>
<div>
<table id="xgbmbmzshGrid"></table>  
</div>



</body>
</html>
