<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>企业排查审核</title>
</head>
<body>
  <form id="auditForm" method="post">
    <input type="hidden" name="id" id="id">
    <input type="hidden" name="lastCheckId" id="lastCheckId">
    <div class="easyui-accordion" style="height:550px;">   
       <div title="企业信息" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
	      <tr>
	        <td class="left">组织机构代码</td>
	        <td class="right"><input id ="cCode" name ="cCode" disabled class="easyui-textbox"  size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      <tr>
	        <td class="left">企业名称</td>
	        <td class="right"><input class="easyui-textbox" id="name" name="name"  data-options="disabled:true" size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      <tr>
	        <td class="left">企业性质</td>
	        <td class="right"><input class="easyui-textbox" id="proId" name="proId"  size="40" data-options="disabled:true"  style="height:22px"></td>
	      </tr>
	      <tr>
	        <td class="left">经营范围</td>
	        <td class="right"><input class="easyui-textbox"  id="businessScope" name="businessScope" size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      <tr>
	        <td class="left">注册时间</td>
	      	<td class="right"><input class="easyui-textbox" name="registrationTime" id="registrationTime"  size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      
	      <tr>
	        <td class="left">法人代表</td>
	        <td class="right"><input class="easyui-textbox" name="sname" id="sname"  size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      
	      <tr>
	        <td class="left">联系人</td>
	        <td class="right"><input class="easyui-textbox"  name="contactName" id="contactName"  size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      
	      <tr>
	        <td class="left">联系电话</td>
	        <td class="right"><input class="easyui-textbox" name="tel" id="tel" size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      
	      <tr>
	        <td class="left">地址</td>
	        <td class="right"><input class="easyui-textbox"  name="address" id="address"  size="40" data-options="disabled:true" style="height:22px"></td>
	      </tr>
	      
	      <tr>
	        <td class="left">营业执照</td>
	        <td class="right"><input class="easyui-textbox"  name="businessLicenseName" id="businessLicenseName"  size="40" data-options="disabled:true" style="height:22px">
	          <input type="hidden" name="businessLicensePath" id="businessLicensePath" >
	          <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-image-preview" onclick="imagePreview('businessLicensePath')">预览</a>
	          &nbsp;&nbsp;
	          <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-download" onclick="downloadImage('businessLicensePath')">下载</a>
	        </td>
	      </tr>
      
          <tr>
	        <td class="left">组织机构代码证</td>
	        <td class="right"><input class="easyui-textbox"  name="orgCodeCertificateName" id="orgCodeCertificateName"  size="40" data-options="disabled:true" style="height:22px">
	           <input type="hidden" name="orgCodeCertificatePath" id="orgCodeCertificatePath" >
	          <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-image-preview" onclick="imagePreview('orgCodeCertificatePath')" >预览</a>
	          	&nbsp;&nbsp;
	          <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-download" onclick="downloadImage('orgCodeCertificatePath')">下载</a>
	        </td>
	      	
	      </tr>
	      
	      <tr>
	        <td class="left">税务登记证</td>
	        <td class="right"><input class="easyui-textbox" name="taxRegistrationCertificateName" id="taxRegistrationCertificateName"  size="40" data-options="disabled:true" style="height:22px">
	        	<input type="hidden" name="taxRegistrationCertificatePath" id="taxRegistrationCertificatePath" >
	        	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-image-preview" onclick="imagePreview('taxRegistrationCertificatePath')" >预览</a>
	          	&nbsp;&nbsp;
	          <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-download"  onclick="downloadImage('taxRegistrationCertificatePath')">下载</a>
	        </td>
	      </tr>
	      
	      <tr>
	        <td class="left">备注</td>
	        <td class="right"><input class="easyui-textbox" name="remark" id="remark" size="40" data-options="disabled:true,multiline:true" style="height:52px"></td>
	      </tr>
        </table>  
      </div>   	
    </div>
    
    <div class="easyui-accordion" style="height:200px;">   
      <div title="排查情况列表" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table id="pcGrid"  singleSelect="true"  >
		 </table>
      </div>
    </div>

    <div class="easyui-accordion" style="height:200px;">   
      <div title="审核信息" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
       <table  class="table2">
	     <tr>
	       <td class="left">审核状态</td>
	        <td class="right">
	            <select id="pcState" class="easyui-combobox" name="pcState" style="width:135px;">   
			   	  <option value="1">审核通过</option> 
			   	  <option value="2">审核未通过</option>  
			   </select>
		    </td>
		 </tr>
		 <tr>
	       <td class="left">审核说明</td>
	       <td class="right">
	         <input class="easyui-textbox" name="pcRemark" id="pcRemark" size="40" data-options="multiline:true"  style="height:52px">
		   </td>
		 </tr>
	   </table>   
      </div>
    </div>
 </form> 
</body>

</html>
