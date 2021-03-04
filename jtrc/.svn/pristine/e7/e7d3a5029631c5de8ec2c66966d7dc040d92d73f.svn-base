<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>项目培训管理</title>
</head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript">
	$(function(){
		//$("#a").hide();
		//$("#b").hide();
		//$("#c").hide();

		/* $.post('../auth/check',null,function(data){
		      $.each(data,function(index,value){
				if(value==254){
					$("#a").show();
				}else if(value==255){
					$("#b").show();
				}else if(value==256){
					$("#c").show();
				}
		});
		},"json"); */

		search('');
	});
	
	function search(queryParams){
		var grid = {
			url : '../examProjectInfo/queryList',
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
						field : 'id',
						title : '选择',
						checkbox : true,
						align : 'center'
					},
					{
						field : 'projectNum',
						title : '项目编号',
						width : $(this).width() *0.15,
						align : 'center'
					},
					{
						field : 'projectName',
						title : '项目名称',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'hostUnit',
						title : '主办单位',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'projectAddress',
						title : '培训地点',
						width : fixWidth(0.3),
						align : 'center'
					},
					{
						field : 'examType',
						title : '培训类型',
						width : fixWidth(0.3),
						align : 'center',
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
					},
					{
						field : 'beginTime',
						title : '开始时间',
						width : fixWidth(0.3),
						align : 'center',
						formatter: formatterdate
					},
					{
						field : 'endTime',
						title : '结束时间',
						width : fixWidth(0.3),
						align : 'center',
						formatter: formatterdate
					},
					{
						field : 'status',
						title : '有效性',
						width : fixWidth(0.3),
						align : 'center',
						formatter: function(value,row,index){
			            	if (value == 1) {
			           	  		return "有效";
							}else if(value==2){
								return "失效";
							}
						}
					},
					{title:'操作',field:'1',width: fixWidth(0.2),align:'center',
			    		formatter: function(value,row,index){
			    			if (row.status == 1) {
			    				return "<a  style=\"color: blue;\"  onclick=\"setStatus("+row.id+","+row.status+")\">失效</a>";
							}else if(row.status==2){
								return "<a  style=\"color: blue;\"  onclick=\"setStatus("+row.id+","+row.status+")\">有效</a>";
							}
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

	function add() {
		$('#addInfo').dialog(
			{
				title : '培训项目新增',
				width : 600,
				height : 450,
				closed : false,
				cache : false,
				href : '../zyzgksgl/pxxmAdd.jsp',
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
								//开始时间大于结束时间
								var oDate1 = new Date($('#begin_time').datetimebox('getValue'));
								var oDate2 = new Date($('#end_time').datetimebox('getValue'));
								var r = /^\+?[1-9][0-9]*$/;
								var examTerm = $('#exam_term').val();
								if(!r.test(examTerm)){
									$.messager.alert('提示','培训期限应为整数');
									return;
								}
								if (oDate1.getTime() > oDate2.getTime()) {
									$.messager.alert('提示','开始时间不能大于结束时间');
									return;
								} else {
									var pics = "";
									var param = $("#addFm").serializeArray();
									param = JSON.stringify(param);
									var length = $("input[name='file_url']").length;
									if (length > 0) {
										for ( var i = 0; i < length; i++) {
											if (pics == "") {
												pics = $("input[name='file_url']").eq(i).val();
											} else {
												pics += "," + $("input[name='file_url']").eq(i).val();
											}
										}
										$.ajax({
											type : "post",
											cache : false,
											url : "../examProjectInfo/save",
											data : {
												'param' : param,
												'file_url' : pics
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
								}
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
	    if(!confirm("确认将选择的项目删除吗?")){
	        return ;
	    }
		var ids=strIds.join(",");
		$.ajax({
			url:'../examProjectInfo/del',
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

	function update() {
		var selectedRows = $("#contentGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要编辑的数据！');
			return;
		}
		if(selectedRows.length > 1){
			$.messager.alert('系统提示','编辑操作只能针对一条记录！');
			return;
		}
		var row = selectedRows[0];
		$('#editInfo').dialog(
				{
					title : '培训项目修改',
					width : 600,
					height : 450,
					closed : false,
					cache : false,
					href : '../zyzgksgl/pxxmEdit.jsp',
					modal : true,
					buttons : [
							{
								text : '保存',
								iconCls : 'icon-ok',
								handler : function() {
									var isValid = $("#editFm").form('validate');
									if (!isValid) {
										$.messager.progress('close'); // hide progress bar while the form is invalid
										return;
									}
									//开始时间大于结束时间
									var oDate1 = new Date($('#beginTime').datetimebox('getValue'));
									var oDate2 = new Date($('#endTime').datetimebox('getValue'));
									var r = /^\+?[1-9][0-9]*$/;
									var examTerm = $('#examTerm').val();
									if(!r.test(examTerm)){
										$.messager.alert('提示','培训期限应为整数');
										return;
									}
									if (oDate1.getTime() > oDate2.getTime()) {
										$.messager.alert('提示','开始时间不能大于结束时间');
										return;
									} else {
										var pics = "";
										var param = $("#editFm").serializeArray();
										param = JSON.stringify(param);
										var length = $("input[name='file_url']").length;
										if (length > 0) {
											for ( var i = 0; i < length; i++) {
												if (pics == "") {
													pics = $("input[name='file_url']").eq(i).val();
												} else {
													pics += "," + $("input[name='file_url']").eq(i).val();
												}
											}
										}else{
											pics = $('#fileUrl').val();
										}
										var data = $('#editFm').formSerialize()+'&fileUrl='+pics;
										$.ajax({
											type : "post",
											cache : false,
											url : "../examProjectInfo/update",
											data : data,
											success : function(data) {
												var result = $.parseJSON(data);
												if (result.flag == '0') {
													$.messager.alert('系统提示', "修改成功");
													$('#editInfo').dialog('close');
													$('#contentGrid').datagrid('reload');
												} else {
													$.messager.alert('系统提示', "修改失败");
												}
											}
										});
									}
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
						row.beginTime = formatterdate(row.beginTime);
						row.endTime = formatterdate(row.endTime);
						var str = '<tr id="tr1"><td>' + row.fileUrl+'</td>';
		                str +='<td><a href="javascript:delPic();" class="btn-lightblue">删除</a></td></tr>';
						$('#editFm').form('load', row);
						$('#fileTable').append(str);
					}
				});
	}

	function getSelectRowId() {
		var rows = $('#contentGrid').datagrid('getSelections');
		var ids = "";
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				if (ids == "") {
					ids = rows[i].id;
				} else {
					ids += "," + rows[i].id;
				}
			}
		}
		return ids;
	}
	
	function setStatus(id,status){
		var ids='';
		if(id==''||id==undefined||status==''||status==undefined){
			var selectedRows = $("#contentGrid").datagrid('getSelections');
			if(selectedRows.length == 0){
				$.messager.alert('系统提示','请选择一条要编辑的数据！');
				return;
			}
			var flag = true;
			for(var i=0;i<selectedRows.length;i++){
				var row = selectedRows[i];
				if(i==0){
					status = row.status;
					ids = row.id;
				}else{
					ids += ','+row.id;
					if(status!=row.status){
						flag = false;
					}
				} 
			}
			if(!flag){
				status = '1';
			}else{
				if(status=='1')
					status='2';
				else
					status='1';
			}
		}else{
			if(status=='1')
				status='2';
			else
				status='1';
			ids=id;
		}
		$.ajax({
			type : "post",
			cache : false,
			url : "../examProjectInfo/setStatus",
			data : {
				'ids': ids,
                'status': status
			},
			success : function(data) {
				var result = $.parseJSON(data);
				if (result.flag == '0') {
					$.messager.alert('系统提示', "修改成功");
					$('#contentGrid').datagrid('reload');
				} else {
					$.messager.alert('系统提示', "修改失败");
				}
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
		    href: '../zyzgksgl/pxxmSearch.jsp',    
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
				<a id="a" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
				<a id="b" onclick="update()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
				<a id="c" onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<a id="d" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
				<a id="e" onclick="setStatus()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">有效/失效</a>
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
