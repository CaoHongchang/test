<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>

<html>
  <head>

  </head>
  <script type="text/javascript">
     var containError=false; 
     $(function(){
		  var pager = $('#daxxGrid').datagrid('getPager');
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
	 //导入数据
	 function archiveImport(){
		 $("#baseFormImportDialog").dialog({
			title:'导入文件',
            href:'../dadr/baseFormImport.jsp',
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
							title:'档案导入',
							href:'../dadr/archiveImport.jsp',
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
										$.messager.confirm('确定导入数据','确定导入用户档案吗？',function(flag){
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
											  /* $.post('../archive/saveImportUserInfos',result,function(result){
												result=$.parseJSON(result);
												if(result.flag){
												$.messager.alert('系统提示',result.msg,'info');
												$('#archiveImportDialog').dialog('close');
												$('#daxxGrid').datagrid('reload');
												}else{
												 $.messager.alert('系统提示',result.msg,'info');
												}
												
										});   */ 
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
	 //导出模板
	 function archiveExport(){
		var url= "<%=request.getContextPath()%>/archive/exportModel";
	    window.location.href= url; 
	 }
	 //查询
	 function selectSubmit(){
	
		 var obj=new Object();
		 var params=$("#searchForm").serializeArray();
		 $.each(params,function(index,value){
			obj[value.name]=value.value;
		 });
		 $("#daxxGrid").datagrid('load',obj);
	 }
	 //重置
	 function resetSubmit(){
		$('#searchForm').form('clear');
		 selectSubmit();
	 }
	 
	  function  uploadFile(func){
		  var fileName=$("#importFile").filebox('getValue');
		  if(fileName!=""){   
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx" || d1==".xls"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: "<%=request.getContextPath()%>/archive/importUserInfo",
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
				result+="&name="+row.name;
    			result+="&sex="+row.sex;
    			result+="&pnum="+row.pnum;
    			result+="&birthDate="+row.birthDate;
    			result+="&school="+row.school;
    			result+="&major="+row.major;
    			result+="&graduationTime="+row.graduationTime;
    			result+="&dpno="+row.dpno;
    			result+="&DState="+row.DState;
    			result+="&ZDate="+row.ZDate;
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
	   		url:'<%=request.getContextPath()%>/archive/saveImportUserInfos2',
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
				$('#daxxGrid').datagrid('reload');
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
    
    
  </script>
  <body style="margin:1px">
      <div id="zcpshdTool" style="background-color:#FFFFFF">
	      <a onclick="archiveImport()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" >导入文件</a>
		  <a onclick="archiveExport()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">导出模板</a>
	  </div>
	  <div class="easyui-layout" data-options="fit:true,border:false">
	       <div  data-options="region:'north',border:false" style="padding:5px">
	          <form type="post" id="searchForm">
		        <table>
				    <tr>
						<td><label>档案号：</label></td>
						<td><input class="easyui-textbox" id="archiveCode" name="archiveCode" /></td>
						<td><label style="margin-left:10px">身份证号：</label></td>
						<td><input class="easyui-textbox" id="idCode" name="idCode"/></td>
						<td>姓名：</td>
						<td><input class="easyui-textbox" id="searchName" name="searchName"/></td>
						<td>毕业学校：</td>
						<td><input class="easyui-textbox" id="searchSchool" name="searchSchool"/></td>
					
					</tr>
					<tr>
					 	<td>专业：</td>
						<td><input class="easyui-textbox" id="searchMajor" name="searchMajor"/></td>
						<td>毕业时间</td>
						<td><input class="easyui-datebox" id="searchGraduationTime" name="searchGraduationTime"/></td>
						<td>
						     <a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left:10px">查询</a>
							 <a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left:10px">重置</a>
						</td>
					</tr>
				</table>
				</form>
		   </div>
		   <div data-options="region:'center',title:'档案信息导入',border:false">
		   <table class="easyui-datagrid" url="../archive/listUserInfo"  rownumbers="false" fitColumns="true" singleSelect="true" pagination="true" height="90%" toolbar="#zcpshdTool" pageSize="10" pageList="[10,20,30,40]" id="daxxGrid">
		        <thead>
					<tr>
						<th data-options="field:'id',checkbox:true,center:true">选择</th>
						<th data-options="field:'dpno',width:20">档案号</th>
						<th data-options="field:'name',width:10">姓名</th>
						<th data-options="field:'pnum',width:40">身份证号</th>
						<th data-options="field:'sex',width:10">性别</th>
						<th data-options="field:'school',width:10">毕业院校</th>
						<th data-options="field:'major',width:10">专业</th>
						<th data-options="field:'graduationTime1',width:10">毕业时间</th>
						<th data-options="field:'dState',width:10">档案状态</th>
						<th data-options="field:'birthDate1',width:10">出生年月</th>
						<th data-options="field:'zDate1',width:10">转入时间</th>
					</tr>
				</thead>
		   </table>
		   </div>
	  </div>
	  <div id="archiveImportDialog">
	  </div>
	  <div id="baseFormImportDialog">
	  </div>
  </body>
</html>
