<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>推荐商品区设置</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
	<script>
	$(function() {

		init();
		$('#noticeGt').click(function() {
			
		    init();

		});
	});
	function init(){

		var url = "../user/sjlbgl";
		$.post(url,null,function(data){
			if(data.flag4==6){
				
				$('#addNotice2').show();
			}
			if(data.flag5==7){
				$('#addNotice3').show();
				
			}
			if(data.flag6==8){
				$('#addNotice4').show();
			}
		},"json");  
		
		var url = "../goodsInfo/list?isRecomm=1";
		$('#noticeRs').datagrid({
			fit:true,
			border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			fitColumns:true,
			sortName: 'sort',
			sortOrder: 'desc',
			remoteSort: false,
			rownumbers:true,
			pagination:true,
			url:url,
			columns:[[
						
			            {title:'商家',field:'sa_name',width:60,align:'center',sortable:true},
			            {title:'商品名称',field:'name',width:150,align:'center',sortable:true},
			            {title:'排序值',field:'sort',width:150,align:'center',
			            	editor:{
			            		type:'textbox'
			            	}
			            },
			            {title:'操作',field:'operate',width:150,align:'center',
			            	formatter:function(value,row,index){
		            			var e = '<a href="javascript:void(0)" onclick="editRow()">设置</a> ';
			                    var d = '<a href="javascript:void(0)" onclick="delNotice()">删除</a>';
			                    return e+d
			            	}
			            
			            }
					]],
					onDblClickRow:function(index,row){
						editRow();
				    }
		
		});
		
	}

	
	function editRow(){

		var row = $('#noticeRs').datagrid('getSelected');
		if(row){
			$('#w3').window('open'); 
			var url = "../goodsInfo/getGoodsInfo?id="+row.id;
			$.post(url,null,function(data){
				 var goodsInfo=data.rs;
				 $.each(goodsInfo,function(index,item){  
					$("#goodsId").val(item.id);
					$("#goodsSort").val(item.sort);
				 });
			},"json"); 
		}
		
		
		
	}
	function saveForm(){
		var id=$("#goodsId").val();
		var sort=$("#goodsSort").val();
		if(!$("#ff").form("validate")){
			return;
		}  
		if(null==sort||''==sort){
			alert("请输入排序号!");
			return;
		}
		var url;
		url = "../goodsInfo/update?sort="+sort+"&id="+id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("商品排序设置成功！");
				closeForm();
			}else{
				alert("商品排序设置失败！");
			}
		},"json");
			

	}
	function closeForm(){
		$('#w3').window('close');
		$("#goodsId").val('');
		$("#goodsSort").val('');
		init();
	}
	
	function cancelrow(target){
		$('#noticeRs').datagrid('cancelEdit', target);
	}

	function addNotice(){
		
		$('#w2').window('open');

		var url = "../goodsInfo/list?isRecomm=0";
		$('#noticeRs2').datagrid({
			fit:true,
			border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			fitColumns:true,
			singleSelect:false,
			checkOnSelect:true,
			rownumbers:true,
			sortName: 'sort',
			sortOrder: 'desc',
			remoteSort: false,
			pagination:true,
			url:url,
			columns:[[
			            {title:'商品id',field:'id',width:60,align:'center',sortable:true,checkbox:true},
			            {title:'商家',field:'sa_name',width:100,align:'center',sortable:true},
			            {title:'商品名称',field:'name',width:150,align:'center',sortable:true}

					]]
		
		});

	}
	
	function delNotice(){
	
		var row = $('#noticeRs').datagrid('getSelected');
		if (row){
			var url = "../goodsInfo/update?id="+row.id+"&isRecomm=0";
			$.post(url,null,function(data){
				if(data.flag==1){
					var index = $('#noticeRs').datagrid('getRowIndex', row);
					$('#noticeRs').datagrid('deleteRow', index);
					alert("删除推荐成功！");
				}else{
					alert("删除推荐失败！");
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
		var arr = $('#noticeRs2').datagrid('getSelections');
		if(arr.length>0){
			var ids=new Array();
			for(var i=0;i<arr.length;i++){
				var obj=arr[i];
				ids.push(obj.id);
			}
			url = "../goodsInfo/updateBatch?isRecomm=1&sort=0&ids="+ids.join(",");
			$.post(url,null,function(data){
				if(data.flag==1){
					alert("商品推荐成功！");
					$('#w2').window('close');
					init();
				}else{
					alert("商品推荐失败！");
				}
			},"json");
		}

		
	}
	</script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
		
		<div class="datagrid-toolbar" >	
		  
		    <a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="addNotice()">新增 </a>
		    <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除</a>
		</div>
		<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
			<div region="center" border="false" split="false">
				<table  id="noticeRs" singleSelect="true"></table>
			</div>
	   </div>
	</div>
    <div id="w2"  class="easyui-window"  closed="true" title="商品信息" iconCls="icon-save" style="width:500px;height:500px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" fit="true" style="height:90%;background:#fff;border:1px solid #ccc;">
				<table  id="noticeRs2" singleSelect="true"  ></table>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>

	</div>
	<div id="w3"  class="easyui-window"  closed="true" title="商品信息" iconCls="icon-save" style="width:300px;height:120px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" fit="true" style="height:90%;background:#fff;border:1px solid #ccc;">
				<form id="ff" method="post" novalidate>
					<input type="hidden" name="goodsId" id="goodsId" >
			        <div style="text-align:center;">
			            <label for="name">排序号:</label>
			            <input class="easyui-validatebox" type="text" name="goodsSort" id="goodsSort" data-options="required:true"></input>
			        </div>
					<div region="south" border="false" style="text-align:center;line-height:30px;">
						<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveForm()" >确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeForm()" >取消</a>
					</div>
				</form>	

	</div>
</body>
</html>