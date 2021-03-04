<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>报名表查看</title>
<script type="text/javascript"><%--
 
var pnum = "<%=request.getParameter("pnum").toString()%>";
$.messager.alert('系统提示', pnum);
 $.ajax({
	url:'<%=request.getContextPath()%>/userBgTrol/queryUserBgInfoByParam',
    dataType: "html",   //返回格式为json
    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
    data: {"pnum": pnum},    //参数值
    type: "POST",   //请求方式
    success: function(data) {
    	 var resObj = eval("("+data+")");
    	 if(resObj.flag == '0'){
    		 $.messager.alert('系统提示', resObj.bmbInfo.name);
        	 $("#name").val(resObj.bmbInfo.name);
        }else{
        	 $.messager.alert('系统提示','查询失败：'+resObj.errorMsg);
	    }
    },
    error: function() {
        //请求出错处理
    }
});
 --%></script>
<body>

	<form id="detailBmbFm" method="post">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">姓名</td>
	      <td class="right"><input id="name" name="name" class="easyui-textbox" size="20" readonly="readonly" data-options="" style="height:22px"></td>
     	  <td class="left">身份证号</td>
	      <td class="right"><input id="pnum" name="pnum" class="easyui-textbox" size="20" readonly="readonly" data-options="" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">性别</td>
	      <td class="right"><input id="sex" name="sex"  class="easyui-textbox"  size="20" readonly="readonly" data-options="" style="height:22px"></td>
		  <td class="left">民族</td>
	      <td class="right"><input id ="mz" name="mz" class="easyui-textbox"  size="20" readonly="readonly" data-options="" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">党派</td>
	      <td class="right"><input id ="partyName" name="partyName" class="easyui-textbox" readonly="readonly" size="20" data-options="" style="height:22px"></td>
		  <td class="left">工作单位</td>
	      <td class="right"><input id ="workName" name="workName"  class="easyui-textbox" readonly="readonly" size="20" data-options="" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">部门</td>
	      <td class="right"><input id ="bgDepartmentId" name="bgDepartmentId" readonly="readonly" class="easyui-textbox"  size="20" data-options="" style="height:22px"></td>
		  <td class="left">职务</td>
	      <td class="right"><input id ="placeName" name="placeName"  class="easyui-textbox" readonly="readonly" size="20" data-options="" style="height:22px"></td>
      </tr>
       <tr>
	      <td class="left">专业技术职务</td>
	      <td class="right"><input id ="technical" name="technical"  class="easyui-textbox" readonly="readonly" size="20" data-options="" style="height:22px"></td>
		  <td class="left"></td>
	      <td class="right"></td>
      </tr>
      <tr>
	      <td class="left">出生年月</td>
	      <td class="right">
	      	<input class="easyui-textbox"  size="20" id ="brith" name="brith" readonly="readonly" data-options=""  style="height:22px">
	      	</td>
	      <td class="left">所属地区</td>
	      <td class="right">
	          <input class="easyui-textbox" size="20" id ="domicilePlace" name="domicilePlace" readonly="readonly" data-options=""  style="height:22px">
		  </td>
      </tr>
      <tr>
	      <td class="left">文化程度</td>
	      <td class="right">
	      	<input class="easyui-textbox" id ="degree" name="degree" size="20" readonly="readonly" data-options=""  style="height:22px">
	      </td>
	      <td class="left">电话</td>
	      <td class="right"><input class="easyui-textbox" id ="tel" name="tel" size="20" data-options="" readonly="readonly" style="height:22px"></td>
      </tr>
      <tr>
	      <td class="left">备注</td>
	      <td class="right" colspan="3">
	         <input id="aa" class="easyui-accordion" id="remark" name="remark" readonly="readonly" style="height:150px;width:450px;" />
	      </td>
      </tr>
      </table>  
    </div>
    <div>
    </div>
    
  </form> 

</body>

</html>
