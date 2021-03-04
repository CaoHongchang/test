<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>目录管理界面</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	var url;
	
	$(function(){
	
	  $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==293){
				$("#a").show();
			}else if(value==294){
				$("#b").show();
			}else if(value==295){
				$("#c").show();
			}
	});
    },"json");
    
		$('#treeGrid').treegrid({
			url:'<%=request.getContextPath()%>/auth/treeGridMenu?parentId=-1',
			onLoadSuccess:function(){
				$("#treeGrid").treegrid('expandAll');
			}
		});
	});
	
	function formatIconCls(value,row,index){
		return "<div class="+value+">&nbsp;</div>";
	}
	
	function openAuthAddDialog(){
		var node=$('#treeGrid').treegrid('getSelected');
		if(node==null){
			$.messager.alert('系统提示','请选择一个父菜单节点！');
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","添加菜单");
		url="<%=request.getContextPath()%>/auth/saveMenu?parentId="+node.id;
	}
	
	function openAuthModifyDialog(){
		var node=$('#treeGrid').treegrid('getSelected');

		if(node==null){
			$.messager.alert('系统提示','请选择一个要修改的菜单！');
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","修改菜单");
		$("#fm").form("load",node);
		$("#authName").val(node.text);
		url="../auth/saveMenu?authId="+node.id;
	}
	
	function deleteAuth(){
		var node=$("#treeGrid").treegrid('getSelected');
		if(node==null){
			$.messager.alert('系统提示','请选择一个要删除的菜单节点！');
			return;
		}
		var parentNode=$("#treeGrid").treegrid('getParent',node.id);
		$.messager.confirm("系统提示","您确认要删除这个菜单节点吗?",function(r){
			if(r){
				$.post("<%=request.getContextPath()%>/auth/deleteMenu",{authId:node.id,parentId:parentNode.id},function(result){
					if(result.success){
						$.messager.alert('系统提示',"您已成功删除这个菜单节点！");
						$("#treeGrid").treegrid("reload");
						
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function saveAuth(){
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
					closeAuthDialog();
					$("#treeGrid").treegrid("reload");
				}
			}
		});
	}
	
	function closeAuthDialog(){
		$("#dlg").dialog("close");
		$("#fm").form('clear');
		$("#iconCls").val("icon-item");
	}
</script>

  <body style="margin: 1px;">
<table id="treeGrid" title="菜单管理" class="easyui-treegrid"  toolbar="#tb" data-options="idField:'id',treeField:'text',fit:true,fitColumns:true,rownumbers:true">
    <thead>
    	<tr>
    		<th data-options="field:'id'"  width="30" align="center">菜单编号</th>
    		<th data-options="field:'text'" width="80">菜单名称</th>
    		<th data-options="field:'authPath'"  width="100" align="center">链接地址</th>
    		<th data-options="field:'seq'" width="35" align="center" >排序</th>
    		<th data-options="field:'iconCls',formatter: function(value,row,index){ return formatIconCls(value,row,index);}" width="35" align="center">图标</th>
    		<th data-options="field:'authDescription'"   width="100" align="center">备注</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<a id="a" href="javascript:openAuthAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a id="b" href="javascript:openAuthModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a id="c" href="javascript:deleteAuth()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="dlg" data-options="closed:true,buttons:'#dlg-buttons'" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px">
  <form id="fm" method="post">
    <div class="formbody">
    <ul class="forminfo">
    <li><label>菜单名称：</label><input type="text" id="authName" name="authName" data-options="required:true" class="easyui-textbox" style="width:70%;height:32px" ><i></i></li>
<!--     <li><label>菜单样式：</label><input class="easyui-textbox" style="width:70%;height:32px" value="首页banner"><i></i></li>-->    
    <li><label>链接路径：</label><input id="authPath" name="authPath"  class="easyui-textbox" data-options="required:false"  style="width:70%;height:32px" ></li>
    <li><label>排序：</label><input id="seq" name="seq"  class="easyui-textbox" data-options="required:true"  style="width:70%;height:32px" ></li>
    <li><label>备注：</label><input name="authDescription" id="authDescription"  class="easyui-textbox" data-options="required:false"  style="width:70%;height:62px" ></li>
    </ul>

    </div>
  
<!--   	<table cellspacing="5px;">
  		<tr>
  			<td>菜单名称：</td>
  			<td><input type="text" id="authName" name="authName" class="easyui-validatebox" data-options="required:true" /></td>
  			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  			<td>菜单样式：</td>
  			<td><input type="text" id="iconCls" name="iconCls" value="icon-item" class="easyui-validatebox" data-options="required:true" /></td>
  		</tr>
  		<tr>
  			<td>链接路径：</td>
  			<td colspan="4"><input type="text" size="58" id="authPath" name="authPath" class="easyui-validatebox" data-options="required:true" /></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="4">
  				<textarea rows="7" cols="50" name="authDescription" id="authDescription"></textarea>
  			</td>
  		</tr>
  	</table> -->
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeAuthDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>
