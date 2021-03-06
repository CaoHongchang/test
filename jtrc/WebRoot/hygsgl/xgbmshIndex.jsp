<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<link rel="stylesheet" href="<%=basePath%>/js/lightbox/css/lightbox.css" media="screen"/>
<script src="<%=basePath%>/js/lightbox/lightbox-2.6.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<html>
<head>
<title>关联业务经办人审核管理</title>

<script type="text/javascript">
var ywsl =false;
var ck =false;
	$(function(){
   
         $("#cx").hide();
    $("#dcsld").hide();
    
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==203){
				$("#cx").show();
			}else if(value==204){
				$("#dcsld").show();
			}else if(value==205){
				ywsl=true;
			}else if(value==206){
				ck=true;
			}
	});
    },"json");
  xgbmFuc(null);
	
	
	
	});


function xgbmFuc(param){
 $('#xgbmshglGrid').datagrid({    
    url:basePath+"ywslsh/xgbmshView",
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	width:'100%',
	toolbar: '#zcpshdTool',
	queryParams: {
		param: param
		
	},
	pagination: true, 
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'slbh',title:'受理编号',width : fixWidth(0.1),align:'center'},    
        {field:'ywlx',title:'业务类型',width : fixWidth(0.1),align:'center'},    
        {field:'ywmc',title:'业务名称',width: fixWidth(0.2),align:'center'},
         {field:'ywdx',title:'业务对象',width: fixWidth(0.1),align:'center'},
         {field:'sqr',title:'申请人',width: fixWidth(0.1),align:'center'},
         {field:'ygdw',title:'用工单位',width: fixWidth(0.2),align:'center'},
         {field:'sqsj',title:'申请时间',width: fixWidth(0.1),align:'center'},
        /*  {field:'slzt',title:'受理状态',width: $(this).width() * 0.1,align:'center'}, */
         {field:'slsj',title:'受理时间',width: fixWidth(0.1),align:'center'},
        /*  {field:'slr',title:'受理人',width: $(this).width() * 0.1,align:'center'}, */
        {field:'zdxgbmshr',title:'指定相关部门审核人',width: fixWidth(0.1),align:'center'},
        {field:'xgbmshzt',title:'相关部门审核状态',width: fixWidth(0.1),align:'center'},
        {field:'xgbmshyj',title:'相关部门审核意见',width: fixWidth(0.3),align:'center'},
         {field:'parentId',title:'父id',width: fixWidth(0.3),align:'center',hidden:true},
        
         
         {title:'操作',field:'id',width: fixWidth(0.1),align:'center',
		    		formatter: function(value,row,index){
		    		
		    		if(ywsl&&ck)
 				      return '<a href="#" id="ywsl" style="color: green;"  onclick="addxgbmshFuc(\''+row.id+'\',\''+row.parentId+'\')">业务受理</a> <a href="#" style="color: blue;" id="ck"  onclick="addywslshFuc('+value+')">查看</a>';
 				      else if(!ywsl&&ck)
 				       				      return '<a href="#" style="color: blue;" id="ck"  onclick="addywslshFuc('+value+')">查看</a>';
 				     else if(ywsl&&!ck)
 				      return '<a href="#" id="ywsl" style="color: green;"  onclick="addxgbmshFuc(\''+row.id+'\',\''+row.parentId+'\')">业务受理</a>';
 				      
				}   
				}
  
    ]]    
});  
	var pager = $('#xgbmshglGrid').datagrid('getPager');
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



function searchxgshDiv(){
   
    $('#xgshSearchInfo').dialog({    
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
				$('#xgshSearchInfo').dialog('close');
				}
			}],  
   onLoad: function () {
         
          $('#shType').val('4');
          
    } //loadEnd
     
}); 
    
}


function addywslshFuc(v){
	$('#xgbmshInfo').dialog({
    title: '业务查看',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
     href:basePath+"ywslsh/ywView?id="+v,
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xgbmshInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
          loadYwData(v);
          
          
    } //loadEnd
    

});

}



function addxgbmshFuc(id,pid){
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
   var sMsg='';//审核意见（默认上一次审核意见）
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
               	    sMsg=data.rows.s_msg;
               	 }
				}
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');
        
                }
            });
  

		if (isVerify == false) {
			$.messager.alert('提示', '当前审核状态不允许审核！');
			$('#xgbmshglGrid').datagrid('reload');
			return;
		}
   
   
	$('#xgbmshInfo').dialog({
    title: '相关部门审核审核',
    width: 600,
    height: 350,
   
    closed: false,
    cache: false,
    href: '../hygsgl/xgbmbmzAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				saveXgbmshFuc();
				 $('#xgbmshInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xgbmshInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
    
    
    
    //指定默认审核人
   var url = basePath+'ywslsh/ywslUserData?roleId=3';
   $('#zdSUid').combobox('reload', url); 
   $('#sMsg').textbox('setValue',sMsg);
   $('#id').val(id);//赋值给id      

    } //loadEnd
    

});

}

//导出受理单
function sldExport(){
if(!isCheckOne("#xgbmshglGrid")){
    return;
 }
  	var rows = $("#xgbmshglGrid").datagrid('getSelections');
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
               	 }
				}
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');
        
                }
            });

}


</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
<!-- 		<a onclick="addywslshFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>-->
<!-- 		<a onclick="addxgbmshFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">业务受理</a>-->
		<a onclick="searchxgshDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
		<a onclick="sldExport();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true" id="dcsld">导出受理单</a>
		
	</div>

</div>
<div>
<table id="xgbmshglGrid"></table>  
</div>
<div id="xgbmshInfo"></div>
<div id="xgbmInfo"></div>
<div id="xgshSearchInfo"></div>

</body>
</html>
