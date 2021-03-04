<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>论文专著鉴定分配管理</title>

<script type="text/javascript">
	 $(function(){
	 
	  
    $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	  
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==239){
				$("#a").show();
			}else if(value==240){
				$("#b").show();
			}else if(value==241){
				$("#c").show();
			}
	});
    },"json");
   
   $('#pshdGrid').datagrid({    
    url:'../zcps/queryShLeftPageList', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '',
	singleSelect:true,
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
        {field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}   

  
    ]],
    onClickRow:function( rowIndex, rowData){
    	var id=rowData["id"];
    	$('#fpGrid').datagrid('load',{activityId:id});
    },onLoadSuccess:function(data){
        if(data.rows.length>0){
            $('#fpGrid').datagrid({url:'../zcps/queryExpertDissertationInfos',queryParams:{activityId:data.rows[0].id}});
        }
    }     
});  
	var pager1 = $('#pshdGrid').datagrid('getPager');
				pager1.pagination({
					beforePageText : '第',// 页数文本框前显示的汉字
					afterPageText : '/ {pages} 页',
					displayMsg : '',
					buttons : [ {
						iconCls : 'icon-excel',
						handler : function() {
						}
					} ]
				});
	
	
	$('#fpGrid').datagrid({    
     url:'', 
    	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		singleSelect: true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#zcpshdTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
    columns:[[    
         {field:'zjlwId',title:'选择',checkbox:true,align:'center'},
        {field:'p_no',title:'论文编号',width : $(this).width() * 0.2,align:'center'},    
        {field:'zpno',title:'专家编号',width : $(this).width() * 0.2,align:'center'}   
      
  
    ]]    
});  
	var pager = $('#fpGrid').datagrid('getPager');
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

//自动分配专家
function autoAsssignExpert(){
	var rows=getSelections();
	if(rows.length==0){
		$.messager.alert('系统提示','请选择要自动分配专家的活动！','info');
		return;
	}
	if(judgeActivityState(rows)){
		$.messager.alert('系统提示','当前状态无法进行专家分配','info');
		
	}else{
	    $.blockUI();
		$.post('../zcps/autoAssignExpert',{activityId:rows[0].id},function(result){
		    $.unblockUI();
		    if(result.flag){
		    	$.messager.alert('系统提示','自动分配专家成功！','info');
		    	$('#fpGrid').datagrid('reload');
		    }else{
		    	$.messager.alert('系统提示',result.cause,'info');
		    }
		},'json');
	}
	
}

//导出
function exportExcel(){
	window.location.href='<%=request.getContextPath()%>/zcps/exportHasAssignWorkExperts';
}

//删除所有专家
function deleteExport(){
	var rows=getSelections();
	if(rows.length==1){
		$.messager.confirm('确定删除','确定删除分配的专家吗？',function(flag){
			if(flag){
				$.post('../zcps/deleteAllAssignedExperts',{activityId:rows[0].id},function(result){
					$.messager.alert('系统提示',result.cause,'info');
					$('#fpGrid').datagrid('reload');
				},'json');
			}
		});
		
	}else{
		$.messager.alert('系统提示','请选择一条活动信息！','info');
	}
}

function getSelections(){
	var rows=$('#pshdGrid').datagrid('getSelections');
	return rows;
}

function judgeActivityState(rows){
	var flag=false;
	$.each(rows,function(index,value){debugger;
		if(!value.sEndFlag||value.pEndFlag){
			flag=true;
			return true;
		}
	});
	return flag;
}
</script>


<body style="margin: 1px;">
 <div id="zcpshdTool"  style="background-color:#FFFFFF;">

		<a onclick="autoAsssignExpert()" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">自动分配专家</a>
		<a onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出</a>
		<a onclick="deleteExport()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除所有分配</a>
		
		

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">   

    <div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>  
    
    
    </div>   
    <div data-options="region:'center',title:'分配列表',border:false" style="">
         <table id="fpGrid"></table>  
    </div>   
</div>  



<div id="zjglAddInfo"></div> 
<div id="zjShowInfo"></div> 


</body>
</html>
