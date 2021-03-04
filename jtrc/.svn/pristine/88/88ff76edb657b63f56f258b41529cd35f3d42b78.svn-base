<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
 <%@ include file="/system/common.jsp" %>
 
<html>
<head>
<title>档案信息新增</title>
<script type="text/javascript" src="<%=basePath%>js/staticData.js"></script>
<body>

<script type="text/javascript">



function saveRyAdd(){
	 saveJbxx();
}

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
	  //18位身份证需要验证最后一位校验位
	  /*
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
function saveJbxx(){
	
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
	 
	   if($('input:radio[name=human_out]:checked').val()=="on"){
	       if($("#ryxxAddFm input[name='human_out1']").val()==""||$("#ryxxAddFm input[name='human_out1']").val()==null){
	       
	           alert("请输入人事外包单位!");
	           return;
	       }
	   }
	    if($('input:radio[name=da_is_s]:checked').val()=="on"){
	       if($("#ryxxAddFm input[name='da_is_s1']").val()==""||$("#ryxxAddFm input[name='da_is_s1']").val()==null){
	        alert("请输入派遣单位!");
	           return;
	       }
	   }
	    if($('input:radio[name=da_is_dl]:checked').val()=="on"){
	    if($("#ryxxAddFm input[name='da_is_dl1']").val()==""||$("#ryxxAddFm input[name='da_is_dl1']").val()==null){
	        alert("请输入代理单位!");
	           return;
	       }
	   }
	   
	   
	            
	            
	  var da_dtype = $("#da_dtype").combobox('getValue');
	  var da_name = $("#da_name").val();
	  var da_pnum = $("#da_pnum").val();
	    if(da_pnum!=""){
	    if (!IdentityCodeValid(da_pnum)) {  

			return;
		}
	  }
	  var da_mz = $("#da_mz").val();
	  var da_degree = $("#da_degree").val();
	  if(da_dtype != null && da_dtype != "" && da_name != "" &&  da_name != null
			  
			  && da_mz != "" && da_mz != null 
			  && da_degree != "" &&  da_degree != null){
	
		  var ryData= $("#ryxxAddFm").serialize();
		  var gzjlData=JSON.stringify($('#gzjlTableGrid').datagrid('getData'));
		  var jypxData=JSON.stringify($('#jypxTableGrid').datagrid('getData'));
		  var zypxData=JSON.stringify($('#zypxTableGrid').datagrid('getData'));
		  var jlqkData=JSON.stringify($('#jlqkTableGrid').datagrid('getData'));
		  var zwzcData=JSON.stringify($('#zwzcTableGrid').datagrid('getData'));
		  
		  if(!isSubmit){
		  	return ;
		  }
		  isSubmit=false;
		  debugger;
		  $.ajax({
	  		url:'<%=request.getContextPath()%>/userInfoTrol/saveUserInfo',
	  	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	  	    data: {"ryData" : ryData,
				"gzjlData" : gzjlData,
				"jypxData" : jypxData,
				"zypxData" : zypxData,
				"zwzcData" : zwzcData,
				"jlqkData" : jlqkData
				},   //参数值
	  	    type: "POST",   //请求方式
	  	    success: function(data) {
	  	    	isSubmit=true;
	  			if(data.flag == true){
	  			//邓祯
	  			
	  				window.top.da_jg_name=$('#da_jg_name').textbox('getValue');
	  			    $.messager.alert('系统提示','保存成功，档案号为'+data.dpno);
	  			   $('#daxxAddInfo').dialog('destroy');
	  				confirm("保存成功，档案号为"+data.dpno);
	  				/* $.messager.alert('系统提示','保存成功，档案号为'+data.dpno,info,function(){
	  						$('#daxxAddInfo').dialog('close');
	  					}); 
	  				alert("保存成功，档案号为"+data.dpno); */
	  				
	   				$.confirm({
        title: '确认',
        content:data.dpno ,
        type: 'green',
        icon: 'glyphicon glyphicon-question-sign',
        buttons: {
            ok: {
                text: '确认',
                btnClass: 'btn-primary',
            },
            cancel: {
                text: '取消',
                btnClass: 'btn-primary'
            }
        }
    }); 
	  				
	  				
	  				
	  				$("#daxxglGrid").datagrid("reload",{
									key:data.dpno
									});
	  				
		  		}else{
			         $.messager.alert('系统提示','新增失败：'+data.cause);
			          $.messager.alert('系统提示','新增失败：'+data.cause,info,function(){
			          });
			          alert("新增失败："+data.cause);
				}
	  	    },
	  	    error: function() {
	  	    isSubmit=true;
	  	        //请求出错处理
	  	    }
	  	});
	  }else{
	   isSubmit=true;
	   $.messager.alert('系统提示','档案类别为必填项，请补全!');
	   $.messager.alert('系统提示','档案类别为必填项，请补全!',info,function(){
	   });
	   alert("档案类别为必填项，请补全!");
	  }
}

/*删除工作简历*/
function deleteGzjl(){
    var row = $('#gzjlTableGrid').datagrid('getSelected');
    $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
        if (data) {
        	 var rowIndex = $('#gzjlTableGrid').datagrid('getRowIndex', row);
        	 $('#gzjlTableGrid').datagrid('deleteRow', rowIndex);  
        }
        //else {
            //alert("否");
       // }
    });
}


//工作简历新增
function addgzjlFuc(){
	$('<div></div>').dialog({
    title: '工作简历新增',
    width: 650,
    height: 430,
    closed: false,
    cache: false,
    id:'gzjlAddInfo',
    href: 'gzjlAdd.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){debugger 
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
		           var data=$('#gzjlTableGrid').datagrid('getData');
			  	   var index = data.total+1;
          	        $('#gzjlTableGrid').datagrid('appendRow',
	     				   {id : index, 
          	        	     start_date : $("#start_date").datebox('getValue'),
          	        	     end_date : $("#end_date").datebox('getValue'),
	     					 enterprise_id : $("#enterprise_id").val(),
	     					 department_id : $("#department_id").val(),
	     					 place_id : $("#place_id").val(),
	     					 workName:$("#workName").val()
	     				    
  					});
	                
	                $('#gzjlAddInfo').dialog('destroy');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				
				$('#gzjlAddInfo').dialog('destroy');
				}
			}],
    iconCls: 'icon-save',
    onClose:function(){
    	$('#gzjlAddInfo').dialog('destroy');
    },
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
                                //追加新的进去
                              
                                var data=$('#gzjlTableGrid').datagrid('getData');
			  	   				var index = data.total+1;
				      	 	    $('#gzjlTableGrid').datagrid('appendRow',
				  				   {id : index, 
		          	        	     start_date : $("#edit_start_date").datebox('getValue'),
		          	        	     end_date : $("#edit_end_date").datebox('getValue'),
			     					 enterprise_id : $("#edit_enterprise_id").val(),
			     					 department_id : $("#edit_department_id").val(),
			     					 place_id : $("#edit_place_id").val(),
			     					 workName:$("#workName").val()
   			     					});
				      	 	 //删除编辑的行
							   
	    					   var rowIndex = $('#gzjlTableGrid').datagrid('getRowIndex', row);
       	 					   $('#gzjlTableGrid').datagrid('deleteRow', rowIndex); 
					 	   	   $('#gzjlEidtInfo').dialog('close');
					 	   	
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
 		var odpno=$('#da_dpno').val();
 		
 		
 		$('#editWorkInfoFm input[name=da_dpno]').val(odpno);
 		$('#edit_enterprise_id').textbox('setValue',row.enterprise_id);
 		$('#edit_department_id').textbox('setValue',row.department_id);
 		$('#edit_place_id').textbox('setValue',row.place_id);
 		$('#edit_start_date').datebox('setValue',row.start_date);
 		$('#edit_end_date').datebox('setValue',row.end_date);
 		$('#workName').textbox('setValue',row.workName);
 		 
 		
	    } //loadEnd
	});
}
//教育培训新增
function addjypxFuc(){
	
  
    $('<div></div>').dialog({
	    title: '教育培训新增',
	    width: 650,
	    height: 400,
	    id : 'newDialog',
	    closed: false,
	    cache: false,
	    href: 'jypxAdd.jsp',
	    modal: true,
	     buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
					if($("#school_name").textbox('getValue').length>30){
 					alert("学校名称不能超过30字！");
 					return;
 					}
 					/*
 					if($("#in_date").val()>=$("#graduation_date").val()){
 					alert("入学日期不能大于等于毕业日期");
 					return;
 					}
 					*/
 					
 					if($("#certificate").textbox('getValue').length>30){
 					alert("证书名称不能超过30字！");
 					return;
 					}
							  	   var data=$('#jypxTableGrid').datagrid('getData');
							  	   var index = data.total+1;
    	                    	  $('#jypxTableGrid').datagrid('appendRow',
   				     				   {id : index, 
   			     				         studyTypeId : $('#study_type_id').combobox('getValue'),
   				     					 schoolName : $("#school_name").textbox('getValue'),
   				     					 inDate : $("#in_date").datebox('getValue'),
   				     				     graduationDate : $("#graduation_date").datebox('getValue'),
   				     				 	education : $("#education").combobox('getValue'),
   				     				     degree : $("#degree").combobox('getValue'),
   				     				     certificate : $("#certificate").textbox('getValue'),
   				     				     major : $("#major").textbox('getValue')
   			     					});
   				               
    	                    	  $("#newDialog").dialog('destroy');

				                  
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
				
						$("#newDialog").dialog('destroy');

					}
				}],
	    iconCls: 'icon-save',
	    onClose:function(){
	    	$('#newDialog').dialog('destroy');
	    },
	    onLoad: function () {
	     //  $('#jypxAddInfo').tabs('select', 0);    
	    } //loadEnd
	});
}

function  deleteJypx(){
	 var row = $('#jypxTableGrid').datagrid('getSelected');
	        $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
	            if (data) {
	            	 var rowIndex = $('#jypxTableGrid').datagrid('getRowIndex', row);
	            	 $('#jypxTableGrid').datagrid('deleteRow', rowIndex);  
	            }
	            //else {
	               // alert("否");
	            //}
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
					if($("#edit_school_name").val().length>30){
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
 					if($("#edit_education").combobox('getValue').length>30){
 					alert("学历不能超过30字！");
 					return;
 					}
 					
 					if($("#edit_degree").combobox('getValue').length>30){
 					alert("学位不能超过30字！");
 					return;
 					}
 					
 					if($("#edit_certificate").textbox('getValue').length>30){
 					alert("证书名称不能超过30字！");
 					return;
 					}
							 //追加新的进去
                             var data=$('#jypxTableGrid').datagrid('getData');
						  	 var index = data.total+1;
				      	 	    $('#jypxTableGrid').datagrid('appendRow',
				  				   {id : index, 
   			     				         studyTypeId : $("#edit_study_type_id").combobox('getValue'),
   				     					 schoolName : $("#edit_school_name").textbox('getValue'),
   				     					 inDate : $("#edit_in_date").datebox('getValue'),
   				     				     graduationDate : $("#edit_graduation_date").datebox('getValue'),
   				     				     education : $("#edit_education").combobox('getValue'),
   				     				     degree : $("#edit_degree").combobox('getValue'),
   				     				     certificate : $("#edit_certificate").textbox('getValue'),
   				     				     major : $("#edit_major").textbox('getValue')
   			     					});
				      	 	//删除编辑的行
    					   var rowIndex = $('#jypxTableGrid').datagrid('getRowIndex', row);
      	 				   $('#jypxTableGrid').datagrid('deleteRow', rowIndex); 
					 	   $('#jypxEditInfo').dialog('close');
					
					}
		     	 },{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#jypxEditInfo').dialog('close');
					
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	    
	
	    $("#jypxEidtFm").form('load',row);
 			var odpno=$('#da_dpno').val();
 			$('#edit_major').textbox('setValue',row.major);
 		$('#jypxEidtFm input[name=da_dpno]').val(odpno);
 		$('#edit_study_type_id').combobox('setValue',row.studyTypeId);
 		$('#edit_school_name').textbox('setValue',row.schoolName);
 		 $('#edit_in_date').datebox('setValue',row.inDate);
 		
 		 
 		 $('#edit_degree').textbox('setValue',row.degree);
		 $('#edit_education').textbox('setValue',row.education);
		 
		 
 		 $('#edit_graduation_date').datebox('setValue',row.graduationDate);
   				     				     
	    } //loadEnd
	});
}

//职业培训新增
function addzypxFuc(){
$('<div></div>').dialog({
    title: '职业培训新增',
    width: 650,
    height: 450,
     id:'zypxAddInfo',
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
    	        
		    	   var data=$('#zypxTableGrid').datagrid('getData');
		    	   var index = data.total+1;
	      	 	   $('#zypxTableGrid').datagrid('appendRow',
	  				   {id : index, 
	      				 trainingUnit : $("#trainingUnit").val(),
	      				 trainDate : $("#traindate").datebox('getValue'),
	      				 outDate : $("#outdate").datebox('getValue'),
	      				 officeDate : $("#officedate").datebox('getValue'),
	  				     education : $("#office").val(),
	  				     office : $("#office").val(),
	  				     trainNo : $("#trainno").val()
						});
	      	 	$('#zypxAddInfo').dialog('destroy');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
			
				$('#zypxAddInfo').dialog('destroy');
				}
			}],
			 onClose:function(){
			    	$('#zypxAddInfo').dialog('destroy');
			    },
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
	    href: 'zypxEdit.jsp',
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
                          //追加新的进去
                           var data=$('#zypxTableGrid').datagrid('getData');
    	   				   var index = data.total+1;
			      	 	   $('#zypxTableGrid').datagrid('appendRow',
			  				   {id : index, 
			      				 trainingUnit : $("#edit_trainingUnit").val(),
			      				 trainDate : $("#edit_traindate").datebox('getValue'),
			      				 outDate : $("#edit_outdate").datebox('getValue'),
			      				 officeDate : $("#edit_officedate").datebox('getValue'),
			  				     education : $("#edit_office").val(),
			  				     office : $("#edit_office").val(),
			  				     trainNo : $("#edit_trainno").val()
								});
				      	 	//删除编辑的行
    					   var rowIndex = $('#zypxTableGrid').datagrid('getRowIndex', row);
   	 					   $('#zypxTableGrid').datagrid('deleteRow', rowIndex); 
					 	   $('#zypxEditInfo').dialog('close');
					 	  
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
 		var odpno=$('#da_dpno').val();
 		$('#zypxEdit1Fm input[name=da_dpno]').val(odpno);
         $('#edit_trainingUnit').textbox('setValue',row.trainingUnit);
         $('#edit_traindate').datebox('setValue',row.trainDate);
         $('#edit_outdate').datebox('setValue',row.outDate);
         $('#edit_officedate').datebox('setValue',row.officeDate);
         $('#edit_trainno').textbox('setValue',row.trainNo);
         $('#edit_office').textbox('setValue',row.office);

	    } //loadEnd
	});
}

function  deleteZypx(){
	 var row = $('#zypxTableGrid').datagrid('getSelected');
	        $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
	            if (data) {
	            	 var rowIndex = $('#zypxTableGrid').datagrid('getRowIndex', row);
	            	 $('#zypxTableGrid').datagrid('deleteRow', rowIndex);  
	            }
	            else {
	                alert("否");
	            }
	        });
	
}

//职务职称新增
function addzwzcFuc(){
$('<div></div>').dialog({
    title: '职务职称新增',
    width: 650,
    height: 350,
    id:'zwzcAddInfo',
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
			    	 	
			    	
				  	    var data=$('#zwzcTableGrid').datagrid('getData');
				  	    var index = data.total+1;
				  	    //alert($("#p_level").val());
				 	    $('#zwzcTableGrid').datagrid('appendRow',
						   {id : index, 
				 	    	 p_level : $("#p_level").combobox('getValue'),
							 pro_z_name : $("#pro_z_name").val(),
							 pz_date1 : $("#pz_date1").datebox('getValue'),
							 p_method : $("#p_method").combobox('getValue'),
						     pro_name : $("#pro_name").val(),
						     department_id : $("#department_id").val(),
						     pz_no : $("#pz_no").val()
							});
				 	 	$('#zwzcAddInfo').dialog('destroy');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				
				$('#zwzcAddInfo').dialog('destroy');
				}
			}],
    iconCls: 'icon-save',
    onClose:function(){
    	$('#zwzcAddInfo').dialog('destroy');
    },
    onLoad: function () {
    } //loadEnd
    

});
}


//奖励情况新增
function addjlqkFuc(){
 $('<div></div>').dialog({
    title: '奖励情况新增',
    width: 650,
    height: 450,
    id:'jlqkAddInfo',
    closed: false,
    cache: false,
    href: 'jlqkAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){debugger
				if($("#reward_name").val().length>30){
				alert("奖惩名称长度不超过30位！");
				return;
				}
				if($("#en_name").val().length>30){
				alert("奖惩批准机构长度不超过30位！");
				return;
				}
				  	   var data=$('#jlqkTableGrid').datagrid('getData');
				  	   var index = data.total+1;
				 	   $('#jlqkTableGrid').datagrid('appendRow',
						   {id : index, 
					 		  reward_name : $("#reward_name").val(),
					 		  en_name : $("#en_name").val(),
						 	  pz_date : $("#pz_date").datebox('getValue'),
						 	  cx_date : $("#cx_date").datebox('getValue')
							});
				 	 
				 	 $('#jlqkAddInfo').dialog('destroy');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				
				 $('#jlqkAddInfo').dialog('destroy');
				}
			}],
    iconCls: 'icon-save',
    onClose:function(){
    	$('#jlqkAddInfo').dialog('destroy');
    },
    onLoad: function () {
    } //loadEnd
});
}
//奖励情况修改
function editjlqkFuc(){
	debugger;
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
				    	   var index = $("#jlqkTableGrid").datagrid('getRowIndex', row);
				           $('#jlqkTableGrid').datagrid('deleteRow', index);
				           var data = $('#jlqkTableGrid').datagrid('getData');
					  	   index = data.total+1;
 					 	   $('#jlqkTableGrid').datagrid('appendRow',
							   {id : index, 
						 		  reward_name : $("#edit_reward_name").val(),
						 		  en_name : $("#edit_en_name").val(),
							 	  pz_date : $("#edit_pz_date").datebox('getValue'),
							 	  cx_date : $("#edit_cx_date").datebox('getValue')
								});
 					 	 
 					 	 $('#jlqkEditInfo').dialog('close');
 					 	
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
 				var odpno=$('#da_dpno').val();
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
					handler:function(){
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
					
		               var data=$('#zwzcTableGrid').datagrid('getData');
				  	   var index = data.total+1;
				 	   $('#zwzcTableGrid').datagrid('appendRow',
						   {id : index, 
				 	    	 p_level : $("#edit_p_level").combobox('getValue'),
							 pro_z_name : $("#edit_pro_z_name").val(),
							 pz_date1 : $("#edit_pz_date1").datebox('getValue'),
							 p_method : $("#edit_p_method").combobox('getValue'),
						     pro_name : $("#edit_pro_name").val(),
						     department_id : $("#edit_department_id").val(),
						     pz_no : $("#edit_pz_no").val()
							});
				 	   var index = $("#zwzcTableGrid").datagrid('getRowIndex', row);
		               $('#zwzcTableGrid').datagrid('deleteRow', index);
				 	   $('#zwzcEditInfo').dialog('close');
				 	  
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
 			var odpno=$('#da_dpno').val();
 		$('#zwzcEidtFm input[name=da_dpno]').val(odpno);
	    }  
	});
}
//删除职务职称
function  deleteZwzc(){
	 var row = $('#zwzcTableGrid').datagrid('getSelected');
	        $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
	            if (data) {
	            	 var rowIndex = $('#zwzcTableGrid').datagrid('getRowIndex', row);
	            	 $('#zwzcTableGrid').datagrid('deleteRow', rowIndex);  
	            }
	            else {
	                alert("否");
	            }
	        });
	
}
//删除奖励情况
function  deleteJlqk(){
	 var row = $('#jlqkTableGrid').datagrid('getSelected');
	        $.messager.confirm("操作提示", "您确定要删除操作吗？", function (data) {
	            if (data) {
	            	 var rowIndex = $('#jlqkTableGrid').datagrid('getRowIndex', row);
	            	 $('#jlqkTableGrid').datagrid('deleteRow', rowIndex);  
	            }
	            else {
	                alert("否");
	            }
	        });
	
}
$(document).ready(function(){

	
 	//$("#inputId").val(sessionRealName);
    
    fill_select("da_mz",mz_arr)
    
    fill_select("da_marital_status",hyzk_arr)
    
    fill_select("da_zzmm",zzmm_arr)
    
    fill_select("da_degree",whcd_arr)
        
    fill_select("max_degree",whcd_arr)
    
    $("#da_dtype").combobox({

	 onSelect: function (n) {

	  /*    $.ajax({  
				type: "post",  
				cache: false,  
				url: "../userMgInfoTrol/getNextDpno?s="+n,  
				data: "",  
				success: function (result) {  
				   $('#da_dpno').val(n + result);
				  
				}  
			}); */ 
			  $.ajax({
                url: basePath+"userMgInfoTrol/maxDpno?dtype="+n.value,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
               	$('#da_dpno').val(data.rows.da_dpno);
				}else{
					  //$.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   //$.messager.alert('错误','操作失败！','error');

                }
            });
			
			
	  $.ajax({  
		type: "post",  
		cache: false,  
		url: "../userMgInfoTrol/getNextPno",  
		data: "",  
		success: function (result) {  
		   $('#da_pno').val(result);
		}  
	});   
	 }
 });

 $.ajax({  
		type: "post",  
		cache: false,  
		url: "../userMgInfoTrol/getNextPno",  
		data: "",  
		success: function (result) {  
		   $('#da_pno').val(result);
		}  
	});  
	
     //$.parser.parse();
     
	  //工作简历
	$('#gzjlTableGrid').datagrid({    
    url : '',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,width:100,align:'center'},
        {field:'start_date',title:'起始时间',width:100,align:'center'},    
        {field:'end_date',title:'终止时间',width:100,align:'center'},
        {field:'enterprise_id',title:'所在单位',width:100,align:'center'},
        {field:'department_id',title:'所在部门',width:100,align:'center'},
        {field:'place_id',title:'岗位名称',width:100,align:'center'},
        {field:'workName',title:'工作描述',width:100,align:'center'}
    
    ]]    
     });  
	var pager1 = $('#gzjlTableGrid').datagrid('getPager');
	pager1.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
 
  //教育培训
	   $('#jypxTableGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,width:100,align:'center'},
	     {field:'studyTypeId',title:'教育类别',width:100,align:'center'},    
	     {field:'schoolName',title:'学校名称',width:100,align:'center'},
	     {field:'inDate',title:'入学日期',width:100,align:'center'},
	     {field:'graduationDate',title:'毕业日期',width:100,align:'center'},
	     {field:'education',title:'学历',width:100,align:'center'},
	     {field:'degree',title:'学位',width:100,align:'center'},
	     {field:'certificate',title:'证书名称',width:100,align:'center'},
	     {field:'major',title:'学习专业',width:100,align:'center'}
    
    ]]    
     });  
	var pager2 = $('#jypxTableGrid').datagrid('getPager');
	pager2.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
 
 
 
 
  //职业培训
 	   $('#zypxTableGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,width:100,align:'center'},
        {field:'trainingUnit',title:'培训单位',width:100,align:'center'},    
        {field:'trainDate',title:'培训日期',width:100,align:'center'},
        {field:'outDate',title:'结业日期',width:100,align:'center'},
        {field:'trainNo',title:'证书编号',width:100,align:'center'},
        {field:'office',title:'发证机关',width:100,align:'center'},
        {field:'officeDate',title:'发证时间',width:100,align:'center'} 
    ]]    
     });  
	  var pager3 = $('#zypxTableGrid').datagrid('getPager');
	 pager3.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	 
	   //职务职称
 	   $('#zwzcTableGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,width:100,align:'center'},
        {field:'p_level',title:'级别',width:100,align:'center'},    
        {field:'p_method',title:'评审方式',width:100,align:'center'},
        {field:'pro_z_name',title:'专业技术资格名称',width:100,align:'center'},
        {field:'pro_name',title:'专业名称',width:100,align:'center'},
        {field:'department_id',title:'审批部门',width:100,align:'center'},
        {field:'pz_no',title:'证书编号',width:100,align:'center'},
        {field:'pz_date1',title:'批准日期',width:100,align:'center'}  
 
         
    
    ]]    
     });  
	  var pager4 = $('#zwzcTableGrid').datagrid('getPager');
	 pager4.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	  //奖励情况
 	   $('#jlqkTableGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,width:100,align:'center'},
        {field:'reward_name',title:'奖惩名称',width:100,align:'center'},    
        {field:'en_name',title:'奖惩批准机关',width:100,align:'center'},
        {field:'pz_date',title:'奖惩批准日期',width:100,align:'center'},
        {field:'cx_date',title:'奖惩撤销日期',width:100,align:'center'}
 
         
    
    ]]    
     });  
	  var pager5 = $('#jlqkTableGrid').datagrid('getPager');
	 pager5.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	 
 });





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

 function showDp(){
 
    if($('input:radio[name=human_out]:checked').val()=="on"){
       
         $("#point" ).css("display", "block");
    }else{
   		 $("#point" ).css("display", "none");

    }
 }
 function showDp1(){
 
    if($('input:radio[name=da_is_s]:checked').val()=="on"){
       
         $("#point1" ).css("display", "block");
    }else{
   		 $("#point1" ).css("display", "none");

    }
 }
 function showDp2(){
 
    if($('input:radio[name=da_is_dl]:checked').val()=="on"){
       
         $("#point2" ).css("display", "block");
    }else{
   		 $("#point2" ).css("display", "none");

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

<form id="ryxxAddFm" method="post">
   <!-- <td class="left">档案编号</td> 
      <td class="left">系统编码</td>
      -->
      
      <input  type="hidden" id="da_pno" name="da_pno"   >
      <input type="hidden" name="da_dpno" id="da_dpno"  >
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:420px;">   
    <div title="基本信息" value="1" style="">   
        <div id="" class="easyui-accordion" style="height:860px;">   
        <table class="table2">
     
       <tr>
      <td class="left">档案类别</td>
      <td class="right">
       <select id="da_dtype" class="easyui-combobox" name="da_dtype" style="width:135px;"  data-options="required:true">   
		   <option value="">---空---</option> 
		   <option value="L">临时档案</option>  
		   <option value="D">代理档案</option>
		   <option value="C">单纯档案</option>  
		   <option value="T">退休</option>
		   <option value="W">待就业</option>
		   <option value="Y">意向档案</option>
		   <option value="B">档案保管</option> 
	   </select>
	  </td>
       <td class="left">人事外包</td>
      <td class="right" colspan="3" nowrap style="height:22px">
            <input type="radio" name="human_out"  value="on"  onclick="showDp()"/>是
            <input type="radio" name="human_out"   value="off" checked="checked" onclick="showDp()"/>否
            <div id="point" style="display: none" >
           <input class="easyui-textbox" id="human_out1" name="human_out1" data-options="required:true"  size="20"  style="height:22px"/>
		    <label style="color:red">*填写外包单位名称</label>
		   </div>
      </td>
      
        <td class="left" colspan="2" rowspan="6" id="picTd"></td>
        
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
      <td class="right"><input class="easyui-textbox" id="da_pnum" name="da_pnum" size="20" style="height:22px"  data-options="events:{blur:cm}"></td>
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
	   <option value="0">未知</option>   
	   </select></td>
     <td class="left">第一学历</td>
     <td class="right" colspan="3">
      <select id="da_degree" class="easyui-combobox"  data-options="required:true" name="da_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
      
      </tr>
      
     
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
                         <input class="easyui-textbox" id="da_is_dl1" name="da_is_dl1" data-options="required:true"  size="20"  style="height:22px"/>
                         <label style="color:red">*填写代理单位名称</label>
                        </div></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
       
       <tr>
      <td class="left">第一学历毕业院校</td>
      <td class="right"><input class="easyui-textbox" id="da_school" name="da_school"  size="20" style="height:22px"></td>
     <td class="left">第一学历毕业时间</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_graduation_time" name="da_graduation_time" size="20" style="height:22px">
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
      <td class="right"><input class="easyui-textbox" id="da_bd_unit" name="da_bd_unit" size="20" style="height:22px"></td>
      <td class="left">审批时间</td>
      <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_sp_date"  name="da_sp_date" size="20" style="height:22px">
      </td>
      </tr>
     
       <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox" name="da_work_name"  id="da_work_name" size="20" style="height:22px"></td>
     <td class="left">工作年限</td>
     <td class="right" colspan="3">
      <input class="easyui-datebox" id="da_work_time" name="da_work_time" size="20" style="height:22px">
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
      <td class="right"><input class="easyui-numberbox" name="da_home_post"  id="da_home_post"  size="20" style="height:22px"></td>
      </tr>
      
    
       <tr>
      <td class="left">本人联系电话1</td>
      <td class="right"><input class="easyui-numberbox" name="da_tel" id="da_tel"  size="20" style="height:22px"></td>
      <td class="left">本人联系电话2</td>
      <td class="right" colspan="3"><input class="easyui-numberbox" name="da_my_tel" id="da_my_tel"  size="20" style="height:22px"></td>
    
      </tr>
      <tr>
       <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox" name="da_my_adr" id="da_my_adr"  size="20" style="height:22px"></td>
       <td class="left">邮政编码</td>
      <td class="right" colspan="3"><input class="easyui-numberbox" name="da_my_post" id="da_my_post"  size="20" style="height:22px"></td>
      </tr>
        
       <tr>
     
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-numberbox" name="da_qq" id="da_qq" size="20" style="height:22px"></td>
       <td class="left">电子邮箱</td>
      <td class="right" colspan="3"><input class="easyui-textbox" name="da_email" id="da_email"  size="20" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">应急联系人</td>
      <td class="right"><input class="easyui-textbox" name="da_wife_name" id="da_wife_name" size="20" style="height:22px"></td>
      <td class="left">应急联系人电话</td>
      <td class="right" colspan="3"><input class="easyui-numberbox" name="da_wife_tel" id="da_wife_tel"  size="20" style="height:22px"></td>
      
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
      <input class="easyui-textbox" size="20" name="inputId" id="inputId" value="<%= sessionRealName %>" data-options="required:true" style="height:22px" ></td>
      <td class="left">录入日</td>
      <td class="right" colspan="3">  <input class="easyui-datebox" name="da_add_date" id="da_add_date" size="20" data-options="required:true" value="<%= new Date() %>"  style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td  class="right" colspan="4"> <input maxlength="150" class="easyui-textbox" name="da_remark" id="da_remark"  size="20" data-options="multiline:true" style="height:60px;width: 430px"></td>
      </tr>
     
      </table>  
      <font color="gray" style="margin-left: 180px">备注限制在150字之内</font>   
       </div>
     
    </div>   
    <div title="工作简历" data-options=""  style="">   
		    <div id="gzjlTool"  style="background-color:#FFFFFF;">
				<a onclick="addgzjlFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增工作简历</a>
				<a onclick="updateGzjl()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改工作简历</a>
				<a onclick="deleteGzjl()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除工作简历</a>
				
				<!--<a onclick="gzjlTableGrid();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">qry</a>-->
				
				 <table id="gzjlTableGrid"></table> 
			</div>
			<div id="gzjlAddInfo1"></div>
			<div id="gzjlEidtInfo"></div>
          
    </div>
    <div title="教育培训" data-options="" style="">   
             <div id="jypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addjypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增教育培训</a>
				<a onclick="editJypx()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改教育培训</a>
				<a onclick="deleteJypx()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除教育培训</a>
				 <table id="jypxTableGrid"></table> 
			</div>
			<div id="jypxAddInfo1"></div>
			<div id="jypxEditInfo"></div>
    </div>
    <div title="职业培训" data-options="" style="">   
               <div id="zypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addzypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增培训经历</a>
				<a onclick="editZypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改培训经历</a>
				<a onclick="deleteZypx();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除培训经历</a>
				 <table id="zypxTableGrid"></table> 
			</div>
			<div id="zypxAddInfo1"></div>
			<div id="zypxEditInfo"></div>
    </div> 
    <div title="职务职称" data-options="" style="">   
             <div id="zwzcTool"  style="background-color:#FFFFFF;">
				<a onclick="addzwzcFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增职务职称</a>
				<a onclick="editzwzcFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改职务职称</a>
				<a onclick="deleteZwzc();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除职务职称</a>
				 <table id="zwzcTableGrid"></table> 
			</div>
			<div id="zwzcAddInfo1"></div>
       		<div id="zwzcEditInfo"></div>
            
    </div> 
    <div title="奖励情况" data-options="" style="">   
             <div id="jlqkTool"  style="background-color:#FFFFFF;">
				<a onclick="addjlqkFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增奖励情况</a>
				<a onclick="editjlqkFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改奖励情况</a>
				<a onclick="deleteJlqk();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除奖励情况</a>
				 <table id="jlqkTableGrid"></table> 
			</div>
			<div id="jlqkAddInfo1"></div>
			<div id="jlqkEditInfo"></div>
    </div>   
</div>  
</form>		
</body>

</html>
