<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>开设班级</title>

<body>

	<form id="fmEdit" method="post">
       <input  type="hidden" name="id" id="id"/>
       <input  type="hidden" name="uid" id="uid"/>
   <div>
    <table class="table2">
      <tr>
	      <td class="left">专家编码</td>
	      <td class="right"><input id ="zpno" name ="zpno" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">专家姓名</td>
	      <td class="right"><input id ="name" name ="name" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">身份证号</td>
	      <td class="right"><input id ="pnum" name ="pnum" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">性别</td>
	      <td class="right">
	      	   <select id="sex" class="easyui-combobox" name ="sex" style="width:135px;" editable="false">   
			   	  <option value="1">男</option> 
			   	  <option value="0">女</option>  
			   </select>
	      </td>
      </tr>
       <tr>
	      <td class="left">专业类别</td>
	      <td class="right"><input id ="pro_type" name ="pro_type" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">资格级别</td>
	      <td class="right"><input id ="zg_level" name ="zg_level" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">工作单位</td>
	      <td class="right"><input id ="company" name ="company" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">联系电话</td>
	      <td class="right"><input id ="tel" name ="tel" class="easyui-numberbox"  size="20" data-options="required:true"  style="height:22px"></td>
      </tr>
      </table>  
   </div>
    </form> 
</body>

</html>
