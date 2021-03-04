<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>专家列表</title>

<script type="text/javascript">



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



function close(){
	         $('#showImportDyInfo').dialog('close');
	         query();
         }

	$(function(){
   
   $('#zjGrid').datagrid({    
    url:'/jtrc/userExpertInfoTrol/queryExpertUserListMore', 
    border:true, 		
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#zjTool',
	sortName: '',
	sortOrder: 'desc',
	pagination : true,
	remoteSort: false,
    columns:[[    
              {field:'id',title:'选择',checkbox:true,align:'center'},
              {field:'zpno',title:'专家编码',width:70,align:'center'},    
              {field:'name',title:'专家姓名',width:70,align:'center'},    
              {field:'pnum',title:'身份证号',width:120,align:'center'},
              {field:'sex',title:'性别',width:30,align:'center',
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
   			  {field:'birth_date',title:'出生年月',width:100,align:'center'},
              {field:'pro_type',title:'专业组名',width:100,align:'center'},
              {field:'zg_level',title:'任职资格',width:100,align:'center'}, 
              {field:'zg_time',title:'资格取得时间',width:100,align:'center'}, 
              {field:'place_name',title:'行政职务',width:100,align:'center'},
              {field:'tel',title:'手机',width:100,align:'center'},    
              {field:'company',title:'工作单位',width:100,align:'center'},
              {field:'work_name',title:'现从事专业工作',width:50,align:'center'},
              {field:'graduation_time',title:'毕业时间',width:50,align:'center'},
              {field:'school',title:'毕业学习',width:50,align:'center'},
              {field:'major',title:'毕业专业',width:50,align:'center'},
              {field:'degree',title:'学历',width:50,align:'center'},
              {field:'remark',title:'备注',width:50,align:'center'},
              {field:'effected',title:'是否为上次评委',width:30,align:'center'},
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
	    href: '../rygl/czjAdd.jsp',
	    modal: true,
	     buttons:[{
			text:'保存',
			iconCls:'icon-ok',
			handler:function(){
			
			//zxl begin
			
			var zpno    	 	 =  $("#zpno").textbox("getValue");//专家编码
			var name     		 =  $("#name").textbox("getValue");//姓名
			var pnum    		 =  $("#pnum").textbox("getValue");//身份证号
			var sex     		 =  $("#sex").textbox("getValue");//性别
			var birth_date 		 =  $("#birth_date").datebox("getValue");//出生年月
			var pro_type		 =  $("#pro_type").textbox("getValue");//专业类型
			var zg_level 		 =  $("#zg_level").textbox("getValue");//资格级别
			var zg_time			 =  $("#zg_time").textbox("getValue");//资格取得时间
			var place_name       =  $("#place_name").textbox("getValue");//职务
			var tel 			 =  $("#tel").textbox("getValue");//手机
			var company   		 =  $("#company").textbox("getValue");//工作单位
			var work_name     	 =  $("#work_name").textbox("getValue");//现从事专业工作
			var graduation_time	 =  $("#graduation_time").datebox("getValue");//毕业时间
			var school     		 =  $("#school").textbox("getValue");//毕业院校
			var major    		 =  $("#major").textbox("getValue");//专业
			var degree    		 =  $("#degree").textbox("getValue");//学历
			var remark     		 =  $("#remark").textbox("getValue");//备注

			if(name==''){
			   $.messager.alert('系统提示','专家姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','专家姓名长度不能超过50！');
		       return false;
			}
			
			
			if(pro_type==''){
				$.messager.alert('系统提示','专组名不能为空！');
				return false;
			}
			if(pro_type.length>50){
				$.messager.alert('系统提示','专业组名长度不能超过50！');
				return false;
			}
			
			
	    	    $.ajax({  
					type: "post",  
					cache: false,  
					url: "../userExpertInfoTrol/save2",  
					data: "zpno=" + $("#zpno").val() + "&name=" + $("#name").val() + "&pnum=" + $("#pnum").val() + "&sex=" + $("#sex").combobox("getValue")
				       + "&pro_type=" + $("#pro_type").val()+ "&zg_level=" + $("#zg_level").val()+ "&company=" + $("#company").val()+ "&tel=" + $("#tel").val() 
				       + "&birth_date=" + $("#birth_date").datebox("getValue")+ "&place_name=" + $("#place_name").val()+ "&place_name=" + $("#place_name").val()
				       + "&work_name=" + $("#work_name").val()+ "&graduation_time=" + $("#graduation_time").datebox("getValue")+ "&school=" + $("#school").val()
				       + "&major=" + $("#major").val()+ "&degree=" + $("#degree").val()+ "&remark=" + $("#remark").val()+"&zg_time="+$("#zg_time").datebox("getValue"),
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
        href: '../rygl/czjEdit.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
            
            			//zxl begin
			
			var zpno    	 	 =  $("#zpno1").textbox("getValue");//专家编码
			var name     		 =  $("#name1").textbox("getValue");//姓名
			var pnum    		 =  $("#pnum1").textbox("getValue");//身份证号
			var sex     		 =  $("#sex1").textbox("getValue");//性别
			var birth_date 		 =  $("#birth_date1").datebox("getValue");//出生年月
			var pro_type		 =  $("#pro_type3").textbox("getValue");//专业类型
			var zg_level 		 =  $("#zg_level1").textbox("getValue");//资格级别
			var zg_time   		 =  $("#zg_time").datebox("getValue");
			var place_name       =  $("#place_name1").textbox("getValue");//职务
			var tel 			 =  $("#tel1").textbox("getValue");//手机
			var company   		 =  $("#company1").textbox("getValue");//工作单位
			var work_name     	 =  $("#work_name1").textbox("getValue");//现从事专业工作
			var graduation_time	 =  $("#graduation_time1").datebox("getValue");//毕业时间
			var school     		 =  $("#school1").textbox("getValue");//毕业院校
			var major    		 =  $("#major1").textbox("getValue");//专业
			var degree    		 =  $("#degree1").textbox("getValue");//学历
			var remark     		 =  $("#remark1").textbox("getValue");//备注
			
			if(name==''){
			   $.messager.alert('系统提示','专家姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','专家姓名长度不能超过50！');
		       return false;
			}
			
			if(pro_type==''){
				$.messager.alert('系统提示','专组名不能为空！');
				return false;
			}
			if(pro_type.length>50){
				$.messager.alert('系统提示','专业组名长度不能超过50！');
				return false;
			}
			
            
            
        	    var data=$('#fmEdit').formSerialize(); 
                $.ajax({  
					type: "post",  
					cache: false,  
					url: "../userExpertInfoTrol/update2",  
					data: data,  
					success: function (result) {  
					    if(result == 1){
						    alert("您已成功修改专家信息！");
							window.location.href = window.location.href;
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
           		url: "../userExpertInfoTrol/del2?ids=" + ids,  
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
    var url= "<%=request.getContextPath()%>/userPartyInfoTrol/exportModel?typeExport=5";
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
        var url = "<%=request.getContextPath()%>/userExpertInfoTrol/importExcel2";   
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
	
							{field:'company',title:'工作单位',width: $(this).width() *0.1},
							{field:'name',title:'姓  名',width: $(this).width() *0.1 ,align:'center'},
							{field:'sex',title:'性别',width: $(this).width() *0.1,align:'center'},
							{field:'birthDate',title:'出生年月',width: $(this).width() *0.1,},
							{field:'graduationDate',title:'毕业时间',width: $(this).width() *0.1},
	            			{field:'school',title:'毕业院校',width: $(this).width() *0.1},
	            			{field:'major',title:'专业',width: $(this).width() *0.1},
	            			{field:'degree',title:'学历',width: $(this).width() *0.1},
							{field:'zgLevel',title:'任职资格',width: $(this).width() *0.1},
							{field:'zgTime',title:'资格取得时间',width: $(this).width() *0.1},
							{field:'place_Name',title:'行政职务',width: $(this).width() *0.1},
							{field:'work_name',title:'现从事专业工作',width: $(this).width() *0.1},
							{field:'proType',title:'专业组名',width: $(this).width() *0.1},
							{field:'tel',title:'联系电话',width: $(this).width() *0.1},
							{field:'zpno',title:'专家编码',width: $(this).width() *0.1 ,align:'center'},
	            			{field:'pnum',title:'身份证',width: $(this).width() *0.1,align:'center'},
	            			{field:'remark',title:'备注',width: $(this).width() *0.1},
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
         url: "../userExpertInfoTrol/saveZj2",
         type: "POST",
         contentType : "application/json;", 
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
         }
    });
    //$.post('../userExpertInfoTrol/saveZj2',{ list:JSON.stringify(dates)},close,"application/json;charset=utf-8");
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

/*function addExpert(){
 var pro_type2=$("#pro_type2").combobox('getValue');
  	$('#addExpert').dialog({
    title: '专家抽取',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/czjExpertProtype.jsp',
    modal: true,
     buttons:[
     		{
				text:'退出',
				iconCls : 'icon-cancel',
				handler:function(){
				$('#addExpert').dialog('close');
				}
			},
			],
    iconCls: 'icon-save',
    onLoad: function () {
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
	},
});

}*/


//抽取专家并导出
function exportZjFuc(){
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
	pagination : false,
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
  

}

function addOrg(){
	$('#zjGrid').datagrid('load',{
		s_username_no:$("#s_username_no").textbox('getValue'),
		s_userpnum_no:$("#s_userpnum_no").textbox('getValue')
	});
}

//标记专家
function markExpert(){
	  	$('#markExpert').dialog({
    title: '专家标记',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../rygl/czjMark.jsp',
    modal: true,
     buttons:[{
				text:'确认',
				//iconCls:'icon-cancel',
				
				handler:function(){
				$('#markExpert').dialog('close' );
				}
				
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   //专家
    $('#markGrid').datagrid({    
    url:'/jtrc/userExpertInfoTrol/queryExpertUserListMore', 
 	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 350,
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
        {field:'zpno',align:'center',title:'编码',width: $(this).width() *0.15},
        {field:'name',title:'专家姓名',align:'center',width: $(this).width() *0.15},
        {field:'pro_type',title:'专业组名',align:'center',width: $(this).width() *0.30},
        {field:'sex',title:'性别',align:'center',width: $(this).width() *0.20,
            	    		formatter: function(value,row,index){
  	    		        if(value == 1){
  	  	    		        return '男';
  	  	    		    }else if(value == 0){
  	  	    		        return '女';
  	  	  	    		}else{
  	  	  	    		   return value;
  	  	  	    		}
	   				}   },
        {field:'effected',title:'上一届评审委员',align:'center',width: $(this).width() *0.20}
        
        ]]    
     });  
	var pager = $('#markGrid').datagrid('getPager');
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
		<a onclick="markExpert()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">标记上一届全体评审委员</a>
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
<div id="markExpert" style="padding-bottom:20px;background:#eee;" ></div> 
</body>
</html>
