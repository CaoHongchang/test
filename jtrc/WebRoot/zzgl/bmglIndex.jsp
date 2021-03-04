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
            $('#bumenGrid').datagrid({
                url:'../zzgl/listOrgDeptInfo',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height: '100%',
                toolbar: '#zcpshdTool',
                pagination:true,
				singleSelect:true,
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
				    {field:'id1',title:'选择',checkbox:true,align:'center'},
                    {field:'orgCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
                    {field:'orgName',title:'单位名称',width : $(this).width() * 0.2,align:'center'},
                    {field:'deptName',title:'部门名称',width : $(this).width() * 0.2,align:'center'},
                    {field:'status',title:'审核状态',width : $(this).width() * 0.1,align:'center',formatter:function(value,row,index){if(value=='0')return '待审核';else if(value=='1') return '已审核'; else if(value=='2') return '审核失败';}},
                    {field:'source',title:'数据来源',formatter:function(value,row,index){if(value=='0') return '内部创建';  else if(value=='1') return '外部注册'; else if(value=='2') return '数据采集';},width : $(this).width() * 0.1,align:'center'},
                    {field:'creator',title:'录入人',width : $(this).width() * 0.1,align:'center'},
                    {field:'createTime',title:'录入时间',width : $(this).width() * 0.2,align:'center'}

                ]]
            });

            var pager = $('#bumenGrid').datagrid('getPager');
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


        function addOrg(){
			var row= $('#bumenGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
            var editIndex = undefined;
            $('#addOrg').dialog({
                title: '部门维护',
                width: 700,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/bmwh.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	
                        var result = $("#fm").form("validate");
                        if(result){
                          
							$.ajax({
								url:'../zzgl/insertDepartmentInfo',
								type:'post',
								data:'orgId='+row.id1+getSubmit(),
								success:function(data){
								    if(data==1){
										$('#addOrg').dialog('close');
										$('#bumenGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',data);
									}
								}
							});
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad: function () {
                    $('#fm').form('load',row);
                    //专家列表
                    $('#deptGrid').datagrid({
                        url:'../zzgl/listDeptInfo?orgId='+row.id1,
                        title:'',
                        border:true,
                        striped: true,
                        collapsible:false,
                        fitColumns:true,
                        height: 380,
                        idField: 'deptName',
                        singleSelect: true,
                        width:'100%',
                        toolbar:
                                [{
                            text: '新增', iconCls: 'icon-add', handler: function () {
                                        if (endEditing()){
                                            $('#deptGrid').datagrid('appendRow',{status:'P'});
                                            editIndex = $('#deptGrid').datagrid('getRows').length-1;
                                            $('#deptGrid').datagrid('selectRow', editIndex)
                                                    .datagrid('beginEdit', editIndex);
                                        }
                            }
                        }, {
                            text: '删除', iconCls: 'icon-remove', handler: function () {
                                   
										var selected=$('#deptGrid').datagrid('getSelected');
										if(selected!=null&&selected!=undefined&&selected.id1!=null&&selected.id1!=undefined&&selected.id1!=''){
											var index=$('#deptGrid').datagrid('getRowIndex',selected);
											$.messager.confirm('确定删除部门','您确定要删除此部门吗？',function(flag){
												if(flag){
													$.ajax({
														url:'../zzgl/deleteDepartment',
														type:'post',
														data:{
															id:selected.id1
														},
														success:function(result){
															if(result==1){
																 $('#deptGrid').datagrid('cancelEdit', index)
                                                                .datagrid('deleteRow', index);
															}else{
																$.messager.alert('系统提示',result);
															}
														}
													});
													
                                                
												}
											});
										}else{
				                          if(selected==undefined)return;
									      var index=$('#deptGrid').datagrid('getRowIndex',$('#deptGrid').datagrid('getSelected'));
                     
										  $('#deptGrid').datagrid('cancelEdit', index)
                                                .datagrid('deleteRow', index);
										}

                            }
                        }],

                        onClickRow:function(rowIndex,rowData){
                            if (editIndex != rowIndex){
                                if (endEditing()){
                                    $('#deptGrid').datagrid('selectRow', rowIndex)
                                            .datagrid('beginEdit', rowIndex);
                                    editIndex = rowIndex;
                                } else {
                                    $('#deptGrid').datagrid('selectRow', editIndex);
                                }
                            }

                        },
                        sortName: '',
                        sortOrder: 'desc',
                        remoteSort: false,
                        columns:[[
						    {field:'id1',title:'选择',checkbox:true},
                            {field:'deptName',title:'部门名称',width:"30%",editor: { type: 'textbox', options: { required: true}}},
                            {field:'deptCode',title:'部门代码',width:"60%",editor: { type: 'textbox', options: { required: true}}}
                        ]]
                    });

                }

            });

            function endEditing(){
                if (editIndex == undefined){return true}
                if ($('#deptGrid').datagrid('validateRow', editIndex)){
                    editIndex = undefined;
                    return true;
                } else {
                    return false;
                }
            }
			}else{
				$.messager.alert('系统提示','请选择您要维护部门的组织机构！');
			}
        }
        
        function getSubmit(){
            
            var rows=$('#deptGrid').datagrid('getRows');
			var result="";
            if(rows!=null&&rows.length>0){
				var ids="";
                for(var i=0;i<rows.length;i++){
				   var ed1=$('#deptGrid').datagrid('getEditor',{index:i,field:'deptName'});
                   var ed2=$('#deptGrid').datagrid('getEditor',{index:i,field:'deptCode'});
                   if(ed1!=undefined){				   
				   if(rows[i].id1!=null&&rows[i].id1!=undefined&&rows[i].id1!=''){
					   ids+="&id="+rows[i].id1;
				   }  
                   var deptName=$(ed1.target).val();
                   var deptCode=$(ed2.target).val();
                   result+="&deptName="+deptName;
                   result+="&deptCode="+deptCode;
				   }
                }
				result+=ids;
            }
		
            return result;
        }
        
		 function chakanOrg(){
		var row= $('#bumenGrid').datagrid('getSelected');
			if(row!=null&&row!=undefined){
            $('#addOrg').dialog({
                title: '查看部门',
                width: 700,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/bmwh.jsp',
                modal: true,
                buttons:[{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad: function () {
                    $('#fm').form('load',row);
                    //专家列表
                    $('#deptGrid').datagrid({
                        url:'../zzgl/listDeptInfo?orgId='+row.id1,
                        title:'',
                        border:true,
                        striped: true,
                        collapsible:false,
                        fitColumns:true,
                        height: 380,
                        idField: 'deptName',
                        singleSelect: true,
                        width:'100%',
                        sortName: '',
                        sortOrder: 'desc',
                        remoteSort: false,
                        columns:[[
                            {field:'deptName',title:'部门名称',width:"20%"},
                            {field:'deptCode',title:'部门代码',width:"20%"},
							{field:'status',title:'审核状态',width:"20%",formatter:function(value,row,index){if(value=='0') return '待审核'; else if(value=='1') return '已审核'; else if(value=='2') return '审核失败';}},
							{field:'advice',title:'审核意见',width:"20%"}
							
                        ]]
                    });

                }

            });
			}else{
				$.messager.alert('系统提示','请选择您要查看部门的组织机构！');
			}
        }
		function getCheckSubmit(){
			var rows=$('#deptGrid').datagrid('getRows');
			var result="";
            if(rows!=null&&rows.length>0){
				var ids="";
                for(var i=0;i<rows.length;i++){
				   var ed1=$('#deptGrid').datagrid('getEditor',{index:i,field:'status'});
                   var ed2=$('#deptGrid').datagrid('getEditor',{index:i,field:'advice'});
                   if(ed1!=undefined){				   
				   ids+="&id="+rows[i].id1; 
                   var check=$(ed1.target).combobox('getValue');
                   var advice=$(ed2.target).val();
                   result+="&check="+check;
                   result+="&advice="+advice;
				   }
                }
				result+=ids;
            }
		 
            return result;
		}
		function shenheOrg(){
		var row= $('#bumenGrid').datagrid('getSelected');
		if(row!=null&&row!=undefined){
            var editIndex = undefined;
            $('#addOrg').dialog({
                title: '审核部门',
                width: 700,
                height: 500,
                closed: false,
                cache: false,
                href: '../zzgl/bmwh.jsp',
                modal: true,
                buttons:[{text:'保存',iconCls:'icon-save',handler:function(){
					var result=$('#fm').form('validate');
					if(result){
						$.messager.confirm('确定审核','您确定审核这些部门吗？',function(flag){
							if(flag){
						    $.ajax({
							url:'../zzgl/checkDepartment',
							type:'post',
							data:getCheckSubmit(),
							success:function(result){
								if(result==1){
								$('#addOrg').dialog('close');	
								$.messager.alert('系统提示','审核部门成功！');
								$('#bumenGrid').datagrid('reload');
								}else{
									$.messager.alert('系统提示',result);
								}
							}
						    });
							}
						});
						
					}
					
				}},{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#addOrg').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad: function () {
					$('#fm').form('load',row);
                    //专家列表
                    $('#deptGrid').datagrid({
                        url:'../zzgl/listDeptInfo?orgId='+row.id1,
                        title:'',
                        border:true,
                        striped: true,
                        collapsible:false,
                        fitColumns:true,
                        height: 380,
                        idField: 'deptName',
                        singleSelect: true,
                        width:'100%',
                        onClickRow:function(rowIndex,rowData){
                            if (editIndex != rowIndex){
                                if (endEditing()){
                                    $('#deptGrid').datagrid('selectRow', rowIndex)
                                            .datagrid('beginEdit', rowIndex);
                                    editIndex = rowIndex;
									var ed1=$('#deptGrid').datagrid('getEditors',rowIndex)[0];
								    var ed2=$('#deptGrid').datagrid('getEditors',rowIndex)[1];
									if(rowData.status!='0'){
										$(ed1.target).combobox('disable');
										$(ed2.target).textbox({editable:false});
									}
									else{
										$(ed1.target).combobox('setValue','1');
									}
                                } else {
                                    $('#deptGrid').datagrid('selectRow', editIndex);
									
                                }
                            }

                        },
                        sortName: '',
                        sortOrder: 'desc',
                        remoteSort: false,
                        columns:[[
                            {field:'deptName',title:'部门名称',width:"20%"},
                            {field:'deptCode',title:'部门代码',width:"20%"},
							{field:'status',title:'审核状态',width:"20%",formatter:function(value,row,index){if(value=='0') return '待审核'; else if(value=='1') return '已审核'; else if(value=='2') return '审核失败';},editor:{type:'combobox',options:{required:true,panelHeight:null,valueField: 'value',textField: 'text',data:[{value:1,text:'已审核'},{value:2,text:'审核失败'}]}}},
							{field:'advice',title:'审核意见',width:"20%",editor:{type:'textbox',options:{required:true}}}
                        ]]
                    });

                }

            });

            function endEditing(){
                if (editIndex == undefined){return true}
                if ($('#deptGrid').datagrid('validateRow', editIndex)){
                    editIndex = undefined;
                    return true;
                } else {
                    return false;
                }
            }
			}else{

			}
        }
	function selectSubmit(){
		$('#bumenGrid').datagrid('load',{
		    selectOrgCode:$('#selectOrgCode').val(),
			selectOrgName:$('#selectOrgName').val(),
			selectCheck:$('#selectCheck').combobox('getValue'),
			selectSource:$('#selectSource').combobox('getValue'),
		});
	}
	function resetSubmit(){
		    $('#selectOrgCode').textbox('setValue','');
			$('#selectOrgName').textbox('setValue','');
			$('#selectCheck').combobox('setValue','3');
			$('#selectSource').combobox('setValue','3');
		    selectSubmit();
	}
    </script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">

    <a onclick="addOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">维护部门</a>
    <a style="display:none" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    <a onclick="chakanOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看</a>
    <a onclick="shenheOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">审核</a>

</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<div data-options="region:'north',border:false" style="padding:5px">
	    <table>
		   <tr style="padding:5px">
		       <td>组织机构代码：</td>
			   <td><input id="selectOrgCode" name="selectOrgCode" class="easyui-textbox" size="20" /></td>
			   <td>单位名称:</td>
			   <td><input id="selectOrgName" name="selectOrgName" class="easyui-textbox" size="20"/></td>
			   <td>审核状态：</td>
			   <td>
			   <select id="selectCheck" name="selectCheck" class="easyui-combobox" style="width:160px" data-options="editable:false,panelHeight:null" />
			      <option value="3">所有</option>
				  <option value="0">待审核</option>
			      <option value="1">已审核</option>
				  <option value="2">审核失败</option>
			   </select>
			   </td>
			   <td>数据来源:</td>
			   <td><select id="selectSource" name="selectSource" class="easyui-combobox" style="width:160px" data-options="editable:false,panelHeight:null">
			      <option value='3'>所有</option>
				  <option value='0'>内部创建</option>
				  <option value='1'>外部注册</option>
			      <option value='2'>数据采集</option>
			   </select></td>
			   <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			   <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		   </tr>
		</table>
	</div>
    <div data-options="region:'center',title:'部门管理',border:false" style="">
        <table id="bumenGrid"></table>
    </div>
</div>

<div id="addOrg"></div>

</body>
</html>
