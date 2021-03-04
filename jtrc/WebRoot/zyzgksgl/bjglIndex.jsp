<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>班级管理</title>
</head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript">
	$(function(){
		search('');
	});

	function search(queryParams){
		var grid = {
			url : '../examClassInfo/queryList',
			border : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : wholeHeight,
			toolbar : '#zcpshdTool',
			pagination : true,
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
			columns : [ [
					{
						field : 'class_id',
						title : '选择',
						checkbox : true,
						align : 'center'
					},
					{
						field : 'project_name',
						title : '项目名称',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'open_time',
						title : '班级开设时间',
						width : fixWidth(0.3),
						align : 'center',
						formatter: formatterdate
					},
					{
						field : 'class_num',
						title : '班级编号',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'class_name',
						title : '班级名称',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'class_sum',
						title : '班级人数上限',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'class_count',
						title : '当前班级人数',
						width : fixWidth(0.3),
						align : 'center'
					},
				    {
					    title:'操作',
					    field:'cz',
					    width: fixWidth(0.3),
					    align:'center',
			    		formatter: function(value,row,index){
			    		return '<a href="#" id="sc" style="color: blue;"  onclick="edit(' + JSON.stringify(row).replace(/"/g, '&quot;') + ')">修改</a>';
				}   
				}
					
					
			] ]
		};
		if(queryParams && queryParams!=''){
	 		$('#contentGrid').datagrid($.extend(true,grid,{queryParams:{param:queryParams}}));  
		}else{
	 		$('#contentGrid').datagrid(grid);  
		}
		var pager = $('#contentGrid').datagrid('getPager');
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

	function formatterdate(val, row) {
		if (val != null) {
			var date = new Date(val);
			var month;
			if((date.getMonth() + 1)>=10)
				month = date.getMonth() + 1;
			else
				month = '0'+(date.getMonth() + 1);
			var day;
			if(date.getDate()>=10)
				day = date.getDate();
			else
				day = '0'+date.getDate();
			return date.getFullYear() + '-' + month + '-' + day;
		}
	}
	
	function add(){
		try{
			$('#addInfo').dialog('clear');
			$('#editInfo').dialog('clear');
		}
		catch(e){
		}
		$('#addInfo').dialog(
			{
				title : '班级新增',
				width : 400,
				height : 300,
				closed : false,
				cache : false,
				href : '../zyzgksgl/bjglAdd.jsp',
				modal : true,
				buttons : [
						{
							text : '保存',
							iconCls : 'icon-ok',
							handler : function() {
								var isValid = $("#addFm").form('validate');
								if (!isValid) {
									$.messager.progress('close'); // hide progress bar while the form is invalid
									return;
								}
								var parnt = /^[1-9]\d*(\.\d+)?$/;
						        if(!parnt.exec($('#classSum').val())){
						        	$.messager.alert('提示', "请输入大于0正整数");
						        	return;
						        }
								var param = $("#addFm").serializeArray();
								param = JSON.stringify(param);
								$.ajax({
									type : "post",
									cache : false,
									url : "../examClassInfo/save",
									data : {
										'param' : param
									},
									success : function(data) {
										var result = $.parseJSON(data);
										if (result.flag == '0') {
											$.messager.alert('系统提示', "新增成功");
											$('#addInfo').dialog('close');
											$('#contentGrid').datagrid('reload');
										} else {
											$.messager.alert('系统提示', "新增失败");
										}
									}
								});
							}
						}, {
							text : '关闭',
							iconCls : 'icon-cancel',
							handler : function() {
								$('#addInfo').dialog('close');
							}
						} ],
				iconCls : 'icon-save',
				onLoad : function() {
					
				}
			}
		);
	}
	
	function edit(rows){
		try{
			$('#addInfo').dialog('clear');
			$('#editInfo').dialog('clear');
		}
		catch(e){
		}
		$('#editInfo').dialog(
			{
				title : '班级修改',
				width : 400,
				height : 300,
				closed : false,
				cache : false,
				href : '../zyzgksgl/bjglEdit.jsp',
				modal : true,
				buttons : [
						{
							text : '保存',
							iconCls : 'icon-ok',
							handler : function() {
								var isValid = $("#addFm").form('validate');
								if (!isValid) {
									$.messager.progress('close'); // hide progress bar while the form is invalid
									return;
								}
								var parnt = /^[1-9]\d*(\.\d+)?$/;
						        if(!parnt.exec($('#classSum').val())){
						        	$.messager.alert('提示', "请输入大于0正整数");
						        	return;
						        }
								var param = $("#addFm").serializeArray();
								param = JSON.stringify(param);
								$.ajax({
									type : "post",
									cache : false,
									url : "../examClassInfo/update",
									data : {
										'param' : param
									},
									success : function(data) {
										var result = $.parseJSON(data);
										if (result.flag == '0') {
											$.messager.alert('系统提示', "修改成功");
											$('#editInfo').dialog('close');
											$('#contentGrid').datagrid('reload');
										} else {
											$.messager.alert('系统提示', result.errorMsg);
										}
									}
								});
							}
						}, {
							text : '关闭',
							iconCls : 'icon-cancel',
							handler : function() {
								$('#editInfo').dialog('close');
							}
						} ],
				iconCls : 'icon-save',
				onLoad : function() {
					  $('#classNum').textbox('setValue', rows.class_num);
					  $('#projectId').textbox('setValue', rows.project_name);
					  $('#className').textbox('setValue', rows.class_name);
					  $('#classSum').textbox('setValue', rows.class_sum);
					  $('#openTime').datebox('setValue',formatterdate(rows.open_time));
					  $('#classId').val(rows.class_id);
				}
			}
		);
	}
	
	function setStudent(){
		var selectedRows = $("#contentGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要自动分配学员的班级数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].class_id);
		}
		var ids=strIds.join(",");
		$.ajax({
			url:'../examClassInfo/setStudent',
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: {"ids" : ids},    //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	var resObj = eval("("+data+")");
	            if(resObj.flag == '0'){
	            	$('#contentGrid').datagrid('reload');
	            	 $.messager.alert('系统提示','分配成功');
		        }else if(resObj.flag == '1'){
		        	$.messager.alert('系统提示','班级上限已满');
		        }else if(resObj.flag == '2'){
		        	$.messager.alert('系统提示','没有可分配的学员');
		        }else{
		        	 $.messager.alert('系统提示','分配失败');
			    }
		    },
		    error: function() {
		        //请求出错处理
		    }
		});
	}
	
	function detail(){
		var selectedRows = $("#contentGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要查看的数据！');
			return;
		}
		if(selectedRows.length > 1){
			$.messager.alert('系统提示','查看操作只能针对一条记录！');
			return;
		}
		var row = selectedRows[0];
		$('#addInfo').dialog({
		    title: '班级查看',
		    width: 400,
		    height: 300,
		    closed: false,
		    cache: false,
		    href: '../zyzgksgl/bjglDetail.jsp',
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
		    	row.open_time = formatterdate(row.open_time);
				$('#addFm').form('load', row);
		    }
		});
	}
	
	function query(){
		$('#searchInfo').dialog({    
		    title: '',    
		    width: 1000,    
		    height: 300,    
		    closed: false,    
		    cache: false,    
		    href: '../zyzgksgl/bjglSearch.jsp',    
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
</script>


<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
	    <div data-options="region:'center',border:false" style="">
	         <div id="zcpshdTool"  style="background-color:#FFFFFF;">
				<a id="a" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">开设班级</a>
				<a id="b" onclick="setStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">自动分配学员</a>
				<a id="c" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
				<a id="d" onclick="detail()" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
			</div>
			<div>
			   <table id="contentGrid"></table>  
			</div>
	    </div>   
	</div>
	<div id="addInfo"></div>  
	<div id="editInfo"></div>
	<div id="searchInfo"></div>  
</body>
</html>
