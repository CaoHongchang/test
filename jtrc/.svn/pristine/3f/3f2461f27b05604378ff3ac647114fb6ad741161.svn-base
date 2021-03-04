<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>

<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<title>专场招聘会申请管理</title>
<script type="text/javascript">
	$(function() {
		// 加载招聘会
		$('#fairGrid').datagrid({
			url : eve.path + '/jobFair/queryJobFairs',
			border : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : '100%',
			singleSelect :true,
			pagination : true,
			remoteSort : false,
			columns : [ [ {
				field : 'name',
				title : '招聘会名称',
				width : 25,
				align : 'center'
			}, {
				field : 'hold_time',
				title : '举办时间',
				width : 20,
				align : 'center'
			}, {
				field : 'type',
				title : '性质',
				formatter : function(value, row, index) {
					if (value == '1')
						return '普通专场招聘会';
					else if (value == '2')
						return '毕业生专场招聘会';
				},
				width : 30,
				align : 'center'
			}]],
	       onLoadSuccess : function(data){
	    	    if (data.rows.length != 0) {  
	    	        $('#fairGrid').datagrid("selectRow", 0);
	    	        var data = $('#fairGrid').datagrid('getSelected');
	    	        $("#fairid").val(data.id);
	    	    }  
	       } ,
	       onSelect : function(rowIndex, rowData){
	    	   $("#fairid").val(rowData.id);
	    	   selectSubmit();
	       }
		});
		

		// 加载企业列表
		$('#enterpriseGrid').datagrid({
			border : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : '100%',
			pagination : true,
			singleSelect :true,
			remoteSort : false,
			columns : [ [ {
				field : 'id',
				title : '选择',
				checkbox : true,
				align : 'center'
			}, {
				field : 'create_time',
				title : '申请时间',
				width : 30,
				align : 'center'
			}, {
				field : 'c_code',
				title : '组织机构代码',
				width : 30,
				align : 'center'
			}, {
				field : 'enterprise_name',
				title : '企业名称',
				width : 30,
				align : 'center'
			}, {
				field : 'area_no',
				title : '区数',
				width : 20,
				align : 'center'
			}, {
				field : 'position_no',
				title : '展位号',
				width : 20,
				align : 'center'
			}, {
				field : 'status',
				title : '申请审核状态',
				formatter : function(value, row, index) {
					if (value == '0')
						return '待审核';
					else if (value == '1')
						return '审核通过';
					else if (value == '2')
						return '审核未通过';
				},
				width : 30,
				align : 'center'
			} , {
				field : 'reason',
				title : '审核说明',
				width : 20,
				align : 'center'
			}, {
			   title:'操作',field:'uid',width:50,align:'center',
    		   formatter: function(value,row,index){
                  var id=row.id;
                  var status = row.status;
		          return '<a href="javascript:detailPost(\''+id+'\')" style="color: blue;">查看</a> <a href="javascript:reviewPost(\''+id+'\',\''+status+'\')" style="color: blue;">审核</a>';
		       }   
	       }] ]
		});
		
		$("#c2 .pagination-info").hide();
	});
	
	// 查看详细
	function detailPost(id) {
		var rows = $("#enterpriseGrid").datagrid('getData').rows;
		var rowindex;  
		for (var i = 0; i < rows.length; i++) {
		    if (rows[i]['id'] == id) {  
		        rowindex = i;  
		        break;  
		    }  
		} 
		var row = $("#enterpriseGrid").datagrid('getData').rows[rowindex];
		var param = { 
			'fairapplyid' : row.id,
			'enterpriseid' : row.enterprise_id,
			'type' : 1,
			'fairid' : row.fair_id,
			'areaid' : row.area_id
		};
		$('#detailDig').dialog({
            title: '企业申请查看',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            href: eve.path + '/jobFairApply/get',
            modal: true,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#detailDig').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	
	// 审核
	function reviewPost(id, status) {
		var rows = $("#enterpriseGrid").datagrid('getData').rows;
		var rowindex;  
		for (var i = 0; i < rows.length; i++) {
		    if (rows[i]['id'] == id) {  
		        rowindex = i;  
		        break;  
		    }  
		} 
		var row = $("#enterpriseGrid").datagrid('getData').rows[rowindex];
		if(row.status !=0 ){
			$.msg("当前状态不能审核!");return;
		}
		var param = { 
			'fairapplyid' : row.id,
			'enterpriseid' : row.enterprise_id,
			'type' : 0,
			'fairid' : row.fair_id,
			'areaid' : row.area_id
		};
		$('#editDig').dialog({
            title: '企业申请审核',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            method : 'post',
            href: eve.path + '/jobFairApply/get',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fms").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fms"));
                    	var len = $('input[name="status"]:checked', $("#fms")).length;
                    	if(len==0){
                    		$.msg('请选择申请审核状态。');
                    		return;
                    	}
                    	$.ajax({
                    		url: eve.path + '/jobFairApply/review',
                    		context:this,
                    		data : obj,
                    		type:'POST',
                    		success:function(data){
                    			data = $.parseJSON(data);
								if(data.flag){
									$('#editDig').dialog('close');
									$('#enterpriseGrid').datagrid('reload');
									$.msg( data.msg);
								}else{
									$.alert(data.msg);
								}
							}
                    	})
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#editDig').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	
	// 变更展位
    function changeArea(){
		var rowData = $('#enterpriseGrid').datagrid("getSelected");
		if(!rowData){
			$.msg("请选择企业!");
			return;
		}
		if(rowData.status ==2){
			$.msg("审核未通过不能变更展位!");return;
		}
		eve.obj = rowData;
        $('#changeAreaDig').dialog({
            title: '变更展位',
            width: 400,
            height: 200,
            closed: false,
            cache: false,
            href: './changeArea.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fmchangeArea").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fmchangeArea"));
                    	$.ajax({
                    		url: eve.path + '/jobFairApply/changeArea',
                    		context:this,
                    		data : obj,
                    		type:'POST',
                    		success:function(data){
                    			data = JSON.parse(data);
								if(data.flag){
									$('#changeAreaDig').dialog('close');
									$('#enterpriseGrid').datagrid('reload');
									$.msg(data.msg);
								}else{
									$.alert(data.msg);
								}
							}
                    	})
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#changeAreaDig').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				$("#id1").val(rowData.id);
				$("#fairid1").val(rowData.fair_id);
				$("#name1").textbox('setValue',rowData.enterprise_name);
				$("#areaid").val(rowData.area_id);
				//$("#areano").textbox('setValue',rowData.area_no);
				$("#positionno").textbox('setValue',rowData.position_no);
			}
        });
    }
    
	function selectSubmit() {//查询
		 var options = $('#enterpriseGrid').datagrid('options');
		 options.url = eve.path + '/jobFairApply/query';
		 $('#enterpriseGrid').datagrid('load', {
			name : $("#name").val(),
			status : $("#status").combobox("getValue"),
			fairid : $("#fairid").val(),
			starttime : $("#starttime").datebox('getValue'),
			endtime : $("#endtime").datebox('getValue')
		 });
	}
	function resetSubmit() {//重置
		$('#name').textbox('setValue', '');
		$('#starttime').datebox('setValue', '');
		$('#endtime').datebox('setValue', '');
		$("#fairid").val(''), $('#status').combobox('setValue', '0,1,2');
		selectSubmit();
	}
</script>
<body style="margin: 1px;">
	<div id="cc" class="easyui-layout"
		data-options="fit:true,border: false">
		<input type="hidden" name="fairid" id="fairid"/>
		<div data-options="region:'north',border:false" style="padding:5px">
			<table>
				<tr>
					<!-- <td>组织机构代码或企业名称:</td> -->
					<td><input id="name" name="name" class="easyui-textbox"
					    data-options="prompt:'组织机构代码或企业名称'"
						title="组织机构代码或企业名称" size="20" /></td>

					<td>申请时间: 从</td>
					<td><input id="starttime" name="starttime"
						class="easyui-datebox" size="20" /></td>
					<td>到</td>
					<td><input id="endtime" name="endtime" class="easyui-datebox"
						size="20" /></td>

					<td>审核状态：</td>
					<td><select id="status" name="status" class="easyui-combobox"
						data-options="editable:false,panelHeight:null" style="width:150px" />
						<option value="0,1,2">全部</option>
						<option value="0">待审核</option>
						<option value="1">审核通过</option>
						<option value="2">审核未通过</option> </select></td>

					<td><a onclick="selectSubmit()" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a></td>
					<td><a onclick="resetSubmit()" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">重置</a></td>
				</tr>
			</table>
			<a onclick="changeArea()" class="easyui-linkbutton" data-options="">变更展位</a>
		</div>
		<div data-options="region:'center',border:false">
			<div id="cc1" class="easyui-layout" style="width:100%;height:100%;">
				<div id="c2" data-options="region:'west',title:'招聘会列表'"
					style="width:30%;">
					<table id="fairGrid"></table>
				</div>
				<div data-options="region:'center',title:'企业列表'"
					style="width:70%;">
					<table id="enterpriseGrid"></table>
				</div>
			</div>
		</div>
	</div>

	<div id="addPostDialog"></div>
	<div id="changeAreaDig"></div>
	<div id="detailDig"></div>
	<div id="editDig"></div>
</body>
</html>
