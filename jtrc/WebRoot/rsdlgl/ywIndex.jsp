<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>业务管理</title>
</head>

<script type="text/javascript">
var xg=false;
var sc=false;
	$(function(){
	
	$("#a").hide();
   $("#b").hide();
   $("#c").hide();
  
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==257){
				$("#a").show();
			}else if(value==258){
				$("#b").show();
			}else if(value==259){
				$("#c").show();
			}else if(value==260){
				xg=true;
			}else if(value==261){
				sc=true;
			}
	});
    },"json");
    
		loadList();
	});

	function loadList(){
		$('#ywGrid').datagrid( {
		    url : '../typeInfo/childTypeInfoList',
			border : true,
			pageSize : 20,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : wholeHeight,
			toolbar : '#zcpshdTool',
			sortName : '',
			sortOrder : 'desc',
			pagination : true,
			remoteSort : false,
			columns : [ [ {
				field : 'id',
				title : '选择',
				checkbox : true,
				align : 'center'
			}, {
				field : 'pno',
				title : '分类编码',
				width : fixWidth(0.25),
				align : 'center'
			}, {
				field : 'name',
				title : '业务名称',
				width : fixWidth(0.25),
				align : 'center'
			}, {
				field : 'typeName',
				title : '业务分类',
				width : fixWidth(0.20),
				align : 'center'
			}, {
				   title:'操作',field:'uid',width:fixWidth(0.25),align:'center',
	    		   formatter: function(value,row,index){
                      var id=row.id;
                      var childId=row.childId;
                      
                      if(xg&&sc)
			          return '<a href="javascript:upd(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:delList(\''+id+'\',\''+childId+'\')" style="color: blue;">删除</a>';
			          else if(!xg&&sc)
			                return ' <a href="javascript:delList(\''+id+'\',\''+childId+'\')" style="color: blue;">删除</a>';
			                 else if(xg&&!sc)
			                return '<a href="javascript:upd(\''+id+'\')" style="color: blue;">修改</a> ';
			       }   
			   }
			] ]
		});
		var pager = $('#ywGrid').datagrid('getPager');
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
	}

	function addYw() {
		$('#ywAddInfo').dialog( {
			title : '业务新增',
			 width: 750,
             height: 350,
			closed : false,
			cache : false,
			href : '../rsdlgl/ywAdd.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				id : 'saveButton',
				handler : function() {debugger 
				    $("#saveButton").attr("disabled",true);	
				    if("" == $("#ywmcname").val()){
					    alert("请填写业务名称!");
					    $("#saveButton").removeAttr("disabled");	
					}else if("" == $("#parentId").combobox("getValue")){
						alert("请选择业务类型!");
						$("#saveButton").removeAttr("disabled");	
				    }else if("" == $("#sDirect").combobox("getValue")){
						alert("请选择材料递送方向!");
						$("#saveButton").removeAttr("disabled");	
				    }else{
				    	var length = $("input[name='pic']").length;
						var pics = "";
						if(length > 0){
							for(var i=0;i<length;i++){
								if(pics == ""){
									pics = $("input[name='pic']").eq(i).val();
								}else{
									pics += "," + $("input[name='pic']").eq(i).val();
								}
							}
					    }
					    var ywmcname =$("#ywmcname").val();
					    if(ywmcname.length>20){
					    alert("业务名称长度不能超过20字，请重新输入！");
					    return;
					    }
					    
					     var remarkAdd =$("#remarkAdd").val();
					    if(remarkAdd.length>1000){
					    alert("办理说明长度不能超过1000字，请重新输入！");
					    return;
					    }
					    
						$.ajax({  
							type: "post",  
							cache: false, 
							async: false, 
							url: "../typeInfo/saveChild",  
							data: "ywmcname=" + $("#ywmcname").val() + "&pno=" + $("#pno").val() + "&parentId=" + $("#parentId").combobox("getValue")
							       + "&sDirect=" + $("#sDirect").combobox("getValue") + "&remark=" + $("#remarkAdd").val()
							       + "&pic=" + pics,  
							success: function (result) {  
							    if(result == 1){
									//$.messager.alert('系统提示',"您已成功添加业务信息！");
									alert("您已成功添加业务信息！");
									//$('#ywAddInfo').dialog('close');
									window.location.href = window.location.href;
								}else{
									$.messager.alert('系统提示',result);
									$("#saveButton").removeAttr("disabled");	
								}
							}  
						}); 
				    }  
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#ywAddInfo').dialog('close');
					loadList();
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			    $("#fm").form("clear"); 
			    $.ajax({  
					type: "post",  
					cache: false,  
					url: "../typeInfo/getNextPno",  
					data: "",  
					success: function (result) {  
					   $('#pno').textbox('setValue',result);
					    $('#sDirect').combobox('setValue', "0");
					   
					}  
				});  
			}
		});
	}

	function delList(id,childId){
		var ids = "";
		var childIds = "";
		if('' != id){
			ids = id;
			childIds = childId;
		}else{
			ids = getSelectRowId();
			childIds = getSelectRowChildId();
	    }
	    if(ids != ""){
	          if(confirm("确认删除此数据吗？")){
	            	$.ajax({  
						type: "post",  
						cache: false,  
						url: "../typeInfo/delChild",  
						data: "ids=" + ids + "&childIds=" + childIds,  
						success: function (result) {  
						    if(result == 1){
						    	alert("您已成功删除数据！");
								//$.messager.alert('系统提示',"您已成功删除数据！");
								//$('#ywGrid').datagrid('reload');  
								window.location.href = window.location.href;
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
		var rows = $("#ywGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		//var row = $("#ywGrid").datagrid("getSelected");  
		$('#ywEditInfo').dialog( {
			title : '业务修改',
			width : 800,
			height : 400,
			closed : false,
			cache : false,
			href : '../rsdlgl/ywEdit.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {debugger 
					if("" == $("#ywmcname").val()){
					    alert("请填写业务名称!");
					}else if("" == $("#parentId").combobox("getValue")){
						alert("请选择业务类型!");
				    }else if("" == $("#sDirect").combobox("getValue")){
						alert("请选择材料递送方向!");
				    }else{
				    	var length = $("input[name='pic']").length;
						var pics = "";
						if(length > 0){
							for(var i=0;i<length;i++){
								if(pics == ""){
									pics = $("input[name='pic']").eq(i).val();
								}else{
									pics += "," + $("input[name='pic']").eq(i).val();
								}
							}
					    }
					     var name =$("#e_name").val();
					    if(name.length>20){
					    alert("业务名称长度不能超过20字，请重新输入！");
					    return;
					    }
					    
					     var remarkAdd =$("#remark").val();
					    if(remarkAdd.length>1000){
					    alert("办理说明长度不能超过1000字，请重新输入！");
					    return;
					    }
						$.ajax({  
							type: "post",  
							cache: false,  
							url: "../typeInfo/updateChild",  
							data: "id=" + $("#id").val() + "&sstate=" + $("#sstate").val() + "&name=" + $("#e_name").val() + "&pno=" + $("#e_pno").val() + "&parentId=" + $("#parentId").combobox("getValue")
						       + "&sDirect=" + $("#sDirect").combobox("getValue") + "&remark=" + $("#remark").val() + "&childId=" + $("#childId").val() + "&pic=" + pics,  
							success: function (result) {  
							    if(result == 1){
								    alert("您已成功修改业务信息！");
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
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#ywEditInfo').dialog('close');
					window.location.href = window.location.href;
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			    $("#fmEdit").form("clear"); 
			    $("#fmEdit").form("load",row);
			    if("" != row.pic1){
			    	var str = '<tr valign="bottom" name="picTrEdit">';
		            str += '<td class="left" colspan="3">';
		            str += '<div style="margin-left:-30px;" id="localImag1">';
		            str += '<img id="preview1" name="pic1" src="/jtrc/typeInfo/getPicByPath?path='+row.pic1+'" style="width: 300px; height: 150px;" />';
		            str += '</div>';
		            str += '<input  type="hidden" id="pic1" name="pic" value="'+row.pic1+'"/>';
		            str += '</td>';
		            str += '<td class="right">';
		            str += '<a onclick="viewPic(\''+row.pic1+'\')" class="easyui-linkbutton" data-options="iconCls:\'icon-tip\',plain:true">预览</a>';
		            str += '&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del(this)" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\',plain:true">删除</a>';
		            str += '</td>';
		            str += '</tr>';
					$("#editTable").append(str);
				}
				if("" != row.pic2){
					var str = '<tr valign="bottom" name="picTrEdit">';
		            str += '<td class="left" colspan="3">';
		            str += '<div style="margin-left:-30px;" id="localImag2">';
		            str += '<img id="preview2" name="pic2" src="/jtrc/typeInfo/getPicByPath?path='+row.pic2+'" style="width: 300px; height: 150px;" />';
		            str += '</div>';
		            str += '<input  type="hidden" id="pic1" name="pic" value="'+row.pic2+'"/>';
		            str += '</td>';
		            str += '<td class="right">';
		            str += '<a onclick="viewPic(\''+row.pic2+'\')" class="easyui-linkbutton" data-options="iconCls:\'icon-tip\',plain:true">预览</a>';
		            str += '&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del(this)" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\',plain:true">删除</a>';
		            str += '</td>';
		            str += '</tr>';
					$("#editTable").append(str);
				}
				if("" != row.pic3){
					var str = '<tr valign="bottom" name="picTrEdit">';
		            str += '<td class="left" colspan="3">';
		            str += '<div style="margin-left:-30px;" id="localImag3">';
		            str += '<img id="preview3" name="pic3" src="/jtrc/typeInfo/getPicByPath?path='+row.pic3+'" style="width: 300px; height: 150px;" />';
		            str += '</div>';
		            str += '<input  type="hidden" id="pic3" name="pic" value="'+row.pic3+'"/>';
		            str += '</td>';
		            str += '<td class="right">';
		            str += '<a onclick="viewPic(\''+row.pic3+'\')" class="easyui-linkbutton" data-options="iconCls:\'icon-tip\',plain:true">预览</a>';
		            str += '&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del(this)" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\',plain:true">删除</a>';
		            str += '</td>';
		            str += '</tr>';
					$("#editTable").append(str);
				}
			}
		});
	}

	function getSelectRowId(){
		var rows = $('#ywGrid').datagrid('getSelections');  
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
	function getSelectRowChildId(){
		var rows = $('#ywGrid').datagrid('getSelections');  
		var childIds = "";
    	if (rows.length>0) {  
    		for(var i=0; i<rows.length; i++){
    			if(childIds == ""){
    				childIds = rows[i].childId;
        		}else{
        			childIds += "," + rows[i].childId;
            	}
    		}
    	}
    	return childIds;
	}

	
	function query(){
		
		$('#ywGrid').datagrid('load',{
			pno:$("#pno").textbox('getValue'),
			name:$("#name").textbox('getValue')
		});
	}
</script>


<body style="margin: 1px;">
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">   
	    <div data-options="region:'west',title:'分类列表',split:true,border:false" style="width:300px;">
	        <ul id="typeTree" class="easyui-tree"></ul>
	    </div>    
	    <div data-options="region:'center',border:false" style="">
	         <div id="zcpshdTool"  style="background-color:#FFFFFF;">
				  <div id="c">
				   <label>业务编码：</label> <input type="text"  class="easyui-textbox"  
				        name="pno" id="pno" />&nbsp;&nbsp;
				   <label>分类名称：</label> <input type="text"  class="easyui-textbox"  
				        name="name" id="name" />
					<a href="#"  onclick="query()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
				</div>
				<a id="a" onclick="addYw()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
				<a id="b" onclick="delList('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				
			</div>
			<div>
			   <table id="ywGrid"></table>  
			</div>
	    </div>   
	</div>
	<div id="ywAddInfo"></div>  
	<div id="ywEditInfo"></div> 
	<script type="text/javascript">
$(function(){
	$("#typeTree").tree({
		lines:true,
		url:'<%=request.getContextPath()%>/typeInfo/menu?parentId=0',
		onLoadSuccess:function(){
			$("#typeTree").tree('expandAll');
		},
		onClick:function(node){
			$('#ywGrid').datagrid('load',{
				parentId:node.id
			});
			/* 
			//if(node.children.length > 0){
				$('#ywGrid').datagrid( {
				    url : '../typeInfo/childTypeInfoList?parentId='+node.id,
					border : true,
					pageSize : 10,
					pageList : [ 10, 20, 30, 40 ],
					striped : true,
					collapsible : true,
					fitColumns : true,
					height : wholeHeight,
					toolbar : '#zcpshdTool',
					sortName : '',
					sortOrder : 'desc',
					pagination : true,
					remoteSort : false,
					columns : [ [ {
						field : 'id',
						title : '选择',
						checkbox : true,
						align : 'center'
					}, {
						field : 'pno',
						title : '分类编码',
						width : 100,
						align : 'center'
					}, {
						field : 'name',
						title : '业务名称',
						width : 100,
						align : 'center'
					}, {
						field : 'typeName',
						title : '业务分类',
						width : 100,
						align : 'center'
					}, {
						   title:'操作',field:'uid',width:100,align:'center',
			    		   formatter: function(value,row,index){
		                      var id=row.id;
		                      var childId=row.childId;
					          return '<a href="javascript:upd(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:delList(\''+id+'\',\''+childId+'\')" style="color: blue;">删除</a>';
					       }   
					   }
					] ]
				});
				var pager = $('#ywGrid').datagrid('getPager');
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
			//} */
			
		}
	});
});

function treeReload(){
	$('#typeTree').tree('reload');
}

</script> 
</body>

</html>
