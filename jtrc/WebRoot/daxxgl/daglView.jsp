<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案查看</title>
</head>
<body>
<form id="fmView" method="post">
        <div id="" class="easyui-accordion" style="height:350px;">   
        <table class="table2">
      <tr>
      <td class="left">档案状态</td>
      <td class="right">
       <select class="easyui-combobox" name="p_state" id="p_state" style="width:135px;">   
	   <option value="1">转入</option>  
	   <option value="2">转出</option> 
	   </select>
	  </td>
      <td class="left">档案性质</td>
      <td class="right"><input class="easyui-textbox"   name="p_m" id="p_m" size="20"  style="height:22px"></td>
      
      </tr>
      <tr>
      <td class="left">身份类别</td>
      <td class="right">
       <select class="easyui-combobox"  name="p_type" id="p_type" style="width:135px;">   
	    <option value="国家干部">国家干部</option>  
	   <option value="聘用干部">聘用干部</option>
	   <option value="工人">工人</option>
	   <option value="应届毕业生">应届毕业生</option>
	   <option value="往届毕业生">往届毕业生</option>
	   <option value="其他">其他</option> 
	   </select>
      </td>
       <td class="left">转入单位</td>
      <td class="right">
       <input class="easyui-textbox"   name="in_point" id="in_point" size="20"  style="height:22px"></td>
      </tr>
      
      
      <tr>
     
       <td class="left">转入日期</td>
      <td class="right"><input class="easyui-datebox"  name="in_date" id="in_date" size="20"  style="height:22px">
      </td>
      <td class="left">转出性质</td>
      <td class="right"><select class="easyui-combobox"  name="out_p" id="out_p" style="width:135px;">   
	   <option value="单位人员">单位人员</option>  
	   <option value="调动">调动</option> 
	   <option value="改派">改派</option> 
	   <option value="考研">考研</option> 
	   </select></td>
      </tr>
      <tr>
      <td class="left">转出单位</td>
      <td class="right"> <input class="easyui-textbox"  name="out_point" id="out_point"  size="20"  style="height:22px"></td>
     <td class="left">转出日期</td>
     <td class="right">
      <input class="easyui-datebox" name="out_date" id="out_date" size="20"  style="height:22px">
      </td>
     
      </tr>
      
      <tr>
       <td class="left">转出方式</td>
      <td class="right"><select  name="out_method" id="out_method" class="easyui-combobox" style="width:135px;">   
	    <option value="机要寄出">机要寄出</option>  
	   <option value="领走">领走</option> 
	   </select></td>
       <td class="left">转出机要号</td>
      <td class="right"><input class="easyui-textbox"  name="get_n" id="get_n"  size="20"  style="height:22px"></td>
      
      </tr>
      
      <tr>
     
     <td class="left">档案领走人姓名</td>
     <td class="right">
      <input class="easyui-textbox"   name="get_name" id="get_name" size="20"  style="height:22px">      
      </td>
      <td class="left">领走人电话</td>
      <td class="right">
            <input class="easyui-textbox"  name="get_tel" id="get_tel"  size="20"  style="height:22px">      
      </td>
      </tr>
      <tr>
      <td class="left">录入人</td>
      <td class="right"><input class="easyui-textbox"   name="stuffName" id="stuffName" size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">录入日期</td>
     <td class="right">
      <input class="easyui-datebox"  name="add_date" id="add_date" size="20" data-options="required:true" style="height:22px">
      </td>
     
      </tr>
      </table>  
       </div>
</form>		
</body>

</html>
