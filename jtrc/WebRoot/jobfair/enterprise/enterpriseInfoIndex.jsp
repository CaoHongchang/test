<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>
<html>
<head>
<title>招聘招聘企业列表</title>
<script type="text/javascript">
	$(function() {
		// 加载企业列表
		$('#enterpriseGrid').datagrid({
			border : true,
			url : eve.path + '/enterpriseInfoJob/query',
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
				title : '创建时间',
				width : 30,
				align : 'center'
			}, {
				field : 'c_code',
				title : '组织机构代码',
				width : 30,
				align : 'center'
			}, {
				field : 'name',
				title : '企业名称',
				width : 30,
				align : 'center'
			}, {
				field : 'province',
				title : '所在地',
				width : 30,
				formatter : function(value, row, index) {
					//return row.province + row.city + row.area;
					return row.city;
				}
			}, {
				field : 'type',
				title : '企业性质',
				width : 30,
				formatter : function(value, row, index) {
					if (value == '1')
						return '外资（欧美）';
					else if (value == '2')
						return '外资（非欧美）';
					else if (value == '3')
						return '合资';
					else if (value == '4')
						return '国企';
					else if (value == '5')
						return '民营公司';
					else if (value == '6')
						return '外企代表处';
					else if (value == '7')
						return '政府机关';
					else if (value == '8')
						return '事业单位';
					else if (value == '9')
						return '非营利机构';
					else if (value == '10')
						return '机关及参公单位';
					else if (value == '11')
						return '科研设计单位';
					else if (value == '12')
						return '高等教育单位';
					else if (value == '13')
						return '中初教育单位';
					else if (value == '14')
						return '医疗卫生单位';
					else if (value == '15')
						return '其它事业单位';
					else if (value == '16')
						return '国有企业';
					else if (value == '17')
						return '三资企业';
					else if (value == '18')
						return '其他企业';
					else if (value == '19')
						return '部队';
					else if (value == '20')
						return '农村建制村';
					else if (value == '21')
						return '城镇社区';
				},
				align: 'center'
			}, {
				field : 'status',
				title : '审核状态',
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
                  var str = '<a href="javascript:detailFun(\''+id+'\')" style="color: blue;">查看</a> ';
                  str += '<a href="javascript:updateFun(\''+id+'\',\''+status+'\')" style="color: blue;">修改</a> ';
                  str += '<a href="javascript:reviewFun(\''+id+'\',\''+status+'\')" style="color: blue;">审核</a> ';
                  str += '<a href="javascript:deleteFun(\''+id+'\')" style="color: blue;">删除</a>';
		          return str;
		       }   
	       }]],
	       onLoadSuccess : function(data){
	    	 
	       } ,
	       onSelect : function(rowIndex, rowData){
	       }
			
		});
		
	});
	// 审核
	function reviewFun(id, status){
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
			$.msg("当前状态无法审核!");return;
		}
		var param = { 
			'id' : row.id,
			'enterpriseid' : row.enterprise_id,
			'type' : 0
		};
		$('#dialogDiv').dialog({
            title: '企业申请审核',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            method : 'post',
            href: eve.path + '/enterpriseInfoJob/get',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fm").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm"));
                    	$.ajax({
                    		url: eve.path + '/enterpriseInfoJob/review',
                    		context:this,
                    		data : obj,
                    		type:'POST',
                    		success:function(data){
								if(data.flag){
									$('#dialogDiv').dialog('close');
									$('#enterpriseGrid').datagrid('reload');
									$.msg(data.msg);
								}else{
									$.messager.alert('系统提示', data.msg);
								}
							}
                    	})
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#dialogDiv').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	// 修改
	function updateFun(id, status){
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
			$.msg("当前状态无法修改企业信息!");return;
		}
		var param = { 
			'id' : row.id,
			'enterpriseid' : row.enterprise_id,
			'type' :'2'
		};
		$('#dialogDiv').dialog({
            title: '招聘企业修改',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            method : 'post',
            href: eve.path + '/enterpriseInfoJob/get',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fm").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm"));
                    	$('#fm').form('submit',{
                    		url: eve.path + '/enterpriseInfoJob/update',
                			type:'post',
                			onSubmit:function(){
                				return true;
                			},
                			success:function(data){
                				data = JSON.parse(data);
                				if(data.flag){
									$.msg(data.msg);
									$('#dialogDiv').dialog('close');
									$('#enterpriseGrid').datagrid('reload');
								}else{
									$.messager.alert('系统提示', data.msg);
								}
                			}
                		});
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#dialogDiv').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	// 详细
	function detailFun(id){
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
			'id' : row.id,
			'enterpriseid' : row.enterprise_id,
			'type' : 1
		};
		$('#dialogDiv').dialog({
            title: '企业申请查看',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            method : 'post',
            href: eve.path + '/enterpriseInfoJob/get',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    var result = $("#fm").form("validate");
                    if(result){
                    	var obj = eve.serializeObject($("#fm"));
                    	$.ajax({
                    		url: eve.path + '/enterpriseInfoJob/review',
                    		context:this,
                    		data : obj,
                    		type:'POST',
                    		success:function(data){
								if(data.flag){
									$('#dialogDiv').dialog('close');
									$('#enterpriseGrid').datagrid('reload');
									$.msg(data.msg);
								}else{
									$.messager.alert('系统提示', data.msg);
								}
							}
                    	})
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#dialogDiv').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	// 删除
	function deleteFun(id){
		var ids = "";
		if(typeof id != 'undefined'){
			ids = id;
		}else{
			ids = getSelectRowId();
			
	    }
	    if(ids != ""){
	    	 $.messager.confirm('系统提示', '是否删除选中数据?', function(r) {  
	    		 if(r){
	    			 $.ajax({  
	 					type: "POST",  
	 					cache: false,  
	 					url: eve.path + '/enterpriseInfoJob/delStatus',  
	 					data: "id=" + ids,
	 					success: function (result) {
	 					    if(result.flag){
	 					    	$('#enterpriseGrid').datagrid('reload');  
	 							$.msg(result.msg);
	 						}else{
	 							$.messager.alert('系统提示', result.msg);
	 						}
	 					}  
	 				});  
	    		 }
	    	 }); 
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
	}
	function getSelectRowId(){
		var rows = $('#enterpriseGrid').datagrid('getSelections');  
		var ids = "";
    	if (rows.length>0) {  
    		for(var i=0; i<rows.length; i++){
    			if(ids == ""){
        			ids = rows[i].id;
        		}else{
        			ids += "," + rows[i].id;
            	}
    		}
    	}
    	return ids;
	}
	function selectSubmit() {//查询
		 $('#enterpriseGrid').datagrid('load', {
			name : $("#name").val(),
			status : $("#status").combobox("getValue"),
			starttime : $("#starttime").datebox('getValue'),
			endtime : $("#endtime").datebox('getValue')
		 });
	}
	function resetSubmit() {//重置
		$('#name').textbox('setValue', '');
		$('#starttime').datebox('setValue', '');
		$('#endtime').datebox('setValue', '');
		$('#status').combobox('setValue', '0,1,2');
		selectSubmit();
	}
</script>
<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" data-options="fit:true,border: false">
		<div data-options="region:'north',border:false" style="padding:5px">
			<table>
				<tr>
					<!-- <td>组织机构代码或企业名称:</td> -->
					<td><input id="name" name="name" class="easyui-textbox"
					 data-options="prompt:'组织机构代码或企业名称'"
						title="组织机构代码或企业名称" size="20" /></td>

					<td>举办时间: 从</td>
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
			<div id="jobFairsTool"  style="background-color:#FFFFFF;">
			    <a onclick="deleteFun()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
		    </div>
		</div>
		<div data-options="region:'center',border:false" style="width:100%;">
			<table id="enterpriseGrid"></table>
		</div>
	</div>
	<div id="dialogDiv"></div>
</body>
</html>
