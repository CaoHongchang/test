<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>用户管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#yhglGrid').datagrid({    
    url:'', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#xxnrTool',
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'code2',title:'用户名',width : $(this).width() * 0.2,align:'center'},    
        {field:'name3',title:'姓名',width : $(this).width() * 0.2,align:'center'},    
        {field:'price4',title:'密码',width: $(this).width() * 0.2,align:'center'},
         {field:'zt5',title:'部门',width: $(this).width() * 0.2,align:'center'},
         {field:'sbkssj6',title:'角色',width: $(this).width() * 0.2,align:'center'},
         {field:'pskssj8',title:'有效性',width: $(this).width() * 0.1,align:'center'},
      
         {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="">修改</a> <a href="#" style="color: blue;"  onclick="">失效</a>';
				}   
				}
  
    ]]    
});  
	var pager = $('#yhglGrid').datagrid('getPager');
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






function yhglAddFuc(){
	$('#yhglInfo').dialog({
    title: '用户管理',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/yhglAdd.jsp',
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
				$('#yhglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    
    } //loadEnd
    

});

}





function addygshFuc(){
	$('#yhglInfo').dialog({
    title: '员工审核',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygshAdd.jsp',
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
				$('#yhglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#ldhtGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 150,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'code1',title:'开始时间',width:100},    
        {field:'name2',title:'结束时间',width:100}
         
    
    ]]    
     });  
	var pager = $('#ldhtGrid').datagrid('getPager');
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
	 
	 
	

    
    } //loadEnd
    

});

}




function addygdrFuc(){
	$('#yhglInfo').dialog({
    title: '员工导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygdrAdd.jsp',
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
				$('#yhglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#ygdrGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true}, 
        {field:'code1',title:'组织机构代码',width: $(this).width() *0.15},    
        {field:'name2',title:'企业名称',width: $(this).width() * 0.25},
        {field:'name3',title:'企业性质',width: $(this).width() * 0.1},
        {field:'name4',title:'身份证',width: $(this).width() * 0.25},
        {field:'name5',title:'姓名',width: $(this).width() * 0.1},
        {field:'name6',title:'出生年月',width: $(this).width() * 0.1},
        {field:'name7',title:'性别',width: $(this).width() * 0.1},
        {field:'name8',title:'用工形式',width:$(this).width() * 0.2},
        {field:'name9',title:'审核状态',width:$(this).width() * 0.1},
        {field:'name10',title:'审核意见',width:$(this).width() * 0.3},
        {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="">修改</a> <a href="#" style="color: blue;"  onclick="">删除</a>';
				}   
				}
        
             ]]    
     });  
	var pager = $('#ygdrGrid').datagrid('getPager');
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
	 
	 
	

    
    } //loadEnd
    

});

}


</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="xxnrTool"  style="background-color:#FFFFFF;">
		<a onclick="yhglAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
		
		
	</div>

</div>
<div>
<table id="yhglGrid"></table>  
</div>
<div id="yhglInfo"></div>


</body>
</html>
