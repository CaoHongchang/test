<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>人员信息采集列表</title>

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
	              {field:'SEX',title:'性别',width:100,align:'center',
	                formatter: function(value,row,index){
	      	    	  if(value==0){
	      	    		return "女";
	          	      }else if(value==1){
	          	    	return "男";
	              	  }else{
	              	  return value;
	              	  }
	   				}  
	              },    
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
	      				 return  " <a href='#' style='color: blue;' onclick='editFuc();' >修改<a>"
			      				 +" <a href='#' style='color: blue;' onclick='delFuc();'>删除</a>";
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
			     "key":key
			    };
	    $("#cjxxGrid").datagrid("load",param);
    }
 
 
</script>


<body style="margin: 1px;">
 

<div id="tb">
	<div id="cjxxTool"  style="background-color:#FFFFFF;">
	 <div>
	    <input type="text"  class="easyui-textbox"  
	        name="key" id="key" value="输入姓名或身份证号"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a>
	</div>
	</div>

</div>
<div>
<table id="cjxxGrid"></table>  
</div>

</body>
</html>
