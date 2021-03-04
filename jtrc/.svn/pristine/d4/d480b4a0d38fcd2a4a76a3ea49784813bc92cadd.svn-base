<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>设定年缴费基准</title>
</head>

<body>
	<form id="fm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">
						年份
					</td>
					<td class="right">
						<select id="year" name="year" class="easyui-combobox" style="width:150px;height: 22px">
							
						</select>
					</td>
				</tr>
				<tr>
					<td class="left">
						缴费基准
					</td>
					<td class="right">
						<input id="name" name="name" class="easyui-numberbox" size="23"
							data-options="required:true,precision:2,groupSeparator:' ',min:0" style="height: 22px">
					</td>
				</tr>
			</table>
		</div> 
	</form> 
	<script type="text/javascript">
	   $(function(){
		   var years=[];
		   var index=new Date().getFullYear();
		   for(var i=index;i<=2099;i++){
			   var year={};
			   if(i==index){
				   year.selected=true;
			   }
			   year.id=i;
			   year.text=""+i;
			   years.push(year);
		   }
		   $('#year').combobox({
			  valueField:'id',
			  textField:'text',
			  data:years,
			  editable:false
		   });
	   });
	</script>
</body>
</html>

