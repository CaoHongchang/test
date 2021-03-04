<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>员工合同</title>

<body>
<form id="htForm">
  <table class="table3">
      <tr>
      <td  style="text-align: center;width: 40%">开始时间</td>
      <td  style="text-align: left;width: 60%">
            <input id ="startdate" name ="startdate"  class="easyui-datebox"  size="20" data-options="required:true,validType:'date'" style="height:22px">
      
	</td>
	</tr>
	<tr>
      <td class="left" style="text-align: center;width: 40%">结束时间</td>
      <td class="right" style="text-align: left;width: 60%">
           <input id ="enddate" name ="enddate"  class="easyui-datebox"  size="20" data-options="required:true,validType:'date'" style="height:22px">
      </td>
      </tr>
      </table>
      </form>
     <script type="text/javascript">
     function saveHt(){
      var r = $("#htForm").form('enableValidation').form('validate');
	  if(!r) {
		return false;
	  }
	  var startdate=$("#startdate").datebox('getValue');
	  var enddate= $("#enddate").datebox('getValue');
	 
     $('#ldhtGrid').datagrid('appendRow',{//单挑添加
	 startdate: startdate,
	 enddate:enddate
	});
     
      $('#ygHtInfo').dialog('close');
     }
     
     </script>
     
     
</body>

</html>
