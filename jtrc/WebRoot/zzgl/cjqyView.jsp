<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>企业新增</title>
    
</head>    
<body>

<form id="fmView" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >组织机构代码</td>
                <td class="right">
                    <input id ="orgCode" name="orgCode" data-options="required:true" class="easyui-textbox">
                </td>  				
				<td class="left">机构名称</td>
                <td class="right">
                    <input id ="orgName" name="orgName" data-options="required:true" class="easyui-textbox"   >
                </td>
                  <td class="left">其他名称</td>
                <td class="right">
                    <input id ="otherName" name="otherName" data-options="required:true" class="easyui-textbox"   >
                </td>
		  </tr>
		  
		  <tr>
                <td class="left" >主管部门</td>
                <td class="right">
                    <input id ="competentDepartment" name="competentDepartment" data-options="required:true" class="easyui-textbox">
                </td>  				
				<td class="left">批准文号</td>
                <td class="right">
                    <input id ="approvalNumber" name="approvalNumber" data-options="required:true" class="easyui-textbox"   >
                </td>
                  <td class="left">成立时间</td>
                <td class="right">
                    <input id ="establishTime" name="establishTime" data-options="required:true" class="easyui-textbox"   >
                </td>
		  </tr>
            
          <tr>
                <td class="left" >单位性质</td>
                <td class="right">
                    <input id ="unitNature" name="unitNature" data-options="required:true" class="easyui-textbox">
                </td>  				
				<td class="left">单位级别</td>
                <td class="right">
                    <input id ="unitLevel" name="unitLevel" data-options="required:true" class="easyui-textbox"   >
                </td>
                  <td class="left">经费来源</td>
                <td class="right">
                    <input id ="fundsSource" name="fundsSource" data-options="required:true" class="easyui-textbox"   >
                </td>
		  </tr>
		  
		  <tr>
                <td class="left" >所属行业</td>
                <td class="right">
                    <input id ="industryInvolved" name="industryInvolved" data-options="required:true" class="easyui-textbox">
                </td>  				
				<td class="left">法定代表人</td>
                <td class="right">
                    <input id ="corporateRepresentative" name="corporateRepresentative" data-options="required:true" class="easyui-textbox"   >
                </td>
                  <td class="left">单位编制数</td>
                <td class="right">
                    <input id ="unitAllNumber" name="unitAllNumber" data-options="required:true" class="easyui-textbox"   >
                </td>
		  </tr>
		  
		  <tr>
                <td class="left" >现实有在岗人数</td>
                <td class="right">
                    <input id ="unitNowNumber" name="unitNowNumber" data-options="required:true" class="easyui-textbox">
                </td>  				
				<td class="left">地区代码</td>
                <td class="right">
                    <input id ="codeNumber" name="codeNumber" data-options="required:true" class="easyui-textbox"   >
                </td>
                
		  </tr>
		  
		  <tr>
		        <td class="left">单位地址</td>
                <td class="right">
                    <input id ="unitAddress" name="unitAddress" data-options="required:true" class="easyui-textbox"   >
                </td>
                <td class="left" >邮政编码</td>
                <td class="right">
                    <input id ="postalCode" name="postalCode" data-options="required:true" class="easyui-textbox">
                </td>  				
		  </tr>
		  <hr>
		   <tr>
				<td class="left">分管领导</td>
                <td class="right">
                    <input id ="branchedLeader" name="branchedLeader" data-options="required:true" class="easyui-textbox"   >
                </td>
                <td class="left">分管领导联系电话</td>
                <td class="right">
                    <input id ="branchedLeaderPhone" name="branchedLeaderPhone" data-options="required:true" class="easyui-textbox"   >
                </td>
                <td class="left" >分管领导联系手机</td>
                <td class="right">
                    <input id ="branchedLeaderMobile" name="branchedLeaderMobile" data-options="required:true" class="easyui-textbox">
                </td>  		
		  </tr>
		  
		  <tr>
				<td class="left">分管领导电子邮箱</td>
                <td class="right">
                    <input id ="branchedLeaderEmail" name="branchedLeaderEmail" data-options="required:true" class="easyui-textbox"   >
                </td>

		  </tr>
		  
		   <tr>
		        <td class="left">人事部门联系人</td>
                <td class="right">
                    <input id ="personnelLeader" name="personnelLeader" data-options="required:true" class="easyui-textbox"   >
                </td>
                <td class="left" >人事部门联系电话</td>
                <td class="right">
                    <input id ="personnelLeaderPhone" name="personnelLeaderPhone" data-options="required:true" class="easyui-textbox">
                </td>  				
			    <td class="left">人事部门联系手机</td>
                <td class="right">
                    <input id ="personnelLeaderMobile" name="personnelLeaderMobile" data-options="required:true" class="easyui-textbox"   >
                </td>
		  </tr>
		  <tr>
                  <td class="left">人事部门联系邮箱</td>
                <td class="right">
                    <input id ="personnelLeaderEmail" name="personnelLeaderEmail" data-options="required:true" class="easyui-textbox"   >
                </td>
                <td class="left" >人事部门传真</td>
                <td class="right">
                    <input id ="personnelLeaderFax" name="personnelLeaderFax" data-options="required:true" class="easyui-textbox">
                </td>  	
		  </tr>
		 
		  
        </table>
    </div>



</form>

</body>

</html>