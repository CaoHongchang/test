<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>专家导入</title>

<body>
<script type="text/javascript">
		
  $(document).ready(function(){
               queryPro_type();
                $("#pro_type2").combobox({
               onChange: function (n,o) {
              // data.cause=="";
                var pro_type = $("#pro_type2").combobox('getValue')
                pro_type=encodeURI(pro_type);
               		$('#zjszGrid').datagrid('reload','/jtrc/userExpertInfoTrol/queryExpertUserListMore?pro_type='+pro_type);  
					}
               });
  })


function confirmdelete(){
var rows = $('#zjszGrid').datagrid('getChecked');
if (rows.length > 0) {
$.messager.confirm('提示框', '你确定要删除吗?',function(data){
	if(data){
		deleteRows();
	}
})
}
else
{
alert("请选择数据");
}
}
	function deleteRows() {
		//获取datalist中所有被选中的数据
		var rows = $('#zjszGrid').datagrid('getChecked');
		if (rows.length > 0) {
			var rowsLength = rows.length;
			//alert(rowsLength); //删除所有选中的行 
			for (var i = 0; i < rowsLength; i++) {
				var checkedRow = rows[i];
				var checkedRowIndex = $('#zjszGrid').datagrid('getRowIndex', checkedRow);
				$('#zjszGrid').datagrid('deleteRow', checkedRowIndex);
			}
		}
	}


  function queryPro_type(){
//活动编号
				$('#pro_type2').combobox({
					valueField : 'pro_type',
					textField : 'pro_type',
					url : basePath + 'userExpertInfoTrol/hdbhList?place='+"抽取",
				});

	}

function getEffected()
{
				var data = $('#zjszGrid').datagrid("getData");//所有的全部数据
    			if(data.rows.length>0){
     			var ids=''; 
      			for(var i = 0; i < data.rows.length; i++){
          		if(i==0)
               	ids=data.rows[i].id;
           else    
               ids+=','+data.rows[i].id;
      }
					$.ajax({  
           		type: "post",  
           		cache: false,  
           		url: "../userExpertInfoTrol/updateToYes?ids="+ids
           		});
	    	 	$.messager.alert('提示','生效成功');
				}
				
}


/*function exportZjFuc(){
  	$('#zjglInfo').dialog({
    title: '专家抽取',
    width: 1100,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/czjAdd.jsp',
    modal: true,
     buttons:[{     			
     			text:'添加',
     			iconCls:'icon-ok',
     			handler:function(){
     			//openUploadDialog($(this).text(),'czjMark.jsp','../userExpertInfoTrol/queryExpertUserListMore','',-1,'10',0);
     			addExpert();
     			}
     			},
     			
     			{text:'删除',
     			iconCls:'icon-cancel',
     			handler:function(){
     			confirmdelete();
     			}},
				],
    iconCls: 'icon-save',
    onLoad: function () {
    
   //专家
    $('#zjszGrid').datagrid({    
    url:'', 
       border:true,
	pageSize:20,
	pageList:[20],
	striped: true,
	fitColumns:true,
	//	collapsible:true,
	height: 320,
	//fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	//pagination : true,
	rowStyler: function(index,row){
			if (row.effected=="是"){
				return 'color:red;font-weight:bold;';
			}
		},
    columns:[[    
        {field:'id',title:'选择',checkbox:true,align:'center'},
        //{field:'id',title:'序列',width: $(this).width() *0.15},
        //{field:'id',align:'center',title:'ID',width: $(this).width() *0.10},
        {field:'zpno',title:'专家编码',align:'center',width: $(this).width() *0.15},
        {field:'name',title:'专家姓名',align:'center',width: $(this).width() *0.10},
        {field:'pnum',title:'身份证',align:'center',width: $(this).width() *0.15},
        {field:'company',title:'工作单位',align:'center',width: $(this).width() *0.30},
		{field:'effected',title:'上一届评审委员',align:'center',width: $(this).width() *0.20}
        
        
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
	

    }, //loadEnd
	onClose(){
		$('#zjglInfo').dialog('clear');
	},
});
  

}*/

function addOrg(){
	$('#zjGrid').datagrid('load',{
		s_username_no:$("#s_username_no").textbox('getValue'),
		s_userpnum_no:$("#s_userpnum_no").textbox('getValue')
	});
}


function addExpert(){
  	$('#addExpert').dialog({
    title: '专家抽取',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/czjExpertProtype.jsp',
    modal: true,
     buttons:[
			],
    iconCls: 'icon-save',
    onLoad: function () {
     var pro_type2=$("#pro_type2").combobox('getValue');
   //专家
    $('#addGrid').datagrid({    
    url:"/jtrc/userExpertInfoTrol/queryExpertUserListMore?pro_type="+pro_type2, 
       border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	fitColumns:true,
	//	collapsible:true,
	height: 320,
	//fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	pagination : true,
	rowStyler: function(index,row){
			if (row.effected=="是"){
				return 'color:red;font-weight:bold;';
			}
		},
    columns:[[    
        {field:'id',title:'选择',checkbox:true,align:'center'},	
        {field:'zpno',title:'专家编码',align:'center',width: $(this).width() *0.15},
        {field:'name',title:'专家',align:'center',width: $(this).width() *0.10},
        {field:'pnum',title:'身份证',align:'center',width: $(this).width() *0.15},
        {field:'company',title:'工作单位',align:'center',width: $(this).width() *0.30},
        {field:'effected',title:'上一届评审委员',align:'center',width: $(this).width() *0.20}
        
        
        ]]    
     });  
	var pager = $('#addGrid').datagrid('getPager');
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
    }, //loadEnd
	onClose(){
		$('#addExpert').dialog('clear');
	}

});
}

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
    url:"/jtrc/zcsb/newRandomExpertActivityInfos", 
    border:true,
	pageSize:20,
	pageList:[20],
	striped: true,
	fitColumns:true,
	//	collapsible:true,
	height: 330,
	//fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	pagination : false,
	queryParams: {
		param: param
		 
	},  
	onLoadSuccess: function (data) {//debugger;
	 //$("#zjszGrid").datagrid('hideColumn', 'id');
	        var pro_type=$('#pro_type2').combobox('getValue');
	        var amount=$('#amount').textbox('getValue');
	        if(data.rows.length>0){
	        if(data.cause!=""&&data.cause!=null)
	        {
	       	 $.messager.alert('提示',data.cause,'cause');
	       	 }
	       	 //if(data.cause.equals("人数不足,无法抽取"))
	       	 if(data.cause!=null)
	       	 	if(data.cause!="人数不足,无法抽取")
               $.messager.alert('提示',"成功抽取'"+pro_type+"'专业专家'"+data.rows.length+"'名",'info');
	      		
	       }
	        else
	        	$.messager.alert('提示',"未找到符合条件的专家信息",'info');
    },
    columns:[[    
        {field:'id',title:'选择',checkbox:true,align:'center'},	
        //{field:'id',align:'center',title:'ID',width: $(this).width() *0.10},
        {field:'zpno',title:'专家编码',align:'center',width: $(this).width() *0.15},
        {field:'name',title:'专家',align:'center',width: $(this).width() *0.10},
        {field:'pnum',title:'身份证',align:'center',width: $(this).width() *0.15},
        {field:'company',title:'工作单位',align:'center',width: $(this).width() *0.30},
        {field:'effected',title:'上一届评审委员',align:'center',width: $(this).width() *0.20}
        
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
       window.location.href=basePath+"zcsb/zjszExportByPro_Type?ids="+ids;
   }else{
       $.messager.alert('提示',"未找到符合条件的专家信息，不能导出",'info');
   }
} 




</script>

<form id="searchZjForm" method="post"> 
   
            <table class="tableSearch" id="tableAdd">
             <tr>
		      <td class="left">专业组名:</td>
		      <td class="right"> 
		      
        <input id="pro_type2" name="pro_type2" class="easyui-combobox" style="height:22px" data-options="required:true">
</td>
		      <td class="left">数量:</td>
		      <td class="right"><input id="amount" name="amount" class="easyui-textbox" size="5" data-options="required:true,validType:['integer[1-10]']" style="height:22px"></td>
		      <td class="left">倍数:</td>
		      <td class="right"><input id="times" name="times" class="easyui-textbox" size="5" data-options="required:true,validType:['integer[1-10]']" style="height:22px"></td>
		      <td class="left">同单位人数限制:</td>
		      <td class="right"><input id="number" name="number" class="easyui-textbox" size="5" data-options="required:false,validType:['integer[]']" style="height:22px"></td>
		      
		      
		      <td class="right"></td>
		       <td class="left">
		       <a onclick="searchZjFun();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">抽取</a>
		       </td>
		       
		       <td class="right"></td>
		       <td class="left">
		       <a onclick="getEffected();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">生效</a>
		       </td>
		       
		      <td class="right">
		      	<a onclick="exportZjszFuc();" class="easyui-linkbutton" style="width:160px" data-options="iconCls:'',plain:false">导出Excel</a>
		      </td>
		      </tr>
		      
            </table>
            </form>
            <div>
      <table id="zjszGrid" ></table> 
      </div>
      <div id="addExpert"></div>
	
</body>

</html>
