<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>个人材料列表</title>

<script type="text/javascript">
	$(function(){
   
   $('#grclglGrid').datagrid({    
    url:'../clgl/listUserMaterialInfo', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '#grclglTool',
	singleSelect:true,
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'sfzh',title:'身份证号',width: $(this).width() * 0.01,align:'center'},
         {field:'xm',title:'姓名',width: $(this).width() * 0.01,align:'center'},
         {field:'clbh',title:'材料编号',width: $(this).width() * 0.01,align:'center'},
         {field:'cllx',title:'材料类型',width: $(this).width() * 0.01,align:'center'},
         {field:'clmc',title:'材料名称',width: $(this).width() * 0.01,align:'center'},
         {field:'bz',title:'备注',width: $(this).width() * 0.01,align:'center'},
         {field:'lrsj',title:'录入时间',width: $(this).width() * 0.01,align:'center'},
         {field:'lrr',title:'录入人',width: $(this).width() * 0.01,align:'center'},
         {field:'yxx',title:'有效性',formatter:function(value,row,index){if(value=='1') return '无效'; else if(value=='2') return '有效';},width: $(this).width() * 0.01,align:'center'}
    ]]    
});  
	var pager = $('#grclglGrid').datagrid('getPager');
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
function getFlownumber(){
	
	var str="";
	for(var i=0;i<5;i++){
		str+=Math.floor(Math.random()*10);
    }
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var pno=date.getFullYear()+(month<9?"0"+month:month)+(day<9?"0"+day:day)+str;
	return pno;
}
/*个人材料新增*/
function addFuc(){
	$('#grclglAddInfo').dialog({
    title: '个人材料新增',
    width: 450,
    height: 500,
   
    closed: false,
    cache: false,
    href: '../clgl/grclAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				    var result=$('#fm').form('validate');
					if(result){
						$('#fm').form('submit',{
							url:'../clgl/insertUserMaterialInfo',
							type:'post',
							success:function(data){
								if(data==1){
								$('#grclglAddInfo').dialog('close');
				                $.messager.alert('系统提示','保存用户材料成功！');
								$('#grclglGrid').datagrid('reload');
								}else{		
									$.messager.alert('系统提示',data);
									$('#pno').textbox('setValue',getFlownumber());
								}
							}
						});
					}
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#grclglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		
		$('#pno').textbox('setValue',getFlownumber());
		
   /* $('#userAddGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 230,
	width:'100%',
	toolbar: '#userAddTool',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code',title:'角色名称',width:100},    
        {field:'name',title:'备注',width:150},    
         {title:'启用',field:'uid',width:100,align:'center',
	    		formatter: function(value,row,index){
				 return "<a href='#' style='color: blue;' onclick='' >启动<a> ";
			}   
			}
    ]]    
     });  
	var pager = $('#userAddGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});*/
    }  
});
}

/*个人材料修改*/
function updateFuc(){
	var row =$('#grclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
	$('#grclglAddInfo').dialog({
    title: '个人材料修改',
    width: 450,
    height: 500,
    closed: false,
    cache: false,
    href: '../clgl/grclAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				    var result=$('#fm').form('validate');
					if(result){
						$.messager.confirm("确认修改个人材料","您确定修改个人材料信息?",function(flag){
						if(flag){
								$('#fm').form('submit',{
							url:'../clgl/updateUserMaterial',
							type:'post',
							success:function(data){
								if(data==1){
								$('#grclglAddInfo').dialog('close');
				                $.messager.alert('系统提示','保存用户材料成功！');
								$('#grclglGrid').datagrid('reload');
								}else{
									$('#pno').textbox('setValue',getFlownumber());
									$.messager.alert('系统提示',data);
								}
							}
						    });
							}
						});
					}
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#grclglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		$('#usernum').textbox('setValue',row.sfzh);
		$('#username').textbox('setValue',row.xm);
		$('#pno').textbox('setValue',row.clbh);
		$('#ptype').textbox('setValue',row.cllx);
		$('#pname').textbox('setValue',row.clmc);
    }  
});
	}else{
		$.messager.alert('系统提示','请选择您要修改的个人材料！');
	}
}
function invalidFun(){
	var row=$('#grclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		$.messager.confirm('确定无效个人材料','您确定要无效该个人材料？',function(flag){
			if(flag){
				$.ajax({
					url:'../clgl/invalidMaterial',
					type:'post',
					data:{ids:row.id},
					success:function(result){
						if(result==1){
							$('#grclglGrid').datagrid('reload');
							$.messager.alert('系统提示','无效该个人材料成功！');
						}else{
							$.messager.alert('系统提示',result);
						}
					}
				});
			}
		});
	}else{
		$.messager.alert('提示','请选择您要无效的个人材料！');
	}
}
function chakanFun(){
	var row =$('#grclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
	$('#grclglAddInfo').dialog({
    title: '个人材料查看',
    width: 450,
    height: 500,
    closed: false,
    cache: false,
    href: '../clgl/grclShow.jsp',
    modal: true,
    iconCls: 'icon-save',
    onLoad: function () {
		$('#fm').form('load',row);
		$('#preview').attr("src",row.preview);
    }
	});
	}else{
		$.messager.alert('系统提示','请选择您要查看的个人材料！');
	}	
}
 function selectSubmit(){
	 $('#grclglGrid').datagrid('load',{});
 }
</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="grclglTool"  style="background-color:#FFFFFF;">
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="updateFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="invalidFun()"  class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
		<a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a onclick="chakanFun()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查看</a>
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="grclglGrid"></table>  
</div>
<div id="grclglAddInfo" align="center"></div>


</body>
</html>
