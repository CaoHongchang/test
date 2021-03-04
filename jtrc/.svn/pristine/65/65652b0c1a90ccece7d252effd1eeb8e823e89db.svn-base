<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>党费查看</title>
</head>

<body>
	<form id="fm" method="post">
		<div>
			<table class="table2">
				<tr>
					<td class="left">
						姓名
					</td>
					<td class="right">
						<input id="name" name="name" class="easyui-textbox" size="20" disabled="disabled"
							data-options="required:true" style="height: 22px">
					</td>
					<td class="left">
						身份证号
					</td>
					<td class="right">
						<input id="sfzh" name="pnum" class="easyui-textbox" size="20" disabled="disabled"
							data-options="required:true" style="height: 22px" >
					</td>
				</tr>
				<tr>
					<td class="left">
						历史党费缴至
					</td>
					<td class="right">
						<input id="sfzh" name="his_date" class="easyui-textbox" size="20" disabled="disabled"
							data-options="required:true" style="height: 22px" >
					</td>
					<td class="left">
						党费缴至
					</td>
					<td class="right">
						<input id="dfjz_time" name="dfjz_time" class="easyui-textbox" size="20" disabled="disabled"
							data-options="required:true" style="height: 22px" >
					</td>
				</tr>
				<tr>
					<td class="left">
						入党时间
					</td>
					<td class="right">
						<input id="sfzh" name="party_date" class="easyui-textbox" size="20" disabled="disabled"
							data-options="required:true" style="height: 22px" >
					</td>
					<td class="left">
						历史已缴金额
					</td>
					<td class="right">
						<input id="sfzh" name="m_his" class="easyui-numberbox" size="20" disabled="disabled"
							data-options="required:true,precision:2" style="height: 22px">
					</td>
				</tr>
				<tr>
					<td class="left">
						应缴总额
					</td>
					<td class="right">
						<input id="sfzh" name="m_his" class="easyui-numberbox" size="20" disabled="disabled"
							data-options="required:true,precision:2" style="height: 22px" >
					</td>
					<td class="left">
						已缴金额
					</td>
					<td class="right">
					    <input id="sfzh" name="m" class="easyui-numberbox" size="20"
							data-options="required:true,disabled:true,precision:2" style="height: 22px" >
					</td>
				</tr>
				<tr>
					<td class="left">
						需缴金额
					</td>
					<td class="right">
						<input id="sfzh" name="need_m" class="easyui-numberbox" size="20" disabled="disabled"
							data-options="required:true,precision:2" style="height: 22px" >
					</td>
				</tr>
			</table>
		</div>
		<div id="aa" class="easyui-accordion" style="height:200px;">   
            <div title="缴费基准	" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
                 <table id="jfjzGrid"></table>
            </div>
        </div>
        <div id="aa" class="easyui-accordion" style="height:200px;">   
            <div title="缴费记录	" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
                 <table id="jfjlGrid"></table>
            </div>
        </div>
	</form> 

</body>

</html>

