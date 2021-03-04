<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案存放放置管理</title>

<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
	$(function(){
   
  init();
	
});
function init(){

 $('#dacffzglGrid').datagrid({    
	url:'<%=request.getContextPath()%>/archivesInfoContr/qryArchivesInfoList', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false, 
	queryParams:{
		dpno:window.top.cacheArchive.cacheDpno?window.top.cacheArchive.cacheDpno:''
	},
    columns:[[    
         {field:'ID',title:'选择',checkbox:true,align:'center'},
         {field:'DPNO',title:'档案编号',width : $(this).width() * 0.15,align:'center'},    
         {field:'ORG_NO',title:'案卷目录号',width : $(this).width() * 0.1,align:'center'},    
         {field:'ORG_NAME',title:'案卷目录题名/组织机构名称',width: $(this).width() * 0.13,align:'center'},
         {field:'S_YEAR',title:'所属年度',width: $(this).width() * 0.1,align:'center'},
         {field:'AJ_TYPE',title:'案卷类型',width: $(this).width() * 0.1,align:'center'},
         {field:'POSITION',title:'存放位置',width: $(this).width() * 0.1,align:'center'},
         {field:'STAFFNAME',title:'录入人',width: $(this).width() * 0.1,align:'center'},
         {field:'ADD_DATE',title:'录入时间',width: $(this).width() * 0.1,align:'center'},
         {field:'uid12',title:'操作',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
	    		      if(row.ORG_NO == null){
 				      		return '<a href="#" style="color: green;"  onclick="gdqsclglFuc(\''+row.DPNO+'\')">管理存放位置</a>';
	    		        }else{
	    		        	return '<a href="#" style="color: green;"  onclick="editFuc(\''+row.DPNO+'\')">管理存放位置</a>';
		    		    }
	    		    }   
				}
  
    ]],
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId='';//档案id
		cache.cacheDpno=rowData.DPNO;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName='';//姓名
		cache.cacheSchool='';//毕业院校
		cache.cacheMajor='';//所学专业
		cache.cacheTel='';//联系电话
	},
	onLoadSuccess:function(data){
		if(data.rows.length>0){
			$('#dacffzglGrid').datagrid('checkRow',0);
		}
		
	}
});  
	var pager = $('#dacffzglGrid').datagrid('getPager');
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

function editFuc(dpno){
	var id;
	$('#dacffzglInfo').dialog({
	    title: '档案存放放置管理',
	    width: 950,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../daxxgl/dacffzglAdd.jsp',
	    modal: true,
	    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
				    	var param=$("#dacffzglAddFm").serializeArray();
				 	    param=JSON.stringify(param); 
				 		
				 		$("#dacffzglAddFm").ajaxSubmit({ 
				 	    			url : '<%=request.getContextPath()%>/archivesInfoContr/updateArchivesInfo',
				 	    			async : true,
				 	    			 data: {
				 	    				'param': param,
				 	    				'id': id,
				 	                    'dpno':dpno
				 	                },
				 	    			success : function(data) {
				 	                var result = $.parseJSON(data);  
				 	    			if(result.flag == true){
				 	    				 $.messager.alert('提示','档案存放位置管理更新成功');
				 	    				 $('#dacffzglInfo').dialog('close');
				 	    				 $("#dacffzglGrid").datagrid("reload");
				 	    			}else{
				 	    				$.messager.alert('提示','档案存放位置管理更新失败，原因：'+result.errorMsg);
				 	    			}
				 	    		},
				 	    		error : function(data) {
				 	    			   
				 	    		}
				 	    	});
						    $('#dacffzglInfo').dialog('close');
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#dacffzglInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
				 $.ajax({ 
		  			url : '<%=request.getContextPath()%>/archivesInfoContr/qryArchivesInfoBean',
		  			async : true,
		  			   cache: false,
		  			 data: {
		                  'dpno':dpno
		              },
		  			success : function(data) {
		  			  id = data.rows.id;
		  			 
		  			 // alert(data.rows.sessionUserName);
		  			   $("#dacffzglAddFm").form('load',{sessionUserName:data.rows.sessionUserName,remark:data.rows.remark});
		  			   
		  			  $("#dacffzglAddFm").form('load', data.rows);
		  		},
		  		error : function(data) {
		  			   
		  		}
		  	});
	    } //loadEnd
	});
}




function gdqsclglFuc(dpno){
	$('#dacffzglInfo').dialog({
    title: '档案存放放置管理',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/dacffzglAdd.jsp',
    modal: true,
    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			    	var param=$("#dacffzglAddFm").serializeArray();
			 	    param=JSON.stringify(param); 
			 	    
			 	   $("#dacffzglAddFm").ajaxSubmit({ 
			 	    			url : '<%=request.getContextPath()%>/archivesInfoContr/saveArchivesInfo',
			 	    			async : true,
			 	    			 data: {
			 	                    'param': param,
			 	                    'dpno':dpno
			 	                },
			 	    			success : function(data) {
			 	                var result = $.parseJSON(data);  
			 	    			if(result.flag == true){
			 	    				 $.messager.alert('提示','档案存放位置管理新增成功');
			 	    				 $('#dacffzglInfo').dialog('close');
			 	    				 $("#dacffzglGrid").datagrid("reload");
			 	    			}else{
			 	    				$.messager.alert('提示','档案存放位置管理新增失败，原因：'+result.errorMsg);
			 	    			}
			 	    		},
			 	    		error : function(data) {
			 	    			   
			 	    		}
			 	    	});
					    $('#dacffzglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#dacffzglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    } //loadEnd
});
}
//管理存放位置
function archiveLocationManage(){
	var selected=$('#dacffzglGrid').datagrid('getSelected');
	if(!selected){
		alert('请选择您要操作的记录！');
	}else{
		 if(selected.ORG_NO == null){
	      		gdqsclglFuc(selected.DPNO);
	     }else{
	        	editFuc(selected.DPNO);
		 }
	}
}

function query(){
	var dpno = $("#searchDpno").textbox('getValue');
	var orgno = $("#searchOrgno").textbox('getValue');
	var orgname=$('#searchOrgname').textbox('getValue');
	var syear=$('#searchOrgname').textbox('getValue');
	$("#dacffzglGrid").datagrid("load",{
		dpno:dpno,
		orgno:orgno,
		orgname:orgname,
		syear:syear
	});
}
</script>


<body style="margin: 1px;">
 
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
	   <a onclick="archiveLocationManage();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">管理存放位置</a>
	   			<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>

</div>
<div>
<label>档案编号：</label>
<input class="easyui-textbox" value="" name="searchDpno" id="searchDpno" style="width:150px">
&nbsp;&nbsp;
<label>案卷目录号：</label> 
<input class="easyui-textbox" value="" name="searchOrgno" id="searchOrgno" >
&nbsp;&nbsp;
<label>案卷目录题名/组织机构名称：</label>
<input class="easyui-textbox" value="" name="searchOrgname" id="searchOrgname" >
&nbsp;&nbsp;
<label>所属年度：</label>
<input class="easyui-textbox" value="" name="searchSyear" id="searchSyear" >
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>
<table id="dacffzglGrid"></table>  
</div>
<div id="dacffzglInfo"></div>


</body>
</html>
