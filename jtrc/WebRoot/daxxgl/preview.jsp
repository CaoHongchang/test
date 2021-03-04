<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>分类新增</title>
<script>

	 var num=0;
      function roate2(){
    	
    	 
           num++;
           $("#stm").rotate(num * 90);
        
      }
      </script>
<body style="padding:5px">
  <img id="previewImage" alt="预览图片"  src="" onClick="roate2()"/>
</body>

</html>