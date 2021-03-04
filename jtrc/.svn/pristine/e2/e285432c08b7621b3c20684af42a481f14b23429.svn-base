<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>考场人员名单管理</title>

<script type="text/javascript">
var acid;
function getByteLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
         var a = val.charAt(i);
         if (a.match(/[^\x00-\xff]/ig) != null) 
        {
            len += 2;
        }
        else
        {
            len += 1;
        }
    }
    return len;
}
$(function(){
	activityInit();
	
	$('#bgActivityInfo').datagrid({    
	    url:'../bgActivityInfo/list', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		singleSelect: true,
		striped: true,
		collapsible:true,
		//fitColumns:true,
		height: '100%',
		pagination:true,
		toolbar: '#bkdwTool',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,
		onClickRow:function(value,rec){
			acid = rec.id;
			$('#cjbgGrid').datagrid('load',{
				activityId:rec.id
			});
		},
	    columns:[[
	         {field:'id',title:'报名活动岗位ID',width : $(this).width() * 0.01,checkbox:true,align:'center'},
	        {field:'pno',title:'报名活动编号',width : $(this).width() * 0.07,align:'center'},    
	        {field:'pname',title:'报名活动名称',width : $(this).width() * 0.2,align:'center'}

	    ]] 
	});  
	var bgActivityInfoPager = $('#bgActivityInfo').datagrid('getPager');
	bgActivityInfoPager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
   $('#cjbgGrid').datagrid({
	    url:'../bgActivityUserInfo/userList', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		//fitColumns:true,
		toolbar: '#bkdwTool',
		height: '100%',
		pagination:true,
		sortName: '',
		sortOrder: 'desc',
		singleSelect: true,
		remoteSort: false,    
	    columns:[[
	        {field:'id',title:'选择',checkbox:true,align:'center'},
	        {field:'kjlx',title:'考室',width : $(this).width() * 0.05,align:'center'},
	        {field:'ksh',title:'考场号',width : $(this).width() * 0.05,align:'center'},    
	        {field:'zwh',title:'座位号',width : $(this).width() * 0.05,align:'center'},
	        {field:'zkzh',title:'准考证号',width : $(this).width() * 0.2,align:'center'},
	        {field:'xm',title:'姓名',width : $(this).width() * 0.1,align:'center'},
	        {field:'sfzh',title:'身份证号',width : $(this).width() * 0.2,align:'center'}
	    ]]
	});  
	var pager = $('#cjbgGrid').datagrid('getPager');
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

function activityInit() {
	$.ajax({
   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/activityList',
   	    dataType: 'JSON',
   	    type: "POST",   //请求方式
   	    success: function(data) {
   	    	var json;
   	    	json = [];
   	    	$.each(data,function(n,value) { 
   	    		json.push({"text":value.hdname,"value":value.hdid});
   	    	});
   	    	$("#activity_id").combobox("loadData",json);
   	 },
   	    error: function() {
   	        alert('服务器请求异常');
   	    	//请求出错处理
   	    }
   	});
}

function selectSubmit(){
	if(acid == null || acid == '') {
		alert('请选择一个活动!');
		return;
	} else {
		if(getByteLen($('#ksh').textbox('getValue')) > 40) {
			$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入！');
		} else {
			$('#cjbgGrid').datagrid('load',{
				activityId:acid,
				ksh:$('#ksh').textbox('getValue')
			});
		}
		
	}
}

function makeZkzh(){
	if(acid == null || acid == '') {
		alert('请选择一个活动!');
		return;
	} else {
		$.ajax({
	   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/makeZkzh',
	   	    dataType: 'JSON',
	   	    data:{"activity_id":acid},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   	    	
	   	    	 /* $.messager.progress({
					title:'提示',
					msg:'准考号生成中，请稍候……'
				});  */
	   	    	
	   	    	if(data == 1 || data == '1') {
	   	    		alert('准考证号生成成功!');
	   	    		$('#cjbgGrid').datagrid('load',{
	   	    			activityId:acid
	   	    		});
	   	    	} else {
	   	    		alert('准考证号生成异常!');
	   	    	}
	   	 },
	   	    error: function() {
	   	        alert('服务器请求异常!');
	   	    	//请求出错处理
	   	    }
	   	});
	}

}
</script>


<body style="margin: 1px;">
 
 <div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="padding:5px">
       <table>
	      <tr>
			<td><label style="margin-left:10px">考场号：</label></td>
			<td>
			 <input type="text"  class="easyui-textbox"  
	        name="ksh" id="ksh" value=""
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        </td>
	        <td>
			<a href="javascript:selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
			</td>
		  </tr>
		  
	   </table>
	   <table>
	   	 <tr>
		  	<td>
		  		<a href="javascript:makeZkzh()" class="easyui-linkbutton" iconCls="icon-add" plain="true">生成准考证号</a>
		  	</td>
		  </tr>
	   </table>
   </div>
   
   <div data-options="region:'west',title:'报考活动列表',split:true,border:false" style="width:350px;">
   		<table id="bgActivityInfo"></table>
   </div>
   <div data-options="region:'center',title:'考生名单列表',border:false" >
	    <table id="cjbgGrid"></table>
   </div>
 </div>

</body>
</html>
