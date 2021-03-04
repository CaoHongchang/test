<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>商品管理</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ps/spgl.js"></script>
    
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
			
			
			
			var url = "../goodsType/goodsTypeInit";
			$.post(url,null,function(data){
				 $("#g_typeid").empty();
				 $("#g_typeid").append("<option value='0'></option>");
				 
				 $.each(data,function(index,item){  
					 $("#g_typeid").append("<option value='"+item.id+"'>"+item.name+" </option>"); 
					 $("#q_g_typeid").append("<option value='"+item.id+"'>"+item.name+" </option>");
				 });
			},"json");  
			
			url = "../goodsType/shopInit";
			$.post(url,null,function(data){
				 $("#sa_id").empty();
				 $("#sa_id").append("<option value='0'></option>");
				 $.each(data,function(index,item){  
					 $("#sa_id").append("<option value='"+item.id+"'>"+item.name+" </option>"); 
					 $("#q_sa_id").append("<option value='"+item.id+"'>"+item.name+" </option>");
					 
				 });
			},"json");  
				
			url = "../goodsType/pareaInit";
			$.post(url,null,function(data){
				 $("#p_area").empty();
				 $("#p_area").append("<option value='0'></option>");
				 $.each(data,function(index,item){  
					 $("#p_area").append("<option value='"+item.id+"'>"+item.name+" </option>"); 
				 });
			},"json"); 
		

		var url = "../goodsInfo/list?name="+$('#q_name').val()+"&saId="+$("#q_sa_id").val()+"&gTypeid="+$("#q_g_typeid").val()+"&sstate="+$('#sstate').val();
	
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
			            
			            {title:'商品编号',field:'id',width:60,align:'center',sortable:true},
			            {title:'商品类别',field:'g_typename',width:150,align:'center',sortable:true},
			            {title:'商品名称',field:'name',width:150,align:'center'},
			    		{title:'商家名称',field:'sa_name',width:150,align:'center'},
			    		{title:'价格类型',field:'price_type_name',width:150,align:'center'},
			    		{title:'商品价格',field:'price',width:150,align:'center'},
			    		{title:'库存数量',field:'sp',width:150,align:'center'},
			    		{title:'是否上架',field:'sstateName',width:150,align:'center'},
			    		{title:'是否支持线下兑换',field:'is_offline_name',width:150,align:'center'},
			    		{title:'商品发行区域',field:'p_area_name',width:150,align:'center'},
			    		{title:'线下兑换地址',field:'offline_adr',width:150,align:'center'},
			    		{title:'线下兑换电话',field:'offline_tel',width:150,align:'center'},
			    		{title:'上架时间',field:'add_date',width:150,align:'center'},
			    		{title:'下架时间',field:'del_datr',width:150,align:'center'}
					]]
		
		});
			
			
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
		function upNotice(){
			
			$('#nId').val(2);
			var row = $('#noticeRs').datagrid('getSelected');
			if(row==null){
			alert("请选择一行进行上架");
			return;
			}
			var url = "../goodsInfo/upNotice?id="+row.id;
				$.post(url,null,function(data){
					if(data.flag==1){
						alert("上架成功！");
					}else{
						alert("上架失败！");
					}
					init();
				},"json");
				
		}
		
		function downNotice(){
			
			$('#nId').val(2);
			var row = $('#noticeRs').datagrid('getSelected');
			if(row==null){
			alert("请选择一行进行下架");
			return;
			}
			var url = "../goodsInfo/downNotice?id="+row.id;
				$.post(url,null,function(data){
					if(data.flag==1){
						alert("下架成功！");
					}else{
						alert("下架失败！");
					}
					init();
				},"json");
		}
		
		function delNotice(){
		
			var row = $('#noticeRs').datagrid('getSelected');
			if (row){
				var index = $('#noticeRs').datagrid('getRowIndex', row);
				$('#noticeRs').datagrid('deleteRow', index);
				
				//alert(row.id);
				
				var url = "../goodsInfo/del?id="+row.id;
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
			var str = "?gTypeid="+$("#g_typeid").val()+"&saId="+$("#sa_id").val()+"&name="+$("#tcname").val()+
			 "&priceType="+$("#price_type").val()+"&price="+$("#price").val()+ "&dpoint="+$("#dpoint").val()+
			 "&sp="+$("#sp").val()+"&sstate="+$("#sstate").val()+"&isOffline="+$("#is_offline").val()+"&pArea="+$("#p_area").val()+
			 "&offlineAdr="+$("#offline_adr").val()+"&offlineTel="+$("#offline_adr").val();
			
			if($('#nId').val()==""){
			var name = $("#tcname").val();
			 	if(name==""){
			 	alert("商品名称不能为空");
			 	return;
			 	}
			   url = "../goodsInfo/insert1"+str;
			  
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
			
 				<td align="right" nowrap="nowrap"><b>商品名称:</b></td>
 			    <td><input type="text" id="q_name" name="q_name"/></td>
 			    <td align="right" nowrap="nowrap"><b>商家名称:</b></td>
 			    <td>
 			    	<select id="q_sa_id">
 			    		<option value=""></option>
 			    	</select>
 			    </td>
<!--  			    <td><input type="text" id="q_sa_id" name="name"/></td> -->
 			    <td align="right" nowrap="nowrap"><b>商品类别:</b></td>
 			    <td><select id="q_g_typeid">
 			    		<option value=""></option>
					</select>
				</td>
				            	
				            
 			    <td align="right" nowrap="nowrap"><b>是否上架:</b></td>
 			    <td>
 			    	<select id="sstate" name="sstate">
 			    		<option value=""></option>
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
			</tr>		
			</table>
		 <div class="datagrid-toolbar" >	
		      <a id="addNotice" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="init()">查询 </a> 
		    <a id="addNotice1" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="publicNotice()">新增 </a>
		       <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="upNotice()">上架 </a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="downNotice()">下架 </a>
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delNotice()">删除</a>

		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:87%;">
		<div region="center" border="false" split="false">
			<table  id="noticeRs" singleSelect="true"></table>
		</div>
   </div>
	</div>
   <div id="w2"  class="easyui-window"  closed="true" title="商品管理信息" iconCls="icon-save" style="width:350px;height:480px;padding:5px;background: #fafafa;" >
			<div region="center" border="false" style="width:300px;height:450px;padding:10px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=5>
			            
			              
			  
			            <tr>
				            <td nowrap>
				            	 <div align="right">商品名称：</div>
				            </td>
				            <td>
				            	<input id="tcname" name="tcname"  style="width:150px;"></input>
				            </td>
				            </tr>
				            <tr>
				            	<td nowrap> <div align="right">商品类别：</div></td>  
				            	<td> <select id="g_typeid" name="g_typeid"></select></td>
				            </tr>
				            <tr>
				            	<td nowrap> <div align="right">商家名称：</div></td>  
				            	<td> <select id="sa_id" name="sa_id"></select></td>
				            </tr>
				            
				            <tr>
				            	<td nowrap> <div align="right">价格类型：</div></td>  
				            	<td> <select id="price_type" name="price_type">
				            		<option value="9">人民币+银元</option>
				            		<option value="10">人民币</option>
				            		<option value="11">银元</option>
				            	</select></td>
				            </tr>
				            
				            <tr>
				            	<td nowrap> <div align="right">商品价格：</div></td>  
				            	<td><input id="price" name="price"  style="width:150px;"></input> </td>
				            </tr>
				            
				            <tr>
				            	<td nowrap> <div align="right">点币：</div></td>  
				            	<td><input id="dpoint" name="dpoint"  style="width:150px;"></input> </td>
				            </tr>
				            
				            <tr>
					            <td nowrap>
					            	 <div align="right">库存数量：</div>
					            </td>
					            <td>
					            	<input id="sp" name="sp"  style="width:150px;"></input>
					            </td>
			            	</tr>

				            <tr>
					            <td nowrap>
					            	 <div align="right">是否上架：</div>
					            </td>
					            <td>
					            	<select id="sstate" name="sstate">
				            			<option value="1">是</option>
				            			<option value="0">否</option>
				            		</select>
					            </td>
			            	</tr>
			            	
							<tr>
					            <td nowrap>
					            	 <div align="right">是否支持线下兑换：</div>
					            </td>
					            <td>
					            	<select id="is_offline" name="sa_id">
				            			<option value="1">是</option>
				            			<option value="0">否</option>
				            		</select>
					            </td>
			            	</tr>			   
			     
			     			<tr>
				            	<td nowrap> <div align="right">商品发行区域：</div></td>  
				            	<td> <select id="p_area" name="p_area"></select></td>
				            </tr>
			     			
			     			<tr>
					            <td nowrap>
					            	 <div align="right">线下兑换地址：</div>
					            </td>
					            <td>
					            	<input id="offline_adr" name="offline_adr"  style="width:150px;"></input>
					            </td>
			            	</tr>
			     			
			     			<tr>
					            <td nowrap>
					            	 <div align="right">线下兑换电话：</div>
					            </td>
					            <td>
					            	<input id="offline_tel" name="offline_tel"  style="width:150px;"></input>
					            </td>
			            	</tr>
			            	
<!-- 				          <tr> -->
<!-- 				          		<td nowrap> -->
<!-- 				            	 	<div align="right">账号状态：</div> -->
<!-- 				            	</td> -->
<!-- 				            	<td> -->
<!-- 				            		启用<input id="isstate1" name="isstate" type="radio" checked value="0">  不启用<input name="isstate" id="isstate2" type="radio" value="1"> -->
<!-- 				            	</td> -->
<!-- 				        </tr> -->
				</table>
			</div>
			<div region="south" border="false" style="text-align:right;line-height:30px;">
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >确定</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:closeProduct()" >取消</a>
			</div>

	</div>
</body>
</html>