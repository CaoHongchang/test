<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>容错管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#rcclglGrid').datagrid({    
	url:'../bgActivityUserInfo/queryShFailedList2',
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#rcclglTool',
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'hdmc',title:'报考活动名称',width : $(this).width() * 0.2,align:'center'},    
        {field:'sqlx',title:'申请类型',width : $(this).width() * 0.1,align:'center'},
        {field:'sqdw1',title:'申请上级单位',width : $(this).width() * 0.2,align:'center'},
        {field:'sqdw',title:'申请单位',width : $(this).width() * 0.2,align:'center'},
        {field:'gwmc',title:'岗位名称',width : $(this).width() * 0.1,align:'center'},
        {field:'xm',title:'考生姓名',width : $(this).width() * 0.1,align:'center'},
        {field:'sfzh',title:'考试身份证号',width : $(this).width() * 0.2,align:'center'}
 

    ]]    
});  
	var pager = $('#rcclglGrid').datagrid('getPager');
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






function dorc() {
	var row =$('#rcclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		$.ajax({
	   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/dorc',
	   	    dataType: 'JSON',
	   	    data:{"id":row.id,
	   	    	"type":row.sqlx},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   	    	if(data == 1 || data == '1') {
	   	    		alert('容错处理成功!');
	   	    		$('#rcclglGrid').datagrid('load',{
		   	 		});
	   	    	} else {
	   	    		alert('容错处理失败!');
	   	    	}
	   	 },
	   	    error: function() {
	   	        alert('服务器请求异常');
	   	    	//请求出错处理
	   	    }
	   	});
	} else {
		alert('请选择一条需要处理的数据!');
	}
}






</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="rcclglTool"  style="background-color:#FFFFFF;">
	<div data-options="region:'north',border:false" style="padding:5px">
            <!--  <label style="margin-left:10px">报考活动：</label>
		     <select class="easyui-combobox" id="activity_id" name="activity_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:200px;">
			</select>
			
			<a href="javascript:selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a> -->
		  
   </div>
		<a href="javascript:dorc()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">容错处理</a>
		
	</div>

</div>
<div>

<table id="rcclglGrid"></table>  
</div>
<div id="rcclglInfo"></div>


</body>
</html>
