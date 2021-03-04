$(function() {

	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){
	/*
	var url = "../game.php?doAction=act_getdk";
	$.post(url,null,function(data){
		if(data.flag==1){
			$("#add").hide();
		}
		if(data.flag1==1){
			$("#del").hide();
		}
		if(data.flag2==1){
			$("#md").hide();
		}
	},"json");
	*/
var url = "../game.php?doAction=act_findzzblog&dw="+encodeURIComponent($('#dw').val())+"&startTime="+encodeURIComponent($('#startTime').val())+"&endTime="+encodeURIComponent($('#endTime').val());
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:50,
	pageList:[50,100,150,200],
	striped: true,
	collapsible:true,
	url:url,
	sortName: 'dw,zzb_all,zzb,zzb_spare',
	sortOrder: 'desc',
	remoteSort: false,
	columns:[[
	            {field:'id',checkbox:true},
	            {title:'类别编号',field:'id',width:60,align:'center'},
	            {title:'商品类别',field:'dw',width:150,align:'center',sortable:true},
	    		{title:'创建人',field:'zzb_all',width:150,align:'center',sortable:true},
	            {title:'创建时间',field:'zzb',width:60,align:'center',sortable:true},
				{title:'修改人',field:'zzb_spare',width:100,align:'center',sortable:true},
				{title:'修改时间',field:'zzb_spare',width:100,align:'center',sortable:true}
			]]

});
	
}

