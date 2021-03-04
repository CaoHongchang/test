<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
<title>无标题文档</title>
<link  rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="js/jquery-easyui/themes/icon.css"/>
<script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
<script src="js/jquery-easyui/jquery.easyui.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){

var wholeWidth = window.screen.availWidth-40;
var wholeHeight = window.screen.availHeight-300;


  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

$('#noticeRs').datagrid({
	//fit:true,
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
	pagination:true,

	columns:[[
	            {title:'选择',field:'xz',height:10,width:60,align:'center',checkbox:true},
	            {title:'分类编码',field:'id',height:10,width:60,align:'center'},
	            {title:'分类名称',field:'title',width:150,align:'center'},
	            {title:'分类尺寸',field:'inUid',width:150,align:'center'},
	    		{title:'图片类型',field:'add_date',width:150,align:'center'},
	    		{title:'操作',field:'uid',width:150,align:'center',
	    		formatter: function(value,row,index){
				 return "<a href='#' style='color: blue;' onclick='editFuc();' >修改<a> <a href='#' style='color: blue;' onclick='delFuc();'>删除</a>";
			}
	    		
	    		
	    		}
			]]

});
	var pager = $('#noticeRs').datagrid('getPager');
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


var jsonstr = '{"total":1,"rows":[{"id":"0001","title":"首页banner","inUid":"700×500","add_date":"轮播图","uid":"admin","update_date":"2016-06-22 22:00:00"},{"id":"0002","title":"首页左侧浮动条","inUid":"70x300","add_date":"图片链接","uid":"admin","update_date":"2016-06-22 22:00:00"}]}'; 
var data = $.parseJSON(jsonstr);  
$('#noticeRs').datagrid('loadData', data); 

});

function showaddWindow(options){
	$("#addWindow").window(options);
}
//关闭弹出窗口
function closeWindow(){
	$("#addWindow").window('close');
}


function addFuc(){
	var url="add.jsp";
	showaddWindow({
		title:'分类新增',
		href:url,
		width:550,
		height:400,
		modal:true,
		center:true,
		shadow:false,
		minimizable:false,
		cache:false,
		maximizable:false,
		collapsible:false,
		resizable:true,
		onLoad: function(){
			//queryComponentDeployFuc(agentId);
		}
	});
}

function editFuc(){
	var url="edit.jsp";
	showaddWindow({
		title:'分类新增',
		href:url,
		width:550,
		height:400,
		modal:true,
		center:true,
		shadow:false,
		minimizable:false,
		cache:false,
		maximizable:false,
		collapsible:false,
		resizable:true,
		onLoad: function(){
			//queryComponentDeployFuc(agentId);
			$('#cc').combobox('setValue', 'aa');

			
		}
	});
}

//删除
function delFuc(){
	$.messager.confirm('提示','确定要删除吗?',function(result){
		if (result){
		$.messager.show({
							title:'删除信息',
							msg:'操作成功!',
							showType:'show',
							timeout:2000

						});
		}
	});

}


//保存
function saveFuc(){
	$.messager.confirm('提示','确定要保存吗?',function(result){
		if (result){
		
		closeWindow();
		$.messager.show({
							title:'分类信息',
							msg:'保存成功!',
							showType:'show',
							timeout:2000

						});
		}
	});

}


</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">图片管理</a></li>
    <li><a href="#">图片管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
	<div class="datagrid-toolbar">
		    <a id="addNotice2" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="addFuc()">新增 </a> 
		    <a id="addNotice3" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="editFuc()">修改 </a>
		    <a id="addNotice4" href="#" align="center" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="delFuc()">删除 </a>
    </div>
    <table  id="noticeRs" singleSelect="true" ></table>
 
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
   
   <div id="addWindow"></div>
</body>

</html>
