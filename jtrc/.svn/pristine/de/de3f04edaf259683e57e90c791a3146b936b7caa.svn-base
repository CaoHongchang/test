<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报名表管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript"> 
var rowsNew="";
var j=0;
$(function(){
   
   $("#a").hide();
   $("#b").hide();
   $("#c").hide();
   $("#d").hide();
   $("#e").hide();
   $("#f").hide();
   $("#g").hide();
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==276){
				$("#a").show();
			}else if(value==277){
				$("#b").show();
			}else if(value==278){
				$("#c").show();
			}else if(value==279){
				$("#d").show();
			}else if(value==280){
				$("#e").show();
			}else if(value==281){
				$("#f").show();
				$("#g").show();
			}
	});
    },"json");
    
    
   
	   initBmbhdGrid();
});


function initBmbhdGrid(queryParams){
	   var grid = {    
			    url:'<%=request.getContextPath()%>/userBgTrol/queryBmbList', 
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
				singleSelect: true,              
			    columns:[[ 
						{field:'id',title:'',hidden:true}, 
						{field:'userId',title:'',hidden:true},   
						{field:'sex',title:'',hidden:true},
						{field:'mz',title:'',hidden:true},
						{field:'partyName',title:'',hidden:true},
						{field:'placeName',title:'',hidden:true},
						{field:'birthDate',title:'',hidden:true},
						{field:'domicilePlace',title:'',hidden:true},
						{field:'degree',title:'',hidden:true},
						{field:'remark',title:'',hidden:true},
						{field:'bgDepartmentId',title:'别',hidden:true},
						{field:'technical',title:'',hidden:true},
					 {field:'',title:'选择',checkbox:true,align:'center'},
			         {field:'bName',title:'班级名称',width: $(this).width() * 0.01,align:'center'},
			         {field:'name',title:'姓名',width: $(this).width() * 0.01,align:'center'},
			         {field:'pnum',title:'身份证号',width: $(this).width() * 0.015,align:'center'},
			         {field:'tel',title:'联系电话',width: $(this).width() * 0.015,align:'center'},
			         {field:'workName',title:'工作单位',width: $(this).width() * 0.02,align:'center'},
			         {field:'isState',title:'审核状态',width: $(this).width() * 0.01,align:'center',
			        	 formatter: function(value,row,index){
			             if (value == '0') {
			           	  return "待审核";
							}else if (value == '1') {
			           	  return "审核成功";
							}else if (value == '2') {
			           	  return "审核失败";
							}
							/*
							else if (value == '3') {
			           	  return "查看成绩";
							}else if (value == '4') {
			           	  return "培训结束";
							}
							*/
							else{
								return "未知";
							}
						}
			          },
			         {field:'cj',title:'成绩',width: $(this).width() * 0.01,align:'center'},
			         {field:'xs',title:'学时',width: $(this).width() * 0.01,align:'center'}
			    ]]    
			};
	   
	   if(queryParams){
			 $('#bmbhdGrid').datagrid($.extend(true,grid,{queryParams:queryParams}));  
	   }else{
		   $('#bmbhdGrid').datagrid(grid); 
	   }
	   var pager = $('#bmbhdGrid').datagrid('getPager');
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

/*查看报名表*/
function qryBmbDetailFuc(){
	var selectedRows = $("#bmbhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要查看的数据！');
		return;
	}
	if(selectedRows.length > 1){
		$.messager.alert('系统提示','查看操作只能针对一条记录！');
		return;
	}
	
	var row = selectedRows[0];
	$('#bmbhdAddInfo').dialog({
    title: '报名表查看',
    width: 650,
    height: 450,
    closed: false,
    cache: false,
    href: '../zxxxgl/bmbDetail.jsp?pnum='+row.pnum,
    modal: true,
    buttons:[ {
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#bmbhdAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function() { 
    if(row.sex==1)
        row.sex="男";
      else
         row.sex="女";
         
         //alert(row.bgDepartmentId);
		$('#detailBmbFm').form('load', row);//★等同于上面的多项
		$('#remark').html(row.remark);
		//$('#bgDepartmentId').val(row.partyName);
    }
});
}

/*导入报名*/
function reload(){
	$('#importBmInfo').dialog({
    title: '导入报名',
    width: 1000,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/bmImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#importBmInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#userAddGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 230,
	width:'100%',
	toolbar: '#userAddTool',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code',title:'角色名称',width:100},    
        {field:'name',title:'备注',width:150},    
         {title:'启用',field:'uid',width:100,align:'center',
	    		formatter: function(value,row,index){
				 return "<a href='#' style='color: blue;' onclick='' >启动<a> ";
			}   
			}
    ]]    
     });  
	var pager = $('#userAddGrid').datagrid('getPager');
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
});
}
function uploadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
      
     if(fileName !=""){   
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx"){  
                     document.getElementById("questionTypesManage").action="<%=request.getContextPath()%>/userBgTrol/leadInExcelQuestionBank?";  
                     document.getElementById("questionTypesManage").submit();     
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: url,
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 				            var resObj = eval("("+data+")");
 				            if(resObj.flag == '0'){
 				            	 $.messager.alert('系统提示','新增成功！');
 				            	 $("#bjglhdGrid").datagrid("reload");
 				            	 $('#bjglhdAddInfo').dialog('close');
 					        }else{
 					        	 $.messager.alert('系统提示','新增失败：'+resObj.errorMsg);
 						    }
 			                ////////////////////

 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }  
/*审核*/
function checkFuc(){
	var selectedRows = $("#bmbhdGrid").datagrid('getSelections');
	var pnoStr = "";
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要审核的数据！');
		return;
	}
	if(selectedRows.length > 1){
		 for(index in selectedRows){
			 pnoStr += ","+ selectedRows[index].userId;
		 }
	}
	
	$('#bmbhdCheckInfo').dialog({
    title: '报名审核',
    width: 450,
    height: 350,
    
    closed: false,
    cache: false,
    href: '../zxxxgl/bmbCheck.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			    	$.ajax({
			    		url:'<%=request.getContextPath()%>/userBgTrol/checkUserBgInfo',
			    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    	    data: {"pnoStr":pnoStr,
				    	       "checkUserId":$("#checkUserId").val(),
				    	       "checkStatus": $('#checkStatus').combobox('getValue'),
				    	       "checkRemark":$("#checkRemark").val()
				    	       },    //参数值
			    	    type: "POST",   //请求方式
			    	    success: function(data) {
			    	    	var resObj = eval("("+data+")");
				            if(resObj.flag == '0'){
				            	 $.messager.alert('系统提示','操作成功！');
				            	 $("#bmbhdGrid").datagrid("reload");
				            	 $('#bmbhdCheckInfo').dialog('close');
					        }else{
					        	 $.messager.alert('系统提示','操作失败，造成失败原因：'+resObj.errorMsg);
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
				$('#bmbhdCheckInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () { 
    }  
});
}

/*导出学员模板*/
function exportXymbFuc(){
	var url= "<%=request.getContextPath()%>/userBgTrol/exportModel?";
	window.location.href= url; 
} 


var dataFlag;
/*导入报名*/
function importBmFuc(){
	$('#importBmInfo').dialog({
    title: '导入报名',
    width: 350,
    height: 150,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/bmFormImport.jsp',
    modal: true,
     buttons:[{
			text:'保存',
			iconCls:'icon-ok',
			handler:function(){
    	 		uploadExcel();
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#bjglhdAddInfo').dialog('close');
			}
		}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#userAddGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 230,
	width:'100%',
	toolbar: '#userAddTool',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false    
     });  
    }  
});
}

function uploadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
      
     if(fileName !=""){   
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: "<%=request.getContextPath()%>/userBgTrol/importBmb?",
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 			            	var resObj = eval("("+data+")");
  				            dataFlag = resObj.flag;
  				            $('#importBmInfo').dialog('close');
		            		showImportZxqkFuc(resObj.rows); 

 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }
/*展示导入的执行文件内容*/
function showImportZxqkFuc(dates){
	$('#showImportBmInfo').dialog({
    title: '学员导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zxxxgl/bmImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    	 saveZxqk(dates);
				 $('#showImportBmInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#showImportBmInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		 $('#drbmhdGrid').datagrid({    
			    url:'', 
			    border:true,
				striped: true,
				collapsible:true,
				height: 360,
				
				sortName: '',
				sortOrder: 'desc',
				remoteSort: false,  
				 
			    columns:[[    
			         {field:'classId',title:'班级编码',width: $(this).width() * 0.15,align:'center'},
			         {field:'name',title:'姓名',width: $(this).width() * 0.1,align:'center'},
			         {field:'pnum',title:'身份证号',width: $(this).width() * 0.2,align:'center'},
			         {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center'},
			         {field:'mz',title:'民族',width: $(this).width() * 0.1,align:'center'},
			         {field:'partyName',title:'党派',width: $(this).width() * 0.1,align:'center'},
			         {field:'workName',title:'工作单位',width: $(this).width() * 0.15,align:'center'},
			         {field:'bgDepartmentId',title:'部门',width: $(this).width() * 0.1,align:'center'},
			         {field:'placeName',title:'职务',width: $(this).width() * 0.1,align:'center'},
			         {field:'zyjs',title:'专业技术职务',width: $(this).width() * 0.15,align:'center'},
			         {field:'brith',title:'出生年月',width: $(this).width() * 0.15,align:'center'},
			         {field:'domicilePlace',title:'所属地区',width: $(this).width() * 0.15,align:'center'},
			         {field:'degree',title:'文化程度',width: $(this).width() * 0.15,align:'center'},
			         {field:'tel',title:'电话',width: $(this).width() * 0.15,align:'center'},
			         {field:'remark',title:'备注',width: $(this).width() * 0.08,align:'center'},
			         {field:'errMsg',title:'错误提示',width: $(this).width() * 0.4,align:'center'}
			    ]]    
			});
	$('#drbmhdGrid').datagrid('loadData',dates);
	
    } //loadEnd
});
}

//执行情况保存
function saveZxqk(dates){
   if(dataFlag==false){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
   //var rows = $('#ygdrGrid').datagrid('getRows');
   //if(isEmpty(rows)){
   //alert(isEmpty(rows));  
   //}
   $.blockUI();
    $.ajax({
                url: "../userBgTrol/saveBm",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                  if(data.flag == true){
                     $.messager.alert('提示','导入成功 ');
                     $('#showImportZxqkInfo').dialog('close');
                     $("#bmbhdGrid").datagrid("reload");
					}else{
						$.messager.alert('错误','导入失败,请核查数据中错误提示 '); //+data.cause
				   }	
                },
                error: function(data){
                   $.unblockUI();
                   $.messager.alert('错误','导入失败,请核查数据中错误');
                }
            });
}
function reload(){
	$("#bmbhdGrid").datagrid("reload");
}
//单个审核
function signelCheck(){

	var selectedRows = $("#bmbhdGrid").datagrid('getSelections');
	if(selectedRows.length == 0){
		$.messager.alert('系统提示','请选择一条要审核的数据！');
		return;
	}
	if(selectedRows.length > 1){
		$.messager.alert('系统提示','审核操作只能针对一条记录！');
		return;
	}
	var row = selectedRows[0];
	if(row.isState != '0'){
		$.messager.alert('系统提示','当前状态无法进行审核！');
		return;
	}
	$('#bmbhdCheckInfo').dialog({
    title: '报名表审核',
    width: 650,
    height: 450,
    closed: false,
    cache: false,
    href: '../zxxxgl/bmbSingleCheck.jsp?pnum='+row.pnum,
    modal: true,
    buttons:[ {
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				if($("#checkRemark").val().length>50){
				alert("审核意见长度不超过50个字");
				return;
				}
					    	$.ajax({
					    		url:'<%=request.getContextPath()%>/userBgTrol/checkUserBgInfo',
					    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					    	    data: {"id":row.id,
						    	       "checkUserId":$("#checkUserId").val(),
						    	       "checkStatus":$("#checkStatus").combobox('getValue'),
						    	       "checkRemark":$("#checkRemark").val(),
						    	       "checkDate":$("#checkDate").val()
						    	       
						    	       },    //参数值
					    	    type: "POST",   //请求方式
					    	    success: function(data) {debugger 
					    	    	var resObj = eval("("+data+")");
						            if(resObj.flag == '0'){
						            	 $.messager.alert('系统提示','操作成功！');
						            	 $("#bmbhdGrid").datagrid("reload");
						            	 $('#bmbhdCheckInfo').dialog('close');
							        }else{
							        	 $.messager.alert('系统提示','操作失败：'+resObj.errorMsg);
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
				 $('#bmbhdCheckInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function() { 
		$('#singelCkFm').form('load', row); 
			$('#remark').html(row.remark);
    }
});
	
} 

//导入文件
function importFuc(){
	$("#addBmbFileForm").ajaxSubmit({
		dataType:"html",
		url : "../userBgTrol/bmbUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
          $.unblockUI();
         
           $('input[type="file"]').attr('value',''); 
           $('#addBmbFileForm')[0].reset();  
       } ,  
		success : function(data) {
    		var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     showImportZxqkFuc(result.rows); 
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			} 
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});

} 


//查询
function selectSubmit(){
	
	var newData =[];
	var gridData = $("#bmbhdGrid").datagrid('getData');//搜索获取当前grid的所有数据
	if(j==0){
		rowsNew= gridData.rows;
		j=1;
	}
	var rows=rowsNew;
	//审核状态转换
	var isSta=$("#isState").textbox('getValue');
	if(isSta!=''){
		switch(isSta){
		case '待审核':
			isSta="0";
			break;
		case '审核成功':
			isSta="1";
			break;
		case '审核失败':
			isSta="2";
			break;
		case '查看成绩':
			isSta="3";
			break;
		case '培训结束':
			isSta="4";
			break;
		default:
			isSta="5";
			break;
		}
		
	}
	
	for(var i =0;i<rows.length;i++){
	if(($("#bName").textbox('getValue')==''||rows[i]['bName'] == $("#bName").textbox('getValue'))&&
			($("#name").textbox('getValue')==''||rows[i]['name'] == $("#name").textbox('getValue'))&&
			($("#pnum").textbox('getValue')==''||rows[i]['pnum'] == $("#pnum").textbox('getValue'))&&
			($("#tel").textbox('getValue')==''||rows[i]['tel'] == $("#tel").textbox('getValue'))&&
			($("#workName").textbox('getValue')==''||rows[i]['workName'] == $("#workName").textbox('getValue'))&&
			(isSta==''||rows[i]['isState'] == isSta))
	        newData.push(rows[i]);
	}
	$("#bmbhdGrid").datagrid('loadData',newData);
}



function searchBmbhdGrid(){
	initBmbhdGrid(form2Json("searchform"));
}

//重置
function resetSubmit(){
	$("#bName").textbox('setValue','');
	$("#name").textbox('setValue','');
	$("#pnum").textbox('setValue','');
	$("#tel").textbox('setValue','');
	$("#workName").textbox('setValue','');
	$("#isState").combobox('setValue','');
	$("#bmbhdGrid").datagrid('load');
}


//将表单数据转为json
function form2Json(id) {

    var arr = $("#" + id).serializeArray()
    var jsonStr = "";

    jsonStr += '{';
    for (var i = 0; i < arr.length; i++) {
        jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
    }
    jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
    jsonStr += '}'

    var json = JSON.parse(jsonStr)
    return json
}


//导出excel
 function exportFuc(){
    
    window.location.href=basePath+"userBgTrol/bmExport";

} 

</script>


<body style="margin: 1px;">
<form name="searchform" method="post" action="" id ="searchform">
<table >
     <tr>
        <td>班级名称：<input id="bName" name="bName" class="easyui-textbox"/></td>
       
        <td>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input id="name" name="name" class="easyui-textbox"/></td>
        
        <td>身份证号：<input id="pnum" name="pnum" class="easyui-numberbox"/></td>
       
         <td>联系电话：<input id="tel" name="tel" class="easyui-numberbox"/></td>
       
        </tr>
        <tr>
        <td>工作单位：<input id="workName" name="workName" class="easyui-textbox"/></td>
        
        <td>审核状态：<input id="isState" name="isState" class="easyui-combobox" data-options="editable:false,
		valueField: 'value',
		textField: 'label',
		data: [
		{
			label: '待审核',
			value: '0'
		},
		{
			label: '审核成功',
			value: '1'
		},
		{
			label: '审核失败',
			value: '2'
		},
		{
			label: '查看成绩',
			value: '3'
		},
		{
			label: '培训结束',
			value: '4'
		}
		
		]" />
		
		</td>
        
        <td>
           <a id="e" onclick="searchBmbhdGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
           <a  id="f" onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">重置</a>
        </td>
     </tr>
 </table>
 </form>
 
<form id="addBmbFileForm" method="post" action="../userBgTrol/bmbUpload" enctype="multipart/form-data" >
	<div id="tb">
		<div id="bmbhdTool"  style="background-color:#FFFFFF;">
	
			<a id="a" onclick="qryBmbDetailFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
			<%--<a onclick="reload()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>--%>
			<a id="b" onclick="signelCheck()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核</a>
			<%--<a onclick="importBmFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导入报名</a>
			--%><a id="c" onclick="exportXymbFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出学员模板</a>
	        <a id="d" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
	        	 <input  onchange="importFuc()" id="file" name="file" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入报名</a>
           		<a id="g" onclick="exportFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出excel</a>
		</div>
	</div>
</form>
<div>
<table id="bmbhdGrid"></table>  
</div>
<div id="bmbhdAddInfo" align="center"></div>
<div id="bmbhdCheckInfo" align="center"></div>
<div id="importBmInfo" align="center"></div>
<div id="showImportBmInfo" align="center"></div>
</body>
</html>
