<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报考单位管理</title>

<script type="text/javascript">
var place_id;
function getByteLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
         var a = val.charAt(i);
         if (a.match(/[^\x00-\xff]/ig) != null) 
        {
            len += 2;
        }
        else
        {
            len += 1;
        }
    }
    return len;
}
$(function(){
	$('#bgActivityInfo').datagrid({    
	    url:'../bgActivityInfo/list', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		singleSelect: true,
		striped: true,
		collapsible:true,
		//fitColumns:true,
		height: wholeHeight,
		pagination:true,
		toolbar: '#bkdwTool',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,
		onClickRow:function(value,rec){
			$('#bkdwglGrid').datagrid('load',{
				value:$('#selectEnterprise').textbox('getValue'),
				activityId:rec.id
			});
		},
	    columns:[[
	         {field:'id',title:'报名活动ID',checkbox:true,align:'center'},
	        {field:'pno',title:'报名活动编码',width : '120',align:'center'},    
	        {field:'pname',title:'报名活动名称',align:'center'} 

	    ]] 
	});  
	var bgActivityInfoPager = $('#bgActivityInfo').datagrid('getPager');
	bgActivityInfoPager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
   $('#bkdwglGrid').datagrid({
	    url:'../bgActivityEnterpriseInfo/listEnterprise', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		//fitColumns:true,
		toolbar: '#bkdwTool',
		pagination:true,
		sortName: '',
		sortOrder: 'desc',
		singleSelect: true,
		remoteSort: false,    
	    columns:[[
	        {field:'id',title:'选择',checkbox:true,align:'center'},
	        {field:'pno',title:'单位编码',width : $(this).width() * 0.15,align:'center'},    
	        {field:'c_code',title:'组织机构代码',width : $(this).width() * 0.15,align:'center'},
	        {field:'enterprise_name',title:'单位名称',width : $(this).width() * 0.2,align:'center'},
	        {
	        	title:'操作',field:'uid',width:$(this).width() * 0.2,align:'center',
    		    formatter: function(value,row,index){
                   var id=row.id;
		           return '<a href="javascript:bkgwUpdate(\''+id+'\')" style="color: blue;">编辑岗位</a> <a href="javascript:bkdwglDel(\''+id+'\')" style="color: blue;">删除单位</a>';
		        }   
		    }

	    ]]
	});  
	var pager = $('#bkdwglGrid').datagrid('getPager');
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
});

//删除报考单位
function bkdwglDel(id){
	if(id != null && id != undefined){
		$.messager.confirm('确定删除报考单位','您确定要删除该报考单位？',function(flag){
			if(flag){
				$.ajax({
					url:'../bgActivityEnterpriseInfo/delete',
					type:'post',
					data:{id:id},
					success:function(result){
						if(result=='1' || result==1){
							$('#bkdwglGrid').datagrid('reload');
							$.messager.alert('系统提示','删除该报考单位成功！');
						}else{
							$.messager.alert('系统提示',result);
						}
					}
				});
			}
		});
	}
}

// 查询组织机构或者单位
function selectSubmit(){
	var row = $('#bgActivityInfo').datagrid('getSelected');
	if (row){
		if(getByteLen($('#selectEnterprise').textbox('getValue')) > 40) {
			$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入!');
		} else {
			$('#bkdwglGrid').datagrid('load',{
				value:$('#selectEnterprise').textbox('getValue'),
				activityId:row.id
			});
		}
		
	}else{
		$.messager.alert('系统提示','请选中您要查询的活动!');
	}
	
}

// 重置查询
function resetSubmit(){
	$('#selectEnterprise').textbox('setValue','');
}

// 新增报考单位查询组织代码或者单位
function selectAddEnterprise(){
	if(getByteLen($('#selectAddEnterprise').textbox('getValue')) > 40) {
		$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入!');
	} else {
		$('#enterpriseGrid').datagrid('load',{
			value:$('#selectAddEnterprise').textbox('getValue'),
			activityId:'1'
		});
	}
	
}

function getSelectRowId(){
	var rows = $('#bkdwglGrid').datagrid('getSelections');  
	var ids = "";
	if (rows.length>0) {  
		for(var i=0; i<rows.length; i++){
			if(ids == ""){
    			ids = rows[i].id;
    		}else{
    			ids += "," + rows[i].id;
        	}
		}
	}
	return ids;
}

function bkdwglFuc(){
	var row = $('#bgActivityInfo').datagrid('getSelected');
	if (row){
		$('#bkdwglInfo').dialog({
		    title: '报考单位新增',
		    width: 680,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../sydwzpgl/bkdwglAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
							var enterpriseRows = $('#enterpriseGrid').datagrid('getSelections');
							var ids = "";
							if (enterpriseRows.length >0){
								for(var i=0; i<enterpriseRows.length; i++){
									if(!enterpriseRows[i].pno){
										$.messager.alert("系统提示","选择的企业中有未填写单位代码的数据，请先在【企业管理】中完善信息！");
										return ;
									}
									if(ids == ""){
						    			ids = enterpriseRows[i].enterprise_id;
						    		}else{
						    			ids += "," + enterpriseRows[i].enterprise_id;
						        	}
								}
								$.ajax({
									url:'../bgActivityEnterpriseInfo/add',
									type:'post',
									data:{enterpriseIds:ids,activityId:row.id},
									success:function(result){
										if(result==1 || result=='1'){
											$('#bkdwglGrid').datagrid('reload');
											$.messager.alert('系统提示','保存该报考单位成功！');
										}else{
											$.messager.alert('系统提示',result);
										}
									}
								});
							}else{
								alert("未选中行");
							}
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
							$('#bkdwglInfo').dialog('close');
							selectSubmit();
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	$('#bkdw_activity_pno').html(row.pno);
		    	$('#bkdw_activity_pname').html(row.pname);
		    	$('#enterpriseGrid').datagrid({
		    	    url:'../bgActivityEnterpriseInfo/listOtherEnterprise', 
		    	    border:true,
		    		pageSize:10,
		    		pageList:[10,20,30,40],
		    		striped: true,
		    		collapsible:true,
		    		queryParams: { 'activityId': row.id },
		    		//fitColumns:true,
		    		toolbar: '#bkdwTool',
		    		pagination:true,
		    		sortName: '',
		    		sortOrder: 'desc',
		    		remoteSort: false,    
		    	    columns:[[
		    	         {field:'enterprise_id',title:'报考单位ID',checkbox:true,align:'center'},
		    	        {field:'pno',title:'单位代码',width : '120',align:'center'},
		    	        {field:'c_code',title:'组织机构代码',width : '230',align:'center'},
		    	        {field:'enterprise_name',title:'单位名称',width : '230',align:'center'}

		    	    ]]    
		    	});  
		    	var page = $('#enterpriseGrid').datagrid('getPager');
		    	page.pagination({
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
		});
	}else{
		alert("未选中报名活动");
	}
}


//对报岗位位进行修改
function bkgwUpdate(id){
	var row = $('#bgActivityInfo').datagrid('getSelected');
	if(row){
		/* var timestamp=new Date();
		var s =row.startDate+"";
		if(timestamp.getTime()>s){
			$.messager.alert("系统提示","当前活动已经开始报名缴费，无法编辑岗位！");
			return ;
		} */
		$('#bkgw_search_activityEnterpriseId').val(id);
		$('#bkgwglInfo').dialog({
		    title: '报考岗位编辑',
		    width: 820,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../sydwzpgl/bkgwAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'添加',
						iconCls:'icon-add',
						id : 'bkdwAddButton',
						disabled : 'disabled',
						handler:function(){
							var result = $("#fm_gw").form("validate");
							
							if(result){
								/**
								$.ajax({
									url:'../bgEnterprisePlaceInfo/add',
							   	    dataType: 'JSON',
							   	 	data:{"aei":id,
									 "pid":place_id,
									 "num":$('#recruitmentNum').textbox('getValue'),
									 "age":$('#ageRange').textbox('getValue'),
									 "gender":$('#genderRange').combobox('getValue'),
									 "nation":$('#nationRange').combobox('getValue'),
									 "zzmm":$('#politicalStatusRange').combobox('getValue'),
									 "whcd":$('#educationRange').combobox('getValue'),
									 "school":$('#ageRange').textbox('getValue'),
									 "xllxyq":$('#educationTypeRange').combobox('getValue'),
									 "zyyq":$('#ageRange').textbox('getValue'),
									 "sjlx":$('#paperStyle').combobox('getValue'),
									 "ksmc":$('#examinationName').textbox('getValue'),
									 "ksdd":$('#examinationPlace').textbox('getValue'),
									 "kskm":$('#examinationSubject').textbox('getValue'),
									 "sfkk":$('#isStart').combobox('getValue'),
									 "qtyq":$('#othersRange').textbox('getValue'),
									 "bz":$('#remark').textbox('getValue')
									 
							   	 	},
							   	    type: "POST",   //请求方式
							   	    success: function(result) {
							   	    	if(result=='1' || result==1){
											 $.messager.alert('系统提示','添加报考岗位成功！');
											 $('#kxgwxqGrid').datagrid('reload');
											 $('#yxgwxqGrid').datagrid('reload');
											 $('#bkdwAddButton').linkbutton('disable');
										 }else{
											 $.messager.alert('系统提示','添加报考岗位失败！');
										 }
							   	    },
							   	    error: function() {
							   	        alert('服务器请求异常');
							   	    	//请求出错处理
							   	    }
							   	});	
								**/
								if($('#recruitmentNum').textbox('getValue').length > 8) {
									 $.messager.alert('系统提示','招考人数最多输入8个字符,请重新输入！');
								} else if(getByteLen($('#ageRange').textbox('getValue')) > 40) {
									 $.messager.alert('系统提示','年龄要求最多输入20个汉字(40个字符),请重新输入！');
								} else if(getByteLen($('#examinationName').textbox('getValue')) > 100) {
									 $.messager.alert('系统提示','考试名称最多输入100个汉字(200个字符),请重新输入！');
								} else if(getByteLen($('#examinationPlace').textbox('getValue')) > 100) {
									 $.messager.alert('系统提示','考试地点最多输入100个汉字(200个字符),请重新输入！');
								} else if(getByteLen($('#examinationSubject').textbox('getValue')) > 40) {
									 $.messager.alert('系统提示','考试科目最多输入20个汉字(40个字符),请重新输入！');
								} else if(getByteLen($('#othersRange').textbox('getValue')) > 400) {
									 $.messager.alert('系统提示','其他要求最多输入200个汉字(400个字符),请重新输入！');
								} else if(getByteLen($('#remark').textbox('getValue')) > 400) {
									 $.messager.alert('系统提示','备注最多输入200个汉字(400个字符),请重新输入！');
								} else {
									$("#fm_gw").form("submit",{
									     url:'../bgEnterprisePlaceInfo/add?aei='+id+'&pid='+place_id,
										 type:'post',
										 success:function(result){
											 if(result==1){
												 $.messager.alert('系统提示','添加报考岗位成功！');
												 $('#kxgwxqGrid').datagrid('reload');
												 $('#yxgwxqGrid').datagrid('reload');
												 $('#bkdwAddButton').linkbutton('disable');
											 }else{
												 $.messager.alert('系统提示','添加报考岗位失败！');
											 }
										 }
								    });
								}
								
								
							}
							
						}
					},{
						text:'保存',
						iconCls:'icon-ok',
						id : 'bkdwSaveButton',
						disabled : 'disabled',
						handler:function(){
							var result = $("#fm_gw").form("validate");
							if(result){
								if($('#recruitmentNum').textbox('getValue').length > 8) {
									 $.messager.alert('系统提示','招考人数最多输入8个字符,请重新输入！');
								} else if(getByteLen($('#ageRange').textbox('getValue')) > 40) {
									 $.messager.alert('系统提示','年龄要求最多输入20个汉字(40个字符),请重新输入！');
								} else if(getByteLen($('#examinationName').textbox('getValue')) > 40) {
									 $.messager.alert('系统提示','考试名称最多输入20个汉字(40个字符),请重新输入！');
								} else if(getByteLen($('#examinationPlace').textbox('getValue')) > 100) {
									 $.messager.alert('系统提示','考试地点最多输入100个汉字(200个字符),请重新输入！');
								} else if(getByteLen($('#examinationSubject').textbox('getValue')) > 40) {
									 $.messager.alert('系统提示','考试科目最多输入20个汉字(40个字符),请重新输入！');
								} else if(getByteLen($('#othersRange').textbox('getValue')) > 400) {
									 $.messager.alert('系统提示','其他要求最多输入200个汉字(400个字符),请重新输入！');
								} else if(getByteLen($('#remark').textbox('getValue')) > 400) {
									 $.messager.alert('系统提示','备注最多输入200个汉字(400个字符),请重新输入！');
								} else {
									$("#fm_gw").form("submit",{
									     url:'../bgEnterprisePlaceInfo/edit',
										 type:'post',
										 success:function(result){
											 if(result=='1' || result==1){
												 $.messager.alert('系统提示','编辑报考岗位成功！');
												 $('#kxgwxqGrid').datagrid('reload');
												 $('#yxgwxqGrid').datagrid('reload');
												 
											 }else{
												 $.messager.alert('系统提示','编辑报考岗位失败！');
											 }
										 }
								    });
								}
								
							}
							
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
							$('#bkgwglInfo').dialog('close');
							selectSubmit();
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {debugger;
		     	acId = $('#bgActivityInfo').datagrid('getSelected').id;
		    	$('#bkgw_activity_pno').html(row.pno);
		    	$('#bkgw_activity_pname').html(row.pname);
		    	$('#yxgwxqGrid').datagrid({
		    	    url:'../bgEnterprisePlaceInfo/selectedPlaceList', 
		    	    border:true,
		    		pageSize:10,
		    		singleSelect: true,
		    		pageList:[10,20,30,40],
		    		striped: true,
		    		collapsible:true,
		    		queryParams: { 'activity_enterprise_id': id,'acId':acId },
		    		//fitColumns:true,
		    		toolbar: '#bkdwTool',
		    		pagination:true,
		    		sortName: '',
		    		sortOrder: 'desc',
		    		remoteSort: false,
		    		onClickRow:function(value,rec){
		    			$('#bkdwAddButton').linkbutton('disable');
		    			$('#bkdwSaveButton').linkbutton('enable');
		    			$('#bkgw_activityEnterpriseId').val(id);
		    			$('#bkgw_placeId').val(rec.id);
		    			$.ajax({
							url:'../bgEnterprisePlaceInfo/query',
							type:'post',
							dataType:'json',
							data:{id:rec.eid},
							success:function(result){
								$('#fm_gw').form('load',result);
							}
						});
		    		},
		    	    columns:[[
		    	         {field:'eid',title:'ID',hidden:true,align:'center'},
		    	         {field:'pno',title:'岗位代码',width : '120',align:'center'},
			    	     {field:'name',title:'岗位名称',width : '200',align:'center'}
		    	    ]]    
		    	});  
		    	var yxgwxqGridPage = $('#yxgwxqGrid').datagrid('getPager');
		    	yxgwxqGridPage.pagination({
		    		beforePageText : '第',// 页数文本框前显示的汉字
		    		afterPageText : '/ {pages} 页',
		    		displayMsg : '',
		    		buttons : [ {
		    			iconCls : 'icon-excel',
		    			handler : function() {
		    			}
		    		} ]
		    	});
		    	
		    	$('#kxgwxqGrid').datagrid({
		    	    url:'../bgEnterprisePlaceInfo/unSelectedPlaceList', 
		    	    border:true,
		    		pageSize:10,
		    		pageList:[10,20,30,40],
		    		striped: true,
		    		singleSelect: true,
		    		collapsible:true,
		    		queryParams: { 'activity_enterprise_id': id,'acId':acId},
		    		//fitColumns:true,
		    		toolbar: '#bkdwTool',
		    		pagination:true,
		    		sortName: '',
		    		sortOrder: 'desc',
		    		remoteSort: false,
		    		onClickRow:function(value,rec){
		    			place_id = rec.id;
		    			$('#bkgw_activityEnterpriseId').val(id);
		    			$('#bkgw_placeId').val(rec.id);
		    			$('#bkgw_id').val(null);
		    			$('#bkdwAddButton').linkbutton('enable');
		    			$('#bkdwSaveButton').linkbutton('disable');
		    			$('#fm_gw').form('reset');
		    		},
		    	    columns:[[
		    	         {field:'eid',title:'报考单位ID',hidden:true,align:'center'},
		    	         {field:'pno',title:'岗位代码',width : '120',align:'center'},
			    	     {field:'name',title:'岗位名称',width : '200',align:'center'}

		    	    ]]
		    	});  
		    	var kxgwxqGridPage = $('#kxgwxqGrid').datagrid('getPager');
		    	kxgwxqGridPage.pagination({
		    		beforePageText : '第',// 页数文本框前显示的汉字
		    		afterPageText : '/ {pages} 页',
		    		displayMsg : '',
		    		buttons : [ {
		    			iconCls : 'icon-excel',
		    			handler : function() {
		    			}
		    		} ]
		    	});
		    	$('#bkdwAddButton').linkbutton('disable');
    			$('#bkdwSaveButton').linkbutton('disable');
		    } 
		});
	}
}

function delGW(){
	var row = $('#yxgwxqGrid').datagrid('getSelected');
	if (row){
		$.messager.confirm('确定无效企业','您确定要删除该岗位信息吗？',function(flag){
			if(flag){
				$.ajax({
					url:'../bgEnterprisePlaceInfo/del',
					type:'post',
					data:{id:row.eid},
					success:function(result){
						if(result=='1' || result==1){
							$.messager.alert('系统提示','删除该岗位信息成功！');
							$('#kxgwxqGrid').datagrid('reload');
							 $('#yxgwxqGrid').datagrid('reload');
						}else{
							$.messager.alert('系统提示',result);
						}
					}
				});
			}
		});
	}else{
		alert("未选中行");
	}
}

function selectGW(){
	if(getByteLen($('#selectGWtextbox').textbox('getValue')) > 40) {
		$.messager.alert('系统提示','查询最多输入20个汉字(40个字符),请重新输入!');
	} else {
		$('#kxgwxqGrid').datagrid('load',{
			value:$('#selectGWtextbox').textbox('getValue'),
			activity_enterprise_id:$('#bkgw_search_activityEnterpriseId').val(),
			acId:acId
		});
	}
	
}

</script>


<body style="margin: 1px;">
 <div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="padding:5px">
       <table>
	      <tr>
		     <td>组织机构代码或单位:</td>
			 <td><input id="selectEnterprise" name="selectEnterprise" class="easyui-textbox" /></td>
			 <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			 <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		  </tr>
	   </table>
   </div>
   
   <div data-options="region:'west',title:'活动列表',split:true,border:false" style="width:330px;">
   		<table id="bgActivityInfo"></table>
   </div>
   <div data-options="region:'center',title:'可报考单位列表',border:false" style="">
	   <div id="zcpshdTool"  style="background-color:#FFFFFF;">
	         <a onclick="bkdwglFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
	    </div>
	    <table id="bkdwglGrid" style="height: 90%"></table>
   </div>
 </div>

<div id="bkdwglInfo"></div>
<div id="bkgwglInfo"></div>

</body>
</html>
