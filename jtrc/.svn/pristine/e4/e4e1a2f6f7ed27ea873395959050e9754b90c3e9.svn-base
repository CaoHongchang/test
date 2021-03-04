<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>权限管理</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script>
    $(function() {

	init();
});
function init(){

	var url = "../user/pusermg";
	$('#nodeDataCountResult').datagrid({
	fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	url:url,
	fitColumns:false,
	pagination:true,
		columns:[[
		            {title:'id',field:'id',width:60,align:'center'},
		            {title:'用户名',field:'name',width:100,align:'center'},
					{title:'密码',field:'pwd',width:90,align:'center'},
					{title:'联系方式',field:'tel',width:90,align:'center'},
					{title:'权限',field:'pri',width:500,align:'center'},
					{title:'创建时间',field:'add_date',width:120,align:'center'}
				]]
	});
	
	
}

function rt(){
	
	
	var row = $('#nodeDataCountResult').datagrid('getSelected');
	if (row){
	   
		var url = "../user/retpwd?id="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("重置成功！");
				
			}else{
				alert("重置失败！");
			}
		},"json");
	}else{
		alert("请选择用户!");
	}
	
}
function add(){
	   
		$('#w2').window('open');

		$('#titleId').val("");
	    $('#pw').val("");
	    $('#tel').val("");

}
function del(){
	var row = $('#nodeDataCountResult').datagrid('getSelected');
	if (row){
	
		var url = "../game.php?doAction=act_delUser&w="+row.id;
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("删除成功！");
				init();
				
			}else{
				alert("删除失败！");
			}
		},"json");
	}else{
		alert("请选择用户!");
	}
}
function closeProduct(){
	$('#w2').window('close');
}
function saveOrUpdateProductNode(){
	
	var url = "../user/addpuser?name="+$('#titleId').val()+"&tel="+$('#tel').val()+"&pwd="+$('#pw').val();

	$.post(url,null,function(data){
		if(data.flag==1){
			alert("添加成功！");
			$('#w2').window('close');
			init();
			
		}else{
			alert("添加失败！");
		}
	},"json");
}
function zf(){
	
	  var str="";
	     $("[#name='m'][checked]").each(function(){
	      str+=$(this).val()+",";
	     });
	   
	var row = $('#nodeDataCountResult').datagrid('getSelected');
	if (row){
	
		var url = "../user/addpuserpri?id="+row.id+"&pri="+str;

		$.post(url,null,function(data){
			if(data.flag==1){
				alert("设置成功！");
				init();
				
			}else{
				alert("设置失败！");
			}
		},"json");
	}else{
		alert("请选择用户！");
	}
}
function zf1(){
	
	var str=$("#pwd1").val();   
	var row = $('#nodeDataCountResult').datagrid('getSelected');
	if (row){
	
		var url = "../user/addpuserpri?id="+row.id+"&pri="+str;

		$.post(url,null,function(data){
			if(data.flag==1){
				alert("设置成功！");
				init();
				
			}else{
				alert("设置失败！");
			}
		},"json");
	}else{
		alert("请选择用户！");
	}
}

    
    </script>
</head>
<body class="easyui-layout">

   <div region="center" border="false" split="false" style="overflow:hidden;">
		
		
		 
		                  权限：
		                <table border="1">
		                <tr>
					       <td>
					        <input type="checkbox"  name="m" value="1"/>公共模块管理(1) &nbsp;
					       <input type="checkbox"  name="m" value="1"/>商家类别管理(1) &nbsp;
					  	   <input type="checkbox"  name="m" value="2"/>商家类别管理（新增）(2)&nbsp;
					       <input type="checkbox"  name="m" value="3"/>商家类别管理（修改）(3)&nbsp;
					       <input type="checkbox"  name="m" value="4"/>商家类别管理（删除）(4)&nbsp;
					       <br/>
					       <input type="checkbox"  name="m" value="5"/>商家管理(5) &nbsp;
					  	   <input type="checkbox"  name="m" value="6"/>商家管理（新增）(6)&nbsp;
					       <input type="checkbox"  name="m" value="7"/>商家管理（修改）(7)&nbsp;
					       <input type="checkbox"  name="m" value="8"/>商家管理（删除）(8)&nbsp;
					       <input type="checkbox"  name="m" value="8"/>商家管理（启用）(8)&nbsp;
					       <input type="checkbox"  name="m" value="8"/>商家管理（不启用）(8)&nbsp;
					       <input type="checkbox"  name="m" value="8"/>商家管理（ 充值历史）(8)&nbsp;
					       </td>
				       </tr>
		                <tr>
			               <td>
					       <input type="checkbox"  name="m" value="9"/>产品管理(9) &nbsp;
					  	   <input type="checkbox"  name="m" value="10"/>产品管理（新增）(10)&nbsp;
					       <input type="checkbox"  name="m" value="11"/>产品管理（修改）(11)&nbsp;
					       <input type="checkbox"  name="m" value="12"/>产品管理（删除）(12)&nbsp;
					       <br/>
					       <input type="checkbox"  name="m" value="13"/>投诉管理(13) &nbsp;
					  	   <input type="checkbox"  name="m" value="14"/>投诉管理（新增）(14)&nbsp;
					       <input type="checkbox"  name="m" value="15"/>投诉管理（修改）(15)&nbsp;
					       <input type="checkbox"  name="m" value="16"/>投诉管理（删除）(16)&nbsp;
					       </td>
				       </tr>
				        <tr>
				        <td>
					       <input type="checkbox"  name="m" value="17"/>后台账号管理(17) &nbsp;
					  	   <input type="checkbox"  name="m" value="18"/>后台账号管理（新增）(18)&nbsp;
					       <input type="checkbox"  name="m" value="19"/>后台账号管理（修改）(19)&nbsp;
					       <input type="checkbox"  name="m" value="20"/>后台账号管理（删除）(20)&nbsp;
					       <br/>
					       <input type="checkbox"  name="m" value="21"/>财务报表下载(21) &nbsp;
					       <input type="checkbox"  name="m" value="22"/>财务报表查询(22) &nbsp;
					  	   <input type="checkbox"  name="m" value="23"/>币种管理(23)&nbsp;
					       <input type="checkbox"  name="m" value="24"/>权限管理(24)&nbsp;
					     
					       </td>
				       </tr>
				        <tr>
				        <td>
				         <input type="checkbox"  name="m" value="25"/>日志管理(25)&nbsp;
				         <input type="checkbox"  name="m" value="26"/>发芽币交易日志(26)&nbsp;
				         <input type="checkbox"  name="m" value="28"/>发芽币消费日志(28)&nbsp;
				          <br/>
				         <input type="checkbox"  name="m" value="29"/>推广奖金明细日志(29)&nbsp;
				         <input type="checkbox"  name="m" value="30"/>操作日志(30)&nbsp;
				         <input type="checkbox"  name="m" value="31"/>币量明细(31)&nbsp;
				        
				         </td>
				         </tr>
				         
				         <tr>
				        <td>
						<input type="checkbox"  name="m" value="33"/>代理分红设置(33)&nbsp;
				         <input type="checkbox"  name="m" value="34"/>代理分红设置（新增）(34)&nbsp;
				         <input type="checkbox"  name="m" value="35"/>代理分红设置（修改）(35)&nbsp;
				         <input type="checkbox"  name="m" value="36"/>代理分红设置（删除）(36)&nbsp;
				           <input type="checkbox"  name="m" value="37"/>奖金提现(37)&nbsp;
				          <br/>
				          
				         <input type="checkbox"  name="m" value="38"/>奖金审核(38))&nbsp;
				         <input type="checkbox"  name="m" value="39"/>奖金提现复审(39)&nbsp;
				         <input type="checkbox"  name="m" value="40"/>奖金提现初审(40)&nbsp;
				       
				         <input type="checkbox"  name="m" value="41"/>参数管理(41))&nbsp;
				         <input type="checkbox"  name="m" value="42"/>参数管理-新增(42))&nbsp;
				          <input type="checkbox"  name="m" value="43"/>参数管理-删除(43)&nbsp;
				         </td>
				         </tr>
				         <tr>
				         <td>
				           <input type="checkbox"  name="m" value="44"/>套餐资金设置(44) &nbsp;
					       <input type="checkbox"  name="m" value="45"/>套餐资金设置（新增）(45) &nbsp;
					  	   <input type="checkbox"  name="m" value="46"/>套餐资金设置（修改）(46)&nbsp;
					       <input type="checkbox"  name="m" value="47"/>套餐资金设置（删除）(47)&nbsp;
					       </td>
				         </tr>
				         
						</table>
		    <div>
		    <a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search"  onclick="add()">新增用户</a>
		    <a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search"  onclick="zf()">确定</a>
	
	
		   	<a id="nodeDataCountFind1" href="#" class="easyui-linkbutton" plain="true" icon="icon-add"  onclick="zf1()">权限设置</a>
		   	权限：<input type="text" id="pwd1"/>
 			<a id="nodeDataCountFind" href="#" class="easyui-linkbutton" plain="true" icon="icon-search"  onclick="rt()">密码重置</a>
		</div>
	<div class="easyui-layout" border="false" split="false" style="overflow:hidden;height:40%;">
		<div region="center" border="false" split="false">
			<table  id="nodeDataCountResult" ></table>
		</div>
   </div>
	</div>
<div id="w2"  class="easyui-window"  closed="true" title="员工" iconCls="icon-save" style="width:260px;height:200px;padding:1px;background: #fafafa;" >
			<div region="center" border="false" style="width:230px;height:100px;padding:5px;background:#fff;border:1px solid #ccc;">
				<table cellpadding=3>
			               
			              <tr>
				            <td nowrap>
				            	 <div align="right">用户名：</div>
				            </td>
				            <td>
				           <input id="titleId" name="titleId" type="text" class="text" style="width:150px;" maxlength="25" /><span style="color:#FF0000;">*</span>
				            </td>
				      
			            </tr>
			    
			            <tr>
				            <td nowrap>
				            	 <div align="right">密码：</div>
				            </td>
				            <td>
				            	 <input id="pw" name="pw" type="text" class="text" style="width:150px;" maxlength="25" /><span style="color:#FF0000;">*</span>
				            </td>
			            </tr>
			            
			             <tr>
				            <td nowrap>
				            	 <div align="right">联系电话：</div>
				            </td>
				            <td>
				            	 <input id="tel" name="tel" type="text" class="text" style="width:150px;" maxlength="25" /><span style="color:#FF0000;">*</span>
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