<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案新增</title>
</head>
<body>
<form id="fm" method="post">
     <input type="hidden" name="p_no" id="p_no">
     <input type="hidden" name="s_code" id="s_code">
     <input type="hidden" name="stuff" id="stuff">
        <div id="" class="easyui-accordion" style="height:350px;">   
        <table class="table2">
      <tr>
      <td class="left">档案状态</td>
      <td class="right">
       <select class="easyui-combobox" name="pState" id="pState" style="width:135px;">   
	   <option value="1">转入</option>  
	   <option value="2">转出</option> 
	   </select>
	  </td>
      <td class="left">档案性质</td>
      <td class="right"><input class="easyui-textbox"   name="pM" id="pM" size="20" style="height:22px"></td>
     
      </tr>
   <tr>
    <td class="left">身份类别</td>
      <td class="right">
       <select class="easyui-combobox"  name="pType" id="pType" style="width:135px;">  
       <option value="--空--">--空--</option> 
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
       <input class="easyui-textbox"   name="inPoint" id="inPoint" size="20" style="height:22px"></td>
   </tr>
   
    <tr>
     
       <td class="left">转入日期</td>
      <td class="right"><input class="easyui-datebox"   name="inDate" id="inDate" size="20" style="height:22px">
      </td>
      <td class="left">转出性质</td>
      <td class="right"><select class="easyui-combobox"  name="outP" id="outP" style="width:135px;">   
       <option value="--空--">--空--</option> 
	   <option value="单位人员">单位人员</option>  
	   <option value="调动">调动</option> 
	   <option value="改派">改派</option> 
	   <option value="考研">考研</option> 
	   </select></td>
      </tr>
      
      
      <tr>
      <td class="left">转出单位</td>
      <td class="right"> <input class="easyui-textbox"  name="outPoint" id="outPoint"  size="20" style="height:22px"></td>
     <td class="left">转出日期</td>
     <td class="right">
      <input class="easyui-datebox"  name="outDate" id="outDate" size="20" style="height:22px">
      </td>
      
      </tr>
      
      <tr>
      <td class="left">转出方式</td>
      <td class="right"><select  name="outMethod" id="outMethod" class="easyui-combobox" style="width:135px;">   
       <option value="--空--">--空--</option> 
	   <option value="机要寄出">机要寄出</option>  
	   <option value="领走">领走</option> 
	   </select></td>
	    <td class="left">转出机要号</td>
      <td class="right"><input class="easyui-textbox"  name="getN" id="getN"  size="20"  style="height:22px"></td>
      </tr>
      
      <tr>
     
     <td class="left">档案领走人姓名</td>
     <td class="right">
      <input class="easyui-textbox"   name="getName" id="getName" size="20"  style="height:22px">      
      </td>
      <td class="left">领走人电话</td>
      <td class="right">
            <input class="easyui-numberbox"  name="getTel" id="getTel"  size="20" style="height:22px">      
      </td>
      </tr> 
       <tr>
      <td class="left">录入人</td>
      <td class="right"><input class="easyui-textbox" name="stuffName" readonly="readonly" id="stuffName" size="20" style="height:22px"></td>
     <td class="left">录入日期</td>
     <td class="right">
      <input class="easyui-datebox"  name="addDate" id="addDate" readonly="readonly" size="20" style="height:22px">
      </td>
    
      </tr> 
      </table>  
       </div>
</form>		
<script type="text/javascript">
	var myDate = getNowFormatDate();
	
	$("#fm input[name='stuffName']").attr("value",sessionRealName);
	$("#fm input[name='stuff']").attr("value",sessionUserId);
	$("#fm input[name='addDate']").attr("value",myDate);
</script>
</body>

</html>
