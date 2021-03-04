<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报考活动列表管理</title>

<script type="text/javascript">
		var pno;
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
			/**
		    $("input",$("#cx_param").next("span")).blur(function(){
		    	if($('#cx_param').textbox('getValue') == '') {
		    		$('#cx_param').textbox('setValue',"请输入编码或者名称");
		    	}
		     });
			**/
			getFlownumber();
			
			init();
			
		});
		
		//init
		function init() {
			$('#bkhdlbglGrid').datagrid({    
			    url:'../bgActivityInfo/list?type=2', 
			    border:true,
				pageSize:10,
				pageList:[10,20,30,40],
				striped: true,
				collapsible:true,
				//fitColumns:true,
				height: wholeHeight,
				toolbar: '#bkhdlbTool',
				pagination:true,
				singleSelect: true,
				sortName: '',
				sortOrder: 'desc',
				remoteSort: false,    
			    columns:[[    
			        {field:'id',title:'选择',checkbox:true,align:'center'},
			        {field:'pno',title:'报考活动编码',width : $(this).width() * 0.3,align:'center'},    
			        {field:'pname',title:'报考活动名称',width : $(this).width() * 0.5,align:'center'},
			        {field:'remark',title:'前端可见',width : $(this).width() * 0.2,align:'center'}
			  
			    ]]    
			});  
				var pager = $('#bkhdlbglGrid').datagrid('getPager');
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

		//新增		
		function bkhdlbglFuc(){
			$('#bkhdlbglInfo').dialog({
		    title: '报考活动新增',
		    width: 500,
		    height: 425,
		    closed: false,
		    cache: false,
		    href: '../sydwzpgl/bkhdlbglAdd.jsp',
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
						$('#bkhdlbglInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	$('#pno').textbox('setValue',pno);
		    
		    } //loadEnd
		    
		
		});
		
		}
		
		//编辑
		function updateFuc(){
			var row =$('#bkhdlbglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
			$('#bkhdlbglInfo').dialog({
		    title: '报考活动修改',
		    width: 500,
		    height: 425,
		    closed: false,
		    cache: false,
		    href: '../sydwzpgl/bkhdlbglAdd.jsp',
		    modal: true,
		     buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
						    var result=$('#fm').form('validate');
							if(result){
								$.messager.confirm("确认修改活动信息","您确定修改报考活动信息?",function(flag){
								if(flag){
									if($("#pname").val().length > 30){
										$.messager.alert('提示','活动名称长度不可超过30!');
										return false;
									}
									$('#fm').form('submit',{
									url:'../bgActivityInfo/edit',
									type:'post',
									success:function(data){
										if(data=='1' || data == 1){
										$('#bkhdlbglInfo').dialog('close');
						                $.messager.alert('系统提示','修改报名活动信息成功！');
										$('#bkhdlbglGrid').datagrid('reload');
										}else{
											$.messager.alert('系统提示',data);
										}
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
						$('#bkhdlbglInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
				$('#pno').textbox('setValue',row.pno);
				$('#pname').textbox('setValue',row.pname);
				$('#remark').textbox('setValue',row.remark);
		    }  
		});
			}else{
				$.messager.alert('系统提示','请选择您要修改的报名活动！');
			}
		}
		
		//删除
		function delFun(){
			var row=$('#bkhdlbglGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
				$.messager.confirm('确定删除报名活动','您确定要删除该报名活动？',function(flag){
					if(flag){
						$.ajax({
							url:'../bgActivityInfo/delete',
							type:'post',
							data:{ids:row.id},
							success:function(result){
								if(result=='1' || result == 1){
									$('#bkhdlbglGrid').datagrid('reload');
									$.messager.alert('系统提示','删除该报名活动成功！');
								}else{
									$.messager.alert('系统提示',result);
								}
							}
						});
					}
				});
			}else{
				$.messager.alert('提示','请选择您要删除的报名活动！');
			}
		}
		
		//查询
		function searchActivity(){
			
			if(getByteLen($('#cx_param').textbox('getValue')) > 100) {
				$.messager.alert('提示','最多输入50个汉字(100个字符),请重新输入！');
			} else {
				$('#bkhdlbglGrid').datagrid('load',{ 
					pno : $('#cx_param').textbox('getValue'),
					pname : $('#cx_param').textbox('getValue')
				});
			}
			
		}

		//生成流水
		function getFlownumber(){
			
			$.ajax({
		        type: "GET",
		        url: "../bgActivityInfo/selectMaxPno",
		        dataType: "text",
		        success: function(data){
		        	pno = data;  
		       }
		    });
		}

		//保存
		function submitForm(){
				if($("#pname").val().length > 30){
					$.messager.alert('提示','活动名称长度不可超过30!');
					return false;
				}
				if($("#pname").val().length == 0){
					$.messager.alert('提示','请输入活动名称!');
					return false;
				}
			 //var param=$("#fm").serializeArray();
			 //param=JSON.stringify(param);
			 $("#fm").ajaxSubmit({ 
					url : basePath+'/bgActivityInfo/add',
					async : true,
					 data: {
		             'bgActivityInfo.pno': $('#pno').textbox('getValue'),
		             'bgActivityInfo.pname': $('#pname').textbox('getValue'),
		             'bgActivityInfo.remark': $('#remark').textbox('getValue')
		         	},
					success : function(data) {
						
						if(data == 1 || data == '1') {
							getFlownumber();
							$.messager.alert('提示','新建活动成功');
							 $('#bkhdlbglInfo').dialog('close');
							 $("#bkhdlbglGrid").datagrid("reload");
						} else {
							$.messager.alert('提示','新增活动失败，原因：'+data);
						}
					},
					error : function(data) {
						   
					}
			});
				
		}

</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="bkhdlbTool"  style="background-color:#FFFFFF;">
	<div>
	    <input type="text"  class="easyui-textbox"  
	        name="cx_param" id="cx_param" value="请输入活动编码或者名称"
	        size="30" onkeydown="if(event.keyCode==13) clearDefault()"/>
		<a href="javascript:searchActivity()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
		<a onclick="bkhdlbglFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="updateFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="delFun();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				
		
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="bkhdlbglGrid"></table>  
</div>
<div id="bkhdlbglInfo"></div>


</body>
</html>
