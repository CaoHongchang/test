<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<%@ taglib prefix="qzzp" uri="http://www.qzzp.org" %>
<html>
<head>
</head>
<body>
	<form id="fm" method="post">
	<div id="aa" class="easyui-accordion" style="height:300px;">
		<input type="hidden" name="id" value="${area.id }"/>
		<div title="企业信息" data-options="fit:true,selected:true,collapsible:false" style="overflow:auto;">     
	         <table class="table2">
			      <tr>
				      <td class="left flabel">企业名称：</td>
				      <td class="right fvalue" colspan="3">${enterprise.name }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">企业性质：</td>
				      <td class="right fvalue"><qzzp:dict id="enterpriseType" dictCode="ENTERPRISE_TYPE" value="${enterprise.type }" readonly="true"/></td>
				      <td class="left flabel">企业规模：</td>
				      <td class="right fvalue"><qzzp:dict id="ENTERPRISE_SCALE" dictCode="ENTERPRISE_SCALE" value="${enterprise.scale }" readonly="true"/></td>
			      </tr>
			      <tr>
				      <td class="left flabel">企业所在地：</td>
				      <td class="right fvalue">${enterprise.province  }</td>
				      <td class="left flabel">详情地址：</td>
				      <td class="right fvalue">${enterprise.address }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">注册资金：</td>
				      <td class="right fvalue">${enterprise.registeredCapital }</td>
				      <td class="left flabel">企业logo：</td>
				      <td class="right fvalue" rowspan="3">
				      	<img width="100px" height="50px" alt="" src="<%=path %>/${enterprise.logoUrl }">
				      </td>
				  </tr>
				   <tr>
				      <td class="left flabel">公司网站：</td>
				      <td class="right fvalue">${enterprise.website }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">联系人：</td>
				      <td class="right fvalue">${enterprise.linkman }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">联系电话：</td>
				      <td class="right fvalue">${enterprise.linkTel }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">企业简介：</td>
				      <td class="right fvalue" colspan="3">${enterprise.introduction }</td>
				  </tr>
	      	</table>  
      	</div>
    </div>
    <div id="bb" class="easyui-accordion" style="height:300px;">
		<div title="审核信息" data-options="fit:true,selected:true,collapsible:false" style="overflow:auto;">     
	         <table class="table2">
			      <tr>
				      <td class="left flabel">区数：</td>
				      <td class="right fvalue">${area.areaNo }</td>
				      <td class="left flabel">展位号：</td>
				      <td class="right fvalue">${area.positionNo }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">描述：</td>
				      <td class="right fvalue" colspan="3">${area.description }</td>
				  </tr>
				   <tr>
				      <td class="left flabel">招聘职位：</td>
				      <td class="right fvalue" colspan="3">${jobname }</td>
				  </tr>
				  <tr>
				      <td class="left flabel">申请审核状态：</td>
				      <td class="right fvalue" colspan="3">
				      	<input type="radio" name="status" <c:if test="${area.status == 1 }">checked</c:if> class="easyui-validatebox" value="1"/>审核通过
				      	<input type="radio" name="status" <c:if test="${area.status == 2 }">checked</c:if> class="easyui-validatebox" value="2"/>审核不通过
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">审核说明：</td>
			      	 <td class="right" colspan="3"><input class="easyui-textbox" 
			      	 data-options="required:false,validType:['length[0,200]'],multiline:true" value="${area.reason }"
			      	 name="reason" style="height:60px;width:600px;"></input></td>
				  </tr>
		  	 </table>
		</div>
	</div>
    </form> 
    <script type="text/javascript">
	$(function(){
	});
	</script>
</body>
</html>
