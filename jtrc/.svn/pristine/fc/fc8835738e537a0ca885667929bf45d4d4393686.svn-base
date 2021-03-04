<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>考务材料管理</title>

<script type="text/javascript">
var acid;
var type;
var id;
$(function(){
	
	id = getParam('id');
		if(id=='' || id == null || id == 'undefined') {
			} else {
				$('#activity_id').combobox('setValue',id);
			}

	activityInit();
	
		
	   $('#cjbgGrid').datagrid({  
		   url:'../bgActivityUserInfo/activityAllUserList?id='+$('#activity_id').combobox('getValue'), 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			//fitColumns:true,
			height: wholeHeight,
			toolbar: '#bmbglTool',
			singleSelect: true,
			pagination:true,
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false, 
			columns:[[
				        {field:'id',title:'选择',checkbox:true,align:'center'},  
				        {field:'ksh',title:'考场号',width : $(this).width() * 0.2,align:'center'},
				        {field:'ksrs',title:'考场人数',width : $(this).width() * 0.2,align:'center'}
				    ]]   
		});  
			var pager = $('#cjbgGrid').datagrid('getPager');
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

function tjinit() {
	$('#cjbgGrid').datagrid({
	    url:'../bgActivityUserInfo/activityAllUserList?id='+$('#activity_id').combobox('getValue'), 
	    border:true,
		striped: true,
		collapsible:true,
		//fitColumns:true,
		//toolbar: '#bkdwTool',
		height: '100%',
		sortName: '',
		sortOrder: 'desc',
		singleSelect: true,
		remoteSort: false,
		
	    columns:[[
	        {field:'id',title:'选择',checkbox:true,align:'center'},  
	        {field:'ksh',title:'考场号',width : $(this).width() * 0.2,align:'center'},
	        {field:'ksrs',title:'考场人数',width : $(this).width() * 0.2,align:'center'}
	    ]]
	});  
	
}

function opendy(tag){
	var row =$('#cjbgGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		if(tag == '1') {
			showWindow('dyryxx','kcryxxInfo',row,'考场人员信息','1');
		} else if(tag == '2') {
			showWindow('dyryxx','kcryxxInfo',row,'考场核对信息','2');
		} else if(tag == '3') {
			showWindow('dyryxx','kcryxxInfo',row,'考场桌贴','3');
		}
	
	}else{
		$.messager.alert('系统提示','请选择您要处理的记录！');
	}
}

function showWindow(dialog,page,row,title,tag){
	
	
	$('#'+dialog).dialog({
	    title: title,
	    width: 750,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../sydwzpgl/'+page+'.jsp?id='+$('#activity_id').combobox('getValue')+'&ksh='+row.ksh+'&type='+tag,
	    modal: true,
	    buttons:[
				{
					text:'打印',
					id:'dy',
					iconCls:'icon-print',
					handler:function(){
						printFuc();
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	    	

	    } //loadEnd

	});

}

function activityInit() {
	$.ajax({
   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/activityList',
   	    dataType: 'JSON',
   	    type: "POST",   //请求方式
   	 	async : false,
   	    success: function(data) {
   	    	var json;
   	    	json = [];
   	    	$.each(data,function(n,value) { 
   	    		if(n == 0  || n == '0') {
   	    			if(id=='' || id == null || id == 'undefined') {
   	    				$('#activity_id').combobox('setValue',value.hdid);
   	    			} else {
   	    				$('#activity_id').combobox('setValue',id);
   	    			}
   	    			
   	    		}
   	    		json.push({"text":value.hdname,"value":value.hdid});
   	    	});
   	    	$("#activity_id").combobox("loadData",json);
   	 },
   	    error: function() {
   	        alert('服务器请求异常');
   	    	//请求出错处理
   	    }
   	});
}

function getParam(paramName) {
    paramValue = "";
    isFound = false;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&");
        i = 0;
        while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) {
                if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                    paramValue = arrSource[i].split("=")[1];
                    isFound = true;
                }
            }
            i++;
        }
    }
    return paramValue;
}

</script>


<body style="margin: 1px;">
 
<div id="tb">
	<div id="bmbglTool"  style="background-color:#FFFFFF;">
		<div data-options="region:'north',border:false" style="padding:5px">
       <label style="margin-left:10px">报考活动：</label>
		     <select class="easyui-combobox" id="activity_id" name="activity_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    tjinit();
						}" style="width:200px;">
			</select>		  
   </div>
		<a onclick="opendy('1');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">打印考生信息表</a>
		<a onclick="opendy('2');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">打印考场信息核对表</a>
		<a onclick="opendy('3');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">打印桌贴</a>
	</div>
</div>

<div>
<table id="cjbgGrid"></table>  
</div>
<div id="dyryxx"></div>
</body>
</html>
