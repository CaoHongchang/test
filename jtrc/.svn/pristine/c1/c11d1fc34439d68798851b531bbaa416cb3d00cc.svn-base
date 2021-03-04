$(function() {

	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){

	var url = "../goodsInfo/list";
	alert(11);
	$('#noticeRs').datagrid({
		fit:true,
		border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		sortName: 'sa_id,name',
		sortOrder: 'desc',
		remoteSort: false,
		pagination:true,
		url:url,
		columns:[[
		            
		            {title:'商家',field:'sa_id',width:60,align:'center',sortable:true},
		            {title:'商品名称',field:'name',width:150,align:'center',sortable:true},
		            {title:'排序值',field:'inUid',width:150,align:'center'},
		    		{title:'操作',field:'add_date',width:150,align:'center'},
				]]
	
	});
	
}

