<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){

            /* $('#tpflGrid').tree({
                url:'',
                checkbox:false,
                onClick:function(node){
                    var id = node["id"];
                    $('#tpglGrid').datagrid('load',{
                        pid:id
                    });
                }
            });
           */

            var pager = $('#tpglGrid').datagrid('getPager');
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
            $('#addImageTypeDialog').dialog({
                title: '分类新增',
                width: 550,
                height: 350,
                closed: false,
                cache: false,
                href: '../tpgl/tpflAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                        
                        var title=$("#title").textbox("getValue");
    					if(title==""){
    						$.messager.alert("系统提示","分类名称不能为空");
    						return false;
    					}
    					if(title.length>20){
    						$.messager.alert("系统提示","分类名称长度不超过20位");
    						return false;
    					}
                        
    					var size1=$("#size1").textbox("getValue");
     					if(size1==""){
     						$.messager.alert("系统提示","分类尺寸不能为空");
     						return false;
     					}
     					if(size1.length>10){
     						$.messager.alert("系统提示","分类尺寸长度不超过10位");
     						return false;
     					}
     					
     					var size2=$("#size2").textbox("getValue");
     					if(size2==""){
     						$.messager.alert("系统提示","分类尺寸不能为空");
     						return false;
     					}
     					if(size2.length>10){
     						$.messager.alert("系统提示","分类尺寸长度不超过10位");
     						return false;
     					}
    					
                        if(result){
                            $.ajax({
                                url:'../tpgl/insertAdverTypeInfo',
								type:'post',
								data:{
									code:$('#code').textbox('getValue'),
									title:$('#title').textbox('getValue'),
									size1:$('#size1').numberbox('getValue'),
									size2:$('#size2').numberbox('getValue'),
									imageType:$('#imageType').combobox('getValue')
								},
								success:function(data){
									if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$('#tpglGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',data);
									}
								},
								error:function(){
									$.messager.alert('系统提示','系统发生错误！');
								}
                            });
                            
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addImageTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad:function(){debugger;
                	var row =$("#tpglGrid").datagrid('getRows');
                	row=row[row.length-1];
                	var code=row.code;
                	code++
                	code='000'+code;
                  $('#code').textbox('setValue',code);
                }

            });
        }
		
		function update(id){
			var row=$('#tpglGrid').datagrid('getSelected');
            $('#addImageTypeDialog').dialog({
                title: '分类修改',
                width: 550,
                height: 350,
                closed: false,
                cache: false,
                href: '../tpgl/tpflAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                        
                        var title=$("#title").textbox("getValue");
    					if(title==""){
    						$.messager.alert("系统提示","分类名称不能为空");
    						return false;
    					}
    					if(title.length>20){
    						$.messager.alert("系统提示","分类名称长度不超过20位");
    						return false;
    					}
                        
    					var size1=$("#size1").textbox("getValue");
     					if(size1==""){
     						$.messager.alert("系统提示","分类尺寸不能为空");
     						return false;
     					}
     					if(size1.length>10){
     						$.messager.alert("系统提示","分类尺寸长度不超过10位");
     						return false;
     					}
     					
     					var size2=$("#size2").textbox("getValue");
     					if(size2==""){
     						$.messager.alert("系统提示","分类尺寸不能为空");
     						return false;
     					}
     					if(size2.length>10){
     						$.messager.alert("系统提示","分类尺寸长度不超过10位");
     						return false;
     					}
                        
                        if(result){
                            $.ajax({
                                url:'../tpgl/updateAdverTypeInfo',
								type:'post',
								data:{
									id:id,
									code:$('#code').textbox('getValue'),
									title:$('#title').textbox('getValue'),
									size1:$('#size1').numberbox('getValue'),
									size2:$('#size2').numberbox('getValue'),
									imageType:$('#imageType').combobox('getValue')
								},
								success:function(data){
									if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$('#tpglGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',data);
									}
								},
								error:function(){
									$.messager.alert('系统提示','系统发生错误！');
								}
                            });
                            
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addImageTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad:function(){
                $('#code').textbox('setValue',row.code);
				$('#title').textbox('setValue',row.title);
				$('#size1').numberbox('setValue',row.size.substring(0,row.size.indexOf('\tX')));
				$('#size2').numberbox('setValue',row.size.substring(row.size.indexOf('X\t')+1,row.size.length));
				$('#imageType').combobox('setValue',row.imageType);
                }

            });
			
        }
		
		function del(id){
			var ids="";
			 if(''!=id){
				 ids=id;
			 }else {
				 ids=getSelectRowId();
			 }
			if(ids != ""){
	    	$.ajax({  
				type: "post",  
				cache: false,  
				url: "../tpgl/deleteAdverTypeInfo",  
				data: "ids=" + ids,  
				success: function (result) {  
				    if(result == 1){
						$.messager.alert('系统提示',"您已成功删除节点！");
						$('#tpglGrid').datagrid('reload');  
					}else{
						$.messager.alert('系统提示',result);
					}
				}  
			});  
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
		}
        function formatOper(value,row,index)
        {
            return "<div>" +
                    "<a href='javascript:update("+row.id1+")' style='color:blue'>修改</a>&nbsp;&nbsp;" +
                    "<a href='javascript:del("+row.id1+")' style='color:blue'>删除</a>" +
                    "</div>";
        }
         
		function getSelectRowId(){
		var rows = $('#tpglGrid').datagrid('getSelections');  
		var ids = "";
    	if (rows.length>0) {  
    		for(var i=0; i<rows.length; i++){
    			if(ids == ""){
        			ids = rows[i].id1;
        		}else{
        			ids += "," + rows[i].id1;
            	}
    		}
    	}
    	return ids;
	}
    function selectSubmit(){
		$('#tpglGrid').datagrid('load',{
			selectCode:$('#selectCode').textbox('getValue'),
			selectTitle:$('#selectTitle').textbox('getValue'),
			selectImageType:$('#selectImageType').combobox('getValue')
		});
	}
	function resetSubmit(){
		$('#selectCode').textbox('setValue','');
		$('#selectTitle').textbox('setValue','');
		$('#selectImageType').combobox('setValue','0');
		selectSubmit();
	}
    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="update('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a>
    <a onclick="del('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="display:none">删除</a>

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <!--
    <div data-options="region:'west',title:'图片分类',split:true,border:false" style="width:300px;" style="display:none">
        <table id="tpflGrid"></table>

    </div>
	-->
	<div data-options="region:'north',border:false"  style="padding:5px">
	    <form id="searchForm" type="post">
		   <table>
		      <tr>
			     <td>分类编码:</td>
			     <td><input id="selectCode" name="selectCode" class="easyui-textbox" /></td>
				  <td>分类名称:</td>
			     <td><input id="selectTitle" name="selectTitle" class="easyui-textbox" /></td>
				  <td>图片类型:</td>
			     <td><select id="selectImageType" name="selectImageType" class="easyui-combobox" data-options="panelHeight:null,editable:false">
				     <option value="0">所有</option>
					 <option value="1">轮播图</option>
					 <option value="2">图片链接</option>
					 <option value="3">普通图片</option>
				 </select></td>
				 <td> <a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
				 <td> <a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
			  </tr>
		   </table>
		</form>
	</div>
    <div data-options="region:'center',title:'图片分类列表',border:false" style="">
        <%--<table id="tpglGrid"></table>--%>
        <table id="tpglGrid" title="" class="easyui-datagrid"
               url="../tpgl/listAdverTypeInfo" toolbar="#zcpshdTool"
               rownumbers="false" fitColumns="true" singleSelect="true" pagination="true" height="90%">
            <thead>
            <tr>
                <th data-options="field:'id1',checkbox:true,align:'center'">选择</th>
                <th data-options="field:'code',width:40">分类编码</th>
                <th data-options="field:'title',width:50">分类名称</th>
                <th data-options="field:'size',width:50">分类尺寸</th>
                <th data-options="field:'imageType',width:40,formatter:function(value,row,index){
					if(value=='1')return '轮播图';
					else if(value=='2') return '图片链接';
					else if(value=='3') return '普通图片';
				}">图片类型</th>
                <th data-options="field:'_operate',width:80,align:'center',formatter:formatOper">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div id="addImageTypeDialog"></div>

</body>
</html>
