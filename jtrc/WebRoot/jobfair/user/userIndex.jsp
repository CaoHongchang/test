<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>

<html>
<head>
<title>个人用户列表</title>
<script type="text/javascript">
	$(function() {
		// 加载企业列表
		$('#enterpriseGrid').datagrid({
			border : true,
			url : eve.path + '/jobfair/resumeinfo/query',
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
				field : 'createTime',
				title : '创建时间',
				width : 30,
				align : 'center'
			}, {
				field : 'pnum',
				title : '身份证号',
				width : 30,
				align : 'center'
			}, {
				field : 'full_name',
				title : '姓名',
				width : 30,
				align : 'center'
			}, {
				field : 'sex',
				title : '性别',
				width : 30,
				formatter : function(value, row, index) {
						return value;
				},
				align: 'center'
			} , {
				field : 'mobile',
				title : '手机号',
				width : 20,
				align : 'center'
			}, {
			   title:'操作',field:'uid',width:50,align:'center',
    		   formatter: function(value,row,index){
                  var id=row.id;
                  var status = row.status;
                  var str = '<a href="javascript:detailFun(\''+id+'\')" style="color: blue;">查看简历</a> ';
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
		var url = eve.path + '/jobfair/user/resumelist.jsp?uid='+row.uid;
		$('#dialogDivResumeList').dialog({
            title: '个人简历列表',
            width: 1000,
            height: 500,
            closed: false,
            cache: false,
            method : 'post',
            href: url,
            modal: true,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#dialogDivResumeList').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
	
	// 详细
	/* function detailFun(id){
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
			'id' : row.id
		};
		var url = eve.path + '/jobfair/resumeinfo/get';
		$('#dialogDivResumeList').dialog({
            title: '个人简历查看',
            width: 900,
            height: 500,
            closed: false,
            cache: false,
            queryParams : param,
            method : 'post',
            href: url,
            modal: true,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#dialogDivResumeList').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	} */
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
	 					url: eve.path + "/jobfair/resumeinfo/delStatus",  
	 					data: "id=" + ids,  
	 					success: function (result) {
	 					    if(result.flag){
	 					    	$('#enterpriseGrid').datagrid('reload');  
	 							$.msg(result.msg);
	 						}else{
	 							$.alert(result.msg);
	 						}
	 					}  
	 				});  
	    		 }
	    	 }); 
		 }else{
			 $.alert("请选择要删除的数据");
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
			starttime : $("#starttime").datebox('getValue'),
			endtime : $("#endtime").datebox('getValue')
		 });
	}
	function resetSubmit() {//重置
		$('#name').textbox('setValue', '');
		$('#starttime').datebox('setValue', '');
		$('#endtime').datebox('setValue', '');
		selectSubmit();
	}
</script>
<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" data-options="fit:true,border: false">
		<div data-options="region:'north',border:false" style="padding:5px">
			<table>
				<tr>
					<!-- <td>身份证或姓名:</td> -->
					<td><input id="name" name="name" class="easyui-textbox"
					    data-options="prompt:'身份证或姓名'"
						title="身份证或姓名" size="20" /></td>

					<td>举办时间: 从</td>
					<td><input id="starttime" name="starttime"
						class="easyui-datebox" size="20" /></td>
					<td>到</td>
					<td><input id="endtime" name="endtime" class="easyui-datebox"
						size="20" /></td>

					<!-- <td>审核状态：</td>
					<td><select id="status" name="status" class="easyui-combobox"
						data-options="editable:false,panelHeight:null" style="width:150px" />
						<option value="0,1,2">全部</option>
						<option value="0">待审核</option>
						<option value="1">审核通过</option>
						<option value="2">审核未通过</option> </select></td> -->

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
	<div id="dialogDivResumeList"></div>
</body>
</html>
