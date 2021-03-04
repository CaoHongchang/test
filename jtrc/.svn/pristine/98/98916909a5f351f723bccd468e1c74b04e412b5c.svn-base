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
						姓名
					</td>
					<td class="right">
						<input id="name" name="name" class="easyui-textbox" data-options="editable:false" disabled="disable" size="30" />
					</td>
				</tr>
				<tr>
					<td class="left">
						身份证
					</td>
					<td class="right">
						<input id="pnum" name="pnum" class="easyui-textbox" data-options="required:true,validType:'idcard[]'" size="30" />
					</td>
				</tr>
				<tr>
					<td class="left">
						付款时间
					</td>
					<td class="right">
						<input id="payTime" name="payTime" class="easyui-datetimebox" data-options="required:false" disabled="disable" size="30" />
					</td>
				</tr>
					<tr>
					<td class="left">
						付款交易号
					</td>
					<td class="right">
						<input id="payCode" name="payCode" class="easyui-textbox" data-options="required:true,onChange:function(newValue,oldValue){
						   if(newValue!=''&&oldValue!=''){
						   $.post('../dfgl/checkIsOrderNoExist',{orderNo:newValue},function(result){
						       if(!result.flag){
						           $.messager.alert('系统提示','该付款交易号重复！','error');
						           $('#payCode').textbox('setValue','');
						       }
						   });}
						}" size="30" />
					</td>
				</tr>
				<tr>
					<td class="left">
						需缴金额
					</td>
					<td class="right">
						<input id="need_money" name="need_money"  class="easyui-textbox" 
							disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td class="left">
						金额
					</td>
					<td class="right">
						<input id="money" name="money" class="easyui-numberbox"
							data-options="required:true" />
					</td>
				</tr>
			</table>
		</div> 
	</form> 
	<script type="text/javascript">
	    $(function(){
	    	$("#pnum").textbox({
	    		onChange:function(newValue,oldValue){
	    			if(newValue!=''&&/^\d{15}(\d{2}[A-Za-z0-9])?$/.test(newValue)){
	    				$.post('../dfgl/queryIsInUserPartyInfo',{pnum:newValue,isIn:1},function(result){
	    					if(result.flag){
	    						$("#need_money").textbox('setValue',result.rows.need_m);
	    						$('#name').textbox('setValue',result.rows.name);	
	    						$('#money').numberbox({
	    						     onChange:function(newValue,oldValue){
	    						        if(newValue!=''){
	    						            if(result.rows.need_m!=null&&result.rows.need_m<newValue){
	    						               $.messager.alert('系统提示','输入的金额大于需缴纳的金额:'+result.rows.need_m,'info');
	    						               $('#money').numberbox('setValue','');
	    						            }
	    						        }
	    						     }
	    						});
								
	    					}else{
	    						$('#pnum').textbox('setValue','');
	    						$('#name').textbox('setValue','');
	    						$.messager.alert('系统提示','用户不存在或不属于中心党员','error');
	    					}
	    				},'json');
	    			}
	    		}
	    	});
	    });
		
		
	</script>
</body>
</html>

