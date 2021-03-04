<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>

    <script type="text/javascript">
    
    var place_id;
    function getByteLen(val) {
        var len = 0;
        for (var i = 0; i < val.length; i++) {
             var a = val.charAt(i);
             if (a.match(/[^\x00-\xff]/ig) != null) 
            {
                len += 2;
            }
            else
            {
                len += 1;
            }
        }
        return len;
    }
        $(function(){
            /*
            $('#pshdGrid').tree({
                url:'',
                checkbox:false,
                onClick:function(node){
                    var id = node["id"];
                    $('#fpGrid').datagrid('load',{
                        pid:id
                    });
                }
            });

            */
			//加载可选活动下拉框
			$("#activityCode1").combobox({
				url: '../zzgl/generateactivityCodeAll',
				required: true,
				valueField: 'value',
				textField: 'text',
				onLoadSuccess: function () {       //数据加载完毕执行此方法
                $('#activityCode').combobox('setValue',row.acId);// 设置选中
                $('#activityCode').combobox('setText',row.acName);// 设置选中
             	}			
			});            
            
            $('#fpGrid').datagrid({
                url:'../zzgl/listPlaceInfo',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
                collapsible:true,
                fitColumns:true,
                height: '100%',
                toolbar: '#zcpshdTool',
                pagination:true,
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
				    {field:'id1',title:'选择',checkbox:true,align:'center'},
				    {field:'acName',title:'招聘活动名称',width : $(this).width() * 0.1,align:'center'},
				    {field:'acId',title:'招聘活动ID',width : $(this).width() * 0.1,align:'center',hidden:true},
				    {field:'postCode',title:'岗位代码',width : $(this).width() * 0.1,align:'center'},
                    {field:'postName',title:'岗位名称',width : $(this).width() * 0.1,align:'center'},
                    {field:'source',title:'来源',formatter:function(value,row,index){if(value=='0') return '内部创建';else if(value=='1') return '外部注册'; else if(value=='2') return '数据采集';},width : $(this).width() * 0.1,align:'center'},
                    {field:'remark',title:'备注',width : $(this).width() * 0.1,align:'center'},
                    {field:'available',title:'有效性',formatter:function(value,row,index){if(value=='0') return '无效'; else return '有效';},width : $(this).width() * 0.1,align:'center'},
                    {field:'creator',title:'录入人',width : $(this).width() * 0.1,align:'center'},
                    {field:'createTime',title:'录入时间',width : $(this).width() * 0.1,align:'center'},
				   {
				   title:'操作',field:'uid',width:$(this).width() * 0.1,align:'center',
	    		   formatter: function(value,row,index){
                      var id=row.id1;
                      if(row.available==1)
			          return '<a href="javascript:bkgwUpdate(\''+id+'\')" style="color: blue;">编辑岗位</a> <a href="javascript:updatePost(\''+index+'\')" style="color: blue;">修改</a> <a href="javascript:deletePost(\''+id+'\')" style="color: blue;">删除</a> <a href="javascript:invalidPost(\''+id+'\')" style="color: blue;">失效</a>';
			       	else
			       	 return '<a href="javascript:bkgwUpdate(\''+id+'\')" style="color: blue;">编辑岗位</a> <a href="javascript:updatePost(\''+index+'\')" style="color: blue;">修改</a> <a href="javascript:deletePost(\''+id+'\')" style="color: blue;">删除</a> <a href="javascript:invalidPost(\''+id+'\')" style="color: blue;">有效</a>';
			       	
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
                title: '岗位新增',
                width: 400,
                height: 300,
                closed: false,
                cache: false,
                href: '../zzgl/gwAdd.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	var postName=$("#postName").textbox("getValue");
						if(postName.length>20){
							$.messager.alert("系统提示","岗位名称长度不超过20位！");
							return false;
						}
						var remark=$("#remark").textbox("getValue");
						if(remark.length>100){
							$.messager.alert("系统提示","备注长度不超过100位！");
							return false;
						}
						var postCode=$("#postCode").textbox("getValue").trim();
						if(postCode.length<=0){
							$.messager.alert("系统提示","请先选择招聘活动");
							return false;
						}
                        var result = $("#fm").form("validate");
                        if(result){
							$.messager.confirm('确定新增岗位','您确定新增此岗位吗？',function(flag){
								if(flag){
									 $("#fm").form("submit",{
								url:'../zzgl/insertPlaceInfo',
								type:'post',
								queryParams:{
									msgfrom:0
								},
								success:function(data){
									if(data==1){
										$('#addPostDialog').dialog('close');
										$('#fpGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',data);
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
                        $('#addPostDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					
					//加载可选活动下拉框
					$("#activityCode").combobox({
						url: '../zzgl/generateactivityCode',
						required: true,
						valueField: 'value',
						textField: 'text'
					});
					//活动下拉框,选择改变触发岗位代码变化
					$("#activityCode").combobox({  
				       onSelect: function () {  
				           var activityCode = $("#activityCode").combobox('getValue');
				           if(activityCode == -1){
				           		$.messager.alert("系统提示","暂无可选招聘活动");
				           		return;
				           }else if(activityCode == -2){
				           		$.messager.alert("系统提示","请选择招聘活动");
				           		return;
				           }
				           $.ajax({
							url:'../zzgl/generateFlowNum',
							data:{activityCode:activityCode},
							type:'post',
							success:function(result){
								$('#postCode').textbox('setValue',result);
							}
						});
				       }  
				   })  
				}

            });
        }
		function updatePost(id){
            $('#addPostDialog').dialog({
                title: '岗位修改',
                width: 400,
                height: 300,
                closed: false,
                cache: false,
                href: '../zzgl/gwAdd.jsp',
                modal: true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    	var postName=$("#postName").textbox("getValue");
						if(postName.length>20){
							$.messager.alert("系统提示","岗位名称长度不超过20位！");
							return false;
						}
						var remark=$("#remark").textbox("getValue");
						if(remark.length>100){
							$.messager.alert("系统提示","备注长度不超过100位！");
							return false;
						}
                        var result = $("#fm").form("validate");
                       
                        if(result){
						   $.messager.confirm('确定修改岗位','您确定修改此岗位吗？',function(flag){
							   if(flag){
                            $("#fm").form("submit",{
								url:'../zzgl/updatePlaceInfo',
								type:'post',
								queryParams:{
									msgfrom:0
								},
								success:function(data){
									if(data==1){
										$('#addPostDialog').dialog('close');
										$('#fpGrid').datagrid('reload');
									}else{
										$.messager.alert('系统提示',data);
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
                        $('#addPostDialog').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
				onLoad:function(){
					//加载可选活动下拉框
					$("#activityCode").combobox({
						url: '../zzgl/generateactivityCode',
						required: true,
						valueField: 'value',
						textField: 'text',
						onLoadSuccess: function () {       //数据加载完毕执行此方法
                 			$('#activityCode').combobox('setValue',row.acId);// 设置选中
                 			$('#activityCode').combobox('setText',row.acName);// 设置选中
             			}			
					});
					
					var row=$('#fpGrid').datagrid('getRows');
					row=row[id];
					//console.log(row);
					$('#id').val(row.id1);
					row.acId;
					
					 $('#postName').textbox('setValue',row.postName);
					$('#postCode').textbox('setValue',row.postCode);
					$('#remark').textbox('setValue',row.remark); 
				}

            });
        }
	function bkgwUpdate(id){
		/* var ids = "";
		if('' != id){
			ids = id;
		}else{
			ids = getSelectRowId();
	    } */
	    
		$('#bkgwglInfo').dialog({
			title: '岗位编辑',
		    width: 950,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zzgl/gwbjAdd.jsp',
		    modal: true,
		    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						var result = $("#fm_gw").form("validate");
						if(result){
							if($('#recruitmentNum').textbox('getValue').length > 8) {
								 $.messager.alert('系统提示','招考人数最多输入8个字符,请重新输入！');
							} else if(getByteLen($('#ageRange').textbox('getValue')) > 40) {
								 $.messager.alert('系统提示','年龄要求最多输入20个汉字(40个字符),请重新输入！');
							} else if(getByteLen($('#examinationName').textbox('getValue')) > 40) {
								 $.messager.alert('系统提示','考试名称最多输入20个汉字(40个字符),请重新输入！');
							} else if(getByteLen($('#examinationPlace').textbox('getValue')) > 100) {
								 $.messager.alert('系统提示','考试地点最多输入100个汉字(200个字符),请重新输入！');
							} else if(getByteLen($('#examinationSubject').textbox('getValue')) > 40) {
								 $.messager.alert('系统提示','考试科目最多输入20个汉字(40个字符),请重新输入！');
							} else if(getByteLen($('#othersRange').textbox('getValue')) > 400) {
								 $.messager.alert('系统提示','其他要求最多输入200个汉字(400个字符),请重新输入！');
							} else if(getByteLen($('#remark').textbox('getValue')) > 400) {
								 $.messager.alert('系统提示','备注最多输入200个汉字(400个字符),请重新输入！');
							} else {
								$("#fm_gw").form("submit",{
								     url:'../bgEnterprisePlaceInfo/edit',
									 type:'post',
									 success:function(result){
										 
										 if(result=='1' || result==1){
											 $.messager.alert('系统提示','编辑报考岗位成功！');
											 $('#bkgwglInfo').datagrid('reload');
											 
										 }else{
											 $.messager.alert('系统提示','编辑报考岗位失败！');
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
					$('#bkgwglInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {debugger;
	    
	    $.ajax({
			url:'../bgEnterprisePlaceInfo/checkByPlaceId',
			type:'post',
			dataType:'json',
			data:{id:id},
			success:function(result){
				//$('#bkgw_placeId').val(id);
				$('#fm_gw').form('load',result);
			}
		});
	    } //loadEnd
	});
		
	} 
	
	
		
		
     function deletePost(id){
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
				url: "../zzgl/deletePlaceInfo",  
				data: "ids=" + ids,  
				success: function (result) {  
				    if(result == 1){
						$.messager.alert('系统提示',"您已成功删除节点！");
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
	
	var submit=false;
	function invalidPost(id){
		if(submit){
			return;
		}
		submit=true;
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
				url: "../zzgl/invalidPlaceInfo",  
				data: "ids=" + ids,  
				success: function (result) { 
					submit=false; 
				    if(result == 1){
						$.messager.alert('系统提示',"岗位成功失效！");
						$('#fpGrid').datagrid('reload');  
					}else if(result==0){
						$.messager.alert('系统提示',"岗位有效成功！");
						$('#fpGrid').datagrid('reload');
					}else{
						$.messager.alert('系统提示',result);
					}
				}  
			});  
		 }else{
		 	 submit=false; 
			 $.messager.alert('系统提示',"请选择要失效的岗位！");
	     }
	}
	function getSelectRowId(){
		var rows = $('#fpGrid').datagrid('getSelections');  
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
		$('#fpGrid').datagrid('load',{
		    activityCode:$('#activityCode1').combobox('getValue'),
		    selectPostName:$('#selectPostName').val(),
			selectSource:$('#selectSource').combobox('getValue'),
			selectIsValid:$('#selectIsValid').combobox('getValue'),
			selectAddtime:$('#selectAddtime').datebox('getValue')
		});
	}
	function resetSubmit(){
		$('#activityCode1').combobox('setValue','-2');
		$('#selectPostName').textbox('setValue','');
		$('#selectSource').combobox('setValue','3');
		$('#selectIsValid').combobox('setValue','2');
		$('selectAddtime').datebox('setValue','');
		selectSubmit();
	}
	
	
	//导入数据
	 function archiveImport(){
		 $("#baseFormImportDialog").dialog({
			title:'导入文件',
           href:'../zzgl/baseFormImport.jsp',
			closed:false,
			cache:false,
			modal:true,
			width:300,
			draggable:true,
			height:150,
			buttons:[
			{
				text:'上传',
				iconCls:'icon-save',
				handler:function(){
					uploadFile(function(data){
						$("#archiveImportDialog").dialog({
							title:'岗位信息导入',
							href:'../zzgl/archiveImport.jsp',
							closed:false,
							cache:false,
							modal:true,
							width:'90%',
							height:500,
							buttons:[
								{text:'保存',iconCls:'icon-save',handler:function(){
									var result=generateParam();
									if(result!=""){
										if(containError){
											$.messager.alert('系统提示','存在错误信息，请修改导入的文件！','info');
									}else{
										$.messager.confirm('确定导入数据','确定导入岗位信息吗？',function(flag){
											submit=false;
											if(!submit){
												 $.messager.progress({ // 显示进度条  
						      						title:"提示",  
						         					 text:"正在保存...",  
						         					 interval:500  
						         				}); 
						         			} 
						         			submit=true;
											if(flag){
											 var dates = generateParam2();
											 saveDnxx(dates); 
											
										}
									});
								}
								}
							else{
								$.messager.alert('系统提示','不能导入空数据！','info');
							}
						}},
							{text:'关闭',iconCls:'icon-cancel',handler:function(){
							$('#archiveImportDialog').dialog('close');
							}}
						],
							iconCls:'icon-save',
							onLoad:function(){
								showImportUserInfo(data);
							}
						});
					});
				}
			}
			]
		 });
		 
	 }
	
	
	
	 function  uploadFile(func){
		  var fileName=$("#importFile").filebox('getValue');
		  if(fileName!=""){   
               //对文件格式进行校验  
               var d1=/\.[^\.]+$/.exec(fileName);   
               if(d1==".xlsx" || d1==".xls"){  
                    $("#questionTypesManage").form("submit", {
			        	async: false,
			            url: "<%=request.getContextPath()%>/bgEnterprisePlaceInfo/importUserInfo",
			            method: 'post',             
			            onSubmit: function () {
			                return $(this).form("validate");
			            },
			            success: function (data) {
							data=$.parseJSON(data);
				            if(data.flag == 0){
				            	var obj = data.returnList;
				            	containError = data.errorMsg!=undefined&&data.errorMsg!=''?true:false;
				            	showImportUserInfo(obj);
								if(obj.length==0){
									$.messager.alert('系统提示','不能导入空数据！');
									$('#importFile').filebox('setValue','');
								}else{
									$('#baseFormImportDialog').dialog('close');
									func(obj);
								}
					        }else{
					        	 $.messager.alert('系统提示','导入失败：'+data.errorMsg);
								 $('#importFile').filebox('setValue','');  
						    }
			            }
			        });       
              }else{  
                  $.messager.alert('提示','请选择xlsx或xls格式文件！','info');   
                  $('#importFile').filebox('setValue','');   
              }  
           }    
		else{    
			$.messager.alert('提示','请选择上传文件！','info'); 
		}  
	  }
	  //显示导入后的结果
	  function showImportUserInfo(data){
		  $('#fileImportGrid').datagrid('loadData',data);
	  }
	
	  //生成请求参数
	    function generateParam(){
	    	var rows=$('#fileImportGrid').datagrid('getRows');
	    	var result="";
	    	
	    	 if(rows!=null&&rows!=undefined){
	    		for(var i=0;i<rows.length;i++){
	    			var row=rows[i];
					result+="&acName="+row.acName;
					result+="&code="+row.code;
	    			result+="&postCode="+row.postCode;
	    			result+="&postName="+row.postName;
	    			result+="&recruitmentNum="+row.recruitmentNum;
	    			result+="&ageRange="+row.ageRange;
	    			result+="&genderRange="+row.genderRange;
	    			result+="&nationRange="+row.nationRange;
	    			result+="&politicalStatusRange="+row.politicalStatusRange;
	    			result+="&educationRange="+row.educationRange;
	    			result+="&schoolRange="+row.schoolRange;
	    			result+="&educationTypeRange="+row.educationTypeRange;
	    			result+="&professionRange="+row.professionRange;
	    			result+="&paperStyle="+row.paperStyle;
	    			result+="&examinationName="+row.examinationName;
	    			result+="&examinationPlace="+row.examinationPlace;
	    			result+="&examinationSubject="+row.examinationSubject;
	    			result+="&isStart="+row.isStart;
	    			result+="&othersRange="+row.othersRange;
	    			result+="&remark="+row.remark;
	    			result+="&errorMsg="+row.errMsg;
	    		}
	    	}  
			return result;
	    }
	  
	 function generateParam2(){
	    	var rows=$('#fileImportGrid').datagrid('getRows');
			return rows;
	    }
	    
	    function saveDnxx(dates){
	    	var date_list  =JSON.stringify(dates);
	    	
	    	$.ajax({
		   		url:'<%=request.getContextPath()%>/bgEnterprisePlaceInfo/saveImportPostInfo',
		   		type: "POST",
	            //data: JSON.stringify(dates),
	            data:{date:date_list},
	            //contentType: "application/json;charset=utf-8",
		   	    success: function(data) {
		   	    	$.messager.progress('close');
		   	    	result=$.parseJSON(data);
					if(result.flag){
					$.messager.alert('系统提示',result.msg,'info');
					$('#archiveImportDialog').dialog('close');
					//$('#daxxGrid').datagrid('reload');
					}else{
					 $.messager.alert('系统提示',result.msg,'info');
					}
		   	 },
		   	    error: function() {
		   	    	$.messager.progress('close');
		   	        alert('服务器请求异常!');
		   	    	//请求出错处理
		   	    }
		   	});
	    }
	    
	  //导出模板
		 function archiveExport(){
			var url= "<%=request.getContextPath()%>/bgEnterprisePlaceInfo/exportModel";
		    window.location.href= url; 
		 }
    </script>


<body style="margin: 1px;">

<div id="cc" class="easyui-layout" data-options="fit:true,border: false">
    <!--
    <div data-options="region:'west',title:'岗位列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>


    </div>
	-->
	<div data-options="region:'north',border:false" style="padding:5px">
	    <table>
		   <tr>
		   	   <td>活动名称:</td>
			   <td>
			   <select id="activityCode1" name="activityCode1" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:160px">
			   </select>
			   </td>
		       <td>岗位名称：</td>
			   <td><input id="selectPostName" name="selectPostName" class="easyui-textbox" size="20" /></td>
			   <td>来源:</td>
			   <td>
			   <select id="selectSource" name="selectSource" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:160px">
			      <option value="3">所有</option>
				  <option value="0">内部创建</option>
				  <option value="1">外部注册</option>
				  <option value="2">数据采集</option>
			   </select>
			   </td>
			   <td>有效性：</td>
			   <td>
			   <select id="selectIsValid" name="selectIsValid" class="easyui-combobox" data-options="editable:false,panelHeight:null" style="width:150px" />
			      <option value="2">所有</option>
			      <option value="0">无效</option>
				  <option value="1">有效</option>
			   </select>
			   </td>
			   <td>录入时间：</td>
			   <td><input id="selectAddtime" name="selectAddtime" class="easyui-datebox" size="20" /></td>
			   <td><a  onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
			   <td><a  onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">重置</a></td>
		   </tr>
		</table>
	</div>
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
    <a onclick="addPost()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    <a onclick="updatePost('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a>
    <a onclick="deletePost('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
     <a onclick="archiveImport()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" >导入文件</a>
     <a onclick="archiveExport()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">导出模板</a>
   </div>
    <div data-options="region:'center',title:'岗位管理',border:false" style="">
        <table id="fpGrid"></table>
    </div>
</div>



<div id="addPostDialog"></div>
<div id="bkgwglInfo"></div>
<div id="archiveImportDialog"></div>
<div id="baseFormImportDialog"></div>

</body>
</html>
