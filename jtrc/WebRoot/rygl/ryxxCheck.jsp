<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>人员材料新增</title>
<body>
<script type="text/javascript" src="/jtrc/js/staticData.js"></script>
<script type="text/javascript" src="/jtrc/js/verification_regular.js"></script>
<script type="text/javascript">

$(function(){
 	fill_select("mz",mz_arr);
    
    fill_select("zzmm",zzmm_arr);
    
    fill_select("degree",whcd_arr);
        
});

var tip = "";
function IdentityCodeValid(code) { 
	var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};

	var pass= true;
    //var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	//if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
	if(!code || !/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/i.test(code)){
		tip = "身份证号格式错误";
		$("#da_pnum").focus();
		pass = false;
	}

	else if(!city[code.substr(0,2)]){
		tip = "地址编码错误";
		$("#pnda_pnumum").focus();
		pass = false;
	}
	else{
	  //18位身份证需要验证最后一位校验位
	  if(code.length == 18){
	  	code = code.split('');
	  //∑(ai×Wi)(mod 11)
	  //加权因子
	  var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
	  //校验位
	  var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
	  var sum = 0;
	  var ai = 0;
	  var wi = 0;
	  for (var i = 0; i < 17; i++)
	  {
	  	ai = code[i];
	  	wi = factor[i];
	  	sum += ai * wi;
	  }
	  var last = parity[sum % 11];
	  if(parity[sum % 11] != code[17]){
	  	tip = "校验位错误";
	  	$("#da_pnum").focus();
	  	pass =false;
	  }
	}
   }
}

function saveRyAdd(){debugger;
	var pnum=$("#pnum").textbox("getValue");
	var name=$("#name").textbox("getValue");
	var email=$("#email").textbox("getValue");
	var tel=$("#tel").textbox("getValue");
	var wx=$("#wx").textbox("getValue");
	var qq=$("#qq").textbox("getValue");
	
	if(name==''){
		$.messager.alert('系统提示','姓名不能为空！');
		return ;
	}
	if(pnum==''){
		$.messager.alert('系统提示','身份证不能为空！');
		return ;
	}
	
	if(IdentityCodeValid(pnum)){
		$.messager.alert('系统提示',"身份证格式错误");
		return ;
	}
	if(!Name_Validation(name)){
		$.messager.alert('系统提示','姓名只能由中文，数字，字母以及下划线和.组成，且长度不超过15位');
		return ;
	}
	if(email!==''&&!Mail_Validation(email)){
		$.messager.alert('系统提示','邮箱格式错误');
		return ;
	}
	
	if(tel!=''&&!Tel_Validation(tel)){
		$.messager.alert('系统提示','手机号码格式错误');
		return ;
	}
	
	if(wx!=''&&!Wx_Validation(wx)){
		$.messager.alert('系统提示','微信格式错误');
		return ;
	}
	
	if(qq!=''&&!QQ_Validation(qq)){
		$.messager.alert('系统提示','qq格式错误');
		return ;
	}
	  var params = $("#ryxxAddFm").serialize();  
         $.ajax( {  
           type : "POST",  
           dataType: "json",
           url : "../userInfoTrol/addUser",  
           data : params,  
           success : function(data){debugger;
           		if(data.flag){  
              		$.messager.alert('系统提示',data.message);
              		$('#ryxxAddFm').form('clear');
              		$('#ryxxAddInfo').dialog('close');
        			$('#ryxxAddInfo').dialog('clear');
        			$('#ryxxGrid').datagrid('load');
              	}else{
              		$.messager.alert('系统提示',data.message);
              	}
            }  
      });  
}

</script>

<form id="ryxxAddFm" method="post">
	<input type="hidden" id="id" name="id">
	<div id="daxzTab" class="easyui-tabs" style="width:100%;height:100%;">   
		<div title="基本信息" value="1" style="">   
    		<table class="table2">
     			<tr>
     				<td class="left"><lable>姓名：</lable></td>
     				<td class="right"><input class="easyui-textbox" readonly="readonly" id="name" name="name" data-options="required:true" style="height:22px"/></td>
     				<td class="left"><lable>身份证号码：</lable></td>
     				<td class="right"><input class="easyui-textbox" readonly="readonly" id="pnum" name="pnum" data-options="required:true" style="height:22px"/></td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>性别：</lable></td>
     				<td class="right">
     					<input type="radio" name="sex" readonly="readonly" value="1" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="radio" name="sex" readonly="readonly" value="0" />女</td>
     				</td>
     				<td class="left"><lable>出生日期：</lable></td>
     				<td class="right"><input class="easyui-textbox" readonly="readonly" id="birth_date" name="birth_date" style="height:22px"/></td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>民族：</lable></td>
     				<td class="right">
     					<select id="mz" class="easyui-combobox" readonly="readonly" name="mz" style="width:135px;">   
	   					</select>
     				</td>
     				<td class="left"><lable>政治面貌：</lable></td>
     				<td class="right">
     				      <select id="zzmm" class="easyui-combobox" readonly="readonly" name="zzmm" style="width:135px;">   
	  					  </select>
     				</td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>毕业学校：</lable></td>
     				<td class="right">
     					<input class="easyui-textbox" id="school" readonly="readonly" name="school" style="height:22px"/>
     				</td>
     				<td class="left"><lable>毕业时间：</lable></td>
     				<td class="right"><input class="easyui-textbox" readonly="readonly" id="graduation_time" name="graduation_time" style="height:22px"/></td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>专业：</lable></td>
     				<td class="right">
     					<input class="easyui-textbox" id="major" readonly="readonly" name="major" style="height:22px"/>
     				</td>
     				<td class="left"><lable>学位：</lable></td>
     				<td class="right"><input class="easyui-textbox" readonly="readonly" id="degree" name="degree" style="height:22px"/></td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>家庭住址：</lable></td>
     				<td class="right">
     					<input class="easyui-textbox" id="adr" name="adr" readonly="readonly" style="height:22px"/>
     				</td>
     				<td class="left"><lable>邮箱：</lable></td>
     				<td class="right"><input class="easyui-textbox" id="email" readonly="readonly" name="email" style="height:22px"/></td>
     			</tr>
     			
     			
     			<tr>
     				<td class="left"><lable>qq：</lable></td>
     				<td class="right">
     					<input class="easyui-textbox" id="qq" name="qq" readonly="readonly" style="height:22px"/>
     				</td>
     				<td class="left"><lable>微信：</lable></td>
     				<td class="right"><input class="easyui-textbox" id="wx" readonly="readonly" name="wx" style="height:22px"/></td>
     			</tr>
     			
     			<tr>
     				<td class="left"><lable>手机号码：</lable></td>
     				<td class="right">
     					<input class="easyui-textbox" id="tel" name="tel" style="height:22px"/>
     				</td>
     			</tr>
			</table>  
		</div>   
	</div>
</form>		
</body>

</html>
