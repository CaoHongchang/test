<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>客户信息查看</title>
<script type="text/javascript">
$("#sessionUserName").val(sessionUserName);
$("#c_name").val(sessionUserId);
</script>
<body>

		<form id="hkLookFm" method="post">

    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
      <td class="left">户口编号</td>
      <td class="right">
       <input class="easyui-textbox" name="residenceNo" readonly="readonly" size="20" data-options="required:true" style="height:22px">
	  </td>
      <td class="left">户主或与户主关系</td>
      <td class="right">
       <input class="easyui-textbox" name="relName" readonly="readonly" size="20" data-options="required:true" style="height:22px">
      </td>
       <td class="left"></td>
      <td class="right">
      </td>
      </tr>
      <tr>
      <td class="left">本县市其它住址</td>
      <td class="right">
       <input class="easyui-textbox" name="otherAdr" readonly="readonly" size="20" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">血型</td>
      <td class="right">
        <input type="radio" name="blood">A <input type="radio" name="blood">B <input type="radio" name="blood">AB<input type="radio" name="blood"  value="O">O
      </td>
        <td class="left">身高（厘米）</td>
      <td class="right">
      <input class="easyui-numberbox"  name="stature" size="20" readonly="readonly" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">宗教信仰</td>
      <td class="right">
      <input class="easyui-textbox" name="xyName"  size="20" readonly="readonly" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">兵役情况</td>
      <td class="right">
      <input class="easyui-textbox" name="byState" size="20" readonly="readonly" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
        <td class="left">服务处所</td>
      <td class="right">
      <input class="easyui-textbox" name="serviceDdr" readonly="readonly" size="20" data-options="required:true" style="height:22px">
	   </td>
      </tr>
      
      
      <tr>
      <td class="left">职业</td>
      <td class="right">
      <input class="easyui-textbox" name="proName"  size="20" readonly="readonly" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">户口性质</td>
      <td class="right">
      <input class="easyui-textbox" name="hPro"  size="20" readonly="readonly" data-options="required:true" style="height:22px">
      </td>
        <td class="left">户口所属派出所</td>
      <td class="right">
      <input class="easyui-textbox" name="police"  size="20" readonly="readonly" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
       
      <tr>
      <td class="left">落户时间</td>
      <td class="right">
      <input class="easyui-datebox" name="rDate" size="20" readonly="readonly" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
       <td class="left">迁来（落户）地址</td>
      <td class="right">
            <input class="easyui-textbox"  name="rAdr" readonly="readonly" size="20" data-options="required:true" style="height:22px">
      
      </td>
        <td class="left">迁来本县市地区与地址</td>
      <td class="right">
            <input class="easyui-textbox" name="orgAdr" readonly="readonly" size="20" data-options="required:true" style="height:22px">
      
      </td>
      </tr>
      
       <tr>
      <td class="left">迁出时间</td>
      <td class="right">
      <input class="easyui-datebox" name="qDate" readonly="readonly" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
	   </td>
       <td class="left">迁出地址</td>
      <td class="right">
            <input class="easyui-textbox" readonly="readonly" name="qAdr"  size="20" data-options="required:true" style="height:22px">
      
      </td>
        <td class="left"></td>
      <td class="right">
      
      </td>
      </tr>
      
       <tr>
      <td class="left">承办人</td>
      <td class="right">
            <input class="easyui-textbox" name="sessionUserName" id="sessionUserName" readonly="readonly" size="20" data-options="required:true" style="height:22px">
	        <input type="hidden" name="cName" id="c_name"  size="20" data-options="required:true" style="height:22px">
	   </td>
       <td class="left">登记日期</td>
      <td class="right">
            <input class="easyui-datebox" name="addDate" value="<%= new Date() %>" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      
      </td>
        <td class="left"></td>
      <td class="right">
      
      </td>
      </tr>
      
      
      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
