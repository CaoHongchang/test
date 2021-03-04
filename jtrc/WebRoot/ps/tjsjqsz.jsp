<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>推荐商家区设置</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
   <script>
	var editRow = undefined; //定义全局变量：当前编辑的行
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
		
		var url = "../shopInfo/list?isRecomm=1";
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
			pagination:true,
			url:url,
			columns:[[
						
			            {title:'商家编号',field:'id',width:60,align:'center',sortable:true},
			            {title:'商家名称',field:'name',width:150,align:'center',sortable:true},
			            {title:'排序值',field:'seq',width:150,align:'center',
			            	editor:{
			            		type:'textbox'
			            	}
			            }
					]],
					onBeforeEdit:function(index,row){
						updateActions(index);
						
					},
					onAfterEdit:function(index,row){
						updateActions(index);
						editRow = undefined;
					},
					onCancelEdit:function(index,row){
						updateActions(index);
						editRow = undefined;
					},
					onDblClickRow:function(index,row){
				        if (editRow != undefined) {
				        	 $('#noticeRs').datagrid('selectRow', editRow).datagrid("endEdit", editRow);
	                    }
	                    if (editRow == undefined) {
	                    	 $('#noticeRs').datagrid('selectRow', index).datagrid("beginEdit", index);
	                        editRow = index;
	                    }
				    }
		
		});
		
	}
	function updateActions(index){
		$('#noticeRs').datagrid('updateRow',{
			index: index,
			row:{}
		});
	}
	
	function editrow(target){

		if (editRow != undefined) {
			$('#noticeRs').datagrid("endEdit", editRow);
		}else{
			$('#noticeRs').datagrid('beginEdit', target);
		}
	}
	function addNotice(target){

		    $('#w2').window('open');
		
	         $('#name').val("");
	         $('#seq').val("");
	         $('#nId').val("");
		
		
	}
	

	function mdNotice(){
		
		$('#w2').window('open');
			var row = $('#noticeRs').datagrid('getSelected');
		if (row){
	         $('#name2').val(row.name);
	         $('#seq').val(row.seq);
	         $('#nId').val(row.id);
		
		}

	}
	
	function delNotice(){
	
		var row = $('#noticeRs').datagrid('getSelected');
		if (row){
			var url = "../shopInfo/update?id="+row.id+"&isRecomm=0&sort=0";
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
		var url = "../shopInfo/update?isRecomm=1&sort="+$("#seq").val()+"&id="+$("#nId").val();
			$.post(url,null,function(data){
				if(data.flag==1){
					alert("商家推荐成功！");
					$('#w2').window('close');
					init();
				}else{
					alert("商家推荐失败！");
				}
			},"json");
			
		}
	
	</script>
    
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
		
		<div class="datagrid-toolbar" >	
		  
		    
		     <a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="mdNotice()">修改 </a>
		    <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除</a>
		</div>
		<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
			<div region="center" border="false" split="false">
				<table  id="noticeRs" singleSelect="true"></table>
			</div>
	   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="商家信息" iconCls="icon-save" style="width:300px;height:350px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:250px;height:250px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">商家名称：</div>
				            </td>
				            <td>
				            	<input id="name2" name="name2"  style="width:150px;" maxlength="50" readonly="readonly"></input>
				            </td>
				            </tr>
				     
				            <td nowrap>
				            	 <div align="right">排序值：</div>
				            </td>
				            <td>
				            	<input id="seq" name="seq"  style="width:150px;" maxlength="50"></input>
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