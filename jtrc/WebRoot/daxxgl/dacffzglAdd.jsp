<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案存放新增</title>
<%@ include file="/system/head.jsp" %>
<body>

<script type="text/javascript">
$(document).ready(function(){  
    $("#staffname").val(sessionRealName);
    $("#p_uid").val(sessionUserId);  
    $.parser.parse();
});
</script>
		<form id="dacffzglAddFm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">案卷目录号</td>
      <td class="right">
       <input class="easyui-textbox" name="orgNo"  size="20"  style="height:22px">
	  </td>
      <td class="left">案卷目录题名/组织机构名</td>
      <td class="right">
       <input class="easyui-textbox" name="orgName" size="20"  style="height:22px">
      </td>
       <td class="left"></td>
      <td class="right">
      </td>
      </tr>
      <tr>
      <td class="left">所属年度</td>
      <td class="right">
       <input class="easyui-textbox"  name="sYear" size="20"  style="height:22px">
	   </td>
       <td class="left">案卷类型</td>
      <td class="right">
      <input class="easyui-textbox"  name="ajType" size="20"  style="height:22px">
      </td>
        <td class="left">存放位置</td>
      <td class="right">
      <input class="easyui-textbox"  name="position" size="20"  style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">录入人</td>
      <td class="right">
      <input class="easyui-textbox" id="staffname" readonly="readonly" name="staffname" size="20" data-options="required:true" style="height:22px">
	  <input type="hidden" id="p_uid" name="pUid" size="20" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">录入日期</td>
      <td class="right">
      <input class="easyui-datebox" name="addDate" value="<%= new Date() %>" readonly="readonly" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
        <td class="left"></td>
      <td class="right">
      </td>
      </tr>
      
      
      <tr>
      <td class="left">备注</td>
      <td class="right"  colspan="3" > <input class="easyui-textbox"  name="remark" size="60" data-options="multiline:true" style="height:60px;width: 475px"></td>
      </tr>
      
      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
