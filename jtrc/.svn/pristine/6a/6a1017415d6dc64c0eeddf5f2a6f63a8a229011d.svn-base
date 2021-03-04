<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>业务分类管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">

<script type="text/javascript">
var sc = false;
var xg = false;
	 $(function(){
   
    
   $("#xz").hide();
    $("#cx").hide();

   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==187){
				$("#xz").show();
			}else if(value==188){
				$("#cx").show();
			}else if(value==189){
				xg=true;
			}else if(value==190){
				sc=true;
			}
	});
    },"json");
     queryYwgl(null,'');
	
	
	$('#flTree').tree({    
       url:basePath+"ywfl/ywflData?isTree=true",
       onClick: function(node){
		  queryYwgl(null,node.id);
	}
          
     });  
	
	
	});

function queryYwgl(param,typeId){

	$('#ywGrid').datagrid({    
    url:basePath+"ywgl/ywglView?typeId="+typeId, 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	pagination: true, 
	height: wholeHeight,
	width:'100%',
	toolbar: '#ywflglTool',
	queryParams: {
		param: param
		
	}, 
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'pno',title:'业务编码',width : fixWidth(0.2),align:'center'},    
        {field:'name',title:'业务名称',width : fixWidth(0.2),align:'center'}, 
        {field:'type_id',title:'业务分类id',hidden:true,width : fixWidth(0.2),align:'center'},
        {field:'typeName',title:'业务分类',width : fixWidth(0.2),align:'center'}, 
         
        {title:'操作',field:'id',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
		    		if(xg&&sc)
 				      return '<a href="#" id="xg" style="color: green;"  onclick="ywglEditFuc(\''+value+'\',\''+row.pno+'\',\''+row.name+'\',\''+row.type_id+'\',\''+row.obj_id+'\',\''+row.remark+'\')">修改</a> <a id="sc" href="#" style="color: blue;"  onclick="delgzFuc('+value+')">删除</a>';
 				      else if(xg&&!sc)
 				       				      return '<a href="#" id="xg" style="color: green;"  onclick="ywglEditFuc(\''+value+'\',\''+row.pno+'\',\''+row.name+'\',\''+row.type_id+'\',\''+row.obj_id+'\',\''+row.remark+'\')">修改</a>';
 				      else if(!xg&&sc)
 				       				      return '<a id="sc" href="#" style="color: blue;"  onclick="delgzFuc('+value+')">删除</a>';
				}   
				}
    ]]    
});  
	var pager = $('#ywGrid').datagrid('getPager');
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

function delgzFuc(id){
$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
  if (r){         
	if(id=='' || id==null){
	$.messager.alert('错误','id为空，操作失败！','error');
	return;
}
        $.ajax({
                url: basePath+"ywgl/delYwglFuc?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                 async: true,
                success: function(data){
                if(data.flag ==true){
                     $('#ywGrid').datagrid('reload');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！'+data.cause,'error');

					}	
                },
                error: function(data){
                  
                   errorMsg();

                }
            });
       
    }    
});

}

function ywglEditFuc(id,pno,name,typeId,objId,remark){
$('#ywAddInfo').dialog({
    title: '业务修改',
    width: 900,
    height: 450,
   
    closed: false,
    cache: false,
    href: basePath+'hygsgl/ywglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				var r=saveYwglFuc();
				
				if(r!=false)
				$('#ywAddInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
     fjListFuc(id);//附件列表
     $('#id').val(id);
     var  editor = CKEDITOR.replace('remark');
      if(remark!='null')
      $("#remark").val(remark);
      if(pno!='null')
      $('#pno').textbox('setValue',pno);
      if(name!='null')
      $('#name').textbox('setValue',name);
      if(typeId!='null')
      $('#typeId').combobox('setValue',typeId);
      if(objId!='null')
      $('#objId').combobox('setValue',objId);
    }  
 
});
}

function ywglAddFuc(){
	$('#ywAddInfo').dialog({
    title: '业务新增',
    width: 900,
    height: 450,
   
    closed: false,
    cache: false,
    href: basePath+'hygsgl/ywglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				var r=saveYwglFuc();
				debugger;
				if(r!=false)
				$('#ywAddInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
     var  editor = CKEDITOR.replace('remark');
     fjListFuc(null);//新增附件列表默认为空
     $('#isAdd').val('true');//是否新增操作
     
     
     


    }  
 
});


}



function zjglShowFuc(){
	$('#zjShowInfo').dialog({
    title: '专家查看',
    width: 750,
    height: 330,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zjglShow.jsp',
    modal: true,
     buttons:[
         /*  {
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			}, */
			{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zjShowInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
    }  
 
});


}
 
 
 
 
function searchYwglDiv(){
   
    $('#ywglSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/hygsgl/ywglSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywglSearchInfo').dialog('close');
				}
			}]   
}); 
    
}
 
 
</script>


<body style="margin: 1px;">
 <div id="ywflglTool"  style="background-color:#FFFFFF;">

		<a onclick="ywglAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="xz">新增</a>
<!-- 		<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
 -->		<a onclick="searchYwglDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
		
		

</div>
 

<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
   
    <div data-options="region:'west',title:'分类列表',split:true" style="width:20%">
    <ul id="flTree"></ul> 
    </div>   
    <div data-options="region:'center',title:''" style="padding:0px;width: 80%">
    <table id="ywGrid"></table> 
    
    </div>   
</div>  


<div id="ywAddInfo"></div> 
<div id="zjShowInfo"></div> 
<div id="ywglSearchInfo"></div>

</body>
</html>
