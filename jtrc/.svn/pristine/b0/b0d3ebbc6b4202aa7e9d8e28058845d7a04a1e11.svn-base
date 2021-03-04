<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>档案流动(移交/接收)登记</title>
<script type="text/javascript">



</script>
<body>

<form id="daldAddFm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
	      <td class="left">案卷数量</td>
	      <td class="right">
	       <input class="easyui-numberbox" min="0" name="anum"  size="20"  style="height:22px">
		  </td>
	      <td class="left">移动/接收日期</td>
	      <td class="right">
	      <input class="easyui-datebox" name="out_date" size="20" data-options="showSeconds:false" value="" style="height:22px">
	      </td>
      </tr>
      <tr>
	      <td class="left">移交/接收原因</td>
	      <td class="right">
	       <input class="easyui-textbox" name="out_use"  size="20"  style="height:22px">
		  </td>
	      <td class="left">档案号</td>
	      <td class="right">  <input class="easyui-textbox" name="dpno"  id="dpno" size="20"  style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">移交人</td>
	      <td class="right">
	       <input class="easyui-textbox" name="out_uid"  size="20"  style="height:22px">
		  </td>
	      <td class="left">接收人</td>
	      <td class="right">
	      	<input class="easyui-textbox" name="j_uid"  size="20"  style="height:22px">
	      </td>
      </tr>
      <tr>
	      <td class="left">备注</td>
	      <td class="right"  colspan="3" > <input class="easyui-textbox" name="remark"   data-options="multiline:true" style="height:60px;width: 435px"></td>
      </tr>
      <tr>
	      <td class="left">录入人</td>
	      <td class="right">
	     
	      	<input class="easyui-textbox" name="sessionUserName" id="sessionUserName"  value="<%= sessionRealName %>" readonly="readonly" size="20" data-options="required:true" style="height:22px">
		    <input type="hidden" name="staff" id="staff" value="<%= sessionUserId %>"  size="20" data-options="required:true" style="height:22px">
		  </td>
	      <td class="left">录入日期</td>
	      <td class="right">
	      	<input class="easyui-datetimebox" name="add_date" size="20" readonly="readonly" data-options="required:true" value="true" style="height:22px">
	      </td>
      </tr>
      
      </table>  
      </div>   
    </div>
  </form> 

</body>

</html>
