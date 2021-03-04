<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案导出管理</title>

<script type="text/javascript">
	$(function(){
   
       init();
	
	
	
	});
function init(){

  $('#dadcGrid').datagrid({    
    url:'../userMgInfoTrol/queryuserMgInfoList', 
     border:true,
	pageSize:100,
	pageList:[100,200,300,400],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#dadcTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'pno',title:'系统编码',width : $(this).width() * 0.1,align:'center'},    
        {field:'dpno',title:'档案号',width : $(this).width() * 0.1,align:'center'},    
        {field:'name',title:'代理人姓名',width: $(this).width() * 0.1,align:'center'},
         
               {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center',
        	formatter: function(value,row,index){
        	if (value == "") {
          	   return value;
			}
            else if (value == '1') {
          	    return "男";
			}else if (value == '0') {
          	    return "女";
		    }else{
				return value;
		    }
	     }},
         {field:'pnum',title:'身份证号',width: $(this).width() * 0.15,align:'center'},
         {field:'tel',title:'联系电话',width: $(this).width() * 0.1,align:'center'},
         {field:'is_s',title:'是否派遣',width: $(this).width() * 0.1,align:'center',
        	 formatter: function(value,row,index){
        	    if (value == 'on') {
               	    return "是";
     			}else if (value == 'off') {
               	    return "否";
     		    }else{
     				return "否";
     		    }
             //if (value == '0') {
           	 //return "待审核";
				//}else if (value == '1') {
           	  //return "审核成功";
				//}else if (value == '2') {
           	  //return "审核失败";
				//}else{
				//	return "未知";
			//	}
			}},
			{title:'操作',field:'aid',width: $(this).width() * 0.2,align:'center',
				formatter: function(value,row,index){
 				 return " <a href='#' style='color: blue;' onclick='queryDa("+value+");' >导出<a>";
 				}  
			}
  
    ]]    
});
	var pager = $('#dadcGrid').datagrid('getPager');
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


function query(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var start = $("#start").datebox("getValue");
	var end = $("#end").datebox("getValue");
	$("#dadcGrid").datagrid("load",{
		dept:dept,
		key:key,
		start:start,
		end:end
	});
}
	 //导出档案信息
function queryDa(id){
	var ids;
	if(id!=null && id!=undefined)
		ids=id;
	else{
		var selectedRows = $("#dadcGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
              //导出全部			
              window.location.href='<%=request.getContextPath()%>/userMgInfoTrol/daAllExport';
		}else{
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		 ids=strIds.join(",");
  		  window.location.href='<%=request.getContextPath()%>/userMgInfoTrol/daExport?ids='+ids;
			
		}
	}
}


function gdqsclglFuc(){
	$('#dadcInfo').dialog({
    title: '档案存放放置管理新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/dacffzglAdd.jsp',
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
				$('#dadcInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    
    } //loadEnd
    

});

}





function addygshFuc(){
	$('#dadcInfo').dialog({
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
				$('#dadcInfo').dialog('close');
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
	$('#dadcInfo').dialog({
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
				$('#dadcInfo').dialog('close');
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
   
	<div id="dadcTool"  style="background-color:#FFFFFF;">
		<a onclick="queryDa()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出</a>
			<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
		
	</div>

</div>
<div>
<select id="dept" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
<input id="key" class="easyui-textbox" data-options="iconCls:''" style="width:150px"> 
&nbsp;&nbsp;
  <label>从：</label><input class="easyui-datebox"   name="start" id="start" size="20" style="height:22px">
<label>到：</label><input class="easyui-datebox"   name="end" id="end" size="20" style="height:22px">

<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="dadcGrid"></table>  
</div>
<div id="dadcInfo"></div>


</body>
</html>
