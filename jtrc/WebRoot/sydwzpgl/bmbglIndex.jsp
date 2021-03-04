<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报名表管理</title>

<script type="text/javascript">
function buttonPermissions(){
	  //权限设置
	  $("#b").hide();
	  $("#c").hide();
	  $("#d").hide();
	  $("#e").hide();
	  $("#g").hide();
	  $("#j").hide();
	    $.post('../auth/check',null,function(data){
        $.each(data,function(index,value){
			if(value==347){
				$("#b").show();
			}else if(value==348){
				$("#c").show();
			}else if(value==349){
				$("#d").show();
			}else if(value==350){
				$("#e").show();
			}else if(value==351){
				$("#g").show();
			}else if(value==352){
				$("#j").show();
			}
	});
  },"json");
}

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
		buttonPermissions();
   $('#bmbglGrid').datagrid({    
    url:'../bgActivityUserInfo/list', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#bmbglTool',
	singleSelect: true,
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'hdmc',title:'报考活动名称',width : $(this).width() * 0.15,align:'center'}, 
        {field:'userid',title:'基本信息id',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'shjsbs',title:'审核结束标识',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ssjsbs',title:'申诉结束标识',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ksbh',title:'考生编号',width : $(this).width() * 0.1,align:'center'},
        {field:'sfzh',title:'身份证号',width : $(this).width() * 0.15,align:'center'},
        {field:'xm',title:'姓名',width : $(this).width() * 0.05,align:'center'},
        {field:'bksjdw',title:'报考上级单位',width : $(this).width() * 0.1,align:'center'},
        {field:'dwmc',title:'报考单位',width : $(this).width() * 0.1,align:'center'},
        {field:'dwpno',title:'单位pno',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'dwid',title:'单位id',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'gwdm',title:'岗位代码',width : $(this).width() * 0.1,align:'center'},
        {field:'gwmc',title:'报考岗位',width : $(this).width() * 0.1,align:'center'},
        {field:'gwyqid',title:'gwyqid',width : $(this).width() * 0.1,align:'center',hidden:true},
        {field:'uid',title:'userid',width : $(this).width() * 0.1,align:'center',hidden:true},
        {field:'shzt',title:'审核状态',width : $(this).width() * 0.1,align:'center'},
        {field:'shyj',title:'审核意见',width : $(this).width() * 0.1,align:'center'},
        {field:'sszt',title:'申诉状态',width : $(this).width() * 0.05,align:'center'},
       	{field:'ssyj',title:'申诉意见',width : $(this).width() * 0.1,align:'center'}
    ]]    
});  
	var pager = $('#bmbglGrid').datagrid('getPager');
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
	
	activityInit();
	
});


function shclFuc(){
	var row =$('#bmbglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		/* if(row.shjsbs == "0") {
			$.messager.alert('系统提示','审核处理时间已过！');
		} else { */
			if(row.shzt == null || row.shzt == '' || row.shzt == 'undefined' || row.shzt == '待审核') {
				showWindow('shcl','审核处理',row);
			} else {
				$.messager.alert('系统提示','当前审核状态无法进行审核！');
			}
			
		/* } */
		
	}else{
		$.messager.alert('系统提示','请选择您要审核处理的报名表！');
	}
	
}
	
function ssclFuc(){
	var row =$('#bmbglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		/* if(row.ssjsbs == "0") {
			$.messager.alert('系统提示','申诉处理时间已过！');
		} else { */
			if(row.sszt == '申诉中' || row.sszt == '1') {
				showWindow('sscl','申诉处理',row);
			 } else {
				$.messager.alert('系统提示','当前申诉状态无法进行申诉处理！');
			} 
			
		/* } */
		
		
	}else{
		$.messager.alert('系统提示','请选择您要审核处理的报名表！');
	}
	
}

function bmbglFuc(){
	var row =$('#bmbglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
	showWindow('ck','报名表查看',row);
	}else{
		$.messager.alert('系统提示','请选择您要查看的报名表！');
	}
}

function dyylFuc(){
	var row =$('#bmbglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		showWindow('dyyl','打印预览',row);
	}else{
		$.messager.alert('系统提示','请选择您要打印预览的报名表！');
	}
	
}

function showWindow(fuc,title,row){
	
	
		$('#bmbglInfo').dialog({
		    title: title,
		    width: 750,
		    height: 450,
		   
		    closed: false,
		    cache: false,
		    href: '../sydwzpgl/bmbglAdd.jsp?id='+row.dwid+'&userid='+row.userid+'&gwyqid='+row.gwyqid+'&uid='+row.uid+'&fuc='+fuc,
		    modal: true,
		    buttons:[{
						text:'确定',
						id:'ok',
						iconCls:'icon-cancel',
						handler:function(){
						$('#bmbglInfo').dialog('close');
						}
					},
					{
						text:'打印',
						id:'dy',
						iconCls:'icon-print',
						handler:function(){
							printFuc();
						}
					},
					{
						text:'保存',
						id:'save',
						iconCls:'icon-ok',
						handler:function(){
							if(fuc == 'shcl') {
								if(getByteLen($("#rs").val()) > 400) {
									$.messager.alert('系统提示','审核意见最多输入200个汉字(400个字符),请重新输入！');
								} else {
									$.ajax({
									    url: '../bgActivityUserInfo/sh',    //请求的url地址
									    //dataType: "json",   //返回格式为json
									    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
									    data: { "id": $("#add_id").val(),"isState":$('#isState').combobox('getValue'),"rs":$("#rs").val()},    //参数值
									    type: "POST",   //请求方式
									    success: function(data) {
									    	if(data == 1 || data == '1') {
									    		alert("更新成功");
									    		$('#bmbglInfo').dialog('close');
												$("#bmbglGrid").datagrid("reload");
									    	}else{
									    		alert("更新失败");
									    	}
									    }
									});
								}
								
								/****/
								
								
							}else if(fuc=='sscl'){
								if(getByteLen($("#up").val()) > 400) {
									$.messager.alert('系统提示','申诉意见最多输入200个汉字(400个字符),请重新输入！');
								} else {
									$.ajax({
									    url: '../bgActivityUserInfo/ss',    //请求的url地址
									    //dataType: "json",   //返回格式为json
									    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
									   data: { 
								              "id": $("#add_id").val(),
								              "upState":$('#upState').combobox('getValue'),
								              "isState":$('#isState').combobox('getValue'),
								              "up":$("#up").val()
								              },    //参数值
									    type: "POST",   //请求方式
									    success: function(data) {
									    	if(data == 1 || data == '1') {
									    		alert("更新成功");
									    		$('#bmbglInfo').dialog('close');
												$("#bmbglGrid").datagrid("reload");
									    	}else{
									    		alert("更新失败");
									    	}
									    }
									});
								}
								
							}
							
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	$('#add_ksbh').val(row.ksbh);
		    	$("#isState").val(row.shzt);
				$("#rs").val(row.shyj);
				$("#upState").val(row.sszt);
				$("#up").val(row.ssyj);
				$("#add_id").val(row.id);
				$("#bmb_5").html('岗位代码：'+row.gwdm);
				$("#bmb_100").html('岗位名称：'+row.gwmc);
				$('#upState').combobox('select',row.sszt);
				$('#isState').combobox('select',row.shzt);
		    } //loadEnd

		});
	
}

function activityInit() {
	$.ajax({
   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/activityList',
   	    dataType: 'JSON',
   	    type: "POST",   //请求方式
   	    success: function(data) {debugger;
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


function enterpriseInit() {
    $.post( '<%=request.getContextPath()%>/bgActivityUserInfo/enterpriseList',
    {activity_id:$('#activity_id').combobox('getValue')},
         function(data) { 
            var json;
            json = [];
            $.each(data,function(n,value) { 
                json.push({"text":value.name,"value":value.activity_enterprise_id});
            });
            $("#enterprise_id").combobox("loadData",json);
     } );
}



function placeInit() {
 $.post( '<%=request.getContextPath()%>/bgActivityUserInfo/placeList',
        {enterprise_id:$('#enterprise_id').combobox('getValue')},
         function(data) { 
            var json;
            json = [];
            $.each(data,function(n,value) { 
                json.push({"text":value.name,"value":value.pid});
            });
            $("#place_id").combobox("loadData",json);
     } );
}


function selectSubmit(){
	if(getByteLen($('#cs_param').textbox('getValue')) > 40) {
		$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入！');
	} else {
		$('#bmbglGrid').datagrid('load',{
			activity_id:$('#activity_id').combobox('getValue'),
			activity_enterprise_id : $('#enterprise_id').combobox('getValue'),
			place_id : $('#place_id').combobox('getValue'),
			value:$('#cs_param').textbox('getValue'),
			is_state:$('#is_state').combobox('getValue'),
			up_state:$('#up_state').combobox('getValue')
		});
	}
	
 
    
	
	if($('#activity_id').combobox('getValue')!=""){
	   //获取 公司
	   enterpriseInit()	  
	}
	
	if($('#enterprise_id').combobox('getValue')!=""){
       //获取 岗位
      placeInit()
    }
}

function dorc(type) {
	var row =$('#bmbglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
		
		if(type == 'sh' && (row.shzt == '待审核' || row.shzt == null || row.shzt == undefined)) {
			$.messager.alert('系统提示','待审核数据无法进行容错处理！');
		} else if(type == 'ss' && (row.sszt == '未申诉' || row.sszt == null || row.sszt == undefined)) {
			$.messager.alert('系统提示','未申诉数据无法进行容错处理！');
		} else {
			if(type == 'sh' && (row.sszt == '申诉中' || row.sszt == '申诉成功' || row.sszt == '申诉失败')) {
				$.messager.alert('系统提示','已申诉数据无法进行审核容错处理！');
			} else {
				$.ajax({
			   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/dorcsq',
			   	    dataType: 'JSON',
			   	    data:{"id":row.id,
			   	    	"type":type},
			   	    type: "POST",   //请求方式
			   	    success: function(data) {
			   	    	if(data == 1 || data == '1') {
			   	    		alert('处理成功');
			   	    		$("#bmbglGrid").datagrid("reload");
			   	    	} else {
			   	    		alert('处理失败');
			   	    	}
			   	 },
			   	    error: function() {
			   	        alert('服务器请求异常');
			   	    	//请求出错处理
			   	    }
			   	});
			}
			
		}
		
		/**
		if(row.sszt == '未申诉'){
			$.ajax({
		   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/dorcsq',
		   	    dataType: 'JSON',
		   	    data:{"id":row.id,
		   	    	"type":type},
		   	    type: "POST",   //请求方式
		   	    success: function(data) {
		   	    	if(data == 1 || data == '1') {
		   	    		alert('处理成功');
		   	    		$("#bmbglGrid").datagrid("reload");
		   	    	} else {
		   	    		alert('处理失败');
		   	    	}
		   	 },
		   	    error: function() {
		   	        alert('服务器请求异常');
		   	    	//请求出错处理
		   	    }
		   	});
		}else{
			$.messager.alert('系统提示','已申诉无法进行容错处理！');
		}
		
		**/
	}else{
		$.messager.alert('系统提示','请选择您要处理的报名表！');
	}
}

function test(){
	$.ajax({
   		url:'<%=request.getContextPath()%>/bgActivityUserPayInfo/test',
   	    type: "POST",   //请求方式
   	    success: function(data) {
   	    	alert('处理成功!');
   	    	$("#bmbglGrid").datagrid("reload");
   	    },error: function() {
   	        alert('服务器请求异常');
   	    	//请求出错处理
   	    }
   		});
}

function updateInfo(){
	
	$.ajax({
   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/updateInfo',
   	    dataType: 'JSON',
   	    //data:{"activityPlaceId":activityPlaceId},
   	    type: "POST",   //请求方式
   	    success: function(data) {
   	    		alert("修改成功");
   	 },
   	    error: function() {
   	        alert('服务器请求异常!');
   	    	//请求出错处理
   	    }
   	});
}

</script>


<body style="margin: 1px;">
 

<div id="tb">
	<div id="bmbglTool"  style="background-color:#FFFFFF;">
		<div data-options="region:'north',border:false" style="padding:5px">
             <label style="margin-left:10px">报考活动：</label>
		     <select class="easyui-combobox" id="activity_id" name="activity_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:200px;">
			</select>
			 <label style="margin-left:10px">报考单位：</label>
             <select class="easyui-combobox" id="enterprise_id" name="enterprise_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
                            selectSubmit();
                        }" style="width:200px;">
            </select>
             <label style="margin-left:10px">报考岗位：</label>
             <select class="easyui-combobox" id="place_id" name="place_id" data-options="editable:false,panelHeight:null,onSelect:function(record){
                            selectSubmit();
                        }" style="width:200px;">
            </select>
			<label style="margin-left:10px">审核状态：</label>
				      	
		     <select class="easyui-combobox" id="is_state" name="is_state" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:100px;">
						<option value="">全部</option>
						<option value="-1">待审核</option>
						<option value="审核通过">审核通过</option>
						<option value="审核不通过">审核不通过</option>
						<option value="修改信息">修改信息</option>
			</select>
			<label style="margin-left:10px">申诉状态：</label>
		     <select class="easyui-combobox" id="up_state" name="up_state" data-options="editable:false,panelHeight:null,onSelect:function(record){
						    selectSubmit();
						}" style="width:100px;">
						<option value="">全部</option>
						<option value="-1">未申诉</option>
						<option value="申诉中">申诉中</option>
						<option value="申诉失败">申诉不通过</option>
						<option value="申诉成功">申诉成功</option>
						<option value="修改信息">修改信息</option>
			</select>
			<label style="margin-left:10px">身份证号或姓名：</label>
			 <input type="text"  class="easyui-textbox"  
	        name="cs_param" id="cs_param" value=""
	        size="30" onkeydown="if(event.keyCode==13) clearDefault()"/>
			<a href="javascript:selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		  
   </div>
		<a id="a" onclick="bmbglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查看</a>
		<a id="b" onclick="shclFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核处理</a>
		<a id="c" onclick="ssclFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">申诉处理</a>
		<a id="d" onclick="dorc('sh')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">审核容错申请</a>
		<a id="e" onclick="dorc('ss')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">申诉容错申请</a>
		<a id="f" onclick="dyylFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">打印预览</a>
		<a id="g" onclick="test()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">批量处理缴费</a>
		<a id="j" href="javascript:updateInfo()" class="easyui-linkbutton" iconCls="icon-add" plain="true">修改信息</a>
	</div>
</div>
<div>

<table id="bmbglGrid"></table>  
</div>
<div id="bmbglInfo"></div>
</body>
</html>
