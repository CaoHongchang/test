<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>缴费信息管理</title>

<script type="text/javascript">
var id;
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
	    url:'../bgActivityUserScoreInfo/list', 
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
			id = rec.id;
			$('#cjbgGrid').datagrid('load',{
				activityPlaceId:rec.id
			});
		},
	    columns:[[
	         {field:'id',title:'报名活动岗位ID',width : $(this).width() * 0.01,checkbox:true,align:'center'},
	        {field:'hdmc',title:'报名活动名称',width : $(this).width() * 0.15,align:'center'},    
	        {field:'dwmc',title:'报名单位',width : $(this).width() * 0.07,align:'center'},
	        {field:'gwmc',title:'报名岗位',width : $(this).width() * 0.05,align:'center'},
	        {field:'gwdm',title:'岗位代码',width : $(this).width() * 0.05,align:'center'},

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
	    url:'../bgActivityUserPayInfo/userPayList', 
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
	        {field:'order_id',title:'订单号',width : $(this).width() * 0.1,align:'center'},    
	        {field:'p_date',title:'付款时间',formatter:function(value,row,index){return DateFormat(new Date(value),"yyyy-MM-dd HH:mm:ss");},width : $(this).width() * 0.1,align:'center'},
	        {field:'order_no',title:'付款交易号',width : $(this).width() * 0.1,align:'center'},
	        {field:'state',title:'缴费状态',width : $(this).width() * 0.1,align:'center'},
	        {field:'phone',title:'电话',width : $(this).width() * 0.05,align:'center'},
	        {field:'name',title:'姓名',width : $(this).width() * 0.1,align:'center'},
	        {field:'sfzh',title:'身份证号',width : $(this).width() * 0.1,align:'center'}
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
   	    	json.push({"text":"全部","value":0});
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
	$('#bgActivityInfo').datagrid('load',{
		activity_id:$('#activity_id').combobox('getValue')
	});
}

function selectSubmit2(){
	if(id == null || id == "") {
		alert('请选择一个岗位');
		return;
	} else {
		if(getByteLen($('#cs_param').textbox('getValue')) > 40) {
			$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入！');
		} else {
			$('#cjbgGrid').datagrid('load',{
				activityPlaceId:id,
				state:$('#state').combobox('getValue'),
				cs:$('#cs_param').textbox('getValue'),
			});
		}
		
	}
	
}

function importScore(){
	
}
function exportExcel(){
	if(id == null || id == "") {
		alert('请选择一个岗位');
		return;
	} else {
		window.location='<%=request.getContextPath()%>/bgActivityUserPayInfo/userPayExport?id='+id;
	}
	
}
function makeOrder(){
	
}
</script>


<body style="margin: 1px;">
 
 <div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="padding:5px">
       <table>
	      <tr>
	      	<td><label style="margin-left:10px">报考活动：</label></td>
			<td>	      	
		     <select class="easyui-combobox" id="activity_id" name="activity_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:200px;">
			</select>
			</td>
			<td><label style="margin-left:10px">缴费状态：</label></td>
			<td>	      	
		     <select class="easyui-combobox" id="state" name="state" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit2();
						}" style="width:80px;">
						<option value="">全部</option>
						<option value="已付款">已缴费</option>
						<option value="未付款">未缴费</option>
			</select>
			</td>
			<td>
			 <input type="text"  class="easyui-textbox"  
	        name="cs_param" id="cs_param" value=""
	        size="30" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        </td>
	        <td>
			<a href="javascript:selectSubmit2()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
			</td>
		  </tr>
		  
	   </table>
	   <table>
	   	 <tr>
		  	<td>
		  		<a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导出到Excel</a>
		  	</td>
		  </tr>
	   </table>
   </div>
   
   <div data-options="region:'west',title:'报考岗位列表',split:true,border:false" style="width:400px;">
   		<table id="bgActivityInfo"></table>
   </div>
   <div data-options="region:'center',title:'缴费信息列表',border:false" >
	    <table id="cjbgGrid"></table>
   </div>
 </div>

</body>
</html>
