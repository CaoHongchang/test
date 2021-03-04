<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head id="Head1">
    <title>广告平台管理</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script src="<%=request.getContextPath()%>/ps/index.js"></script>
	<script type="text/javascript">
	
	$(function(){
	
	$.post('../user/menu',{},getMenuListResult,"json");
	
	//ajax('./menuPage.do',{doAction:"act_getMenu"},getMenuListResult);
	
	// 在这里赋值, 用于解决 FF 里多个 iframe 的bug
	//$("#logo").get(0).contentWindow.document.location.href = "../logo/logo.html";
	//$("#topbar").get(0).contentWindow.document.location.href = "../topbar/topbar.html";
	//$("#menu").get(0).contentWindow.document.location.href = "../menu/menu.html";
	//$("#tabindex").get(0).contentWindow.document.location.href = "../tabindex/tabindex.html";
		
	$('#logout').click(function(){
		if(confirm("确定注销？")){
			window.location.href="../login.jsp";
			//$.post('../menuAction.php',{doAction:"act_logOut"},logout,"json");
			//window.location.href="../menuAction.php?doAction=act_logOut";	 
		}
		
	});
	
	
	//弹出密码修改窗口
    $('#modPwdWin').window({
        title: '修改密码',
        width: 400,
        modal: true,
        shadow: true,
        closed: true,
        height: 190,
        resizable:false
    });
	
	//密码修改
	$('#modPwd').click(function() {
		modPwd.location = getSitePath() + "/pages/sysmgr2/modPwdView.jsp";
		$('#modPwdWin').window('open');
	});	

});
function logout(data){
	
		window.location.href="../login.jsp";
}
function getMenuListResult(data){

	$("#tree").tree( {
		//url : "menu.json",
		//data:data.menuTree,
		//data:data.menuList,
		data:data.menuTree,
		onClick : doMenuClick
	});

	function doMenuClick(node) {
		
		if ($("#tree").tree("isLeaf", node.target) == false)
			return;

		var id = node.attributes;
		//var id = node.id;
		var text = node.text;
		if (!id) return;
				
		var elTab = parent.$('#mainTabs'); 
		if (elTab.tabs('exists', text)) {
			elTab.tabs('select', text);
		} else {
			// FIXME: iframe 必须包在 div 里, 否则会出现多余的滚动条
			// 如果新tab页能够设置style, 就不必这个多余的div了
			var url = id;
			var widthPx = window.screen.availHeight;
			var content = '<div  style="width:100%;height:100%;overflow:hidden;">'+
					'<iframe src="' + url + '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';

			elTab.tabs('add', {
				title : text,
				content : content,
				// href: url,
				closable : true
			});
		}
	}
}
	</script>
	<style type="text/css">
		#topbar{padding:0 5px;}
		#topbar-system{padding-top:4px;}
	</style>
</head>
<body class="easyui-layout">

	 <div region="north" split="true" border="false" style="overflow: hidden; height: 70px; background: url(<%=request.getContextPath()%>/images/head_bg.gif) #ffffff repeat-x;
        line-height: 60px;color: #000000; font-family: Verdana, 微软雅黑,黑体">
		
  
         <span style="padding-left:500px; font-size: 40px; ">
               广告平台管理系统
		</span>
		        
				<b style="width:33%">&nbsp;</b>
				<b>欢迎您， ${sessionScope.userName}</b>
				<b style="width:33%">&nbsp;</b>
		        <a id="logout" icon="icon-remove" class="easyui-linkbutton" plain="true">注销</a>
		      
	</div> 

    <div region="west" title="菜单" icon="icon-forward" style="width:210px;overflow:auto;" split="true" border="false" >
		<ul id="tree"></ul>
	</div>
    
    <div region="center" border="false" >
    	<div id="mainTabs" class="easyui-tabs" border="false" fit="true" >
		    <div title="首页" style="overflow:hidden;" >
		    	<!-- tabindex是项目相关的,所以用iframe来引用 -->
				<iframe id="tabindex" src="<%=request.getContextPath()%>/ps/tabindex.jsp" style="width:100%;height:90%;border:0;"></iframe>
		    </div>
		</div>
    </div>
    
	<div id="modPwdWin" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
		maximizable="false" icon="icon-edit" style="width: 400px; height: 250px; padding: 5px; background: #fafafa;">
		<iframe name="modPwd" frameborder="0" style="width:100%;height:100%;"></iframe>
	</div>
</body>
</html>