<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>缴费信息新增</title>

<body>
	<form id="jfxxForm" method="post" >

    
       
       <table class="table2"  >
      <tr>
	      <td>档案编号</td>
	      <td>
	      	<input class="easyui-textbox" id="arNo" name="arNo" size="20"   style="height:22px">
	      	<input id="id" name="id"  type="hidden"/>
	      </td>
	     
      </tr>
      <tr>
		  <td>代理人姓名</td>
	      <td >   
		   <input class="easyui-textbox" id="proxyName" name="proxyName" size="20" style="height:22px;">
	      </td>
	  </tr>
      <tr>
        <td >*身份证号</td>
        <td ><input class="easyui-textbox" name="pnum" id="pnum" size="20" data-options="required:true,validType:['pnum']"  style="height:22px"></td>
     </td>     
      </tr>
      
      <tr>
	      <td >缴费类别</td>
	      <td >
	          <input class="easyui-textbox" name="jfType" id="jfType" size="20"  style="height:22px">
	      </td> 
      </tr>
	    <tr>
        <td >*缴费日期</td>
        <td ><input class="easyui-datebox" name="jfDate" id="jfDate" size="20" data-options="required:true" style="height:22px"></td>
     </td> 
      <tr>
	      <td >发票号码</td>
	      <td ><input class="easyui-textbox" id="pNo" name="pNo"  size="20"   style="height:22px"></td>
	     
      </tr>
	      <tr>
	      <td >缴费期限_起始日期</td>
	      <td ><input class="easyui-datebox" id="sDate" name="sDate"  size="20"   style="height:22px"></td>
	     
      </tr>
	      <tr>
	      <td >缴费期限_终止日期</td>
	      <td ><input class="easyui-datebox" id="eDate" name="eDate"  size="20"   style="height:22px"></td>
	     
      </tr>
	       
      </tr>
	      <tr>
	      <td >*缴费金额</td>
	      <td ><input class="easyui-numberbox" id="m" name="m" data-options="required:true,min:0,precision:2" size="20"   style="height:22px"></td>
	     
      </tr>
	       
      </tr>
	      <tr>
	      <td >选择缴费单</td>
	      <td ><input class="easyui-textbox" id="jfName" name="jfName"  size="20"   style="height:22px"></td>
	     
      </tr>
      </table>  
   
  </form> 
  
</body>

</html>
