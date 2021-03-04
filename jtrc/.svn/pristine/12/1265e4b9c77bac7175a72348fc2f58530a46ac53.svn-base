<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
 
<html>
<head>
<title>报名审核</title>
<script type="text/javascript">
$("#checkUserName").val(sessionUserName);
$("#checkUserId").val(sessionUserId);
</script>
<body>

	<form id="checkBmbFm" method="post">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">审核人</td>
	      <td class="right">
		      <input id="checkUserName"  name="checkUserName"  readonly="readonly"  class="easyui-textbox" size="20"  data-options="required:true" style="height:22px">
		      <input id="checkUserId"  name="checkUserId"  readonly="readonly"  class="easyui-textbox" size="20" style="height:22px">
	      </td>
      </tr>
      <tr>
	      <td class="left">审核状态</td>
	      <td class="right">
		       <select id="checkStatus" class="easyui-combobox"  readonly="readonly"  name="checkStatus" style="width:135px;">   
			   	  <option value="a">已审核</option> 
			   	  <option value="b">审核失败</option>  
			   </select>
	      </td>
      </tr>
      <tr>
	      <td class="left">审核意见</td>
	      <td class="right">
	     	 <input maxlength="30" id="checkRemark" name="checkRemark"  readonly="readonly"  class="easyui-textbox" size="100"  data-options="required:true" style="height:22px">
	      </td>
      </tr>
      </table>  

    </div>
  </form> 

</body>

</html>
