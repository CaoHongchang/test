<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
    <script type="text/javascript">
        $(function(){
            $('#fpGrid').datagrid({
                url: eve.path + '/onlineJobFair/queryJobFairs',
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
                title: '网络招聘会新增',
                width: 400,
                height: 150,
                closed: false,
                cache: false,
                href: './onlineAdd.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	
                        var result = $("#fm").form("validate");
                        if(result){
                        	var obj = eve.serializeObject($("#fm"));
                        	$.ajax({
                        		url: eve.path + '/onlineJobFair/saveJobFair',
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
					
				}
            });
        }
        // 修改
		function updatePost(id){
            $('#addPostDialog').dialog({
                title: '专场招聘会修改',
                width: 400,
                height: 150,
                closed: false,
                cache: false,
                href:  './onlineEdit.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	 var result = $("#fm").form("validate");
                         if(result){
                         	var obj = eve.serializeObject($("#fm"));
                         	$.ajax({
                         		url: eve.path + '/onlineJobFair/editJobFair',
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
						url : eve.path + '/onlineJobFair/get',
						context: this,
						data:{id : id},
						type : 'post',
						success:function(res){
							var jobfair = res.jobfair;
							$("#id1").val(jobfair.id);
							$('#hold_time').textbox('setValue', jobfair.hold_time);
							$('#name1').textbox('setValue', jobfair.name);
							
							
						}
					})
				}
            });
        }
		
		// 详细
		function detailPost(id){
            $('#addPostDialog').dialog({
                title: '网络招聘会详细',
                width: 400,
                height: 150,
                closed: false,
                cache: false,
                href:  './onlineDetail.jsp',
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
						url : eve.path + '/onlineJobFair/get',
						context: this,
						data:{id : id},
						type : 'post',
						success:function(res){
							var jobfair = res.jobfair;
							$('#hold_time').textbox('setValue', jobfair.hold_time);
							$('#name1').textbox('setValue', jobfair.name);
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
	    	 $.messager.confirm('系统提示', '是否删除选中数据?', function(r) {  
	    		 if(r){
	    			 $.ajax({  
	 					type: "POST",  
	 					cache: false,  
	 					url: eve.path + "/onlineJobFair/delJobFair",  
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
			 $.alert("请选择要删除的数据");
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
			url: eve.path+"/onlineJobFair/eidtJobFairStatus",  
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
		    status:$('#status').combobox('getValue')
		});
	}
	function resetSubmit(){
		$('#name').textbox('setValue','');
		$('#starttime').datebox('setValue','');
		$('#endtime').datebox('setValue','');
		$('#status').combobox('setValue','2');
		selectSubmit();
	}
    </script>


<body style="margin: 1px;">

<div id="cc" class="easyui-layout" data-options="fit:true,border: false">
  
	<div data-options="region:'north',border:false" style="padding:5px">
	    <table>
		   <tr>
		       <!-- <td>招聘会名称：</td> -->
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
			   
			   <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			   <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		   </tr>
		</table>
	</div>
	<div id="jobFairsTool"  style="background-color:#FFFFFF;">
    <a onclick="addPost()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="deletePost()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
   </div>
    <div data-options="region:'center',title:'网络招聘会管理',border:false" style="">
        <table id="fpGrid"></table>
    </div>
</div>

<div id="addPostDialog"></div>
<div id="addPostDialog2"></div>

</body>
</html>
