<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" src="<%=basePath%>js/jquery.js" ></script>
	<script language="javascript" src="<%=basePath%>js/ajaxfileupload.js" > </script> 
	<script type="text/javascript">
	function ajaxFileUpload()
	{
		alert(111);
       $.ajaxFileUpload({
                 url:'/jtrc/typeInfo/fileUpload',               //需要链接到服务器地址
                 secureuri:false,
                 fileElementId:'idFile',                         //文件选择框的id属性
                 dataType: 'text',                                     //服务器返回的格式，可以是json
                 success: function (data, status)             //相当于java中try语句块的用法
                 {   
                     alert(data);       //data是从服务器返回来的值   
                     //$('#result').html('上传图片成功!请复制图片地址<br/>'+data.src);
 
                 },
                 error: function (data, status, e)             //相当于java中catch语句块的用法
                 {
                     $('#result').html('上传图片失败');
                 }
               }
             );
    }
	</script>
  </head>
  
  <body> 
  <div id="result" style="FONT:12px 宋体"></div><br/>
 <img id="loading" src="loading.gif" style="display:none;">
		<form name="form_uploadImg" action="" method="POST" enctype="multipart/form-data">
 <input id="idFile" type="file" size="45" name="idFile" class="input" />
 <input type="button" id="buttonUpload" onclick="return ajaxFileUpload();" value="上传图片"/>
 <!-- 
 <img alt="" id="images" src="/jtrc/typeInfo/getPicByPath?path=E:/Workspaces/demo/.metadata/.me_tcat/webapps/jtrc/uploadfiles/yy.png">
 -->
 </form>
</html>

