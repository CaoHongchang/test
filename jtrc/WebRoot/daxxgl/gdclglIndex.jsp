<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">

<title>归档材料管理</title>

<script type="text/javascript">
  
	$(function(){
   
init();
	
	});

function init(){

   $('#gdclglGrid').datagrid({    
    url:'../archivesBaseInfoTrol/querybaseinfolist', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: '80%',
	toolbar: '#zcpshdTool',
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	singleSelect: true,
	queryParams:{
		dept:"daNum",
		key:window.top.cacheArchive.cacheDpno
	},
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
         {field:'pno',title:'系统编码',width : $(this).width() * 0.1,align:'center'},    
         {field:'dpno',title:'档案号',width : $(this).width() * 0.1,align:'center'},    
         {field:'name',title:'代理人姓名',width: $(this).width() * 0.1,align:'center'},
         {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center',formatter:function(value,row,index){
            if (value == "") {
          	   return value;
			}
            else if(value=='1')
             return '男';
            else if(value=='0')
            return '女';
            else 
            return value;
         }},
         {field:'pnum',title:'身份证号',width: $(this).width() * 0.15,align:'center'},
         {field:'tel',title:'联系电话',width: $(this).width() * 0.1,align:'center'},
         {field:'is_s',title:'是否派遣',width: $(this).width() * 0.1,align:'center',
        	 formatter: function(value,row,index){
                 if (value == 'on') {
               	    return "是";
     			}else if (value == 'off') {
               	    return "否";
     		    }else{
     				return "否";
     		    }
     	     }	},
         {title:'操作',field:'uid12',width: $(this).width() * 0.15,align:'center',
		    		formatter: function(value,row,index){
		    		  return "<a href=\"javascript:gdclglFuc("+index+")\" style=\"color: green;\" >材料管理</a>&nbsp;&nbsp;<a  href=\"javascript:void(0)\"style=\"color: blue;\"  onclick=\"exportMaterial('"+row.dpno+"')\">档案目录导出</a>";
				}   
				}
  
    ]],
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.id;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.name;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.userTel;//联系电话
		setArchiveHead();
	},
	onLoadSuccess:function(data){
	}
    });  
	var pager = $('#gdclglGrid').datagrid('getPager');
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




function gdclglFuc(index){
	var row;
	if(index=='')
		   row=$('#gdclglGrid').datagrid('getSelected');
	else{
		 var rows=$('#gdclglGrid').datagrid('getRows');
		 row=rows[index];
	}
	if(row!=null){
	if(row.dpno!=null&&row.dpno!=''){
	$('#gdclglInfo').dialog({
    title: '材料管理',
    width: 1100,
    height: 500,
    resizable:true,
    closed: false,
    cache: false,
    href: '../daxxgl/gdclglAdd.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				  $('#gdclglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
         $('#archiveForm').form('load',row);
         $('#gdclglGrid').datagrid('reload');
         
    } 
    

});
	}
	else{
		$.messager.alert('系统提示','请完善档案信息!','info');
	}
	}else{
		$.messager.alert('系统提示','请选择要管理材料的档案!','info');
	}

}

function exportMaterial(pno){debugger;

      $.messager.progress({ // 显示进度条  
       title:"材料目录下载",  
           text:"正在下载...",  
           interval:500  
          });  
	var pnos='';
	if(pno!=''&&pno!=undefined){
		pnos=pno;
	}
	else{
	
		pnos=getSelections();
	}
	if(pnos!='null'&&pnos!=''){
		window.location='<%=request.getContextPath()%>/gdcl/exportMaterials?pnos='+pnos;
		 setTimeout(function(){
		  $.messager.progress('close'); 
	   },6000); 
	}else{
		$.messager.alert('系统提示','请选择您要导出的档案或完善档案信息！','info');
	}
}

function getSelections(){
	var rows=$('#gdclglGrid').datagrid('getSelections');
	var result='';
	$.each(rows,function(index,value){
		if(value.dpno!=null&&value.dpno!=undefined){
			result+=value.p_no+",";
		}
	});
	return result==''?result:result.substring(0,result.length-1);
}

function query(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	$("#gdclglGrid").datagrid("load",{
		dept:dept,
		key:key,
		pnum:pnum,
		name:name,
		age:age
	});
}

</script>


<body style="margin: 1px;">
 
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="gdclglFuc('');" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">材料管理</a>
		<a onclick="exportMaterial('');" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">档案目录导出</a>	
		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>	
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<select  class="easyui-combobox" id="dept" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" data-options="iconCls:''" id="key" name="key" style="width:150px">
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >
&nbsp;&nbsp;
<label>年龄：</label>
<select class="easyui-combobox" value="" name="seachAge" id="searchAge" data-options="editable:false,panelHeight:null" style="width:150px;">
  <option value="">所有</option>
  <option value="30">30以下</option>
  <option value="40">31-40岁</option>
  <option value="50">41-50岁</option>
  <option value="60">51岁以上</option>
</select> 
<a onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="gdclglGrid"></table>  
</div>
<div id="gdclglInfo"></div>
<div id="daxxUploadDialog"></div>
<div id="daxxUploadDialog2"></div>
	<div id="previewDialog"></div>
<div id="progress"> </div>

<form action="<%=request.getContextPath()%>/gdcl/exportMaterials" id="form_upload">

<input type="hidden" name="pno" id="pno_submit">
</form>
</body>
</html>
