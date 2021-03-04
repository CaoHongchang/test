<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<title>学员管理</title>

<script type="text/javascript">
var dateFlag,repeatFlag,classFlag,countFlag;
var activityId ;
$(function(){
	   $('#contentGrid1').datagrid({    
	    	url:basePath+"examStudent/queryClassList", 
	     	border:true,
		 	pageSize:10,
		 	pageList:[10,20,30,40],
		 	striped: true,
		 	singleSelect: true,
		 	collapsible:true,
		 	fitColumns:true,
			height: '100%',
			toolbar: '',
			sortName: '',
			sortOrder: 'desc',
			pagination : true,
			remoteSort: false,    
	    	columns:[[    
	        	{field:'class_id',title:'选择',align:'center',hidden:true},
	        	{field:'class_num',title:'班级编号',width : $(this).width() * 0.01,align:'center'},
	        	{field:'class_name',title:'班级名称',width : $(this).width() * 0.01,align:'center'},
	        	{field:'project_name',title:'项目名称',width : $(this).width() * 0.01,align:'center'},
	        	{field:'class_sum',title:'人数上限',width : $(this).width() * 0.01,align:'center'}   
	    	]],
	    	onClickRow:function(rowIndex, rowData){
	    		setListDate("",rowData.class_id);
	    	}
		});   
			var pager = $('#contentGrid1').datagrid('getPager');
			pager.pagination({
				beforePageText : '第',// 页数文本框前显示的汉字
				afterPageText : '/ {pages} 页',
				displayMsg : '',
				buttons : [ {
					iconCls : 'icon-excel',
					handler : function() {
					}
				} ]
			});
	});

	function setListDate(queryParams,id){
		activityId = id;
		var grid = {    
		    url:basePath+"examStudent/getStudentList?id="+activityId, 
		  	border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			singleSelect: true,
			fitColumns:true,
			height: wholeHeight,
			width:1600,
			toolbar: '#gridTool',
			sortName: '',
			sortOrder: 'desc',
			pagination : true,
			remoteSort: false,    
		    columns:[[    
		         {field:'id',title:'选择',hidden:true,align:'center'},
		         {field:'pnum',title:'身份证号',width : fixWidth(0.2),align:'center'},    
		         {field:'name',title:'姓名',width : fixWidth(0.2),align:'center'},    
		         {field:'sex',title:'性别',width : fixWidth(0.2),align:'center',
		               		 formatter: function(value,row,index){
		       			if(value==0)
		       				return '男';
		       			else if(value==1)
		       				return '女';
		       				else return value;
		       		 }
		         },   
		         {field:'work_name',title:'工作单位',width: fixWidth(0.2),align:'center'},
		         {field:'result_score',title:'成绩',width: fixWidth(0.3),align:'center'},
		         {field:'exam_type',title:'考试类型',width: fixWidth(0.2),align:'center',
			            formatter: function(value,row,index){
			            	if (value == 1) {
			            	  return "安全三类人员新取证考试";
							}else if (value == 2) {
			            	  return "安全三类人员继续教育考试";
							}else if (value == 3) {
			            	  return "安全考评员新取证考试";
							}else if (value == 4) {
			            	  return "安全考评员继续教育考试";
							}else if (value == 5) {
	            			  return "专业技术人员继续教育考试";
							}else{
								return "未知";
							}
						}
		         },
		         {field:'project_name',title:'考试名称',width: fixWidth(0.2),align:'center'},
		         {field:'exam_date',title:'考试日期',width: fixWidth(0.2),align:'center'},
		         {field:'exam_time',title:'考试时间',width: fixWidth(0.2),align:'center'},
		         {field:'seat_num',title:'座位号',width: fixWidth(0.2),align:'center'},
		         {field:'exam_address',title:'考试地点',width: fixWidth(0.2),align:'center'},
				 {title:'操作',field:'1',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
 				      return "<a  style=\"color: blue;\"  onclick=\"detail("+row.id+")\">查看</a>";
					}   
				 }

		    ]]    
		}; 
		if(queryParams && queryParams!=''){
	 		$('#contentGrid2').datagrid($.extend(true,grid,{queryParams:{param:queryParams}}));  
		}else{
	 		$('#contentGrid2').datagrid(grid);  
		}
		var pager = $('#contentGrid2').datagrid('getPager');
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
 
//弹出查询框
function searchDiv(){
    $('#searchInfo').dialog({    
	    title: '',    
	    width: 1000,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: '../zyzgksgl/xyglSearch.jsp',    
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

function formatterdate(val, row) {
	if (val != null) {
		var date = new Date(val);
		var month;
		if((date.getMonth() + 1)>=10)
			month = date.getMonth() + 1;
		else
			month = '0'+(date.getMonth() + 1);
		var day;
		if(date.getDate()>=10)
			day = date.getDate();
		else
			day = '0'+date.getDate();
		return date.getFullYear() + '-' + month + '-' + day;
	}
}

function formatterdate1(val, row) {
	if (val != null) {
		var date = new Date(val);
		var month;
		if((date.getMonth() + 1)>=10)
			month = date.getMonth() + 1;
		else
			month = '0'+(date.getMonth() + 1);
		return date.getFullYear() + '-' + month;
	}
}

function detail(id){
	$('#addInfo').dialog({
	    title: '学员查看',
	    width: 700,
	    height: 500,
	    closed: false,
	    cache: false,
	    href: '../zyzgksgl/xyglDetail.jsp',
	    modal: true,
	    buttons:[ {
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#addInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function() {
	    	$.ajax({
				url:'../examStudent/detail',
			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    data: {"id" : id},    //参数值
			    type: "POST",   //请求方式
			    success: function(data) {
			    	data.certificate_time = formatterdate(data.certificate_time);
			    	data.expiry_date = formatterdate(data.expiry_date);
			    	data.birth_date = formatterdate1(data.birth_date);
			    	if(data.apply_type=='1')
			    		data.apply_type='首次申请';
			    	else if(data.apply_type=='2')
			    		data.apply_type='再次申请';
					$('#addFm').form('load', data);
			    },
			    error: function() {
			        //请求出错处理
			    }
			});
	    }
	});
}

function impScores(){
	dateFlag = true;
	repeatFlag = false;
	$("#importScore").ajaxSubmit({
		dataType:"html",
		url : "../examStudent/importResult",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
           $.unblockUI();
           $('input[type="file"]').attr('value',''); 
           $('#importScore')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     repeatFlag=result.repeatFlag;
			     showScore(result.rows);
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
			
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
}

function showScore(data){
	$('#showImport').dialog({
    title: '成绩导入',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../zyzgksgl/import.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    		saveScore(data);
					$('#showImport').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
					$('#showImport').dialog('close');
				}
			}],
    iconCls: 'icon-save',
	    onLoad: function () {
		    $('#importGrid').datagrid({    
		    url:'', 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			height: 360,
			fit:true,
			toolbar: '',
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false,    
		    columns:[[    
				{field:'classNum',title:'班级编码',width: $(this).width() *0.1 ,align:'center'},
				{field:'className',title:'班级名称',width: $(this).width() *0.15,align:'center'},
				{field:'cardId',title:'身份证',width: $(this).width() *0.15,align:'center'},
				{field:'userName',title:'姓名',width: $(this).width() *0.15,align:'center'},
				{field:'resultScore',title:'成绩',width: $(this).width() *0.15,align:'center'},
				{field:'errMsg',title:'错误提示',width: $(this).width() *0.5}
		        ]]    
	        });  
			$('#importGrid').datagrid('loadData',data);
    	}
	});
}

function saveScore(datas) {
	if (dateFlag != true) {
		$.messager.alert('错误', '保存失败,请核查数据中错误提示 ', 'error');
		return;
	}
	if(repeatFlag){
		if(!confirm("已有成绩是否覆盖保存?")){
	        return ;
	    }
	}
	$.blockUI();
	$.ajax({
		url : "../examStudent/saveResult",
		type : "POST",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		data : JSON.stringify(datas),
		async : true,
		success : function(data) {
			$.unblockUI();
			if (data.flag == true) {
				$.messager.alert('提示', '导入成功 ');
				setListDate('',activityId);
			} else {
				$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
			}
		},
		error : function(data) {
			$.unblockUI();
			$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
		}
	});
}

function expScore(){
	var url= "<%=request.getContextPath()%>/examStudent/exportResult";
	window.location.href= url;
}

function impTickets(){
	dateFlag = true;
	repeatFlag = false;
	$("#importTicket").ajaxSubmit({
		dataType:"html",
		url : "../examStudent/importTicket",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
           $.unblockUI();
           $('input[type="file"]').attr('value',''); 
           $('#importTicket')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     repeatFlag=result.repeatFlag;
			     showTicket(result.rows);
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
}

function showTicket(data){
	$('#showImport').dialog({
    title: '准考证导入',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../zyzgksgl/import.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    		saveTicket(data);
					$('#showImport').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
					$('#showImport').dialog('close');
				}
			}],
    iconCls: 'icon-save',
	    onLoad: function () {
		    $('#importGrid').datagrid({    
		    url:'', 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			height: 360,
			fit:true,
			toolbar: '',
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false,    
		    columns:[[
				{field:'classNum',title:'班级编码',width: $(this).width() *0.1 ,align:'center'},
				{field:'cardId',title:'身份证号',width: $(this).width() *0.15,align:'center'},
				{field:'userName',title:'姓名',width: $(this).width() *0.15,align:'center'},
				{field:'examType',title:'考试类型',width: $(this).width() *0.1 ,align:'center'},
				{field:'projectName',title:'考试名称',width: $(this).width() *0.15,align:'center'},
				{field:'examDate',title:'考试日期',width: $(this).width() *0.15,align:'center'},
				{field:'examTime',title:'考试时间',width: $(this).width() *0.15,align:'center'},
				{field:'seatNum',title:'座位号',width: $(this).width() *0.15,align:'center'},
				{field:'examAddress',title:'考试地点',width: $(this).width() *0.15,align:'center'},
				{field:'errMsg',title:'错误提示',width: $(this).width() *0.5}
		        ]]    
	        });  
			$('#importGrid').datagrid('loadData',data);
    	}
	});
}

function saveTicket(datas) {
	if (dateFlag != true) {
		$.messager.alert('错误', '保存失败,请核查数据中错误提示 ', 'error');
		return;
	}
	if(repeatFlag){
		if(!confirm("已有准考证是否覆盖保存?")){
	        return ;
	    }
	}
	$.blockUI();
	$.ajax({
		url : "../examStudent/saveTicket",
		type : "POST",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		data : JSON.stringify(datas),
		async : true,
		success : function(data) {
			$.unblockUI();
			if (data.flag == true) {
				$.messager.alert('提示', '导入成功 ');
				setListDate('',activityId);
			} else {
				$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
			}
		},
		error : function(data) {
			$.unblockUI();
			$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
		}
	});
}

function expTicket(){
	var url= "<%=request.getContextPath()%>/examStudent/exportTicket";
	window.location.href= url;
}

function impStudents(){
	dateFlag = true;
	classFlag = true;
	countFlag = true;
	repeatFlag = true;
	$("#importStudent").ajaxSubmit({
		dataType:"html",
		url : "../examStudent/importStudent",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
           $.unblockUI();
           $('input[type="file"]').attr('value',''); 
           $('#importStudent')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     classFlag=result.classFlag;
			     countFlag=result.countFlag;
			     repeatFlag=result.repeatFlag;
			     showStudent(result.rows);
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
			
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
}

function showStudent(data){
	$('#showImport').dialog({
    title: '学员导入',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../zyzgksgl/import.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
		    		saveStudent(data);
					$('#showImport').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
					$('#showImport').dialog('close');
				}
			}],
    iconCls: 'icon-save',
	    onLoad: function () {
		    $('#importGrid').datagrid({    
		    url:'', 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			height: 360,
			fit:true,
			toolbar: '',
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false,    
		    columns:[[    
				{field:'classNum',title:'班级编码',width: $(this).width() *0.1 ,align:'center'},
				{field:'cardId',title:'身份证号',width: $(this).width() *0.15,align:'center'},
				{field:'userName',title:'姓名',width: $(this).width() *0.15,align:'center'},
				{field:'sex',title:'性别',width: $(this).width() *0.15,align:'center'},
				{field:'birthDate',title:'出生年月',width: $(this).width() *0.15,align:'center'},
				{field:'certificateNum',title:'证书编号',width: $(this).width() *0.15,align:'center'},
				{field:'certificateTime',title:'发证时间',width: $(this).width() *0.15,align:'center'},
				{field:'expiryDate',title:'到期时间',width: $(this).width() *0.15,align:'center'},
				{field:'city',title:'地市',width: $(this).width() *0.15,align:'center'},
				{field:'orgCode',title:'组织机构代码',width: $(this).width() *0.15,align:'center'},
				{field:'companyLevel',title:'企业等级',width: $(this).width() *0.15,align:'center'},
				{field:'companyType',title:'单位类型',width: $(this).width() *0.15,align:'center'},
				{field:'workName',title:'企业名称',width: $(this).width() *0.15,align:'center'},
				{field:'post',title:'职务',width: $(this).width() *0.15,align:'center'},
				{field:'workYears',title:'工作年限',width: $(this).width() *0.15,align:'center'},
				{field:'major',title:'专业类型',width: $(this).width() *0.15,align:'center'},
				{field:'school',title:'毕业院校',width: $(this).width() *0.15,align:'center'},
				{field:'continueEdu',title:'继续教育情况',width: $(this).width() *0.15,align:'center'},
				{field:'degree',title:'学历',width: $(this).width() *0.15,align:'center'},
				{field:'tel',title:'联系方式',width: $(this).width() *0.15,align:'center'},
				{field:'applyType',title:'申请类别',width: $(this).width() *0.15,align:'center'},
				{field:'declareType',title:'申报类别',width: $(this).width() *0.15,align:'center'},
				{field:'remark',title:'备注',width: $(this).width() *0.15,align:'center'},
				  {field:'title',title:'职称',width: $(this).width() *0.15,align:'center'},
     		  	  {field:'learning_content',title:'学习内容',width: $(this).width() *0.15,align:'center'},
      			  {field:'cumulative_hours',title:'累计学时',width: $(this).width() *0.15,align:'center'},
      			  {field:'appointment_time',title:'原职称聘任时间',width: $(this).width() *0.15,align:'center'},
       			  {field:'register_type',title:'学员名册类型',width: $(this).width() *0.15,align:'center'},
				{field:'errMsg',title:'错误提示',width: $(this).width() *0.5}
		        ]]    
	        });  
			$('#importGrid').datagrid('loadData',data);
    	}
	});
}

function saveStudent(datas) {
	if (dateFlag != true) {
		$.messager.alert('错误', '保存失败,请核查数据中错误提示 ', 'error');
		return;
	}
	if(classFlag!=true){
		$.messager.alert('错误', '保存失败,请导入同班级编号的学员信息 ', 'error');
		return;
	}
	if(countFlag!=true){
		$.messager.alert('错误', '保存失败,导入的人员数量超出班级人数上限', 'error');
		return;
	}
	if(repeatFlag!=true){
		if(!confirm("存在已报名学员信息，是否覆盖？")){
	        return ;
	    }
	}
	$.blockUI();
	$.ajax({
		url : "../examStudent/saveStudent",
		type : "POST",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		data : JSON.stringify(datas),
		async : true,
		success : function(data) {
			$.unblockUI();
			if (data.flag == true) {
				$.messager.alert('提示', '导入成功 ');
				setListDate('',activityId);
			} else {
				$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
			}
		},
		error : function(data) {
			$.unblockUI();
			$.messager.alert('错误', '导入失败,请核查数据中错误提示 ');
		}
	});
}

function expStudent(){
	var url= "<%=request.getContextPath()%>/examStudent/exportStudent";
	window.location.href= url;
}
</script>

<body style="margin: 1px;">
	<div id="gridTool" style="background-color:#FFFFFF;">
		<a id="a" onclick="searchDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<form id="importScore" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
	        <a id="b" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
	        <input  onchange="impScores()" id="impScore" name= "impScore" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入成绩</a>
        </form>
		<a id="c" onclick="expScore()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出成绩模板</a>
		<form id="importTicket" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
	        <a id="d" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
	        <input  onchange="impTickets()" id="impTicket" name= "impTicket" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入准考证信息</a>
        </form>
		<a id="e" onclick="expTicket()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出准考证模板</a>
		<form id="importStudent" style="display:inline;" method="post" action="" enctype="multipart/form-data" >
	        <a id="f" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
	        <input  onchange="impStudents()" id="impStudent" name= "impStudent" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入学员</a>
        </form>
		<a id="g" onclick="expStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出学员模板</a>
	</div>
	<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
		<div
			data-options="region:'west',title:'班级列表',split:true,border:false"
			style="width:300px;">
			<table id="contentGrid1"></table>
		</div>
		<div data-options="region:'center',title:'学员列表',border:false">
			<table id="contentGrid2"></table>
		</div>
	</div>
	<div id="addInfo"></div>
	<div id="searchInfo"></div>
	<div id="showImport" align="center"></div>
</body>
</html>