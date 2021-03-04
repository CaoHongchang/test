<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>户口借出信息新增</title>

<body>
<script>
function dpnochange_hkgh(newValue,oldValue){
	var dpno=newValue.trim();
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath()%>/hkxx/getuserBydpno',
		data: {dpno:dpno},
		success:function(data){
			if(data!=null&&data!=''){
				$("#name_hkgh").textbox('setValue',data.name);
				$("#pnum_hkgh").textbox('setValue',data.pnum);
				$("#sex_hkgh").textbox('setValue',data.sex);
			}
		}
	});
}
</script>
<form id="hkghghFm" method="post">
<input type="hidden" name="residenceId" id="residenceId" />
<input type="hidden" name="id" id="id" />
<input type="hidden" name="hid" id="hid" />
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
              
         <tr>
		<td class="left">档案号</td>
		<td class="right">
      	 <input class="easyui-textbox" disabled='disabled'  id="res_dpno_hkgh"  data-options="onChange:dpnochange_hkgh" size="20"  style="height:22px">
	  	</td>
	  	<td class="left">姓名</td>
		<td class="right">
      	 <input class="easyui-textbox" id="name_hkgh" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
	  
	  <tr>
		<td class="left">身份证号</td>
		<td class="right">
      	 <input class="easyui-textbox" id="pnum_hkgh" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  	<td class="left">性别</td>
		<td class="right">
      	 <input class="easyui-textbox" id="sex_hkgh" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
	  
	  
      <tr>
      <td class="left">借出日期</td>
      <td class="right">
      <input class="easyui-datebox" disabled='disabled' id="out_date" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
	  </td>
      <td class="left">借出用途</td>
      <td class="right">
       <input class="easyui-textbox"  disabled='disabled' id="out_use" size="20" data-options="required:false" style="height:22px">
      </td>
     
      </tr>
      <tr>
      <td class="left">借出人</td>
      <td class="right">
       <input class="easyui-textbox"  disabled='disabled' id="out_name" size="20" data-options="required:false" style="height:22px">
	   </td>

       <td class="left">归还日期</td>
      <td class="right">
      <input class="easyui-datebox" name="back_date" id="back_date" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
      </td>
      
      </tr>
      <tr>
        <td class="left">签收人</td>
      <td class="right">
      <input class="easyui-textbox"  name="sign_name" id="sign_name" size="20" data-options="required:false" style="height:22px">
      </td>
      </tr>
      </table>  
      </div>   
       </div>
       
       </form> 

</body>

</html>
