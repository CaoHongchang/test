<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>选项内容管理管理</title>

<script type="text/javascript">
	$(function(){
   
   $('#xxnrglGrid').datagrid({    
    url:'../xxgl/queryOptions?type='+"xxnr", 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#xxnrTool',
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id1',title:'选择',checkbox:true,align:'center'},
        {field:'ext',title:'选项编码',width : $(this).width() * 0.15,align:'center'},    
        {field:'ext4',title:'选项名称',width : $(this).width() * 0.15,align:'center'},    
        {field:'ext5',title:'备注',width: $(this).width() * 0.15,align:'center'},
         {field:'zt5',title:'异动人',width: $(this).width() * 0.15,align:'center'},
         {field:'add_date',title:'异动日期',width: $(this).width() * 0.15,align:'center'},
         {field:'yTime',title:'异动时间',width: $(this).width() * 0.1,align:'center'},
         {field:'ext6',title:'有效性',width: $(this).width() * 0.1,align:'center'},
      
         {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
		    		formatter: function(value,row,index){
 				      return '<a href="#" style="color: green;"  onclick="editFuc()">修改</a> <a href="#" style="color: blue;"  onclick="invalidFunc()">失效</a>';
				}   
				}
  
    ]]    
});  
	var pager = $('#xxnrglGrid').datagrid('getPager');
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





//选项内容新增
function xxnrAddFuc(){
var editIndex = undefined;
	$('#xxnrglInfo').dialog({
    title: '选项新增',
    width: 800,
    height: 500,
   
    closed: false,
    cache: false,
    href: '../daxxgl/xxnrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
                var result = $("#fm").form("validate");
                if(result){
                	var rows=$("#xxnrAddGrid").datagrid('getRows');
                	if(rows.length>0){
					$.messager.confirm('确定新增','确定新增选项？',function(flag){
						if(flag){
							$.ajax({
								url:'../xxgl/saveOption',
								type:'post',
								data:getSubmit(),
								success:function(result){
									
									if(result==1){
										$('#xxnrglInfo').dialog('close');
										$.messager.alert('系统提示','新增选项成功！','info');
										$("#xxnrglGrid").datagrid('reload');
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
				$('#xxnrglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
			$.ajax({
				url:'../xxgl/getCode',
				type:'post',
				data:{type:'xxnr'},
				success:function(result){
						$('#zhmc1').textbox('setValue',result);
				}
			});
            //选项列表
            $('#xxnrAddGrid').datagrid({
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
                    text: '新增', iconCls: 'icon-add', handler: function () {
                                if (endEditing()){
                                    $('#xxnrAddGrid').datagrid('appendRow',{status:'P'});
                                    editIndex = $('#xxnrAddGrid').datagrid('getRows').length-1;
                                    $('#xxnrAddGrid').datagrid('selectRow', editIndex)
                                            .datagrid('beginEdit', editIndex);
                                    var ed=$("#xxnrAddGrid").datagrid('getEditor',{index:editIndex,field:'ext2'});
                                    $(ed.target).textbox('setValue',editIndex+1);
                                }
                    }
                },
                {
                    text: '删除', iconCls: 'icon-remove', handler: function () {
                    }
                }],

                onClickRow:function(rowIndex,rowData){
                    if (editIndex != rowIndex){
                        if (endEditing()){
                            $('#xxnrAddGrid').datagrid('selectRow', rowIndex)
                                    .datagrid('beginEdit', rowIndex);
                            editIndex = rowIndex;
                        } else {
                            $('#xxnrAddGrid').datagrid('selectRow', editIndex);
                        }
                    }

                },
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'ext2',title:'序列号',width:"30%",editor: { type: 'textbox', options: { editable:false }}},
                    {field:'ext3',title:'值',width:"70%",editor: { type: 'textbox', options: { required: true }}}
                ]]
            });
    } 
});

 function endEditing(){
        if (editIndex == undefined){return true;}
        if ($('#xxnrAddGrid').datagrid('validateRow', editIndex)){
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    
}

/*选项修改*/
function editFuc(){
	var row=$('#xxnrglGrid').datagrid('getSelected');
	if(row!=null&&row!=undefined){
    var editIndex = undefined;
    $('#xxnrglInfo').dialog({
        title: '选项修改',
        width: 450,
        height: 500,
        closed: false,
        cache: false,
        href: '../daxxgl/xxnrAdd.jsp',
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
										$('#xxnrglInfo').dialog('close');
										$.messager.alert('系统提示','修改选项成功！','info');
										$("#xxnrglGrid").datagrid('reload');
									}else if(result==3){
									   $('#xxnrglInfo').dialog('close');
									  $.messager.alert('系统提示','失效选项无法修改！','info');
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
                $('#xxnrglInfo').dialog('close');
            }
        }],
        iconCls: 'icon-save',
        onLoad: function () {
			$("#zhmc1").textbox('setValue',row.ext);
			$("#zhmc2").textbox('setValue',row.ext4);
			$("#zhmc3").textbox('setValue',row.ext5);
            //选项列表
            $('#xxnrAddGrid').datagrid({
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
                    text: '新增', iconCls: 'icon-add', handler: function () {
                                if (endEditing()){
                                    $('#xxnrAddGrid').datagrid('appendRow',{status:'P'});
                                    editIndex = $('#xxnrAddGrid').datagrid('getRows').length-1;
                                    $('#xxnrAddGrid').datagrid('selectRow', editIndex)
                                            .datagrid('beginEdit', editIndex);
                                    var ed=$("#xxnrAddGrid").datagrid('getEditor',{index:editIndex,field:'ext2'});
                                    $(ed.target).textbox('setValue',editIndex+1);
                                }
                    }
                },
                {
                    text: '删除', iconCls: 'icon-remove', handler: function () {
                    var selections = $('#xxnrAddGrid').datagrid('getSelections');//获取所有选中行
                    if (selections) {
                    for (var i=0;i<selections.length;i++){
                    
                    var rowIndex = $('#xxnrAddGrid').datagrid('getRowIndex', selections[i]);
                    $('#xxnrAddGrid').datagrid('deleteRow', rowIndex);  
                     }
                    }
                    }
                }],

                onClickRow:function(rowIndex,rowData){
                    if (editIndex != rowIndex){
                        if (endEditing()){
                            $('#xxnrAddGrid').datagrid('selectRow', rowIndex)
                                    .datagrid('beginEdit', rowIndex);
                            editIndex = rowIndex;
                        } else {
                            $('#xxnrAddGrid').datagrid('selectRow', editIndex);
                        }
                    }

                },
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'ext2',title:'序列号',width:"30%",editor: { type: 'textbox', options: { editable: false }}},
                    {field:'ext3',title:'值',width:"70%",editor: { type: 'textbox', options: { required: true }}}
                ]]
            });

        }

    });

    function endEditing(){
        if (editIndex == undefined){return true;}
        if ($('#xxnrAddGrid').datagrid('validateRow', editIndex)){
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

//选项删除  暂时未用到
function delFunc(){
	 var rows=$('#xxnrglGrid').datagrid('getSelections');
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
//选项失效
function invalidFunc(){
	var rows=$('#xxnrglGrid').datagrid('getSelected');
	if(rows!=null&&rows!=undefined){
	 $.messager.confirm('确定修改','确定失效选项？',function(flag){
			if(flag){
				 
				$.ajax({
					url:'../xxgl/updateOption',
					type:'post',
					data:{ext6:'失效',id:rows.id,invaild:'1',ext:rows.ext},
					dataType:'json',
					success:function(result){
						
						if(result==1){	
							$.messager.alert('系统提示','失效选项成功！','info');
							$("#xxnrglGrid").datagrid('reload');
						}else{
							$.messager.alert('系统提示','失效选项失败！');
						}
					}
				});
			 
			}
		});
		 
	 }
	 else{
			$.messager.alert('系统提示','请选择要失效的选项！','info');
		}
}

function getSubmit(){
            
            var rows=$('#xxnrAddGrid').datagrid('getRows');
			var result="";
			result="&zhmc1="+$("#zhmc1").textbox('getValue');
			result+="&zhmc2="+$("#zhmc2").textbox('getValue');
			result+="&zhmc3="+$("#zhmc3").textbox('getValue');
            if(rows!=null&&rows.length>0){
				var ids="";
				var noExt2 ="";
                for(var i=0;i<rows.length;i++){
				   var ed1=$('#xxnrAddGrid').datagrid('getEditor',{index:i,field:'ext2'});
                   var ed2=$('#xxnrAddGrid').datagrid('getEditor',{index:i,field:'ext3'});
                   if(ed1!=undefined){	
                   noExt2="2";		   
				   if(rows[i].id!=null&&rows[i].id!=undefined&&rows[i].id!=''){
					   ids+="&id="+rows[i].id;
				   }  
                   var deptName=$(ed1.target).val();
                   var deptCode=$(ed2.target).val();
                   result+="&ext2="+deptName;
                   result+="&ext3="+deptCode;
				   }else{
				    if(noExt2!="2")
				    noExt2 = "1"; 
				   }
                }
				result+=ids;
				result+="&type=xxnr&noExt2="+noExt2;
            }//console.log(result);
            return result;
     }



</script>


<body style="margin: 1px;">
 

<div id="tb">
   
	<div id="xxnrTool"  style="background-color:#FFFFFF;">
		<a onclick="xxnrAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="invalidFunc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
		
		
	</div>

</div>
<div>
<table id="xxnrglGrid"></table>  
</div>
<div id="xxnrglInfo"></div>


</body>
</html>
