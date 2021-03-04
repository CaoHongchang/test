<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>

<html>
<head>
<title>个人用户列表</title>
<script type="text/javascript">
	var uid = '${param.uid}';
	$(function() {
		// 加载企业列表
		$('#resumelistGrid').datagrid({
			border : true,
			url : eve.path + '/jobfair/resumeinfo/queryResumeByUid?uid='+uid,
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
				field : 'resume_name',
				title : '简历名称',
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
                  var str = '<a href="javascript:detailResumeFun(\''+id+'\')" style="color: blue;">查看简历</a> ';
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
	function detailResumeFun(id){
		var rows = $("#resumelistGrid").datagrid('getData').rows;
		var rowindex;  
		for (var i = 0; i < rows.length; i++) {
		    if (rows[i]['id'] == id) {  
		        rowindex = i;  
		        break;  
		    }  
		} 
		var row = $("#resumelistGrid").datagrid('getData').rows[rowindex];
		var param = { 
			'id' : id
		};
		var url = eve.path + '/jobfair/resumeinfo/get';
		$('#dialogDivResumeDetail').dialog({
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
                    $('#dialogDivResumeDetail').dialog('close');
                }
            }],
            iconCls: 'icon-save',
			onLoad:function(){
				
			}
        });
	}
</script>
<body style="margin: 1px;">
	<div id="cc1" class="easyui-layout" data-options="fit:true,border: false">
		<div data-options="region:'center',border:false" style="width:100%;">
			<table id="resumelistGrid"></table>
		</div>
	</div>
	<div id="dialogDivResumeDetail"></div>
</body>
</html>
