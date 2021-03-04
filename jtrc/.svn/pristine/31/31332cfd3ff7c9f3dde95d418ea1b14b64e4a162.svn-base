$(function() {

	//alert("dd");
	//$('#addNotice1').hide();
	//$('#addNotice2').hide();
	//$('#addNotice3').hide();
	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){

	var url = "../game.php?doAction=act_popri";
	$.post(url,null,function(data){
		if(data.flag7==10){
			
			$('#addNotice1').show();
			
			
		}
		if(data.flag8==11){
			$('#addNotice2').show();
			
			
		}
		if(data.flag9==12){
			$('#addNotice3').show();
		}
	},"json");
var url = "../game.php?doAction=act_findcp";
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:50,
	pageList:[50,100,150,200],
	striped: true,
	collapsible:true,
	url:url,
	columns:[[
	            {field:'id',checkbox:true},
	            {title:'商品编号',field:'id',width:60,align:'center'},
	            {title:'商品类别',field:'isstate',width:60,align:'center'},	
	    		{title:'商品名称',field:'tcname',width:150,align:'center'},
	            {title:'商家名称',field:'sprice',width:60,align:'center'},
				{title:'价格类型',field:'tccontent',width:100,align:'center'},
				{title:'商品价格',field:'tccontent',width:100,align:'center'},
				{title:'库存数量',field:'tccontent',width:100,align:'center'},
				{title:'是否上架',field:'tccontent',width:100,align:'center'},
				{title:'是否支持线下兑换',field:'tccontent',width:100,align:'center'},
				{title:'商品发行区域',field:'tccontent',width:100,align:'center'},
				{title:'线下兑换地址',field:'tccontent',width:100,align:'center'},
				{title:'线下兑换电话',field:'tccontent',width:100,align:'center'},
				{title:'上架时间',field:'tccontent',width:100,align:'center'},
				{title:'下架时间',field:'tccontent',width:100,align:'center'}
				
			]]

});
	
}

function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#tccontent').val("");
    $('#tcname').val("");
    $('#sprice').val("");
    $('#fxjl').val("");
    $('#ztjl').val("");
    $('#jscore').val("");
    $('#fzgs').val("");
    $('#fzstar').val("");
    $('#isstate').val("");

}
function mdNotice(){
	
	  
	    
	$('#w2').window('open');
	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		$('#tccontent').val(row.tccontent);
	    $('#tcname').val(row.tcname);
	    $('#sprice').val(row.sprice);
	    $('#fxjl').val(row.fxjl);
	    $('#ztjl').val(row.ztjl);
	   $('#jscore').val(row.jscore);
	    $('#nId').val(row.id);
	    $('#fzgs').val(row.fzgs);
	    $('#fzstar').val(row.fzstar);
	    $('#isstate').val(row.isstate);
	}
}
function delNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		$('#noticeRs').datagrid('deleteRow', index);
		
		//alert(row.id);
		
		var url = "../game.php?doAction=act_delpro&id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
			}else{
				alert("发布失败！");
			}
		},"json");
	}
	
}
function closeProduct(){
	$('#w2').window('close');
	init();
}
function saveOrUpdateProductNode(){
	var url;
	
	var isstate=0;
	var isSelected = $("#isstate2").attr("checked"); 
	if (isSelected )
		isstate = 1;
	if($('#nId').val()=="")
	   url = "../game.php?doAction=act_addcp&isstate="+isstate+"&fzstar="+encodeURIComponent($('#fzstar').val())+"&fzgs="+$('#fzgs').val()+"&jscore="+$('#jscore').val()+"&ztjl="+$('#ztjl').val()+"&fxjl="+$('#fxjl').val()+"&tcname="+encodeURIComponent($("#tcname").val())+"&sprice="+$("#sprice").val()+"&tccontent="+encodeURIComponent($("#tccontent").val());
	else
	   url = "../game.php?doAction=act_mdcp&isstate="+isstate+"&fzstar="+encodeURIComponent($('#fzstar').val())+"&fzgs="+$('#fzgs').val()+"&jscore="+$('#jscore').val()+"&ztjl="+$('#ztjl').val()+"&fxjl="+$('#fxjl').val()+"&id="+$('#nId').val()+"&tcname="+encodeURIComponent($("#tcname").val())+"&sprice="+$("#sprice").val()+"&tccontent="+encodeURIComponent($("#tccontent").val());	
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("发布成功！");
			$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else{
			alert("发布失败！");
		}
	},"json");
}
