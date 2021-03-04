<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>开设班级</title>
<script type="text/javascript">

//加载班级编码 
$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/examClassInfo/queryNo',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    type: "POST",   //请求方式
	    success: function(data) {
            if(data.flag == true){
            	 $("#classNum").val('');
            	 $("#classNum").val(data.seqNo);
	        }else{
	        	 $.messager.alert('系统提示','获取班级编码失败：'+data.cause);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
	var content='';
	$.ajax({
		url:'<%=request.getContextPath()%>/examProjectInfo/getAll',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    type: "POST",   //请求方式
	    success: function(data) {
	    	$.each(data, function(index, val) {
	    		content+='<option value="'+val.id+'">'+val.projectName+'</option>'
	    	});
	    	$("#projectId").append(content);
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
});
</script>
<body>

	<form id="addFm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">班级编号</td>
					<td class="right"><input id="classNum" name="classNum" size="25"
						class="easyui-textbox" readonly="readonly" 
						style="height:22px">
					</td>
					<td class="left"></td>
					<td class="right"></td>
				</tr>
				<tr>
					<td class="left">项目名称</td>
					<td class="right"><select id="projectId" name="projectId"
						class="easyui-combobox" style="height:22px;width:173px"
						data-options="required:true">
					</select>
					</td>
				</tr>
				<tr>
					<td class="left">班级名称</td>
					<td class="right"><input id="className" name="className"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">班级人数上限</td>
					<td class="right"><input id="classSum" name="classSum"
						class="easyui-textbox" size="25" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">班级开设时间</td>
					<td class="right"><input class="easyui-datebox" id="openTime"
						name="openTime" size="25" data-options="required:true" 
						style="height:22px"></td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>
