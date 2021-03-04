<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>职业新增</title>

<body>

  <form id="fm" method="post">

     <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
	      <td class="left">培训单位</td>
	      <td class="right">
	      	<input class="easyui-textbox" id="trainingUnit" name="trainingUnit" size="20" data-options="required:true"  style="height:22px">
	      </td>
	      <td class="left"></td>
	      <td class="right">   
	      </td>
      </tr>
      
      <tr>
        <td class="left">培训日期</td>
        <td class="right">     <input class="easyui-datebox" name="traindate" id="traindate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
        <td class="left">结业日期</td>
        <td class="right">
			<input class="easyui-datebox" name="outdate" id="outdate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
		</td>     
     </td>     
      </tr>
      
      <tr>
	      <td class="left">证书编号</td>
	      <td class="right">
	          <input class="easyui-textbox" name="trainno" id="trainno" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	      </td> 
	      <td class="left"></td>
	      <td class="right"> </td>
      </tr>
      <tr>
	      <td class="left">发证机关</td>
	      <td class="right"><input class="easyui-textbox" id="office" name="office"  size="20" data-options="required:true"  style="height:22px"></td>
	      <td class="left">发证时间</td>
	      <td class="right">
	        <input class="easyui-datebox" name="officedate" id="officedate" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	      </td>
      </tr>
      
      </table>  
      </div>   
   
     </div>
  </form> 

</body>

</html>
