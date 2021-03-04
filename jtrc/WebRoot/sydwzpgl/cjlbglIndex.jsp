<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>成绩表管理</title>

<script type="text/javascript">

function buttonPermissions(){
	  //权限设置
	  $("#a").hide();
	  $("#b").hide();
	  $("#c").hide();
	  $("#d").hide();
	  $("#e").hide();
	 
	    $.post('../auth/check',null,function(data){
      $.each(data,function(index,value){
			 if(value==353){
				$("#a").show();
			}else if(value==354){
				$("#b").show();
			}else if(value==355){
				$("#c").show();
			}else if(value==356){
				$("#d").show();
			}else if(value==357){
				$("#e").show();
			} 
	});
},"json");
}


var activityPlaceId;
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
			activityPlaceId = rec.id;
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
	    url:'../bgActivityUserScoreInfo/userScoreList', 
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
	        {field:'order_id',title:'排名',width : $(this).width() * 0.05,align:'center'},    
	        {field:'name',title:'姓名',width : $(this).width() * 0.1,align:'center'},
	        {field:'card_number',title:'身份证号',width : $(this).width() * 0.2,align:'center'},
	        {field:'zkzh',title:'准考证号',width : $(this).width() * 0.2,align:'center'},
	        {field:'score',title:'成绩',width : $(this).width() * 0.05,align:'center'},
	        {field:'remark',title:'备注',width : $(this).width() * 0.1,align:'center'}
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
   		url:'<%=request.getContextPath()%>/bgActivityUserInfo/activityList2',
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
	if(getByteLen($('#gwmc').textbox('getValue')) > 40) {
		$.messager.alert('系统提示','岗位名称最多输入20个汉字(40个字符),请重新输入！');  
	} else {
		$('#bgActivityInfo').datagrid('load',{
			activity_id:$('#activity_id').combobox('getValue'),
			gwmc:$('#gwmc').textbox('getValue')
		});
	}
	
}

function importScore(){
	$('#dyImportInfo').dialog({
	    title: '选择文件',
	    width: 350,
	    height: 150,
	    
	    closed: false,
	    cache: false,
	    href: '../rygl/fileImport.jsp',
	    modal: true,
	     buttons:[{
				text:'上传',
				iconCls:'icon-ok',
				handler:function(){
					submit=false;
					if(!submit){
						 $.messager.progress({ // 显示进度条  
      						title:"提示",  
         					 text:"正在上传...",  
         					 interval:500  
         				}); 
         				} 
         			submit=true;
	    	 		uploadExcel();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#dyImportInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () { 
	    }  
	});
}

function uploadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
        var url = "<%=request.getContextPath()%>/bgActivityUserScoreInfo/importExcel";   
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
 			            	$.messager.progress('close');
 				            var resObj = eval("("+data+")");
 				           
 				            dataFlag = resObj.flag;
 				            tipMsg = resObj.cause; 
		            		$('#dyImportInfo').dialog('close');
		            		showImportdyFuc(resObj.rows); 
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
 
/*展示导入的成绩信息*/
function showImportdyFuc(dates){
	var title = "成绩导入";
	var columns = [[    
	            			{field:'bkhddm',title:'报考活动名称',width: $(this).width() *0.1 ,align:'center'},
	            			{field:'dwdm',title:'单位名称',width: $(this).width() *0.1,align:'center'},
	            			{field:'gwdm',title:'岗位名称',width: $(this).width() *0.1,align:'center'},
	            			{field:'sfzh',title:'身份证',width: $(this).width() *0.1},
	            			{field:'xm',title:'姓名',width: $(this).width() *0.05},
	            			{field:'cj',title:'成绩',width: $(this).width() *0.05},
	            			{field:'bz',title:'备注(加分)',width: $(this).width() *0.1},
	            			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
	                    ]]    ;
	$('#showImportDyInfo').dialog({
    title: title,
    width: 950,
    height: 250,
    closed: false,
    cache: false,
    href: '../rygl/dyxxImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					submit=false;
					if(!submit){
						 $.messager.progress({ // 显示进度条  
      						title:"提示",  
         					 text:"正在保存...",  
         					 interval:500  
         				}); 
         				} 
         			submit=true;
					saveZj(dates);
				 //$('#showImportDyInfo').dialog('close');
				},
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#showImportDyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#dyImportGrid').datagrid({    
	    url:'', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		height: 360,
		nowarp:false,
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:columns
     });  
    $('#dyImportGrid').datagrid('loadData',dates);
    } //loadEnd
});
}

function saveZj(dates){
	if(dataFlag != true){
       $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
       return;
    }
	$.blockUI();
    $.ajax({
         url: "../bgActivityUserScoreInfo/saveZj",
         type: "POST",
         contentType : "application/json;charset=utf-8", 
         data: JSON.stringify(dates),
         async: true,
         success: function(data){
        	 $.messager.progress('close');
	         $.unblockUI();
	         alert('导入成绩成功!');
	         $('#showImportDyInfo').dialog('close');
	         $('#cjbgGrid').datagrid('load',{
	    			activityPlaceId:activityPlaceId
	    		});
         },
         error: function(data){
             $.unblockUI();
             alert(data);
         }
    });
}
function exportMould(){
	var data=$('#fmExport').formSerialize()
    var url= "<%=request.getContextPath()%>/bgActivityUserScoreInfo/exportModel";
	window.location.href= url; 
}
function makeOrder(){
	if(activityPlaceId == null || activityPlaceId == '') {
		alert('请选择一个岗位!');
		return;
	} else {
		$.ajax({
	   		url:'<%=request.getContextPath()%>/bgActivityUserScoreInfo/makeOrder',
	   	    dataType: 'JSON',
	   	    data:{"activityPlaceId":activityPlaceId},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   	    	if(data == 1 || data == '1') {
	   	    		$('#cjbgGrid').datagrid('load',{
	   	    			activityPlaceId:activityPlaceId
	   	    		});
	   	    	} else {
	   	    		alert('排名生成异常!');
	   	    	}
	   	 },
	   	    error: function() {
	   	        alert('服务器请求异常!');
	   	    	//请求出错处理
	   	    }
	   	});
	}

}


function deleteOrder(){
	
		$.ajax({
	   		url:'<%=request.getContextPath()%>/bgActivityUserScoreInfo/deleteOrder',
	   	    dataType: 'JSON',
	   	    data:{"activityPlaceId":activityPlaceId},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   	    		alert("删除成功");
	   	 },
	   	    error: function() {
	   	        alert('服务器请求异常!');
	   	    	//请求出错处理
	   	    }
	   	});
	}


function exportOrder(){
	if(activityPlaceId == null || activityPlaceId == '') {
		alert('请选择一个岗位!');
		return;
	} else {
		
		var data=$('#fmExport').formSerialize()
		window.location.href='<%=request.getContextPath()%>/bgActivityUserScoreInfo/exportOrder?activityPlaceId='+activityPlaceId;
		
		<%-- $.ajax({
	   		url:'<%=request.getContextPath()%>/bgActivityUserScoreInfo/exportOrder',
	   	    dataType: 'JSON',
	   	    data:{"activityPlaceId":activityPlaceId},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   	    	alert("导出成功")
	   	 },
	   	    error: function() {
	   	        alert('服务器请求异常!');
	   	    	//请求出错处理
	   	    }
	   	}); --%>
	}

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
			<td><label style="margin-left:10px">岗位名称：</label></td>
			<td>
			 <input type="text"  class="easyui-textbox"  
	        name="gwmc" id="gwmc" value=""
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        </td>
	        <td>
			<a href="javascript:selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
			</td>
		  </tr>
		  
	   </table>
	   <!-- <table>
	   	 <tr>
		  	<td>
		  		<a id="a" href="javascript:importScore()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导入成绩</a>
		  	</td>
		  	<td>
		  		<a id="b" href="javascript:exportMould()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导出成绩模板</a>
		  	</td>
		  	<td>
		  		<a id="c" href="javascript:makeOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">生成排名</a>
		  	</td>
		  	<td>
		  		<a id="d" href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">删除全部成绩</a>
		  	</td>
		  	<td>
		  		<a id="e" href="javascript:exportOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导出成绩排名</a>
		  	</td>
		  </tr>
	   </table> -->
	   <div>
	   		<a id="a" href="javascript:importScore()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导入成绩</a>
	   		<a id="b" href="javascript:exportMould()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导出成绩模板</a>
	   		<a id="c" href="javascript:makeOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">生成排名</a>
	   		<a id="d" href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">删除全部成绩</a>
	   		<a id="e" href="javascript:exportOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">导出成绩排名</a>
	   </div>
   </div>
   
   <div data-options="region:'west',title:'报考岗位列表',split:true,border:false" style="width:350px;">
   		<table id="bgActivityInfo"></table>
   </div>
   <div data-options="region:'center',title:'考生成绩列表',border:false" >
	    <table id="cjbgGrid"></table>
   </div>
 </div>
<div id="dyImportInfo" align="center"></div>
<div id="showImportDyInfo" align="center"></div>
</body>
</html>
