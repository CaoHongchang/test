<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<%-- <link rel="stylesheet" href="<%=basePath%>/js/lightbox/css/screen.css" media="screen"/>--%>
<link rel="stylesheet" href="<%=basePath%>/js/lightbox/css/lightbox.css" media="screen"/>
<script src="<%=basePath%>/js/lightbox/lightbox-2.6.min.js"></script>
<html>
<head>
<title>业务受理审核管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
var ywsl=false;
var ck=false;
	$(function(){
     
    $("#cx").hide();
    $("#dcsld").hide();
    $("#ywsl").hide();
    $("#ck").hide();
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==191){
				$("#cx").show();
			}else if(value==192){
				$("#dcsld").show();
			}else if(value==193){
				ywsl=true;
			}else if(value==194){
				ck=true;
			}
	});
    },"json");
    ywslshFun(null);
	
	});

function ywslshFun(param){
  $('#ywslshglGrid').datagrid({    
    url:basePath+"ywslsh/ywslView",
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	width:'100%',
	toolbar: '',
	queryParams: {
		param: param
		
	},
	pagination: true,   
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'slbh',title:'受理编号',width :fixWidth(0.3),align:'center'},    
        {field:'ywlx',title:'业务类型',width : fixWidth(0.2),align:'center'},    
        {field:'ywmc',title:'业务名称',width: fixWidth(0.2),align:'center'},
         {field:'ywdx',title:'业务对象',width: fixWidth(0.2),align:'center'},
         {field:'sqr',title:'申请人',width: fixWidth(0.2),align:'center'},
         {field:'ygdw',title:'用工单位',width: fixWidth(0.2),align:'center'},
         {field:'sqsj',title:'申请时间',width:fixWidth(0.25),align:'center'},
         {field:'slzt',title:'受理状态',width: fixWidth(0.2),align:'center'},
         {field:'slsj',title:'受理时间',width: fixWidth(0.2),align:'center'},
         {field:'slr',title:'受理人',width: fixWidth(0.2),align:'center'},
        
         
         {title:'操作',field:'id',width: $(this).width() * 0.2,align:'center',
		    		formatter: function(value,row,index){
		    		if(ywsl&&ck)
 				      return '<a href="#" id="ywsl" style="color: green;"  onclick="addywslFuc('+value+')">业务受理</a> <a href="#" style="color: blue;" id="ck"  onclick="addywslshFuc('+value+')">查看</a>';
				
				    else if(!ywsl&&ck)
				         return ' <a href="#" style="color: blue;" id="ck"  onclick="addywslshFuc('+value+')">查看</a>';
				       else if(ywsl&&!ck)
				          return '<a href="#" id="ywsl" style="color: green;"  onclick="addywslFuc('+value+')">业务受理</a>';
				
				}   
				}
  
    ]]    
});  
	var pager = $('#ywslshglGrid').datagrid('getPager');
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


function searchslshDiv(){
   
    $('#slshSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/hygsgl/ywslSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#slshSearchInfo').dialog('close');
				}
			}],  
   onLoad: function () {
         
          $('#shType').val('1');
          
    } //loadEnd
     
}); 
    
}




function addywslshFuc(v){
	$('#ywslInfo').dialog({
    title: '业务查看',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    //href: '../hygsgl/ywslshAdd.jsp',
    href:basePath+"ywslsh/ywView?id="+v,
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywslInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
          loadYwData(v);
          
          
    } //loadEnd
    

});

}



function addywslFuc(id){
    if(id==null){
   $.messager.alert('提示','请选择数据！');
   return ;
   }
     if(sessionUserId==null||sessionUserId==''){
      $.messager.alert('提示', '未登录用户无法操作！');
      return;
    }
   //判断能否审核操作
   var isVerify=false;
    $.ajax({
                url: basePath+"ywslsh/getYwslMsg?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                 var sstate=data.rows.sstate;
               	 if(sstate=='4'){//审核状态 0:已受理  1:驳回   2:已审核 3:审核失败4：未审核
               	    isVerify=true;
               	 }
				}
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');
        
                }
            });
   
   if(isVerify==false){
   $.messager.alert('提示','当前审核状态不允许审核！');
   $('#ywslshglGrid').datagrid('reload');
   return ;
   
   }
	$('#ywslInfo').dialog({
    title: '业务受理',
    width: 600,
    height: 350,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ywslAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				saveYwflFuc();
				 $('#ywslInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywslInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
  
    
    //指定默认审核人
   var url = basePath+'ywslsh/ywslUserData?roleId=2';
   $('#zdSUid2').combobox('reload', url); 
    
   $('#id').val(id);//赋值给id      

    } //loadEnd
    

});

}


//导出受理单
function sldExport(){
if(!isCheckOne("#ywslshglGrid")){
    return;
 }
  	var rows = $("#ywslshglGrid").datagrid('getSelections');
    var pno=rows[0].slbh;
    if(pno==null||pno==''){
    $.messager.alert('提示', '受理编号不能为空！');
    
    }
       $.ajax({
                url: basePath+"ywslsh/getYwslMsg?id="+rows[0].id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
                 var sstate=data.rows.sstate;
               	 if(sstate=='5'){//审核状态 0:已受理  1:驳回   2:已审核 3:审核失败4：未审核5:结办
               	    window.location.href="../ywslsh/sldExport?pno="+pno;
               	 }else{
               	  $.messager.alert('错误','审核状态必须为‘办结’才能导出！','error');
               	  return;
               	 }
				}
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');
        
                }
            });

}

function searchFun(){

 
 var param=$("#searchForm").serializeArray();

   
    ywslshFun(JSON.stringify(param));
 
 
 
}

function cleanFun(){
$("#searchForm").form('reset');

}
</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
<!-- 		<a onclick="addywslshFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>-->
<!-- 		<a onclick="addywslFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">业务受理</a>-->
<!-- 		<a onclick="searchslshDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
 -->		
			<form id="searchForm" method="post"> 
	      <input type="hidden" id="shType" name="shType"><!-- 审核环节 -->
	      <table class="tableSearch">
	      
             <tr>
             
		   
		      <td class="left"><a onclick="sldExport();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true" id="dcsld">导出受理单</a> 受理编号:</td>
		      <td class="right"> <input id ="pno" name="pno"  class="easyui-textbox"  size="10" data-options="" style="height:22px"></td>
		      <td class="left">受理人:</td>
		      <td class="right"><input id ="username" name="username"   class="easyui-textbox"  size="10" data-options="" style="height:22px"></td>
		       <td class="left">申请人:</td>
		      <td class="right"><input id ="username2" name="username2"   class="easyui-textbox"  size="10" data-options="" style="height:22px"></td>
		       <td class="left">审核状态:</td>
		      <td class="right">
		       <select  class="easyui-combobox" id="sstate" name="sstate" data-options="editable:false"  style="width:75px;">   
			   <option value="">全部</option>
			   <option value="0">已受理</option>
			   <option value="1">驳回</option> 
			   <option value="2">已审核</option>   
			   <option value="3">审核失败</option> 
			   <option value="4">未审核</option> 
			   <option value="5">办结</option>   
			   </select> 
		      </td>
		       <td class="left">审核意见:</td>
		      <td class="right"><input id ="remark" name ="remark"  class="easyui-textbox"  size="20" data-options="" style="height:22px">
		    
		      <a onclick="searchFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">查询</a>
		     	<a onclick="cleanFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">重置</a>
		     </td>
		      </tr>
		      
		 
            </table>
</form>
		
	</div>

</div>
<div>
<table id="ywslshglGrid"></table>  
</div>
<div id="ywslshInfo"></div>
<div id="ywslInfo"></div>
<div id="xgbmInfo"></div>
<div id="slshSearchInfo"></div>

</body>
</html>
