<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>奖励情况</title>

<body>

		<form id="fm" method="post">

     <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">奖惩名称</td>
      <td class="right">
        <input class="easyui-textbox" id="reward_name" name="reward_name" size="20" data-options="required:true"  style="height:22px">
	  </td>
     <td class="left">奖惩批准机构</td>
      <td class="right">   
       <input class="easyui-textbox" id="en_name" name="en_name" size="20" data-options="required:true"  style="height:22px">
      </td>
      </tr>
      <tr>
      
       
       <td class="left">奖惩批准日期</td>
      <td class="right"> <input class="easyui-datebox" name="pz_date"  id="pz_date" size="20" data-options="required:true" value="" style="height:22px">
      </td>     
       <td class="left">奖惩撤消日期</td>
      <td class="right">  <input class="easyui-datebox" name="cx_date" id="cx_date" size="20" data-options="required:true" value="" style="height:22px">
     </td>     
      </tr>

      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
