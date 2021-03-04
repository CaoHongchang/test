<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>业务分类管理</title>
</head>

<script type="text/javascript">
	$(function(){
	
	
	$("#a").hide();
   $("#b").hide();
   $("#c").hide();
  
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==254){
				$("#a").show();
			}else if(value==255){
				$("#b").show();
			}else if(value==256){
				$("#c").show();
			}
	});
    },"json");
    
	$('#ywflGrid').datagrid( {
			url : '../typeInfo/typeInfoList',
			border : true,
			pageSize : 20,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : wholeHeight,
			toolbar : '#zcpshdTool',
			pagination : true,
			sortName : '',
			sortOrder : 'desc',
			remoteSort : false,
			columns : [ [ {
				field : 'id',
				title : '选择',
				checkbox : true,
				align : 'center'
			}, {
				field : 'pno',
				title : '分类编码',
				width : fixWidth(0.3),
				align : 'center'
			}, {
				field : 'name',
				title : '分类名称',
				width : fixWidth(0.3),
				align : 'center'
			}, {
				   title:'操作',field:'uid',width:fixWidth(0.3),align:'center',
	    		   formatter: function(value,row,index){
                      var id=row.id;
			          return '<a href="javascript:upd(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:del(\''+id+'\')" style="color: blue;">删除</a>';
			       }   
			   }
			] ]
		});
		var pager = $('#ywflGrid').datagrid('getPager');
		pager.pagination( {
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

	function addType() {
		$('#ywflAddInfo').dialog( {
			title : '业务分类新增',
			width : 300,
			height : 200,
			closed : false,
			cache : false,
			href : '../rsdlgl/ywflAdd.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
				    if("" == $("#nameAdd").val() || "" == $("#pnoAdd").val()){
					    alert("分类名称和编码不为空!");
					}else{
					if($("#nameAdd").val().length>20){
					 alert("分类名称不成超过20字，请重新输入!");
					 return;
					}
						$.ajax({  
							type: "post",  
							cache: false,  
							url: "../typeInfo/save",  
							data: "name=" + $("#nameAdd").val() + "&pno=" + $("#pnoAdd").val(),  
							success: function (result) {  
							    if(result == 1){
									$.messager.alert('系统提示',"您已成功添加节点！");
									$('#ywflAddInfo').dialog('close');
									$('#ywflGrid').datagrid('reload');  
									window.parent.reloadYwTree();
								}else{
									$.messager.alert('系统提示',result);
								}
							}  
						});  
					} 
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#ywflAddInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
				$.ajax({  
					type: "post",  
					cache: false,  
					url: "../typeInfo/getNextPno",  
					data: "",  
					success: function (result) {  
					   $('#pnoAdd').textbox('setValue',result);
					}  
				});  
			}
		});
	}

	function del(id){
		var ids = "";
		if('' != id){
			ids = id;
		}else{
			ids = getSelectRowId();
	    }
	    if(ids != ""){
		    if(confirm("确定要删除此节点吗？")){
		    	$.ajax({  
					type: "post",  
					cache: false,  
					url: "../typeInfo/del",  
					data: "ids=" + ids,  
					success: function (result) {  
					    if(result == 1){
							$.messager.alert('系统提示',"您已成功删除节点！");
							$('#ywflGrid').datagrid('reload');  
							window.parent.reloadYwTree();
						}else{
							$.messager.alert('系统提示',result);
						}
					}  
				});  
			}
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
	}

	function upd(id){
		var rows = $("#ywflGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		//var row = $("#ywflGrid").datagrid("getSelected");  
		$('#ywflEditInfo').dialog( {
			title : '业务分类修改',
			width : 300,
			height : 200,
			closed : false,
			cache : false,
			href : '../rsdlgl/ywflEdit.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {debugger;
					if("" == $("#name_edit").textbox('getValue') || "" == $("#pno_edit").textbox('getValue')){
					    alert("分类名称和编码不为空!");
					}else{
						$.ajax({  
							type: "post",  
							cache: false,  
							url: "../typeInfo/update",  
							data: "name=" + $("#name_edit").val() + "&pno=" + $("#pno_edit").val() + "&id=" + $("#id").val(),  
							success: function (result) {  
							    if(result == 1){
									$.messager.alert('系统提示',"您已成功修改节点！");
									$('#ywflEditInfo').dialog('close');
									$('#ywflGrid').datagrid('reload');  
									window.parent.reloadYwTree();
								}else{
									$.messager.alert('系统提示',result);
								}
							}  
						});   
					}
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#ywflEditInfo').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			    $("#fm").form("clear"); 
				$("#fm").form("load",row);
				$("#name_edit").textbox("setValue",row.name);
				$("#pno_edit").textbox("setValue",row.pno);
			}
		});
	}

	function getSelectRowId(){
		var rows = $('#ywflGrid').datagrid('getSelections');  
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

	function query(){
		
		$('#ywflGrid').datagrid('load',{
			pno:$("#pno").textbox('getValue'),
			name:$("#name").textbox('getValue')
		});
	}
	
</script>


<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
	
	    <div data-options="region:'center',border:false" style="">
	         <div id="zcpshdTool"  style="background-color:#FFFFFF;">
	          <div id="c">
				   <label>业务编码：</label> <input type="text"  class="easyui-textbox"  
				        name="pno" id="pno" />&nbsp;&nbsp;
				   <label>分类名称：</label> <input type="text"  class="easyui-textbox"  
				        name="name" id="name" />
					<a href="#"  onclick="query()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
				</div>
				<a id="a" onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
				<a id="b" onclick="del('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
			</div>
			<div>
			   <table id="ywflGrid"></table>  
			</div>
	    </div>   
	</div>
	<div id="ywflAddInfo"></div>  
	<div id="ywflEditInfo"></div>  
</body>
</html>
