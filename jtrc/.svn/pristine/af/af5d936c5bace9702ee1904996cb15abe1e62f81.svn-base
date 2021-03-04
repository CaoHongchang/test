﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>信息管理系统界面</title>
<%@ include file="/system/common.jsp" %>

<script type="text/javascript">
function showxgmm(){debugger;
	$('#xgmmdialog').dialog({
    title: '修改密码',
    width: 300,
    height: 170,
    closed: false,
    cache: false,
    href: 'xgmm.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				xgmm();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xgmmdialog').dialog('close');
				}
			}]
	
});
  $('#xgmmdialog').dialog('open');
}
function logout(){

        
		$.post('users/loginout',function(){
		window.location='login.jsp';
		},"json");
		
}

function xgmm(){

	var oldpassword=$("#oldpassword").val();
	var newpassword=$("#newpassword").val();
	var renewpassword=$("#renewpassword").val();
	if(oldpassword==''){
	$.messager.alert("系统提示","请输入原密码");
	return ;
	}
	if(newpassword==''){
	$.messager.alert("系统提示","请输新密码");
	return ;
	}
	if(renewpassword==''){
	$.messager.alert("系统提示","请输入重复密码");
	return ;
	}
	if(renewpassword!=newpassword){
	$.messager.alert("系统提示","新密码和重复密码不一致");
	return ;
	}
	queryParam={};
	queryParam.oldpassword=oldpassword;
	queryParam.newpassword=newpassword;
	$.post('users/changePwd',queryParam,callback);
}

function callback(data){
	if(data.flag==1){
		$.messager.alert("系统提示","修改成功");
		$('#xgmmdialog').dialog('close');
		}
	else if(data.flag==2)
		$.messager.alert("系统提示","请输入正确的密码");
	else if(data.flag==3)
		$.messager.alert("系统提示","您尚未登录，请先登录");
	else if(data.flag==4)
		$.messager.alert("系统提示","系统发生未知错误！");
	else if(data.flag==5)
		$.messager.alert("系统提示","请输入新密码");
		else
		$.messager.alert("系统提示","修改失败，请重试");
}

var sessionRealName = '<%= sessionRealName %>'

if(sessionRealName==''){
    window.location.href = "/jtrc/";
}


</script>

</head>

<body class="easyui-layout" style="background:#f0f9fd;">

	<!-- north -->
	<div data-options="region:'north',border:false" style="height:88px; background:url(images/topbg.gif) repeat-x;">
		<div class="topleft">
			<img src="images/logo.png" title="系统首页" />
		</div>

		<ul class="nav">
		<!-- 
			<li><a href="" target="rightFrame" class="selected"><img src="images/icon01.png" title="个人信息" />
				<h2>个人信息</h2>
			</a>
			</li>
 -->
		</ul>

		<div class="topright">
			<ul>
			<!-- 
				<li><span><img src="images/help.png" title="帮助" class="helpimg" />
				</span><a href="#">帮助</a>
				</li> -->
				<li><a>欢迎您，<%= sessionRealName %></a>
				</li>
				<li><a href="#" onclick="showxgmm()" target="_parent">修改密码</a>
				</li>
				<li><a href="#" onclick="logout();" target="_parent">退出</a>
				</li>
				
			</ul>
		<!-- 
			<div class="user">
				<span>admin</span> <i>消息</i> <b>5</b>
			</div>-->
		</div>
	</div>

	<!-- center -->
	<div data-options="region:'center'">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
			    <ul id="munuTree" class="easyui-tree"></ul>
			</div>

		<div data-options="region:'center'">
			    <div class="easyui-tabs" data-options="fit:true,border:false"   id="pageTabs">
		          <div title="首页" data-options="iconCls:'icon-home'">
			      <div align="center" style="padding-top: 100px;"><h2 style="font-size:40;color:red">欢迎使用</h2></div>
		          </div>
	            </div>
			</div>		
		</div>
	</div>
	
	<div id="rcmenu" class="easyui-menu" style="">
		<div data-options="iconCls:'icon-cancel'" id="closecur">
			关闭当前
		</div>
		<div id="closeall">
			关闭全部
		</div>
		<div id="closeother">
			关闭其他
		</div>
		<!-- <div class="menu-sep"></div>
		<div id="closeright">
			关闭右侧标签页
		</div>
		<div id="closeleft">
			关闭左侧标签页
		</div> -->
		<div id="xgmmdialog">
		</div>
	</div>

<script type="text/javascript">
	$(function(){
	  $("#munuTree").tree({
			lines:true,
			url:'<%=request.getContextPath()%>/auth/menu?parentId=-1',
			onLoadSuccess:function(){
				$("#munuTree").tree('expandAll');
			},
			onClick:function(node){
				if(node.id==16){
					logout();
				}else if(node.id==15){
					openPasswordModifyDialog();
				}else if(node.attributes.authPath){
					openTab(node);
				}
			}
		});
	
	function openTab(node){
			var tabs = $("#pageTabs").data('tabs').tabs;  
			var index = -1;
	        for (var i = 0,len = tabs.length; i < len; i++) {
	        	
	            if (tabs[i].panel("options").id==node.id) {  
	                  index=i;
	                  break;
	            }
	            
	        }  
			
			if(index<=-1){
				optionOtherTab(node);
			}else{
				$("#pageTabs").tabs("select",index);
			}
			
		}

	
	});

	function optionOtherTab(node){
		var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src="+node.attributes.authPath+"></iframe>"
		$("#pageTabs").tabs("add",{
			id:node.id,
			title:node.text,
			iconCls:node.iconCls,
			closable:true,
			content:content
		});
	}
	
	function reloadYwTree(){
		if($("#pageTabs").tabs("exists","业务管理")){
			var tab = $('#pageTabs').tabs('getTab','业务管理');
			tab.find('iframe')[0].contentWindow.treeReload();
		}
	}
	
	$(function(){
		
		$(".tabs-header").bind('contextmenu',function(e){
			e.preventDefault();
			$('#rcmenu').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		});
		//关闭当前标签页
		$("#closecur").bind("click",function(){
			var tab = $('#pageTabs').tabs('getSelected');
			var index = $('#pageTabs').tabs('getTabIndex',tab);
			$('#pageTabs').tabs('close',index);
		});
		//关闭所有标签页
		$("#closeall").bind("click",function(){
			var tablist = $('#pageTabs').tabs('tabs');
			for(var i=tablist.length-1;i>=0;i--){
				$('#pageTabs').tabs('close',i);
			}
		});
		//关闭非当前标签页（先关闭右侧，再关闭左侧）
		$("#closeother").bind("click",function(){
			var tablist = $('#pageTabs').tabs('tabs');
			var tab = $('#pageTabs').tabs('getSelected');
			var index = $('#pageTabs').tabs('getTabIndex',tab);
			for(var i=tablist.length-1;i>index;i--){
				$('#pageTabs').tabs('close',i);
			}
			var num = index-1;
			for(var i=num;i>=0;i--){
				$('#pageTabs').tabs('close',0);
			}
		});
		//关闭当前标签页右侧标签页
		$("#closeright").bind("click",function(){
			var tablist = $('#pageTabs').tabs('tabs');
			var tab = $('#pageTabs').tabs('getSelected');
			var index = $('#pageTabs').tabs('getTabIndex',tab);
			for(var i=tablist.length-1;i>index;i--){
				$('#pageTabs').tabs('close',i);
			}
		});
		//关闭当前标签页左侧标签页
		$("#closeleft").bind("click",function(){
			var tab = $('#pageTabs').tabs('getSelected');
			var index = $('#pageTabs').tabs('getTabIndex',tab);
			var num = index-1;
			for(var i=0;i<=num;i++){
				$('#pageTabs').tabs('close',0);
			}
		});
			
	});

</script>

<script src="js/archiveHead.js"></script>
</body>
</html>
