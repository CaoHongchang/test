<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
 <%@ include file="/system/common.jsp" %>
<html>
<head>
<title>人员材料修改</title>
<script type="text/javascript" src="<%=basePath%>js/staticData.js"></script>
<body>
<script type="text/javascript">


$(document).ready(function(){
    
    fill_select("da_mz",mz_arr)
    
    fill_select("da_marital_status",hyzk_arr)
    
    fill_select("da_zzmm",zzmm_arr)
    
    fill_select("da_degree",whcd_arr)
    
    fill_select("max_degree",whcd_arr)
});


//验证身份证格式
function IdentityCodeValid(code) { 
	var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
	var tip = "";
	var pass= true;

	//if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
		if(!code || !/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/i.test(code)){
		tip = "身份证号格式错误";
		$("#da_pnum").focus();
		pass = false;
	}

	else if(!city[code.substr(0,2)]){
		tip = "地址编码错误";
		$("#da_pnum").focus();
		pass = false;
	}
	else{
	/*
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
	  	tip = "身份证校验位错误";
	  	$("#da_pnum").focus();
	  	pass =false;
	  }
	}*/
}
if(!pass) alert(tip);
return pass;
}

var isSubmit=true;
function saveRyEdit(mid){
	if($('#da_create_date').datebox('getValue')!=''&&!Date_Validation($('#da_create_date').datebox('getValue'))){
	$.messager.alert('系统提示','建档时间格式错误，请检查');
	return;
	}
	if($('#da_out_date').datebox('getValue')!=''&&!Date_Validation($('#da_out_date').datebox('getValue'))){
	$.messager.alert('系统提示','退休时间格式错误，请检查');
	return;
	}
	if($('#da_sp_date').datebox('getValue')!=''&&!Date_Validation($('#da_sp_date').datebox('getValue'))){
	$.messager.alert('系统提示','审批时间格式错误，请检查');
	return;
	}
	if($('#da_work_time').datebox('getValue')!=''&&!Date_Validation($('#da_work_time').datebox('getValue'))){
	$.messager.alert('系统提示','工作年限格式错误，请检查');
	return;
	}
	if($('#max_graduation_time').datebox('getValue')!=''&&!Date_Validation($('#max_graduation_time').datebox('getValue'))){
	$.messager.alert('系统提示','最高学历毕业时间格式错误，请检查');
	return;
	}
	if($('#da_graduation_time').datebox('getValue')!=''&&!Date_Validation($('#da_graduation_time').datebox('getValue'))){
	$.messager.alert('系统提示','第一学历毕业时间格式错误，请检查');
	return;
	}
	if($('#da_birthday').datebox('getValue')!=''&&!Date_Validation($('#da_birthday').datebox('getValue'))){
	$.messager.alert('系统提示','出生日期时间格式错误，请检查');
	return;
	}
	//必填项：档案类别，姓名，身份证，民族，文化程度，录入人和录入时间
	  //var da_dtype = $("#ryxxEditFm input[name='da_dtype']").combobox('getValue');
	   if($('input:radio[name=human_out]:checked').val()=="on"){
	   

	       if($("#ryxxEditFm input[name='human_out1']").val()==""||$("#ryxxEditFm input[name='human_out1']").val()==null){
	       
	           alert("请输入人事外包单位!");
	           return;
	       }
	   }
	    if($('input:radio[name=da_is_s]:checked').val()=="on"){
	       if($("#ryxxEditFm input[name='da_is_s1']").val()==""||$("#ryxxEditFm input[name='da_is_s1']").val()==null){
	        alert("请输入派遣单位!");
	           return;
	       }
	   }
	    if($('input:radio[name=da_is_dl]:checked').val()=="on"){
	    if($("#ryxxEditFm input[name='da_is_dl1']").val()==""||$("#ryxxEditFm input[name='da_is_dl1']").val()==null){
	        alert("请输入代理单位!");
	           return;
	       }
	   }
	  var da_name = $("#ryxxEditFm input[name='da_name']").val();
	  var da_pnum = $("#ryxxEditFm input[name='da_pnum']").val();
	  if(da_pnum!=""){
	    if (!IdentityCodeValid(da_pnum)) {  

			return;
		}
	  }
	  var da_mz = $("#ryxxEditFm input[name='da_mz']").val();
	  var da_degree = $("#ryxxEditFm input[name='da_degree']").val();
	  if( da_name != "" &&  da_name != null
			 
			  && da_mz != "" && da_mz != null 
			  && da_degree != "" &&  da_degree != null){
		  var ryData= $("#ryxxEditFm").serialize();
		  var gzjlData=JSON.stringify($('#gzjlTableGrid').datagrid('getData'));
		  var jypxData=JSON.stringify($('#jypxTableGrid').datagrid('getData'));
		  var zypxData=JSON.stringify($('#zypxTableGrid').datagrid('getData'));
		  var jlqkData=JSON.stringify($('#jlqkTableGrid').datagrid('getData'));
		  var zwzcData=JSON.stringify($('#zwzcTableGrid').datagrid('getData'));
		  
		  if(!isSubmit){
		  	return ;
		  }
		  isSubmit=false;
		  
		  $.ajax({
			url:'<%=request.getContextPath()%>/userInfoTrol/updateUserInfo',
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    data: {"ryData" : ryData,
				"gzjlData" : gzjlData,
				"jypxData" : jypxData,
				"zypxData" : zypxData,
				"zwzcData" : zwzcData,
				"jlqkData" : jlqkData,
				"mid":mid,
				"isUpdateIsState":0//是否更新档案状态
				},   //参数值
		    type: "POST",   //请求方式
		    success: function(data) {
		    	 isSubmit=true;
				if(data.flag == true){
					$.messager.alert('系统提示','修改成功，修改后的档案号为'+data.dpno);
					  $('#daxxEditInfo').dialog('destroy');
	  				$("#daxxglGrid").datagrid("reload",{
									key:data.dpno
									});
				
				//	window.location.reload();
		  			}else{
			        	 $.messager.alert('系统提示','修改失败：'+data.cause);
				    }
		    },
		    error: function() {
		    	isSubmit=true;
		        //请求出错处理
		    }
		});
	  }else{
	  		isSubmit=true;
		  alert('档案类型为必填项，请补全!');
      }
}
<%-- var uid = "<%=request.getParameter("uid").toString()%>"; --%>

/*  $(function(){
 
	
	 
 }); */



//工作简历新增
 function addgzjlFuc(){
 $('#gzjlAddInfo').dialog({
     title: '工作简历新增',
     width: 650,
     height: 450,
     closed: false,
     cache: false,
     href: 'gzjlAdd.jsp',
     modal: true,
     buttons:[{
 				text:'保存',
 				iconCls:'icon-ok',
 				handler:function(){
 				if($("#start_date").textbox('getValue')>$("#end_date").textbox('getValue')){
 				alert("开始时间不能大于结束时间！");
 				return;
 				}
 				if($("#enterprise_id").textbox('getValue').length>50){
 				alert("所在单位长度不能超过50位！");
 				return;
 				} 
 				
 				if($("#department_id").textbox('getValue').length>50){
 				alert("所在部门长度不能超过50位！");
 				return;
 				}
 				
 				if($("#place_id").textbox('getValue').length>50){
 				alert("岗位名称长度不能超过50位！");
 				return;
 				}
 				
 				if($("#workName").textbox('getValue').length>150){
 				alert("工作描述长度不能超过150位！");
 				return;
 				}
 				
					    	 $.ajax({
						    		url:'<%=request.getContextPath()%>/userInfoTrol/saveWorkInfo',
						    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
						    	    data: {
						    			'daPnum': $("#da_dpno2").val(),
						                'placeId': $("#place_id").val(),
						                'departmentId': $("#department_id").val(),
						                'enterpriseId': $("#enterprise_id").val(),
						                'startDate': $("#start_date").datebox('getValue'),
						                'endDate': $("#end_date").datebox('getValue'),
						                'workName':$("#workName").textbox('getValue')
						            },
						    	    type: "POST",   //请求方式
						    	    success: function(data) {
							            if(data.flag == true){
							            	$('#gzjlAddInfo').dialog('close');
							            	 $.messager.alert('系统提示','新增成功！');
							            	 $("#gzjlTableGrid").datagrid("reload");
							            	 
								        }else{
								        	 $.messager.alert('系统提示','新增失败：'+data.cause);
									    }
						    	    },
						    	    error: function() {
						    	        //请求出错处理
						    	    }
					 	  });
 				}
 			},{
 				text:'关闭',
 				iconCls:'icon-cancel',
 				handler:function(){
 				$('#gzjlAddInfo').dialog('close');
 				}
 			}],
     iconCls: 'icon-save',
     onLoad: function () {
     } //loadEnd
 });
 }
 //修改工作简历
 function updateGzjl(){
 	var selectedRows = $("#gzjlTableGrid").datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}
 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}
 	
 	var row = selectedRows[0];
 	$('#gzjlEidtInfo').dialog({
 	    title: '工作简历修改',
 	    width: 650,
 	    height: 350,
 	   
 	    closed: false,
 	    cache: false,
 	    href: 'gzjlEdit.jsp',
 	    modal: true,
 	    buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){debugger 
 				if($("#edit_start_date").textbox('getValue')>$("#edit_end_date").textbox('getValue')){
 				alert("开始时间不能大于结束时间！");
 				return;
 				}
 				if($("#edit_enterprise_id").textbox('getValue').length>50){
 				alert("所在单位长度不能超过50位！");
 				return;
 				} 
 				
 				if($("#edit_department_id").textbox('getValue').length>50){
 				alert("所在部门长度不能超过50位！");
 				return;
 				}
 				
 				if($("#edit_place_id").textbox('getValue').length>50){
 				alert("岗位名称长度不能超过50位！");
 				return;
 				}
 				
 				if($("#workName").textbox('getValue').length>150){
 				alert("工作描述长度不能超过150位！");
 				return;
 				}
						$.ajax({
				    		url:'<%=request.getContextPath()%>/userInfoTrol/updateWorkInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				                'id': row.id,
				                'placeId': $("#edit_place_id").val(),
				                'departmentId': $("#edit_department_id").val(),
				                'enterpriseId': $("#edit_enterprise_id").val(),
				                'startDate': $("#edit_start_date").datebox('getValue'),
				                'endDate': $("#edit_end_date").datebox('getValue'),
				                'da_dpno':$("#da_dpno").val(),
				                'workName':$("#workName").textbox('getValue')
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	 $.messager.alert('系统提示','修改成功！');
					            	 $("#gzjlTableGrid").datagrid("reload");
					            	 $('#gzjlEidtInfo').dialog('close');
						        }else{
						        	 $.messager.alert('系统提示','修改失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			    	  });
 					}
 		     	 },{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 					$('#gzjlEidtInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {
 	   
 		$("#editWorkInfoFm").form('load',row);
 		var odpno=$('#da_dpno').textbox('getValue');
 		
 		
 		$('#editWorkInfoFm input[name=da_dpno]').val(odpno);
 		$('#editWorkInfoFm input[name=startDate]').val(row.startDate);
 		$('#editWorkInfoFm input[name=endDate]').val(row.endDate);
 		$('#editWorkInfoFm input[name=enterpriseId]').val(row.enterpriseId);
 		$('#editWorkInfoFm input[name=departmentId]').val(row.departmentId);
 		$('#editWorkInfoFm input[name=placeId]').val(row.placeId);
 		$('#editWorkInfoFm input[name=workName]').val(row.workName);
  	    } //loadEnd
 	});
 }
 /*删除工作简历*/
 function deleteGzjl(){
     var row = $('#gzjlTableGrid').datagrid('getSelections');
     var l = row.length;
     if(l == 0){
 		$.messager.alert('系统提示','请选择一条要失效的数据！');
 		return;
 	}
     $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
        	 var strIds=[];
        	 for(var i=0;i<l;i++){
        			strIds.push(row[i].id);
        	 }
        	var deleteIds = strIds.join(",");
         	$.ajax({
	    		url:'<%=request.getContextPath()%>/userInfoTrol/disabledWorkInfo',
	    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    	    data: {
	                'deleteIds': deleteIds
	            },
	    	    type: "POST",   //请求方式
	    	    success: function(data) {
		            if(data.flag == true){
		            	 $.messager.alert('系统提示','删除成功！');
		            	 $("#gzjlTableGrid").datagrid("reload");
			        }else{
			        	 $.messager.alert('系统提示','删除失败：'+data.cause);
				    }
	    	    },
	    	    error: function() {
	    	        //请求出错处理
	    	    }
    	  });
     });
 }

//教育培训新增
 function addjypxFuc(){
 	$('#jypxAddInfo').dialog({
 	    title: '教育培训新增',
 	    width: 650,
 	    height: 400,
 	   
 	    closed: false,
 	    cache: false,
 	    href: 'jypxAdd.jsp',
 	    modal: true,
 	     buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){
 					if($("#school_name").val().length>30){
 					alert("学校名称不能超过30字！");
 					return;
 					}
 					/*
 					if($("#in_date").val()>=$("#graduation_date").val()){
 					alert("入学日期不能大于毕业日期");
 					return;
 					}
 					*/
 					
 					
 					if($("#certificate").val().length>30){
 					alert("证书名称不能超过30字！");
 					return;
 					}
 					
 					var v = document.getElementById("school_name").value;
 					alert(v)
 						/* alert($("#da_dpno").textbox('getValue'))
 						alert($("#study_type_id").combobox('getValue'))
 						alert( $("#school_name").textbox('getValue'))
 						alert($("#in_date").datebox('getValue'))
 						alert( $("#graduation_date").datebox('getValue'))
 						alert($("#education").combobox('getValue'))
 						alert($("#degree").combobox('getValue'))
 						alert($("#certificate").textbox('getValue'))
 						alert($("#major").textbox('getValue')) */
 						
 						
   				                  $.ajax({
   							    		url:'<%=request.getContextPath()%>/userInfoTrol/saveStudyInfo',
   							    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
   							    	    data: {
   							    	    	//'daPnum':$("#da_dpno").textbox('getValue'),
   							    	    	'daPnum': $("#da_dpno2").val(),
   							    			 'studyTypeId' :  $("#study_type_id").combobox('getValue'),
       				     					 'schoolName' : $("#school_name").textbox('getValue'),
       				     					 'inDate' : $("#in_date").datebox('getValue'),
       				     				     'graduationDate' : $("#graduation_date").datebox('getValue'),
       				     				     'education' : $("#education").combobox('getValue'),
       				     				     'degree' : $("#degree").combobox('getValue'),
       				     				     'certificate' : $("#certificate").textbox('getValue'),
       				     				     'major' : $("#major").textbox('getValue')
   							            },
   							    	    type: "POST",   //请求方式
   							    	    success: function(data) {
   								            if(data.flag == true){
   								            	$('#jypxAddInfo').dialog('close');
   								            	 $.messager.alert('系统提示','新增成功！');
   								            	 $("#jypxTableGrid").datagrid("reload");
   								            	 
   									        }else{
   									        	 $.messager.alert('系统提示','新增失败：'+data.cause);
   										    }
   							    	    },
   							    	    error: function() {
   							    	        //请求出错处理
   							    	    }
   						 	  }); 
 						
 					}
 				},{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 					$('#jypxAddInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {
 	    } //loadEnd
 	});
 }

 function  deleteJypx(){
     var row = $('#jypxTableGrid').datagrid('getSelections');
     var l = row.length;
     if(l == 0){
 		$.messager.alert('系统提示','请选择一条要失效的数据！');
 		return;
 	   }
     $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
        
        	 var strIds=[];
        	 for(var i=0;i<l;i++){
        			strIds.push(row[i].id);
        	 }
        	var deleteIds = strIds.join(",");
         	$.ajax({
	    		url:'<%=request.getContextPath()%>/userInfoTrol/disabledStudyInfo',
	    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    	    data: {
	                'deleteIds': deleteIds
	            },
	    	    type: "POST",   //请求方式
	    	    success: function(data) {
		            if(data.flag == true){
		            	 $.messager.alert('系统提示','删除成功！');
		            	 $("#jypxTableGrid").datagrid("reload");
			        }else{
			        	 $.messager.alert('系统提示','删除失败：'+data.cause);
				    }
	    	    },
	    	    error: function() {
	    	        //请求出错处理
	    	    }
    	  });
     });
 }
 //修改教育培训信息
 function  editJypx(){
 	var selectedRows = $("#jypxTableGrid").datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}
 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}
 	
 	var row = selectedRows[0];
 	$('#jypxEditInfo').dialog({
 	    title: '教育培训修改',
 	    width: 650,
 	    height: 350,
 	    closed: false,
 	    cache: false,
 	    href: 'jypxEdit.jsp',
 	    modal: true,
 	    buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){debugger;
 					if($("#edit_school_name").textbox('getValue').length>30){
 					alert("学校名称不能超过30字！");
 					return;
 					}
 					/*
 					//console.log("入学日期"+$("#edit_in_date").val());
 					//console.log("毕业日期"+$("#edit_graduation_date").val());
 					if($("#edit_in_date").val()>=$("#edit_graduation_date").val()){
 					alert("入学日期不能大于毕业日期");
 					return;
 					}
 					*/
 					console.log($("#edit_education").combobox('getValue'));
 					if($("#edit_certificate").textbox('getValue').length>30){
 					alert("证书名称不能超过30字！");
 					return;
 					}
 					 	 $.ajax({
 				    		url:'<%=request.getContextPath()%>/userInfoTrol/updateStudyInfo',
 				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
 				    	    data: {
 				                'id': row.id,
 				                'studyTypeId' : $("#edit_study_type_id").combobox('getValue'),
		     					 'schoolName' : $("#edit_school_name").textbox('getValue'),
		     					 'inDate' : $("#edit_in_date").datebox('getValue'),
		     				     'graduationDate' : $("#edit_graduation_date").datebox('getValue'),
		     				     'education' : $("#edit_education").combobox('getValue'),
		     				     'degree' : $("#edit_degree").combobox('getValue'),
		     				     'certificate' : $("#edit_certificate").val(),
		     				       'da_dpno':$("#da_dpno").textbox('getValue'),
		     				       'major':$("#edit_major").textbox('getValue')
		     				     
 				            },
 				    	    type: "POST",   //请求方式
 				    	    success: function(data) {
 					            if(data.flag == true){
 					            	 $.messager.alert('系统提示','修改成功！');
 					            	 $("#jypxTableGrid").datagrid("reload");
 					            	 $('#jypxEditInfo').dialog('close');
 						        }else{
 						        	 $.messager.alert('系统提示','修改失败：'+data.cause);
 							    }
 				    	    },
 				    	    error: function() {
 				    	        //请求出错处理
 				    	    }
 			    	  });
 					}
 		     	 },{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 					$('#jypxEditInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {debugger;
 	    	   $("#jypxEidtFm").form('load',row);
 	 			var odpno=$('#da_dpno2').val();
 	 			$('#edit_major').textbox('setValue',row.major);
 	 		$('#jypxEidtFm input[name=da_dpno]').val(odpno);
 	 		 $('#edit_degree').textbox('setValue',row.degree);
 			 $('#edit_education').textbox('setValue',row.education); 
 	    } //loadEnd
 	});
 }

 //职业培训新增
 function addzypxFuc(){
 $('#zypxAddInfo').dialog({
     title: '职业培训新增',
     width: 650,
     height: 450,
    
     closed: false,
     cache: false,
     href: 'zypxAdd.jsp',
     modal: true,
      buttons:[{
 				text:'保存',
 				iconCls:'icon-ok',
 				handler:function(){
 				
 				if($("#trainingUnit").val().length>30){
 				alert("培训单位长度不超过30位");
 				return;
 				}
 				
 				if(!Zno_Validation($("#trainno").val())){
 				alert("证书编号只能由数字和字母组成，且长度不超过30位！");
 				return;
 				}
 				
 				if($("#office").val().length>30){
 				alert("发证机关长度不超过30位");
 				return;
 				}
		 	      	 	$.ajax({
				    		url:'<%=request.getContextPath()%>/userInfoTrol/saveStudyUpInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				    			'daPnum': $("#da_dpno2").val(),
				    			'trainingUnit' : $("#trainingUnit").val(),
			      				 'trainDate' : $("#traindate").datebox('getValue'),
			      				 'outDate' : $("#outdate").datebox('getValue'),
			      				 'officeDate' : $("#officedate").datebox('getValue'),
			  				     'office' : $("#office").val(),
			  				     'trainNo' : $("#trainno").val()
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	$('#zypxAddInfo').dialog('close');
					            	 $.messager.alert('系统提示','新增成功！');
					            	 $("#zypxTableGrid").datagrid("reload");
					            	 
						        }else{
						        	 $.messager.alert('系统提示','新增失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			 	  });
 				}
 			},{
 				text:'关闭',
 				iconCls:'icon-cancel',
 				handler:function(){
 				$('#zypxAddInfo').dialog('close');
 				}
 			}],
     iconCls: 'icon-save',
     onLoad: function () {
     } //loadEnd
 });
 }
 //职业培训修改
 function editZypxFuc(){

 	var selectedRows = $("#zypxTableGrid").datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}
 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}
 	
 	var row = selectedRows[0];
 	$('#zypxEditInfo').dialog({
 	    title: '职业培训修改',
 	    width: 650,
 	    height: 350,
 	   
 	    closed: false,
 	    cache: false,
 	    href: 'zypxEdit1.jsp',
 	    modal: true,
 	    buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){
 					if($("#edit_trainingUnit").val().length>30){
	 				alert("培训单位长度不超过30位");
	 				return;
	 				}
	 				
	 				if(!Zno_Validation($("#edit_trainno").val())){
	 				alert("证书编号只能由数字和字母组成，且长度不超过30位！");
	 				return;
	 				}
	 				
	 				if($("#edit_office").val().length>30){
	 				alert("发证机关长度不超过30位");
	 				return;
	 				}
 					 	 $.ajax({
 				    		url:'<%=request.getContextPath()%>/userInfoTrol/updateStudyUpInfo',
 				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
 				    	    data: {
 				                'id': row.id,
 				                 'daPnum': $("#da_dpno2").val(),
 				                 'trainingUnit' : $("#edit_trainingUnit").val(),
			      				 'trainDate' : $("#edit_traindate").datebox('getValue'),
			      				 'outDate' : $("#edit_outdate").datebox('getValue'),
			      				 'officeDate' : $("#edit_officedate").datebox('getValue'),
			  				     'education' : $("#edit_office").val(),
			  				     'office' : $("#edit_office").val(),
			  				     'trainNo' : $("#edit_trainno").val(),
			  				       'da_dpno':$("#da_dpno2").val()
 				            },
 				    	    type: "POST",   //请求方式
 				    	    success: function(data) {
 					            if(data.flag == true){
                                     $('#zypxEditInfo').dialog('close');
 					            	 $.messager.alert('系统提示','修改成功！');
 					            	 $("#zypxTableGrid").datagrid("reload");					            	 
 						        }else{
 						        	 $.messager.alert('系统提示','修改失败：'+data.cause);
 							    }
 				    	    },
 				    	    error: function() {
 				    	        //请求出错处理
 				    	    }
 			    	  });
 					}
 		     	 },{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 						$('#zypxEditInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {
 			$("#zypxEdit1Fm").form('load',row);
 				var odpno=$('#da_dpno').textbox('getValue');
 		$('#zypxEdit1Fm input[name=da_dpno]').val(odpno);
            load_row = row
 	    } //loadEnd
 	});
 }
var load_row = null;
 function  deleteZypx(){
 	   var row = $('#zypxTableGrid').datagrid('getSelections');
 	      var l = row.length;
 	      if(l == 0){
 	  		$.messager.alert('系统提示','请选择一条要失效的数据！');
 	  		return;
 	  	}
 	      $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
 	          
 	         	 var strIds=[];
 	         	 for(var i=0;i<l;i++){
 	         			strIds.push(row[i].id);
 	         	 }
 	         	var deleteIds = strIds.join(",");
 	          	$.ajax({
 	 	    		url:'<%=request.getContextPath()%>/userInfoTrol/disabledStudyUpInfo',
 	 	    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
 	 	    	    data: {
 	 	                'deleteIds': deleteIds
 	 	            },
 	 	    	    type: "POST",   //请求方式
 	 	    	    success: function(data) {
 	 		            if(data.flag == true){
 	 		            	 $.messager.alert('系统提示','删除成功！');
 	 		            	 $("#zypxTableGrid").datagrid("reload");
 	 			        }else{
 	 			        	 $.messager.alert('系统提示','删除失败：'+data.cause);
 	 				    }
 	 	    	    },
 	 	    	    error: function() {
 	 	    	        //请求出错处理
 	 	    	    }
 	     	  });
 	      });
 }

 //职务职称新增
 function addzwzcFuc(){
 $('#zwzcAddInfo').dialog({
     title: '职务职称新增',
     width: 650,
     height: 350,
    
     closed: false,
     cache: false,
     href: 'zwzcAdd.jsp',
     modal: true,
      buttons:[{
 				text:'保存',
 				iconCls:'icon-ok',
 				handler:function(){
 				if($("#pro_z_name").val().length>30){
 				alert("专业技术资格名称长度不超过30位！");
 				return;
 				}
 				if($("#pro_name").val().length>30){
 				alert("专业名称长度不超过30位！");
 				return;
 				}
 				if($("#department_id").val().length>30){
 				alert("审批部门长度不超过30位！");
 				return;
 				}
 				if(!Pzmo_Validation($("#pz_no").val())){
 				alert("审批文号只允许输入数字，字母以及（）号，且长度不超过30位！");
 				return;
 				}
 				 	  $.ajax({
 				 	  
				    		url:'<%=request.getContextPath()%>/userInfoTrol/saveOfficialInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				    	    	
				    			'daPnum': $("#da_dpno2").val(),
				    			 'p_level' : $("#p_level").combobox('getValue'),
	 							 'pro_z_name' : $("#pro_z_name").val(),
	 							 'pz_date1' : $("#pz_date1").datebox('getValue'),
	 							 'p_method' : $("#p_method").combobox('getValue'),
	 						     'pro_name' : $("#pro_name").val(),
	 						     'department_id' : $("#department_id").val(),
	 						     'pz_no' : $("#pz_no").val() 
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	$('#zwzcAddInfo').dialog('close');
					            	 $.messager.alert('系统提示','新增成功！');
					            	 $("#zwzcTableGrid").datagrid("reload");
					            	 
						        }else{
						        	 $.messager.alert('系统提示','新增失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			 	  });
 				}
 			},{
 				text:'关闭',
 				iconCls:'icon-cancel',
 				handler:function(){
 				$('#zwzcAddInfo').dialog('close');
 				}
 			}],
     iconCls: 'icon-save',
     onLoad: function () {
     } //loadEnd
     

 });
 }


 //奖励情况新增
 function addjlqkFuc(){
 $('#jlqkAddInfo').dialog({
     title: '奖励情况新增',
     width: 650,
     height: 450,
    
     closed: false,
     cache: false,
     href: 'jlqkAdd.jsp',
     modal: true,
      buttons:[{
 				text:'保存',
 				iconCls:'icon-ok',
 				handler:function(){
 			     if($("#reward_name").val().length>30){
				alert("奖惩名称长度不超过30位！");
				return;
				}
				if($("#en_name").val().length>30){
				alert("奖惩批准机构长度不超过30位！");
				return;
				}
				alert( $("#reward_name").val())
 				 	 $.ajax({
				    		url:'<%=request.getContextPath()%>/userInfoTrol/saveRewardsInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				    			'daPnum': $("#da_dpno2").val(),
				    			'reward_name' : $("#reward_name").val(),
	 					 		'en_name' : $("#en_name").val(),
	 						 	'pz_date' : $("#pz_date").datebox('getValue'),
	 						 	'cx_date' : $("#cx_date").datebox('getValue') 
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	$('#jlqkAddInfo').dialog('close');
					            	 $.messager.alert('系统提示','新增成功！');
					            	 $("#jlqkTableGrid").datagrid("reload");
					            	 
						        }else{
						        	 $.messager.alert('系统提示','新增失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			 	  });
 				}
 			},{
 				text:'关闭',
 				iconCls:'icon-cancel',
 				handler:function(){
 				 $('#jlqkAddInfo').dialog('close');
 				}
 			}],
     iconCls: 'icon-save',
     onLoad: function () {
     } //loadEnd
 });
 }
 //奖励情况修改
 function editjlqkFuc(){
 	
 	var selectedRows = $("#jlqkTableGrid").datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}
 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}
 	var row = selectedRows[0];
 	$('#jlqkEditInfo').dialog({
 	    title: '奖励情况修改',
 	    width: 650,
 	    height: 450,
 	   
 	    closed: false,
 	    cache: false,
 	    href: 'jlqkEdit.jsp',
 	    modal: true,
 	    buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){
 	    		if($("#edit_reward_name").val().length>30){
				alert("奖惩名称长度不超过30位！");
				return;
				}
				if($("#edit_en_name").val().length>30){
				alert("奖惩批准机构长度不超过30位！");
				return;
				}
  					 	$.ajax({
				    		url:'<%=request.getContextPath()%>/userInfoTrol/updateRewardsInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				                'id': row.id,
				                'reward_name' : $("#edit_reward_name").val(),
						 		  'en_name' : $("#edit_en_name").val(),
							 	  'pz_date' : $("#edit_pz_date").datebox('getValue'),
							 	  'cx_date' : $("#edit_cx_date").datebox('getValue'),
							 	    'da_dpno':$("#da_dpno").val()
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	 $.messager.alert('系统提示','修改成功！');
					            	 $("#jlqkTableGrid").datagrid("reload");
					            	 $('#jlqkEditInfo').dialog('close');
						        }else{
						        	 $.messager.alert('系统提示','修改失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			    	  });
  					 	 
 					}
 				},{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 						$('#jlqkEditInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {
 		$("#editJlqkFm").form('load',row);
 				var odpno=$('#da_dpno').textbox('getValue');
 		$('#editJlqkFm input[name=da_dpno]').val(odpno);
 	    } //loadEnd
 	});
 	}
 //职务职称修改
 function editzwzcFuc(){
 	var selectedRows = $("#zwzcTableGrid").datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}
 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}
 	var row = selectedRows[0];
 	
 	$('#zwzcEditInfo').dialog({
 	    title: '职务职称修改',
 	    width: 650,
 	    height: 350,
 	   
 	    closed: false,
 	    cache: false,
 	    href: 'zwzcEdit.jsp',
 	    modal: true,
 	    buttons:[{
 					text:'保存',
 					iconCls:'icon-ok',
 					handler:function(){debugger
				if($("#edit_pro_z_name").val().length>30){
 				alert("专业技术资格名称长度不超过30位！");
 				return;
 				}
 				if($("#edit_pro_name").val().length>30){
 				alert("专业名称长度不超过30位！");
 				return;
 				}
 				if($("#edit_department_id").val().length>30){
 				alert("审批部门长度不超过30位！");
 				return;
 				}
 				if(!Pzmo_Validation($("#edit_pz_no").val())){
 				alert("审批文号只允许输入数字，字母以及（）号，且长度不超过30位！");
 				return;
 				}

 				 	 $.ajax({
				    		url:'<%=request.getContextPath()%>/userInfoTrol/updateOfficialInfo',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				                'id': row.id,
				                'p_level' : $("#edit_p_level").combobox('getValue'),
	 							'pro_z_name' : $("#edit_pro_z_name").val(),
	 							 'pz_date1' : $("#edit_pz_date1").datebox('getValue'),
	 							 'p_method' : $("#edit_p_method").combobox('getValue'),
	 						     'pro_name' : $("#edit_pro_name").val(),
	 						     'department_id' : $("#edit_department_id").val(),
	 						    'pz_no' : $("#edit_pz_no").val(),
	 						      'da_dpno':$("#da_dpno").val()
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
					            if(data.flag == true){
					            	 $.messager.alert('系统提示','修改成功！');
					            	 $("#zwzcTableGrid").datagrid("reload");
					            	 $('#zwzcEditInfo').dialog('close');
						        }else{
						        	 $.messager.alert('系统提示','修改失败：'+data.cause);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
			    	  });
 					}
 		     	 },{
 					text:'关闭',
 					iconCls:'icon-cancel',
 					handler:function(){
 					$('#zwzcEditInfo').dialog('close');
 					}
 				}],
 	    iconCls: 'icon-save',
 	    onLoad: function () {
 		$("#zwzcEidtFm").form('load',row);
 			var odpno=$('#da_dpno').textbox('getValue');
 		$('#zwzcEidtFm input[name=da_dpno]').val(odpno);
 	    }  
 	});
 }
 //删除职务职称
 function  deleteZwzc(){
     var row = $('#zwzcTableGrid').datagrid('getSelections');
     var l = row.length;
     if(l == 0){
 		$.messager.alert('系统提示','请选择一条要失效的数据！');
 		return;
 	}
     $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
         
        	 var strIds=[];
        	 for(var i=0;i<l;i++){
        			strIds.push(row[i].id);
        	 }
        	var deleteIds = strIds.join(",");
         	$.ajax({
	    		url:'<%=request.getContextPath()%>/userInfoTrol/disabledOfficialInfo',
	    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    	    data: {
	                'deleteIds': deleteIds
	            },
	    	    type: "POST",   //请求方式
	    	    success: function(data) {
		            if(data.flag == true){
		            	 $.messager.alert('系统提示','删除成功！');
		            	 $("#zwzcTableGrid").datagrid("reload");
			        }else{
			        	 $.messager.alert('系统提示','删除失败：'+data.cause);
				    }
	    	    },
	    	    error: function() {
	    	        //请求出错处理
	    	    }
    	  });
     });
 }
 //删除奖励情况
 function  deleteJlqk(){
      var row = $('#jlqkTableGrid').datagrid('getSelections');
      var l = row.length;
      if(l == 0){
  		$.messager.alert('系统提示','请选择一条要失效的数据！');
  		return;
  	 }
      $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
          
         	 var strIds=[];
         	 for(var i=0;i<l;i++){
         			strIds.push(row[i].id);
         	 }
         	var deleteIds = strIds.join(",");
          	$.ajax({
 	    		url:'<%=request.getContextPath()%>/userInfoTrol/disabledRewardsInfo',
 	    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
 	    	    data: {
 	                'deleteIds': deleteIds
 	            },
 	    	    type: "POST",   //请求方式
 	    	    success: function(data) {
 		            if(data.flag == true){
 		            	 $.messager.alert('系统提示','删除成功！');
 		            	 $("#jlqkTableGrid").datagrid("reload");
 			        }else{
 			        	 $.messager.alert('系统提示','删除失败：'+data.cause);
 				    }
 	    	    },
 	    	    error: function() {
 	    	        //请求出错处理
 	    	    }
     	  });
      });
 }

 function setUrlSrc(url){
	 $("#showPic").attr("src","/jtrc/typeInfo/getPicByPath?path=" + encodeURIComponent(url));
 }

//检查图片的格式是否正确,同时实现预览   
	function setImagePreview(obj) {
		if (obj.value == '') {           
			 alert("请选择选择要上传的附件!");            
		     return false;        
	    }else {
	    	 var filepath = $("input[name='idFile']").val();
	         var extStart = filepath.lastIndexOf(".");
	         var ext = filepath.substring(extStart, filepath.length).toUpperCase();
	         if (ext != ".PNG" && ext != ".JPG" && ext != ".GIF" && ext != ".TXT" && ext != ".DOC" && ext != ".DOCX") {
	             alert("附件限于txt,word,png,gif,jpg格式");
	             return false;
	         }
	         ajaxFileUpload();
	         return true;
	    }            
 }

	function ajaxFileUpload()  
 {  
  $.ajaxFileUpload({
      url:'/jtrc/typeInfo/fileUpload',               //需要链接到服务器地址
      secureuri:false,
      fileElementId:'idFile',                         //文件选择框的id属性
      dataType: 'text',                                     //服务器返回的格式，可以是json
      success: function (data, status)             //相当于java中try语句块的用法
      {   
  	    data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
          if(data.indexOf("2M") > 0){
              alert(data);
              return;
          }else{
              var list = data.split("\\");
              var i = list.length-1;
              var str = "<input type='hidden' name='img_url' value='"+list[i]+"' /><img width='250px' height='150px' id='showPic' src=''/>";
              $("#picTd").html(str);
              $("#showPic").attr("src","/jtrc/typeInfo/getPicByPath?path=" + encodeURIComponent(list[i]));
              $('#showPic').hover(function(e){
           	   var previewDiv=$("<div id=\"previewDiv\"><img src=\""+"/jtrc/typeInfo/getPicByPath?path=" + encodeURIComponent(list[i])+"\" width=\"600\" height=\"400\"></div>").appendTo(window.top.document.body);
           	   window.top.$('#previewDiv').css({
           		   'width':'600px',
           		   'height':'400px',
           		   'position':'relative',
           		   'left':e.pageX-600,
           		   'top':e.pageY,
           		   'z-index':999,
           		   'border':'1px solid #eee',
           		   'background-color':'#eee'
           	   });
           	   
            },function(){
           	   window.top.$('#previewDiv').remove();
            });
           }
      },
      error: function (data, status, e)             //相当于java中catch语句块的用法
      {
          $('#result').html('上传附件失败');
      }
    }
  );
}  
/*变化档案类型*/

$('#da_dtype_name').combobox(

{onSelect:function(n){
$('#da_dtype').val(n.value);
/*	var odpno=$('#da_dpno').textbox('getValue');
	//$('#da_dpno').textbox('setValue',n+odpno.substring(1));
	var odpno2=$('#da_dpno2').val();
	if(odpno2.substr(0,1)!=n.value){
     $.ajax({
                url: basePath+"userMgInfoTrol/maxDpno?dtype="+n.value,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
               	$('#da_dpno').textbox('setValue',data.rows.da_dpno);
				}else{
					  //$.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
	}else{
	$('#da_dpno').textbox('setValue',odpno2);
	}
	$('#da_dtype').val(n.value);
	
*/
}}
);

 function showDp(){
 
    if($('input:radio[name=human_out]:checked').val()=="on"){
       
         $("#point" ).css("display", "block");
    }else{
   		 $("#point" ).css("display", "none");
$('#human_out1').textbox('setValue',"");
    }
 }
 function showDp1(){
 
    if($('input:radio[name=da_is_s]:checked').val()=="on"){
       
         $("#point1" ).css("display", "block");
    }else{
   		 $("#point1" ).css("display", "none");
 	    $('#da_is_s1').textbox('setValue',"");
    }
 }
 function showDp2(){
 
    if($('input:radio[name=da_is_dl]:checked').val()=="on"){
       
         $("#point2" ).css("display", "block");
    }else{
   		 $("#point2" ).css("display", "none");
 		$('#da_is_dl1').textbox('setValue',"");
    }
 }
 function cm(){
 	
		//$().textbox('getValue')和$('#'+id).val() 获取的是旧值 
		var da_pnum = $(this).val();
 	
	    if(da_pnum!=""){
	    if (!IdentityCodeValid(da_pnum)) {  

			return;
		}
	  }
	  	var birthday = "";
		if(da_pnum != null && da_pnum != ""){
			if(da_pnum.length == 15){
				birthday = "19"+da_pnum.substr(6,6);
			} else if(da_pnum.length == 18){
				birthday = da_pnum.substr(6,8);
			}
		   
			birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");
			
		}
	  $("#da_birthday").textbox('setValue',birthday);
}
</script>

<form id="ryxxEditFm" method="post">
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:420px;">   
    <div title="基本信息" value="1" style="">   
        <div id="" class="easyui-accordion" style="height:960px;">   
        <table class="table2">
       <tr>
      <td class="left">档案类别</td>
      <td class="right">
      <input type="hidden" id="da_dtype" name="da_dtype" size="20"  style="height:22px">
       <select id="da_dtype_name" class="easyui-combobox" name="da_dtype_name" style="width:135px;"  data-options="required:true">   
		   <option value="B">档案保管</option>   
		   <option value="L">临时档案</option>  
		   <option value="D">代理档案</option>
		   <option value="C">单纯档案</option>  
		   <option value="T">退休</option>
		   <option value="W">待就业</option>
		   <option value="Y">意向档案</option>  
	   </select>
	  </td>
      <td class="left">原档案编号</td>
      <td class="right">
      <input type="hidden" id="da_dpno2" name="da_dpno2">
      <input class="easyui-textbox" name="da_dpno" readonly="readonly" id="da_dpno"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left" colspan="2" rowspan="6" id="picTd">
      <input type='hidden' name='img_url' id="img_url"/>
<!--       <img width='250px' height='150px' id='showPic' src=""/> -->
      </td>
      </tr>
       <tr>
      <td class="left">系统编码</td>
      <td class="right">
       <input class="easyui-textbox" id="da_pno" name="da_pno" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">人事外包</td>
      <td class="right" colspan="3" nowrap>
            <input type="radio" name="human_out"  value="on"  onclick="showDp()"/>是
            <input type="radio" name="human_out"   value="off" checked="checked" onclick="showDp()"/>否
            <div id="point" style="display: none" >
           <input class="easyui-textbox" id="human_out1"  name="human_out1" data-options="required:true"  size="20"  style="height:22px"/>
		    <label style="color:red">*填写外包单位名称</label>
		   </div>
           
           
      
      </td>
      </tr>
       <tr>
      <td class="left">姓名</td>
      <td class="right">
       <input class="easyui-textbox" id="da_name" name="da_name" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">曾用名</td>
      <td class="right" colspan="3" ><input class="easyui-textbox" id="da_old_name" name="da_old_name" size="20" style="height:22px"></td>
      
      </tr>
     
      <tr>
      <td class="left">性别</td>
      <td class="right"><input type="radio" name="da_sex" value="1" checked="checked" />男
                        <input type="radio" name="da_sex" value="0" />女</td>
     <td class="left">民族</td>
     <td class="right" colspan="3">
      <select id="da_mz" class="easyui-combobox"  data-options="required:true" name="da_mz" style="width:135px;">   
	    <option value="1">-汉-</option>  
	   </select>
      </td>
      </tr>
     
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input class="easyui-textbox" id="da_pnum" name="da_pnum" size="20"  style="height:22px" data-options="events:{blur:cm}"></td>
     <td class="left">出生日期</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_birthday" name="da_birthday" size="20" style="height:22px">
      </td>
      </tr>
       
      <tr>
      <td class="left">籍贯</td>
      <td class="right"><input class="easyui-textbox" id="da_jg_name" name="da_jg_name"  size="20" style="height:22px"></td>
     <td class="left">出生地</td>
     <td class="right" colspan="3">
      <input class="easyui-textbox"  id="da_domicile"  name="da_domicile" size="20" style="height:22px">
      </td>
      </tr>
       
        <tr>
      <td class="left">户口所在地</td>
      <td class="right"><input class="easyui-textbox"  id="da_domicile_place" name="da_domicile_place" size="20" style="height:22px"></td>
     <td class="left">政治面貌</td>
     <td class="right" colspan="3">
      <select id="da_zzmm" class="easyui-combobox" name="da_zzmm" style="width:200px;">   
	    <option value="0" selected="selected">-群众-</option> 
	    <option value="1">-中国共产党-</option>   
	   </select>
      </td>
      </tr>
      
      <tr>
      <td class="left">婚姻状况</td>
      <td class="right"> <select id="da_marital_status" class="easyui-combobox" name="da_marital_status" style="width:135px;">   
	   <option value="已婚">已婚</option>   
	   <option value="未婚">未婚</option>   
	   </select></td>
     <td class="left">第一学历</td>
     <td class="right" colspan="3">
      <select id="da_degree" class="easyui-combobox"  data-options="required:true" name="da_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
      
     
     
      <tr>
      <td class="left">是否派遣</td>
      <td class="right" nowrap>
      
      <input type="radio" name="da_is_s" value="on" onclick="showDp1()"/>是
                        <input type="radio" name="da_is_s"  value="off" checked="checked" onclick="showDp1()"/>否
                         <div id="point1" style="display: none" >
                          <input class="easyui-textbox"  id="da_is_s1" name="da_is_s1" data-options="required:true"  size="20"  style="height:22px"/>
							<label style="color:red">*填写派遣单位名称</label>
					   </div></td>
     <td class="left">单位代理</td>
      <td class="right" nowrap>
    
      <input type="radio" name="da_is_dl" value="on" onclick="showDp2()" />是
                        <input type="radio" name="da_is_dl" value="off" checked="checked" onclick="showDp2()"/>否
                           <div id="point2" style="display: none" >
                         <input class="easyui-textbox" id="da_is_dl1"  name="da_is_dl1" data-options="required:true"  size="20"  style="height:22px"/>
                         <label style="color:red">*填写代理单位名称</label>
						</div></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
       
      <tr>
      <td class="left">第一学历毕业院校</td>
      <td class="right" colspan="3"><input class="easyui-textbox"  id="da_school" name="da_school"  size="20" style="height:22px;width:500px;"></td>
      </td>
     <tr>
     <td class="left">第一学历毕业时间</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_graduation_time"  name="da_graduation_time" size="20" style="height:22px">
      </td>
      
      </tr>
      <tr>
      <td class="left">第一学历所学专业</td>
      <td class="right" ><input class="easyui-textbox" id="da_major" name="da_major" size="20" style="height:22px"></td>
       <td class="left">第一学历毕业证号</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="da_bpno" name="da_bpno"  size="20" style="height:22px"></td>
      </tr>
      
      
      <tr>
      <td class="left">最高学历</td>
     <td class="right">
      <select id="max_degree" class="easyui-combobox"  data-options="required:true" name="max_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
       <td class="left">最高学历毕业院校</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="max_school" name="max_school"  size="20" style="height:22px"></td>
     </tr>
     <tr>
     <td class="left">最高学历毕业时间</td>
     <td class="right" >
      <input class="easyui-datebox" id="max_graduation_time" name="max_graduation_time" size="20" style="height:22px">
      </td>
      <td class="left">最高学历所学专业</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="max_major" name="max_major" size="20" style="height:22px"></td>
      
      </tr>
      
      
      
       <tr>
     
      <td class="left">报到单位</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="da_bd_unit"  name="da_bd_unit" size="20" style="height:22px;width:500px;"></td>
      
      </tr>
      <tr>
      <td class="left">审批时间</td>
      <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_sp_date"  name="da_sp_date"  size="20" style="height:22px">
      </td>
      </tr>
     
       <tr>
      <td class="left">工作单位</td>
      <td class="right" colspan="3" ><input class="easyui-textbox" name="da_work_name"  id="da_work_name" size="20" style="height:22px;width:500px;"></td>
    </tr>
    <tr>
     <td class="left">工作年限</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_work_time" name="da_work_time"  size="20" style="height:22px">
      </td>
      </tr>
      <tr>
      <td class="left">单位地址</td>
      <td class="right"><input class="easyui-textbox" id="da_unit_adr" name="da_unit_adr"  size="20" style="height:22px"></td>
      <td class="left" >职务职称级别</td>
      <td class="right" colspan="3"><input class="easyui-textbox" id="da_ctype" name="da_ctype" size="20" style="height:22px"></td>
      </tr>
       
      <tr>
      <td class="left">职业资格证</td>
      <td class="right"><input class="easyui-textbox"  id="da_license" name="da_license" size="20" style="height:22px"></td>
       <td class="left">家庭电话</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_home_tel" id="da_home_tel" size="20" style="height:22px"></td>
      </tr>
      
       <tr>
     
      <td class="left">家庭地址</td>
      <td class="right"><input class="easyui-textbox" name="da_home_adr" id="da_home_adr" size="20" style="height:22px"></td>
       <td class="left">家庭地址邮编</td>
      <td class="right"><input class="easyui-textbox" name="da_home_post"  id="da_home_post"  size="20" style="height:22px"></td>
      </tr>
      
    
       <tr>
      <td class="left">本人联系电话1</td>
      <td class="right"><input class="easyui-textbox" name="da_tel" id="da_tel"  size="20" style="height:22px"></td>
      <td class="left">本人联系电话2</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_my_tel" id="da_my_tel"  size="20" style="height:22px"></td>
    
      </tr>
      <tr>
       <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox" name="da_my_adr" id="da_my_adr"  size="20" style="height:22px"></td>
       <td class="left">邮政编码</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_my_post" id="da_my_post"  size="20" style="height:22px"></td>
      </tr>
        
       <tr>
     
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-textbox" name="da_qq" id="da_qq" size="20" style="height:22px"></td>
       <td class="left">电子邮箱</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_email" id="da_email"  size="20" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">应急联系人</td>
      <td class="right"><input class="easyui-textbox" name="da_wife_name" id="da_wife_name" size="20" style="height:22px"></td>
      <td class="left">应急联系人电话</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_wife_tel" id="da_wife_tel"  size="20" style="height:22px"></td>
      
      </tr>
      
         <tr>
      <td class="left">建档时间</td>
      <td class="right">  <input class="easyui-datebox" name="da_create_date" id="da_create_date" size="20"  style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right" colspan="3">  <input class="easyui-datebox" name="da_out_date" id="da_out_date" size="20" style="height:22px"></td>
       
      </tr>
      
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> 
      <input type="hidden" name="da_pid" id="da_pid" value="<%= sessionUserId %>">
      <input class="easyui-textbox"  size="20" name="da_pname" id="da_pname" value="<%= sessionRealName %>"  data-options="editable:false" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datebox"  name="da_add_date" id="da_add_date" size="20" data-options="required:true,readonly:true" value="<%= new Date() %>"  style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="4"> <input class="easyui-textbox"  name="da_remark" id="da_remark"  size="20" data-options="multiline:true" style="height:60px;width: 430px"></td>
  
      </tr>
      
      </table>  
   
       </div>
          
    </div>   
    <div title="工作简历" data-options="" style="">   
		    <div id="gzjlTool"  style="background-color:#FFFFFF;">
		    	<a onclick="addgzjlFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增工作简历</a>
				<a onclick="updateGzjl()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改工作简历</a>
				<a onclick="deleteGzjl()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除工作简历</a>
				<table id="gzjlTableGrid"></table> 
			</div>
			<div id="gzjlAddInfo"></div>
			<div id="gzjlEidtInfo"></div>
          
    </div>
    <div title="教育培训" data-options="" style="">   
             <div id="jypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addjypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增教育培训</a>
				<a onclick="editJypx()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改教育培训</a>
				<a onclick="deleteJypx()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除教育培训</a>
				<table id="jypxTableGrid"></table> 
			</div>
			<div id="jypxAddInfo"></div>
			<div id="jypxEditInfo"></div>
    </div>
    <div title="职业培训" data-options="" style="">   
               <div id="zypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addzypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增培训经历</a>
				<a onclick="editZypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改培训经历</a>
				<a onclick="deleteZypx();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除培训经历</a>
				<table id="zypxTableGrid"></table> 
			</div>
			<div id="zypxAddInfo"></div>
			<div id="zypxEditInfo"></div>
    </div> 
    <div title="职务职称" data-options="" style="">   
             <div id="zwzcTool"  style="background-color:#FFFFFF;">
				<a onclick="addzwzcFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增职务职称</a>
				<a onclick="editzwzcFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改职务职称</a>
				<a onclick="deleteZwzc();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除职务职称</a>
				<table id="zwzcTableGrid"></table> 
			</div>
			<div id="zwzcAddInfo"></div>
       		<div id="zwzcEditInfo"></div>
            
    </div> 
    <div title="奖励情况" data-options="" style="">   
             <div id="jlqkTool"  style="background-color:#FFFFFF;">
             	<a onclick="addjlqkFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增奖励情况</a>
				<a onclick="editjlqkFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改奖励情况</a>
				<a onclick="deleteJlqk();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除奖励情况</a>
				<table id="jlqkTableGrid"></table> 
			</div>
			<div id="jlqkAddInfo"></div>
			<div id="jlqkEditInfo"></div>
    </div>   
</div>  
</form>		
</body>

</html>
