<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">
    <script type="text/javascript">
    $(function(){

            $('#zxflGrid').tree({
                url:'../zxgl/listTypeInfoTree',
                checkbox:false,
                onLoadSuccess:function(node, data){
			    },
//                data: [{
//                    text: 'Item1',
//                    id:"001",
//                    state: 'closed',
//                    children: [{
//                        id:"1",
//                        text: 'Item11'
//                    },{
//                        id:"2",
//                        text: 'Item12'
//                    }]
//                },{
//                    id:"3",
//                    text: 'Item2'
//                }],
                onClick:function(node){
                	clickTree(node["id"]);
                	
                }
            });

            function clickTree(id){
                $('#zxGrid').datagrid('load',{
                    pid:id
                });
			}
            
           	
            
            $('#zxGrid').datagrid({
                url:'<%=request.getContextPath()%>/zxgl/listMsgInfo',
                border:true,
                pageSize:10,
                pageList:[10,20,30,40],
                striped: true,
				pagination:true,
                collapsible:true,
                fitColumns:true,
                height:'90%',
                toolbar: '#zcpshdTool',
                sortName: '',
                sortOrder: 'desc',
                remoteSort: false,
                columns:[[
                    {field:'id1',title:'选择',checkbox:true,align:'center'},
                    {field:'orderNo',title:'序号',width : $(this).width() * 0.1,align:'center'},
                    {field:'typeId',title:'资讯分类',width : $(this).width() * 0.1,align:'center'},
                    {field:'msgType',title:'资讯类型',formatter:function(value,row,index){if(value=='1') return '信息展示';else if(value=='2') return '新闻';else if(value=='3') return '链接';else if(value=='4') return '下载';},width : $(this).width() * 0.2,align:'center'},
                    {field:'publishDate',title:'发布时间',width : $(this).width() * 0.2,align:'center'},
                    {field:'creator',title:'发布者',width : $(this).width() * 0.1,align:'center'},
                    {field:'title',title:'标题',width : $(this).width() * 0.2,align:'center'},
				    {field:'_operator',title:'操作',width:$(this).width()*0.2,align:'center',formatter:function(value,row,index){
				   
						return  "<a  href=\"javascript:update("+row.id1+","+index+")\" style=\"color:blue\">修改</a>&nbsp;&nbsp;&nbsp;"
						  +"<a href=\"javascript:del("+row.id1+")\" style=\"color:blue\">删除</a>";
					}}

                ]]
            });
            var pager = $('#zxGrid').datagrid('getPager');
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
            $('#addMsgDialog').dialog({
                title: '资讯新增',
                width: 800,
                height: 500,
                closed: false,
                cache: false,
                href: '../zxgl/zxAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                       
                        var title=$("#title").textbox("getValue");
    					if(title==""){
    						$.messager.alert("系统提示","资讯标题不能为空");
    						return false;
    					}
    					if(title.length>100){
    						$.messager.alert("系统提示","资讯标题长度不超过100位");
    						return false;
    					}
    					
    					var creator=$("#creator").textbox("getValue");
     					if(creator==""){
     						$.messager.alert("系统提示","发布人不能为空");
     						return false;
     					}
     					if(creator.length>20){
     						$.messager.alert("系统提示","发布人长度不超过20位");
     						return false;
     					}
     					
     					var departm=$("#departm").textbox("getValue");
     					if(departm.length>30){
     						$.messager.alert("系统提示","部门长度不超过30位");
     						return false;
     					}
     					
    					
                        if(result){
								//if(judgeFile()){
									$.messager.confirm('确定新增','确定新增此资讯吗？',function(flag){
										if(flag){
										 var fjParam= $("#fjlbGrid").datagrid("getData");
										 if(fjParam.rows.length>0){
										 fjParam=JSON.stringify(fjParam.rows); 
										 }else{
										 fjParam=null;
										 }
										var typeId=$('#typeId').combotree('tree').tree('getSelected').id;
											$('#fm').form('submit',{
												url:'../zxgl/insertMsgInfo',
												queryParams:{
													typeIdId:typeId,
													fjParam: fjParam
												},
												success:function(data){
												//alert(typeId);
												
													if(data==1){
														var node = $('#zxflGrid').tree('find', typeId);
												         $('#addMsgDialog').dialog('close');
														$('#zxflGrid').tree('select', node.target);
														$('#zxGrid').datagrid('load',{
										                    pid:typeId-0
										                });
												        //$('#zxGrid').datagrid('reload'); 
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
                        $('#addMsgDialog').dialog('close');
                    }
                }],
                onLoad:function(){debugger;
                	$('#orderNo').numberbox('setValue','');
                	$('#typeId').combotree('tree').tree({
    					onLoadSuccess:function(node,data){
    						
    					},
    					onSelect:function(row){
    						getNo(row.id);
    					}
    				});
                	
                	
	                $('#creator').textbox('setValue','<%=(String)request.getSession().getAttribute("userName")%>');
	 	           $('#departm').textbox('setValue',getDepartment());
                },
                iconCls: 'icon-save'

            });
        }
        
        function getNo(typeId){
        	$.ajax({
			   url:"../zxgl/selectMaxSeqByTypeId?typeInfoId="+typeId,
			   type:"get",
			   dataType:"json",
			   cache:false,
			   success:function(resJson){
			   		if(resJson.result_code==1){
					   $("#orderNo").numberbox('setValue',resJson.result_data-0);//赋值
			   		}else{
			   			$.messager.alert('系统提示',resJson.result_msg);
			   		}
			   },
			   error:function(error){
				   $.messager.alert('系统提示',"服务器异常");
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
                href: '../zxgl/zxlbUpdateNo.jsp',
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
		
		function update(id,index){
		    if(id){
		     var row=$('#zxGrid').datagrid('getRows')[index];
		     
            $('#addMsgDialog').dialog({
                title: '资讯修改',
                width: 800,
                height: 500,
                closed: false,
                cache: false,
                href: '../zxgl/zxAdd.jsp',
                modal: true,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var result = $("#fm").form("validate");
                        
                        var title=$("#title").textbox("getValue");
    					if(title==""){
    						$.messager.alert("系统提示","资讯标题不能为空");
    						return false;
    					}
    					if(title.length>100){
    						$.messager.alert("系统提示","资讯标题长度不超过100位");
    						return false;
    					}
    					
    					var creator=$("#creator").textbox("getValue");
     					if(creator==""){
     						$.messager.alert("系统提示","发布人不能为空");
     						return false;
     					}
     					if(creator.length>20){
     						$.messager.alert("系统提示","发布人长度不超过20位");
     						return false;
     					}
     					
     					var departm=$("#departm").textbox("getValue");
     					if(departm.length>30){
     						$.messager.alert("系统提示","部门长度不超过30位");
     						return false;
     					}
     					
                        if(result){
							//if(judgeFile()){
								$.messager.confirm('确定修改','确定修改此资讯吗？',function(flag){
									if(flag){
									
									var fjParam= $("#fjlbGrid").datagrid("getData");
										 if(fjParam.rows.length>0){
										 fjParam=JSON.stringify(fjParam.rows); 
										 }else{
										 fjParam=null;
										 }
									
									
										var typeId = $('#typeId').combotree('tree').tree('getSelected').id;
										$('#fm').form('submit',{
											url:'../zxgl/updateMsgInfo',
											queryParams:{
												id:id,
												typeIdId:typeId,
												fjParam:fjParam
											},
											success:function(data){
												if(data==1){
													$('#addMsgDialog').dialog('close');
													var node = $('#zxflGrid').tree('find', typeId);
													$('#zxflGrid').tree('select', node.target);
													$('#zxGrid').datagrid('load',{
									                    pid:typeId-0
									                });
											        //$('#zxGrid').datagrid('reload');
											        
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
                        $('#addMsgDialog').dialog('close');
                    }
                }],
                onLoad:function(){debugger
                fjListFuc(id);
               $('#aid').val(id);
              
                $('#orderNo').numberbox('setValue',row.orderNo);
				$('#title').textbox('setValue',row.title);

				if(row.url!=''&&row.url!=undefined)
				$('#url').textbox('setValue',row.url);
				
					     
			   $('#creator').textbox('setValue',row.creator);
		
				$('#msgType').combobox('setValue',row.msgType);
				$('#publishDate').datetimebox('setValue',row.publishDate);
           
                $('#content').text(row.html);
                var departm= getDepartment(id);
 	           $('#departm').textbox('setValue',departm);
				$('#typeId').combotree('tree').tree({
					onLoadSuccess:function(node,data){
						var node=$('#typeId').combotree('tree').tree('find',row.typeIdId);
					
						$('#typeId').combotree('tree').tree('select',node.target);
						$('#typeId').combotree('setValue',node);
					}
				});
				$('#file').filebox('setValue',row.other);
                },
                iconCls: 'icon-save'

            });
            }else{
            	$.messager.alert('系统提示','请选择您要修改的资讯！','info');
            }
		}
		function del(id){
			var ids="";
			 if(''!=id){
				 ids=id;
			 }else {
				 ids=getSelectRowId();
			 }
			if(ids != ""){
	    	    $.messager.confirm('确定删除','确定删除此资讯吗？',function(flag){
	    	    	if(flag){
	    	    		$.ajax({  
	    					type: "post",  
	    					cache: false,  
	    					url: "../zxgl/deleteMsgInfo",  
	    					data: "ids=" + ids,  
	    					success: function (result) {  
	    					    if(result == 1){
	    							$.messager.alert('系统提示',"您已成功删除节点！");
	    							$('#zxGrid').datagrid('reload');  
	    						}else{
	    							$.messager.alert('系统提示',result);
	    						}
	    					}  
	    				});
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
		var rows = $('#zxGrid').datagrid('getSelections');  
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
	function judgeFile(){
		  
			var filename=$('#file').filebox('getValue');
			alert(filename);
			var suffix=filename.substring(filename.lastIndexOf("."),filename.length).toUpperCase();
			alert(suffix);
			//判断文件类型* PNG ，JPEG ，TIFF，ZIP、RAR、DOC、DOCX、XLS、XLSX
			var ftype=[".PNG",".JPEG",".TIFF",".ZIP",".JPG",".ZIP",".RAR",".DOC",".DOCX",".XLS","XLSX"];
			var flag=false;
			for(var i=0;i<ftype.length;i++){
				if(suffix==ftype[i]){
					flag=true;
					break;
				}
			}
			if(!flag){
				$.messager.alert('系统提示',"文件格式需为【PNG,JPG,JPEG,TIF,ZIP,RAR,DOC,DOCX,XLS,XLSX】");
			}else{
			     /*var filesize=files[0].size/1024/1024;
				if(filesize>10){
						$.messager.alert('系统提示',"文件大小不能大于10M");
					    flag=false;
				}*/
			}
			return flag;
	}
	function submitSelect(){
		$('#zxGrid').datagrid('load',{
					selectTitle:$('#selectTitle').textbox('getValue'),
					selectCreator:$('#selectCreator').textbox('getValue'),
					selectMsgType:$('#selectMsgType').combobox('getValue'),
					selectPublishDateStar:$('#selectPublishDateStar').datetimebox('getValue'),
					selectPublishDateEnd:$('#selectPublishDateEnd').datetimebox('getValue')       
		});
	}
	
	//获取部门信息
	function getDepartment(idd){
		var response="";
   if(idd=="" || idd==null || idd==undefined){
		var id=<%=sessionUserId%>
		var type="1";
   }
   else{
	   var id=idd;
	   var type="2";
   }
 	   //获取部门信息
	   $.ajax({
			url:'../zxgl/getDepartment',
			type:'post',
			data:{
				id:id,
				type:type
			},
			async:false,
			success:function(result){
				if(result.result_code==1){
					response= result.rows.department;
				}
			}
		});
 	   return response;
		}
    </script>


<body style="margin: 1px;">

<div class="easyui-layout"  data-options="fit:true,border:false">

    <div data-options="region:'north',border:false" style="padding:5px;">
	       <form id="selectForm" method="post">
	       <table>
            <tr>

                <td class="left" >资讯标题:</td>
                <td class="right"><input id ="selectTitle"   class="easyui-textbox"  size="20" name="selectTitle"></td>
				<td class="left" >发布人:</td>
                <td class="right"><input id ="selectCreator" class="easyui-textbox" size="20"  value="" name="selectCreator" ></td>
                <td class="left" >资讯类型:</td>
                <td class="right">
                    <select id="selectMsgType" class="easyui-combobox"  style="width: 150px" name="selectMsgType" data-options="editable:false,panelHeight:null">
					    <option value="0">所有</option>
                        <option value="1">信息展示</option>
                        <option value="2">新闻</option>
                        <option value="3">链接</option>
                        <option value="4">下载</option>
                    </select>
                </td>
				 <td class="left" >发布日期:</td>
                <td class="right">
                    <input id="selectPublishDateStar" class="easyui-datetimebox" name="selectPublishDateStar" >
                 	   到
                    <input id="selectPublishDateEnd" class="easyui-datetimebox" name="selectPublishDateEnd" >
                </td>
				<td><a  onclick="submitSelect()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a></td>
			</tr>
           
        </table>
		  </form> 
	</div>
	
    <div data-options="region:'west',title:'资讯分类列表',split:true,border:false" style="width:300px;">
       <ul id="zxflGrid" class="easyui-tree"></ul>


    </div>
     <div data-options="region:'center',title:'资讯列表',border:false" style="">
	    
	    <div id="zcpshdTool"  style="background-color:#FFFFFF;">

        <a onclick="addType()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
        <a onclick="update('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改</a>
        <a onclick="del('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
     
        <a onclick="updateNo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="display:none">修改序列</a>

      </div>  
	  
        <table id="zxGrid"></table>
	  
    </div> 
</div>



<div id="addMsgDialog"></div>
<div id="updateNo"></div>

</body>
</html>
