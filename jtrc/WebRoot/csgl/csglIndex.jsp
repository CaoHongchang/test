<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>参数管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#csglGrid').datagrid({    
    url:'../csgl/queryParameters', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '#csglTool',
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'ext',title:'参数编码',width: $(this).width() * 0.01,align:'center'},
         {field:'ext2',title:'参数名称',width: $(this).width() * 0.02,align:'center'},
		 {field:'ext3',title:'参数值',width: $(this).width() * 0.01,align:'center'},
         {field:'ext4',title:'说明',width: $(this).width() * 0.05,align:'center'},
         {field:'ext5',title:'有效性',formatter:function(value,row,index){
			 if(value=='0')
				 return '无效';
			 else if(value=='1')
				 return '有效';
		 },width: $(this).width() * 0.01,align:'center'}
    ]]    
});  
	var pager = $('#csglGrid').datagrid('getPager');
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


/*参数新增*/
function addFuc(){
	$('#csglAddInfo').dialog({
    title: '参数新增',
    width: 350,
    height: 250,
    closed: false,
    cache: false,
    href: '../csgl/csglAdd.jsp',
    modal: true,
    iconCls: 'icon-save',
	buttons:[{
		text:'保存',
		iconCls:'icon-save',
		handler:function(){
			var result=$('#csxz').form('validate');
			if(result){
				$.messager.confirm('确定新增','确定新增参数？',function(flag){
					if(flag){
						$('#csxz').form('submit',{
							url:'../csgl/saveParameter',
							method:'post',
							success:function(result){
							if(result==1){
								$('#csglAddInfo').dialog('close');
								$.messager.alert('系统提示','新增参数成功！','info');
								$('#csglGrid').datagrid('reload');
							}else{
								$.messager.alert('系统提示','新增参数失败！');
							}
							}
						});
					}
				});
			}
		}
	}],
    onLoad: function () {
		$('#csxz').form('clear');
    }  
});
}


/*参数修改*/
function editFuc(){
	var row=$('#csglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
	$('#csglEditInfo').dialog({
    title: '参数修改',
    width: 350,
    height: 250,
    closed: false,
    cache: false,
    href: '../csgl/csglEdit.jsp',
    modal: true,
	buttons:[{
		text:'保存',
		iconCls:'icon-save',
		handler:function(){
		    var result=$('#csxg').form('validate');
			if(result){
				$.messager.confirm('确定修改','确定修改参数？',function(flag){
					if(flag){
						$('#csxg').form('submit',{
							url:'../csgl/updateParameter',
							method:'post',
							queryParams:{
								id:row.id
							},
							success:function(result){
								
							if(result==1){
								$('#csglEditInfo').dialog('close');
								$.messager.alert('系统提示','修改参数成功！','info');
								$('#csglGrid').datagrid('reload');
							}else{
								$.messager.alert('系统提示','修改参数失败');
							}
							}
						});
					}
				});
			}	
			
		}
		
	}],
    iconCls: 'icon-save',
    onLoad: function () {
		$('#csxg').form('clear');
		$("#zhmc11").textbox('setValue',row.ext);
		$("#zhmc21").textbox('setValue',row.ext2);
		$("#zhmc31").textbox('setValue',row.ext3);
		$("#zhmc41").textbox('setValue',row.ext4);
    }  
});
	}else{
		$.messager.alert('系统提示','请选择您要修改的参数！','info');
	}
}
function selectSubmit(){
	$('#csglGrid').datagrid('load',{
		code:$("#code").textbox('getValue'),
		name:$("#name").textbox('getValue'),
		value:$("#value").textbox('getValue'),
		describe:$("#describe").textbox('getValue')
	});
}
function resetSubmit(){
	$("#code").textbox('setValue','');
	$("#name").textbox('setValue','');
	$("#value").textbox('setValue','');
	$("#describe").textbox('setValue','');
	selectSubmit();
}
	 function delFunc(){
		 var rows=$('#csglGrid').datagrid('getSelections');
		 if(rows!=undefined){
			 var params="";
			 for(var i=0;i<rows.length;i++){
				 params+="&ext="+rows[i].ext;
			 }
			// console.log("params"+params);
			 $.messager.confirm('确定删除','确定删除这些参数吗？',function(flag){
				 if(flag){
					  $.ajax({
						url:'../csgl/deleteParams',
						type:'post',
						data:params,
						success:function(result){
							
							if(result==1){
								$.messager.alert('系统提示','删除参数成功！','info');
								$('#csglGrid').datagrid('reload');
							}else{
								$.messager.alert('系统提示','删除参数失败！','info');
							}
						}
						});
				 }
			 });
			
		 }else{
			 $.messager.alert('系统提示','请选择您要删除的参数！','info');
		 }
	 }
     function inValidFunc(){
		  var rows=$('#csglGrid').datagrid('getSelections');
		if(rows!=undefined){
			 var params="";
			 var flag=true;
			 for(var i=0;i<rows.length;i++){
				 params+="&id="+rows[i].id;
				 if(rows[i].ext5=='0'){
					 flag=false;
				 }
			 }
			 if(flag){//所选的均为有效的提示
			     params+="&type=1";
				$.messager.confirm('确定无效','确定无效此参数吗？',function(flag){
						 invalid(params);
				});
			 }else{//所选的包含无效的不提示
			    params+="&type=2";
				 invalid(params);
			 }
		 }else{
			 $.messager.alert('系统提示','请选择您要无效的参数！','info');
		 }
	 }
	 function invalid(params){
		 $.ajax({
			url:'../csgl/invalidParams',
			type:'post',
			data:params,
			success:function(result){
				if(result==1){
					$.messager.alert('系统提示','操作成功！','info');
								$('#csglGrid').datagrid('reload');
					}else{
						$.messager.alert('系统提示','操作失败！','info');
					}
				}
		});
	 }
	 //参数编码、参数名称、参数值、说明
</script>


<body style="margin: 1px;">
 <table >
     <tr>
        <td>参数编码：</td>
        <td><input id="code" name="code" class="easyui-textbox"/></td>
        <td>参数名称：</td>
        <td><input id="name" name="name" class="easyui-textbox"/></td>
        <td>参数值：</td>
        <td><input id="value" name="value" class="easyui-textbox"/></td>
        <td>说明：</td>
        <td><input id="describe" name="describe" class="easyui-textbox"/></td>
        <td>
           <a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
           <a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">重置</a>
        </td>
     </tr>
 </table>

<div id="tb">
   
	<div id="csglTool"  style="background-color:#FFFFFF;">
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="editFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="delFunc()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a onclick="inValidFunc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
		
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="csglGrid"></table>  
</div>
<div id="csglAddInfo" align="center"></div>
<div id="csglEditInfo" align="center"></div>


</body>
</html>
