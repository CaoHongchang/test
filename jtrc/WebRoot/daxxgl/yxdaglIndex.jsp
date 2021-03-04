<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>意向档案管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#yxdaglGrid').datagrid({    
    url:'', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'code2',title:'系统编码',width : $(this).width() * 0.2,align:'center'},    
        {field:'name3',title:'档案号',width : $(this).width() * 0.2,align:'center'},    
        {field:'price4',title:'代理人姓名',width: $(this).width() * 0.2,align:'center'},
         {field:'zt5',title:'性别',width: $(this).width() * 0.2,align:'center'},
         {field:'sbkssj6',title:'身份证号',width: $(this).width() * 0.2,align:'center'},
         {field:'sbjssj7',title:'联系电话',width: $(this).width() * 0.1,align:'center'},
         {field:'pskssj8',title:'是否派遣',width: $(this).width() * 0.1,align:'center'},
      
         {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="">修改</a> <a href="#" style="color: blue;"  onclick="">删除</a>';
				}   
				}
  
    ]]    
});  
	var pager = $('#yxdaglGrid').datagrid('getPager');
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






function addjbxxFuc(){
	$('#yxdaInfo').dialog({
    title: '档案新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/jbxxAdd.jsp',
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
				$('#yxdaInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
      
      $('#daxzTab').tabs('select', 1);           
	
    
    } //loadEnd
    

});

}








</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="addjbxxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		
	</div>

</div>
<div>
<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="aa">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" data-options="iconCls:''" style="width:150px"> 
<a class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="yxdaglGrid"></table>  
</div>
<div id="yxdaInfo"></div>


</body>
</html>
