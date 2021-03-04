<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<%@ taglib prefix="qzzp" uri="http://www.qzzp.org" %>
<html>
<head>
	 <link rel="stylesheet" href="<%=basePath%>css/ExtCss.css" type="text/css" />
</head>
<script type="text/javascript">
  function change_photo(){
      PreviewImage($("input[name='file_upload']")[0], 'Img', 'Imgdiv');
      $("#Imgdiv").show();
  }
</script>
<body>
	<form id="fm" method="post" enctype="multipart/form-data">
	<div id="aa" class="easyui-accordion" style="height:300px;">
		<input type="hidden" name="id" value="${enterprise.id }"/>
		<input type="hidden" name="enterpriseid" value="${enterpriseInfo.id }"/>
		<div title="企业信息" data-options="fit:true,selected:true,collapsible:false" style="overflow:auto;">     
	         <table class="table2">
			      <tr>
			      	  <td class="left flabel">企业名称：</td>
   				  	  <td class="right fvalue" colspan="3">
   				  	  	<input type="text" class="easyui-textbox" 
   				  	  	data-options="required:true"
   				  	  	size="100" name="name" value="${enterprise.name }"/>
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">企业性质：</td>
				      <td class="right fvalue">
				       <qzzp:dict id="type" classStyle="easyui-combobox" style="width:198px;" dictCode="ENTERPRISE_TYPE" value="${enterprise.type }" readonly="false"/>
					  </td>
				      <td class="left flabel">企业规模：</td>
				      <td class="right fvalue">
				       <qzzp:dict id="scale" classStyle="easyui-combobox"  style="width:198px;" dictCode="ENTERPRISE_SCALE" value="${enterprise.scale }" readonly="false"/>
				      </td>
			      </tr>
			      <tr>
				      <td class="left flabel">企业所在地：</td>
				      <td class="right fvalue">
						<input name="province" id="province" value="福建" type="hidden"/>
						 <qzzp:dict id="city"  classStyle="easyui-combobox" style="width:198px;"  dictCode="DICT_CITY" value="${enterprise.city}" headerLabel="请选择所在城市"/>
						<%-- <select id="city" name="city" data-options="required:true" class="easyui-combobox" style="width:200px;">
							<option name="福州"  value="福州" <c:if test="${enterprise.city == '福州' }">selected</c:if>>福州</option>
							<option name="厦门" value="厦门" <c:if test="${enterprise.city == '厦门' }">selected</c:if>>厦门</option>
							<option name="泉州" value="泉州" <c:if test="${enterprise.city == '泉州' }">selected</c:if>>泉州</option>
							<option name="漳州" value="漳州" <c:if test="${enterprise.city == '漳州' }">selected</c:if>>漳州</option>
							<option name="莆田" value="莆田" <c:if test="${enterprise.city == '莆田' }">selected</c:if>>莆田</option>
							<option name="龙岩" value="龙岩" <c:if test="${enterprise.city == '龙岩' }">selected</c:if>>龙岩</option>
							<option name="三明" value="三明" <c:if test="${enterprise.city == '三明' }">selected</c:if>>三明</option>
							<option name="南平" value="南平" <c:if test="${enterprise.city == '南平' }">selected</c:if>>南平</option>
							<option name="宁德" value="宁德" <c:if test="${enterprise.city == '宁德' }">selected</c:if>>宁德</option>
							<option name="省外" value="省外" <c:if test="${enterprise.city == '省外' }">selected</c:if>>省外</option>
						</select> --%>
				      </td>
				      <td class="left flabel">详情地址：</td>
				      <td class="right fvalue">
				      	<input type="text"  style="width:200px;" data-options="required:true" class="easyui-textbox" name="address" value="${enterprise.address }"/>
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">注册资金(万)：</td>
				      <td class="right fvalue">
				      	<input type="text"  style="width:200px;" data-options="required:true"
				      	 class="easyui-textbox" name="registeredCapital" value="${enterprise.registeredCapital }"/>
				      </td>
				      <td class="left flabel">企业logo：</td>
				      <td class="right fvalue" rowspan="3">
				      	<input class="easyui-filebox"  style="width:200px;" style="width:150px" data-options='onChange:change_photo' 
				      	id="file_upload" name="file_upload"/><br/> 
				      	 <div id="Imgdiv" style="diplay:none;">
					        <img id="Img" width="100px" height="100px" src="<%=basePath%>${enterprise.logoUrl}"/>
					    </div>
				      </td>
				  </tr>
				   <tr>
				      <td class="left flabel">公司网站：</td>
				      <td class="right fvalue">
				      	<input type="text" style="width:200px;" data-options="required:false"  class="easyui-textbox" name="website" value="${enterprise.website }"/>
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">联系人：</td>
				      <td class="right fvalue">
				      	<input type="text"  style="width:200px;" data-options="required:true" class="easyui-textbox" name="linkman" value="${enterprise.linkman }"/>
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">联系电话：</td>
				      <td class="right fvalue">
				      	<input type="text" style="width:200px;" data-options="required:true" class="easyui-textbox" name="linkTel" value="${enterprise.linkTel }"/>
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">企业简介：</td>
				      <td class="right fvalue" colspan="3">
				      	<input type="text" style="width:400px;" data-options="required:false" class="easyui-textbox" name="introduction" value="${enterprise.introduction }"/>
				      </td>
				  </tr>
	      	</table>  
      	</div>
    </div>
    </form> 
    <div id="bb" class="easyui-accordion" style="height:300px;">
		<div title="审核信息" data-options="fit:true,selected:true,collapsible:false" style="overflow:auto;">     
	         <table class="table2">
				  <tr>
				      <td class="left flabel">申请审核状态：</td>
				      <td class="right fvalue" colspan="3">
				      	<input type="radio" name="status" class="easyui-validatebox"
				      	 <c:if test="${enterprise.status == 1 }">selected</c:if>
				      	 data-options="validType:['requireRadio[\'status\']'],readonly:true"  value="1"/>审核通过
				      	<input type="radio" name="status" class="easyui-validatebox" 
				      	<c:if test="${enterprise.status == 2 }">selected</c:if>
				      	data-options="validType:['requireRadio[\'status\']'],readonly:true"  value="2"/>审核不通过
				      </td>
				  </tr>
				  <tr>
				      <td class="left flabel">审核说明：</td>
			      	 <td class="right" colspan="3"><input class="easyui-textbox" 
			      	 data-options="required:false,validType:['length[0,200]'],multiline:true,readonly:true" value="${enterprise.reason }"
			      	 name="reason" style="height:60px;width:600px;"></input></td>
				  </tr>
		  	 </table>
		</div>
	</div>
    <script type="text/javascript">
	$(function(){
		$("#province").change(function(){
			var province=$("#province").val();
			if(province =="福建省"){
				$("#city").find("option[value='-----']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#city").find("option[id='in']").each(function(){
					this.removeAttribute("disabled");
				});
				$("#area").find("option[id='fuzhou']").each(function(){
					this.removeAttribute("disabled");
				});
				$("#area").find("option[id='xiamen']").each(function(){
					this.removeAttribute("disabled");
				});
				$("#area").find("option[id='quanzhou']").each(function(){
					this.removeAttribute("disabled");
				});
			}else{
				$("#city").find("option[value='-----']").each(function(){
					this.setAttribute("selected","selected");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("selected","selected");
				});
				$("#city").find("option[id='in']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='fuzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='xiamen']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='quanzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
			}
		});
		$("#city").change(function(){
			var city=$("#city").val();
			if(city=="福州市"){
				$("#area").find("option[id='xiamen']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='quanzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("disabled","disabled");
				});
	
				$("#area").find("option[id='fuzhou']").each(function(){
					this.removeAttribute("disabled");
				});
			}else if(city=="厦门市"){
				$("#area").find("option[id='fuzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='quanzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("disabled","disabled");
				});
	
				$("#area").find("option[id='xiamen']").each(function(){
					this.removeAttribute("disabled");
				});
			}else if(city=="泉州市"){
				$("#area").find("option[id='fuzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='xiamen']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("disabled","disabled");
				});
	
				$("#area").find("option[id='quanzhou']").each(function(){
					this.removeAttribute("disabled");
				});
			}else{
				$("#area").find("option[id='fuzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='xiamen']").each(function(){
					this.setAttribute("disabled","disabled");
				});
				$("#area").find("option[id='quanzhou']").each(function(){
					this.setAttribute("disabled","disabled");
				});
	
				$("#area").find("option[value='-----']").each(function(){
					this.removeAttribute("disabled");
				});
				$("#area").find("option[value='-----']").each(function(){
					this.setAttribute("selected","selected");
				});
			}
		});
	});
	</script>
</body>
</html>
