<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>企业材料列表</title>

<script type="text/javascript">
	$(function(){
   
   $('#qyclglGrid').datagrid({    
    url:'../clgl/listEnterpriseMaterialInfo', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '#qyclglTool',
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'zzjgdm',title:'组织机构代码',width: $(this).width() * 0.01,align:'center'},
         {field:'qymc',title:'企业名称',width: $(this).width() * 0.01,align:'center'},
         {field:'clbh',title:'材料编号',width: $(this).width() * 0.01,align:'center'},
         {field:'cllx',title:'材料类型',width: $(this).width() * 0.01,align:'center'},
         {field:'clmc',title:'材料名称',width: $(this).width() * 0.01,align:'center'},
         {field:'bz',title:'备注',width: $(this).width() * 0.01,align:'center'},
         {field:'lrsj',title:'录入时间',width: $(this).width() * 0.01,align:'center'},
         {field:'lrr',title:'录入人',width: $(this).width() * 0.01,align:'center'},
         {field:'yxx',title:'有效性',formatter:function(value,row,index){if(value=='1') return '无效'; else if(value=='2') return '有效';},width: $(this).width() * 0.01,align:'center'}
    ]]    
});  
	var pager = $('#qyclglGrid').datagrid('getPager');
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

/*企业材料新增*/
function addFuc(){
	$('#qyclglAddInfo').dialog({
    title: '企业材料新增',
    width: 450,
    height: 500,
   
    closed: false,
    cache: false,
    href: '../clgl/qyclAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					var result=$('#fm').form('validate');
						if(result){
						$('#fm').form('submit',{
							url:'../clgl/insertEnterpriseMaterialInfo',
							type:'post',
							success:function(data){
								if(data==1){
								$('#qyclglAddInfo').dialog('close');
				                $.messager.alert('系统提示','保存企业材料成功！');
								$('#qyclglGrid').datagrid('reload');
								}else{		
									$.messager.alert('系统提示',data);
									$('#materialCode').textbox('setValue',getFlownumber());
								}
							}
						});
					}
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#qyclglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		$('#materialCode').textbox('setValue',getFlownumber());
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

/*企业材料修改*/
function updateFuc(){
	var row =$('#qyclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
	$('#qyclglAddInfo').dialog({
    title: '企业材料修改',
    width: 450,
    height: 500,
    closed: false,
    cache: false,
    href: '../clgl/qyclAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				    var result=$('#fm').form('validate');
					if(result){
						$.messager.confirm("确认修改企业材料","您确定修改企业材料信息?",function(flag){
						if(flag){
								$('#fm').form('submit',{
							url:'../clgl/updateEnterpriseMaterialInfo',
							type:'post',
							success:function(data){
								if(data==1){
								$('#qyclglAddInfo').dialog('close');
				                $.messager.alert('系统提示','保存企业材料成功！');
								$('#qyclglGrid').datagrid('reload');
								}else{
									$('#materialCode').textbox('setValue',getFlownumber());
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
				$('#qyclglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		$('#enterpriseCode').textbox('setValue',row.zzjgdm);
		$('#enterpriseName').textbox('setValue',row.qymc);
		$('#materialCode').textbox('setValue',row.clbh);
		$('#materialType').textbox('setValue',row.cllx);
		$('#materialName').textbox('setValue',row.clmc);
    }  
});
	}else{
		$.messager.alert('系统提示','请选择您要修改的企业材料！');
	}
}
function invalidFun(){
	var row=$('#qyclglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		$.messager.confirm('确定无效企业材料','您确定要无效该企业材料？',function(flag){
			if(flag){
				$.ajax({
					url:'../clgl/invalidEnterpriseMaterial',
					type:'post',
					data:{ids:row.id},
					success:function(result){
						if(result==1){
							$('#qyclglGrid').datagrid('reload');
							$.messager.alert('系统提示','无效该企业材料成功！');
						}else{
							$.messager.alert('系统提示',result);
						}
					}
				});
			}
		});
	}else{
		$.messager.alert('提示','请选择您要无效的企业材料！');
	}
}
 function selectSubmit(){
	 $('#qyclglGrid').datagrid('load',{});
 }
 function chakanFun(){
	 var row =$('#qyclglGrid').datagrid('getSelected');
	 if(row!=null&&row!=undefined){
	 $('#qyclglAddInfo').dialog({
       title: '企业材料查看',
       width: 450,
       height: 500,
       closed: false,
       cache: false,
       href: '../clgl/qyclShow.jsp',
       modal: true,
       iconCls: 'icon-save',
       onLoad: function () {
			$('#fm').form('load',row);
			$('#preview').attr("src",row.preview);
		}  
		});
		}else{
			$.messager.alert('系统提示','请选择您要查看的企业材料！');
		}
 }
</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="qyclglTool"  style="background-color:#FFFFFF;">
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="updateFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="invalidFun()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
		<a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a onclick="chakanFun()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查看</a>
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="qyclglGrid"></table>  
</div>
<div id="qyclglAddInfo" align="center"></div>


</body>
</html>
