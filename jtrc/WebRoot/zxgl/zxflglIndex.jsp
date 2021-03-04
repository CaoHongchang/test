<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
    
        $(function(){

            $('#pshdGrid').tree({
                url:'<%=request.getContextPath()%>/zxgl/listTypeInfoTree',
                checkbox:false,
              /*  data: [{
                    text: 'Item1',
                    id:"001",
                    state: 'closed',
                    children: [{
                        id:"1",
                        text: 'Item11'
                   },{
                        id:"2",
                        text: 'Item12'
                    }]
                },{
                    id:"3",
                    text: 'Item2'
                }],*/
                onClick:function(node){
         
                    var id = node["id"];
                    $('#fpGrid').datagrid('load',{
                        pid:id
                    });
                    
                }
            });


            $('#fpGrid').datagrid({
                url:'../zxgl/listTypeInfo',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height : '90%',
                toolbar: '#zcpshdTool',
                pagination:true,
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'id',title:'选择',checkbox:true,align:'center'},
                    {field:'seq',title:'序号',width : $(this).width() * 0.1,align:'center'},
                    {field:'pno',title:'分类编号',width : $(this).width() * 0.2,align:'center'},
                    {field:'name',title:'分类名称',width : $(this).width() * 0.1,align:'center'},
                   {
				   title:'操作',field:'uid',width:$(this).width() * 0.1,align:'center',
	    		   formatter: function(value,row,index){
                      var id=row.id;
			          return '<a href="javascript:updateType(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:deleteTypes(\''+id+'\')" style="color: blue;">删除</a>';
			       }   
			       }
                ]]
            });
            var pager = $('#fpGrid').datagrid('getPager');
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
     
        function addType(){
        
            $('#addTypeDialog').dialog({
                title: '分类添加',
                width: 450,
                height: 300,
                closed: false,
                cache: false,
                href: '../zxgl/zxflAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                    	 var result = $("#fm").form("validate");
                    	var checkRemark=$("#typeName").textbox("getValue");
						if(checkRemark==""){
							$.messager.alert("系统提示","分类名称不能为空");
							return false;
						}
						if(checkRemark.length>20){
							$.messager.alert("系统提示","分类名称长度不超过20位");
							return false;
						}
                       
                        if(result){
					    var select=$('#pshdGrid').tree('getSelected');
                        var id=select!=null&&select!=undefined?select.id:-1;
                            $.ajax({
                             type:'post',
                             url:'<%=request.getContextPath()%>/zxgl/addTypeInfo',
                             data:{
                               orderNo:$('#orderNo').numberbox('getValue'),
                               typeCode:$('#typeCode').textbox('getValue'),
                               typeName:$('#typeName').textbox('getValue'),
							   parentId:id
                             },
                             success:function(data){
                             
                             if(data==1){
                             $.messager.alert('系统提示','保存数据成功！');
                             $('#addTypeDialog').dialog('close');
                             $('#pshdGrid').tree('reload');
                             $('#fpGrid').datagrid('reload');
                             }
                             else{
                              $.messager.alert('系统提示','保存数据失败');
                               $('#addTypeDialog').dialog('close');
                             }
                             
                             },
                             error:function(){
                             }
                            });
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad:function(){
                    //对话框打开的时候加载数据
                    
                    var select=$('#pshdGrid').tree('getSelected');
                    var id=select!=null?select.id:-1;
                
                    $.ajax({
                        type:'post',
                        url:'<%=request.getContextPath()%>/zxgl/setTypeInfoByAjax',
                        dataType:'json',
                        data:{
                            id:id
                        },
                        success:function(data){
                        if(data.result==1){
                             var pName=data.pName;
                             var orderNo=data.orderNo;
                             var typeCode=data.typeCode;
                             $('#pName').textbox('setValue',pName);
                             $('#orderNo').numberbox('setValue',orderNo);
                             $('#typeCode').textbox('setValue',typeCode);
                            }
                            else{
                            $.messager.alert('系统提示',date.result);
							$('#addTypeDialog').dialog('close');
                            }
                        }
                    });
                }

            });
        }

        function updateNo(){
            $('#updateNo').dialog({
                title: '修改序号',
                width: 450,
                height: 300,
                closed: false,
                cache: false,
                href: '../zxgl/zxflUpdateNo.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
                        if(result){
                            $("#fm").form("submit");
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#updateNo').dialog('close');
                    }
                }],
                onLoad:function(){
                    $("#orderNo").numberbox('setValue','1');//赋值
                },
                iconCls: 'icon-save'

            });
        }

        function updateType(id){
	    if(''!=id){
		$('#addTypeDialog').dialog( {
			title : '资讯分类修改',
			width : 450,
			height : 300,
			closed : false,
			cache : false,
			href : '../zxgl/zxflAdd.jsp',
			modal : true,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
					var checkRemark=$("#typeName").textbox("getValue");
					if(checkRemark==""){
						$.messager.alert("系统提示","分类名称不能为空");
						return false;
					}
					if(checkRemark.length>20){
						$.messager.alert("系统提示","分类名称长度不超过20位");
						return false;
					}
					$.ajax({  
						type: "post",  
						cache: false,  
						url: "../zxgl/updateTypeInfo",  
						data:{
							 id:id,
                             typeName:$('#typeName').textbox('getValue')
						},
						success: function (result) {  
						    if(result == 1){
								$.messager.alert('系统提示',"您已成功修改资讯类别！");
								$('#addTypeDialog').dialog('close');
								$('#pshdGrid').tree('reload');
								$('#fpGrid').datagrid('reload'); 								
							}else{
								$.messager.alert('系统提示',"修改资讯类别失败！");
								$('#addTypeDialog').dialog('close');
							}
						}  
					});   
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#addTypeDialog').dialog('close');
				}
			} ],
			iconCls : 'icon-save',
			onLoad : function() {
			     		$.ajax({
                        type:'post',
                        url:'<%=request.getContextPath()%>/zxgl/getTypeInfo',
                        dataType:'json',
                        data:{
                            id:id
                        },
                        success:function(data){
                             var pName=data.pName;
                             var orderNo=data.orderNo;
                             var typeCode=data.typeCode;
							 var typeName=data.typeName;
                             $('#pName').textbox('setValue',pName);
                             $('#orderNo').numberbox('setValue',orderNo);
                             $('#typeCode').textbox('setValue',typeCode);
							 $('#typeName').textbox('setValue',typeName);
                        },
                        error:function(){
                            $.messager.alert('系统提示','数据加载失败');
                        }
                    });
			}
		});
		}
		else{
				     $.messager.alert('系统提示','请选择您要修改的资讯类别');	 
		}
	}
		function deleteTypes(id){
		var ids = "";
		if('' != id){
			ids = id;
		}else{
			ids = getSelectRowId();
	    }
	    if(ids != ""){
	    	$.ajax({  
				type: "post",  
				cache: false,  
				url: "../zxgl/deleteTypes",  
				data: "ids=" + ids,  
				success: function (result) {  
				    if(result == 1){
						$.messager.alert('系统提示',"您已成功删除节点！");
						$('#pshdGrid').tree('reload');
						$('#fpGrid').datagrid('reload');  
					}else{
						$.messager.alert('系统提示',result);
					}
				}  
			});  
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
	}
	function getSelectRowId(){
		var rows = $('#fpGrid').datagrid('getSelections');  
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
	function selectSubmit(){
		$('#fpGrid').datagrid('load',{
		    selectTypeCode:$('#selectTypeCode').textbox('getValue'),
			selectTypeName:$('#selectTypeName').textbox('getValue')
		});
	}
	function resetSubmit(){
		$('#selectTypeCode').textbox('setValue','');
		$('#selectTypeName').textbox('setValue','');
	    var node=$('#pshdGrid').tree('getSelected');
		if(node!=null&&node!=undefined){
			$('#pshdGrid').tree('uncheck',node);
		}
		selectSubmit();
	}
    </script>


<body style="margin: 1px;">
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
   <div data-options="region:'north',border:false" style="padding:5px">
       <form id="searchForm" type="post">
       <table>
	      <tr>
		     <td>本级分类编码:</td>
			 <td><input id="selectTypeCode" name="selectTypeCode" class="easyui-textbox" /></td>
			 <td>分类名称:</td>
			 <td><input id="selectTypeName" name="selectTypeName" class="easyui-textbox" /></td>
			 <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			 <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		  </tr>
	   </table>
	   </form>
   </div>
    <div data-options="region:'west',title:'资讯分类列表',split:true,border:false" style="width:300px;">
        <ul id="pshdGrid" class="easyui-tree"></ul>
    </div>
    <div data-options="region:'center',title:'资讯分类管理',border:false" style="">
	<div></div>
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
         <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
         <a onclick="updateType('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a>
         <a onclick="deleteTypes('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
         <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="display:none">新增子类</a>
         <a onclick="updateNo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改序列</a>
    </div>
	
        <table id="fpGrid"></table>
	
    </div>
</div>



<div id="addTypeDialog"></div>
<div id="updateNo"></div>

</body>
</html>
