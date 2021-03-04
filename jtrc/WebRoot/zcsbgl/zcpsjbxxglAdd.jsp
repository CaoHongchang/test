<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>申报审核</title>

<body>
	<script type="text/javascript">


function post_save(){debugger 
	
	if($("#mz").combobox("getValue")=="请选择"){
	   alert("请选择民族!");
	   return ;
		}
		
		var name=$("#name").textbox('getValue');
		if(name==''){
		alert("姓名不能为空!");
		return ;
		}else if(!Name_Validation(name)){
  		alert("姓名只能由中文，字母和.组成，且长度不超过15位！");
  		return;
		}
		
		var workName=$("#workName").textbox('getValue');
		if(workName!=''&&workName.length>100){
		alert("工作单位长度不超过100字，请重新输入！");
  		return;
		}
		
		var dPoint=$("#dPoint").textbox('getValue');
		if(dPoint.length>50){
		alert("单位属性长度不超过50字，请重新输入！");
		return;
		}
		
		var adr=$("#adr").textbox('getValue');
		if(adr.length>100){
		alert("通讯地址长度不超过100字，请重新输入！");
		return;
		}
		
		var technical=$("#technical").textbox('getValue');
		if(technical.length>100){
		alert("专业技术职务长度不超过100字，请重新输入！");
		return;
		}
		
		var email=$("#email").textbox('getValue');
		if(email!=''&&!Mail_Validation(email)){
		alert("邮箱格式错误，请重新输入！");
		return;
		}
		
		var zNo=$("#zNo").textbox('getValue');
		if(zNo!=''&&!Zno_Validation(zNo)){
		alert("证书编号只允许输入数字和字母的组合，且长度不超过30位！");
		return;
		}
		
		var tel=$("#tel").textbox('getValue');
		if(tel!=''&&!Tel_Validation(tel)){
		alert("手机号码格式错误，请重新输入！");
		return;
		}
		
		var pnum=$("#pnum").textbox('getValue');
		if(!IDCode_Validation(pnum)){
		alert("身份证格式错误，请重新输入！");
		return;
		}
 
 		var formPlace=$("#formPlace").textbox('getValue');
		if(formPlace.length>100){
		alert("单位所属地区长度不超过100字，请重新输入！");
		return;
		}
		
		var zipCode=$("#zipCode").textbox('getValue');
		if(zipCode!=''&&!Post_Validation(zipCode)){
		alert("邮政编码格式错误，请重新输入！");
		return;
		}
		
		var gTel=$("#gTel").textbox('getValue');
		if(gTel!=''&&!HomeTel_Validation(gTel)){
		alert("固定电话格式错误，请重新输入！");
		return;
		}
		
		var qq=$("#qq").textbox('getValue');
		if(qq!=''&&!QQ_Validation(qq)){
		alert("QQ格式错误，请重新输入！");
		return;
		}
		
		var curPos=$("#curPos").val();
		if(curPos.length>30){
		alert("现专业技术职务长度不超过30个字");
		return;
		}
 
 		var pTime=$("#pTime").val();
 		if(pTime.length>10){
 		alert("聘任年限长度不超过10个字");
 		return;
 		}
 		
 		var workNow=$("#workNow").val();
 		if(workNow.length>30){
 		alert("现从事何专业技术工作长度不超过30个字");
 		return ;
 		}
 		
 		var sName=$("#sName").val();
 		if(sName.length>30){
 		alert("申报资格名称长度不超过30个字");
 		return ;
 		}
 		
 		var xzPos=$("#xzPos").val();
 		if(xzPos.leng>30){
 		alert("行政职务长度不超过30个字");
 		return ;
 		}
 		
 		var sPro=$("#sPro").val();
 		if(sPro.length>30){
 		alert("申报专业长度不超过30位！");
 		return;
 		}
 		
 		var yearK=$("#yearK").val();
 		if(yearK.length>50){
 		alert("年度考核长度不超过50个字");
 		return;
 		}
 		
 		var jscore =$("#jscore").val();
 		if(!Score_Validation(jscore)){
 		alert("外语成绩只能0-150之间，且只能保留一位小数");
 		return ;
 		} 
 
 		var wRemark=$("#wRemark").val();
 		if(wRemark.length>120){
 		alert("备注长度不超过120个字");
 		return;
 		}
 
	 var r = $("#fm").form('validate');
	if(!r) {
		return false;
	}

	var options  = {    
		url:"../zcps/zcsbsave",    
		type:'post',
		data: {
			id : rowid
		},
		success:function(data)    
		{    
			var jsondata = eval("("+data+")");			
			if(jsondata.flag==1){
				alert("保存成功！");
				$('#zcpshdGrid').datagrid('reload')
				$('#zcpsjbxxAddInfo').dialog('close');
			}else if(jsondata.flag==2){
				alert("该活动已经申报过啦!");
			}else if(jsondata.flag==3){
				alert("上传文件必须是rar或者zip格式，请确认格式！");
			}else{
				alert("活动信息提交失败！");
			}
		}    
	};    
	$("#fm").ajaxSubmit(options); 
}
	
		function convertArray(o) { //主要是推荐这个函数。它将jquery系列化后的值转为name:value的形式。 
			var v = {}; 
			for (var i in o) { 
			if (typeof (v[o[i].name]) == 'undefined') v[o[i].name] = o[i].value; 
			else v[o[i].name] += "," + o[i].value; 
			} 
			return v; 
		} 
	
		var editid;

 
		var addinfo_p = [{
						initFun : initxxjl,
						url : "../zcps/showxxjlsave",
						formName:'#xxjlAddForm'
					},{
						initFun : initgzjl,
						url : "../zcps/showgzjlsave",
						formName:'#gzjlAddForm'
					},
					{
						initFun : initjxjy,
						url : "../zcps/showjxjysave",
						formName:'#jxjyjlAddForm'
					},
					{
						initFun : initlwzz,
						url : "../zcps/showlwzzsave",
						formName:'#sblwAddForm'
					}];
		
		
		function addinfo( index )
		{debugger;
			var p = addinfo_p[index];
			var initFun = p.initFun;
			var url =  p.url;
			var formName = p.formName;
			 var fjParam= null;
			if(index=='3'){
			fjParam= $("#fjlbGrid").datagrid("getData");
			
			// alert(fjParam.rows.length);
					if(fjParam.rows.length>0){
					fjParam=JSON.stringify(fjParam.rows); 
					}else{
					   alert("请选择上传论文!");
					   return;
					}
					
			       
			}
			
		 	
			var data = convertArray($(formName).serializeArray());
			data.activityId = $('#activityId').val()
			data.userId = userId + ""
			data.uid = userId
			data.editid = editid;
			if(fjParam!=null||fjParam!='')
			data.fjParam=fjParam;
			$.post(url,data,function(data) {
					if (data.flag == 1) {
						alert("保存成功")			 	
						if( typeof (initFun) == "function" )
						{
							initFun();
						}
						$('#experienceDialog').dialog('close');
					} else {
						alert("保存失败!");
					}
				}, "json");
				
				
				/*
			//console.log($('#activityId').val());
			var queryparam={};
			queryparam.
		 $(formName).ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: url, // 需要提交的 url
            data: {
                activityId : $('#activityId').val(),
				userId : userId + "",
				uid : userId,
				editid : editid,
				fjParam:fjParam
            },
            success: function(data) {  
				var jsondata = eval("("+data+")");
                if (jsondata.flag == 1) {
					alert("保存成功");			 	
					if( typeof (initFun) == "function" )
					{
						initFun();
					}
					$('#experienceDialog').dialog('close');
				} else {
					alert("保存失败!");
				}
            }
        });
		*/		
		};
		
		
		 
		var dialogHref=['../zcsbgl/xxjlAdd.jsp',
		'../zcsbgl/gzjlAdd.jsp',
		'../zcsbgl/jxjyjlAdd.jsp',
		'../zcsbgl/sblwAdd.jsp'];	
		var dialogTitle=['学习经历新增','工作经历新增','继续教育新增','论文新增'];
		function openExperienceAddDialog(index){
			$('#experienceDialog').dialog({
				title:dialogTitle[index],
				href:dialogHref[index],
				closed:false,
				cache:false,
				modal:true,
				width:850,
				height:450,
				buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
					
					    if(index=='0'){
					    
					    var school_name= $("#school_name").textbox();
					    if(school_name.length>50){
					    	alert("学校名称长度不能超过50字，请重新输入！");
					    	return;
					    }
					    
					     var degree= $("#degree").textbox();
					    if(degree.length>20){
					    	alert("学位长度不能超过20字，请重新输入！");
					    	return;
					    }
					    
					    var certificate= $("#certificate").textbox();
					    if(certificate.length>20){
					    	alert("证书长度不能超过20字，请重新输入！");
					    	return;
					    }
					    
					     var pro_name= $("#pro_name").textbox();
					    if(pro_name.length>20){
					    	alert("专业长度不能超过20字，请重新输入！");
					    	return;
					    }
					    
					    var xz= $("#xz").textbox();
					    if(xz.length>20){
					    	alert("学制长度不能超过20字，请重新输入！");
					    	return;
					    }
					    
					     var get_method= $("#xz").textbox();
					    if(xz.length>20){
					    	alert("取得方式长度不能超过20字，请重新输入！");
					    	return;
					    }
					    
					      var r = $("#xxjlAddForm").form('validate');
					      if(!r) {
								return false;
							}
					    }else  if(index=='1'){
					    	var enterpriseId= $("#enterpriseId").textbox();
					    	if(enterpriseId.length>50){
					    	alert("工作单位长度不能超过50字，请重新输入！");
					    	return;
					    	}
					    	
					    	var placeId= $("#placeId").textbox();
					    	if(placeId.length>30){
					    	alert("职务长度不能超过30字，请重新输入！");
					    	return;
					    	}
					    	
					    	var workName= $("#workName").textbox();
					    	if(workName.length>50){
					    	alert("从事工作不能超过50字，请重新输入！");
					    	return;
					    	}
					    	
					    	var workAdr= $("#workAdr").textbox();
					    	if(workAdr.length>50){
					    	alert("工作地点不能超过50字，请重新输入！");
					    	return;
					    	}
					    	
					      var r = $("#gzjlAddForm").form('validate');
					      if(!r) {
								return false;
							}
					    }else  if(index=='2'){
					     var studyTime=$("#studyTime").numberbox('getValue');
					     if(!Num_Validation(studyTime)){
					     alert("学时过长，请重新输入！");
					     return;
					     }
					     
					      var studyMethod=$("#studyMethod").textbox('getValue');
					     if(studyMethod.length>30){
					     alert("学习形式不能超过30字，请重新输入！");
					     return;
					     }
					     
					       var studyContent=$("#studyContent").textbox('getValue');
					     if(studyContent.length>50){
					     alert("学习内容不能超过50字，请重新输入！");
					     return;
					     }
					     
					      var r = $("#jxjyjlAddForm").form('validate');
					      if(!r) {
								return false;
							}
					    }else  if(index=='3'){
					    
					     var dissetationName=$("#dissetationName").textbox('getValue');
					     if(dissetationName.length>50){
					     alert("论文题目不能超过50字，请重新输入！");
					     return;
					     }
					    
					    var jMsg=$("#jMsg").textbox('getValue');
					     if(jMsg.length>150){
					     alert("期刊交流不能超过150字，请重新输入！");
					     return;
					     }
					    
					     var remark=$("#remark").textbox('getValue');
					     if(remark.length>150){
					     alert("备注不能超过150字，请重新输入！");
					     return;
					     }
					    
					      var r = $("#sblwAddForm").form('validate');
					      if(!r) {
								return false;
							}
					    }
					  
						addinfo(index);
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
						$('#experienceDialog').dialog('close');
					}
				}
				],
				iconCls:'icon-save',
				onLoad: function () {
				//添加人：邓祯
				$('#activityId').val($('#activityId').val());
				
				if(index=='3'){
				    fjListFuc('');
				
				}
				
				}			
			});
		}
		
		 

	var delinfo_p = [{
						confirm: "您确定删除学习经历信息?",
						initFun : initxxjl,
						url : "../zcps/showxxjldel",
						dialogName:'#xxjlGrid'
					},{
						confirm: "您确定删除工作经历信息?",
						initFun : initgzjl,
						url : "../zcps/showgzjldel",
						dialogName:'#gzjlGrid'
					},
					{
						confirm: "您确定删除继续教育信息?",
						initFun : initjxjy,
						url : "../zcps/showjxjydel",
						dialogName:'#xxjyGrid'
					},
					{
						confirm: "您确定删除论文专注信息?",
						initFun : initlwzz,
						url : "../zcps/showlwzzdel",
						dialogName:'#sblwGrid'
					}];
					
	 
 
		function DelExperience(index)
		{
			var p = delinfo_p[index];
			var _dialogName = p.dialogName;
			var row;
			/*
			if(index==''){
			  row=$(_dialogName).datagrid('getSelected');
			}
			else{
			  row=$(_dialogName).datagrid('getRows')[index];
			}
			*/
			row=$(_dialogName).datagrid('getSelected');
			
			if(row==null||row==undefined){
			  $.messager.alert('系统提示','请选择您要修改的基本信息！','info');
			  return;
			}
 		
			 if(confirm(p.confirm)){
	            
				$.post(p.url, {
					delid :row.id			
				}, function(data) {

					 if (data.flag == 1) {

						alert("删除成功");
						if(index=='0')
						initxxjl();
						else if(index=='1')
						initgzjl();
						else if(index=='2')
						initjxjy();
						else if(index=='3')
						initlwzz();
					} else {

						alert("删除失败!");

					} 
				}, "json"); 
		   }; 
		}
		
		$("#zType").combobox({
onChange: function (n,o) {
  
 if(n=="非交通专业"){
 

    $("#xp_pro + .combo").hide();
    $("#d").show();
    $("#xp_pro").removeAttr("name");
   $("#xp_pro1").attr("name","xpPro");
 }else{

      $("#xp_pro + .combo").show();
   $("#d").hide();
    $("#xp_pro1").removeAttr("name");
   $("#xp_pro").attr("name","xpPro");
 }
 }
});
$("#sType").combobox({
onChange: function (n,o) {
  if(n=="职称确认"){
  
		 $("#gj1").remove();
		 $("#gj2").remove();
  }else{
         $("#sLevel").append("<option value='正高级' id='gj1'>正高级</option>");
         $("#sLevel").append("<option value='副高级' id='gj2'>副高级</option>");
  }
  }
});

$("#point").combobox({
onChange: function (n,o) {

 	 if(n=="其他"){
       $("#point_2").show();
       $("#point_a").attr("name","point");
       $("#point").removeAttr("name");
  }else{
  	  $("#point_2").hide();
  	   $("#point_a").removeAttr("name");
  	   $("#point").attr("name","point");
  }
  }
});
		
	</script>
	 <input name="activityId" id="activityId" type="hidden">
  <form id="fm" method="post" enctype="multipart/form-data">
 <input name="rowid" id="rowid" type="hidden">
    <div id="aa" class="easyui-accordion" style="height:250px;">   
       <div title="基本信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
   
	  <table class="table2">
      <tr>
      <td class="left">姓名</td>
      <td class="right"><input id ="name" name="name" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
      <td class="left">性别</td>
      <td class="right">
      <select class="easyui-combobox" data-options="required:true" id ="sex" name ="sex" style="width:135px;">   
	  <option value="男">男</option>
	  <option value="女">女</option>
	  </select>
      <!-- <input id ="sex" name="sex" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"> --></td>
      </tr>
     <!--  <tr>
     <td class="left">身份证号</td>
      <td class="right"><input class="easyui-textbox" id="pnum" name="pnum" size="20" data-options="required:true,editable:false" style="height:22px"></td>
       <td class="left">出生年月</td>
      <td class="right"><input class="easyui-datetimebox" id="birthDate" name="birthDate" size="20" data-options="required:true" style="height:22px"></td>
      </tr>-->
     
      <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox" id="workName" name="workName"  size="20" data-options="required:true"  style="height:22px"></td>
       <td class="left">参加工作时间</td>
      <td class="right"><input class="easyui-datetimebox" id="workTime2Str"  name="workTime2Str" size="20" data-options="required:true,editable:false"  style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">单位属性</td>
      <td class="right"><input class="easyui-textbox" id="dPoint" name="dPoint" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox" id="adr" name="adr" size="20"  style="height:22px"></td>
      </tr>
       <tr>
      <td class="left">专业技术职务</td>
      <td class="right"><input class="easyui-textbox" id="technical" name="technical" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox" id="email" name="email" size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">证书编号</td>
      <td class="right"><input class="easyui-textbox" id="zNo" name="zNo" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">手机</td>
      <td class="right"><input  maxlength="11" class="easyui-numberbox" id="tel" name="tel"   size="20" data-options="required:true" ></td>
      </tr>
      
        <tr>
        
         <td class="left">身份证</td>
      <td class="right"><input class="easyui-textbox" id="pnum" name="pnum"  size="20" readonly="readonly" style="height:22px"></td>
        
      <td class="left">出生年月</td>
      <td class="right"><input id="birthDate" class="easyui-datetimebox" name="birthDate" size="20" data-options="required:true,editable:false"  style="height:22px" /></td>
           </tr>
      
       <tr>
      <td class="left">民族</td>
      <td class="right">
      <select id="mz" name ="mz"  class="easyui-combobox"  style="width:135px;" data-options="required:true">
										<option value="请选择">请选择</option>
										<option value="汉族">汉族</option>
										<option value="壮族">壮族</option>
										<option value="满族">满族</option>
										<option value="回族">回族</option>
										<option value="苗族">苗族</option>
										<option value="维吾尔族">维吾尔族</option>
										<option value="土家族">土家族</option>
										<option value="彝族">彝族</option>
										<option value="蒙古族">蒙古族</option>
										<option value="藏族 ">藏族</option>
										<option value="布依族">布依族</option>
										<option value="侗族">侗族</option>
										<option value="瑶族">瑶族</option>
										<option value="朝鲜族">朝鲜族</option>
										<option value="白族">白族</option>
										<option value="哈尼族">哈尼族</option>
										<option value="哈萨克族">哈萨克族</option>
										<option value="黎族">黎族</option>
										<option value="傣族">傣族</option>
										<option value="畲族">畲族</option>
										<option value="傈僳族">傈僳族</option>
										<option value="仡佬族 ">仡佬族</option>
										<option value="东乡族">东乡族</option>
										<option value="高山族">高山族</option>
										<option value="拉祜族">拉祜族</option>
										<option value="水族">水族</option>
										<option value="佤族">佤族</option>
										<option value="纳西族">纳西族</option>
										<option value="羌族">羌族</option>
										<option value="土族">土族</option>
										<option value="仫佬族">仫佬族</option>
										<option value="锡伯族">锡伯族</option>
										<option value="柯尔克孜族">柯尔克孜族</option>
										<option value="达斡尔族">达斡尔族</option>
										<option value="景颇族">景颇族</option>
										<option value="毛南族">毛南族</option>
										<option value="撒拉族">撒拉族</option>
										<option value="塔吉克族">塔吉克族</option>
										<option value="阿昌族">阿昌族</option>
										<option value="普米族">普米族</option>
										<option value="鄂温克族">鄂温克族</option>
										<option value="怒族">怒族</option>
										<option value="京族">京族</option>
										<option value="基诺族">基诺族</option>
										<option value="德昂族">德昂族</option>
										<option value="保安族 ">保安族</option>
										<option value="俄罗斯族">俄罗斯族</option>
										<option value="裕固族">裕固族</option>
										<option value="乌兹别克族">乌兹别克族</option>
										<option value="门巴族">门巴族</option>
										<option value="鄂伦春族">鄂伦春族</option>
										<option value="独龙族">独龙族</option>
										<option value="塔塔尔族">塔塔尔族</option>
										<option value="赫哲族">赫哲族</option>
										<option value="珞巴族">珞巴族</option>
										<option value="布朗族">布朗族</option>

								</select>
      </td>
      <td class="left">单位所属地区</td>
      <td class="right"><input class="easyui-textbox" id="formPlace" name="formPlace"  size="20" style="height:22px" data-options="required:true"></td>
      </tr>
      
       <tr>
      <td class="left">取得时间</td>
      <td class="right"><input id="getTime" class="easyui-datetimebox" name="getTime" size="20" data-options="required:true,editable:false"  style="height:22px" /></td>
      <td class="left">邮政编码</td>
      <td class="right"><input class="easyui-numberbox" id="zipCode" name="zipCode"  size="20"  style="height:22px"></td>
      </tr>
        <tr>
      <td class="left">固定电话</td>
      <td class="right"><input class="easyui-textbox" id="gTel" name="gTel"  size="20"  style="height:22px"></td>
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-numberbox" id="qq" name="qq"  size="20"  style="height:22px"></td>
      </tr>
      
      </table>  
	 
      </div>   
   
       </div>

        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="学习经历" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="xxjlGrid" ></table>
              <div id="xxjltb">
				<a onclick="openExperienceAddDialog(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a> 
				<a onclick="DelExperience(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				</div>
              
              </div>
              </div>

        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="工作经历" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="gzjlGrid"> </table>
               <div id="gzjltb">
				<a onclick="openExperienceAddDialog(1)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a> 
				<a onclick="DelExperience(1)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				</div>
              </div>
              </div>
              
        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="继续教育" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="xxjyGrid"> </table>
               <div id="jxjltb">
					<a onclick="openExperienceAddDialog(2)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a> 
					<a onclick="DelExperience(2)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				</div>
              </div>
              </div>     
              
        <div id="aa" class="easyui-accordion" style="height:200px;">   
       <div title="申报论文" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
              <table id="sblwGrid"> </table>
              <div id="sblwtb">
					<a onclick="openExperienceAddDialog(3)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addLwzzFuc();">新增</a> 
					<a onclick="DelExperience(3)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				</div>
              </div>
              </div>  
              
       <div id="aa" class="easyui-accordion" style="height:310px;">   
       <div title="申报信息 " data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
	 
	   <table class="table2">
	   
	   <tr>
      
		  <td class="left">现专业技术职务</td>
		  <td class="right"><input id ="curPos" name="curPos" class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
		    <td class="left">现聘专业</td>
      <td class="right">
     			 <select class="easyui-combobox" id="zType" name="zType"  style="width:135px;">
								<option value="交通专业">交通专业</option>
								<option value="非交通专业">非交通专业</option>
							</select>
      </td>
      </tr>
      <tr>
      
      <td class="left">聘任时间</td>
      <td class="right"><input id="prDate" name="prDate" class="easyui-datetimebox" size="20"  data-options="required:true" style="height:22px"></td>
      <td class="left">现聘专业类别</td>
      <td class="right">
      
      <select class="easyui-combobox" id="xp_pro" name="xp_pro">
								<option value="交通运输工程">交通运输工程</option>
								<option value="汽车运输工程">汽车运输工程</option>
								<option value="船舶运输工程">船舶运输工程</option>
								<option value="道路与桥梁">道路与桥梁</option>
								<option value="隧道工程（含地质勘测）">隧道工程（含地质勘测）</option>
								<option value="港口及航道工程（含地质勘探、航标）">港口及航道工程（含地质勘探、航标）</option>
								<option value="交通通讯与导航技术">交通通讯与导航技术</option>
								<option value="交通安全监督（含救捞）">交通安全监督（含救捞）</option>
								<option value="筑养路设备应用与管理">筑养路设备应用与管理</option>
								<option value="港航设备应用与管理">港航设备应用与管理</option>
					</select>
      <div id="d"><input class="easyui-textbox"  id="xp_pro1" type="text" name="xpPro" /></div>
      </td>
      </tr>
      <tr>
      <td class="left">聘任年限</td>
      <td class="right"><input class="easyui-textbox" id="pTime" name="pTime" size="20"  style="height:22px"></td>
       <td class="left">外语是否免试</td>
      <td class="right">
		<input type="checkbox" class="regular-checkbox" id="isOther" name="isOther" value="是">
      </tr>
      <tr>
      <td class="left">现从事何专业技术工作</td>
      <td class="right"><input class="easyui-textbox" id="workNow" name="workNow" size="20"   style="height:22px"></td>
       <td class="left">获现资格以来完成继续教育总学时</td>
      <td class="right"><input class="easyui-numberbox" id="workTime" name="workTime" size="20" data-options="required:true"  style="height:22px"></td>
      </tr>
      <tr>
       <td class="left">申报类别</td>
       <td class="right">	<select class="easyui-combobox" id="sType" name="sType" style="width:135px;">
								<option value="职称评审">职称评审</option>
								<option value="职称确认">职称确认</option>
							</select>
	  </td>
	  <td class="left">申报级别</td>
      <td class="right">	<select class="easyui-combobox" id="sLevel" name="sLevel" style="width:135px;">
								<option value="初级">初级</option>
								<option value="中级">中级</option>
								<option value="副高级" id="gj2">副高级</option>
								<option value="正高级" id="gj1">正高级</option>
								
							</select></td>
      </tr>
      <tr>
      
      <td class="left">申报资格名称</td>
      <td class="right"><input class="easyui-textbox" id="sName" name="sName"  size="20" data-options="required:true" style="height:22px"></td>
      
       <td class="left">申报属性</td>
      <td class="right">
      
      	<label style="width:92px"><input  type="radio" class="regular-radio" id="sId1" name="sId" checked="checked" value="正常晋升"/><i></i> 正常晋升</label><label style="width:64px"><input type="radio" id="sId2" class="regular-radio" name="sId" value="破格"/><i></i> 破格</label>
       <!--  <input class="easyui-textbox" id="sId" name="sId" size="20" data-options="required:true" style="height:22px"></td> --> 
      </tr>
       <tr>
     
      <td class="left">现档案存放单位</td>
      <td class="right">
      <select id="point" name="point"  class="easyui-combobox">
								<option value="福建省交通人才服务中心">福建省交通人才服务中心</option>
								<option value="其他">其他</option>
							</select>
     <div id="point_2"> <input id="point_a" class="easyui-textbox" name="point1"  size="20" /></div>
     <!-- <input class="easyui-textbox" id="point" name="point" size="20" data-options="required:true" style="height:22px"> --> </td>
      
        <td class="left">行政职务</td>
		  <td class="right"><input class="easyui-textbox" id="xzPos" name="xzPos" size="20"  style="height:22px"></td>
      </tr>
      <tr>
		 <td class="left">申报专业</td>
		  <td class="right"><input class="easyui-textbox" id="sPro" name="sPro" size="20" data-options="required:true" style="height:22px"></td>
		  <td class="left">外语成绩</td>
		  <td class="right"><input class="easyui-textbox"  name="jscore" id="jscore" /></td>
      </tr>
	  <tr>
		  <td class="left">附件材料</td>
		  <td class="right"><input  data-options="buttonText:'选择文件'" class="easyui-filebox" id="file" name="file" size="20" style="width:135px;height:22px" >
		 
		  </td> 
	 	  <td class="left"></td>
     	 <td class="right"> <input class="easyui-textbox" id="url" name="url" size="20" style="width:240px;height:22px"></td>
      </tr>
       <tr>
      <td class="left">备注</td>
      <td class="right"><input class="easyui-textbox" id="wRemark" name="wRemark" size="20" data-options="multiline:true"  style="width:240px;height:62px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
       <tr>
      <td class="left">年度考核</td>
      <td class="right"><input class="easyui-textbox" id="yearK" name="yearK" size="20" data-options="required:true,multiline:true" style="width:240px;height:62px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      </table> 

      </div>
      </div>   
	
  	  </form>   
    <div id="experienceDialog" style="align:center"></div>
</body>

</html>
