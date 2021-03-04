<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>户口信息新增</title>
<script type="text/javascript">
$("#sessionRealName").val(sessionRealName);
$("#c_name").val(sessionUserId);

function dpnochange(newValue,oldValue){
	var dpno=newValue.trim();
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath()%>/hkxx/getuserBydpno',
		data: {dpno:dpno},
		success:function(data){
			if(data!=null&&data!=''){
				$("input[name='uid']").val(data.id);
				$("#name").textbox('setValue',data.name);
				$("#pnum").textbox('setValue',data.pnum);
				$("#sex").textbox('setValue',data.sex);
			}
		}
	});
}
</script>
<body>

<form id="hkAddFm" method="post">
<!--
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
-->
<input type="hidden" name="uid" id="uid" />
<input type="hidden" name="id" id="id" />
<table class="table2">
	  <tr>
		<td class="left">档案号</td>
		<td class="right">
      	 <input class="easyui-textbox" name="res_dpno" id="res_dpno"  data-options="onChange:dpnochange" size="20"  style="height:22px">
	  	</td>
	  	<td class="left">姓名</td>
		<td class="right">
      	 <input class="easyui-textbox" id="name" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
	  
	  <tr>
		<td class="left">身份证号</td>
		<td class="right">
      	 <input class="easyui-textbox" id="pnum" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  	<td class="left">性别</td>
		<td class="right">
      	 <input class="easyui-textbox" id="sex" disabled='disabled' size="20"  style="height:22px">
	  	</td>
	  </tr>
	  
      <tr>
      <td class="left">户口编号</td>
      <td class="right">
       <input class="easyui-textbox" name="residenceNo" id="residenceNo" size="20"  style="height:22px">
	  </td>
      <td class="left">户主或与户主关系</td>
      <td class="right">
       <input class="easyui-textbox" name="relName" id="relName" size="20"  style="height:22px">
      </td>
      
      </tr>
      <tr>
      <td class="left">本县市其它住址</td>
      <td class="right">
       <input class="easyui-textbox" name="otherAdr" id="otherAdr" size="20"  style="height:22px">
	   </td>
       <td class="left">血型</td>
      <td class="right">
        <input type="radio"  name="blood" value="A">A <input type="radio" name="blood"  value="B">B <input type="radio" name="blood"  value="AB">AB<input type="radio" name="blood"  value="O">O
      </td>
      </tr>
      <tr>
        <td class="left">身高（厘米）</td>
      <td class="right">
      <input class="easyui-numberbox" id="stature" name="stature" size="20"  style="height:22px">
      </td>
       <td class="left">宗教信仰</td>
      <td class="right">
      <input class="easyui-textbox" name="xyName" id="xyName" size="20"  style="height:22px">
	   </td>
      </tr>
      <tr>
       <td class="left">兵役情况</td>
      <td class="right">
      <input class="easyui-textbox" name="byState" id="byState" size="20" data-options="showSeconds:false" value="" style="height:22px">
      </td>
        <td class="left">服务处所</td>
      <td class="right">
      <input class="easyui-textbox" name="serviceAdr"  id="serviceAdr" size="20"  style="height:22px">
	   </td>
      </tr>
      <tr>
      <td class="left">职业</td>
      <td class="right">
      <input class="easyui-textbox" name="proName" id="proName" size="20"  style="height:22px">
	   </td>
       <td class="left">户口性质</td>
      <td class="right">
      <input class="easyui-textbox" name="hPro" id="hPro" size="20"  style="height:22px">
      </td>
      </tr>
      <tr>
       <td class="left">户口所属派出所</td>
      <td class="right">
      <input class="easyui-textbox" name="police" id="police" size="20"  style="height:22px">
      </td>
       <td class="left">落户时间</td>
      <td class="right">
      <input class="easyui-datebox" name="r_date" id="r_date" size="20" data-options="showSeconds:false" value="" style="height:22px">
	   </td>
      </tr>
      <tr>
       <td class="left">迁来（落户）地址</td>
      <td class="right">
            <input class="easyui-textbox"  name="rAdr" id="rAdr" size="20"  style="height:22px">
      </td>
        <td class="left">迁来本县市地区与地址</td>
      <td class="right">
            <input class="easyui-textbox" name="orgAdr" id="orgAdr"  size="20"  style="height:22px">
      
      </td>
      </tr>
       <tr>
      <td class="left">迁出时间</td>
      <td class="right">
       <input class="easyui-datebox" name="q_date" id="q_date" size="20" data-options="showSeconds:false"  style="height:22px">
	   </td>
       <td class="left">迁出地址</td>
      <td class="right">
            <input class="easyui-textbox" name="qAdr" id="qAdr" size="20"  style="height:22px">
      
      </td>
      </tr>
       <tr>
      <td class="left">承办人</td>
      <td class="right">
            <input class="easyui-textbox" name="sessionRealName" id="sessionRealName" readonly="readonly" size="20" data-options="required:true" style="height:22px">
	        <input type="hidden" name="cName" id="c_name"  size="20" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">登记日期</td>
      <td class="right">
            <input class="easyui-datebox" name="addDate" ids="addDate" value="<%= new Date() %>" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      
      </td>
      </tr>
      </table>  
<!--      
      </div>   
       </div>
-->
    </form> 

</body>

</html>
