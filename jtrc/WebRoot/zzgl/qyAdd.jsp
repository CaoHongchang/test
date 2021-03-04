<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>企业新增</title>

<body>

<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >企业代码</td>
                <td class="right"><input id ="enterpriseCode"  name="enterpriseCode" data-options="required:false" class="easyui-textbox"   ></td>  				
				<td class="left">管理类型</td>
                <td class="right">
                    <input id ="manageType" name="manageType" data-options="required:true" class="easyui-textbox" size="20"   >
                </td>
                  <td class="left">是否签约企业</td>
                <td class="right">
                    <select id="isSignOrg" class="easyui-combobox" name="isSignOrg" data-options="required:true,panelHeight:null,editable:false" style="width: 120px" >
                        <option value="0">否</option>
                        <option value="1">是</option>
						
                    </select>
                </td>
		  </tr>
            <tr>
              
                <td class="left" style="display: none" id="mainOrgLabelTd">主企业名称</td>
                <td class="right" style="display: none" id="mainOrgInputTd">
                    <input id="mainOrgName" class="easyui-textbox" name="mainOrgName" data-options="editable:false" size="20" />
                </td>
                  <td class="left">组织机构代码</td>
                <td class="right">
                    <input id ="orgCode" name="orgCode" data-options="required:true,validType:['stringDescValidate[]']" class="easyui-textbox" size="20"  >
                </td>
                <td class="left">单位名称</td>
                <td class="right">
                    <input id ="orgName" name="orgName" data-options="required:true" class="easyui-textbox" size="20"  >
                </td>
            </tr>
            <tr>
                <td class="left">企业性质</td>
                <td class="right">
                    <select id="orgNature" class="easyui-combobox" name="orgNature" data-options="required:true,panelHeight:null,editable:false" style="width: 160px" >
					<!--0:私企，1：国企，2：外企，3：合资-->
                        <option value="0">私企</option>
						<option value="1">国企</option>
						<option value="2">外企</option>
						<option value="3">合资</option>
                    </select>
                </td>
                <td class="left">法人代表</td>
                <td class="right">
                    <input id ="legalPerson" name="legalPerson" data-options="required:true" class="easyui-textbox" size="20"  value="" >
                </td>
                  <td class="left">单位所在行政区划</td>
                <td class="right">
                    <input id ="orgArea" name="orgArea" data-options="required:true" class="easyui-textbox" size="20"  value="" >
                </td>
            </tr>
            <tr>
              
                <td class="left">填报单位类型</td>
                <td class="right">
                    <!-- <input id ="orgType" name="orgType" data-options="required:true" class="easyui-textbox" size="20"  value="" > -->
                 <select id="orgType" class="easyui-combobox" name="orgType" data-options="required:true,panelHeight:null,editable:false" style="width: 160px" >
					<!--0:私企，1：国企，2：外企，3：合资-->
				<!-- 	<option value="请选择">--请选择--</option> -->
                    <option value="国有企业">国有企业</option>
					<option value="国有控股企业">国有控股企业</option>
					<option value="外资企业">外资企业</option>
					<option value="私营企业">私营企业</option>
					<option value="事业单位">事业单位</option>
					<option value="国家行政机关">国家行政机关</option>
					<option value="其他">其他</option>
                    </select>
                </td>
                   <td class="left">层次</td>
                <td class="right">
                    <input id ="orgLevel" name="orgLevel" data-options="required:true" class="easyui-numberbox" size="20"  value="" >
                </td>
                <td class="left">机构类型</td>
                <td class="right">
                    <input id ="type" name="type" data-options="required:true" class="easyui-textbox" size="20"  value="" >
                </td>
            </tr>
            <tr>
                <td class="left">注册经济类型</td>
                <td class="right">
                    <!--   <input id ="registerType" name="registerType" data-options="required:true" class="easyui-textbox" size="20"   >-->
                <select id="registerType" class="easyui-combobox" name="registerType" data-options="required:true,panelHeight:null,editable:false" style="width: 160px" >
                    <option value="国有经济">国有经济</option>
					<option value="集体经济">集体经济 </option>
					<option value="私营经济">私营经济 </option>
					<option value="私营经济">私营经济 </option>
					<option value="联营经济">联营经济 </option>
					<option value="股份制经济">股份制经济</option>
					<option value="外商投资经济">外商投资经济</option>
					<option value="港澳台投资经济">港澳台投资经济</option>
					<option value="其它经济">其它经济</option>
                    </select>
                </td>
                <td class="left">单位主管业务区域</td>
                <td class="right">
                    <input id ="businessArea" name="businessArea" data-options="required:true" class="easyui-textbox" size="20"   >
                </td>
                  <td class="left">联系电话</td>
                <td class="right">
                    <input id ="phone" name="phone" data-options="required:true,validType:['phoneNum[]']" class="easyui-textbox" size="20"   >
                </td>
            </tr>
            <tr>
              
                <td class="left">邮箱号码</td>
                <td class="right">
                    <input id ="email" name="email" data-options="required:true,validType:['emails[]']" class="easyui-textbox" size="20"   >
                </td>
                  <td class="left">上级单位报出日期</td>
                <td class="right">
                    <input id ="sendTime" name="sendTime" data-options="editable:false" class="easyui-datebox" size="20"   >
                </td>
                <td class="left">上级单位类型</td>
                <td class="right">
                    <input id ="parentOrgType" name="parentOrgType" class="easyui-textbox" size="20"   >
                </td>
            </tr>
            <tr>
                <td class="left">上级单位代码</td>
                <td class="right">
                    <input id ="parentOrgCode" name="parentOrgCode"  class="easyui-textbox" size="20"   >
                </td>
                <td class="left">上级单位名称</td>
                <td class="right">
                    <input id ="parentOrgName" name="parentOrgName"  class="easyui-textbox" size="20"   >
                </td>
                 <td class="left">上级单位负责人</td>
                <td class="right">
                    <input id ="parentOrgLeader" name="parentOrgLeader"  class="easyui-textbox" size="20"  >
                </td>
            </tr>
            <tr>
               
                <td class="left">上级单位电话</td>
                <td class="right">
                    <input id ="parentOrgPhone" name="parentOrgName" data-options="validType:['phoneNump[]']" class="easyui-textbox" size="20"   >
                </td><td></td><td></td><td></td><td></td>
            </tr>
        </table>
    </div>



</form>
<script type="text/javascript">
   $(function(){
	   var temp=null;
	   $('#orgCode').textbox({
		   onChange:function(newValue,oldValue){
			  if(temp==null){
				  temp=newValue;
			  }
			  if(temp!=newValue){
			  $.ajax({
				  url:'../zzgl/checkOrgCode',
				  type:'post',
				  data:{
					  orgCode:newValue
				  },
				  success:function(result){
					  if(result!=1){
						  $.messager.alert('系统提示',result);
						  $('#orgCode').textbox('setValue',''); 
					  }
				  }
				  
			  });
			  }
		   }
	   });
	   $.parser.parse($('#orgCode'));
   });
</script>
</body>

</html>