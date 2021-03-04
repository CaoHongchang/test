<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>专家导入</title>

<body>
<script type="text/javascript">

function searchZjFun(){
 var r = $("#searchZjForm").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}
	
 var param=$("#searchZjForm").serializeArray();
 queryzj(JSON.stringify(param));
}
function queryzj(param){

   //专家
    $('#zjszGrid').datagrid({    
    url:basePath+"zcsb/randomExpertActivityInfos", 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
//	height: 1800,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	queryParams: {
		param: param
		
	},  
	onLoadSuccess: function (data) {debugger;
	        var pro_type=$('#pro_type').textbox('getValue');
	        var amount=$('#amount').textbox('getValue');
	        if(data.rows.length>0)
               $.messager.alert('提示',"成功抽取'"+pro_type+"'专业专家'"+data.rows.length+"'名",'info');
	        else
	        	$.messager.alert('提示',"未找到符合条件的专家信息",'info');
    },
    columns:[[    
        	
        {field:'businessId',title:'活动编码',align:'center',width: $(this).width() *0.15},
        {field:'pnum',title:'身份证',align:'center',width: $(this).width() *0.25},
        {field:'name',title:'专家',align:'center',width: $(this).width() *0.25}
        
        ]]    
     });  
	var pager = $('#zjszGrid').datagrid('getPager');
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
	

    } //loadEnd


 //导出excel
 function exportZjszFuc(){
    var data = $('#zjszGrid').datagrid("getData");//所有的全部数据
    if(data.rows.length>0){
      var ids=''; 
      for(var i = 0; i < data.rows.length; i++){
           if(i==0)
               ids=data.rows[i].id;
           else    
               ids+=','+data.rows[i].id;
      }
       debugger;
       window.location.href=basePath+"zcsb/zjszExport?ids="+ids;
   }else{
       $.messager.alert('提示',"未找到符合条件的专家信息，不能导出",'info');
   }
} 




</script>
<form id="searchZjForm" method="post"> 
   <table class="tableSearch">
             <tr>
		      <td class="left">专业类型:</td>
		      <td class="right"><input id ="pro_type" name="pro_type"  class="easyui-textbox"  size="20" data-options="required:true,validType:['length[0,50]']" style="height:22px"></td>
		      <td class="left">数量:</td>
		      <td class="right"><input id ="amount" name="amount"   class="easyui-textbox"  size="20" data-options="required:true,validType:['integer[]','length[0,3]']" style="height:22px"></td>
		     
		      <td class="right"></td>
		       <td class="left">
		       <a onclick="searchZjFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">确定</a>
		       </td>
		      <td class="right">
		      	<a onclick="exportZjszFuc();" class="easyui-linkbutton" style="width:160px" data-options="iconCls:'',plain:false">导出Excel</a>
		      </td>
		      </tr>
		      
            </table>
            </form>
      <table id="zjszGrid" ></table> 
	

</body>

</html>
