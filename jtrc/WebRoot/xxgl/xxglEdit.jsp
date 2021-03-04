<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>选项新增</title>
<body>

  <form id="fm" method="post">
    <div>
      <table class="table2">
	      <tr>
		      <td class="left">选项编码</td>
		      <td class="right"><input id ="zhmc11" name="zhmc11" class="easyui-textbox" size="20"  data-options="editable:false" style="height:22px"></td>
		  </tr>
	      <tr>
		      <td class="left">选项名称</td>
		      <td class="right"><input id ="zhmc21" name="zhmc21" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
	      </tr>
		  <tr>
		      <td class="left">备注</td>
		      <td class="right"><input id ="zhmc31" name="zhmc31" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
		  </tr>
      </table>  
    </div>
    <table id="xxAddGrid1" style="width: 50%;"></table>
  </form> 

</body>

</html>
