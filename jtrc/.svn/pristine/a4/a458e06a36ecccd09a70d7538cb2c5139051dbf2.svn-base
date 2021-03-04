<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>准考证备注事项编辑</title>

<body>
<script type="text/javascript">
var id = "<%=request.getParameter("id").toString()%>";
var activity_id = "<%=request.getParameter("activity_id").toString()%>";
	$(function(){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/bgActivityArgInfo/editZkz',
		    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: {"id" : id},    //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	$("#id").val(id);
	            $("#zkzContent").val(data.zkz_content);
	            $("#activityId").val(activity_id);
		    },
		    error: function() {
		        //请求出错处理
		    	
		    }
		});
	});
	
</script>
		<form id="fm" method="post">
	<input type="hidden" id="id" name="id"/>
	<input type="hidden" id="activityId" name="activityId"/>
	<!--  -->
    <div id="aa" class="easyui-accordion" style="height:350px;">   
       <div title="" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table class="table2">
      <tr>
       <textarea id="zkzContent" name="zkzContent" rows="20" style="width:100%;"></textarea>
      </tr>
      
      </table>  
      </div>   
   
       </div>

      

             
    </form> 

</body>

</html>
