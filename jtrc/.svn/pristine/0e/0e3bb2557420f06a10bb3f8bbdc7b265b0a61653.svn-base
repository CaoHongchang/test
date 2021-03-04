<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
    <script type="text/javascript">
        $(function(){
            $('#fpGrid').datagrid({
                url: eve.path + '/jobFair/queryJobFairs',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height: '100%',
                toolbar: '#jobFairsTool',
                pagination:true,
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
				    {field:'id',title:'选择',checkbox:true,align:'center'},
                    {field:'name',title:'招聘会名称',width : $(this).width() * 0.1,align:'center'},
                    {field:'hold_time',title:'举办时间',width : $(this).width() * 0.1,align:'center'},
                    {field:'hold_place',title:'举办地点',width : $(this).width() * 0.1,align:'center'},
                    {field:'type',title:'性质',formatter : function(value, row,index) {
						if (value == '1')
							return '普通专场招聘会';
						else if(value == '2')
							return '毕业生专场招聘会';
						else
							return '';
					},width : $(this).width() * 0.1,align:'center'},
                    {field:'status',title:'有效性',formatter:function(value,row,index){if(value=='0') return '无效'; else return '有效';},width : $(this).width() * 0.1,align:'center'},
				   {
				   title:'操作',field:'uid',width:$(this).width() * 0.1,align:'center',
	    		   formatter: function(value,row,index){
                      var id=row.id;
                      var status = row.status;
                      if(status == true){
                    	  status = 0;
                      }else{
                    	  status = 1;
                      }
			          return '<a href="javascript:detailPost(\''+id+'\')" style="color: blue;">查看</a> <a href="javascript:updatePost(\''+id+'\')" style="color: blue;">修改</a> <a href="javascript:deletePost(\''+id+'\')" style="color: blue;">删除</a> <a href="javascript:invalidPost(\''+id+'\',\''+status+'\')" style="color: blue;">有/无效</a>';
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

        function addPost(){
            $('#addPostDialog').dialog({
                title: '专场招聘会新增',
                width: 700,
                height: 550,
                closed: false,
                cache: false,
                href: './specialAdd.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
						
                        var result = $("#fm").form("validate");
                        if(result){
                        	var con = contentTool.getData();//招聘会内容
                        	if(con.length == 0){
                        		$.msg('招聘会内容不能为空');
                        		return;
                        	}
                        	var data = $('#fairareaid').datagrid('getData');
                        	if(data.total == 0){
                        		$.msg('最少需要新增一个区域');
                        		return;
                        	}
                        	var obj = eve.serializeObject($("#fm"));
                        	obj.content = con;
                        	obj.explainContent = explainTool.getData();//展会说明
                        	obj.fairArea = JSON.stringify(data.rows);
                        	$.ajax({
                        		url: eve.path + '/jobFair/saveJobFair',
                        		context:this,
                        		data : obj,
                        		type:'POST',
                        		success:function(data){
                        			data = JSON.parse(data);
									if(data.flag){
										$('#addPostDialog').dialog('close');
										$('#fpGrid').datagrid('reload');
										$.msg(data.msg);
									}else{
										$.alert(data.msg);
									}
								}
                        	})
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addPostDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					contentTool = CKEDITOR.replace('content');
					explainTool = CKEDITOR.replace('explainContent');
				}
            });
        }
        // 修改
		function updatePost(id){
            $('#addPostDialog').dialog({
                title: '专场招聘会修改',
                width: 700,
                height: 550,
                closed: false,
                cache: false,
                href:  './specialEdit.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	 var result = $("#fm").form("validate");
                         if(result){
                        	var con = contentTool.getData();
                          	if(con.length == 0){
                          		$.msg('招聘会内容不能为空');
                          		return;
                          	}
                         	var data = $('#fairareaid').datagrid('getData');
                         	if(data.total == 0){
                         		$.msg('最少需要新增一个区域');
                         		return;
                         	}
                         	var obj = eve.serializeObject($("#fm"));
                         	obj.explainContent = explainTool.getData();
                         	obj.content = con;
                         	obj.fairArea = JSON.stringify(data.rows);
                         	$.ajax({
                         		url: eve.path + '/jobFair/eidtJobFair',
                         		context:this,
                         		data : obj,
                         		type:'POST',
                         		success:function(data){
                         			data = JSON.parse(data);
 									if(data.flag){
 										$('#addPostDialog').dialog('close');
 										$('#fpGrid').datagrid('reload');
 										$.msg(data.msg);
 									}else{
 										$.alert(data.msg);
 									}
 								}
                         	})
                         }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addPostDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$.ajax({
						url : eve.path + '/jobFair/get',
						context: this,
						data:{id : id},
						type : 'post',
						success:function(res){
							var jobfair = res.jobfair;
							
							$('#name1').textbox('setValue',jobfair.name);
							$('#hold_time').textbox('setValue',jobfair.hold_time);
							$('#hold_place').textbox('setValue',jobfair.hold_place);
							$('#id').val(jobfair.id);
							
							if(jobfair.status == 1){
								$("input[name='type'][value='1']").attr("checked", "checked");
							}else if(jobfair.status == 2){
								$("input[name='type'][value='2']").attr("checked", "checked");
							}
							
							$('#fairareaid').datagrid('loadData', res.area);
							
							contentTool = CKEDITOR.replace('content');
							contentTool.setData(jobfair.content);
							
							explainTool = CKEDITOR.replace('explainContent');
							explainTool.setData(jobfair.explain_content);
						}
					})
					
					
				}

            });
        }
		
		// 详细
		function detailPost(id){
            $('#addPostDialog').dialog({
                title: '专场招聘会详细',
                width: 700,
                height: 550,
                closed: false,
                cache: false,
                href:  './specialDetail.jsp',
                modal: true,
                buttons:[{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addPostDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					$.ajax({
						url : eve.path + '/jobFair/get',
						context: this,
						data:{id : id},
						type : 'post',
						success:function(res){
							var jobfair = res.jobfair;
							
							$('#name1').textbox('setValue',jobfair.name);
							$('#hold_time').textbox('setValue',jobfair.hold_time);
							$('#hold_place').textbox('setValue',jobfair.hold_place);
							
							if(jobfair.status == 1){
								$("input[name='type'][value='1']").attr("checked", "checked");
							}else if(jobfair.status == 2){
								$("input[name='type'][value='2']").attr("checked", "checked");
							}
							
							$('#fairareaid').datagrid('loadData', res.area);
							
							contentTool = CKEDITOR.replace('content');
							contentTool.setData(jobfair.content);
							contentTool.on('instanceReady', function (ev) {
								explainTools = ev.editor;
								explainTools.setReadOnly(true); 
				            });
							
							explainTool = CKEDITOR.replace('explainContent');
							explainTool.setData(jobfair.explain_content);
							
							explainTool.on('instanceReady', function (ev) {
								explainTools = ev.editor;
								explainTools.setReadOnly(true); 
				            });
						}
					})
					
					
				}

            });
        }
		
     function deletePost(id){
		var ids = "";
		if(typeof id != 'undefined'){
			ids = id;
		}else{
			ids = getSelectRowId();
	    }
	    if(ids != ""){
	    	 $.messager.confirm('确认', '是否删除选中数据?', function(r) {  
	    		 if(r){
	    			 $.ajax({  
	 					type: "POST",  
	 					cache: false,  
	 					url: eve.path + "/jobFair/delJobFair",  
	 					data: "id=" + ids,  
	 					success: function (result) {  
	 					    if(result.flag){
	 					    	$('#fpGrid').datagrid('reload');  
	 							$.msg(result.cause);
	 						}else{
	 							$.alert(result.cause);
	 						}
	 					}  
	 				});  
	    		 }
	    	 }); 
		 }else{
			 $.msg('请选择要删除的数据');
	     }
	}
	
	function invalidPost(id, status){
		var param = {
			id : id,
			status : status
		}
    	$.ajax({  
			type: "post",  
			cache: false,  
			url: eve.path+"/jobFair/eidtJobFairStatus",  
			data: param,
			success: function (result) {  
				$.msg('保存成功');
				$('#fpGrid').datagrid('reload');  
			}  
		});  
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
		    name:$('#name').val(),
		    starttime:$('#starttime').datebox('getValue'),
		    endtime:$('#endtime').datebox('getValue'),
		    status:$('#status').combobox('getValue'),
		    type:$('#type').combobox('getValue')
		});
	}
	function resetSubmit(){
		$('#name').textbox('setValue','');
		$('#starttime').datebox('setValue','');
		$('#endtime').datebox('setValue','');
		$('#status').combobox('setValue','2');
		$('#type').combobox('setValue','1,2');
		selectSubmit();
	}
    </script>


<body style="margin: 1px;">

<div id="cc" class="easyui-layout" data-options="fit:true,border: false">
  
	<div data-options="region:'north',border:false" style="padding:5px">
	    <table>
		   <tr>
		       <!-- <td>招聘会名称</td> -->
			   <td><input id="name" name="name" 
			    data-options="prompt:'招聘会名称'"
			   class="easyui-textbox" size="20" /></td>
			   
			   <td>举办时间: 从</td>
			   <td><input id="starttime" name="starttime" class="easyui-datebox" size="20" /></td>
			   <td>到</td>
			   <td><input id="endtime" name="endtime" class="easyui-datebox" size="20" /></td>
			   
			   <td>有效性：</td>
			   <td>
			   <select id="status" name="status" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:150px" />
			      <option value="2">所有</option>
			      <option value="0">无效</option>
				  <option value="1">有效</option>
			   </select>
			   </td>
			   
			   <td>性质：</td>
			   <td>
			   <select id="type" name="type" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:150px" />
			      <option value="1,2">所有</option>
			      <option value="1">普通专场招聘会</option>
				  <option value="2">毕业生专场招聘会</option>
			   </select>
			   </td>
			   
			   <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			   <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		   </tr>
		</table>
	</div>
	<div id="jobFairsTool"  style="background-color:#FFFFFF;">
    <a onclick="addPost()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="deletePost()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
   </div>
    <div data-options="region:'center',title:'专场招聘会管理',border:false" style="">
        <table id="fpGrid"></table>
    </div>
</div>

<div id="addPostDialog"></div>
<div id="addPostDialog2"></div>

</body>
</html>
