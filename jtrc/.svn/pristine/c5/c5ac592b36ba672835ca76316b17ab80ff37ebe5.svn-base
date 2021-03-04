<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>档案流动管理</title>

<script type="text/javascript">

	$(function(){
   
      init();
 });

function init(){

 $('#daldglGrid').datagrid({    
    url:"<%=request.getContextPath()%>/residenceController/queryResidenceIoInfo?key="+window.top.cacheArchive.cacheDpno, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	queryParams:{
		key:window.top.cacheArchive.cacheDpno
	},
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
         {field:'dpno',title:'档案编号',width : $(this).width() * 0.1,align:'center'},    
         {field:'outDate',title:'移交/接受日期',width : $(this).width() * 0.1,align:'center'},    
         {field:'anum',title:'案卷数量',width : $(this).width() * 0.1,align:'center'},    
         {field:'outUid',title:'移交人',width: $(this).width() * 0.1,align:'center'},
         {field:'jUid',title:'接收人',width: $(this).width() * 0.1,align:'center'},
         {field:'outUse',title:'移交接受原因',width: $(this).width() * 0.2,align:'center'},
         {field:'staffname',title:'录入人',width: $(this).width() * 0.05,align:'center'},
         {field:'addDate',title:'录入时间',width: $(this).width() * 0.05,align:'center'},
         {title:'操作',field:'do',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  remark="'+row.remark+'" id="'+row.id+'" outDate="'+row.outDate+'" anum="'+row.anum+'" '
 				      +'outUid="'+row.outUid+'" jUid="'+row.jUid+'" outUse="'+row.outUse+'" staff="'+row.staff+'" staffname="'+sessionRealName+'" addDate="'+row.addDate+'" onclick="editFuc(this);">修改</a>'
 				      +'&nbsp;<a href="#" style="color: green;" id="'+row.id+'" onclick="deleteFuc(this);">删除</a>';
				}}
  
    ]]    
});  
	var pager = $('#daldglGrid').datagrid('getPager');
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
function deleteFuc(row){
	var statu = confirm("确认删除该档案流动吗?");
    if(!statu){
        return ;
    }
	$.ajax({
		url:'<%=request.getContextPath()%>/residenceController/delResidenceIoInfo',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"id" : $(row).attr("id")},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	var resObj = eval("("+data+")");
            if(resObj.flag == true){
            	 $.messager.alert('系统提示','删除成功！');
            	 $("#daldglGrid").datagrid("reload");
	        }else{
	        	 $.messager.alert('系统提示','删除失败：'+resObj.errorMsg);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
}

//修改
function editFuc(row){

//alert(sessionRealName);
	var row;
	row.id = $(row).attr("id");
	row.out_date = $(row).attr("outDate");
	row.anum = $(row).attr("anum");
	row.out_uid = $(row).attr("outUid");
	row.j_uid = $(row).attr("jUid");
	row.out_use = $(row).attr("outUse");
	row.staff = sessionUserId;
	row.sessionUserName = sessionRealName;
	row.add_date = $(row).attr("addDate");
	row.remark = $(row).attr("remark");
		$('#editInfo').dialog({
		    title: '档案流动修改',
		    width: 650,
		    height: 450,
		   
		    closed: false,
		    cache: false,
		    href: 'daldEdit.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
					    	var daldEditData = $('#daldEditFm').serializeArray();
				 			var param = JSON.stringify(daldEditData);
					    	$.ajax({
					    		url:'<%=request.getContextPath()%>/residenceController/updateResidenceIoInfo',
					    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					    	    data: {"param" : param},   //参数值
					    	    type: "POST",   //请求方式
					    	    success: function(data) {
					    	    	var resObj = eval("("+data+")");
						            if(resObj.flag == true){
						            	 $.messager.alert('系统提示','修改成功！');
						            	 $("#daldglGrid").datagrid("reload");
						            	 $('#editInfo').dialog('close');
							        }else{
							        	 $.messager.alert('系统提示','修改失败：'+resObj.errorMsg);
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
						$('#editInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad : function() {//★★在打开dialog的时候回显数据，这里不能用onOpen事件
			 //$('#daldEditFm input[name=anum]').val(anum);
			// alert(row.out_date);
			 if(row.out_date=="null")
			 row.out_date="";
		
		    	 $('#daldEditFm').form('load', row);//★等同于上面的多项 
	        }
		});
}

//添加
function daldglFuc(){
		$('#daldglInfo').dialog({
		    title: '添加档案移交/接收材料信息',
		    width: 650,
		    height: 450,
		    top:100,
		    fitColumns:true, 
            maximizable:true,  
            resizable:true, 
		    doSize:true,  
		    collapsible:true, 
		    closed: false,
		    cache: false,
		    href: '../daxxgl/daldAdd.jsp',
		    modal: true,
		     buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
		    	 			var daldAddData = $('#daldAddFm').serializeArray();
		    	 			var param = JSON.stringify(daldAddData); 
					   	    $.ajax({
					     		url:'<%=request.getContextPath()%>/residenceController/saveResidenceIoInfo',
					     	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					     	    data: {"param" : param},   //参数值
					     	    type: "POST",   //请求方式
					     	    success: function(data) {
					     	    	var dataObj = eval("("+data+")");
					     			if(dataObj.flag == true){
					     				$.messager.alert('系统提示','新增成功！');
					     				$("#daldglGrid").datagrid("reload");
						            	$('#daldglInfo').dialog('close');
					   	  			}else{
					   		        	 $.messager.alert('系统提示','新增失败：'+dataObj.errorMsg);
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
						$('#daldglInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	$('#sessionUserName').textbox('setValue',sessionRealName);
		    	$('#dpno').textbox('setValue',window.top.cacheArchive.cacheDpno);
		    	$("#staff").val(sessionUserId);
		    } //loadEnd
		  });
}





function addygshFuc(){
	$('#daldglInfo').dialog({
    title: '员工审核',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygshAdd.jsp',
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
				$('#daldglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#ldhtGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 150,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
        {field:'code1',title:'开始时间',width:100},    
        {field:'name2',title:'结束时间',width:100}
         
    
    ]]    
     });  
	var pager = $('#ldhtGrid').datagrid('getPager');
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
	 
	 
	

    
    } //loadEnd
    

});

}




function addygdrFuc(){
	$('#daldglInfo').dialog({
    title: '员工导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygdrAdd.jsp',
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
				$('#daldglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#ygdrGrid').datagrid({    
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
        {field:'id',title:'选择',checkbox:true}, 
        {field:'code1',title:'组织机构代码',width: $(this).width() *0.15},    
        {field:'name2',title:'企业名称',width: $(this).width() * 0.25},
        {field:'name3',title:'企业性质',width: $(this).width() * 0.1},
        {field:'name4',title:'身份证',width: $(this).width() * 0.25},
        {field:'name5',title:'姓名',width: $(this).width() * 0.1},
        {field:'name6',title:'出生年月',width: $(this).width() * 0.1},
        {field:'name7',title:'性别',width: $(this).width() * 0.1},
        {field:'name8',title:'用工形式',width:$(this).width() * 0.2},
        {field:'name9',title:'审核状态',width:$(this).width() * 0.1},
        {field:'name10',title:'审核意见',width:$(this).width() * 0.3},
        {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="">修改</a> <a href="#" style="color: blue;"  onclick="">删除</a>';
				}   
				}
        
             ]]    
     });  
	var pager = $('#ygdrGrid').datagrid('getPager');
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
	 
	 
	

    
    } //loadEnd
    

});

}
function query(){
	//var dept = $("#dept").combobox("getValue");
	var searchDpno = $("#searchDpno").textbox('getValue');
	var acceptDate = $("#acceptDate").datebox('getValue');
	var archiveNum = $("#archiveNum").textbox('getValue');
	var sender=$('#sender').textbox('getValue');
	var accepter=$('#accepter').textbox('getValue');
	$("#daldglGrid").datagrid("load",{
		key:searchDpno,
		acceptDate:acceptDate,
		archiveNum:archiveNum,
		sender:sender,
		accepter:accepter
	});
}

</script>


<body style="margin: 1px;">
 
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="daldglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增档案流动</a>
		   		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>

</div>
<div>
<label>档案号：</label>
<input class="easyui-textbox" value="" name="searchDpno" id="searchDpno" style="width:120px" >
&nbsp;&nbsp;
<label>移交/接受日期：</label>
<input class="easyui-datebox" value="" name="acceptDate" id="acceptDate" style="width:120px" data-options="required:false,showSeconds:false">
&nbsp;&nbsp;
<label>案卷数量：</label> 
<input class="easyui-textbox" value="" name="archiveNum" id="archiveNum" style="width:120px" >
&nbsp;&nbsp;
<label>移交人：</label>
<input class="easyui-textbox" value="" name="sender" id="sender" style="width:120px" >
<label>接收人：</label>
<input class="easyui-textbox" value="" name="accepter" id="accepter" style="width:120px">
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>
<%--<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="aa">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" data-options="iconCls:''" style="width:150px"> 
<a class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>

--%><table id="daldglGrid"></table>  
</div>
<div id="daldglInfo"></div>
<div id="editInfo"></div>

</body>
</html>
