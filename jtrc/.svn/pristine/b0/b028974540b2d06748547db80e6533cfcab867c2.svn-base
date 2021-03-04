<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>

<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">
<title>职称评审论文管理</title>

<script type="text/javascript">
var d=false;
var e= false;
$(function(){
   
  
	setListDate("");
	
});

function setListDate(param){


      $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	  
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==224){
				$("#a").show();
			}else if(value==225){
				$("#b").show();
			}else if(value==226){
				$("#c").show();
			}else if(value==227){
				 d=true;
			}else if(value==228){
				e=true;
			}
	});
    },"json");
	   $('#zcpslwglGrid').datagrid({    
		    url:basePath+'zcps/queryPaperList', 
		    border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			fitColumns:true,
			pagination: true, 
			height: wholeHeight,
			toolbar: '#zcpslwglTool',
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false, 
			queryParams: {
				param: param
			},
		    columns:[[    
		         {field:'id',title:'选择',checkbox:true,align:'center'},
		         {field:'u_name',title:'姓名',width :fixWidth(0.2),align:'center'},    
		         {field:'pnum',title:'身份证',width : fixWidth(0.3),align:'center'},
		         {field:'add_date',title:'论文提交时间',width : fixWidth(0.2),align:'center'},
		         {field:'s_type_id',title:'申报类别',width: fixWidth(0.2),align:'center',
			         formatter: function(value,row,index){
			         if(value==0)
			        	 return "职称评审";
			         else if(value==1)
			        	 return "职称确认";
			         else
			        	 return "其他";
			         }
		         },
		         {field:'s_level',title:'申报资格级别',width: fixWidth(0.2),align:'center',
		          formatter: function(value,row,index){
			         if(value==0)
			        	 return "初级";
			         else if(value==1)
			        	 return "中级";
		        	 else if(value==2)
		        		 return "副高级";
		        	 else if(value==3)
		        		 return "正高级";
			         else
			        	 return "其他";
			         }
		         
		         },
		         {field:'dissetation_name',title:'论文题目',width: fixWidth(0.2),align:'center'},
		         {field:'j_date',title:'刊出交流时间',width: fixWidth(0.2),align:'center'},
		         {field:'j_msg',title:'刊出交流情况',width: fixWidth(0.2),align:'center'},
		         {field:'is_send',title:'是否作为送审',width: fixWidth(0.2),align:'center',
		          formatter: function(value,row,index){
			         if(value==0)
			        	 return "否";
			         else if(value==1)
			        	 return "是"
			         }
		         },
		         {field:'papeid',title:'PAPEID',width: fixWidth(0.2),align:'center'},
		         {field:'pid',title:'PID',width: fixWidth(0.2),align:'center'},
		         {field:'f_num',title:'被分配次数',width:fixWidth(0.2),align:'center'},
		         {field:'activity_id',title:'活动',width : fixWidth(0.2),align:'center'},
		         {title:'操作',field:'op',width: fixWidth(0.2),align:'center',
				    		formatter: function(value,row,index){
				    		if(d&&e)
		 				      return '<a href="#" style="color: green;"  onclick="onEdit(\''+row.id+'\')">修改</a> <a href="#" style="color: blue;"  onclick="onDel('+index+')">删除</a>';
		 				      else if(!d&&e)
		 				      return ' <a href="#" style="color: blue;"  onclick="onDel('+index+')">删除</a>';
		 				      else if(d&&!e)
		 				        return '<a href="#" style="color: green;"  onclick="onEdit(\''+row.id+'\')">修改</a>';
						}   
				}
		    	]]    
			});  
	 
			
			
			var pager = $('#zcpslwglGrid').datagrid('getPager');
			$(pager).pagination({
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


function onEdit(id){
	$('#zcpslwglAddInfo').dialog({
    title: '职称评审论文修改',
    width: 800,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/zcpslwglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){debugger
					/* var editor = CKEDITOR.instances.aboutusDescription;
					editor.updateElement(); */
					
					
				/* 	$("#aboutusDescription").val(editor.getData());
					var r = $("#fm").form('enableValidation').form('validate');
					if(!r) {
						return false;
					}
					if($("#aboutusDescription").val==""){
						$.messager.alert('提示','论文不能为空');
					} */
					 var param=$("#fm").serializeArray();
					 param=JSON.stringify(param);
					
					
					var ison=false;
					if($("#is_send").val()=='on'){
					ison=true;
					}
					 if($("#is_send").attr("checked")==true||ison==true){
					   
						 param.is_send=1;
					 }else{
						 param.is_send=0;
					 }
					 var dissetation_name=$("#dissetation_name").textbox('getValue');
					 if(dissetation_name.length>30){
					 $.messager.alert('提示','论文题目不能超过30个字，请删减！');
					 return;
					 }
					 
					var j_msg=$("#j_msg").textbox('getValue');
                     if(j_msg.length>100){
					 $.messager.alert('提示','期刊交流长度不能超过100个字，请删减！');
					 return;
					 }
					 
					 var remark=$("#remark").val();
					 if(remark.length>150){
					 $.messager.alert('提示','备注长度不能超过150个字，请删减！');
					 return;
					 }
                    
                    var fjParam= $("#fjlbGrid").datagrid("getData");
					if(fjParam.rows.length>0){
					fjParam=JSON.stringify(fjParam.rows); 
					}else{
					fjParam=null;
					$.messager.alert('提示','论文列表不能为空');
					return;
					}
					                   
					 $("#fm").ajaxSubmit({ 
							url : basePath+'/zcps/savePaper',
							async : true,
							 data: {
				             'param': param,
				              'fjParam': fjParam
				         	},
							success : function(data) {
				         	var result = $.parseJSON(data);  
							if(result.flag == 0){
								 $.messager.alert('提示','修改论文成功');
								 $('#zcpslwglAddInfo').dialog('close');
								 $("#zcpslwglGrid").datagrid("reload");
							}else{
								$.messager.alert('提示','修改论文失败，原因：'+result.errorMsg);
							}
						},
						error : function(data) {
							   
						}
					});
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
					$('#zcpslwglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    	$.ajax({
       		url:basePath+"zcps/queryPaperById",
       	    dataType: 'JSON',
       	    data: {id:id},
       	    type: "POST",   //请求方式
       	    success: function(data) {
       			if(data.flag == true){
    		    	$('#fm').form('load', data.data);
    		    	if(data.data.is_send==1){
    		    		$("input[name='is_send']").attr("checked","checked");
    		    	}else{
    		    		$("input[name='is_send']").attr("checked","");
    		    	}
    	        } else{
    	        	 alert('论文信息错误：'+ data.cause);
    		    }
       	    }
    	});   
    	
    	$.ajax({
       		url:basePath+"zcps/queryPaperById",
       	    dataType: 'JSON',
       	    data: {id:id},
       	    type: "POST",   //请求方式
       	    success: function(data) {
       			if(data.flag == true){
       				fjListFuc(data.data.d_id);//附件列表
       			}
       	    }
    	});
    	  	
    }  
     
    
});


}
/**
 * 删除
 */
function onDel(index){
	var row;
	if(index){
		row = $("#zcpslwglGrid").datagrid('getRows')[index];
	}else{
		row = $("#zcpslwglGrid").datagrid("getSelected");
	}
	
				
	
	
	if(row){
	 		 $.messager.confirm('确定删除','确定删除吗？',function(flag){
				 if(flag){
		$.ajax({
	   		url:basePath+"zcps/delGet",
	   	    dataType: 'JSON',
	   	    data: {id:row.id},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   			if(data.flag == 0){
					 $.messager.alert('提示','删除成功');
					 $("#zcpslwglGrid").datagrid("reload");
		        } else{
		        	$.messager.alert('提示','删除失败，原因：'+result.errorMsg);
			    }
	   	    }
		});
		} });	
	
	}else{
		$.messager.alert('提示','请选择一行');
	}
}

//弹出查询框
function searchDiv(){
	    $('#searchInfo').dialog({    
	    title: '',    
	    width: 1100,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: '../zcsbgl/rwSearch.jsp',    
	    modal: true,
	      buttons:[{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#searchInfo').dialog('close');
					}
				}]   
	}); 
}
function exportExcel(){
	window.location.href= "<%=request.getContextPath()%>/zcps/exportPaper";
}
</script>


<body style="margin: 1px;">
 
<div id="tb">
   
	<div id="zcpslwglTool"  style="background-color:#FFFFFF;">
		<a id="a" onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出</a>
		<a id="b" onclick="onDel()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="c" href="javascript:searchDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		
	</div>

</div>
<div>
<table id="zcpslwglGrid"></table>  
</div>
<div id="zcpslwglAddInfo"></div>
<div id="searchInfo"></div>

</body>
</html>
