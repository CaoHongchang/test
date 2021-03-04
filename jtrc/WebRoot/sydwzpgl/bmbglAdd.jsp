<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>报考表</title>
<style type="text/css">


</style>
<body>
<form id="fm" method="post">
	<input type="hidden" id="add_ksbh" >
	<input type="hidden" id="add_id" >
    <div id="print_div">
    <style type="text/css">
	.table4{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#FFFFFF;}
	.table4 th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
	.table4 th{font-weight:bold;background:#ccc;}
	
	
	.tab { border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#FFFFFF;} 
	.tab th,td { border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#FFFFFF;} 
    .tab th { border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#FFFFFF;} 
    
	</style>
	   <table  class="table2">
	   	  <tr>
		    <th  style='width: 30%;'>岗位信息</th>
		    <th style="float: left;">个人信息</th>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_1"></td>
		    <td class="right" id="bmb_2"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_3" height="210px"></td>
		    <td class="right" id="bmb_4"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_5"></td>
		    <td class="right" id="bmb_6"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_100"></td>
		    <td class="right" id="bmb_7"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_8" rowspan="4"></td>
		    <td class="right" id="bmb_9"></td>
		  </tr>
	   	  <tr>
		     <td class="right" id="bmb_10"></td>
		  </tr>
	   	  <tr>
		    <td class="right" id="bmb_11"></td>
		  </tr>
	   	  <tr>
		    <td class="right" id="bmb_12"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_13"></td>
		    <td class="right" id="bmb_14"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_15"></td>
		    <td class="right" id="bmb_16"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_17"></td>
		    <td class="right" id="bmb_18"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_19"></td>
		    <td class="right" id="bmb_20"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_21"></td>
		    <td class="right" id="bmb_22"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_23"></td>
		    <td class="right" id="bmb_24"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_25"></td>
		    <td class="right" id="bmb_26"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_27"></td>
		    <td class="right" id="bmb_28"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_29"></td>
		    <td class="right" id="bmb_30"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_31"></td>
		    <td class="right" id="bmb_32"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_33"></td>
		    <td class="right" id="bmb_34"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_35"></td>
		    <td class="right" id="bmb_36"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_37"></td>
		    <td class="right" id="bmb_38"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_39"></td>
		    <td class="right" id="bmb_40"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_41"></td>
		    <td class="right" id="bmb_42"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_43"></td>
		    <td class="right" id="bmb_44"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_45"></td>
		    <td class="right" id="bmb_46"></td>
		  </tr>
	   	  <tr>
		    <td class="left" id="bmb_47"></td>
		    <td class="right" id="bmb_48"></td>
		  </tr>
	   </table>
   </div>
    <div style ="height:40px"></div>
    <table class="table2" id="bmbgl_sp">
      <tr>
      <td class="left">审核状态</td>
      <td class="right">
       <select id ="isState" name="isState" class="easyui-combobox" data-options="required:true" style="width: 200px">
        <option value="审核通过">审核通过</option>
        <option value="审核不通过">审核不通过</option>
        <option value="修改信息">修改信息</option>
        </select>
	   </td>
      </tr>
      
      <tr>
      <tr>
      <td class="left">审核意见</td>
      <td class="right">
       	<textarea rows="5" cols="50" id="rs" name="rs" style="border:black solid;border-width:1 1 1 1;color:#000000;width:90%;"></textarea>
	   </td>
      </tr>
      
      <tr>
      <td class="left">用户申诉内容</td>
      <td class="right">
       	<textarea rows="5" cols="50" id="ss_content" name="ss_content" style="border:black solid;border-width:1 1 1 1;color:#000000;width:90%;"></textarea>
	   </td>
      </tr>
      
      <tr>
      <td class="left">申诉状态</td>
      <td class="right">
       <select id ="upState" name="upState" class="easyui-combobox" data-options="required:true" style="width: 200px">
       <!-- 
        <option value="未申诉">未申诉</option>   
        <option value="申诉中">申诉中</option>
         -->
        <option value="申诉失败">申诉失败</option>
        <option value="申诉成功">申诉成功</option>
        <option value="修改信息">修改信息</option>
        </select>
	   </td>
      </tr>
      <tr>
      <td class="left">申诉意见</td>
      <td class="right">
       <textarea rows="5" cols="50" id="up" name="up" style="border:black solid;border-width:1 1 1 1;color:#000000;width:90%;"></textarea>
	  </td>
      </tr>
      <!-- 
   	<tr>
   		<td class="right" onclick="savebmb()" colspan="2"><a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a></td>
   	</tr>
   	 -->
    </table>                
    </form> 
<script type="text/javascript">

var id = "<%=request.getParameter("id").toString()%>";
var userid = "<%=request.getParameter("userid").toString()%>";
var gwyqid = "<%=request.getParameter("gwyqid").toString()%>";
var uid = "<%=request.getParameter("uid").toString()%>";
var fuc = "<%=request.getParameter("fuc").toString()%>";

function jsGetAge(strBirthday)
{      
    var returnAge;
    var strBirthdayArr=strBirthday.split("-");
    var birthYear = strBirthdayArr[0];
    var birthMonth = strBirthdayArr[1];
   
    d = new Date();
    var nowYear = d.getFullYear();
    var nowMonth = d.getMonth() + 1;
   
    if(nowYear == birthYear)
    {
        returnAge = 0;//同年 则为0岁
    }
    else
    {
        var ageDiff = nowYear - birthYear ; //年之差
        if(ageDiff > 0)
        {
            if(nowMonth == birthMonth)
            {
            	returnAge = ageDiff ;
            }
            else
            {
                var monthDiff = nowMonth - birthMonth;//月之差
                if(monthDiff < 0)
                {
                    returnAge = ageDiff - 1;
                }
                else
                {
                    returnAge = ageDiff ;
                }
            }
        }
        else
        {
            returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
        }
    }
   
    return returnAge;//返回周岁年龄
   
}

$(function(){
	$.ajax({
	    url: '../bgActivityUserInfo/queryUserInfo',    //请求的url地址
	    dataType: "json",   //返回格式为json
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: { "id": id,"userid":userid,"uid":uid,"epi":gwyqid},    //参数值
	    type: "POST",   //请求方式
	    success: function(req) {
	    	var userInfo = req.userInfo;
	    	var shssInfo = req.shssInfo;
	    	var enterpriseInfo = req.enterpriseInfo;
	    	var activityUserInfo = req.activityUserInfo;
	    	var studyInfo = req.studyInfo;
	    	var workInfo = req.workInfo;
	    	$("#bmb_1").html('单位代码：'+enterpriseInfo[0].pno);
	    	$("#bmb_2").html('考生编号：'+$('#add_ksbh').val());
	    	if(enterpriseInfo[0].dwmc!='' && enterpriseInfo[0].dwmc != null && enterpriseInfo[0].dwmc != 'undefined'){
	    		$("#bmb_3").html('单位名称：'+enterpriseInfo[0].dwmc+""+enterpriseInfo[0].bkdw);
	    	}else{
	    		$("#bmb_3").html('单位名称：'+enterpriseInfo[0].bkdw);
	    	}
	    	if(userInfo[0].photo == null || userInfo[0].photo== '' || userInfo[0].photo == 'undefined') {
	    		$("#bmb_4").html('姓名：'+userInfo[0].name+"</p><img src='' height='230px' width='160px' border='1'>");
	    	} else {
	    		$("#bmb_4").html('姓名：'+userInfo[0].name+"</p><img src='/"+userInfo[0].photo+"' height='230px' width='160px' border='1'>");
	    	}
	    	//$("#bmb_5").html('岗位代码：'+enterpriseInfo[0].pno);
	    	$("#bmb_6").html('身份证号：'+userInfo[0].card_number);
	    	//$("#bmb_100").html('岗位名称：'+enterpriseInfo[0].name);
	    	$("#bmb_7").html('籍贯：'+userInfo[0].home_address);
			$("#bmb_8").html('招收人数：'+activityUserInfo[0].recruitment_num);
	    	
	    	if(userInfo[0].byyx == 'undefined') {
	    		$("#bmb_9").html('毕业院校：');
	    	} else {
	    		$("#bmb_9").html('毕业院校：'+userInfo[0].byyx);
	    	}
	    	
	    	if(userInfo[0].bysj == 'undefined') {
	    		$("#bmb_10").html('毕业时间：');
	    	} else {
	    		$("#bmb_10").html('毕业时间：'+userInfo[0].bysj);
	    	}
	    	
	    	$("#bmb_11").html('工作时间：'+userInfo[0].work_date);
	    	$("#bmb_12").html('婚姻状况：'+userInfo[0].marital_status);
	    	$("#bmb_13").html('性别需求：'+activityUserInfo[0].gender_range);
	    	if(userInfo[0].gender ==1 || userInfo[0].gender =='1'){
	    		$("#bmb_14").html('男');
	    	}else{
	    		$("#bmb_14").html('女');
	    	}
	    	$("#bmb_15").html('年龄要求：'+activityUserInfo[0].age_range);
	    	var birthDate1=userInfo[0].card_number.substring(6, 10) + "-" + userInfo[0].card_number.substring(10, 12)+"-"+userInfo[0].card_number.substring(12, 14);
	    	$("#bmb_16").html(birthDate1);
	    	/**
	        try {
	        	var   r   =   userInfo[0].birth_date.match(/^\d{4}-?(?:0[1-9]|1[0-2])$/);     
		        var   d=   new   Date(r[1],   r[3]-1);    
		        var   y;
	        	if   (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]){   
		               y  =   new   Date().getFullYear();   
		               $("#bmb_16").html((y-r[1])+'周岁');
		        } else {
		        	$("#bmb_16").html('');
		        }
			} catch (e) {
				alert(e);
				$("#bmb_16").html('');
			}
	        **/
	    	
	    	$("#bmb_17").html('民族要求：'+activityUserInfo[0].nation_range);
	    	$("#bmb_18").html(userInfo[0].nation);
	    	
	    	if(activityUserInfo[0].political_status_range==userInfo[0].political_status || activityUserInfo[0].political_status_range=="不限"){
	    		$("#bmb_19").html('政治面貌：'+activityUserInfo[0].political_status_range);
		    	$("#bmb_20").html(userInfo[0].political_status);
	    	}else{
	    		
		    	$("#bmb_19").html('政治面貌：'+activityUserInfo[0].political_status_range);
		    	$("#bmb_20").html('<span style="color:red">'+userInfo[0].political_status+'</span>');
	    	}
	    	if(activityUserInfo[0].education_range==userInfo[0].education || activityUserInfo[0].education_range=="不限"){
	    		$("#bmb_21").html('文化程度：'+activityUserInfo[0].education_range);
		    	$("#bmb_22").html(userInfo[0].education);
	    		
	    	}else{
	    		$("#bmb_21").html('文化程度：'+activityUserInfo[0].education_range);
		    	$("#bmb_22").html('<span style="color:red">'+userInfo[0].education+'</span>');
	    	}
	    	if(activityUserInfo[0].school_range==userInfo[0].degree || activityUserInfo[0].school_range=="不限"){
	    		$("#bmb_23").html('学位要求：'+activityUserInfo[0].school_range);
	    		$("#bmb_24").html(userInfo[0].degree);
	    	}else{
	    		$("#bmb_23").html('学位要求：'+activityUserInfo[0].school_range);
	    		$("#bmb_24").html('<span style="color:red">'+userInfo[0].degree+'</span>');
	    	}
	    	if(activityUserInfo[0].education_type_range==userInfo[0].qualification || activityUserInfo[0].education_type_range=="不限"){
	    		$("#bmb_25").html('学历类别：'+activityUserInfo[0].education_type_range);
		    	$("#bmb_26").html(userInfo[0].qualification);
	    		
	    	}else{
	    		$("#bmb_25").html('学历类别：'+activityUserInfo[0].education_type_range);
		    	$("#bmb_26").html('<span style="color:red">'+userInfo[0].qualification+'</span>');
	    	}
	    	$("#bmb_27").html('证书信息：');
	    	if(userInfo[0].certificate != null && userInfo[0].certificate != '' && userInfo[0].get_date != null && userInfo[0].get_date != '') {
	    		$("#bmb_28").html('证书名称：'+userInfo[0].certificate+'<br>'+'取证时间：'+userInfo[0].get_date);
	    	} else {
	    		$("#bmb_28").html('');
	    	}
	    	
	    	$("#bmb_29").html('工作经历：');
	    	var gzjl =  String.prototype.concat.call(    	
'<table class="tab" >',
'<thead>',
    '<tr>',
      '<th>地点</th>',
      '<th>公司</th>',
'<th>工作</th>',
'<th>职务</th>',
'<th>开始时间</th>',
'<th>结束时间</th>',
    '</tr>',
  '</thead>',
  '<tbody>');
 
    for (var work_item in workInfo) {
        gzjl+="<tr>";
        
        gzjl+="<th>"+workInfo[work_item].work_address+"</th>";
        gzjl+="<th>"+workInfo[work_item].work_unit+"</th>";
        gzjl+="<th>"+workInfo[work_item].work_job+"</th>";
        gzjl+="<th>"+workInfo[work_item].post+"</th>";
        gzjl+="<th>"+workInfo[work_item].work_start_date+"</th>";
        gzjl+="<th>"+workInfo[work_item].work_end_date+"</th>";
  
        gzjl+="</tr>";
    }
  
	    	/*for (var work_item in workInfo) {
	    		gzjl +="地点："+workInfo[work_item].work_address+
	    		" 公司："+workInfo[work_item].work_unit +
	    		" 工作："+workInfo[work_item].work_job +
	    		" 职务："+workInfo[work_item].post +
	    		" 时间："+workInfo[work_item].work_start_date+"至"+workInfo[work_item].work_end_date+"\n";
			}*/
 
	    	$("#bmb_30").html(gzjl+'</tbody></table>');
			if(activityUserInfo[0].profession_range==userInfo[0].profession || activityUserInfo[0].profession_range=="不限"){
				$("#bmb_31").html('所需专业：'+activityUserInfo[0].profession_range);
		    	$("#bmb_32").html(userInfo[0].profession);
				
			}else{
				$("#bmb_31").html('所需专业：'+activityUserInfo[0].profession_range);
		    	$("#bmb_32").html('<span style="color:red">'+userInfo[0].profession+'</span>');
			}
	    	$("#bmb_33").html('备注：');
	    	$("#bmb_34").html(userInfo[0].remark);
 
	    	          var grjl =  String.prototype.concat.call(       
'<table class="tab" >',
'<thead>',
    '<tr>',
      '<th>毕业院校</th>',
      '<th>毕业时间</th>',
'<th>所学专业</th>',
'<th>学制</th>',
'<th>取得方式</th>',
'<th>学历</th>',
'<th>学位</th>',
    '</tr>',
  '</thead>',
  '<tbody>');
	    	/*for (var studyItem in studyInfo) {
	    		grjl += "毕业院校："+studyInfo[studyItem].university+
	    		" 毕业时间："+studyInfo[studyItem].study_end_date+
	    		" 所学专业："+studyInfo[studyItem].specialty+
	    		" 学制："+studyInfo[studyItem].educational_system+
	    		" 取得方式："+studyInfo[studyItem].get_method+
	    		" 学历："+studyInfo[studyItem].education+
	    		" 学位："+studyInfo[studyItem].degree;
	    	}*/
	    	    for (var studyItem in studyInfo) {
        grjl+="<tr>";
        
        grjl+="<th>"+studyInfo[studyItem].university+"</th>";
        grjl+="<th>"+studyInfo[studyItem].study_end_date+"</th>";
        grjl+="<th>"+studyInfo[studyItem].specialty+"</th>";
        grjl+="<th>"+studyInfo[studyItem].educational_system+"</th>";
        grjl+="<th>"+studyInfo[studyItem].get_method+"</th>";
        grjl+="<th>"+studyInfo[studyItem].education+"</th>";
        grjl+="<th>"+studyInfo[studyItem].degree+"</th>";
        gzjl+="</tr>";
    }
			$("#bmb_35").html('学习经历：');
			$("#bmb_36").html(grjl+'</tbody></table>');
			$("#bmb_37").html('家庭成员及主要社会关系情况：');
			$("#bmb_38").html(userInfo[0].home_member_social_relations);
			$("#bmb_39").html('主要业绩');
			$("#bmb_40").html(userInfo[0].main_achievement);
			$("#bmb_41").html('联系方式');
			$("#bmb_42").html('手机号码：'+userInfo[0].mobile_telephone +"  邮箱："+userInfo[0].email);
			$("#bmb_43").html('	');
			$("#bmb_44").html('家庭住址：'+userInfo[0].home_address);
			$("#bmb_45").html('其他岗位要求：'+activityUserInfo[0].others_range);
			if(userInfo[0].fixed_telephone=="应届生"){
				$("#bmb_46").html('工作年限：'+userInfo[0].fixed_telephone);
			}else{
				$("#bmb_46").html('工作年限：'+userInfo[0].fixed_telephone+'年');
			}
			$("#bmb_47").html('补充信息：');
			$("#bmb_48").html('');
			
			document.getElementById("rs").value=shssInfo[0].rs;
			document.getElementById("ss_content").value=shssInfo[0].ss_content;
			document.getElementById("up").value=shssInfo[0].up;
				
			if(fuc =="dyyl"){
				$("#ok").hide();
				$("#save").hide();
				$("#bmbgl_sp").show();
				if(shssInfo[0].is_state == null || shssInfo[0].is_state == '' || shssInfo[0].is_state == 'undefined') {
					$('#isState').combobox("disable");
				} else {
					$('#isState').combobox('select',shssInfo[0].is_state);
					$('#isState').combobox("disable");
				}
				
				document.getElementById("rs").disabled="disabled";
				document.getElementById("ss_content").disabled="disabled";
				document.getElementById("up").disabled="disabled";
				if(shssInfo[0].up_state == null || shssInfo[0].up_state == '' || shssInfo[0].up_state == 'undefined') {
					$('#upState').combobox("disable");
				} else {
					$('#upState').combobox("disable");
					$('#upState').combobox('select',shssInfo[0].up_state);
				}
				
				$("#dyyl_button").hide();
			}else if(fuc=="ck"){
				$("#save").hide();
				$("#dy").hide();
				if(shssInfo[0].is_state == null || shssInfo[0].is_state == '' || shssInfo[0].is_state == 'undefined') {
					$('#isState').combobox("disable");
				} else {
					$('#isState').combobox('select',shssInfo[0].is_state);
					$('#isState').combobox("disable");
				}
				
				document.getElementById("rs").disabled="disabled";
				document.getElementById("ss_content").disabled="disabled";
				document.getElementById("up").disabled="disabled";
				if(shssInfo[0].up_state == null || shssInfo[0].up_state == '' || shssInfo[0].up_state == 'undefined') {
					$('#upState').combobox("disable");
				} else {
					$('#upState').combobox("disable");
					$('#upState').combobox('select',shssInfo[0].up_state);
				}
				
				$("#dyyl_button").hide();
				//$("#bmbgl_sp").hide();
			}else if(fuc=='shcl'){
				$("#ok").hide();
				$("#dy").hide();
				$("#dyyl_button").hide();
				$("#bmbgl_sp").show();
				if(shssInfo[0].is_state == null || shssInfo[0].is_state == '' || shssInfo[0].is_state == 'undefined') {
				} else {
					$('#isState').combobox('select',shssInfo[0].is_state);
				}
				document.getElementById("ss_content").disabled="disabled";
				
				if(shssInfo[0].up_state == null || shssInfo[0].up_state == '' || shssInfo[0].up_state == 'undefined') {
					$('#upState').combobox("disable");
				} else {
					
					$('#upState').combobox('select',shssInfo[0].up_state);
					$('#upState').combobox("disable");
				}
				$("#up").attr("disabled",true);
			}else if(fuc=='sscl'){
				$("#ok").hide();
				$("#dy").hide();
				$("#dyyl_button").hide();
				$("#bmbgl_sp").show();
				/*
				if(shssInfo[0].is_state == null || shssInfo[0].is_state == '' || shssInfo[0].is_state == 'undefined') {
					$('#isState').combobox("disable");
				} else {
					$('#isState').combobox('select',shssInfo[0].is_state);
					$('#isState').combobox("disable");
				}*/
				document.getElementById("ss_content").disabled="disabled";
				
				if(shssInfo[0].up_state == null || shssInfo[0].up_state == '' || shssInfo[0].up_state == 'undefined') {
					
				} else {
					$('#upState').combobox('select',shssInfo[0].up_state);
				}
				$("#rs").attr("disabled",true);
			}
	    }
	});
	
	
});

function printFuc(){
	var bdhtml=window.document.body.innerHTML;//获取当前页的html代码 
	window.document.body.innerHTML=$("#print_div").html();//需要打印的页面 
	window.print(); 
	location.reload();//还原界面 
}

function savebmb(){
 
	if(fuc=='shcl'){
		$.ajax({
		    url: '../bgActivityUserInfo/sh',    //请求的url地址
		    //dataType: "json",   //返回格式为json
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: { "id": $("#add_id").val(),"isState":$('#isState').combobox('getValue'),"rs":$("#rs").val()},    //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	if(data == 1 || data == '1') {
		    		alert("更新成功");
		    		$('#bmbglInfo').dialog('close');
					$("#bmbglGrid").datagrid("reload");
		    	}else{
		    		alert("更新失败");
		    	}
		    }
		});
	}else if(fuc=='sscl'){

		$.ajax({
		    url: '../bgActivityUserInfo/ss',    //请求的url地址
		    //dataType: "json",   //返回格式为json
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: { 
		      "id": $("#add_id").val(),
		      "upState":$('#upState').combobox('getValue'),
		      "isState":$('#isState').combobox('getValue'),
		      "up":$("#up").val()
		      },    //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	if(data == 1 || data == '1') {
		    		alert("更新成功");
		    		$('#bmbglInfo').dialog('close');
					$("#bmbglGrid").datagrid("reload");
		    	}else{
		    		alert("更新失败");
		    	}
		    }
		});
	}
}
</script>
</body>

</html>
