<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>角色管理</title>
<%@ include file="/system/common.jsp" %>

<script type="text/javascript">
var sc=false;
       $(function(){
       
        $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
         $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==289){
				$("#a").show();
			}else if(value==290){
				$("#b").show();
			}else if(value==291){
				$("#c").show();
			}else if(value==292){
				sc=true;
			}
	});
    },"json");
    
	init();

       
       });

		function searchRole(){
			var array=$('#searchUserForm').serializeArray();
			var param={};
			$.each(array,function(index,value){
				param[value.name]=value.value;
			});
			$('#roleGrid').datagrid('load',param);
	}
	function init(){
	
         $('#roleGrid').datagrid({    
	      url:'../role/roleList', 
	     border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#dgTool',
		
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:[[   
	        {field:'id',title:'选择',checkbox:true,width:100,align:'center'}, 
	        {field:'roleid',title:'角色编码',align:'center'},
	        {field:'rolename',title:'角色名',width:100,align:'center'},    
	        {field:'roledescription',title:'备注',width:100,align:'center'},
	         {field:'roleState',title:'状态',width:100,align:'center'},
	         {title:'操作',field:'uid',width:150,align:'center',
		    		formatter: function(value,row,index){
                      var roleId=row.roleid;
                      if(sc)
 				      return '<a href="#" style="color: green;"  onclick="openAuthDialog(\''+row.roleid+'\')">权限分配</a>';
				}   
				}
	    ]]    
});  
	var pager = $('#roleGrid').datagrid('getPager');
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
	function deleteRole(){
		var selectedRows=$("#roleGrid").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert('系统提示','请选择要删除的数据！');
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].roleId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("role?action=delete",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert('系统提示',"您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#roleGrid").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].roleName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	var url;
	
	function openRoleAddDialog(){
		$('#roleAddInfo').dialog({
    title: '角色新增',
    width: 400,
    height: 200,
   
    closed: false,
    cache: false,
    href: '${ctx}/system/roleAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				saveRole();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				closeRoleSaveDialog();
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
             
    }  
     
});
		
	}
		function editRoleAddDialog(){
		
			var selectedRows=$("#roleGrid").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要编辑的数据！');
			return;
		}
		var row=selectedRows[0];
		
		$('#roleAddInfo').dialog({
    title: '角色修改',
    width: 400,
    height: 200,
   
    closed: false,
    cache: false,
    href: '${ctx}/system/roleEdit.jsp',
    modal: true,
     buttons:[{
				text:'更新',
				iconCls:'icon-ok',
				handler:function(){
				saveRole();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				closeRoleSaveDialog();
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   		 $('#rolename').textbox('setValue',row.rolename);
    	 $('#roleid').val(row.roleid);
     	 $('#roledescription').textbox('setValue',row.roledescription);
    }  
     
});
		
	}
	function openRoleModifyDialog(roleState){
	
	  
		var selectedRows=$("#roleGrid").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要编辑的数据！');
			return;
		}
		var row=selectedRows[0];
			$.post("../role/roleUpdate",{roleState:roleState,roleid:row.roleid},function(result){
			if(result.success){
				$.messager.alert('系统提示','执行成功！');
				init();
			}else{
				$.messager.alert('系统提示',result.errorMsg);
			}
		},"json");
	}
	
	function saveRole(){
		url="../role/save"
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert('系统提示',"<font color=red>"+result.errorMsg+"</font>");
					return;
				}else{
					$.messager.alert('系统提示','保存成功');
					closeRoleSaveDialog();
					$("#roleGrid").datagrid("reload");
				}
			}
		});
	}
	
	function closeRoleSaveDialog(){
		$("#roleAddInfo").dialog("close");
		$("#fm").form('clear');
	}
	var flag=0;
	function openAuthDialog(roleId){

	// var roleId=row.roleId;
	 $('#dlg2').dialog({
    title: '角色授权',
    width: 300,
    height: 450,
    padding: '10px 20px',
    closed: false,
    cache: false,
    href: '${ctx}/system/roleAuth.jsp',
    modal: true,
     buttons:[{
				text:'授权',
				iconCls:'icon-ok',
				handler:function(){
				 saveAuth(roleId);
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				closeAuthDialog();
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
       url="../auth/menu1?parentId=-1&roleId="+roleId;
		$("#roleTree").tree({
			lines:true,
			url:url,
			checkbox:true,
			cascadeCheck:false,
			animate:true,
			onLoadSuccess:function(){
				$("#roleTree").tree('expandAll');
			},
			
			onCheck:function(node,checked){
				if(flag==0){
				   if (checked) {
                        //var parentNode = $("#roleTree").tree('getParent', node.target);
                        //if (parentNode != null) {
                         //   $("#roleTree").tree('check', parentNode.target);
                        //}
                           var childNode = $("#roleTree").tree('getChildren', node.target);
              
                        if (childNode.length > 0) {
     
                            for (var i = 0; i < childNode.length; i++) {
                                $("#roleTree").tree('check', childNode[i].target);
                            }
                        }
                    } else {
                        var childNode = $("#roleTree").tree('getChildren', node.target);
                        if (childNode.length > 0) {
                            for (var i = 0; i < childNode.length; i++) {
                                $("#roleTree").tree('uncheck', childNode[i].target);
                               
                            }
                        }
                    }
                  
                    
				//if(checked){
					//checkNode($('#roleTree').tree('getParent',node.target));
				//}
			}
			}
		});   
     }
    });  
			
	}
	
	function checkNode(node){
		flag=1;
		if(node==null){
			return;
		}else{		
			checkNode($('#roleTree').tree('getParent',node.target));
			$('#roleTree').tree('check',node.target);
		}
	}
	
	function closeAuthDialog(){
		$("#dlg2").dialog("close");
	}
	
	function saveAuth(roleId){
	
		var nodes=$('#roleTree').tree('getChecked');
		var authArrIds="";
		for(var i=0;i<nodes.length;i++){
		checkNode(nodes[i]);
		}
		flag=0;
		var node=$('#roleTree').tree('getChecked');
		for(var i=0;i<node.length;i++){
		    if(i==0){
		    	authArrIds += node[i].id;
		    }else{
		    	authArrIds+=","+node[i].id;
		    }
		}

		$.post("../role/roleAuth",{authIds:authArrIds,roleId:roleId},function(result){
			if(result.success){
				$.messager.alert('系统提示','授权成功！');
				closeAuthDialog();
			}else{
				$.messager.alert('系统提示',result.errorMsg);
			}
		},"json");
	}
</script>

<body style="margin: 1px;">
<table id="roleGrid"></table>
<div id="dgTool" style="background-color:  #FFFFFF;">
	 <form id="searchUserForm">
	<div>
	
		&nbsp;角色名称：&nbsp;<input type="text" name="rolename" id="rolename"  style="width:150px;height:22px;border:1px solid;border-color: rgb(222, 222, 222)" onkeydown="if(event.keyCode==13) searchRole()"/>
	    &nbsp;角色状态：&nbsp;
		<select id="roleState"  name="roleState" style="width:130px;height:22px;border:1px solid;border-color: rgb(222, 222, 222)" >   
          <option value="">所有</option>  
          <option value="启用">启用</option>  
           <option value="失效">失效</option> 
      </select> 
      	<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
	</form>
	<div>
		<a id="a" href="javascript:openRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		<a id="a1" href="javascript:editRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a id="b" href="javascript:openRoleModifyDialog('失效')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">失效</a>
		<a id="c" href="javascript:openRoleModifyDialog('启用')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">启用</a>
	<!--<a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openAuthDialog()" class="easyui-linkbutton" iconCls="icon-man" plain="true">角色授权</a> -->
	</div>
</div>

<div id="roleAddInfo"></div>

<div id="dlg2">
	
</div>

</body>
</html>
