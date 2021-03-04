<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
        $(function(){
			/*
            $('#tpflGrid').tree({
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

/*         function addPic(){
            $('#addImageTypeDialog').dialog({
                title: '图片新增',
                width: 500,
                height: 450,
                closed: false,
                cache: false,
                href: '../tpgl/tpAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                        if(result){
                            if($('#useTime').datetimebox('getValue')>$('#disableTime').datetimebox('getValue')){
                                $.messager.alert('系统提示','上架时间应早于下架时间！','info');
                                $('#useTime').datetimebox('setValue','');
                                $('#disableTime').datetimebox('setValue','');
                            }
							else if(judgeFile()){
								$('#fm').form('submit',{
									url:'../tpgl/insertAdverInfo',
									queryParams:{
										createTime:$('#createTime').datetimebox('getValue')
									},
									success:function(data){
										if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$('#tpglGrid').datagrid('reload');
									  }else{
										$.messager.alert('系统提示',data);
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
                        $('#addImageTypeDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					
					$('#createTime').datetimebox('setValue',DateFormat(new Date(),"yyyy-MM-dd HH:mm:ss"));
					$.ajax({
					    url:'../tpgl/generatePno',
					    type:'post',
					    success:function(result){
					    	$('#code').textbox('setValue',result);
					    }
					});
				
				}

            });
        } */

        function formatOper(value,row,index)
        {
		
            return "<div>" +
			        "<a href='javascript:updateAdverInfo("+row.id1+")' style='color:blue'>修改</a>&nbsp;&nbsp;"//+
                    /* "<a href='javascript:pulloffPic("+row.id1+")' style='color:blue'>下架</a>&nbsp;&nbsp;" +
                    "<a href='javascript:deleteAdverInfo("+row.id1+")' style='color:blue' >删除</a>&nbsp;&nbsp;" +
                    "<a href=\"javascript:preview(\'"+row.adr+"\')\" onmouseover=\"preview(\'"+row.adr+"\')\" onmouseleave='closeDialog()' style='color:blue'>预览</a>" + */
                    "</div>";
        }

		function updateAdverInfo(id){
			var row=$('#tpglGrid').datagrid('getSelected');
            $('#addImageTypeDialog').dialog({
                title: '内容修改',
                width: 500,
                height: 300,
                closed: false,
                cache: false,
                href: '../pqgl/pqglUp.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){

                        var result = $("#fm").form("validate");
								$('#fm').form('submit',{
									url:'../pqgls/updateAdverInfo',
									queryParams:{
										id:id,
										/* createTime:$('#createTime').datetimebox('getValue') */
									},
									success:function(data){
										if(data==1){
										$('#addImageTypeDialog').dialog('close');
										$.messager.alert('系统提示','修改内容成功！');
										$('#tpglGrid').datagrid('reload');
									  }else{
										$.messager.alert('系统提示','修改失败');
									   }
									}
									
								});
							
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
					$('#id').textbox('setValue',row.id);
					$('#title').textbox('setValue',row.title);
					$('#content').textbox('setValue',row.content);
					$('#type').textbox('setValue',row.type);
					$('#url').textbox('setValue',row.url);
					({
					   onLoadSuccess:function( node, data){
					        
					        /* $('#typeId').combotree('tree').tree('select',$('#typeId').combotree('tree').tree('find',row.tid).target);
					        $('#typeId').combotree('setValue',row.tid); */
					        $('#id').textbox('setValue',row.id);
					$('#title').textbox('setValue',row.title);
					$('#content').textbox('setValue',row.content);
					$('#type').textbox('setValue',row.type);
					$('#url').textbox('setValue',row.url);
					   } 
					
					});
					/* $('#imageType').combobox('setValue',row.typeId);
					$('#url').textbox('setValue',row.url);
					$('#useTime').datetimebox('setValue',row.useTime);
					$('#disableTime').datetimebox('setValue',row.disableTime);
					$('#createTime').datetimebox('setValue',row.createTime);
					$('#file').filebox('setValue',row.adr); */
					$('#id').textbox('setValue',row.id);
					$('#title').textbox('setValue',row.title);
					$('#content').textbox('setValue',row.content);
					$('#type').textbox('setValue',row.type);
					$('#url').textbox('setValue',row.url);
				
				}

            });
        }
/* 	function deleteAdverInfo(id){
		var ids = "";
		if('' != id){
			ids = id;
		}else{
			ids = getSelectRowId();
	    }
	
	    if(ids != ""){
			$.messager.confirm("确定删除","您是否确定删除所选的节点？",function(flag){
			    if(flag){
					 $.ajax({  
				    type: "post",  
				     cache: false,  
				     url: "../tpgl/deleteAdverInfo",  
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
					
				}
		    });
	    	
		 }else{
			 $.messager.alert('系统提示',"请选择要删除的数据");
	     }
	} */
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
/* 	//下架图片
	function pulloffPic(id){
		var date=new Date();
		var day=date.getDate()<10?"0"+date.getDate():date.getDate();
		var year=1900+date.getYear();
		var month=date.getMonth()+1;
		month=month<10?"0"+month:month;
		var str=year+"-"+month+"-"+day;
		$.messager.confirm("下架图片","您确定要下架此图片吗?",function(flag){
			if(flag){
				$.ajax({
			      url:'../tpgl/pullofAdverInfo',
			      type:'post',
			      data:{
				    id:id,
				    disableTime:str
			      },
			      success:function(data){
				  if(data==1){
					  $.messager.alert('系统提示','下架成功');
					  $('#tpglGrid').datagrid('reload');
				  }else{
					$.messager.alert('系统提示',data);
				  }
			   }
		       });
			}
		});
		
	} */
	
	
   function selectSubmit(){
        var selected=$('#selectTypeTitle').combotree('tree').tree('getSelected');
        var typeTitle="";
        if(selected!=null){
            typeTitle=selected.id;
        }
		$('#tpglGrid').datagrid('load',{
			/* selectCode:$('#selectCode').textbox('getValue'),
			selectTypeTitle:typeTitle,
			selectImageType:$('#selectImageType').combobox('getValue'),
			selectPicTitle:$('#selectPicTitle').textbox('getValue'),
			selectCreateTime:$('#selectCreateTime').datebox('getValue'),
			selectUseTime:$('#selectUseTime').datebox('getValue'),
			selectDisableTime:$('#selectDisableTime').datebox('getValue') */
			id:$('id').textbox(getValue),
			title:$('title').textbox(getValue),
			content:$('content').textbox(getValue),
			type:$('type').textbox(getValue),
			url:$('url').textbox(getValue)
		});
	}
	function resetSubmit(){
/* 		$('#selectCode').textbox('setValue','');
		$('#selectTypeTitle').combotree('clear');
		$('#selectImageType').combobox('setValue','0');
		$('#selectPicTitle').textbox('setValue','');
	    $('#selectCreateTime').datebox('setValue','');
		$('#selectUseTime').datebox('setValue','');
		$('#selectDisableTime').datebox('setValue',''); */
		$('#id').textbox('setValue','');
		$('#title').textbox('setValue','');
		$('#content').textbox('setValue','');
		$('#type').textbox('setValue','');
		$('#url').textbox('setValue','');
		selectSubmit();
	}

    function closeDialog(){
		var flag=$("#previewDialog").parent().is(":hidden");
		if(!flag){
			$('#previewDialog').dialog('close');
		}
	}		
    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

<!--     <a onclick="addPic()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a> -->
 <!--    <a onclick="addPic()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a> -->
<!--     <a  onclick="deleteAdverInfo('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a> -->
    

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
    <!--
    <div data-options="region:'west',title:'图片分类',split:true,border:false" style="width:300px;">
        <table id="tpflGrid"></table>

    </div>
	-->

    <div data-options="region:'center',title:'派遣列表',border:false" style="">
        <%--<table id="tpglGrid"></table>--%>
        <table id="tpglGrid" title="" class="easyui-datagrid"
               url="../pqgls/list"
               rownumbers="false" fitColumns="true" singleSelect="true" pagination="true" height="90%" toolbar="#zcpshdTool">
            <thead>
            <tr>
                <th data-options="field:'id1',checkbox:true,align:'center'">选择</th>
                 <th data-options="field:'id',width:40">编码</th>
                 <th data-options="field:'title',width:50">标题</th>
                 <th data-options="field:'content',width:50">内容</th>
                 <th data-options="field:'type',width:50">类型</th>
                 <th data-options="field:'url',width:50">Url</th>
<!--                 <th data-options="field:'code',width:40">编码</th>
                <th data-options="field:'typeTitle',width:50">分类名称</th>
                <th data-options="field:'typeId',width:50,formatter:function(value,row,index){if(value=='1') return '轮播图';else if(value=='2') return '图片链接'; else if(value=='3') return '普通图片';}">图片类型</th>
                <th data-options="field:'picTitle',width:40">图片名称</th>
                <th data-options="field:'createTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">创建时间</th>
                <th data-options="field:'useTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">上架时间</th>
                <th data-options="field:'disableTime',width:40,formatter:function(value,row,index){return value.substring(0,10);}">下架时间</th>
                <th data-options="field:'orderNo',width:40">排序编号</th>
                <th data-options="field:'url',width:40">URL</th> -->
                
                <th data-options="field:'_operate',width:50,align:'center',formatter:formatOper">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div id="addImageTypeDialog"></div>
<div id="previewDialog"></div>  
</body>
</html>
