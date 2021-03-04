<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>专业技术职务任职新增</title>
<body>
	<script type="text/javascript">
		//保存
		function saveFun() {debugger 
			var qualificationName=$("#qualificationName").textbox('getValue');
			if(qualificationName.length>30){
			alert("资格名称不能超过30字，请重新输入！");
			return;
			}
			
			var zNo=$("#zNo").textbox('getValue');
			if(!Zno_Validation(zNo)){
			alert("证书编号只能由数字和字母组成，且长度不超过30位！");
			return;
			}
			
			var pzNo=$("#pzNo").textbox('getValue');
			if(!Pzmo_Validation(pzNo)){
			alert("批准文号只能由数字，字母以及()组成，且长度不超过30位！");
			return;
			}
			
			var sPart=$("#sPart").textbox('getValue');
			if(sPart.length>30){
			alert("审批部门不能超过30字，请重新输入！");
			return;
			}
			
			var pro=$("#pro").textbox('getValue');
			if(pro.length>30){
			alert("专业名称不能超过30字，请重新输入！");
			return;
			}
			
			var r = $("#zyform").form('enableValidation').form('validate');
			if (!r) {
				return false;
			}
			var uid=$("#uid").val();
             $.ajax({
                url: basePath+"zyjs/isExistByUid?uid="+uid+"&activityId="+$('#activityId2').val(),
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                   //新增的用户已存在
                   $.messager.confirm('确认','新增的用户数据已存在，是否覆盖保存？',function(r){    
                   if (r){    
                        saveFun2('true');
                        return;
                   }    
                  });  
               
				 }else{
				 saveFun2('');
				 
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
            
            
		}
		
		function saveFun2(isEdit){
		var param = $("#zyform").serializeArray();
			param = JSON.stringify(param);
			$("#zyform").ajaxSubmit({
				url : basePath + "zyjs/addzy",
				async : true,
				data : {
					'param' : param,
					'isEdit':isEdit
				},
				success : function(data) {
					if (data.flag == true) {
						$('#zyjjInfo').dialog('close');
						successMsg();
						$('#zyjszwGrid').datagrid('reload');
					
					} else {
						$.messager.alert('错误', '操作失败！'+data.cause, 'error');
					}
				},
				error : function(data) {
					$.messager.alert('错误', '操作失败！', 'error');
				}
			});
		
		}
	</script>
	<form id="zyform" method="post">
          <input type="hidden" id="pnum" name="pnum"><!-- 身份证号 -->
          <input type="hidden" id="uid" name="uid"><!-- 用户id -->
          <input type="hidden" id="name" name="name"><!-- 姓名 -->
          <input type="hidden" id="businessId" name="businessId"><!-- 活动编码 -->
          <input type="hidden"  id="activityId2" name="activityId2"><!-- 活动id，修改使用 -->
          
		<div>
			<table class="table2">
			<tr>
					<td class="left">活动编号</td>
					<td class="right">
						<select class="easyui-combobox" id="activityId" name="activityId" style="width:135px;" data-options="required:true">

					</select></td>
					<td class="left">活动名称</td>
					<td class="right"><input id="activityName" name="activityName" class="easyui-textbox" size="20" data-options="disabled:true" style="height:22px">
					</td>
				</tr>
				
				<tr>
					<td class="left">身份证号</td>
					<td class="right">
						<select class="easyui-combobox" id="sfz" name="sfz" style="width:135px;" data-options="required:true,validType:'idcard'">
					</select>
					
					</td>
					<td class="left">姓名</td>
					<td class="right"><input id="name2" name="name2" class="easyui-textbox" size="20" data-options="disabled:true" style="height:22px">
					</td>
				</tr>
				
				<tr>
					<td class="left">级别</td>
					<td class="right">
						<select id="level" class="easyui-combobox" name="level" style="width:135px;" data-options="required:true,editable:false">
							<option value="技术师">技术师</option>
							<option value="助理工程师">助理工程师</option>
							<option value="工程师">工程师</option>
							<option value="高级工程师">高级工程师</option>
							<option value="教授级工程师">教授级工程师</option>
					</select></td>
					<td class="left">资格名称</td>
					<td class="right"><input id="qualificationName"
						name="qualificationName" class="easyui-textbox" size="20"
						data-options="required:true" style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">证书编号</td>
					<td class="right"><input id="zNo" name="zNo"
						class="easyui-textbox" size="20" data-options="required:true"
						style="height:22px">
					</td>
					<td class="left">批准文号</td>
					<td class="right"><input id="pzNo" name="pzNo"
						class="easyui-textbox" size="20" data-options="required:true"
						style="height:22px">
					</td>
				</tr>
				<tr>
					<td class="left">审批部门</td>
					<td class="right"><input id="sPart" name="sPart"
						class="easyui-textbox" size="20" data-options="required:true"
						style="height:22px">
					</td>
					<td class="left">审批时间</td>
					<td class="right"><input class="easyui-datetimebox" id="sDate"
						name="sDate"
						data-options="required:true,showSeconds:true,editable:false"
						style="height:22px"></td>
				</tr>
				<tr>
					<td class="left">专业</td>
					<td class="right"><input id="pro" name="pro"
						class="easyui-textbox" size="20" data-options="required:true"
						style="height:22px">
					</td>
					<td class="left">是否领取</td>
					<td class="right">
					<!-- <input type="radio" name="isGet" value="未领取 ">未领取 <input type="radio" name="isGet" value="已领取">已领取 -->
					<select id="isGet" class="easyui-combobox" name="isGet" style="width:135px;" data-options="required:true,editable:false">
							<option value="是">是</option>
							<option value="否">否</option>
					</select>
					</td>
					<td class="left"></td>
					<td class="right"></td>
				</tr>
				

			</table>


		</div>

	</form>

</body>

</html>
