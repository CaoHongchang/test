<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>职业新增</title>

<body>

  <form id="zypxEdit1Fm" method="post">
<input type="hidden" name="da_dpno" id="da_dpno"/>
     <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
	      <td class="left">培训单位</td>
	      <td class="right">
	      	<input class="easyui-textbox" id="edit_trainingUnit" name="training_unit" size="20" data-options="required:true"  style="height:22px">
	      </td>
	      <td class="left"></td>
	      <td class="right">   
	      </td>
      </tr>
      
      <tr>
        <td class="left">培训日期</td>
        <td class="right">     <input class="easyui-datebox" name="train_date" id="edit_traindate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
        <td class="left">结业日期</td>
        <td class="right">
			<input class="easyui-datebox" name="out_date" id="edit_outdate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
		</td>     
     </td>     
      </tr>
      
      <tr>
	      <td class="left">证书编号</td>
	      <td class="right">
	          <input class="easyui-textbox" name="train_no" id="edit_trainno" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	      </td> 
	      <td class="left"></td>
	      <td class="right"> </td>
      </tr>
      <tr>
	      <td class="left">发证机关</td>
	      <td class="right"><input class="easyui-textbox" id="edit_office" name="office"  size="20" data-options="required:true"  style="height:22px"></td>
	      <td class="left">发证时间</td>
	      <td class="right">
	        <input class="easyui-datebox" name="office_date" id="edit_officedate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	      </td>
      </tr>
      
      </table>  
      </div>   
   
     </div>
  </form> 

</body>

</html>
