<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>网络招聘会详细</title>
</head>
<body>
	<form id="fm" method="post">
   <div id="aa" class="easyui-accordion" >  
         <table class="table2">
		      <tr>
			      <td class="left">招聘会名称</td>
			      <td ><input id ="name1" name="name" class="easyui-textbox"
			       data-options="readonly:true" size="40" style="height:22px"></td>
			  </tr>
			  <tr>
			      <td class="left">举办时间</td>
			      <td ><input id ="hold_time" name="hold_time" class="easyui-datebox" 
			      data-options="required:true,readonly:true"  size="40" style="height:22px"></td>
		      </tr>
      	</table>  
   </div> 

    </form> 
    <script type="text/javascript">
	$(function(){
	});
	</script>
</body>
</html>
