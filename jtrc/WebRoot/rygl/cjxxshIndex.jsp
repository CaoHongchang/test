<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>采集信息审核</title>

<script type="text/javascript">
	$(function(){
   
     $('#cjxxGrid').datagrid({    
	    url:'/jtrc/msgFromInfoTrol/queryMsgFromInfoList', 
		border:true,
		pageSize:20,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#cjxxTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,   
        columns:[[    
              {field:'id',title:'',checkbox:true,width:100,align:'center'},
              {field:'MSG_NAME',title:'最初信息来源',width:100,align:'center'},    
              {field:'NAME',title:'姓名',width:100,align:'center'},    
              {field:'PNUM',title:'身份证号',width:100,align:'center'},
              {field:'SEX',title:'性别',width:100,align:'center'},    
              {field:'PY',title:'是否党员',width:100,align:'center',
	    	    formatter: function(value,row,index){
      	    	  if(null != value && value != ""){
      	    		return "是";
          	      }else{
          	    	return "否";
              	  }
   				}   
 			  },    
              {field:'ZJ',title:'是否专家',width:100,align:'center',
	    	    formatter: function(value,row,index){
      	    	  if(null != value && value != ""){
      	    		return "是";
          	      }else{
          	    	return "否";
              	  }
   				}   
 			  },     
              {field:'IS_STATE',title:'审核状态',width:100,align:'center'},
              {title:'操作',field:'uid',width:100,align:'center',
      	    		formatter: function(value,row,index){
      				 return " <a href='#' style='color: blue;' onclick='viewFuc();'>查看</a>"
		      				 +" <a href='#' style='color: blue;' onclick='sh("+row.MID+");'>审核</a>";
      				}   
      			}
		    ]]    
		});  
		var pager = $('#cjxxGrid').datagrid('getPager');
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


	function searchUser(){

		var key = $("#key").val();
		if(key == "输入姓名或身份证号"){
			key = "";
	    }
		var param = {
			     "is_state":$("#is_state").combobox("getValue"),
			     "key":key
			    };
	    $("#cjxxGrid").datagrid("load",param);
    }

    function sh(id){
        if(id == ""){
        	var selectedRows = $("#cjxxGrid").datagrid('getSelections');
        	if(selectedRows.length == 0){
        		$.messager.alert('系统提示','请选择一条要审核的数据！');
        		return;
        	}
        	if(selectedRows.length > 1){
        		$.messager.alert('系统提示','审核操作只能针对一条记录！');
        		return;
        	}
        	var row = selectedRows[0];
        	if(row.IS_STATE == 1){
        		$.messager.alert('系统提示','您选择的数据已审核！');
        		return;
            }else{
            	$.ajax({  
               		type: "post",  
               		cache: false,  
               		url: "../msgFromInfoTrol/sh?id=" + row.MID,  
               		data: '',  
               		success: function (result) {  
               		    if(result == 1){
               			    alert("审核成功！");
               				//$.messager.alert('系统提示',"您已成功修改业务信息！");
               				//$('#ywEditInfo').dialog('close');
               				//window.location.href = window.location.href;
               				searchUser();
               			}else{
               				$.messager.alert('系统提示',result);
               			}
               		}  
               	});  
            }
        }else{
        	$.ajax({  
           		type: "post",  
           		cache: false,  
           		url: "../msgFromInfoTrol/sh?id=" + id,  
           		data: '',  
           		success: function (result) {  
           		    if(result == 1){
           			    alert("审核成功！");
           				//$.messager.alert('系统提示',"您已成功修改业务信息！");
           				//$('#ywEditInfo').dialog('close');
           				//window.location.href = window.location.href;
           				searchUser();
           			}else{
           				$.messager.alert('系统提示',result);
           			}
           		}  
           	});  
        }
    }
 
 
</script>


<body style="margin: 1px;">
 

<div id="tb">
	<div id="cjxxTool"  style="background-color:#FFFFFF;">
	 <div>
	   <select id="is_state" class="easyui-combobox" name="is_state" style="width:135px;">   
	      <option value="">请选择</option>  
	      <option value="0">未审核</option>  
	      <option value="1">已审核</option>  
	   </select>
	    <input type="text"  class="easyui-textbox"  
	        name="key" id="key" value="输入姓名或身份证号"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		<a onclick="sh('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核</a>
	</div>
	</div>

</div>
<div>
<table id="cjxxGrid"></table>  
</div>

</body>
</html>
