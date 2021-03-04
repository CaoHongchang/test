<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>专业技术职务任职资格证书备案</title>

<script type="text/javascript">
	$(function() {

		zyjsFun('');

	});

	function zyjsFun(param) {
		$('#zyjszwGrid')
				.datagrid(
						{
							url : basePath + "zyjs/getZyjsList",
							border : true,
							pageSize : 10,
							pageList : [ 10, 20, 30, 40 ],
							striped : true,
							collapsible : true,
							fitColumns : true,
							height : wholeHeight,
							width : '100%',
							//toolbar : '#zcpshdTool',
							pagination : true,
							sortName : '',
							queryParams : {
								param : param

							},
							sortOrder : 'desc',
							remoteSort : false,
							columns : [ [
									{
										field : '',
										title : '选择',
										checkbox : true,
										align : 'center'
									},
									{
										field : 'hdmc',
										title : '活动名称',
										width : fixWidth(0.4),
										align : 'center'
									},
									{
										field : 'xm',
										title : '姓名',
										width : fixWidth(0.2),
										align : 'center'
									},
									{
										field : 'jb',
										title : '级别',
										width : fixWidth(0.2),
										align : 'center'
									},
									{
										field : 'zgmc',
										title : '资格名称',
										width : fixWidth(0.2),
										align : 'center'
									},
									{
										field : 'zsbh',
										title : '证书编号',
										width : fixWidth(0.2),
										align : 'center'
									},
									{
										field : 'zy',
										title : '专业',
										width : fixWidth(0.2),
										align : 'center'
									},
									
									{
										field : 'spbm',
										title : '审批部门',
										width : fixWidth(0.2),
										align : 'center'
									},
									{
										field : 'spsj',
										title : '审批时间',
										width : fixWidth(0.3),
										align : 'center'
									},
									{
										title : '操作',
										field : 'id',
										width : fixWidth(0.15),
										align : 'center',
										formatter : function(value, row, index) {
											return '<a href="#" style="color: green;"  onclick="editzyFuc(\''+row.id+'\',\''+row.uid+'\',\''+row.hdid+'\',\''+row.hdbm+'\',\''+row.hdmc+'\')">修改</a> <a href="#" style="color:blue;"  onclick="delZyjsFuc(\''+ row.id + '\')">删除</a>';
										}
									}

							] ]
						});
		var pager = $('#zyjszwGrid').datagrid('getPager');
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


//删除
	function delZyjsFuc(id) {
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
    if (r){    
		if(id=='' || id==null){
		$.messager.alert('错误','用户id为空，操作失败！','error');
		return;
		}
		$.ajax({
                url: basePath+"zyjs/delZyFuc?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
                     $('#zyjszwGrid').datagrid('reload');
                      successMsg();
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   errorMsg();
                }
            });
       
    }    
});

	}

 function editzyFuc(id,uid,hdid,hdbm,hdmc){
    if(id==null||id==''){
    $.messager.alert('提示','选择的数据有误！');
    return;
    }

	$('#zyjjInfo').dialog({
    title: '专业技术职务任职资格证书修改',
   width : 650,
	height : 300,
    closed: false,
    cache: false,
    href: basePath+'/zcsbgl/zyjjzwrzAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				  saveFun();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zyjjInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    	$('#activityId').textbox('disable');
        $('#sfz').textbox('disable');
	 
	    $('#activityId').combobox('setValue', hdbm);
	    $('#activityName').textbox('setValue', hdmc);
			  $.ajax({
                url: basePath+"/zyjs/getZyMsg?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                async: true,
                success: function(data){
                if(data.flag ==true){
                    if(data.rows!=null&&data.rows!=''){
               	      //$("#zyform").form('load', eval(data.zy.rows));
               	      $('#sfz').combobox('setValue', data.rows.user.pnum);
               	      $('#name2').textbox('setValue', data.rows.user.name);
               	      $('#level').combobox('setValue', data.rows.level);
               	      $('#qualificationName').textbox('setValue', data.rows.qualificationName);
               	      $('#zNo').textbox('setValue', data.rows.zNo);
               	      $('#pzNo').textbox('setValue', data.rows.pzNo);
               	      $('#sPart').textbox('setValue', data.rows.sPart);
               	      $('#pro').textbox('setValue', data.rows.pro);
               	      $('#sDate').textbox('setValue', data.rows.sDate);
               	     
               	      $('#isGet').combobox('setValue', data.rows.isGet);
               	      $("#pnum").val(data.rows.user.pnum);
               	      $("#businessId").val(hdbm);
               	       $("#uid").val(uid);
               	       $("#activityId2").val(hdid);
                     }
				}
                },
                error: function(data){
                   errorMsg();

                }
            });
            
}
});

} 

	
	function addzsFuc() {
		$('#zyjjInfo').dialog({
			title : '专业技术职务任职资格证书新增',
			width : 650,
			height : 300,

			closed : false,
			cache : false,
			href : '../zcsbgl/zyjjzwrzAdd.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
                    saveFun();
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#zyjjInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
				//活动编号
				$('#activityId').combobox({
					valueField : 'id',
					textField : 'businessId',
					url : basePath + 'zyjs/hdbhList',
					onSelect : function(values) {
						$('#activityName').textbox('setValue', values.activityName);//活动名称
						$('#businessId').val(values.businessId);//活动编号
					//身份证
					$('#sfz').combobox({
						valueField : 'uid',//用户id
						textField : 'sfz',
						url : basePath + 'zyjs/sfzList?activityId='+values.id,
						onSelect : function(values) {
							$('#name2').textbox('setValue', values.xm);//姓名
							$('#name').val(values.xm);
							$('#pnum').val(values.sfz);//身份证号
							$('#uid').val(values.uid);//用户id
						}
					});
					}
				});
				
			

			}

		});

	}


function searchZyjjDiv(){
    $('#zyjjSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/zcsbgl/zyjjzwrzSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zyjjSearchInfo').dialog('close');
				}
			}]   
}); 
    
}	




 //导入文件
 function importZsFuc(){
	$("#addZyFileForm").ajaxSubmit({
		dataType:"html",
		url : basePath+"/zyjs/zsUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addZyFileForm')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			if(result.infoMsg!=''&&result.infoMsg!=null){
			     infoMsg=result.infoMsg;
			 }
			    //展示数据
				 addzydrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 


function addzydrFuc(dates){
	$('#yyglInfo').dialog({
    title: '证书导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: basePath+'/zcsbgl/zyjjzdrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   saveYg(dates);
				   $('#yyglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#yyglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#zydrGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        
        {field:'id',title:'序列',width: $(this).width() *0.15},
        {field:'pnum',title:'身份证',width: $(this).width() *0.15},
        {field:'level',title:'级别',width: $(this).width() *0.15},
        {field:'qualificationName',title:'资格名称',width: $(this).width() *0.15},
        {field:'zno',title:'证书编号',width: $(this).width() *0.15},
        {field:'pro',title:'专业',width: $(this).width() *0.15},
        {field:'spart',title:'审批部门',width: $(this).width() *0.15},
        {field:'sdate',title:'审批时间',width: $(this).width() *0.15},
        {field:'pzno',title:'批准文号',width: $(this).width() *0.15},
        {field:'isget',title:'是否领取',width: $(this).width() *0.15},
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}

        
        ]]    
     });  
	var pager = $('#zydrGrid').datagrid('getPager');
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
	
	$('#zydrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}

var dateFlag=null;
var infoMsg=null;
//导入保存
function saveYg(dates){debugger;
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m=""+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaYg2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaYg2(dates);
  infoMsg='';
  }

   
}

function savaYg2(dates){
  $.blockUI();
    $.ajax({
                url: basePath + "zyjs/addZyList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     $('#zyjszwGrid').datagrid('reload');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   errorMsg();

                }
            });
}



 function exportzyFuc(){
    window.location.href=basePath+"/zyjs/zyjsDownload";

} 
	
</script>
<body style="margin: 1px;">

<form id="addZyFileForm" method="post" action="<%=basePath%>/yggl/zsUpload" enctype="multipart/form-data" >
	<div id="tb">
		<div id="zcpshdTool" style="background-color:#FFFFFF;">
			<a onclick="addzsFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加证书</a>
			 <a onclick="searchZyjjDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a> 
			 <!-- <a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a> --> 
			 <a onclick="exportzyFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出模板</a> 
			  <a href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="importZsFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;font-size: 100px;right: 0;top: 5px;opacity: 0;">导入证书</a>

		</div>

	</div>
	</form>
	<div>
		<table id="zyjszwGrid"></table>
	</div>
	<div id="zyjjInfo"></div>
    <div id="zyjjSearchInfo"></div>
    <div id="yyglInfo"></div>
</body>
</html>
