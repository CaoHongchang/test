<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>业务分类管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
var sc = false;
var xg = false;
	 $(function(){
   
   $("#xz").hide();
    $("#cx").hide();
  
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==183){
				$("#xz").show();
			}else if(value==184){
				$("#cx").show();
			}else if(value==185){
				xg=true;
			}else if(value==186){
				sc = true;
			}
	});
    },"json");
    
     queryYwfl(null);
	
	
	
	});

function queryYwfl(param){
$('#ywflGrid').datagrid({    
    url:basePath+"ywfl/ywflView", 
    
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	pagination: true, 
	fitColumns:true,
	height: wholeHeight,
	width:'100%',
	//toolbar: '#ywflglTool',
	queryParams: {
		param: param
		
	},  
	//fit:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'pno',title:'分类编码',width : fixWidth(0.2),align:'center'},    
        {field:'name',title:'分类名称',width : fixWidth(0.2),align:'center'}, 
        {field:'object_name',title:'业务对象',width : fixWidth(0.2),align:'center'}, 
        {title:'操作',field:'id',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
		    		if(sc&&xg)
 				      return '<a href="#" style="color: green;"  id="xg" onclick="ywflglEditFuc(\''+row.id+'\',\''+row.pno+'\',\''+row.name+'\',\''+row.object_name+'\')">修改</a> <a href="#" style="color: blue;" id="sc"  onclick="ywflglDelFuc('+value+')">删除</a>';
 				      else if(!sc&&xg)
 				       return '<a href="#" style="color: green;"  id="xg" onclick="ywflglEditFuc(\''+row.id+'\',\''+row.pno+'\',\''+row.name+'\',\''+row.object_name+'\')">修改</a>';
				      else if(sc&&!xg)
				       return '<a href="#" style="color: blue;" id="sc"  onclick="ywflglDelFuc('+value+')">删除</a>';
				
				}   
				}
    ]]    
});  
	var pager = $('#ywflGrid').datagrid('getPager');
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


function ywflglDelFuc(id){
$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
  if (r){         
	if(id=='' || id==null){
	$.messager.alert('错误','id为空，操作失败！','error');
	return;
}
$.ajax({
                url: basePath+"ywfl/delFuc?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                 async: true,
                success: function(data){
                if(data.flag ==true){
                     $('#ywflGrid').datagrid('reload');
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

function ywflglEditFuc(id,pno,name,objectName){
	$('#ywflglAddInfo').dialog({
    title: '业务分类修改',
    width: 600,
    height: 250,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ywflglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				$('#ywflglAddInfo').dialog('close');
				
				saveYwflFuc();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywflglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
      $('#id').val(id);
      $('#pno').textbox('setValue',pno);
      $('#name').textbox('setValue',name);
      if(objectName!='null')
      $('#objectName').combobox('setValue',objectName);
    }  
 
});


}

function ywflglAddFuc(){
	$('#ywflglAddInfo').dialog({
    title: '业务分类新增',
    width: 600,
    height: 250,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ywflglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					var trainRemark=$("#name").textbox("getValue");
		            if(trainRemark==""){
						$.messager.alert("系统提示","分类名称不能为空");
						return false;
					}
					if(trainRemark.length>20){
						$.messager.alert("系统提示","分类名称长度不超过20位");
						return false;
					}
				$('#ywflglAddInfo').dialog('close');
				saveYwflFuc();
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywflglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    //分类编码
    var pno='001'+randomNum(10);
    $('#pno').textbox('setValue',pno);	
    }  
 
});


}

function searchYwflDiv(){
   
    $('#ywflSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/hygsgl/ywflSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#ywflSearchInfo').dialog('close');
				}
			}]   
}); 
    
}


 
</script>


<body style="margin: 1px;">
 <div id="ywflglTool"  style="background-color:#FFFFFF;">

		<a onclick="ywflglAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="xz">新增</a>
		<!-- <a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a> -->
		<a onclick="searchYwflDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
		
		

</div>
 <table id="ywflGrid"></table>


<div id="ywflglAddInfo"></div> 
<div id="zjShowInfo"></div> 
<div id="ywflSearchInfo"></div>


</body>
</html>
