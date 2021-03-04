<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>班级管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript">
function queryBjgl(queryParams){
	var grid = {    
		    url:'<%=request.getContextPath()%>/classTrol/queryClassList', 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			fitColumns:true,
			height: wholeHeight,
			toolbar: '',
			pagination : true,
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false, 
		                      
			columns:[[    
				         {field:'pno',title:'班级编码',width: fixWidth(0.01),align:'center'},
				         {field:'name',title:'班级名称',width: fixWidth(0.01),align:'center'},
				         {field:'enterpriseName',title:'主办单位',width: fixWidth(0.01),align:'center'},
				         {field:'cEnterpriseName',title:'承办单位',width: fixWidth(0.01),align:'center'},
				         {field:'content',title:'培训内容',width: fixWidth(0.01),align:'center'},
				         {field:'objId',title:'培训对象',width: fixWidth(0.01),align:'center'},
				         {field:'typeId',title:'培训类别',width: fixWidth(0.01),align:'center'},
				         {field:'pDate',title:'培训期限',width: fixWidth(0.01),align:'center'},
				         {field:'pNum',title:'本期人数',width: fixWidth(0.01),align:'center'},
				         {field:'sDate',title:'开班时间',width: fixWidth(0.01),align:'center'},
				         {field:'eDate',title:'结束时间',width: fixWidth(0.01),align:'center'},
				         {field:'cstate',title:'班级状态',width: fixWidth(0.01),align:'center',
				             formatter: function(value,row,index){
				              if (value == 1) {
				            	  return "待报名";
								}else if (value == 2) {
				            	  return "成绩录入";
								}else if (value == 3) {
				            	  return "执行情况录入";
								}else if (value == 4) {
				            	  return "结束培训";
								}else{
									return "未知";
								}
							}
						 },
				         {field:'isValid',title:'有效性',width: $(this).width() * 0.01,align:'center',
							 formatter: function(value,row,index){
				             if (value == 1) {
				           	  return "有效";
								}else{
									return "失效";
								}
							}
						}
				    ]]
		};
	
	if(queryParams && queryParams!=''){
 		$('#bjglhdGrid').datagrid($.extend(true,grid,{queryParams:{param:queryParams}}));  
	}else{
 		$('#bjglhdGrid').datagrid(grid);  
	}
		var pager = $('#bjglhdGrid').datagrid('getPager');
		pager.pagination({
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '/ {pages} 页',
			displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
			buttons : [ {
				iconCls : 'icon-excel',
				handler : function() {
				}
			} ]
		});
}

$(function(){ 


	$("#a").hide();
   $("#b").hide();
   $("#c").hide();
   $("#d").hide();
   $("#e").hide();
    $("#f").hide();
      $("#g").hide();
        $("#h").hide();
               $("#i").hide();
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==267){
				$("#a").show();
			}else if(value==268){
				$("#b").show();
			}else if(value==269){
				$("#c").show();
			}else if(value==270){
				$("#d").show();
			}else if(value==271){
				$("#e").show();
			}else if(value==272){
				$("#f").show();
			}else if(value==273){
				$("#g").show();
			}else if(value==274){
				$("#h").show();
			}else if(value==275){
				$("#i").show();
			}
	});
    },"json");
    
	queryBjgl('');
});

Number.prototype.pad2 =function(){      
    return this>9?this:'0'+this;      
} 
Date.prototype.format=function (format) {      
    var it=new Date();      
    var it=this;      
    var M=it.getMonth()+1,H=it.getHours(),m=it.getMinutes(),d=it.getDate(),s=it.getSeconds();      
    var n={ 'yyyy': it.getFullYear()      
            ,'MM': M.pad2(),'M': M      
            ,'dd': d.pad2(),'d': d      
            ,'HH': H.pad2(),'H': H      
            ,'mm': m.pad2(),'m': m      
            ,'ss': s.pad2(),'s': s      
    };      
    return format.replace(/([a-zA-Z]+)/g,function (s,$1) { return n[$1]; });      
}
/*修改班级*/
function editFuc(){
	var selectedRows = $("#bjglhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要编辑的数据！');
		return;
	}
	if(selectedRows.length > 1){
		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
		return;
	}
	
	var row = selectedRows[0];

	$('#bjglhdEidtInfo').dialog({
	    title: '修改班级',
	    width: 650,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../zxxxgl/bjEdit.jsp',
	    modal: true,
	    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){debugger
					
						var isValid = $("#editClassFm").form('validate');
						if (!isValid){
							$.messager.progress('close');	// hide progress bar while the form is invalid
							return;
						}
						if($("#name").textbox('getValue').length>30){
							$.messager.alert('提示','班级名字要小于30个字');
						return;
						}
						if($("#enterpriseName").textbox('getValue').length>50){
						$.messager.alert('提示','主办方单位长度不超过50个字！');
						return;
						}
						if($("#cEnterpriseName").textbox('getValue').length>50){
						$.messager.alert('提示','承办方单位长度不超过50个字！');
						return;
						}
						if($("#content").textbox('getValue').length>120){
						$.messager.alert('提示','培训内容不得多于120字！');
						return;
						}	
						if($("#objId").textbox('getValue').length>120){
						$.messager.alert('提示','培训对象字数不得超过120 字！');
						return;
						}
							if($("#typeId").textbox('getValue').length>120){
						$.messager.alert('提示','培训类别字数不得超过120 字！');
						return;
						}
						var num=$("#pNum").val();
						 if(num>9999){
    	 		    	$.messager.alert('提示','班级人数超出限制');
    	 		        return;
    	 		    }
    	 		       if(num<=0){
    	 		    	$.messager.alert('提示','班级人数太少！');
    	 		        return;
    	 		    }
				    	//开始时间大于结束时间
			 			var oDate1 = new Date($('#sDate').datetimebox('getValue'));
			 		    var oDate2 = new Date($('#eDate').datetimebox('getValue'));
			 		    if(oDate1.getTime() > oDate2.getTime()){
			 		    	$.messager.alert('提示','开始时间不能大于结束时间');
			 		        return;
			 		    } else {
			 		    	 var length = $("input[name='pic']").length;
					    	 var pics = "";
					    	 if(length > 0){
					    		for(var i=0;i<length;i++){
					    			if(pics == ""){
					    				pics = $("input[name='pic']").eq(i).val();
					    			}else{
					    				pics += "," + $("input[name='pic']").eq(i).val();
					    			}
					    		}
					    	}
				    	$.ajax({
				    		url:'<%=request.getContextPath()%>/classTrol/updateClass',
				    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
				    	    data: {
				                'pno': $('#pno').val(),
				                'name': $('#name').val(),
				                'enterpriseName': $('#enterpriseName').val(),
				                'cEnterpriseName': $('#cEnterpriseName').val(),
				                'content': $('#content').val(),
				                'objId': $('#objId').val(),
				                'typeId': $('#typeId').val(),
				                'pDate': $('#pDate').val(),
				                'pNum': $('#pNum').val(),
				                'sDate': $('#sDate').datebox('getValue'),
				                'eDate': $('#eDate').datebox('getValue'),
				                'pics': pics
				            },
				    	    type: "POST",   //请求方式
				    	    success: function(data) {
				    	    	var resObj = eval("("+data+")");
					            if(resObj.flag == '0'){
					            	 $.messager.alert('系统提示','修改成功！');
					            	 $("#bjglhdGrid").datagrid("reload");
					            	 $('#bjglhdEidtInfo').dialog('close');
						        }else{
						        	 $.messager.alert('系统提示','修改失败：'+resObj.errorMsg);
							    }
				    	    },
				    	    error: function() {
				    	        //请求出错处理
				    	    }
				    	  });
			 		    }
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#bjglhdEidtInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad : function() {//★★在打开dialog的时候回显数据，这里不能用onOpen事件
            //最笨的方法：逐个实现回显
            /* $('#admin_userManagEdit_Form input[name=id]').val(rows[0].id);
            $('#admin_userManagEdit_Form input[name=name]').val(rows[0].name);
            $('#admin_userManagEdit_Form input[name=pwd]').val(rows[0].pwd);
            $('#admin_userManagEdit_Form input[name=creatTime]').val(rows[0].creatTime);
            $('#admin_userManagEdit_Form input[name=endTime]').val(rows[0].endTime); */
            $('#editClassFm').form('load', row);//★等同于上面的多项
        }
	});
}

/*开设班级*/
function addFuc(){
	alert("lalalalal");
	$('#bjglhdAddInfo').dialog({
    title: '开设班级',
    width: 650,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/bjAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){debugger 
						if($("#bjmc").textbox('getValue').length>30){
							$.messager.alert('提示','班级名字要小于30个字');
						return;
						}
						if($("#zbdw").textbox('getValue').length>50){
						$.messager.alert('提示','主办方单位长度不超过50个字！');
						return;
						}
						if($("#cbdw").textbox('getValue').length>50){
						$.messager.alert('提示','承办方单位长度不超过50个字！');
						return;
						}
						if($("#pxnr").textbox('getValue').length>120){
						$.messager.alert('提示','培训内容不得多于120字！');
						return;
						}	
						if($("#pxdx").textbox('getValue').length>120){
						$.messager.alert('提示','培训对象长度超过120个！');
						return;
						}
						if($("#pxlb").textbox('getValue').length>120){
						$.messager.alert('提示','培训类别字数不得超过120 字！');
						return;
						}
    	 			//开始时间大于结束时间
    	 			var oDate1 = new Date($('#kbsj').datetimebox('getValue'));
    	 		    var oDate2 = new Date($('#jssj').datetimebox('getValue'));
    	 		    var num=$('#bqrs').numberbox('getValue');
    	 		    if(num>9999){
    	 		    	$.messager.alert('提示','班级人数超出限制');
    	 		        return;
    	 		    }
    	 		       if(num<=0){
    	 		    	$.messager.alert('提示','班级人数太少，无法开设班级');
    	 		        return;
    	 		    }
    	 		    
    	 		    if(oDate1.getTime() > oDate2.getTime()){
    	 		    	$.messager.alert('提示','开始时间不能大于结束时间');
    	 		        return;
    	 		    } else {
    	 		        saveYwglFuc();
    	 		    }
					
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#bjglhdAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save'
   
});
}

/**/
function saveYwglFuc(){
    var r = $("#bjAddFm").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}

 var param=$("#bjAddFm").serializeArray();
 param=JSON.stringify(param); 
 var length = $("input[name='pic']").length;
 var pics = "";
 if(length == 0){
	 $.messager.alert('提示','请选择附件');
	 return false;
  }
if(length > 0){
	for(var i=0;i<length;i++){
		if(pics == ""){
			pics = $("input[name='pic']").eq(i).val();
		}else{
			pics += "," + $("input[name='pic']").eq(i).val();
		}
	}
}

  
$("#bjAddFm").ajaxSubmit({ 
			url : '<%=request.getContextPath()%>/classTrol/saveClass',
			async : true,
			 data: {
                'param': param,
                'pics': pics
            },
			success : function(data) {
            var result = $.parseJSON(data);  
			if(result.flag == 0){
				 $.messager.alert('提示','开设班级成功');
				 $('#bjglhdAddInfo').dialog('close');
				 $("#bjglhdGrid").datagrid("reload");
			}else{
				$.messager.alert('提示','开设班级失败，原因：'+result.errorMsg);
			}
		},
		error : function(data) {
			   
		}
	});
}

var dataFlag,flag;
function uploadExcel(type){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
        var url;  
        if(type == 'zxqk'){
        	url = "<%=request.getContextPath()%>/classTrol/importExcel?type=zxqk"; 
         }else{
        	 url = "<%=request.getContextPath()%>/classTrol/importExcel?type=cj"; 
         }
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx" || d1==".xls"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: url,
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 				            var resObj = eval("("+data+")");
 				           dataFlag = resObj.flag;
 				            if(type == 'zxqk'){
			            		$('#importInfo').dialog('close');
			            		showImportZxqkFuc(resObj.rows); 
			                }else{
			                	$('#importInfo').dialog('close');
			            		showImportCjFuc(resObj.rows); 
				            }
 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx/xls格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }
/*导出执行情况*/
function exportZxqkFuc(){
	var selectedRows = $("#bjglhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条班级要导出的数据！');
		return;
	}
	if(selectedRows.length > 1){
		$.messager.alert('系统提示','导出操作只能针对一条记录！');
		return;
	}
	
	var row = selectedRows[0];
 
    var str_new = new Date().format('yyyy-MM-dd')
	if(row.eDate>str_new){
		$.messager.alert('系统提示',"培训未结束！");
		return;
	}
    
	$('#exportZxqkInfo').dialog({
	    title: '导出执行情况',
	    width: 1000,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../zxxxgl/bjzxqkExport.jsp',
	    modal: true,
	    buttons:[{
					text:'导出',
					iconCls:'icon-ok',
					handler:function(){
				    	var url= "<%=request.getContextPath()%>/classTrol/exportZxqkInfo?pno="+row.pno;
				    	window.location.href= url; 
				    	queryBjgl();
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#exportZxqkInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad : function() {//★★在打开dialog的时候回显数据，这里不能用onOpen事件
            //最笨的方法：逐个实现回显
            /* $('#admin_userManagEdit_Form input[name=id]').val(rows[0].id);
            $('#admin_userManagEdit_Form input[name=name]').val(rows[0].name);
            $('#admin_userManagEdit_Form input[name=pwd]').val(rows[0].pwd);
            $('#admin_userManagEdit_Form input[name=creatTime]').val(rows[0].creatTime);
            $('#admin_userManagEdit_Form input[name=endTime]').val(rows[0].endTime); */
            $('#exportZxqkFm').form('load', row);//★等同于上面的多项
        }
	});
 
}


/*导入成绩*/
function importCjFuc(){
	$('#importInfo').dialog({
    title: '导入成绩',
    width: 350,
    height: 150,
    
    closed: false,
    cache: false,
    href: '../zxxxgl/bjzxqkFormImport.jsp',
    modal: true,
     buttons:[{
			text:'上传',
			iconCls:'icon-ok',
			handler:function(){
    	 		uploadExcel("cj");
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#importInfo').dialog('close');
			}
		}],
    iconCls: 'icon-save',
    onLoad: function () {}  
});
}
/*查询操作*/
function tbReload(){
	$("#bjglhdGrid").datagrid("reload");
}

/*失效班级操作*/
function disabledClassInfo(){
	var selectedRows = $("#bjglhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要失效的数据！');
		return;
	}
	 
    var strIds=[];
    var isValid_0 = selectedRows[0].isValid;//有效性
    var cnt = 0;
    var isValid; 
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
		if(selectedRows[i].isValid != isValid_0){
			cnt++;
			}
	}
	if(cnt == 0 && isValid_0 == 1){//所有选择的状态一样
		isValid = 0;
		var statu = confirm("确认将选择的班级失效吗?");
	    if(!statu){
	        return ;
	    }
	}else{
		$.messager.alert("系统提示","选择的班级中有已失效数据，请确认！");
		return;
		isValid=1;
		}
	var ids=strIds.join(",");
	$.ajax({
		url:'<%=request.getContextPath()%>/classTrol/disabledClass',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"ids" : ids, "isValid" : isValid},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	var resObj = eval("("+data+")");
            if(resObj.flag == '0'){
            	 queryBjgl();
            	 $.messager.alert('系统提示','修改有效性成功！');
            	 $('#bjglhdEidtInfo').dialog('close');
	        }else{
	        	 $.messager.alert('系统提示','修改有效性失败：'+resObj.errorMsg);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
} 

/*有效班级操作*/
function enabledClassInfo(){
	var selectedRows = $("#bjglhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要失效的数据！');
		return;
	}
	 
    var strIds=[];
    var isValid_0 = selectedRows[0].isValid;//有效性
    var cnt = 0;
    var isValid; 
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
		if(selectedRows[i].isValid != isValid_0){
			cnt++;
			}
	}
	if(cnt == 0 && isValid_0 == 0){//所有选择的状态一样
		var statu = confirm("确认将选择的班级有效吗?");
		if(!statu){
			return;
		}
		isValid=1;
	}else{
		$.messager.alert("系统提示","选择的班级中有已有效数据，请确认！");
		return;
	}
	var ids=strIds.join(",");
	$.ajax({
		url:'<%=request.getContextPath()%>/classTrol/disabledClass',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"ids" : ids, "isValid" : isValid},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	var resObj = eval("("+data+")");
            if(resObj.flag == '0'){
            	 queryBjgl();
            	 $.messager.alert('系统提示','修改有效性成功！');
            	 $('#bjglhdEidtInfo').dialog('close');
	        }else{
	        	 $.messager.alert('系统提示','修改有效性失败：'+resObj.errorMsg);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
} 


/*导出执行情况模板*/
function exportImplementationFuc(){
	var url= "<%=request.getContextPath()%>/classTrol/exportImplementation?";
	window.location.href= url; 
}

/*导出成绩模板*/
function exportScoreFuc(){
	var url= "<%=request.getContextPath()%>/classTrol/exportScore?";
	window.location.href= url; 
}
  
//导出执行情况
function exportZxqkFuc1(){
	
	var selectedRows = $("#bjglhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条班级要导出的数据！');
		return;
	}
	if(selectedRows.length > 1){
		$.messager.alert('系统提示','导出操作只能针对一条记录！');
		return;
	}
	
	var row = selectedRows[0];

    var str_new = new Date().format('yyyy-MM-dd')
	if(row.eDate>str_new){
		$.messager.alert('系统提示',"培训未结束！");
		return;
	}
	var url= "<%=request.getContextPath()%>/classTrol/exportZxqkInfo?pno="+row.pno;
	$.ajax({
		url:'<%=request.getContextPath()%>/classTrol/exportZxqkInfo',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"pno" : row.pno},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	if(data=="0"){
	    		$.messager.alert('系统提示',"班级对应的执行情况为空");
	    	}
	    	else{
	    		window.location.href= url;
		    	queryBjgl();
	    	}
	    		
	    }
	});
	
}

/*展示导入的成绩文件内容*/
function showImportCjFuc(dates){

	$('#showImportCjInfo').dialog({
    title: '班级成绩',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/cjImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    	 saveCj(dates);
				 $('#showImportCjInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#showImportCjInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#cjhdGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[ 
        {field:'classId',title:'班级编码',width: $(this).width() * 0.2,align:'center'},
		{field:'pnum',title:'身份证号',width: $(this).width() * 0.2,align:'center'},
		{field:'score',title:'成绩',width: $(this).width() * 0.1,align:'center'},
		{field:'stime',title:'学时',width: $(this).width() * 0.1,align:'center'},
		{field:'remark',title:'错误提示',width: $(this).width() * 0.3,align:'center'}   
        ]]    
     });  
	$('#cjhdGrid').datagrid('loadData',dates);
    } //loadEnd
});
 
}
/*展示导入的执行文件内容*/
function showImportZxqkFuc(dates){

	$('#showImportZxqkInfo').dialog({
    title: '执行情况导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/bjzxqkImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    	 saveZxqk(dates);
				 $('#showImportZxqkInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#showImportZxqkInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#zxqkhdGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
		{field:'pno',title:'班级编码',width: $(this).width() *0.1 ,align:'center'},
		{field:'advice1',title:'培训评价',width: $(this).width() *0.15,align:'center'},
		{field:'advice2',title:'培训班主办单位意见',width: $(this).width() *0.15,align:'center'},
		{field:'adviceDate',title:'主办单位意见日期',width: $(this).width() *0.15,align:'center'},
		{field:'advice3',title:'省交通职工培训中心意见',width: $(this).width() *0.15,align:'center'},
		{field:'adviceSdate',title:'培训中心意见日期',width: $(this).width() *0.15,align:'center'},
		{field:'errMsg',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	$('#zxqkhdGrid').datagrid('loadData',dates);
    } //loadEnd
});
}

//成绩保存
function saveCj(dates){
   if(dateFlag != true){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   $.blockUI();
    $.ajax({
                url: "../classTrol/saveCj",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     $.messager.alert('提示','导入成功 ');
                     $('#showImportCjInfo').dialog('close');
                     queryBjgl();
					}else{
						$.messager.alert('错误','导入失败,请核查数据中错误提示 ');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   $.messager.alert('错误','导入失败,请核查数据中错误提示 ');
                }
            });
  
   
}
//执行情况保存
function saveZxqk(dates){
   if(dateFlag!=true){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
   //var rows = $('#ygdrGrid').datagrid('getRows');
   //if(isEmpty(rows)){
   //alert(isEmpty(rows));  
   //}
   $.blockUI();
    $.ajax({
                url: "../classTrol/saveZxqk",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     $.messager.alert('提示','导入成功 ');
                     $('#showImportZxqkInfo').dialog('close');
                     queryBjgl();
					}else{
						$.messager.alert('错误','导入失败,请核查数据中错误提示 ');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   $.messager.alert('错误','导入失败,请核查数据中错误提示 ');
                }
            });
}
/*导入执行情况*/
function zxqkFuc(){
	$('#importInfo').dialog({
    title: '选择文件',
    width: 350,
    height: 150,
    
    closed: false,
    cache: false,
    href: '../zxxxgl/bjzxqkFormImport.jsp',
    modal: true,
     buttons:[{
			text:'上传',
			iconCls:'icon-ok',
			handler:function(){
    	 		uploadExcel("zxqk");
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#importInfo').dialog('close');
			}
		}],
    iconCls: 'icon-save',
    onLoad: function () { 
    }  
});
}
//弹出查询框
function searchBjDiv(){
	    $('#searchInfo').dialog({    
	    title: '',    
	    width: 1000,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: '../zxxxgl/bjSearch.jsp',    
	    modal: true,
	    buttons:[{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#searchInfo').dialog('close');
					}
				}]
	}); 
}
//兼容ie的导入
function importFucCj(){
	$("#cjFm").ajaxSubmit({
		dataType:"html",
		url : "../classTrol/cjUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
          $.unblockUI();
         
           $('input[type="file"]').attr('value',''); 
           $('#cjFm')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     showImportCjFuc(result.rows); 
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			} 
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
	
}

//兼容ie的导入
function importZxqkFuc(){
	$("#zxqkFm").ajaxSubmit({
		dataType:"html",
		url : "../classTrol/zxqkUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
           $.unblockUI();
           $('input[type="file"]').attr('value',''); 
           $('#zxqkFm')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 

			if(result.flag ==true){
			     dateFlag=result.dateFlag;
				 showImportZxqkFuc(result.rows)
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
			
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
	
}
</script>


<body style="margin: 1px;">
 
	<div id="tb">
		<div id="bjglhdTool"  style="background-color:#FFFFFF;">
			<a id="a" onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">开设班级</a>
			<a id="b" onclick="editFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a id="c" onclick="searchBjDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
			<a id="d" onclick="disabledClassInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
			<a  onclick="enabledClassInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">有效</a>
			<a id="e" onclick="exportImplementationFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出执行情况模板</a>
			<%--<a onclick="zxqkFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导入执行情况</a>--%>
			<a id="f" onclick="exportZxqkFuc1()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出执行情况</a>
			<%--<a onclick="importCjFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导入成绩</a>--%>
			<a id="g" onclick="exportScoreFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出成绩模板</a>
			<form id="zxqkFm" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
				 <a id="h" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
	        	 <input  onchange="importZxqkFuc()" id="zxqkFile" name= "zxqkFile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入执行情况</a>
            </form>
	       	<form id="cjFm" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
		        <a id="i" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
		        <input  onchange="importFucCj()" id="cjFile" name= "cjFile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入成绩</a>
	        </form>
       
		</div>
	</div>

	<div>
	   <table id="bjglhdGrid"></table>  
	</div>
	<div id="searchInfo"></div>
	<div id="bjglhdAddInfo" align="center"></div>
	<div id="importInfo" align="center"></div>
	<div id="exportZxqkInfo" align="center"></div>
	<div id="bjglhdEidtInfo" align="center"></div>
	<div id="showImportZxqkInfo" align="center"></div>
	<div id="showImportCjInfo" align="center"></div>
</body>
</html>
