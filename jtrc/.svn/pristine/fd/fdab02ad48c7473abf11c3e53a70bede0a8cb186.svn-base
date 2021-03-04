<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>证书管理</title>
</head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript">
	$(function(){
        loadList('');
	});

	function loadList(queryParams){
		var grid = {
			url : '../examCertificateInfo/queryList',
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
						field : 'certificate_id',
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
						field : 'class_name',
						title : '班级名称',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'pnum',
						title : '身份证号',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'name',
						title : '姓名',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'tel',
						title : '手机',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'certificate_type',
						title : '证书类型',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'certificate_num',
						title : '证书编号',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'certificate_name',
						title : '证书名称',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'certificate_time',
						title : '发证时间',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'expiry_date',
						title : '有效期至',
						width : fixWidth(0.3),
						align : 'center'
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
	
	function del() {
		var selectedRows = $("#contentGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要删除的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
	    if(!confirm("确认将选择的证书删除吗?")){
	        return ;
	    }
		var ids=strIds.join(",");
		$.ajax({
			url:'../examCertificateInfo/del',
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: {"ids" : ids},    //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	var resObj = eval("("+data+")");
	            if(resObj.flag == '0'){
	            	$('#contentGrid').datagrid('reload');
	            	 $.messager.alert('系统提示','删除成功');
		        }else{
		        	 $.messager.alert('系统提示','删除失败');
			    }
		    },
		    error: function() {
		        //请求出错处理
		    }
		});
	}
	
	function exp(){
		var url= "<%=request.getContextPath()%>/examCertificateInfo/export";
		window.location.href= url; 
	}
	
	var dateFlag,repeatFlag;
	//兼容ie的导入
	
	function importExcel() {
		dateFlag = true;
		repeatFlag = false;
		$("#importFm").ajaxSubmit({
			dataType : "html",
			url : "../examCertificateInfo/importExcel",
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			async : true,
			beforeSend : function() {
				$.blockUI();
			},
			complete : function() {
				$.unblockUI();
				$('input[type="file"]').attr('value', '');
				$('#importFm')[0].reset();
			},
			success : function(data) {
				var result = $.parseJSON(data);
				if (result.flag == true) {
					dateFlag = result.dateFlag;
					repeatFlag = result.repeatFlag;
					showImport(result.rows);
				} else {
					$.messager.alert('错误', '操作失败！' + result.cause, 'error');
				}

			},
			error : function(data) {
				$.messager.alert('错误', '操作失败！' + data);
			}
		});
	}

	function showImport(data) {
		$('#showImport').dialog({
			title : '证书导入',
			width : 950,
			height : 450,
			closed : false,
			cache : false,
			href : '../zyzgksgl/import.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
					save(data);
					$('#showImport').dialog('close');
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#showImport').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
				$('#importGrid').datagrid({
					url : '',
					border : true,
					pageSize : 10,
					pageList : [ 10, 20, 30, 40 ],
					striped : true,
					height : 360,
					fit : true,
					toolbar : '',
					sortName : '',
					sortOrder : 'desc',
					remoteSort : false,
					columns : [ [ {
						field : 'classNum',
						title : '班级编码',
						width : $(this).width() * 0.1,
						align : 'center'
					}, {
						field : 'className',
						title : '班级名称',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'certificateType',
						title : '证书类型',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'certificateName',
						title : '证书名称',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'cardId',
						title : '身份证',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'userName',
						title : '姓名',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'certificateNum',
						title : '证书编号',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'certificateTime',
						title : '发证时间',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'expiryDate',
						title : '有效期至',
						width : $(this).width() * 0.15,
						align : 'center'
					}, {
						field : 'errMsg',
						title : '错误提示',
						width : $(this).width() * 0.5
					} ] ]
				});
				$('#importGrid').datagrid('loadData', data);
			}
		});
	}

	function save(datas) {
		if (dateFlag != true) {
			$.messager.alert('错误', '保存失败,请核查数据中错误提示 ', 'error');
			return;
		}
		if (repeatFlag) {
			if (!confirm("已有证书是否覆盖保存?")) {
				return;
			}
		}
		$.blockUI();
		$.ajax({
			url : "../examCertificateInfo/save",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			data : JSON.stringify(datas),
			async : true,
			success : function(data) {
				$.unblockUI();
				if (data.flag == true) {
					$.messager.alert('提示', '导入成功 ');
					$('#showImport').dialog('close');
					loadList();
				} else {
					$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
				}
			},
			error : function(data) {
				$.unblockUI();
				$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
			}
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
		    href: '../zyzgksgl/zsglSearch.jsp',    
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
	
	function print(){
		var selectedRows = $("#contentGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要打印的数据！');
			return;
		}
	    if(selectedRows.length>1){
	    	$.messager.alert('系统提示','请选择一条要打印的数据！');
			return;
	    }
		var id=selectedRows[0].certificate_id;
		showWindow(id,'证书打印');
		//window.location.href = encodeURI("zsdy.jsp?id="+id);
	}
	
	function showWindow(id,title){
		$('#printInfo').dialog({
		    title: title,
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: 'zsdy.jsp?id='+id,
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
</script>

<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
	    <div data-options="region:'center',border:false" style="">
	         <div id="zcpshdTool"  style="background-color:#FFFFFF;">
	         	<a id="a" onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<a id="b" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
				<form id="importFm" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
			        <a id="c" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
			        <input  onchange="importExcel()" id="importFile" name= "importFile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入证书</a>
		        </form>
				<a id="d" onclick="exp()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出证书模板</a>
				<a id="e" onclick="print()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">证书打印</a>
			</div>
			<div>
			   <table id="contentGrid"></table>  
			</div>
	    </div>   
	</div>
	<div id="addInfo" align="center"></div>  
	<div id="editInfo" align="center"></div>
	<div id="importInfo" align="center"></div>
	<div id="showImport" align="center"></div>
	<div id="searchInfo" align="center"></div>
	<div id="printInfo" align="center"></div> 
</body>
</html>
