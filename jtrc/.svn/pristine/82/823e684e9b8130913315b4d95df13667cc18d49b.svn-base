<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>
   <title>历史党费缴至导入</title>
</head>

<body>
	<form id="fm" method="post">
		<div data-options="region:'center',border:false" style="">
	         <div id="lsdfjzTool"  style="background-color:#FFFFFF;">
	            <a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	            <!--<a onclick="append()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>-->
			</div>
			<div>
			   <table id="lsdfjzGrid"></table>  
			</div>
	    </div>   
	</form> 
	<script type="text/javascript">
	$(function(){
        dfjzList();
	});

	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true;}
		if ($('#lsdfjzGrid').datagrid('validateRow', editIndex)){
			$('#lsdfjzGrid').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}

	function dfjzList(){
		 $('#lsdfjzGrid').datagrid( {
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
			remoteSort : false,
			nowrap:false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'pnum',title:'身份证',width:$(this).width() * 0.01,  editor:{type: 'textbox',options:{required:true,validType:'idcard[]'}}},    
	            {field:'hisDate',title:'历史党费缴至',width:$(this).width() * 0.01,  editor:{type: 'numberbox',options:{required:true,validType:'length[6,6]'}}},    
	            {field:'errM',title:'错误信息',width:$(this).width() * 0.01} 
	        ]]
		});
			 		
    }

	function del(){
    	$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		var rows = $('#lsdfjzGrid').datagrid("getSelections");      
	       	 var copyRows = [];        
	       	 for ( var j= 0; j < rows.length; j++) {
	           	 copyRows.push(rows[j]);        						
            }     
            for(var i =0;i<copyRows.length;i++){                
                var index = $('#lsdfjzGrid').datagrid('getRowIndex',copyRows[i]);            
                $('#lsdfjzGrid').datagrid('deleteRow',index);         
            }
		});  
	}
	/*
    function append(){
		if (endEditing()){
			$('#lsdfjzGrid').datagrid('appendRow',{status:'P'});
			editIndex = $('#lsdfjzGrid').datagrid('getRows').length-1;
			$('#lsdfjzGrid').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
	}
    */
    function onDblClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#lsdfjzGrid').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#lsdfjzGrid').datagrid('selectRow', editIndex);
			}
		}
	}
	</script>
</body>

</html>

