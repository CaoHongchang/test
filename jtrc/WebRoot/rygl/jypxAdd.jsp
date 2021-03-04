<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>教育培训新增</title>

<body>

		<form id="jypxAddFm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">教育类别</td>
      <td class="right">
       <select class="easyui-combobox" id="study_type_id" name="study_type_id" style="width:135px;">   
	  	 <option value="123">1</option>   
	   </select>
	  </td>
      <td class="left">学校名称</td>
      <td class="right">
      <input class="easyui-textbox" id="school_name" size="20" data-options="required:true"  name="school_name" style="height:22px">
      </td>
      </tr>
      
      
      <tr>
       
       <td class="left">入学日期</td>
       <td class="right">     <input class="easyui-datebox" id="in_date" name="in_date" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
       <td class="left">毕业日期</td>
       <td class="right">     <input class="easyui-datebox" id="graduation_date" name="graduation_date" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>     
      </tr>
      
      <tr>
      <td class="left">学历</td>
      <td class="right"><input class="easyui-textbox" id="education" name="education" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
      
      <td class="left">学位</td>
      <td class="right"><input class="easyui-textbox" id="degree" name="degree" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
      
      </tr>
     
     
      <tr>
      <td class="left">证书名称</td>
      <td class="right">
         <input class="easyui-textbox"  size="20" id="certificate" name="certificate" data-options="required:true"  style="height:22px"> 
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
