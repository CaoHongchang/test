<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>修改记录查询</title>

<script type="text/javascript">
	$(function(){
   
   init();
	
	
	});
function init(){

 $('#xgjlcxGrid').datagrid({    
    url:'/jtrc/userMgInfoTrol/queryuserLogList',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	queryParams:{
		dpno:window.top.cacheArchive.cacheDpno?window.top.cacheArchive.cacheDpno:''
	},
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'d_no',title:'被修改的档案号',width : $(this).width() * 0.1,align:'center'},    
            {field:'m_column_name',title:'名称',width : $(this).width() * 0.1,align:'center'}, 
             {field:'m_before',title:'修改前数值',width : $(this).width() * 0.1,align:'center'}, 
                {field:'m_after',title:'修改后数值',width : $(this).width() * 0.1,align:'center'}, 
        {field:'org_uid',title:'原录入人',width: $(this).width() * 0.1,align:'center'},
         {field:'md_uid',title:'修改人',width: $(this).width() * 0.1,align:'center'},
         {field:'md_date',title:'修改日期',width: $(this).width() * 0.15,align:'center'},
         {field:'ip',title:'登录IP',width: $(this).width() * 0.15,align:'center'}
  
    ]]    
});  
	var pager = $('#xgjlcxGrid').datagrid('getPager');
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



 
</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   	<div id="dadcTool"  style="background-color:#FFFFFF;">
			<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
		
		
	</div>
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
	</div>

</div>
<div>
<table id="xgjlcxGrid"></table>  
</div>
<div id="xgjlcxInfo"></div>


</body>
</html>
