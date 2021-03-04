<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>发点币配置</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/web.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/data/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/data/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ps/fdbpz.js"></script>
    <script>
    $(function() {

	init();
       
	});
	function init(){
	
		var url = "../user/dbinfo";
	
	$.post(url,null,function(data){
		
		$('#ext1').val(data.ext71);
		$('#ext2').val(data.ext31);
		$('#ext3').val(data.ext7);
		$('#ext4').val(data.ext3);
		$('#ext5').val(data.ext5);
		$('#ext6').val(data.ext6);
		$('#ext72').val(data.ext72);
		$('#ext8').val(data.ext8);
		$('#ext9').val(data.ext9);
		$('#ext10').val(data.ext10);
		$('#ext11').val(data.ext11);
		$('#ext12').val(data.ext12);
		$('#ext13').val(data.ext13);
		$('#ext14').val(data.ext14);
	},"json");
	}
function saveOrUpdateProductNode(){
 	if (isNaN($("#ext1").val())) {  
		    	alert("请正确输入数字！");
				$('#ext1').focus();
				return;
		    }  
		    	if (isNaN($("#ext2").val())) {  
		    	alert("请正确输入数字！");
				$('#ext2').focus();
				return;
		    }  
		    	if (isNaN($("#ext3").val())) {  
		    	alert("请正确输入数字！");
				$('#ext3').focus();
				return;
		    }  
		    	if (isNaN($("#ext4").val())) {  
		    	alert("请正确输入数字！");
				$('#ext4').focus();
				return;
		    }  
		    if (isNaN($("#ext5").val())) {  
		    	alert("请正确输入数字！");
				$('#ext5').focus();
				return;
		    }  
		      if (isNaN($("#ext6").val())) {  
		    	alert("请正确输入数字！");
				$('#ext6').focus();
				return;
		    }  
		      if (isNaN($("#ext72").val())) {  
		    	alert("请正确输入数字！");
				$('#ext72').focus();
				return;
		    }  
		      if (isNaN($("#ext8").val())) {  
		    	alert("请正确输入数字！");
				$('#ext8').focus();
				return;
		    }  
		      if (isNaN($("#ext9").val())) {  
		    	alert("请正确输入数字！");
				$('#ext9').focus();
				return;
		    }  
		      if (isNaN($("#ext10").val())) {  
		    	alert("请正确输入数字！");
				$('#ext10').focus();
				return;
		    }  
		      if (isNaN($("#ext11").val())) {  
		    	alert("请正确输入数字！");
				$('#ext11').focus();
				return;
		    }  
		      if (isNaN($("#ext12").val())) {  
		    	alert("请正确输入数字！");
				$('#ext12').focus();
				return;
		    }  
		      if (isNaN($("#ext13").val())) {  
		    	alert("请正确输入数字！");
				$('#ext13').focus();
				return;
		    }  
		     if (isNaN($("#ext14").val())) {  
		    	alert("请正确输入数字！");
				$('#ext14').focus();
				return;
		    }  

	var url = "../user/savedbinfo?ext71="+$("#ext1").val()+"&ext31="+$("#ext2").val()+"&ext7="+$("#ext3").val()+"&ext3="+$("#ext4").val()+"&ext4="+$("#ext5").val()+"&ext5="+$("#ext6").val()+"&ext6="+$("#ext72").val()+"&ext72="+$("#ext8").val()+"&ext8="+$("#ext9").val()+"&ext9="+$("#ext10").val()+"&ext10="+$("#ext11").val()+"&ext11="+$("#ext12").val()+"&ext12="+$("#ext13").val()+"&ext13="+$("#ext14").val();
	
	$.post(url,null,function(data){
		if(data.flag==1){
			alert("发布成功！");
			//$('#w2').window('close');
			init();
			//$('#w2').window('close');
		}else{
			alert("发布失败！");
		}
	},"json");
}
    
    </script>
</head>
<body class="easyui-layout">
<input type="hidden" id="nId"/>
   <div region="center" border="false" split="false" style="overflow:hidden;">
			
					<table cellpadding=5>
			            <!-- 
			              <tr>
				            <td nowrap>
				            	 <div align="right">种子币总量：</div>
				            </td>
				            <td>
				           <input id="ext1" name="ext1" type="text" class="text" style="width:150px;" maxlength="25" />
				            </td>
				         </tr> -->
				       
				        <tr>
				            <td nowrap>
				            	 <div align="right"> 请输入商家发放的每份点币数额：</div>
				            </td>
				            <td>
				           <input id="ext1" name="ext1" type="text" class="text" style="width:150px;" maxlength="25" />点币
				            </td>
				         </tr>
			             <tr>
				         <td nowrap>
				            	 <div align="right">请输入用户领取的每份点币数额：</div>
				            </td>
				            <td>
				            	<input id="ext2" name="ext2"  style="width:150px;" maxlength="11"/>点币
				            </td>
				            
			            </tr>
			              <tr>
				         <td nowrap>
				            	 <div align="right">请输入商家发放的每份红包的点币数额：</div>
				            </td>
				            <td>
				            	<input id="ext3" name="ext3"  style="width:150px;" maxlength="11"/>点币
				            </td>
				            
			            </tr>
			              <tr>
				         <td nowrap>
				            	 <div align="right">请输入用户领取的每份红包的点币数额：</div>
				            </td>
				            <td>
				            	<input id="ext4" name="ext4"  style="width:150px;" maxlength="11"/>点币
				            </td>
				            
			            </tr>
			            <tr>
			              <td nowrap>
				            	 <div align="right">请输入点币必须占总价值的百分：</div>
				            </td>
				            <td>
				            	<input id="ext5" name="ext5"  style="width:150px;" maxlength="11"/>%
				            </td>
				            </tr>
				            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入商品上架的点币：</div>
				            </td>
				            <td>
				            	<input id="ext6" name="ext6"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入好友邀请的奖励点币：</div>
				            </td>
				            <td>
				            	<input id="ext72" name="ext72"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到1天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext8" name="ext8"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到2天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext9" name="ext9"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到3天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext10" name="ext10"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到4天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext11" name="ext11"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到5天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext12" name="ext12"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到6天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext13" name="ext13"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			            <tr>
				            <td nowrap>
				            	 <div align="right">   请输入签到7天奖励：</div>
				            </td>
				            <td>
				            	<input id="ext14" name="ext14"  style="width:150px;" maxlength="11"/>
				            </td>
			            </tr>
			              <td nowrap>
			              <b>说明：此处如果修改了参数配置，则第二日零时生效。</b>
			              </td>
			              
			           
			            </table>
			            <div region="south" border="false" style="text-align:left;line-height:30px;">
			            <a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:init()" >取消</a>
				<a id="add" class="easyui-linkbutton" iconCls="icon-ok" href="javascript:saveOrUpdateProductNode()" >设置</a>
		
			</div>
	</div>

</body>
</html>