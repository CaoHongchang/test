<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<title>报名表管理</title>

<script type="text/javascript">

$(function(){
   $('#contentGrid1').datagrid({    
    	url:basePath+"examRegister/getProjectList", 
     	border:true,
	 	pageSize:10,
	 	pageList:[10,20,30,40],
	 	striped: true,
	 	singleSelect: true,
	 	collapsible:true,
	 	fitColumns:true,
		height: '100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
    	columns:[[    
        	{field:'id',title:'选择',align:'center',hidden:true},
        	{field:'projectNum',title:'项目编号',width : $(this).width() * 0.01,align:'center'},
        	{field:'projectName',title:'项目名称',width : $(this).width() * 0.01,align:'center'},
        	{field:'examType',title:'培训类别',width : $(this).width() * 0.01,align:'center',
	            formatter: function(value,row,index){
	            	if (value == 1) {
	            	  return "安全三类人员新取证考试";
					}else if (value == 2) {
	            	  return "安全三类人员继续教育考试";
					}else if (value == 3) {
	            	  return "安全考评员新取证考试";
					}else if (value == 4) {
	            	  return "安全考评员继续教育考试";
					}else if (value == 5) {
	            	  return "专业技术人员继续教育考试";
					}else{
						return "未知";
					}
				}
        	}   
    	]],
    	onClickRow:function(rowIndex, rowData){
    		setListDate("",rowData.id);
    	}
	});   
		var pager = $('#contentGrid1').datagrid('getPager');
		pager.pagination({
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '/ {pages} 页',
			displayMsg : '',
			buttons : [ {
				iconCls : 'icon-excel',
				handler : function() {
				}
			} ]
		});
});

var activityId ;
function setListDate(queryParams,id){
	activityId = id;
	var grid = {    
	    url:basePath+"examRegister/getStudentList?id="+activityId, 
	  	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		singleSelect: true,
		fitColumns:true,
		height: wholeHeight,
		width:1600,
		toolbar: '#gridTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
	    columns:[[    
	         {field:'id',title:'选择',hidden:true,align:'center'},
	         {field:'name',title:'姓名',width : fixWidth(0.2),align:'center'},    
	         {field:'pnum',title:'身份证号',width : fixWidth(0.2),align:'center'},    
	         {field:'birth_date',title:'出生年月',width : fixWidth(0.2),align:'center',formatter: formatterdate},   
	         {field:'tel',title:'联系电话',width: fixWidth(0.3),align:'center'},
	         {field:'work_name',title:'工作单位',width: fixWidth(0.2),align:'center'},
	         {field:'post',title:'职务',width: fixWidth(0.2),align:'center'},
	         {field:'audit_person',title:'审核人',width: fixWidth(0.2),align:'center'},
	         {field:'audit_status',title:'审核状态',width: fixWidth(0.2),align:'center'},
	         {field:'audit_opinion',title:'审核意见',width: fixWidth(0.2),align:'center'},
			 {title:'操作',field:'1',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
 				      return "<a  style=\"color: blue;\"  onclick=\"detail("+row.id+")\">查看</a>&nbsp;&nbsp;<a  style=\"color: green;\" onclick=\"audit("+row.id+",'"+row.audit_status+"')\" >审核</a> ";
				}   
			 }

	    ]]    
	}; 
	if(queryParams && queryParams!=''){
 		$('#contentGrid2').datagrid($.extend(true,grid,{queryParams:{param:queryParams}}));  
	}else{
 		$('#contentGrid2').datagrid(grid);  
	}
	var pager = $('#contentGrid2').datagrid('getPager');
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
 
//弹出查询框
function query(){
    $('#searchInfo').dialog({    
	    title: '',    
	    width: 1000,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: '../zyzgksgl/bmbglSearch.jsp',    
	    modal: true,
	    buttons:[{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
				$('#searchInfo').dialog('close');
			}
		}]   
	}); 
}

function formatterdate(val, row) {
	if (val != null) {
		return (val.substring(0,4) + '-' + val.substring(4));
	}
}

function detail(id){
	$('#addInfo').dialog({
	    title: '报名查看',
	    width: 800,
	    height: 350,
	    closed: false,
	    cache: false,
	    href: '../zyzgksgl/bmbglDetail.jsp',
	    modal: true,
	    buttons:[ {
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#addInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function() {
	    	$.ajax({
				url:'../examRegister/detail',
			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    data: {"id" : id},    //参数值
			    type: "POST",   //请求方式
			    success: function(data) {
			    	data.birth_date = formatterdate(data.birth_date);
			    	if(data.exam_type=='1'){
			    		data.exam_type="安全三类人员新取证考试";
					}else if (data.exam_type=='2') {
						data.exam_type="安全三类人员继续教育考试";
					}else if (data.exam_type=='3') {
						data.exam_type="安全考评员新取证考试";
					}else if (data.exam_type=='4') {
						data.exam_type="安全考评员继续教育考试";
					}else if (data.exam_type=='5') {
						data.exam_type="专业技术人员继续教育考试";
					}
			    	alert(data.certificate_num);
					$('#addFm').form('load', data);
			    },
			    error: function() {
			        //请求出错处理
			    }
			});
	    }
	});
}

function audit(id,auditStatus){
	if(auditStatus!='待审核'){
		$.messager.alert('系统提示', "当前状态无法审核");
		return;
	}
	$('#addInfo').dialog({
	    title: '报名审核',
	    width: 800,
	    height: 350,
	    closed: false,
	    cache: false,
	    href: '../zyzgksgl/bmbglAudit.jsp',
	    modal: true,
	    buttons:[ {
					text : '保存',
					iconCls : 'icon-ok',
					handler : function() {
						var isValid = $("#addFm").form('validate');
						if (!isValid) {
							$.messager.progress('close'); // hide progress bar while the form is invalid
							return;
						}
						var param = $("#addFm").serializeArray();
						param = JSON.stringify(param);
						$.ajax({
							type : "post",
							cache : false,
							url : "../examRegister/audit",
							data : {
								'param' : param
							},
							success : function(data) {
								var result = $.parseJSON(data);
								if (result.flag == '0') {
									$.messager.alert('系统提示', "审核成功");
									$('#addInfo').dialog('close');
									$('#contentGrid2').datagrid('reload');
								} else {
									$.messager.alert('系统提示', "审核失败");
								}
							}
						});
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#addInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function() {
	    	$.ajax({
				url:'../examRegister/detail',
			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    data: {"id" : id},    //参数值
			    type: "POST",   //请求方式
			    success: function(data) {
			    	data.birth_date = formatterdate(data.birth_date);
			    	if(data.exam_type=='1'){
			    		data.exam_type="安全三类人员新取证考试";
					}else if (data.exam_type=='2') {
						data.exam_type="安全三类人员继续教育考试";
					}else if (data.exam_type=='3') {
						data.exam_type="安全考评员新取证考试";
					}else if (data.exam_type=='4') {
						data.exam_type="安全考评员继续教育考试";
					}else if (data.exam_type=='5') {
						data.exam_type="专业技术人员继续教育考试";
					}
					$('#addFm').form('load', data);
			    },
			    error: function() {
			        //请求出错处理
			    }
			});
	    }
	});
}

</script>

<body style="margin: 1px;">
	<div id="gridTool" style="background-color:#FFFFFF;">
		<a id="a" onclick="query()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search',plain:true">查询</a>
	</div>
	<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
		<div
			data-options="region:'west',title:'培训项目列表',split:true,border:false"
			style="width:300px;">
			<table id="contentGrid1"></table>
		</div>
		<div data-options="region:'center',title:'报名人员列表',border:false">
			<table id="contentGrid2"></table>
		</div>
	</div>
	<div id="addInfo"></div>
	<div id="searchInfo"></div>
</body>
</html>