<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>教育培训新增</title>

<body>

		<form id="jypxEidtFm" method="post">
<input type="hidden" name="da_dpno" id="da_dpno"/>
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table class="table2">
      <tr>
      <td class="left">教育类别</td>
      <td class="right">
       <select class="easyui-combobox" id="edit_study_type_id" name="study_type_id" style="width:135px;">   
	  	  <option value="脱产">脱产</option>  
	  	 <option value="业务">业务</option> 
	  	 <option value="函授">函授</option>
	  	 <option value="自考">自考</option>
	  	 <option value="电大开放教育">电大开放教育</option>
	  	  <option value="网络教育">网络教育</option>
	  	 <option value="在职教育">在职教育</option>
	  	  <option value="全日制">全日制</option>
	  	 <option value="全日制普通">全日制普通</option>
	  	 <option value="其他">其他</option> 
	   </select>
	  </td>
      <td class="left">学校名称</td>
      <td class="right">
      <input class="easyui-textbox" id="edit_school_name" size="20"   name="school_name" style="height:22px">
      </td>
      </tr>
      
      
      <tr>
       
       <td class="left">入学日期</td>
       <td class="right">     <input class="easyui-datebox" id="edit_in_date" name="in_date" size="20" data-options="showSeconds:false" value="" style="height:22px"></td>
       <td class="left">毕业日期</td>
       <td class="right">     <input class="easyui-datebox" id="edit_graduation_date" name="graduation_date" size="20" data-options="showSeconds:false" value="" style="height:22px"></td>     
      </tr>
      
      <tr>
      <td class="left">学历</td>
      <td class="right">
       <!--   <input class="easyui-textbox" id="education" name="education" size="20" data-options="showSeconds:false" value="" style="height:22px"> -->
      
          <select class="easyui-combobox" id="edit_education" name="edit_education" style="width:135px;">   
	  		<option value="">--请选择学历--</option>  
	  		 <option value="小学">小学</option>  
	  		 <option value="初中">初中</option> 
	  		 <option value="高中">高中</option>
	  		 <option value="职专">职专</option>
	  		 <option value="技工学校">技工学校</option>
	  		 <option value="专科">专科</option>
	  		 <option value="本科">本科</option>
	  	 	 <option value="研究生">研究生</option>
	  	 	 <option value="硕士">硕士</option>
	  	 	 <option value="博士">博士</option>
	   </select>
      </td>
      
      <td class="left">学位</td>
      <td class="right">
      	<!--<input class="easyui-textbox" id="degree" name="degree" size="20" data-options="showSeconds:false" value="" style="height:22px">-->
      	 <select class="easyui-combobox" id="edit_degree" name="edit_degree" style="width:135px;">   
	  		<option value="">--请选择学位--</option>  
	  		 <option value="学士学位">学士学位</option>
	  	 	 <option value="硕士学位">硕士学位</option>
	  	 	 <option value="博士学位">博士学位</option>
	   </select>
      </td>
      
      </tr>
     
     
      <tr>
      <td class="left">证书名称</td>
      <td class="right">
         <input class="easyui-textbox"  size="20" id="edit_certificate" name="certificate"   style="height:22px"> 
	  </td>
    <td class="left">学习专业</td>
      <td class="right">
  		    <input class="easyui-textbox"  size="20" id="edit_major" name="edit_major"  style="height:22px"> 
       </td>
      </tr>
      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
