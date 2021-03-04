<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>
<html>
<head>
<title>党员新增</title>

<body>

	<form id="fm" method="post">

    <div id="aa" class="easyui-accordion" style="height:300px;">   
       <div title="基本信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">党员编码</td>
			      <td class="right"><input id ="pno" name ="pno" class="easyui-textbox"  size="20" data-options="required:true" style="height:22px"></td>
			      <td class="left">是否在中心</td>
			      <td class="right">
				      <select id="is_in" class="easyui-combobox" name="is_in" style="width:135px;" editable ="false">   
					      <option value="">---请选择---</option>
					      <option value="1" selected="selected">是</option>   
					      <option value="0">否</option>
					  </select>
				  </td>
		      </tr>
		      <tr>
			      <td class="left">党员姓名</td>
			      <td class="right"><input class="easyui-textbox" id="name" name="name"  size="20" data-options="required:true" style="height:22px"></td>
		      	  <td class="left">身份证号码</td>
			      <td class="right"><input class="easyui-textbox"  id="pnum" name="pnum"  size="20" data-options="required:true" style="height:22px"></td>
			  </tr>
		      <tr>
			      <td class="left">性别</td>
			      <td class="right">
				       <select id="sex" class="easyui-combobox" name="sex" style="width:135px;" editable ="false">   
				            <option value="">---请选择---</option>
					   		<option value="1">男</option>   
					   		<option value="0">女</option> 
					   </select>
			      </td>
			      <td class="left">籍贯</td>
			      <td class="right"> 
			       	   <input class="easyui-textbox"  id="jg_name" name="jg_name"  size="20" style="height:22px">
			      </td>
		      </tr>
		      <tr>
		          <td class="left">出生年月</td>
			      <td class="right"><input class="easyui-datebox"  id="birth_date" name="birth_date" size="20"  style="height:22px"></td>
			      <td class="left">学历</td>
			      <td class="right">
				       <select id="degree" class="easyui-combobox" name="degree" style="width:135px;" editable ="false">   
					   		<option value="本科">本科</option>   
					   </select>
			      </td>
		      </tr>
		      <tr>
			       <td class="left">工作地</td>
				      <td class="right"> 
				           <input class="easyui-textbox"  id="da_id" name="da_id" size="20"  style="height:22px">
				      </td>
			      <td class="left">工作单位</td>
			      <td class="right"><input class="easyui-textbox" id="company" name="company" size="20" style="height:22px"></td>
		      </tr>
		      <tr>
			      <td class="left">预/正</td>
			      <td class="right">
					   <select id="is_state" class="easyui-combobox" name="is_state" style="width:135px;" editable ="false">   
					   		<option value="">---请选择---</option>   
					   		<option value="0">预</option>
					   		<option value="1">正</option>
					   </select>
				  </td>
			      <td class="left">入党时间</td>
			      <td class="right"><input class="easyui-datebox"  data-options="required:true" id="party_date" name="party_date" size="20" style="height:22px"></td>
		      </tr>
		      <tr>
			      <td class="left">转正时间</td>
			      <td class="right"><input class="easyui-datebox"  id="full_date" name="full_date" size="20" style="height:22px"></td>
			      <td class="left">入党介绍人1</td>
			      <td class="right"><input class="easyui-textbox"  id="j_name1" name="j_name1" size="20" style="height:22px"></td>
		      </tr>
		      
		       <tr>
		     	  <td class="left">入党介绍人2</td>
			      <td class="right"><input class="easyui-textbox"   id="j_name2" name="j_name2" size="20" style="height:22px"></td>
			      <td class="left">历史党费缴至</td>
			      <td class="right"><input class="easyui-datebox" id="his_date" name="his_date" size="20" style="height:22px;"></td>
		      </tr>
      </table>  
      </div>  
   </div>  
   <div id="aa" class="easyui-accordion" style="height:130px;">  
      <div title="联系方式" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">手机号</td>
			      <td class="right"><input id ="tel" name="tel" class="easyui-numberbox" data-options="required:true,validType:['phoneNum[]']" size="20" style="height:22px"></td>
			      <td class="left">QQ号</td>
			      <td class="right"><input id ="qq" name="qq" class="easyui-numberbox"  size="20" style="height:22px"></td>
		      </tr>
		      <tr>
			      <td class="left">微信号</td>
			      <td class="right"><input class="easyui-textbox"  id ="wx" name="wx"  size="20" style="height:22px"></td>
		      	  <td class="left"></td>
			      </tr>
		      <tr>
      	</table>  
      </div> 
   </div> 
   <div id="aa" class="easyui-accordion" style="height:150px;">  
   <div title="材料信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <table class="table2">
		      <tr>
			      <td class="left">入党申请书</td>
			      <td class="right">
			     	   <select id="sq_status" class="easyui-combobox" name="sq_status" style="width:135px;" editable ="false">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>  
					   </select>
			      </td>
			      <td class="left">入党志愿书</td>
			      <td class="right">
			     	   <select id="rd_status" class="easyui-combobox" name="rd_status" style="width:135px;" editable ="false">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>     
					   </select>
			      </td>
		      </tr>
		      <tr>
			      <td class="left">政治审查材料</td>
			      <td class="right">
			     	   <select id="zz_mtr" class="easyui-combobox" name="zz_mtr" style="width:135px;" editable ="false">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>  
					   </select>
			      </td>
			      <td class="left">培养教育考察材料</td>
			      <td class="right">
			     	   <select id="py_mtr" class="easyui-combobox" name="py_mtr" style="width:135px;" editable ="false">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option>
					   </select>
			      </td>
		      </tr>
		      <tr>
			      <td class="left">转正申请书</td>
			      <td class="right">
			     	   <select id="full_rq" name="full_rq" class="easyui-combobox" name="userPartyInfoBean.full_rq" style="width:135px;" editable ="false">   
					   		<option value="1">有</option>   
					   		<option value="0">无</option> 
					   </select>
			      </td>
			      <td class="left"></td>
			      <td class="right"></td>
		      </tr>
      	</table>  
      </div> 
      </div> 
      
      <div id="aa" class="easyui-accordion" style="height:200px;">  
      <div title="转入信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
          <div id="zrxxTool"  style="background-color:#FFFFFF;">
	            <a onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	            <a onclick="append()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
	            <a onclick="accept()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
		  </div>
		  <div>
	          <table id="zrxxdg" class="easyui-datagrid" >
			  </table>
		  </div>
      </div>
      </div>
      
      <div id="aa" class="easyui-accordion" style="height:200px;">  
      <div title="转出信息" data-options="iconCls:'icon-help',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
         <div id="zcxxTool"  style="background-color:#FFFFFF;">
	            <a onclick="delZc()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	            <a onclick="appendZc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
	            <a onclick="acceptZc()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
		  </div>
		  <div>
	          <table id="zcxxdg" class="easyui-datagrid" >
			  </table>
		  </div>
      </div>
      </div>
    </form> 
    <script type="text/javascript">
	$(function(){
        drzsList();
        drzsListZc();
	});

	 $.ajax({  
			type: "post",  
			cache: false,  
			url: "../userPartyInfoTrol/getNextPno",  
			data: "",  
			success: function (result) {  
			   $('#pno').textbox('setValue',"PM" + result);
			}  
		});  

	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#zrxxdg').datagrid('validateRow', editIndex)){
			$('#zrxxdg').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}

	function drzsList(){
		var dg = $('#zrxxdg').datagrid( {
			url    :'',
			border : true,
			rownumbers:true,
			singleSelect:true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			onDblClickRow: onDblClickRow,
			method: 'get',
			remoteSort : false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'in_date',name:'code1',title:'转入时间',width:240,  editor:{type: 'datebox'}},    
	            {field:'zpno',name:'name1',title:'组织介绍信编码',width:240,  editor:{type: 'textbox'}},    
	            {field:'in_place',name:'name2',title:'转入地',width:240,  editor:{type: 'textbox'}}
	        ]]
		});
			 		
    }

	function del(){
    	$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		var rows = $('#zrxxdg').datagrid("getSelections");      
	       	var copyRows = [];        
	       	for ( var j= 0; j < rows.length; j++) {
	           	 copyRows.push(rows[j]);        						
            }     
            for(var i =0;i<copyRows.length;i++){                
                var index = $('#zrxxdg').datagrid('getRowIndex',copyRows[i]);            
                $('#zrxxdg').datagrid('deleteRow',index);         
            }
		});  
	}
    function append(){
		if (endEditing()){
			$('#zrxxdg').datagrid('appendRow',{status:'P'});
			editIndex = $('#zrxxdg').datagrid('getRows').length-1;
			$('#zrxxdg').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
	}

    function accept(){
		if (endEditing()){
			$('#zrxxdg').datagrid('acceptChanges');
		}
	}

    function onDblClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#zrxxdg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#zrxxdg').datagrid('selectRow', editIndex);
			}
		}
	}


    var editIndexZc = undefined;
	function endEditingZc(){
		if (editIndexZc == undefined){return true}
		if ($('#zcxxdg').datagrid('validateRow', editIndexZc)){
			$('#zcxxdg').datagrid('endEdit', editIndexZc);
			editIndexZc = undefined;
			return true;
		} else {
			return false;
		}
	}

	function drzsListZc(){
		var dg = $('#zcxxdg').datagrid( {
			url    :'',
			border : true,
			rownumbers:true,
			singleSelect:true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			onDblClickRow: onDblClickRowZc,
			method: 'get',
			remoteSort : false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'in_date',name:'code1',title:'转出时间',width:240,  editor:{type: 'datebox'}},    
	            {field:'zpno',name:'name1',title:'组织介绍信编码',width:240,  editor:{type: 'textbox'}},    
	            {field:'in_place',name:'name2',title:'转出地',width:240,  editor:{type: 'textbox'}}
	        ]]
		});
			 		
    }

	function delZc(){
    	$.messager.confirm('Confirm', '是否删除选中数据?', function(r) {  
    		var rows = $('#zcxxdg').datagrid("getSelections");      
	       	var copyRows = [];        
	       	for ( var j= 0; j < rows.length; j++) {
	           	 copyRows.push(rows[j]);        						
            }     
            for(var i =0;i<copyRows.length;i++){                
                var index = $('#zcxxdg').datagrid('getRowIndex',copyRows[i]);            
                $('#zcxxdg').datagrid('deleteRow',index);         
            }
		});  
	}
    function appendZc(){
		if (endEditingZc()){
			$('#zcxxdg').datagrid('appendRow',{status:'P'});
			editIndexZc = $('#zcxxdg').datagrid('getRows').length-1;
			$('#zcxxdg').datagrid('selectRow', editIndexZc)
					.datagrid('beginEdit', editIndexZc);
		}
	}
    function acceptZc(){
		if (endEditingZc()){
			$('#zcxxdg').datagrid('acceptChanges');
		}
	}

    function onDblClickRowZc(index){
		if (editIndexZc != index){
			if (endEditingZc()){
				$('#zcxxdg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndexZc = index;
			} else {
				$('#zcxxdg').datagrid('selectRow', editIndexZc);
			}
		}
	}
	</script>

</body>

</html>
