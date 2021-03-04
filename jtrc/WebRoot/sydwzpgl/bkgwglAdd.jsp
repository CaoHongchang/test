<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>报考岗位新增</title>

<body>

		<form id="fm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">单位名称</td>
      <td class="right">
       <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	  
	   </td>
	    <td class="left">岗位代码</td>
       <td class="right">
       <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px">
	   </td>
	   <td class="left">岗位名称</td>
       <td class="right">
       <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px">
	   </td>
      </tr>
      
      <tr>
       <td class="left">招考人数</td>
       <td class="right">
       <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px">
	   </td>
	   <td class="left">年龄要求</td>
       <td class="right">
       <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px">
	   </td>
	    <td class="left">性别要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
      </tr>
      
      <tr>
       <td class="left">民族要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
	    <td class="left">政治面貌要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
	    <td class="left">文化程度要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
      </tr>
      
      <tr>
      <td class="left">学校要求</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
	    <td class="left">学历类型要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
	    <td class="left">专业要求</td>
       <td class="right">
        <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	   
	   </td>
      </tr>
      
      <tr>
      <td class="left">试卷类型</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
	   <td class="left">考试名称</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
	   <td class="left">考试地点</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
      </tr>
      
      <tr>
      <td class="left">考试科目</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
	   <td class="left">考试日期</td>
     <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      <td class="left">考试时间</td>
     <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">其他要求</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
	   <td class="left">是否开考</td>
     <td class="right">
      <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>	
      </td>
      <td class="left"></td>
     <td class="right">
      </td>
      </tr>
      
      <tr>
      <td class="left">备注</td>
      <td class="right"  colspan="5" > <input class="easyui-textbox"   size="60" data-options="required:true,multiline:true" style="height:60px;width: 440px"></td>
      </tr>

      

      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
