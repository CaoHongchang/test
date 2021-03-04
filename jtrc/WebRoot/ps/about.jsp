<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>关于我们设置</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
    
    <script type="text/javascript">

    var editor = null;
    window.onload = function(){
        editor = CKEDITOR.replace('aboutusDescription'); //参数‘content’是textarea元素的name属性值，而非id属性值
    }
     $(function() {

	init();
       
	});
	function init(){
	
		var url = "../user/aboutinfo";
	
	$.post(url,null,function(data){
		
		editor.setData(data.r);
	},"json");
	}
    function publicNotice3(){
		editor.updateElement();
	
	
		var url = "../user/saveaboutinfo?content="+editor.getData();
		
		$.post(url,null,function(data){
			if(data.flag==1){
				alert("发布成功！");
			}else{
				alert("发布失败！");
			}
		},"json");

}
    
</script>
</head>
<body >

   <div region="center" border="false" split="false" style="overflow:hidden;">
			<textarea name="aboutusDescription" cols="" rows="40" id="aboutusDescription" class="span1-2" style="width:90%;">
			</textarea>
			
			<div region="south" border="false" style="text-align:right;line-height:30px;">
			<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:init()" >返回</a>
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:publicNotice3()" >确定</a>
				
			</div>
			
	</div>

</body>
</html>