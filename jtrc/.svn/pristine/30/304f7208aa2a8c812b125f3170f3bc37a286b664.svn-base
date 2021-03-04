<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>专家导入</title>
<body>
	<script type="text/javascript">
		
	
		
  $(document).ready(function(){
        searchZjFun2();
  })
  var pro_type = $("#pro_type2").combobox('getValue')


	function searchZjFun2(){
 var r = $("#forme").form('enableValidation').form('validate');
	if(!r) {
		return false;
	}
 var param=$("#forme").serializeArray();
 queryzj2(JSON.stringify(param));
}

function addExpertTo(){
		var xd=1;
		var rows = $('#addGrid').datagrid('getChecked');
		var exist = "";
		var success = "";
		if(rows.length > 0)
		{
		var datas = $('#zjszGrid').datagrid('getData');

				for(var j=0;j<datas.rows.length;j++)
				{
					for(var k=0;k<rows.length;k++)
					if(datas.rows[j].id == rows[k].id){
						 xd = 0;
						 exist +=rows[k].name+",";
						 break;
					}
				}
				
				
			if(xd==1)
			{
				for(var i=0;i<rows.length;i++)
					{
					$('#zjszGrid').datagrid('appendRow',{
					id: rows[i].id,
					zpno: rows[i].zpno,
					name: rows[i].name,
					pnum: rows[i].pnum,
					company: rows[i].company,
					effected: rows[i].effected
					});
					success+=rows[i].name+",";
					}
			}
		
				if(exist!="")
				{
				$.messager.alert('提示框',exist+'已存在，添加失败');
				
				}
				else
				{	$.messager.alert('提示框','添加成功');}
		}
		
		else
		{$.messager.alert('提示框','请选择数据')}
		
		
}
function queryzj2(param){

   //专家
    $('#addGrid').datagrid({    
    url:"/jtrc/userExpertInfoTrol/queryExpertUserListMore?pro_type="+pro_type, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	fitColumns:true,
	//	collapsible:true,
	height: 330,
	//fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,  
	pagination : true,
	queryParams: {
		param: param
		 
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
	
    } //loadEnd

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

</script>

<form id="forme" method="post"> 
<table class="tableSearch" id="tableExpert">
   <tr>
				<td class="right"></td>
		       <td class="left">
		       <a onclick="addExpertTo();" class="easyui-linkbutton" style="width:60px" data-options="iconCls:'',plain:false">添加</a>
		       </td>
</tr>
</table>

</form>

	<div>
		<table id="addGrid"></table>
	</div>
	      <div id="addExpert"></div>
</body>

</html>
