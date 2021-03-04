<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>职称评审活动列表</title>

<script type="text/javascript">
$(function(){

	  $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==212){
				$("#a").show();
			}else if(value==213){
				$("#b").show();
			}else if(value==214){
				$("#c").show();
			}
	});
    },"json");
   $('#zcpshdGrid').datagrid({    
     	url:basePath+"zcps/queryPageList", 
     	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		singleSelect: true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#zcpshdTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
    	columns:[[    
         	{field:'id',title:'选择',checkbox:true,align:'center'},
        	{field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
        	{field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'},    
        	{field:'price',title:'有效性',width: $(this).width() * 0.01,align:'center'},
        	{field:'state_info',title:'状态',width: $(this).width() * 0.01,align:'center'},
         	{field:'state',title:'状态',width: $(this).width() * 0.01,align:'center',hidden:true},
         	{field:'zname',title:'zname',width: $(this).width() * 0.01,align:'center',hidden:true},
         	{field:'zurl',title:'zurl',width: $(this).width() * 0.01,align:'center',hidden:true},
         	{field:'remark',title:'remark',width: $(this).width() * 0.01,align:'center',hidden:true},
         	{field:'sbkssj',title:'申报开始时间',width: $(this).width() * 0.01,align:'center'},
         	{field:'sbjssj',title:'申报结束时间',width: $(this).width() * 0.01,align:'center'},
         	{field:'pskssj',title:'评审开始时间',width: $(this).width() * 0.01,align:'center'},
         	{field:'psjssj',title:'评审结束时间',width: $(this).width() * 0.01,align:'center'},
         	{field:'hdjssj',title:'活动结束时间',width: $(this).width() * 0.01,align:'center'}
    	]]    
});  
	var pager = $('#zcpshdGrid').datagrid('getPager');
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
	
	});

	//保存
function submitForm(){
		var editor = CKEDITOR.instances.remark;
		editor.updateElement();
		$("#remark").val(editor.getData());
		
	 	var r = $("#zcpshdForm").form('enableValidation').form('validate');
		if(!r) {
			return false;
		}
		/*if($("#remark").val()==""){
			$.messager.alert('提示','评审须知不能为空');
			return false;
		}*/
		var name=$("#name").textbox('getValue');
		if(name.length>150){
		 $.messager.alert('提示','活动名字必须小于30字！');
		 return;
		}
		var remark=$("#remark").val();
		if(remark.length>1000){
		 $.messager.alert('提示','评审须知必须小于150字！');
		 return;
		}
	 var param=$("#zcpshdForm").serializeArray();
	 param=JSON.stringify(param);
	 $("#zcpshdForm").ajaxSubmit({ 
			url : basePath+'/zcps/addinfo',
			async : true,
			 data: {
             'param': param
         	},
			success : function(data) {
         	var result = $.parseJSON(data);  
			if(result.flag == 0){
				 if($("#id").val()==""){
					 $.messager.alert('提示','新建活动成功');
				 }else{
					 $.messager.alert('提示','修改活动成功');
				 }
				 $('#zcpshdAddInfo').dialog('close');
				 $("#zcpshdGrid").datagrid("reload");
			}else{
				if($("#id").val()==""){
					$.messager.alert('提示','新增活动失败，原因：'+result.errorMsg);
				 }else{
					$.messager.alert('提示','修改活动失败，原因：'+result.errorMsg);
				 }
			}
		},
		error : function(data) {
			   
		}
	});
		
}

function updateFuc(){
	var row = $("#zcpshdGrid").datagrid("getSelected");
	if(row){
		$('#zcpshdAddInfo').dialog({
		    title: '评审活动修改',
		    width: 900,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zcsbgl/zcpshdAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
							submitForm();
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
							$('#zcpshdAddInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		         console.log("xxrow",row);
                 //debugger;
		         // row.imgFile = row.zname == null ? "" : row.zname;
		         //console.log("xxrow",row);
		    	$('#zcpshdForm').form('load', row);
		    	 var  editor = CKEDITOR.replace('remark');
		    	$("#imgFile").val(row.zname);	    	
		    	console.log("imgFile",$("#imgFile").siblings().find("input"));    	
		    	$("#imgFile").siblings().find("input").each(function(){
		    	     //console.log("================this", this);
		    	     //console.log("================this.value", this.type);
		    	     if(this.type!="file")
		    	     {
		    	         this.value = row.zname;
		    	     }
		    	     
		    	})
		   	}  
		    
		});
	}else{
		$.messager.alert('提示','请选择一行');
	}
}	
	
function addFuc(){
	$('#zcpshdAddInfo').dialog({
    title: '评审活动新增',
    width: 900,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/zcpshdAdd.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					submitForm();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zcpshdAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
 var  editor = CKEDITOR.replace('remark');
    	}  
    
	});

}

function sx(){
	var row = $("#zcpshdGrid").datagrid("getSelected");
	if(row){
		if(row.price=='有效'){
			$.messager.alert("系统提示","该项活动已经是有效的！");
			return;
		}
    	$.ajax({
    		url:'<%=request.getContextPath()%>/zcps/validity',
    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
    	    data: {id:row.id,state:row.price},    //参数值
    	    type: "POST",   //请求方式
    	    success: function(data) {
    	    	var resObj = eval("("+data+")");
	            if(resObj.flag == '0'){
	            	 $.messager.alert('系统提示','设置'+resObj.state+'成功！');
	            	 $("#zcpshdGrid").datagrid("reload");
		        }else{
		        	 $.messager.alert('系统提示','设置失败：'+resObj.errorMsg);
			    }
    	    },
    	    error: function() {
    	        //请求出错处理
    	    }
    	});
	}else{
		$.messager.alert('提示','请选择一行');
	}
}


function wx(){
	var row = $("#zcpshdGrid").datagrid("getSelected");
	if(row){
		if(row.price=='失效'){
			$.messager.alert("系统提示","该项活动已经是失效的！");
			return;
		}
    	$.ajax({
    		url:'<%=request.getContextPath()%>/zcps/validity',
    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
    	    data: {id:row.id,state:row.price},    //参数值
    	    type: "POST",   //请求方式
    	    success: function(data) {
    	    	var resObj = eval("("+data+")");
	            if(resObj.flag == '0'){
	            	 $.messager.alert('系统提示','设置'+resObj.state+'成功！');
	            	 $("#zcpshdGrid").datagrid("reload");
		        }else{
		        	 $.messager.alert('系统提示','设置失败：'+resObj.errorMsg);
			    }
    	    },
    	    error: function() {
    	        //请求出错处理
    	    }
    	});
	}else{
		$.messager.alert('提示','请选择一行');
	}
}
</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">

		<a id="a" onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="b" onclick="updateFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="c" href="javascript:sx()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">有效</a>
		<a id="c" href="javascript:wx()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
	</div>

</div>
<div>
<table id="zcpshdGrid"></table>  
</div>
<div id="zcpshdAddInfo"></div>

</body>
</html>
