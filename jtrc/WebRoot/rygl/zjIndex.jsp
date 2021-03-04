<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>专家列表</title>

<script type="text/javascript">
	$(function(){
   
   $('#zjGrid').datagrid({    
    url:'/jtrc/userExpertInfoTrol/queryExpertUserList', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	toolbar: '#zjTool',
	sortName: '',
	sortOrder: 'desc',
	pagination : true,
	remoteSort: false,    
    columns:[[    
              {field:'id',title:'选择',checkbox:true,align:'center'},
              {field:'zpno',title:'专家编码',width:100,align:'center'},    
              {field:'name',title:'专家姓名',width:100,align:'center'},    
              {field:'pnum',title:'身份证号',width:100,align:'center'},
              {field:'sex',title:'性别',width:100,align:'center',
    	    		formatter: function(value,row,index){
  	    		        if(value == 1){
  	  	    		        return '男';
  	  	    		    }else if(value == 0){
  	  	    		        return '女';
  	  	  	    		}else{
  	  	  	    		   return value;
  	  	  	    		}
	   				}   
   			  },    
              {field:'pro_type',title:'专业类别',width:100,align:'center'},
              {field:'zg_level',title:'资格级别',width:100,align:'center'},    
              {field:'company',title:'工作单位',width:100,align:'center'},
              {field:'tel',title:'联系电话',width:100,align:'center'},
              {title:'操作',field:'porperty',width:100,align:'center',
      	    		formatter: function(value,row,index){
      				 return "<a href='javascript:editFuc("+row.id+")' style='color: blue;' >修改<a>"
		      				 +" <a href='javascript:delFuc("+row.id+")' style='color: blue;'>删除</a>";
      				}   
      			}
	    ]]    
	});  
	var pager = $('#zjGrid').datagrid('getPager');
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
 

	/*专家新增*/
	function addFuc(){
		$('#zjAddInfo').dialog({
	    title: '专家新增',
	    width: 350,
	    height: 350,
	    closed: false,
	    cache: false,
	    href: '../rygl/zjAdd.jsp',
	    modal: true,
	     buttons:[{
			text:'保存',
			iconCls:'icon-ok',
			handler:function(){
			
			//zxl begin
			
			var zpno     =  $("#zpno").textbox("getValue");//专家编码
			var name     =  $("#name").textbox("getValue");//姓名
			var pnum     =  $("#pnum").textbox("getValue");//身份证号
			var pro_type =  $("#pro_type").textbox("getValue");//专业类型
			var zg_level =  $("#zg_level").textbox("getValue");//资格级别
			var company  =  $("#company").textbox("getValue");//工作单位
			var tel      =  $("#tel").textbox("getValue");//联系电话
			
			if(zpno==''){
			   $.messager.alert('系统提示','专家编码不能为空！');
		       return false;
			}
			if(zpno.length>50){
			   $.messager.alert('系统提示','专家编码长度不能超过50！');
		       return false;
			}
			
			if(name==''){
			   $.messager.alert('系统提示','专家姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','专家姓名长度不能超过50！');
		       return false;
			}
			
			if(pnum==''){
				$.messager.alert('系统提示','身份证号不能为空！');
				return false;
			}
			if(!Card_Validation(pnum)){
				$.messager.alert('系统提示','身份证格式错误');
				return false;
			}
			
			if(pro_type==''){
				$.messager.alert('系统提示','专业类型不能为空！');
				return false;
			}
			if(pro_type.length>50){
				$.messager.alert('系统提示','专业类型长度不能超过50！');
				return false;
			}
			
			if(zg_level==''){
				$.messager.alert('系统提示','资格级别不能为空！');
				return false;
			}
			if(zg_level.length>50){
				$.messager.alert('系统提示','资格级别长度不能超过50！');
				return false;
			}
			
			if(company==''){
				$.messager.alert('系统提示','工作单位不能为空！');
				return false;
			}
			if(company.length>50){
				$.messager.alert('系统提示','工作单位长度不能超过50！');
				return false;
			}
			
			if(tel!=''&&!Tel_Validation(tel)){
				$.messager.alert('系统提示','手机号码格式错误');
				return false;
			}
			//zxl end
			
			
			
			
	    	    $.ajax({  
					type: "post",  
					cache: false,  
					url: "../userExpertInfoTrol/save",  
					data: "zpno=" + $("#zpno").val() + "&name=" + $("#name").val() + "&pnum=" + $("#pnum").val() + "&sex=" + $("#sex").combobox("getValue")
				       + "&pro_type=" + $("#pro_type").val()+ "&zg_level=" + $("#zg_level").val()+ "&company=" + $("#company").val()+ "&tel=" + $("#tel").val(),  
					success: function (result) {  
					    if(result == 1){
						    alert("您已成功新增专家信息！");
							//$.messager.alert('系统提示',"您已成功修改业务信息！");
							//$('#ywEditInfo').dialog('close');
							window.location.href = window.location.href;
							//$('#ywGrid').datagrid('reload');  
						}else{
							$.messager.alert('系统提示',result);
						}
					}  
				});  
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#zjAddInfo').dialog('close');
			}
		}],
	    iconCls: 'icon-save',
	    onLoad: function () {
			$("#fm").form("clear"); 
	    }  
	});
	}


/*选项修改*/
function editFuc(id){
	var rows = $("#zjGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
    $('#zjEditInfo').dialog({
        title: '专家修改',
        width: 400,
        height: 350,
        closed: false,
        cache: false,
        href: '../rygl/zjEdit.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
            
            			//zxl begin
			
			var zpno     =  $("#zpno").textbox("getValue");//专家编码
			var name     =  $("#name").textbox("getValue");//姓名
			var pnum     =  $("#pnum").textbox("getValue");//身份证号
			var pro_type =  $("#pro_type").textbox("getValue");//专业类型
			var zg_level =  $("#zg_level").textbox("getValue");//资格级别
			var company  =  $("#company").textbox("getValue");//工作单位
			var tel      =  $("#tel").textbox("getValue");//联系电话
			
			if(zpno==''){
			   $.messager.alert('系统提示','专家编码不能为空！');
		       return false;
			}
			if(zpno.length>50){
			   $.messager.alert('系统提示','专家编码长度不能超过50！');
		       return false;
			}
			
			if(name==''){
			   $.messager.alert('系统提示','专家姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','专家姓名长度不能超过50！');
		       return false;
			}
			
			if(pnum==''){
				$.messager.alert('系统提示','身份证号不能为空！');
				return false;
			}
			if(!Card_Validation(pnum)){
				$.messager.alert('系统提示','身份证格式错误');
				return false;
			}
			
			if(pro_type==''){
				$.messager.alert('系统提示','专业类型不能为空！');
				return false;
			}
			if(pro_type.length>50){
				$.messager.alert('系统提示','专业类型长度不能超过50！');
				return false;
			}
			
			if(zg_level==''){
				$.messager.alert('系统提示','资格级别不能为空！');
				return false;
			}
			if(zg_level.length>50){
				$.messager.alert('系统提示','资格级别长度不能超过50！');
				return false;
			}
			
			if(company==''){
				$.messager.alert('系统提示','工作单位不能为空！');
				return false;
			}
			if(company.length>50){
				$.messager.alert('系统提示','工作单位长度不能超过50！');
				return false;
			}
			
			if(tel!=''&&!Tel_Validation(tel)){
				$.messager.alert('系统提示','手机号码格式错误');
				return false;
			}
			//zxl end
            
            
        	    var data=$('#fmEdit').formSerialize(); 
                $.ajax({  
					type: "post",  
					cache: false,  
					url: "../userExpertInfoTrol/update",  
					data: data,  
					success: function (result) {  
					    if(result == 1){
						    alert("您已成功修改专家信息！");
							//$.messager.alert('系统提示',"您已成功修改业务信息！");
							//$('#ywEditInfo').dialog('close');
							window.location.href = window.location.href;
							//$('#ywGrid').datagrid('reload');  
						}else{
							$.messager.alert('系统提示',result);
						}
					}  
				});  
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#zjEditInfo').dialog('close');
            }
        }],
        iconCls: 'icon-save',
        onLoad: function () {
	    	$("#fmEdit").form("clear"); 
		    $("#fmEdit").form("load",row);
        }
    });

}

/*删除*/
function delFuc(id){
	var ids = "";
	if('' != id){
		ids = id;
	}else{
		ids = getSelectRowId();
    }
    if(ids != ""){
        if(confirm("操作提示", "确认删除此数据吗？")){
           	$.ajax({  
           		type: "post",  
           		cache: false,  
           		url: "../userExpertInfoTrol/del?ids=" + ids,  
           		data: '',  
           		success: function (result) {  
           		    if(result == 1){
           			    alert("您已成功删除专家信息！");
           				//$.messager.alert('系统提示',"您已成功修改业务信息！");
           				//$('#ywEditInfo').dialog('close');
           				window.location.href = window.location.href;
           				//$('#ywGrid').datagrid('reload');  
           			}else{
           				$.messager.alert('系统提示',result);
           			}
           		}  
           	});  
        };
	 }else{
		 $.messager.alert('系统提示',"请选择要删除的数据");
     }
}

function getSelectRowId(){
	var rows = $('#zjGrid').datagrid('getSelections');  
	var ids = "";
	if (rows.length>0) {  
		for(var i=0; i<rows.length; i++){
			if(ids == ""){
    			ids = rows[i].id;
    		}else{
    			ids += "," + rows[i].id;
        	}
		}
	}
	return ids;
}

function exportFuc(){
	var data=$('#fmExport').formSerialize()
    var url= "<%=request.getContextPath()%>/userPartyInfoTrol/exportModel?typeExport=4";
	window.location.href= url; 
}

function importFuc(){
	$('#dyImportInfo').dialog({
	    title: '选择文件',
	    width: 350,
	    height: 150,
	    
	    closed: false,
	    cache: false,
	    href: '../rygl/fileImport.jsp',
	    modal: true,
	     buttons:[{
				text:'上传',
				iconCls:'icon-ok',
				handler:function(){
	    	 		uploadExcel();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#dyImportInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () { 
	    }  
	});
}


var dataFlag;
var tipMsg;
function uploadExcel(){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
        var url = "<%=request.getContextPath()%>/userExpertInfoTrol/importExcel";   
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx" || d1==".xls"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: url,
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 				            var resObj = eval("("+data+")");
 				           
 				            dataFlag = resObj.flag;
 				            tipMsg = resObj.cause; 
		            		$('#dyImportInfo').dialog('close');
		            		showImportdyFuc(resObj.rows); 
 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx/xls格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }


/*展示导入的专家信息*/
function showImportdyFuc(dates){
	var title = "专家导入";
	var columns = [[    
	            			{field:'name',title:'姓  名',width: $(this).width() *0.1 ,align:'center'},
	            			{field:'pnum',title:'身份证',width: $(this).width() *0.1,align:'center'},
	            			{field:'sex',title:'性别',width: $(this).width() *0.1,align:'center'},
	            			{field:'tel',title:'联系电话',width: $(this).width() *0.1},
	            			{field:'company',title:'工作单位',width: $(this).width() *0.1},
	            			{field:'zpno',title:'专家编号',width: $(this).width() *0.1},
	            			{field:'proType',title:'专业类别',width: $(this).width() *0.1},
	            			{field:'zgLevel',title:'资格级别',width: $(this).width() *0.1},
	            			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
	                    ]]    ;
	$('#showImportDyInfo').dialog({
    title: title,
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../rygl/dyxxImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					saveZj(dates);
				 //$('#showImportDyInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#showImportDyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#dyImportGrid').datagrid({    
	    url:'', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		height: 360,
		nowarp:false,
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:columns
     });  
    $('#dyImportGrid').datagrid('loadData',dates);
    } //loadEnd
});
}

function saveZj(dates){
	if(dataFlag != true){
       $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
       return;
    }
	$.blockUI();
    $.ajax({
         url: "../userExpertInfoTrol/saveZj",
         type: "POST",
         contentType : "application/json;charset=utf-8", 
         data: JSON.stringify(dates),
         async: true,
         success: function(data){
	         $.unblockUI();
	         alert(data);
	         $('#showImportDyInfo').dialog('close');
	         query();
         },
         error: function(data){
             $.unblockUI();
             alert(data);
         }
    });
}


/*
 * 身份证号
 */
function Card_Validation(card){
	var re = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	return re.test(card);
}
	/*
 * 手机验证  （11位数字，且1开头）
 */
function Tel_Validation(tel){
	var re =/^1[3|4|7|8|5]\d{9}$/;
	return re.test(tel);
}



//抽取专家并导出
function exportZjFuc(){
  	$('#zjglInfo').dialog({
    title: '专家设置',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zjszAdd.jsp',
    modal: true,
     buttons:[{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zjglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   //专家
    $('#zjszGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        	
        {field:'id',title:'序列',width: $(this).width() *0.15},
        {field:'businessId',align:'center',title:'活动编码',width: $(this).width() *0.15},
     
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
    

});
  

}

function addOrg(){
	$('#zjGrid').datagrid('load',{
		s_username_no:$("#s_username_no").textbox('getValue'),
		s_userpnum_no:$("#s_userpnum_no").textbox('getValue')
	});
}

</script>


<body style="margin: 1px;">


<div id="tb">
	<div id="zjTool"  style="background-color:#FFFFFF;">
	 <div>
	    <input type="text"  class="easyui-textbox"  
	        name="s_username_no" id="s_username_no" value="输入姓名"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        <input type="text"  class="easyui-textbox"  
	        name="s_userpnum_no" id="s_userpnum_no" value="输入身份证号"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
		<a href="#" onclick="addOrg()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a href="javascript:delFuc('')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a onclick="exportFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导出模板</a>
	 	<a onclick="importFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导入文件</a>
	    <a id="i" onclick="exportZjFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">抽取专家并导出</a>
	</div>

</div>
<div>
<table id="zjGrid"></table>  
</div>
<div id="zjAddInfo" align="center"></div>
<div id="zjEditInfo" align="center"></div>
<div id="dyImportInfo" align="center"></div>
<div id="showImportDyInfo" align="center"></div>
<div id="zjglInfo"></div> 

</body>
</html>
