<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>用户管理</title>

<script type="text/javascript">
var xg=false;
var sc=false;
	$(function(){
   
   $("#a").hide();
   $("#b").hide();
   $("#c").hide();
   $("#d").hide();
   $("#e").hide();
    	  $('#cc').combobox({valueField:'rolename',textField:'rolename'});
     $.post('../role/roleList',null,function(result){
		       $('#cc').combobox('loadData',result.rows);
		       if(result.rows.length==0){
		           $('#cc').combobox('clear');
		       }
		    },'json');
		    
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==283){
				$("#a").show();
			}else if(value==284){
				$("#b").show();
			}else if(value==285){
				$("#c").show();
			}else if(value==286){
				$("#d").show();
			}else if(value==287){
				$("#e").show();
			}else if(value==288){
				xg=true;
			}else if(value==289){
				sc=true;
			}
	});
    },"json");
   
   
   init();
	
	
	
	});
function init(){

 $('#userGrid').datagrid({    
    url:'../users/queryUsers', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '#userTool',
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'userId',title:'选择',checkbox:true,width:100,align:'center'},
        {field:'userName',title:'用户名',width:100,align:'center'},    
        {field:'roleName',title:'角色',width:100,align:'center'},    
        {field:'userState',title:'状态',width:100,align:'center',formatter:function(value,row,index){ if(value=='1') return '有效';else if(value=='2') return '无效'; else return '未知'}},
         {title:'操作',field:'uid',width:100,align:'center',
	    		formatter: function(value,row,index){
	    		
	    		if(xg&&sc){
	    		  return "<a href=\"javascript:modifyUser("+row.userId+")\" style='color: blue;'  >修改<a>&nbsp;&nbsp;<a href=\"javascript:deleteUser("+row.userId+")\" style='color: blue;' >删除</a>";
	    		}else if(xg&&!sc){
	    		 return "<a href=\"javascript:modifyUser("+row.userId+")\" style='color: blue;'  >修改<a>&nbsp;&nbsp;";
	    		}else if(!xg&&sc){
	    		  return "<a href=\"javascript:deleteUser("+row.userId+")\" style='color: blue;' >删除</a>";
	    		
	    		}
				
			}   
			}
    ]]    
});  
	var pager = $('#userGrid').datagrid('getPager');
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
	
}


function addFuc(){
	$('#userAddInfo').dialog({
    title: '平台账户新增',
    width: 400,
    height: 410,
   
    closed: false,
    cache: false,
    href: '${ctx}/system/userAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					if($('#fm').form('validate')){
						 $.messager.confirm('确定新增','确定新增用户？',function(flag){
						    	if(flag){
						    		$.post('../users/saveUser',$('#fm').serialize()+'&roleId='+getChoseUsing(),function(result){
					    					$('#userAddInfo').dialog('close');
						    			if(result.flag){
						    				$.messager.alert('系统提示', '新增用户成功','info');
					    					$('#userGrid').datagrid('reload');
					    				}
						    		},'json');
						    	}
						 });
					}
				   
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#userAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#userAddGrid').datagrid({    
    url:'../role/roleList', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 230,

	toolbar: '#userAddTool',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'id',title:'选择',checkbox:true,width:100},
        {field:'rolename',title:'角色名称',width:100},    
        {field:'roledescription',title:'备注',width:150},    
         {title:'启用',field:'uid',width:100,align:'center',
	    		formatter: function(value,row,index){
	    		 if(value==undefined || value=='1')
				 return "<a href='javascript:startUsing()' style='color: blue;'  >启动<a> ";
				 else
				 return "<a href='javascript:startUsing()' style='color: blue;'  >关闭<a> ";
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
	});
	
     
    }  
     
    
});


}
//启用和关闭角色
function startUsing(){
	var rows=$('#userAddGrid').datagrid('getRows');
	var selections=$('#userAddGrid').datagrid('getSelections');
	if(selections!=undefined){
		$.each(rows,function(i,row){
			$.each(selections,function(j,selection){
				if(row.roleid==selection.roleid){
					if(row.uid==undefined||row.uid=='1'){
						row.uid='2';
					}else{
						row.uid='1';
					}
				}
			});
		
		});
		$('#userAddGrid').datagrid('loadData',rows);
	}
	
}
//获取启动的角色
function getStartUsing(){
	var rows=$('#userAddGrid').datagrid('getRows');
	var result="";
	$.each(rows,function(i,row){
		if(row.uid==undefined||row.uid=='1'){
			result+=row.roleid+",";
		}
	});
	//alert(result);
	return result==''?result:result.substring(0, result.length-1);
}
//获取选中的角色
function getChoseUsing(){
	var rows=$('#userAddGrid').datagrid('getSelections');
	var result="";
	$.each(rows,function(i,row){
		if(row.uid==undefined||row.uid=='1'){
			result+=row.roleid+",";
		}
	});
	return result==''?result:result.substring(0, result.length-1);
}
//查询
function searchUser(){
	var array=$('#searchUserForm').serializeArray();
	var param={};
	$.each(array,function(index,value){
		param[value.name]=value.value;
	});
	$('#userGrid').datagrid('load',param);
}
//修改密码
function changePassword(){
	var selected=$('#userGrid').datagrid('getSelected');
	if(selected!=undefined){
	$('#userAddInfo').dialog({
		title:'修改密码',
		width:400,
		height:300,
		href:'${ctx}/system/changePassword.jsp?userId='+selected.userId,
		cache:false,
		closed:false,
		modal:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
				var result=$('#changPwdForm').form('validate');
				if(result){
					$.post('${ctx}/users/changePwdRet',$('#changPwdForm').serialize(),function(result){
						$('#userAddInfo').dialog('close');
						if(result.flag){
							$.messager.alert('系统提示','重置密码成功！','info');
						}
					},'json');
				}
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
				$('#userAddInfo').dialog('close');
			}
		}],
		iconCls:'icon-save',
		onLoad:function(){
			$('#changPwdForm').form('load',selected);
		}
	});
	}else {
		$.messager.alert('系统提示','请选择要重置密码的用户！','info');
	}
}
//删除用户
function deleteUser(id){
	
	var ids="";
	if(id!=''){
		ids=id;
	}else{
		ids=getSelections();
	}

	if(ids!=""){
		$.post('../users/deleteUser',{ids:ids},function(result){
			if(result.flag){
				$.messager.alert('系统提示','删除用户成功！','info');
				init();
			}
		},'json');
		
	}else{
		$.messager.alert('系统提示','请选择您要删除的用户！','info');
	}
}


//有效、无效
function modifyUserState(id,userState){
	var ids="";
	if(id!=''){
		ids=id;
	}else{
		ids=getSelections();
	}
	if(ids!=""){
		$.post('../users/editUserValid',{ids:ids,userState:userState},function(result){
			if(result.flag){
				$.messager.alert('系统提示','操作成功！','info');
				init();
			}
		},'json');
		
	}else{
		$.messager.alert('系统提示','请选择您要操作的用户！','info');
	}
}

function getSelections(){
	var rows=$('#userGrid').datagrid('getSelections');
	var result="";
	if(rows!=undefined&&rows.length>0){
		$.each(rows,function(index,value){
			result+=value.userId+",";
		});
		return result.substring(0,result.length-1);
	}
	return result;
}
function modifyUser(id){
	$('#userAddInfo').dialog({
	    title: '平台账户修改',
	    width: 400,
	    height: 410,
	    closed: false,
	    cache: false,
	    href: '${ctx}/system/userEdit.jsp',
	    modal: true,
	    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						if($('#fm').form('validate')){
							 $.messager.confirm('确定修改','确定修改用户？',function(flag){
							    	if(flag){
							    		$.post('../users/updateUser',$('#fm').serialize()+'&roleId='+getStartUsing()+'&userId='+id,function(result){
						    					$('#userAddInfo').dialog('close');
							    			if(result.flag){
							    				$.messager.alert('系统提示', '修改用户成功','info');
						    					$('#userGrid').datagrid('reload');
						    				}
							    		},'json');
							    	}
							 });
						}
					   
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#userAddInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	    	
	    	$('#userAddGrid').datagrid({    
	    		url:'', 
	    		border:true,
				pageSize:10,
				pageList:[10,20,30,40],
				striped: true,
				collapsible:true,
				fitColumns:true,
				height: 230,
				toolbar: '#userAddTool',
				sortName: '',
				sortOrder: 'desc',
				remoteSort: false,    
				checkOnSelect: true,
				selectOnCheck: true,
				singleSelect: true,
	    		columns:[[    
	       					{field:'id',title:'选择',checkbox:true,width:100},
	        				{field:'rolename',title:'角色名称',width:100},    
	        				{field:'roledescription',title:'备注',width:150},    
	         				{title:'启用',field:'uid',width:100,align:'center',
		    				formatter: function(value,row,index){
		    		 if(value==undefined || value=='1'){
		    		    // alert(index);
		    	     	// $('#userAddGrid').datagrid('checkRow', index);
					   return "<a href='javascript:startUsing()' style='color: blue;'  >启动<a> ";
					   }
					 else
					 return "<a href='javascript:startUsing()' style='color: blue;'  >关闭<a> ";
				}   
				}
	    ]]    ,
	    onLoadSuccess:function(data){
	       if(data){
	       $.each(data.rows, function(index, item){
	     
	       if(item.uid=='1'){
	       
	          $('#userAddGrid').datagrid('checkRow', index);
	       }
	         
	       });
	       }
	    }
	     });  
	    //预加载修改用户对话框数据
		 $.post('../users/onLoadUser',{userId:id},function(result){
			 $('#orginUserName').attr('value',result.userName);
			 $('#userAddGrid').datagrid('loadData',result.roleList);
			 $('#enterpriseId').combotree('tree').tree({
					onLoadSuccess:function(node,data){
						var node=$('#enterpriseId').combotree('tree').tree('find',result.enterprise_id);
						$('#enterpriseId').combotree('tree').tree('select',node.target);
						$('#enterpriseId').combotree('setValue',node);
					}
		     });
			 $('#departmentId').combobox({
				 onLoadSuccess:function(){
					 $('#departmentId').combobox('select',result.id);
					 $('#departmentId').combobox('setValue',result.id);
				 }
			 });
			 $('#username').textbox('setValue',result.userName);
			 $('#realName').textbox('setValue',result.realName);
			 
		 },'json');
	    }  
	     
	    
	});

}
</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="userTool"  style="background-color:#FFFFFF;">
	   <div>
	   <form id="searchUserForm">
		<!-- &nbsp;角色名称：&nbsp;<input type="text"  class="easyui-textbox"  name="roleName"  size="20" onkeydown="if(event.keyCode==13) searchUser()"/> -->
		&nbsp;角色：&nbsp;
		<select id="cc" class="easyui-combobox" name="roleName"  style="width:130px" >   
          
      </select> 
      &nbsp;账号状态：&nbsp;
		<select id="userType" class="easyui-combobox" name="userType" style="width:130px" data-options="editable:false,panelHeight:null">   
          <option value="0">所有</option>
          <option value="1">有效</option>   
          <option value="2">无效</option>
      </select> 
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</form>
	</div>
	
		<a id="a" onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="b" onclick="modifyUserState('','1')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">有效</a>
		<a id="c" onclick="modifyUserState('','2')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">无效</a>
		<!-- <a id="d" onclick="deleteUser('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="e" onclick="changePassword()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >重置密码</a> -->
		<a onclick="deleteUser('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a onclick="changePassword()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >重置密码</a>
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="userGrid"></table>  
</div>
<div id="userAddInfo" style="align:center"></div>


</body>
</html>
