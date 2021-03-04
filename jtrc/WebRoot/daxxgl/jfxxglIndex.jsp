<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>缴费信息管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript">
$(function(){
	doSearch(1);
});

function doSearch(type){
	var ar_no;
	
       if(type != 1){
    	   ar_no = $("#ar_no").val();
       }else{
    	   if(window.top.cacheArchive.cacheDpno){
    			
    		   ar_no = window.top.cacheArchive.cacheDpno
    		
    	   }else{
    		   ar_no = 'null';
    	   }
    	    
       }
        var pnum = $("#searchPnum").val();
   		var name=$('#searchName').textbox('getValue');
   		var sdate=$('#searchSdate').datebox('getValue');
   		var edate=$('#searchEdate').datebox('getValue');
	   $('#jfxxglGrid').datagrid({    
	    url:'<%=request.getContextPath()%>/archivesMoneyContr/queryArchivesMoneyList', 
	    border:true,
		pageSize:10,
        height: 360,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		//fitColumns:true,
		height: wholeHeight,
		pagination : true,
		toolbar: '',
		queryParams: {
	    	ar_no: ar_no,
	    	pnum:pnum,
	    	name:name,
	    	sdate:sdate,
	    	edate:edate
		},
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:[[    
	        
	         {field:'id',title:'选择',checkbox:true,align:'center'},
	        {field:'arNo',title:'档案编码',width : $(this).width() * 0.2,align:'center'},    
	        {field:'proxyName',title:'代理人姓名',width : $(this).width() * 0.2,align:'center'}, 
	        {field:'pnum',title:'身份证',width:45}, 
	        {field:'jfType',title:'缴费类别',width: $(this).width() * 0.2,align:'center'},
	         {field:'jfDate',title:'缴费日期',width: $(this).width() * 0.2,align:'center'},
	         {field:'pNo',title:'发票号码',width: $(this).width() * 0.2,align:'center'},
	         {field:'sDate',title:'缴费期限_起始日期',width: $(this).width() * 0.1,align:'center'},
	         {field:'eDate',title:'缴费期限_终止日期',width: $(this).width() * 0.1,align:'center'},
	         {field:'m',title:'缴费金额',width: $(this).width() * 0.1,align:'center'},
	         {field:'jfName',title:'选择缴费单',width: $(this).width() * 0.1,align:'center'}
	    ]],
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId='';//档案id
		cache.cacheDpno=rowData.arNo;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName='';//姓名
		cache.cacheSchool='';//毕业院校
		cache.cacheMajor='';//所学专业
		cache.cacheTel='';//联系电话
		setArchiveHead();
	}  ,
	onLoadSuccess:function(data){
		$('#jfxxglGrid').datagrid('checkAll');
	}      
	});  
		var pager = $('#jfxxglGrid').datagrid('getPager');
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
/*导出模板*/
function exportFuc(){
	var url= "<%=request.getContextPath()%>/archivesMoneyContr/exportTemp?";
	window.location.href= url; 
}

function importFuc(){
		$('#importInfo').dialog({
	    title: '导入缴费信息',
	    width: 350,
	    height: 150,
	    
	    closed: false,
	    cache: false,
	    href: '../zxxxgl/bjzxqkFormImport.jsp',
	    modal: true,
	     buttons:[{
				text:'上传',
				iconCls:'icon-ok',
				handler:function(){
	    	 		uploadExcel();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#importInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () {}  
	});
}
 

var dataFlag;
function uploadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
         var url = "<%=request.getContextPath()%>/archivesMoneyContr/jfUpload"; 
        
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
 				            var resObj = eval("("+data+")");
 				            dataFlag = resObj.flag;
			            	if(dataFlag){
			            		$('#importInfo').dialog('close');
			            		showJf(resObj.rows);
				            }else{
				            	$.messager.alert('错误','导入失败,请核查数据中错误: '+errorMsg);
					        }
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
function showJf(dates){
	$('#jfxxglInfo').dialog({
    title: '缴费信息导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: 'jfxxAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   saveJf(dates);
				   $('#jfxxglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#jfxxglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#jfxxGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false, 
	nowrap:false,
    columns:[[    
		{field:'arNo',title:'档案编码',width : fixWidth(0.1),align:'center'},    
		{field:'proxyName',title:'代理人姓名',width : fixWidth(0.2),align:'center'},    
		{field:'jfType',title:'缴费类别',width: fixWidth(0.1),align:'center'},
		 {field:'jfDate',title:'缴费日期',width: fixWidth(0.1),align:'center'},
		 {field:'pNo',title:'发票号码',width: fixWidth(0.2),align:'center'},
		 {field:'sDate',title:'缴费期限_起始日期',width: fixWidth(0.2),align:'center'},
		 {field:'eDate',title:'缴费期限_终止日期',width: fixWidth(0.2),align:'center'},
		 {field:'m',title:'缴费金额',width: fixWidth(0.1),align:'center'},
		 {field:'jfName',title:'选择缴费单',width: fixWidth(0.1),align:'center'},
		 {field:'errMsg',title:'错误信息',width: fixWidth(0.4),align:'center'}
        ]]    
     });  
	var pager = $('#jfxxGrid').datagrid('getPager');
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
	
	$('#jfxxGrid').datagrid('loadData',dates);
    } //loadEnd
 });
}

//成绩保存
function saveJf(dates){
   if(dateFlag != true){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
   
 
   $.blockUI();
    $.ajax({
                url: "../archivesMoneyContr/saveJf",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     $.messager.alert('提示','导入成功 ');
               //      $("#jfxxGrid").datagrid("reload");
                     try{
                    	 $('#jfxxglInfo').dialog('close');
        				
                     }catch(e){
                    	 
                     }
                     $('#jfxxglGrid').datagrid('reload');
					}else{
						$.messager.alert('错误',''+data.cause);
					}	
                },
                error: function(data){
                   $.unblockUI();
                   $.messager.alert('错误','导入失败,请核查数据中错误提示 ');
                }
            });
  
   
}

//兼容ie的导入
function importFucJf(){
	$("#addJfFileForm").ajaxSubmit({
		dataType:"html",
		url : "../archivesMoneyContr/jfUploadIe",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
         $.blockUI();
       },
		complete: function() { 
          $.unblockUI();
         
           $('input[type="file"]').attr('value',''); 
           $('#addJfFileForm')[0].reset();  
       } ,  
		success : function(data) {
			var result = $.parseJSON(data); 
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			     showJf(result.rows);
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			} 
		},
		error : function(data) {
			$.messager.alert('错误','操作失败！'+data);
		}
	});
	
}
//新增缴费信息
function addJfxx(){
	$('#jfxxglAdd').dialog({
    title: '缴费新增',
    width: 450,
    height: 500,
    closed: false,
    cache: false,
    href: '../daxxgl/jfxxAdd1.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					if($('#jfxxForm').form('validate')){
						var formData=$('#jfxxForm').serializeArray();
						var data={};
						for(var i=0;i<formData.length;i++){
							if(formData[i].name!='pnum'){
								data[formData[i].name]=formData[i].value;
							}
						
						}
						$.post('../archivesMoneyContr/addJf',data,function(result){
			                if(result.flag ==true){
			                     $.messager.alert('提示','新增成功','info');
			                     $('#jfxxglAdd').dialog('close');
			                     $('#jfxxglGrid').datagrid('reload');
								}else{
									$.messager.alert('错误',result.cause);
								}	
			            },'json');
						
					}else{
						$.messager.alert('提示','请输入必填项','info');
					}
			    	
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    	if(window.top.cacheArchive.cacheDpno){
			$('#arNo').textbox('setValue',window.top.cacheArchive.cacheDpno);
		}
    	if(window.top.cacheArchive.cacheIdnum){
			$('#pnum').textbox('setValue',window.top.cacheArchive.cacheIdnum);
		}
    	if(window.top.cacheArchive.cacheName){
			 $('#proxyName').textbox('setValue',window.top.cacheArchive.cacheName);
		}
    	$('#pnum').textbox({events:{blur:function(){
    			  $.post('../userMgInfoTrol/checkIsPnumExist',{pnum:$(this).val()},function(result){
      				  $('#arNo').textbox('setValue',result.dpno);
      				  $('#proxyName').textbox('setValue',result.name);
      			  },'json');
    	}}});
    
    } //loadEnd
    

});
}
//修改缴费信息
function modifyJfxx(){
	var selected=$('#jfxxglGrid').datagrid('getSelected');
	if(!selected){
		$.messager.alert('提示','请选择您要修改的缴费信息！','info');
		return;
	}
	$('#jfxxglAdd').dialog({
	    title: '缴费修改',
	    width: 450,
	    height: 500,
	    closed: false,
	    cache: false,
	    href: '../daxxgl/jfxxAdd1.jsp',
	    modal: true,
	     buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						if($('#jfxxForm').form('validate')){
							var formData=$('#jfxxForm').serializeArray();
							var data={};
							for(var i=0;i<formData.length;i++){
								if(formData[i].name!='pnum'){
								data[formData[i].name]=formData[i].value;
								}
							}
							$.post('../archivesMoneyContr/updateJf',data,function(result){
				                if(result.flag ==true){
				                     $.messager.alert('提示','修改成功','info');
				                     $('#jfxxglAdd').dialog('close');
				                     $('#jfxxglGrid').datagrid('reload');
									}else{
										$.messager.alert('错误','修改失败 ');
									}	
				            },'json');
				    	
					}
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	    	$('#jfxxForm').form('load',selected);
	    	if(window.top.cacheArchive.cacheIdnum){
				$('#pnum').textbox('setValue',window.top.cacheArchive.cacheIdnum);
			}
	    	if(window.top.cacheArchive.cacheName){
				 $('#proxyName').textbox('setValue',window.top.cacheArchive.cacheName);
			}
	    	$('#pnum').textbox({events:{blur:function(){
	    			  $.post('../userMgInfoTrol/checkIsPnumExist',{pnum:$(this).val()},function(result){
	      				  $('#arNo').textbox('setValue',result.dpno);
	      				  $('#proxyName').textbox('setValue',result.name);
	      			  },'json');
	    	}}});
	    
	    } //loadEnd
	});
}
//删除缴费信息
function deleteJfxx(){
	var selections=$('#jfxxglGrid').datagrid('getSelections');
	if(selections.length>0){
		var ids=[];
		for(var i=0;i<selections.length;i++)
		{
			ids.push(selections[i].id);
		}
		$.ajax({
			url:'../archivesMoneyContr/deleteJf',
			method:'POST',
			data:{ids:ids},
			success:function(result){
				if(result==1){
					$.messager.alert('提示','删除成功','info');
				}else{
					$.messager.alert('提示',result);
				}
				$('#jfxxglGrid').datagrid('reload');
			}
			
		});
	}else{
		$.messager.alert('提示','请选择您要删除的缴费信息！','info');
	}
}

</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include> 

<div>
	<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
	    <option value="aa">档案号</option>     
	</select> 
	&nbsp;&nbsp;
	<input class="easyui-textbox" id="ar_no" data-options="iconCls:''" style="width:150px"> 
	&nbsp;&nbsp;
	<label>身份证号：</label> 
	<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
	&nbsp;&nbsp;
	<label>代理人姓名：</label>
	<input class="easyui-textbox" value="" name="searchName" id="searchName" >
    <label>缴费日期：</label>
	<input class="easyui-datebox"  name="searchSdate" id="searchSdate" data-options="required:false,showSeconds:false"/>
	<label>到</label>
	<input class="easyui-datebox"  name="searchEdate" id="searchEdate" data-options="required:false,showSeconds:false" />
	<a class="easyui-linkbutton" onclick="doSearch();" data-options="iconCls:'icon-search',plain:true">查询</a>
<!-- 	<form id="addJfFileForm" method="post" action="" enctype="multipart/form-data" >

	<div id="tb">
		<div id="zcpshdTool"  style="background-color:#FFFFFF;">
			<a onclick="exportFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">导出模板</a>
		        <a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
		        <input  onchange="importFucJf()" id="cjFile" name= "cjFile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入文件</a>
			<a onclick="addJfxx();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
			<a onclick="modifyJfxx();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a onclick="deleteJfxx();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<a onclick="doSearch(1);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
		</div>
	</div>
</form> -->
	<table id="jfxxglGrid"></table>  
</div>
<div id="jfxxglInfo"></div>
<div id="importInfo" align="center"></div>
<div id="jfxxglAdd" ></div>
</body>
</html>
