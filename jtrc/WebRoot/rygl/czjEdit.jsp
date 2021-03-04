<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>修改</title>

<body>

	<form id="fmEdit" method="post">
       <input  type="hidden" name="id" id="id"/>
       <input  type="hidden" name="uid" id="uid"/>
   <div>
    <table class="table2">
      <tr>
	      <td class="left">专家编码</td>
	      <td class="right"><input id ="zpno1" name ="zpno" class="easyui-textbox" size="20"   style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">专家姓名</td>
	      <td class="right"><input id ="name1" name ="name" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">身份证号</td>
	      <td class="right"><input id ="pnum1" name ="pnum" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">专业组名</td>
	      <td class="right"><input id ="pro_type3" name ="pro_type" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">性别</td>
	      <td class="right">
	      	   <select id="sex1" class="easyui-combobox" name ="sex" style="width:135px;" editable="false">   
			   	  <option value="1">男</option> 
			   	  <option value="0">女</option>  
			   </select>
	      </td>
      </tr>
       <tr>
	      <td class="left">出生年月</td>
	      <td class="right"><input id ="birth_date1" name ="birth_date" class="easyui-datebox"  size="20"  style="height:22px"></td>
      </tr>

      <tr>
	      <td class="left">任职资格</td>
	      <td class="right"><input id ="zg_level1" name ="zg_level" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
            <tr>
	      <td class="left">资格取得时间</td>
	      <td class="right"><input id ="zg_time" name ="zg_time" class="easyui-datebox"  size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">行政职务</td>
	      <td class="right"><input id ="place_name1" name ="place_name" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">手机</td>
	      <td class="right"><input id ="tel1" name ="tel" class="easyui-numberbox"  size="20"   style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">工作单位</td>
	      <td class="right"><input id ="company1" name ="company" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">现从事专业工作</td>
	      <td class="right"><input id ="work_name1" name ="work_name" class="easyui-textbox"  size="20" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">毕业时间</td>
	      <td class="right"><input id ="graduation_time1" name ="graduation_time" class="easyui-datebox"  size="20" style="height:22px"></td>
      </tr>
        <tr>
	      <td class="left">毕业院校</td>
	      <td class="right"><input id ="school1" name ="school" class="easyui-textbox"  size="20" style="height:22px"></td>
      </tr>
        <tr>
	      <td class="left">专业</td>
	      <td class="right"><input id ="major1" name ="major" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
        <tr>
	      <td class="left">学历</td>
	      <td class="right"><input id ="degree1" name ="degree" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">备注</td>
	      <td class="right"><input id ="remark1" name ="remark" class="easyui-textbox"  size="20"  style="height:22px"></td>
      </tr>
      </table>  
   </div>
    </form> 
</body>

</html>
