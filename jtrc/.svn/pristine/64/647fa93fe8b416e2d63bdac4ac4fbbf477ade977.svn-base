<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>党费基准导入</title>
</head>

<body>
	<form id="fm" method="post">
		<div data-options="region:'center',border:false" style="">
	         <div id="dfjjTool"  style="background-color:#FFFFFF;">
	            <a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	           <!-- <a onclick="append()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>-->
			</div>
			<div>
			   <table id="dfjzGrid"></table>  
			</div>
	    </div>   
	</form> 
	<script type="text/javascript">
	$(function(){
        dfjzList();
	});
	
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dfjzGrid').datagrid('validateRow', editIndex)){
			$('#dfjzGrid').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function dfjzList(){
		var dg = $('#dfjzGrid').datagrid( {
		    url    :'',
			border : true,
			rownumbers:true,
			singleSelect:false,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			onDblClickRow: onDblClickRow,
			method: 'get',
			nowrap:false,
			remoteSort : false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'pnum',title:'身份证',width:180,  editor:{type: 'textbox',options:{required:true,validType:'idcard[]'}}},    
	            {field:'pyear',title:'年份',width:80,editor:{type: 'numberbox',options:{required:true,validType:'length[4,4]'}}},    
	            {field:'baseM',title:'缴费基准',width:80,editor:{type: 'numberbox',options:{required:true,min:0}}},    
	            {field:'errM',title:'错误信息',width:180,editor: 'textbox'} 
	        ]]
		});
			 		
    }

    function removeit(){
    	var row = $('#dfjzGrid').datagrid('getSelections');  
    	if (row.length>0) {  
    		$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		    $('#dfjzGrid').datagrid('reload');  
    		});  
    	}  
    		    	
    }

    function del(){
    	$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		var rows = $('#dfjzGrid').datagrid("getSelections");      
	       	 var copyRows = [];        
	       	 for ( var j= 0; j < rows.length; j++) {
	           	 copyRows.push(rows[j]);        						
            }     
            for(var i =0;i<copyRows.length;i++){                
                var index = $('#dfjzGrid').datagrid('getRowIndex',copyRows[i]);            
                $('#dfjzGrid').datagrid('deleteRow',index);         
            }
		});  
		//if (editIndex == undefined){return}
		//$('#dfjzGrid').datagrid('cancelEdit', editIndex)
		//		.datagrid('deleteRow', editIndex);
		//editIndex = undefined;
	}
/*
    function append(){
		if (endEditing()){
			$('#dfjzGrid').datagrid('appendRow',{status:'P'});
			editIndex = $('#dfjzGrid').datagrid('getRows').length-1;
			$('#dfjzGrid').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
	}
*/
    function onDblClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#dfjzGrid').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#dfjzGrid').datagrid('selectRow', editIndex);
			}
		}
	}
	</script>
</body>

</html>

