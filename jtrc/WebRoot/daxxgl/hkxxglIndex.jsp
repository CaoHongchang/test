<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>户口信息管理</title>

<script type="text/javascript">
$(function(){
	init();
});
function init(){
	showIndex('');
		if(window.top.cacheArchive.cacheDpno){
			$("#hkxxglGrid").datagrid("load",{
				dept:"daNum",
				key:window.top.cacheArchive.cacheDpno
			});
		}

}
function doSearch(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#p_no").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	$("#hkxxglGrid").datagrid("load",{
		dept:dept,
		key:key,
		pnum:pnum,
		name:name,
		age:age
	});
}
function showIndex(param){
	
	$('#hkxxglGrid').datagrid({    
		url:'<%=request.getContextPath()%>/hkxx/gethkxxlist', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		//fitColumns:true,
		height: wholeHeight,
		toolbar: '#zcpshdTool',
		queryParams: {
			"param": param,
			dept:"daNum",
			key:window.top.cacheArchive.cacheDpno
		},
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
		pagination:true,
		singleSelect:true,
	    columns:[[    
	         {field:'uid',title:'选择',checkbox:true,align:'center'},
	         {field:'id',title:'id',width : $(this).width() * 0.1,align:'center',hidden:true},  
	         {field:'dpno',title:'档案号',width : fixWidth(0.1),align:'center'},    
	         {field:'NAME',title:'代理人姓名',width: fixWidth(0.1),align:'center'},
	         {field:'sex',title:'性别',width: fixWidth(0.05),align:'center'},
	         {field:'pnum',title:'身份证号',width: fixWidth( 0.2),align:'center'},
	         {field:'tel',title:'联系电话',width: fixWidth( 0.1),align:'center'},
	         {field:'work_name',title:'工作单位',width: fixWidth( 0.2),align:'center'},
	         {field:'type',title:'户口状态',width: fixWidth(0.1),align:'center',
	        	 formatter: function(value,row,index){
                     if(value == 0){
                         return '借出';
                     }else if(value == 1){
                         return '归还';
                     }else if(value == 2){
                         return '新增';
                     }else{
                    	 return '未知';
                        }
			      }   
				}
	    ]] ,
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.ID;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.NAME;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.tel;//联系电话
		setArchiveHead();
	},
	onLoadSuccess:function(data){
		//$('#hkxxglGrid').datagrid('checkAll');
	}       
	});  
		var pager = $('#hkxxglGrid').datagrid('getPager');
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

//户口信息添加
var submit =false;
function addHkxx(){
	try{
		$('#addHkxx').dialog("clear");
	}catch(e){};
	
	$('#addHkxx').dialog({
	        title: '户口新增',
	        width: 650,
	        height: 430,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: true,
	        href: 'hkxxglAdd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){ 
	            	var dpno =$("#res_dpno").val().trim();
	            	if(dpno==''){
	            		$.messager.alert('系统提示','请输入档案号！');
	            		return;
	            	}
	            	var uid=$("#uid").val();
	            	if(uid==''){
	            		$.messager.alert('系统提示','当前系统不存在此档案号，请确认！');
	            		return;
	            	}
	            	var residenceNo=$("#residenceNo").val();
	            	if(residenceNo==''){
	            		$.messager.alert('系统提示','户口编号不能为空！');
	            		return;
	            	}
	         		var hkxxdata= $("#hkAddFm").serialize();
	         		if(submit)
	         			return;
	         		submit=true;
	         		$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/addHkxx',
						data: {hkxxdata:hkxxdata},
						success:function(data){
							submit=false;
							$.messager.alert('系统提示',data.message);
							if(data.flag){
								$('#addHkxx').dialog('close');
								//清除弹窗
								$('#addHkxx').dialog("clear");
								$('#hkxxglGrid').datagrid('load');
							}
						}
					});
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	          	  $('#addHkxx').dialog('close');
	          	  $('#addHkxx').dialog("clear");
	            }
	        }],
	         onLoad:function(){
	         	var key = window.top.cacheArchive.cacheDpno;
	         	if(key!=null&&key!='')
	         	$("#res_dpno").textbox('setValue',key);
	         }
	});

}

//户口信息修改
function updateHkxx(){
	try{
		$('#addHkxx').dialog("clear");
	}catch(e){};
	var row=$("#hkxxglGrid").datagrid("getSelections");
	if(row==''){
	    $.messager.alert('系统提示','请选择要操作的数据!');
	    return;
	}
	if(row.length>1){
	    $.messager.alert('系统提示','只允许对一条数据进行修改！');
	    return;
	 }
	$('#addHkxx').dialog({
	        title: '修改户口信息',
	        width: 650,
	        height: 430,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'hkxxglAdd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){ 
	            	var residenceNo=$("#residenceNo").val();
	            	if(residenceNo==''){
	            		$.messager.alert('系统提示','户口编号不能为空！');
	            		return;
	            	}
	         		var hkxxdata= $("#hkAddFm").serialize();
	         		if(submit)
	         			return;
	         		submit=true;
	         		$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/updateHkxx',
						data: {hkxxdata:hkxxdata},
						success:function(data){
							submit=false;
							$.messager.alert('系统提示',data.message);
							if(data.flag){
								$('#addHkxx').dialog('close');
								//清除弹窗
								$('#addHkxx').dialog("clear");
								$('#hkxxglGrid').datagrid('load');
							}
						}
					});
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	          	  $('#addHkxx').dialog('close');
	          	  $('#addHkxx').dialog("clear");
	            }
	        }],
	        onLoad:function(){
	        	$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/gethkxxInformation',
						data: {id:row[0].id},
						success:function(data){
							$("#id").val(data.id);
							$("#res_dpno").textbox('setValue',data.res_dpno);
							$("#res_dpno").textbox('textbox').attr('disabled','disabled');
							$("#residenceNo").textbox('setValue',data.residence_no);
							$("#relName").textbox('setValue',data.rel_name);
							$("#otherAdr").textbox('setValue',data.other_adr);
							$(":radio[name='blood'][value='" + data.blood + "']").prop("checked", "checked");
							//$("#blood").attr('checked',data.blood);
							$("#stature").numberbox('setValue',data.stature);
							$("#xyName").textbox('setValue',data.xy_name);
							$("#byState").textbox('setValue',data.by_state);
							$("#serviceAdr").textbox('setValue',data.service_adr);
							$("#proName").textbox('setValue',data.pro_name);
							$("#hPro").textbox('setValue',data.h_pro);
							$("#police").textbox('setValue',data.police);
							$("#r_date").datebox('setValue',data.rDate);
							$("#rAdr").textbox('setValue',data.r_adr);
							$("#orgAdr").textbox('setValue',data.org_adr);
							$("#q_date").datebox('setValue',data.qDate);
							$("#qAdr").textbox('setValue',data.q_adr);
							if(data.c_name!=null&&data.c_name!='')
							$("#sessionRealName").textbox('setValue',data.c_name);
							$("#addDate").datebox('setValue',data.addDate);
							
						}
					});
	        }
	});

}

function lookHkxx(){
	try{
		$('#addHkxx').dialog("clear");
	}catch(e){};
	var row=$("#hkxxglGrid").datagrid("getSelections");
	if(row==''){
	    $.messager.alert('系统提示','请选择要操作的数据!');
	    return;
	}
	if(row.length>1){
	    $.messager.alert('系统提示','只允许对一条数据进行操作！');
	    return;
	 }
	$('#addHkxx').dialog({
	        title: '查看户口信息',
	        width: 650,
	        height: 430,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'hkxxglAdd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){ 
	            	var residenceNo=$("#residenceNo").val();
	            	if(residenceNo==''){
	            		$.messager.alert('系统提示','户口编号不能为空！');
	            		return;
	            	}
	         		var hkxxdata= $("#hkAddFm").serialize();
	         		if(submit)
	         			return;
	         		submit=true;
	         		$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/updateHkxx',
						data: {hkxxdata:hkxxdata},
						success:function(data){
							submit=false;
							$.messager.alert('系统提示',data.message);
							if(data.flag){
								$('#addHkxx').dialog('close');
								//清除弹窗
								$('#addHkxx').dialog("clear");
							}
						}
					});
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	          	  $('#addHkxx').dialog('close');
	          	  $('#addHkxx').dialog("clear");
	            }
	        }],
	        onLoad:function(){
	        	$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/gethkxxInformation',
						data: {id:row[0].id},
						success:function(data){
							$("#id").val(data.id);
							$("#res_dpno").textbox('setValue',data.res_dpno);
							$("#res_dpno").textbox('textbox').attr('disabled','disabled');
							$("#residenceNo").textbox('setValue',data.residence_no);
							$("#relName").textbox('setValue',data.rel_name);
							$("#otherAdr").textbox('setValue',data.other_adr);
							$(":radio[name='blood'][value='" + data.blood + "']").prop("checked", "checked");
							$("#stature").numberbox('setValue',data.stature);
							$("#xyName").textbox('setValue',data.xy_name);
							$("#byState").textbox('setValue',data.by_state);
							$("#serviceAdr").textbox('setValue',data.service_adr);
							$("#proName").textbox('setValue',data.pro_name);
							$("#hPro").textbox('setValue',data.h_pro);
							$("#police").textbox('setValue',data.police);
							$("#r_date").datebox('setValue',data.rDate);
							$("#rAdr").textbox('setValue',data.r_adr);
							$("#orgAdr").textbox('setValue',data.org_adr);
							$("#q_date").datebox('setValue',data.qDate);
							$("#qAdr").textbox('setValue',data.q_adr);
							$("#sessionRealName").textbox('setValue',data.c_name);
							$("#addDate").datebox('setValue',data.addDate);
							
						}
					});
	        }
	});

}

function hkjc(){
	try{
		$('#Hkjcdialog').dialog("clear");
	}catch(e){
	}
	var row=$("#hkxxglGrid").datagrid("getSelections");
	if(row==''){
	    $.messager.alert('系统提示','请选择要操作的数据!');
	    return;
	}
	if(row.length>1){
	    $.messager.alert('系统提示','只允许对一条数据进行操作！');
	    return;
	 }
	 if(row[0].type==0){
	 	 $.messager.alert('系统提示','户口当前借出中，无法再次借出！');
	     return;
	 }
	$('#Hkjcdialog').dialog({
	        title: '户口借出',
	        width: 650,
	        height: 270,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'hkjcgladd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){
	            	var hkjcdata= $("#hkjcAddFm").serialize();
	           		if(submit)
	         			return;
	         		submit=true;
					$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/hkjc',
						data: {hkjcdata:hkjcdata},
						success:function(data){
							submit=false;
							$.messager.alert('系统提示',data.message);
							if(data.flag){
								$('#Hkjcdialog').dialog('close');
								//清除弹窗
								$('#Hkjcdialog').dialog("clear");
								$('#hkxxglGrid').datagrid('load');
							}
						}
					});
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	          	  $('#Hkjcdialog').dialog('close');
	          	  $('#Hkjcdialog').dialog("clear");
	            }
	        }],
	        onLoad:function(){
	        	$("#rec_id_hkjc").val(row[0].id);
	        	$("#res_dpno_hkjc").textbox('setValue',row[0].dpno);
	        }
	});
}

function hkgh(){
	try{
		$('#Hkjcdialog').dialog("clear");
	}catch(e){
	}
	var row=$("#hkxxglGrid").datagrid("getSelections");
	if(row==''){
	    $.messager.alert('系统提示','请选择要操作的数据!');
	    return;
	}
	if(row.length>1){
	    $.messager.alert('系统提示','只允许对一条数据进行操作！');
	    return;
	 }
	 if(row[0].type!=0){
	 	 $.messager.alert('系统提示','户口当前并未借出，无法归还');
	     return;
	 }
	$('#Hkjcdialog').dialog({
	        title: '户口归还',
	        width: 650,
	        height: 300,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'hkghgladd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){
	            	var hkghdata= $("#hkghghFm").serialize();
	           		if(submit)
	         			return;
	         		submit=true;
					$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/hkgh',
						data: {hkghdata:hkghdata},
						success:function(data){
							submit=false;
							$.messager.alert('系统提示',data.message);
							if(data.flag){
								$('#Hkjcdialog').dialog('close');
								//清除弹窗
								$('#Hkjcdialog').dialog("clear");
								$('#hkxxglGrid').datagrid('load');
							}
						}
					});
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	          	  $('#Hkjcdialog').dialog('close');
	          	  $('#Hkjcdialog').dialog("clear");
	            }
	        }],
	        onLoad:function(){
	        	var id=row[0].id;
	        	$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/hkxx/getlatestHkjc',
						data: {id:id},
						success:function(data){
							submit=false;
							$("#id").val(data.id);
							$("#hid").val(data.hid);
							$("#residenceId").val(data.residence_id);
							$("#res_dpno_hkgh").textbox('setValue',data.dpno);
							$("#out_date").datebox('setValue',data.date);
							$("#out_use").textbox('setValue',data.user);
							$("#out_name").textbox('setValue',data.name);
						}
					});
	        }
	});
}
</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include> 

<div id="tb">
   <div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="addHkxx();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加户口信息</a>
		<a onclick="updateHkxx();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改户口信息</a>
		<a onclick="lookHkxx();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">户口信息查看</a>
		<a onclick="hkjc();" id="hkjc" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">户口借出</a>
		<a onclick="hkgh();" id="hkgh" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">户口归还</a>
		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>

</div>
<div>
<select id="dept" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" id="p_no" data-options="iconCls:''" style="width:150px"> 
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >
&nbsp;&nbsp;
<label>年龄：</label>
<select class="easyui-combobox" value="" name="seachAge" id="searchAge" data-options="editable:false,panelHeight:null" style="width:150px;">
  <option value="">所有</option>
  <option value="30">30以下</option>
  <option value="40">31-40岁</option>
  <option value="50">41-50岁</option>
  <option value="60">51岁以上</option>
</select>
<a class="easyui-linkbutton" onclick="doSearch();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="hkxxglGrid"></table> 

<div id="addHkxx"></div> 
<div id="Hkjcdialog"></div> 
</div>
</body>
</html>
