<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>用户新增</title>

<body>

		<form id="fm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">用户名</td>
      <td class="right">
       <input class="easyui-textbox"   size="60" data-options="required:true" style="height:22px">
	  </td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right">
       <input class="easyui-textbox"   size="60" data-options="required:true" style="height:22px">
      </td>
      </tr>

      <tr>
      <td class="left">密码</td>
      <td class="right"  > <input class="easyui-textbox"   size="60" data-options="required:true" style="height:22px;"></td>
      </tr>
      
      <tr>
      <td class="left">部门</td>
      <td class="right"  >  <select id="cc" size="60"  class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select></td>
      </tr>
      
      <tr>
      <td class="left">角色</td>
      <td class="right"  >  <select id="cc" size="60"   class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select></td>
      </tr>
      </table>  
      </div>   
   
       </div>

        
       
      

             
    </form> 

</body>

</html>
