<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报考岗位管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#bkgwglGrid').datagrid({    
    url:'', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#bkgwTool',
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'code2',title:'单位代码',width : $(this).width() * 0.2,align:'center'},    
        {field:'name3',title:'报考活动名称',width : $(this).width() * 0.2,align:'center'},
        {field:'name4',title:'单位名称',width : $(this).width() * 0.2,align:'center'},
        {field:'name5',title:'考试活动',width : $(this).width() * 0.2,align:'center'},
        {field:'name6',title:'报考岗位代码',width : $(this).width() * 0.2,align:'center'},
        {field:'name7',title:'岗位',width : $(this).width() * 0.2,align:'center'},
        {field:'name8',title:'是否开考',width : $(this).width() * 0.2,align:'center'}

  
    ]]    
});  
	var pager = $('#bkgwglGrid').datagrid('getPager');
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






function bkgwglFuc(){
	$('#bkgwglInfo').dialog({
    title: '报考岗位新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../sydwzpgl/bkgwglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#bkgwglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    
    } //loadEnd
    

});

}








</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="bkgwTool"  style="background-color:#FFFFFF;">
		<a onclick="bkgwglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">开考开关</a>
				
		
	</div>

</div>
<div>

<table id="bkgwglGrid"></table>  
</div>
<div id="bkgwglInfo"></div>


</body>
</html>
