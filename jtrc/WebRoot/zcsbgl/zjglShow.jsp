<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>专家查看</title>

<body>

	<form id="fm" method="post">

   <div>
    <table class="table2">
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input name="name" id="name" class="easyui-textbox" size="20"  disabled="disable" style="height:22px"></td>
      <td class="left">性别</td>
      <td class="right"><input name="sex" id="sex" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input name="pnum" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
       <td class="left">工作单位</td>
      <td class="right"><input name="company" class="easyui-textbox"   size="20" disabled="disable" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">专业名称</td>
      <td class="right"><input name="pro_type" class="easyui-textbox"  size="20" disabled="disable"  style="height:22px"></td>
       <td class="left">资格级别</td>
      <td class="right"><input name="zg_level" class="easyui-textbox"  size="20" disabled="disable"  style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">联系电话</td>
      <td class="right"><input name="tel" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
      <td class="left">通讯地址</td>
      <td class="right"><input name="adr" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">电子邮箱</td>
      <td class="right"><input name="email" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
      <td class="left">登录次数</td>
      <td class="right"><input name="login_times" class="easyui-textbox"  size="20" disabled="disable" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">剩余评审时长（分）</td>
      <td class="right"><input name="other_time" id="other_time" class="easyui-numberbox"  size="20" disabled="disable" data-options="required:true,editable:false,min:0" style="height:22px"></td>
     <!--  <td class="left">初始评审时长（分）</td>
      <td class="right"><input name="init_time" id="init_time" class="easyui-numberbox"  size="20" data-options="required:true,min:0" style="height:22px"></td> -->
      </tr>
      
      </table>  
      
      
        </div>

    </form> 

</body>

</html>
