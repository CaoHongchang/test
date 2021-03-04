<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报考参数管理</title>

<script type="text/javascript">
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
		$("input",$("#cx_param").next("span")).focus(function(){
	    	$('#cx_param').textbox('setValue',"");
	     });
   $('#bkcsglGrid').datagrid({    
	url:'../bgActivityArgInfo/list', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#bkcslbTool',
	pagination:true,
	singleSelect: true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'',checkbox:true,align:'center'},
        {field:'activity_id',title:'序号',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'pno',title:'报考活动编码',width : $(this).width() * 0.07,align:'center'}, 
        {field:'pname',title:'报考活动名称',width : $(this).width() * 0.3,align:'center'},
        {field:'m',title:'报名费',width : $(this).width() * 0.1,align:'center'},
        {field:'start_date',title:'报名开始时间',width : $(this).width() * 0.15,align:'center'},
        {field:'end_date',title:'报名结束时间',width : $(this).width() * 0.15,align:'center'},
        
        {field:'sh_date',title:'审核开始时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'se_date',title:'审核结束',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'dy_date',title:'打印准考日期',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'de_date',title:'打印结束准考日期',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ss_start_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ss_end_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ck_start_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ck_end_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ks_start_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ks_end_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ms_start_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'ms_end_date',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        
        {field:'a_ks_users',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'b_ks_users',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'zkz_top',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'zkz_content',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        {field:'wh_status',title:'报名结束时间',width : $(this).width() * 0.01,align:'center',hidden:true},
        
        
        
        {title:'操作',field:'opt',width : 200,align:'center',
	    		formatter: function(value,row,index){
				 return " <a href='#' style='color: blue;' onclick='updateFuc("+index+");'>编辑</a>"
      				 +" <a href='#' style='color: blue;' onclick='editZkzFuc("+index+");' >准考证备注编辑<a>";
				}   
		}
  
    ]]    
});  
	var pager = $('#bkcsglGrid').datagrid('getPager');
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

	//编辑参数表单
	function updateFuc(index){
		var row =$('#bkcsglGrid').datagrid('getData').rows[index];
		/**
		if(row){
			$('#bkcsglInfo').dialog({
			    title: '活动修改',
			    width: 650,
			    height: 450,
			    closed: false,
			    cache: false,
			    href: '../sydwzpgl/bkcsglAdd.jsp?id='+row.id+'&pno='+row.pno+'&activity_id='+row.activity_id,
			    modal: true,
			    buttons:[{
							text:'保存',
							iconCls:'icon-ok',
							handler:function(){
								submitForm();
							}
						},{
							text:'关闭',
							iconCls:'icon-cancel',
							handler:function(){
								$('#bkcsglInfo').dialog('close');
							}
						}],
			    iconCls: 'icon-save',
			    onLoad: function () {
			    	$('#fm').form('load', row);
			   	}  
			    
			});
		}else{
			$.messager.alert('提示','请选择一行');
		}
		**/
		$('#bkcsglInfo').dialog({
	        title: '报名活动参数编辑',
	        width: 650,
	        height: 450,
	        closed: false,
	        cache: false,
	        href: '../sydwzpgl/bkcsglAdd.jsp',
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){
	            	var result=$('#fm2').form('validate');
					if(result){
						$.messager.confirm("确认修改活动参数信息","您确定修改报考活动参数信息?",function(flag){
						if(flag){
							if($('#m').val().length > 7) {
								 $.messager.alert('系统提示','报名费输入异常,请重新输入！');
								 return false;
							}
							if($('#aKsUsers').val().length > 8) {
								 $.messager.alert('系统提示','A教室人数输入异常,请重新输入！');
								 return false;
							}
							if($('#bKsUsers').val().length > 8) {
								 $.messager.alert('系统提示','B教室人数输入异常,请重新输入！');
								 return false;
							}
							if(getByteLen($('#zkzTop').val()) > 200) {
								 $.messager.alert('系统提示','准考证前缀最多输入100个汉字(200个字符),请重新输入！');
								 return false;
							}
							$('#fm2').form('submit',{
							url:'../bgActivityArgInfo/save',
							type:'post',
							date:{"startDate" : $('#startDate').datetimebox("getValue"),
								  "endDate" : $('#endDate').datetimebox("getValue"),
								  "shDate" : $('#shDate').datetimebox("getValue"),
								  "seDate" : $('#seDate').datetimebox("getValue"),
								  "dyDate" : $('#dyDate').datetimebox("getValue"),
								  "deDate" : $('#deDate').datetimebox("getValue"),
								  "ssStartDate" : $('#ssStartDate').datetimebox("getValue"),
								  "ssEndDate" : $('#ssEndDate').datetimebox("getValue"),
								  "ckStartDate" : $('#ckStartDate').datetimebox("getValue"),
								  "ckEndDate" : $('#ckEndDate').datetimebox("getValue"),
								  "ksStartDate" : $('#ksStartDate').datetimebox("getValue"),
								  "ksEndDate" : $('#ksEndDate').datetimebox("getValue"),
								  "msStartDate" : $('#msStartDate').datetimebox("getValue"),
								  "msEndDate" : $('#msEndDate').datetimebox("getValue"),
								  "aKsUsers" : $('#aKsUsers').val(),
								  "bKsUsers" : $('#bKsUsers').val(),
								  "zkzTop" : $('#zkzTop').val(),
								  "m" : $('#m').val(),
								  "pno" : $('#pno').val(),
								  "pname" : $('#pname').val(),
								  "activityId" : $('#activityId').val(),
								  "id" : $('#id').val()
							},
							success:function(data){
								
								if(data==1 || data=='1'){
								
				                $.messager.alert('系统提示','修改报名活动信息参数成功！');
				                $('#bkcsglInfo').dialog('close');
								$('#bkcsglGrid').datagrid('reload');
								}else{
									$.messager.alert('系统提示',data);
								}
							},
							error: function() {
						        //请求出错处理
						    	alert(22);
						    }
						    });
							}
						});
					}
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	                $('#bkcsglInfo').dialog('close');
	            }
	        }],
	        iconCls: 'icon-save',
		    onLoad: function () {
		    	$('#fm2').form('load', row);
				$('#pno').textbox('setValue',row.pno);
				$('#pname').textbox('setValue',row.pname);
				$('#startDate').datetimebox("setValue", row.start_date);
				$('#endDate').datetimebox("setValue", row.end_date);
				$('#shDate').datetimebox("setValue", row.sh_date);
				$('#seDate').datetimebox("setValue", row.se_date);
				$('#dyDate').datetimebox("setValue", row.dy_date);
				$('#deDate').datetimebox("setValue", row.de_date);
				$('#ssStartDate').datetimebox("setValue", row.ss_start_date);
				$('#ssEndDate').datetimebox("setValue", row.ss_end_date);
				$('#ckStartDate').datetimebox("setValue", row.ck_start_date);
				$('#ckEndDate').datetimebox("setValue", row.ck_end_date);
				$('#ksStartDate').datetimebox("setValue", row.ks_start_date);
				$('#ksEndDate').datetimebox("setValue", row.ks_end_date);
				$('#msStartDate').datetimebox("setValue", row.ms_start_date);
				$('#msEndDate').datetimebox("setValue", row.ms_end_date);
				
				$('#m').textbox('setValue',row.m);
				$('#aKsUsers').textbox('setValue',row.a_ks_users);
				$('#bKsUsers').textbox('setValue',row.b_ks_users);
				$('#zkzTop').textbox('setValue',row.zkz_top);
				$('#id').textbox('setValue',row.id);
				$('#activityId').textbox('setValue',row.activity_id);
		    } 
	    })
	    
	}
	
	//保存
	function submitForm(){
		var result=$('#fm').form('validate');
		if(result){
			$.messager.confirm("确认修改活动参数信息","您确定修改报考活动参数信息?",function(flag){
				if(flag){
					$("#fm").ajaxSubmit({ 
						url:'../bgActivityArgInfo/save',
						async : true,
						 data: {
			             'param': param
			         	},
						success : function(data) {
			         	var result = $.parseJSON(data);  
						if(result.flag == 0){
							 if($("#id").val()==""){
								 $.messager.alert('提示','新建活动成功');
							 }else{
								 $.messager.alert('提示','修改活动成功');
							 }
							 $('#bkcsglInfo').dialog('close');
							 $("#bkcsglGrid").datagrid("reload");
						}else{
							if($("#id").val()==""){
								$.messager.alert('提示','新增活动失败，原因：'+result.errorMsg);
							 }else{
								$.messager.alert('提示','修改活动失败，原因：'+result.errorMsg);
							 }
						}
					},
					error : function(data) {
						   
					}
				});
				}
			});
		}
		 var param=$("#fm").serializeArray();
		 param=JSON.stringify(param);
		 
			
	}
	
	//编辑准考证
	function editZkzFuc(index){
		var row =$('#bkcsglGrid').datagrid('getData').rows[index];
		$('#bkcsglInfo').dialog({
	        title: '准考证备注事项编辑',
	        width: 500,
	        height: 425,
	        closed: false,
	        cache: false,
	        href: '../sydwzpgl/zkzAdd.jsp?id='+row.id+'&activity_id='+row.activity_id,
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){
	            	var result=$('#fm').form('validate');
					if(result){
						$.messager.confirm("确认修改准考证信息","您确定修改准考证信息?",function(flag){
						if(flag){
							if(getByteLen($('#zkzContent').val()) > 2000) {
								$.messager.alert('系统提示','准考证信息最多输入1000个汉字(2000个字符),请重新输入');
								return false;
							}
							$('#fm').form('submit',{
							url:'../bgActivityArgInfo/saveZkz',
							type:'post',
							date:{
								  "zkzContent" : $('#zkzContent').val(),
								  "activityId" : $('#activityId').val(),
								  "id" : $('#id').val()
							},
							success:function(data){
								
								if(data=='1' || data == 1){
								$('#bkcsglInfo').dialog('close');
				                $.messager.alert('系统提示','修改准考证成功！');
								$('#bkcsglGrid').datagrid('reload');
								}else{
									$.messager.alert('系统提示',data);
								}
							},
							error: function() {
						        //请求出错处理
						    	alert(22);
						    }
						    });
							}
						});
					}
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	                $('#bkcsglInfo').dialog('close');
	            }
	        }],
	        iconCls: 'icon-save',
		    onLoad: function () {
				
		    } 
	    })
	}
	
	//查询
	function searchActivityArg(){
		if(getByteLen($('#cx_param').textbox('getValue')) > 100) {
			$.messager.alert('提示','最多输入50个汉字(100个字符),请重新输入！');
		} else {
			$('#bkcsglGrid').datagrid('load',{ 
				pno : $('#cx_param').textbox('getValue'),
				pname : $('#cx_param').textbox('getValue')
			});
		}
		
	}
	

</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="bkcslbTool"  style="background-color:#FFFFFF;">
		<div>
	    	<input type="text"  class="easyui-textbox"  
	        	name="cx_param" id="cx_param" value="请输入活动编码或者名称"
	        	size="30" onkeydown="if(event.keyCode==13) clearDefault()"/>
			<a href="javascript:searchActivityArg()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		</div>
				
		
	</div>

</div>
<div>

<table id="bkcsglGrid"></table>  
</div>
<div id="bkcsglInfo"></div>


</body>
</html>
