<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>业务查看</title>
</head>

<body>
	<img alt="显示图片" id="showPic" src="">
	<script type="text/javascript">
	    alert(${path});
	    $("#showPic").attr("src","/jtrc/typeInfo/getPicByPath?path=" + encodeURIComponent(${path}));
	</script>
</body>

</html>

