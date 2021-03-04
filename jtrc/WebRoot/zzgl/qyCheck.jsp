<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
    <title>企业审核</title>

<body>

<div>
<form id="fm" method="post">

    <div>
        <table class="table2">
            <tr>
                <td class="left" >企业代码</td>
                <td class="right"><input id ="enterpriseCode" name="enterpriseCode" disabled="disable" class="easyui-textbox"  data-options="required:true"  ></td>  				
				<td class="left">管理类型</td>
                <td class="right">
                    <input id ="manageType" name="manageType" disabled="disable" class="easyui-textbox" size="20"  value="" >
                </td>
                 <td class="left">是否签约企业</td>
                <td class="right">
                    <select class="easyui-combobox" name="isSignOrg" disabled="disable" style="width: 160px" >
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
		  </tr>
            <tr>
               
                <td class="left">主企业名称</td>
                <td class="right">
                    <input class="easyui-textbox" name="mainOrgName" disabled="disable" size="20" />
                </td>
                  <td class="left">组织机构代码</td>
                <td class="right">
                    <input id ="orgCode" name="orgCode" disabled="disable" class="easyui-textbox" size="20"  value="" >
                </td>
                <td class="left">单位名称</td>
                <td class="right">
                    <input id ="orgName" name="orgName" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
            </tr>
            <tr>
                <td class="left">企业性质</td>
                <td class="right">
                    <select class="easyui-combobox" name="orgNature" disabled="disable" style="width: 160px" >
                        <option value="0">私企</option>
						<option value="1">国企</option>
						<option value="2">外企</option>
						<option value="3">合资</option>
                    </select>
                </td>
                <td class="left">法人代表</td>
                <td class="right">
                    <input id ="legalPerson" name="legalPerson" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
                 <td class="left">单位所在行政区划</td>
                <td class="right">
                    <input id ="orgArea" name="orgArea" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
            </tr>
            <tr>
               
                <td class="left">填报单位类型</td>
                <td class="right">
                    <input id ="orgType" name="orgType" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
                    <td class="left">层次</td>
                <td class="right">
                    <input id ="orgLevel" name="orgLevel" disabled="disable" class="easyui-numberbox" size="20"  >
                </td>
                <td class="left">机构类型</td>
                <td class="right">
                    <input id ="type" name="type" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
            </tr>
            <tr>
                <td class="left">注册经济类型</td>
                <td class="right">
                    <input id ="registerType" name="registerType" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
                <td class="left">单位主管业务区域</td>
                <td class="right">
                    <input id ="businessArea" name="businessArea" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
                <td class="left">联系电话</td>
                <td class="right">
                    <input id ="phone" name="phone" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
            </tr>
            <tr>
                <td class="left">邮箱号码</td>
                <td class="right">
                    <input id ="email" name="email" disabled="disable" class="easyui-textbox" size="20"   >
                </td>
                 <td class="left">上级单位报出日期</td>
                <td class="right">
                    <input id ="sendTime" name="sendTime" disabled="disable" class="easyui-datebox" size="20"  >
                </td>
                <td class="left">上级单位类型</td>
                <td class="right">
                    <input id ="parentOrgType" name="parentOrgType" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
            </tr>
            <tr>
                <td class="left">上级单位代码</td>
                <td class="right">
                    <input id ="parentOrgCode" name="parentOrgCode" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
                <td class="left">上级单位名称</td>
                <td class="right">
                    <input id ="parentOrgName" name="parentOrgName" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
                <td class="left">上级单位负责人</td>
                <td class="right">
                    <input id ="parentOrgLeader" name="parentOrgLeader" disabled="disable" class="easyui-textbox" size="20" >
                </td>
            </tr>
            <tr>
                
                <td class="left">上级单位电话</td>
                <td class="right">
                    <input id ="parentOrgPhone" name="parentOrgName" disabled="disable" class="easyui-textbox" size="20"  >
                </td>
                <td></td><td></td><td></td><td></td>
            </tr>
        </table>
    </div>
   <hr style="height:2px;border:none;border-top:1px solid #555555;" />
     
        <div>
            <table class="table2">
                <tr>
                    <td class="left" >审核人</td>
                    <td class="right">
                        <input id ="checkUser" name="checkUser" disabled="disable" class="easyui-textbox"    >
                    </td>
                      <td class="left">审核状态</td>
                    <td class="right">
                        <select class="easyui-combobox" id="status" name="status" data-options="required:true,panelHeight:null,editable:false" style="width: 150px" >
                            <option value="1">已审核</option>
                            <option value="2">审核失败</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left">审核意见</td>
                    <td class="right" colspan="3">
                        <input class="easyui-textbox" id="content" name="content" data-options="multiline:true,required:true"  style="width:300px;height:100px">
                    </td>
                </tr>
                <tr>
				    <input type="text"  style="display:none" id="checkUserId" name="checkUserId"/>
				</tr>
            </table>
        </div>

    </form>
</div>
   
</body>

</html>