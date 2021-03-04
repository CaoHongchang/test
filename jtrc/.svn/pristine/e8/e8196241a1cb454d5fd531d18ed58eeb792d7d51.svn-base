<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>选项管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#xxglGrid').datagrid({    
    url:'../xxgl/queryOptions', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '90%',
	toolbar: '#xxglTool',
	sortName: '',
	pagination:true,
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'ext',title:'选项编码',width: $(this).width() * 0.01,align:'center'},
         {field:'ext4',title:'选项名称',width: $(this).width() * 0.01,align:'center'},
         {field:'ext5',title:'选项备注',width: $(this).width() * 0.05,align:'center'}
    ]]    
});  
	var pager = $('#xxglGrid').datagrid('getPager');
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
 

/*选项新增*/
function addFuc(){
    var editIndex = undefined;
    $('#xxglAddInfo').dialog({
        title: '选项新增',
        width: 450,
        height: 500,
        closed: false,
        cache: false,
        href: '../xxgl/xxglAdd.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){

                var result = $("#fm").form("validate");
                if(result){
                	var rows=$("#xxAddGrid").datagrid('getRows');
                	if(rows.length>0){
					$.messager.confirm('确定新增','确定新增选项？',function(flag){
						if(flag){
							$.ajax({
								url:'../xxgl/saveOption',
								type:'post',
								data:getSubmit(),
								success:function(result){
									
									if(result==1){
										$('#xxglAddInfo').dialog('close');
										$.messager.alert('系统提示','新增选项成功！','info');
										$("#xxglGrid").datagrid('reload');
									}else{
										$.messager.alert('系统提示','新增选项失败！');
									}
								}
							});

						}
					});
                	}else{
                		$.messager.alert('系统提示','请为该选项配置序列，选项值！','info');
                	}
                  
                }
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#xxglAddInfo').dialog('close');
            }
        }],
        iconCls: 'icon-save',
        onLoad: function () {
			$.ajax({
				url:'../xxgl/getCode',
				type:'post',
				success:function(result){
						$('#zhmc1').textbox('setValue',result);
				}
			});
            //选项列表
            $('#xxAddGrid').datagrid({
                url:'',
                title:'',
                border:true,
                striped: true,
                collapsible:false,
                fitColumns:true,
                height: 380,
                idField: 'ext2',
                singleSelect: true,
                width:'100%',
                toolbar:
                        [{
                    text: '新增行', iconCls: 'icon-add', handler: function () {
                                if (endEditing()){
                                    $('#xxAddGrid').datagrid('appendRow',{status:'P'});
                                    editIndex = $('#xxAddGrid').datagrid('getRows').length-1;
                                    $('#xxAddGrid').datagrid('selectRow', editIndex)
                                            .datagrid('beginEdit', editIndex);
                                    var ed=$("#xxAddGrid").datagrid('getEditor',{index:editIndex,field:'ext2'});
                                    $(ed.target).textbox('setValue',editIndex+1);
                                }
                    }
                }],

                onClickRow:function(rowIndex,rowData){
                    if (editIndex != rowIndex){
                        if (endEditing()){
                            $('#xxAddGrid').datagrid('selectRow', rowIndex)
                                    .datagrid('beginEdit', rowIndex);
                            editIndex = rowIndex;
                        } else {
                            $('#xxAddGrid').datagrid('selectRow', editIndex);
                        }
                    }

                },
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'ext2',title:'选项序列',width:"30%",editor: { type: 'textbox', options: { editable:false }}},
                    {field:'ext3',title:'选项值',width:"70%",editor: { type: 'textbox', options: { required: true }}}
                ]]
            });

        }

    });

    function endEditing(){
        if (editIndex == undefined){return true;}
        if ($('#xxAddGrid').datagrid('validateRow', editIndex)){
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
}


/*选项修改*/
function editFuc(){
	var row=$('#xxglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
    var editIndex = undefined;
    $('#xxglAddInfo').dialog({
        title: '选项修改',
        width: 450,
        height: 500,
        closed: false,
        cache: false,
        href: '../xxgl/xxglAdd.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){

                var result = $("#fm").form("validate");
                if(result){
                    $.messager.confirm('确定修改','确定修改选项？',function(flag){
						if(flag){
							$.ajax({
								url:'../xxgl/updateOption',
								type:'post',
								data:getSubmit(),
								dataType:'json',
								success:function(result){
									
									
									if(result==1){
										$('#xxglAddInfo').dialog('close');
										$.messager.alert('系统提示','修改选项成功！','info');
										$("#xxglGrid").datagrid('reload');
									}else{
										$.messager.alert('系统提示','修改选项失败！');
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
                $('#xxglAddInfo').dialog('close');
            }
        }],
        iconCls: 'icon-save',
        onLoad: function () {
			$("#zhmc1").textbox('setValue',row.ext);
			$("#zhmc2").textbox('setValue',row.ext4);
			$("#zhmc3").textbox('setValue',row.ext5);
            //选项列表
            $('#xxAddGrid').datagrid({
                url:'../xxgl/queryOptionsByCode?code='+row.ext,
                title:'',
                border:true,
                striped: true,
                collapsible:false,
                fitColumns:true,
                height: 380,
                idField: 'ext2',
                singleSelect: true,
                width:'100%',
                toolbar:
                        [{
                    text: '新增行', iconCls: 'icon-add', handler: function () {
                                if (endEditing()){
                                    $('#xxAddGrid').datagrid('appendRow',{status:'P'});
                                    editIndex = $('#xxAddGrid').datagrid('getRows').length-1;
                                    $('#xxAddGrid').datagrid('selectRow', editIndex)
                                            .datagrid('beginEdit', editIndex);
                                    var ed=$("#xxAddGrid").datagrid('getEditor',{index:editIndex,field:'ext2'});
                                    $(ed.target).textbox('setValue',editIndex+1);
                                }
                    }
                }],

                onClickRow:function(rowIndex,rowData){
                    if (editIndex != rowIndex){
                        if (endEditing()){
                            $('#xxAddGrid').datagrid('selectRow', rowIndex)
                                    .datagrid('beginEdit', rowIndex);
                            editIndex = rowIndex;
                        } else {
                            $('#xxAddGrid').datagrid('selectRow', editIndex);
                        }
                    }

                },
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'ext2',title:'选项序列',width:"30%",editor: { type: 'textbox', options: { editable: false }}},
                    {field:'ext3',title:'选项值',width:"70%",editor: { type: 'textbox', options: { required: true }}}
                ]]
            });

        }

    });

    function endEditing(){
        if (editIndex == undefined){return true;}
        if ($('#xxAddGrid').datagrid('validateRow', editIndex)){
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
	}else{
		$.messager.alert('系统提示','请选择您要修改的选项！','info');
	}
}

  function getSubmit(){
            
            var rows=$('#xxAddGrid').datagrid('getRows');
			var result="";
			result="&zhmc1="+$("#zhmc1").textbox('getValue');
			result+="&zhmc2="+$("#zhmc2").textbox('getValue');
			result+="&zhmc3="+$("#zhmc3").textbox('getValue');
            if(rows!=null&&rows.length>0){
				var ids="";
                for(var i=0;i<rows.length;i++){
				   var ed1=$('#xxAddGrid').datagrid('getEditor',{index:i,field:'ext2'});
                   var ed2=$('#xxAddGrid').datagrid('getEditor',{index:i,field:'ext3'});
                   if(ed1!=undefined){				   
				   if(rows[i].id!=null&&rows[i].id!=undefined&&rows[i].id!=''){
					   ids+="&id="+rows[i].id;
				   }  
                   var deptName=$(ed1.target).val();
                   var deptCode=$(ed2.target).val();
                   result+="&ext2="+deptName;
                   result+="&ext3="+deptCode;
				   }
                }
				result+=ids;
            }//console.log(result);
            return result;
     }
	 function delFunc(){
		 var rows=$('#xxglGrid').datagrid('getSelections');
		 if(rows!=undefined){
			 var params="";
			 for(var i=0;i<rows.length;i++){
				 params+="&ext="+rows[i].ext;
			 }
			// console.log("params"+params);
			 $.messager.confirm('确定删除','确定删除这些选项吗？',function(flag){
				 if(flag){
					  $.ajax({
						url:'../xxgl/deleteOptions',
						type:'post',
						data:params,
						success:function(result){
							if(result==1){
								$.messager.alert('系统提示','删除选项成功！','info');
								$('#xxglGrid').datagrid('reload');
							}else{
								$.messager.alert('系统提示','删除选项失败！','info');
							}
						}
						});
				 }
			 });
			
		 }else{
			 $.messager.alert('系统提示','请选择您要删除的选项！','info');
		 }
	 }
	 
	function selectSubmit(){
		$('#xxglGrid').datagrid('load',{
			code:$("#code").textbox('getValue'),
			name:$("#name").textbox('getValue'),
			remark:$("#remark").textbox('getValue')
		});
	}
	function resetSubmit(){
		$("#code").textbox('setValue','');
		$("#name").textbox('setValue','');
		$("#remark").textbox('setValue','');
		selectSubmit();
	}
		
</script>


<body style="margin: 1px;">
  <table >
     <tr>
        <td>选项编码：</td>
        <td><input id="code" name="code" class="easyui-textbox"/></td>
        <td>选项名称：</td>
        <td><input id="name" name="name" class="easyui-textbox"/></td>
        <td>选项备注：</td>
        <td><input id="remark" name="remark" class="easyui-textbox"/></td>
        <td>
           <a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
           <a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">重置</a>
        </td>
     </tr>
 </table>

<div id="tb">
   
	<div id="xxglTool"  style="background-color:#FFFFFF;">
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="editFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="delFunc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a>
	</div>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<table id="xxglGrid"></table>  
</div>
<div id="xxglAddInfo" align="center"></div>


</body>
</html>
