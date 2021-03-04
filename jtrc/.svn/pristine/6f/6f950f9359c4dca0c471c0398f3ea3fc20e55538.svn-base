<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>审核失败名单</title>

<script type="text/javascript">
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
   $('#jfcsglGrid').datagrid({    
	url:'../bgActivityUserInfo/queryShFailedList', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	pagination:true,
	height: '100%',
	toolbar: '#jfcsglTool',
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'hdmc',title:'活动名称',width : $(this).width() * 0.15,align:'center'},    
        {field:'sfzh',title:'身份证号',width : $(this).width() * 0.15,align:'center'},
        {field:'xm',title:'姓名',width : $(this).width() * 0.05,align:'center'},
        {field:'ddh',title:'订单号',width : $(this).width() * 0.15,align:'center'},
        {field:'fkjyh',title:'付款交易号',width : $(this).width() * 0.15,align:'center'},
        {field:'fksj',title:'付款时间',formatter:function(value,row,index){return DateFormat(new Date(value),"yyyy-MM-dd HH:mm:ss");},width : $(this).width() * 0.15,align:'center'},
        {field:'dfzh',title:'对方账号',width : $(this).width() * 0.05,align:'center'},
        {field:'xm',title:'对方姓名',width : $(this).width() * 0.05,align:'center'},
        {field:'m',title:'退款金额',width : $(this).width() * 0.05,align:'center'},
        {field:'tksm',title:'退款说明',width : $(this).width() * 0.05,align:'center'},
        {field:'dczt',title:'导出状态',width : $(this).width() * 0.05,align:'center'}


    ]]    
});  
	var pager = $('#jfcsglGrid').datagrid('getPager');
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
		if(getByteLen($('#cs_param').textbox('getValue')) > 40) {
			$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入！');
		} else {
			$('#jfcsglGrid').datagrid('load',{
				activity_id:$('#activity_id').combobox('getValue'),
				export_state:$('#export').combobox('getValue'),
				cs_param:$('#cs_param').textbox('getValue')
			});
		}
		
	}



	function exportExcel(){
			var activity_id = $('#activity_id').combobox('getValue');
			var export_state = $('#export').combobox('getValue');
			var cs_param = $('#cs_param').textbox('getValue');
			window.location='<%=request.getContextPath()%>/bgActivityUserInfo/faildExport?activity_id='+activity_id+'&export_state='+export_state+'&cs_param='+cs_param;
		
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
			<td><label style="margin-left:10px">导出状态：</label></td>
			<td>	      	
		     <select class="easyui-combobox" id="export" name="export" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:80px;">
						<option value="">全部</option>
						<option value="已导出">已导出</option>
						<option value="null">未导出</option>
			</select>
			</td>
			<td><label style="margin-left:10px">身份证或者名称：</label></td>
			<td>
			 <input type="text"  class="easyui-textbox"  
	        name="cs_param" id="cs_param" value=""
	        size="30" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        </td>
	        <td>
			<a href="javascript:selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
			</td>
		  </tr>
		  
	   </table>
	   <table>
	   	 <tr>
		  	<td>
		  		<a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-add" plain="true">EXCEL导出</a>
		  	</td>
		  	
		  </tr>
	   </table>
   </div>
   <div data-options="region:'center',title:'审核失败名单列表',border:false">
   <table id="jfcsglGrid"></table>  
	</div>
 </div>

<div id="jfcsglInfo"></div>


</body>
</html>
