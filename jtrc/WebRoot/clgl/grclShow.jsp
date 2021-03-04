<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>个人材料查看</title>

<body>

	<form id="fm" method="post" enctype="multipart/form-data">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">身份证号</td>
	      <td class="right"><input id ="usernum" name="usernum" class="easyui-textbox" size="30"  data-options="editable:false" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">姓名</td>
	      <td class="right"><input id ="username" name="username" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料编号</td>
	      <td class="right"><input id ="pno" name="pno" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料类型</td>
	      <td class="right"><input id ="ptype" name="ptype" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">材料名称</td>
	      <td class="right"><input id ="pname" name="pname" class="easyui-textbox"  size="30" data-options="editable:false" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">发证机关</td>
	      <td class="right"><input id="sname" name="sname" class="easyui-textbox"  size="30" data-options="editable:false"  style="height:22px"></td>
       </tr>
       <tr>
	      <td class="left">发证时间</td>
	      <td class="right"><input id="sdate" name="sdate" class="easyui-datebox"  size="30" data-options="editable:false"  style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">有效期</td>
	      <td class="right"><input id="validDate" name="validDate" class="easyui-datebox"  size="30" data-options="editable:false"  style="height:22px"></td>
      </tr>
	  <tr>
	      <td class="left">备注</td>
	      <td class="right"><input id="remark" name="remark" class="easyui-textbox"  size="30" data-options="editable:false"  style="height:22px"></td>
       </tr>
      <tr>
	      <td colspan="2" >
	            <img id="preview" alt="图片预览" src="../images/001.jpg" width="100px" height="100px">
	      </td>
	   </tr>
      </table>  
    </div>
    </form> 

</body>
   
</html>
