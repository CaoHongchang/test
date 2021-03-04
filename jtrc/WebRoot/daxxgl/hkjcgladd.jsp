<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>户口借出信息新增</title>

<body>
<script>
function dpnochange_hkjc(newValue,oldValue){
	var dpno=newValue.trim();
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath()%>/hkxx/getuserBydpno',
		data: {dpno:dpno},
		success:function(data){
			if(data!=null&&data!=''){
				$("#name_hkjc").textbox('setValue',data.name);
				$("#pnum_hkjc").textbox('setValue',data.pnum);
				$("#sex_hkjc").textbox('setValue',data.sex);
			}
		}
	});
}
</script>
<form id="hkjcAddFm" method="post">
<input type="hidden" name="rec_id_hkjc" id="rec_id_hkjc" />
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      
         <tr>
		<td class="left">档案号</td>
		<td class="right">
      	 <input class="easyui-textbox" disabled='disabled'  id="res_dpno_hkjc"  data-options="onChange:dpnochange_hkjc" size="20"  style="height:22px">
	  	</td>
	  	<td class="left">姓名</td>
		<td class="right">
      	 <input class="easyui-textbox" id="name_hkjc" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
	  
	  <tr>
		<td class="left">身份证号</td>
		<td class="right">
      	 <input class="easyui-textbox" id="pnum_hkjc" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  	<td class="left">性别</td>
		<td class="right">
      	 <input class="easyui-textbox" id="sex_hkjc" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
      
      <td class="left">借出日期</td>
      <td class="right">
      <input class="easyui-datebox" name="out_date" id="out_date" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
	  </td>
      <td class="left">借出用途</td>
      <td class="right">
       <input class="easyui-textbox" name="out_use"  id="out_use" size="20" data-options="required:false" style="height:22px">
      </td>
     
      </tr>
      <tr>
      <td class="left">借出人</td>
      <td class="right">
       <input class="easyui-textbox" name="out_name"  id="out_name" size="20" data-options="required:false" style="height:22px">
	   </td>
      </table>  
      </div>   
       </div>
       
       </form> 

</body>

</html>
