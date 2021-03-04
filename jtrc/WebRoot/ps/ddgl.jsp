<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>订单管理</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ps/ddgl.js"></script>
    
       <script type="text/javascript">
    $(function() {

	
	$('#addNotice2').show();
	$('#addNotice3').show();
	$('#addNotice4').show();
	
	
	init();
	$('#noticeGt').click(function() {
		
	    init();

	});
});
function init(){
	
	
var str = "?pno="+$("#q_pno").val()+"&goodsName="+$("#q_goods_name").val()+"&gTypeid"+$("#q_g_typeid").val()+
		"&isAd="+$("#q_is_ad").val()+"&mState="+$("#q_m_state").val()+"&sState="+$("#q_s_state").val()+"&orderTel="+$("#q_order_tel").val();
var url = "../orderInfo/list"+str;
$('#noticeRs').datagrid({
	fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	sortName: 'tc,zgq,jhb,jscore,tgjj,ztnum,zwnum,xfje',
	sortOrder: 'desc',
	remoteSort: false,
	pagination:true,
	url:url,
	columns:[[
	            
	            {title:'订单编号',field:'order_no',width:60,align:'center',sortable:true},
	            {title:'会员账号',field:'pno',width:150,align:'center',sortable:true},
	            {title:'商品名称',field:'goods_name',width:150,align:'center'},
	    		{title:'商家名称',field:'shop_name',width:150,align:'center'},
	    		{title:'价格类型',field:'price_type',width:150,align:'center'},
	    		{title:'商品价格',field:'price',width:150,align:'center'},
	    		{title:'购买数量',field:'b_num',width:60,align:'center',sortable:true},
	            {title:'购买人',field:'name',width:150,align:'center',sortable:true},
	            {title:'订单联系电话',field:'order_tel',width:150,align:'center'},
	    		{title:'购买地址',field:'buy_adr',width:150,align:'center'},
	    		{title:'购买时间',field:'buy_date',width:150,align:'center'},
	    		{title:'快递公司',field:'k_name',width:150,align:'center'},
	    		{title:'快递单号',field:'k_num',width:150,align:'center'},
	    		{title:'买家订单状态',field:'m_state',width:150,align:'center'},
	    		{title:'卖家订单状态',field:'s_state',width:150,align:'center'},
	    		{title:'是否有投诉',field:'isAdName',width:150,align:'center'}
			]]

});
	
			var url = "../goodsType/goodsTypeInit";
			$.post(url,null,function(data){
				 $("#g_typeid").append("<option value='0'></option>");
				 
				 $.each(data,function(index,item){  
					 $("#q_g_typeid").append("<option value='"+item.id+"'>"+item.name+" </option>");
				 });
			},"json"); 
}
function publicNotice(){
	$('#w2').window('open');
	$('#nId').val("");
	$('#name1').val("");
	
    
    //loadSelct();
    	 
}
function loadSelct(){
	
    var url = "../game.php?doAction=act_area";
    $.post(url,null,function(data){
    	 $("#dl").empty();
    	 $.each(data.rows,function(index,item){  
			   
             $("#dl").append("<option value='"+item.dlqy+"'>"+item.dlqy+"</option>");
             });
	},"json");
}
function mdNotice(){
	
	$('#nId').val(2);
	var row = $('#noticeRs').datagrid('getSelected');
	if(row==null){
	alert("请选择一行进行修改");
	return;
	}
	$('#w2').window('open');
	if (row){
		//loadSelct();
		$('#name1').val(row.name);
		
	    //$('#pnum1').val(row.pnum);
	}
}

function delNotice(){

	var row = $('#noticeRs').datagrid('getSelected');
	if (row){
		var index = $('#noticeRs').datagrid('getRowIndex', row);
		$('#noticeRs').datagrid('deleteRow', index);
		
		//alert(row.id);
		
		var url = "../goodsType/del?id="+row.id;
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
	
	if($('#nId').val()==""){
	var name = $("#name1").val();
	 	if(name==""){
	 	alert("商户类别不能为空");
	 	return;
	 	}
	   url = "../goodsType/insert?name="+$("#name1").val();
	}else{
		var name = $("#name1").val();
	 	if(name==""){
	 	alert("商户类别不能为空");
	 	return;
	 	}
		var row = $('#noticeRs').datagrid('getSelected');
	   url = "../goodsType/update?name="+$("#name1").val()+"&id="+row.id;
	}
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("发布成功！");
			$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else if(data.flag==2){
			alert("用户名重名啦！");
		}else if(data.flag==3){
			alert("用户ID重名啦！");
		}else if(data.flag==4){
			alert("电话重名啦！");
		}else if(data.flag==5){
			alert("代理ID不存在！");
		}else{
			alert("发布失败！");
		}
	},"json");
}
    
    </script>
    
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			<table class="table-edit" width="100%" >	
			<tr>
			
			<td align="right" nowrap="nowrap"><b>会员账号:</b></td>
 			    <td><input type="text" id="q_pno" name="q_pno"/></td>
 				<td align="right" nowrap="nowrap"><b>商品名称:</b></td>
 			    <td><input type="text" id="q_goods_name" name="q_goods_name"/></td>
 			    <td align="right" nowrap="nowrap"><b>商品类别:</b></td>
 			    <td>
	 			      <select id="q_g_typeid">
						<option value=""></option>
					</select>
				</td>
				            	
				            
 			    <td align="right" nowrap="nowrap"><b>是否投诉:</b></td>
 			    <td>
	 			    <select id="q_is_ad" >
	 			      		<option value=""></option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</td>
				            	
				<td align="right" nowrap="nowrap"><b>买家订单状态:</b></td>
				<td>
 			      <select id="q_m_state" >
	 			      		<option value=""></option>
							<option value="1">购买</option>
							<option value="0">退货</option>
					</select>
				 </td>
				            	
				            
 			    <td align="right" nowrap="nowrap"><b>卖家订单状态:</b></td>
 			    <td>
 			      <select id="q_s_state" >
	 			      		<option value=""></option>
							<option value="1">购买</option>
							<option value="0">退货</option>
					</select>
				</td>
				
				<td align="right" nowrap="nowrap"><b>订单联系电话:</b></td>
 			    <td><input type="text" id="q_order_tel" name="q_order_tel"/></td>
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 
<!--  			<a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">投诉明细 </a>  -->

		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="商家账号信息" iconCls="icon-save" style="width:300px;height:350px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:250px;height:250px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">商家名称：</div>
				            </td>
				            <td>
				            	<input id="tcname" name="tcname"  style="width:150px;"></input>
				            </td>
				            </tr>
				            <tr>
				            	<td nowrap> 
				            		<div align="right">商家类别：</div>
				            	</td>  
				            	<td> 
				            		<select id="dl">
				            			<option></option>
				            		</select>
				            	</td>
				            </tr>
				            
				            <tr>
					             <td nowrap>
					            	 <div align="right">商家账号：</div>
					            </td>
					            <td>
					            	<input id="sprice" name="sprice"  style="width:150px;"></input>
					            </td>
			            </tr>
			   
			     
						<tr>
							<td nowrap>
				            	 <div align="right">账号状态：</div>
				            </td>
				            <td>
				            	启用<input id="isstate1" name="isstate" type="radio" checked value="0">  不启用<input name="isstate" id="isstate2" type="radio" value="1">
				            </td>
				            			            </tr>
			             			        </table>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>

	</div>
</body>
</html>