<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>职业新增</title>
 
<body>
<form id="zwzcEidtFm">
<input type="hidden" name="da_dpno" id="da_dpno"/>
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">级别</td>
      <td class="right">
       <select class="easyui-combobox" id="edit_p_level" name="p_level" style="width:135px;">   
	  	 <option value="员级">员级</option>  
	  	 <option value="助级">助级</option>
	  	 <option value="中级">中级</option>
	  	 <option value="副高级">副高级</option>
	  	 <option value="正高级">正高级</option>  
	   </select>
	  </td>
      <td class="left">评审方式</td>
      <td class="right">
         <select id="edit_p_method" class="easyui-combobox" name="p_method" style="width:135px;">   
	       <option value="考评">考评</option> 
	        <option value="考试">考试</option>   
	     </select>
      </td>
      </tr>
      
      <tr>
       
       <td class="left">专业技术资格名称</td>
       <td class="right"> 
          <input class="easyui-textbox" name="pro_z_name" id="edit_pro_z_name" size="20" data-options="showSeconds:false" value="" style="height:22px">  
       </td>
       <td class="left">专业名称</td>
       <td class="right">
        <input class="easyui-textbox" id="edit_pro_name" name="pro_name" size="20"   style="height:22px">
       </td>     
      </tr>
       <tr>
	       <td class="left">审批部门</td>
	       <td class="right">   
	        <input class="easyui-textbox" id="edit_department_id" name="department_id"  size="20"   style="height:22px">     
	       </td>  
	      <td class="left">批准文号</td>
	      <td class="right">
	      <input class="easyui-textbox"  size="20" id="edit_pz_no" name="pz_no"   style="height:22px">
	      </td>
      </tr>
      
     <tr>
      <td class="left">批准日期</td>
      <td class="right">
        <input class="easyui-datebox"  name="pz_date1" id="edit_pz_date1" size="20"  value="" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right">
       </td>
    </tr> 
     
     
      
      </table>  
      </div>   
   
       </div>
  </form>
  
</body>

</html>
