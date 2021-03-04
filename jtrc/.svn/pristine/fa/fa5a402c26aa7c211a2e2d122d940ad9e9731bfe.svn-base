<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<title>档案借阅管理</title>

<script type="text/javascript">
	$(function(){
   
     init();

	});
function init(){
	debugger
  $('#dajyglGrid').datagrid({    
     url:'../residenceGetoutInfoTrol/queryResidenceGetoutInfoList', 
     border:true,
	 pageSize:20,
	 pageList:[10,20,30,40],
	 striped: true,
	 collapsible:true,
	 height: wholeHeight,
	 toolbar: '#zcpshdTool',
	 sortName: '',
     sortOrder: 'desc',
	 remoteSort: false,    
	 pagination : true,
	 queryParams:{
			dept:"daNum",
			key:window.top.cacheArchive.cacheDpno
	 },
     columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
         {field:'d_date',title:'借阅日期',width : $(this).width() * 0.15,align:'center'},    
         {field:'isReturn',title:'是否归还',width : $(this).width() * 0.1,align:'center',
	         formatter: function(value,row,index){
	            var back_date = row.back_date;
	            if(null != back_date && "" != back_date){
		            return "是";
		        }else{
		        	return "否";
			    }
		     }   
         },    
         {field:'d_no',title:'档案号',width: $(this).width() * 0.1,align:'center'},
         {field:'d_content',title:'借阅材料内容',width: $(this).width() * 0.3,align:'center'},
         {field:'out_uid',title:'被借阅人',width: $(this).width() * 0.1,align:'center'},
         {field:'d_uid',title:'借阅人',width: $(this).width() * 0.1,align:'center'},
         {title:'操作',field:'uid12',width: $(this).width() * 0.15,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="javascript:view('+row.id+');" style="color: blue;" >查看</a>  <a href="javascript:edit('+row.id+');" style="color: blue;" >编辑</a>  <a href="javascript:back('+row.id+');" style="color: blue;" >归还</a>';
				}   
	     }
    ]],
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId='';//档案id
		cache.cacheDpno=rowData.d_no;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName='';//姓名
		cache.cacheSchool='';//毕业院校
		cache.cacheMajor='';//所学专业
		cache.cacheTel='';//联系电话
		setArchiveHead();
	},
	onLoadSuccess:function(data){
		$('#dajyglGrid').datagrid('checkAll');
	}    
});  
	var pager = $('#dajyglGrid').datagrid('getPager');
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





function dajyglFuc(){
	$('#dajyglInfo').dialog({
    title: '档案借出登记',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/dajyglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			    	 if($("#fm input[name='d_no']").val() == ""){
				         alert("请填写借阅档案编号");
				         return ;
				     }
					 else if($("#fm input[name='d_date']").val() == ""){
				    	 alert("请填写借阅日期");
				         return ;
					 }else if($("#fm input[name='t_name']").val() == ""){
				    	 alert("请填写调档人");
				         return ;
					 }
    	            var data=$('#fm').formSerialize();
    	            $.ajax({  
						type: "post",  
						cache: false,  
						async: false, 
						url: "../residenceGetoutInfoTrol/save",  
						data: data,  
						success: function (result) {  
						    if(result == 1){
							    alert("您已成功新增档案借阅信息！");
								//$.messager.alert('系统提示',"您已成功修改业务信息！");
								//$('#ywEditInfo').dialog('close');
								window.location.href = window.location.href;
								//$('#ywGrid').datagrid('reload');  
							}else{
								$.messager.alert('系统提示',result);
							}
						}  
					});  
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#dajyglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    	if(window.top.cacheArchive.cacheDpno){
    		$('#d_no').textbox('setValue',window.top.cacheArchive.cacheDpno);
    	}
    } //loadEnd
    

});

}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

function view(id){
	var rows = $("#dajyglGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
	$('#dajyglView').dialog({
	    title: '查看档案借出记录',
	    width: 950,
	    height: 450,
	    closed: false,
	    cache: false,
	    href: '../daxxgl/dajyglView.jsp',
	    modal: true,
	    buttons:[{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#dajyglView').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	       $("#fmView").form("clear"); 
		   $("#fmView").form("load",row);
	    } 
	});
}


function edit(id){
    var rows = $("#dajyglGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
    $('#dajyglEdit').dialog({
        title: '编辑档案借出记录',
        width: 950,
        height: 450,
        closed: false,
        cache: false,
        href: '../daxxgl/dajyglEdit.jsp',
        modal: true,
        buttons:[ {
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                         
                       var data=$('#fmEdit').formSerialize();
                       $.ajax({  
                            type: "post",  
                            cache: false,  
                            async: false, 
                            url: "../residenceGetoutInfoTrol/update",  
                            data: data,  
                            success: function (result) {  
                                if(result == 1){
                                    alert("您已成编辑档案！");
                                    //$.messager.alert('系统提示',"您已成功修改业务信息！");
                                    //$('#ywEditInfo').dialog('close');
                                    window.location.href = window.location.href;
                                    //$('#ywGrid').datagrid('reload');  
                                }else{
                                    $.messager.alert('系统提示',result);
                                }
                            }  
                        }); 
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#dajyglEdit').dialog('close');
                    }
                }],
        iconCls: 'icon-save',
        onLoad: function () {
           $("#fmEdit").form("clear"); 
           $("#fmEdit").form("load",row);
        } 
    });
}

function back(id){
	var rows = $("#dajyglGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
    if(null != row.back_date && "" != row.back_date){
        alert("该档案已归还");
        return;
    }
	$('#dajyglView').dialog({
	    title: '档案归还',
	    width: 950,
	    height: 450,
	    closed: false,
	    cache: false,
	    href: '../daxxgl/dajyglBack.jsp',
	    modal: true,
	    buttons:[
	     	    {
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
		     	    	if($("#back_date").datebox('getValue') == ""){
					         alert("请填写归还日期");
					         return ;
					     }else if($("#fmBack input[name='s_uid']").val() == ""){
					    	 alert("请填写签收人");
					         return ;
						 }
	     	    	   var data=$('#fmBack').formSerialize();
			           $.ajax({  
							type: "post",  
							cache: false,  
							async: false, 
							url: "../residenceGetoutInfoTrol/update",  
							data: data,  
							success: function (result) {  
							    if(result == 1){
								    alert("您已成功归还档案！");
									//$.messager.alert('系统提示',"您已成功修改业务信息！");
									//$('#ywEditInfo').dialog('close');
									//window.location.href = window.location.href;
									//$('#ywGrid').datagrid('reload');  
									 query();
									 $('#dajyglView').dialog('close');
								}else{
									$.messager.alert('系统提示',result);
								}
							}  
						}); 
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#dajyglView').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
	       $("#fmBack").form("clear"); 
		   $("#fmBack").form("load",row);
	    } 
	});
}

function query(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var startTime = $("#startTime").datetimebox("getValue");
	var isBack = $("#isBack").combobox("getValue");
	var endTime = $("#endTime").datetimebox("getValue");
	$("#dajyglGrid").datagrid("load",{
		dept:dept,
		key:key,
		startTime:startTime,
		isBack:isBack,
		endTime:endTime
	});
}


/*导入党员信息*/
function fileImport(type){
	$('#dyImportInfo').dialog({
    title: '选择文件',
    width: 350,
    height: 150,
    
    closed: false,
    cache: false,
    href: '../daxxgl/fileimport.jsp',
    modal: true,
     buttons:[{
			text:'上传',
			iconCls:'icon-ok',
			handler:function(){
    	 		uploadExcel(type);
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

var dataFlag;
var tipMsg;
function uploadExcel(type){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
        var url = "<%=request.getContextPath()%>/residenceGetoutInfoTrol/importExcel?type="+type;   
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
 				            tipMsg = resObj.cause; 
		            		$('#dyImportInfo').dialog('close');
		            		showImportdyFuc(resObj.rows,type); 
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

/*展示导入的党员信息*/
function showImportdyFuc(dates,type){

	var title = "档案信息导入";
	var columns = [[    
	            			{field:'dNo',title:'借阅档案编号',width: $(this).width() *0.1 ,align:'center'},
	            			{field:'dContent',title:'借阅材料内容',width: $(this).width() *0.1,align:'center'},
	            			{field:'dUid',title:'借阅人',width: $(this).width() *0.1,align:'center'},
	            			{field:'outUid',title:'被借阅人',width: $(this).width() *0.1,align:'center'},
	            			{field:'dDate',title:'借阅日期',width: $(this).width() *0.1,align:'center'},
	            			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
	                    ]]    ;
	$('#showImportDyInfo').dialog({
    title: title,
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../daxxgl/dyxxImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			       if("in" == type){
				       saveDyIn(dates);
				   }else if("out" == type){
					   saveDyOut(dates);
				   }else{
					   saveDy(dates);
				   }
				 //$('#showImportDyInfo').dialog('close');
				}
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


//党员保存
function saveDy(dates){
	if(dates==undefined){
		$.messager.alert('提示','不能保存空数据！','info');
		return;
   }
   if(dataFlag != true){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
   if(tipMsg != "" && null != tipMsg){
	   if(confirm(tipMsg + "!确认覆盖更新吗？")){
		   $.blockUI();
		    $.ajax({
		         url: "../residenceGetoutInfoTrol/saveDy",
		         type: "POST",
		         contentType : "application/json;charset=utf-8", 
		         data: JSON.stringify(dates),
		         async: true,
		         success: function(data){
			         $.unblockUI();
			         alert(data);
			         $('#showImportDyInfo').dialog('close');
			         query();
		         },
		         error: function(data){
		             $.unblockUI();
		             alert(data);
		         }
		    });
	   }else{
		   return ;
	   }
   }else{
	   $.blockUI();
	    $.ajax({
	         url: "../residenceGetoutInfoTrol/saveDy",
	         type: "POST",
	         contentType : "application/json;charset=utf-8", 
	         data: JSON.stringify(dates),
	         async: true,
	         success: function(data){
		         $.unblockUI();
		         alert(data);
		         $('#showImportDyInfo').dialog('close');
		         query();
	         },
	         error: function(data){
	             $.unblockUI();
	             alert(data);
	         }
	    });
   }
}



</script>


<body style="margin: 1px;">
 <jsp:include page="/system/archiveHead.jsp"></jsp:include>

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="dajyglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">档案借出</a>
		<a onclick="fileImport('dy')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导入档案信息</a>
		   		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>

</div>
<div>
<select id="dept" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" data-options="iconCls:''" id="key" style="width:150px"> 
&nbsp;&nbsp;
借出时间
<input class="easyui-datebox" id="startTime" name="startTime" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
到
<input class="easyui-datebox"  id="endTime" name="endTime" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;&nbsp;
<select id="isBack" class="easyui-combobox" name="isBack" style="width:100px;">   
    <option value="">是否归还</option>  
    <option value="1">是</option>  
    <option value="0">否</option>        
</select> 
&nbsp;&nbsp;
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="dajyglGrid"></table>  
</div>
<div id="dajyglInfo"></div>
<div id="dajyglView"></div>
<div id="dajyglEdit"></div>
<div id="dyImportInfo" align="center"></div>
<div id="showImportDyInfo" align="center"></div>
</body>
</html>
