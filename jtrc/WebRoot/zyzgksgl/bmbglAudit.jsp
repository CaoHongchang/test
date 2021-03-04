<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>
<html>
<head>
<title>报名详情</title>
<body>
	<form id="addFm" method="post">
		<input type="hidden" id="id" name="id">
		<div class="easyui-accordion" style="height:85px;">
			<div title="项目信息"
				data-options="iconCls:'',fit:true,selected:true,collapsible:false"
				style="overflow:auto;padding:10px;">
				<table class="table2">
					<tr>
						<td class="left">项目编号</td>
						<td class="right"><input id="project_num" name="project_num"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">项目名称</td>
						<td class="right"><input id="project_name" name="project_name"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">培训类型</td>
						<td class="right"><input id="exam_type" name="exam_type"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="easyui-accordion" style="height:300px;">
			<div title="报名信息"
				data-options="iconCls:'',fit:true,selected:true,collapsible:false"
				style="overflow:auto;padding:10px;">
				<table class="table2">
					<tr>
						<td class="left">身份证号</td>
						<td class="right"><input id="pnum" name="pnum"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">姓名</td>
						<td class="right"><input id="name" name="name"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">性别</td>
						<td class="right"><input id="sex" name="sex"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">出生年月</td>
						<td class="right"><input id="birth_date" name="birth_date"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">地市</td>
						<td class="right"><input id="city" name="city"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">企业名称</td>
						<td class="right"><input id="work_name" name="work_name"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">企业等级</td>
						<td class="right"><input id="company_level" name="company_level"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">单位类型</td>
						<td class="right"><input id="company_type" name="company_type"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">工作年限</td>
						<td class="right"><input id="work_years" name="work_years"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">证书编号</td>
						<td class="right"><input id="certificate_num" name="certificate_num"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">发放时间</td>
						<td class="right"><input id="certificate_time" name="certificate_time"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">到期时间</td>
						<td class="right"><input id="expiry_date" name="expiry_date"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">毕业院校</td>
						<td class="right"><input id="school" name="school"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">专业类型</td>
						<td class="right"><input id="major" name="major"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
						<td class="left">学历</td>
						<td class="right"><input id="degree" name="degree"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">手机</td>
						<td class="right" colspan="5"><input id="tel" name="tel"
							size="25" class="easyui-textbox" readonly="readonly"
							style="height:22px"></td>
					</tr>
					<tr>
						<td class="left">备注</td>
						<td class="right" colspan="5">
							<input class="easyui-textbox" name="remark" readonly="readonly" id="remark" size="40" data-options="multiline:true"  style="height:52px">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="easyui-accordion" style="height:150px;">
			<div title="审核信息"
				data-options="iconCls:'',fit:true,selected:true,collapsible:false"
				style="overflow:auto;padding:10px;">
				<table class="table2">
					<tr>
						<td class="left">审核状态</td>
						<td class="right">
							<select id="audit_status" name="audit_status"
								class="easyui-combobox" size="20"
								data-options="required:true">
									<option value="审核通过">审核通过</option>
									<option value="审核未通过">审核未通过</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="left">审核意见</td>
						<td class="right">
							<input class="easyui-textbox" name="audit_opinion" id="audit_opinion" size="40" data-options="multiline:true"  style="height:52px">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>

</html>
