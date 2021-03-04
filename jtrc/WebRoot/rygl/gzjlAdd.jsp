<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>工作简历新增</title>

<body>

		<form id="fm" method="post">

     <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">起始时间</td>
      <td class="right">
        <input class="easyui-datebox" id="start_date" name="start_date" size="20" data-options="required:true"  style="height:22px">
	  </td>
     <td class="left">终止时间</td>
      <td class="right">    <input class="easyui-datebox" id="end_date" name="end_date" size="20" data-options="required:true"  style="height:22px"></td>
     
    
      </tr>
      <tr>
	       <td class="left">企业id</td>
	       <td class="right"> <input class="easyui-textbox" name="enterprise_id"  id="enterprise_id" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	       </td>     
	       <td class="left">所在部门</td>
	       <td class="right">  <input class="easyui-textbox" name="department_id" id="department_id" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
          </td>     
      </tr>
	  <tr>
	       <td class="left">岗位名称</td>
	       <td class="right"> <input class="easyui-textbox" name="place_id"  id="place_id" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	       </td>     
	       <td class="left"></td>
	       <td class="right"> </td>     
      </tr>
      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
