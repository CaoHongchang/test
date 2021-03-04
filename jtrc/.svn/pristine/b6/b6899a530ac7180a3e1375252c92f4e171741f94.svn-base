<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>学员报名</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
 <script type="text/javascript" src="<%=basePath%>js/jquery.jqprint-0.3.js"></script>
 <script type="text/javascript" src="<%=basePath%>js/jquery-migrate-1.1.0.js"></script>

<script type="text/javascript">
	
	
	
	
       var xg=false;
       var sc=false;
	$(function(){
      
      
      
	 /* $("#ck").show();
	$("#cx").hide();
    $("#drwj").hide();
    $("#dcmb").hide();
    $("#sh").hide();
   
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
          
			if(value==170){
				$("#ck").show();
			}else if(value==171){
				$("#drwj").show();
			}else if(value==172){
				$("#dcmb").show();
			}else if(value==173){
				$("#sh").show();
			}else if(value==174){
				xg=true;
			}else if(value==175){
				sc=true;
			}else if(value==176){
				$("#cx").show();
			}
	});
    },"json"); */
    
       $('#startBirthday').datebox({  
       showSeconds:false,  
       onFocus:function(){}  
    });  
   
    /*$("#ygglDiv").width(wholeWidth);
      $("#ygglDiv2").width(wholeWidth);*/
    queryXygl('');
  

    
	});
	
function queryXygl(param){
 $('#xybmGrid').datagrid({    
    url:basePath+"xljy/xybmView", 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height:wholeHeight,
	width:'100%',
	toolbar: '',
    pagination: true, 
	sortName: '',
	sortOrder: 'desc',
	//singleSelect:true,
	remoteSort: false,
	queryParams: {
		param: param
		
	},
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
         {field:'id',title:'id',align:'center',hidden:true},
        {field:'educationNum',title:'教育编号',width : fixWidth(0.2),align:'center'},    
        {field:'sourceType',title:'信息来源',width : fixWidth(0.2),align:'center'},    
         {field:'registerLevel',title:'报考层次',width: fixWidth(0.3),align:'center'},
         {field:'LearnType',title:'学习形式',width: fixWidth(0.2),align:'center'},
         {field:'educationSchool',title:'报考院校',width: fixWidth(0.2),align:'center'},
         {field:'educationMajor',title:'报考专业',width: fixWidth(0.2),align:'center'},
         {field:'name',title:'姓名',width: fixWidth(0.2),align:'center'},
         {field:'pnum',title:'身份证号',width: fixWidth(0.4),align:'center'},
         {field:'sex',title:'性别',width: fixWidth(0.1),align:'center'},
          /* {field:'workTime',title:'工作时间',width: fixWidth(0.3),align:'center'}, */
         {field:'username',title:'录入人',width: fixWidth(0.2),align:'center'},
         {field:'add_date',title:'录入时间',width: fixWidth(0.35),align:'center'},
         {field:'isWant',title:'是否录取',width: fixWidth(0.18)},
          {field:'isPrint',title:'报表打印',width: fixWidth(0.18),align:'center'},
         {title:'操作',field:'cz',width: fixWidth(0.3),align:'center',
		    		formatter: function(value,row,index){
		    		return '<a style="color: green;"  onclick="addxybmViewFuc('+row.id+')">查看</a> <a href="#" id="sc" style="color: blue;"  onclick="editYgFuc('+row.id+')">修改</a> <a href="#" id="sc" style="color: blue;"  onclick="delYgFuc('+row.id+')">删除</a>';
				}   
				}
  
    ]]    
});  

 $("a[name='xg']").each(function(){ 
     
               $(this).hide(); 
  		}); 
    
	var pager = $('#xybmGrid').datagrid('getPager');
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
	


}


var isShow=false;
function searchYgglDiv(){
   /*  if(!isShow){
       $("#ygglDiv").show();
       isShow=true;
    }else{ 
       $("#ygglDiv").hide();
       isShow=false;
    } */
    
   // xybmSearchInfo
    
    $('#xybmSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/xljygl/xybmSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xybmSearchInfo').dialog('close');
				}
			}]   
}); 
    
}


function addxybmViewFuc(id){
  if(id==''&&!isCheckOne("#xybmGrid")){
    return;
  } 
    
	$('#xybmViewInfo').dialog({
    title: '学员查看',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xyView.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xybmViewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
       viewFunc(id);
    } //loadEnd
    

});

}


function editYgFuc(id){
  if(id==''&&!isCheckOne("#xybmGrid")){
    return;
  } 
    
	$('#xybmEditInfo').dialog({
    title: '学员修改',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xyEdit.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				 saveEditXy();
				 $('#xybmEditInfo').dialog('close');
				 queryXygl('');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xybmEditInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
       viewFunc2(id);
    } //loadEnd
    

});

}




function addygshFuc(){
    if(!isCheckOne("#xybmGrid")){
    return;
    }

	$('#xybmViewInfo').dialog({
    title: '员工审核',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygshAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				  shFunction();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xybmViewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {


    
    } //loadEnd
    

});

}

//删除用户
function delYgFuc(id){
$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
    if (r){    
       
if(id=='' || id==null){
$.messager.alert('错误','用户id为空，操作失败！','error');
return;
}
$.ajax({
                url: basePath+"xljy/delXybm?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                 async: true,
                success: function(data){
                if(data.flag ==true){
                     //$('#xybmGrid').datagrid('reload');
                      queryXygl('');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                  
                   errorMsg();

                }
            });
       
    }    
});

}

function addygxgFuc(id){
    if(id==null||id==''){
    $.messager.alert('提示','选择的数据有误！');
    return;
    }

	$('#xybmViewInfo').dialog({
    title: '员工修改',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygshEdit.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				  editSaveFun();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xybmViewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {

 
        loadEdit(id);
        $('#id').val(id);
        
       
        
 $('#qymc').combobox({    
    valueField:'id',    
    textField:'name',
    //editable:true,
    //mode:'remote',  
    //hasDownArrow:false,
    //prompt:'输入关键字后自动搜索', 
    url:basePath+'yggl/qycx',    
       /* onChange:function(values,o)
        {//alert(values+":"+o);
           if(values!=''&&values!=qySelectValue)
            {         
              var value = $(this).combobox('getValue');            
                var url='../yggl/qycx?name='+value.trim();
                $('#qymc').combobox('reload',url);
            }
          
        }, */
       
        onSelect:function(values){
             qySelectValue=values.name;
             $('#zzjgdm').textbox('setValue', values.c_code);
             $('#qyxz').textbox('setValue', values.qyxz);
             $('#pro_id').val( values.pro_id);
              $('#newEnterpriseId').val( values.id);

        } 
        });
        
                
    } //loadEnd
    

});

}


function addxydrFuc(dates){
	$('#xyglInfo').dialog({
    title: '学员导入',
    width: 1050,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xydrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   saveXy(dates);
				   $('#xyglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xyglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#xydrGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
//	fitColumns:true,
	height: 360,
	width:1000,
	fit:true,
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        	
        {field:'id',title:'序列',width: $(this).width() *0.15},
        {field:'name',title:'姓名',width: $(this).width() *0.15},
        {field:'pnum',title:'身份证',width: $(this).width() *0.15},
        {field:'birthday1',title:'出生年月',width: $(this).width() *0.15},
        {field:'sex',title:'性别',width: $(this).width() *0.15},
        {field:'mz',title:'民族',width: $(this).width() *0.15}, //JTYYHYRCGL-871
        {field:'wxh',title:'微信号',width: $(this).width() *0.15},
        {field:'zylb',title:'职业类别',width: $(this).width() *0.15},
        {field:'pnumCode',title:'身份证地址邮编',width: $(this).width() *0.15},
        {field:'zslb',title:'招生类别',width: $(this).width() *0.15},
         {field:'bkkm',title:'报考科类',width: $(this).width() *0.15},//JTYYHYRCGL-883 修改名称

        {field:'address',title:'身份证地址',width: $(this).width() *0.15},
          {field:'uid',title:'用户id',width: $(this).width() *0.15,hidden:true}, 
          
        {field:'zzmm',title:'政治面貌',width: $(this).width() *0.15},
        {field:'placeResidence',title:'现居住地',width: $(this).width() *0.15},
        {field:'workUnit',title:'现工作单位',width: $(this).width() *0.15},
        
        {field:'post',title:'职务',width: $(this).width() *0.15},
        {field:'highestDegree',title:'最高学历',width: $(this).width() *0.15},
        {field:'graduationSchool',title:'毕业院校',width: $(this).width() *0.15},
        {field:'graduationNum',title:'毕业证号',width: $(this).width() *0.15},
        {field:'graduationDate1',title:'毕业时间',width: $(this).width() *0.15},
        {field:'workTime',title:'工作时间',width: $(this).width() *0.15}, 
        
        {field:'email',title:'电子邮箱',width: $(this).width() *0.15},
        {field:'phone',title:'手机号码',width: $(this).width() *0.15},
        {field:'tel',title:'固定电话',width: $(this).width() *0.15},
        {field:'postalAddress',title:'通讯地址',width: $(this).width() *0.15},
        
        {field:'code',title:'邮编',width: $(this).width() *0.15},
        {field:'qq',title:'QQ号',width: $(this).width() *0.15},
        {field:'xyzsNum',title:'现有岗位或职业资格证',width: $(this).width() *0.15},
        {field:'gwzsNum',title:'岗位或职业资格证说明',width: $(this).width() *0.15},
        {field:'educationNum',title:'教育编号',width: $(this).width() *0.15},
        {field:'ckkqAddress',title:'成考考区所在地',width: $(this).width() *0.15},
        {field:'kqAddress',title:'考区地点',width: $(this).width() *0.15},
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#xydrGrid').datagrid('getPager');
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
	
	$('#xydrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}



function addcjdrFuc(dates){
	$('#cjglInfo').dialog({
    title: '成绩导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/cjdrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   saveCj(dates);
				   $('#cjglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#cjglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   //成绩
    $('#cjdrGrid').datagrid({    
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
        {field:'educationNum',title:'教育编号',width: $(this).width() *0.15},
     
        {field:'pnum',title:'身份证',width: $(this).width() *0.15},
        {field:'yw',title:'语文',width: $(this).width() *0.15},
        {field:'sx',title:'数学',width: $(this).width() *0.15},
        {field:'yy',title:'英语',width: $(this).width() *0.15},
        
        {field:'zz',title:'政治',width: $(this).width() *0.15},
        {field:'mf',title:'民法',width: $(this).width() *0.15},
        {field:'isWant',title:'是否录取',width: $(this).width() *0.15},
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#cjdrGrid').datagrid('getPager');
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
	debugger;
	$('#cjdrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}



var dateFlag=null;
var infoMsg=null;
//员工保存
function saveXy(dates){
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m="存在已保存的身份证号："+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaXy2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaXy2(dates);
  infoMsg='';
  }

   
}

function savaXy2(dates){
  $.blockUI();
    $.ajax({
                url: "../xljy/addXyList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     //$('#xybmGrid').datagrid('reload');
                      queryXygl('');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   errorMsg();

                }
            });
}

 //导入文件
 function importXyFuc(){
	$("#addXlFileForm").ajaxSubmit({
		dataType:"html",
		url : "../xljy/xyUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addXlFileForm')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			if(result.infoMsg!=''&&result.infoMsg!=null){
			     infoMsg=result.infoMsg;
			 }
			    //展示数据
				 addxydrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 

 function exportxyFuc(){
    window.location.href="../xljy/xyDownload";

} 


var dateFlag=null;
var infoMsg=null;
//成绩保存
function saveCj(dates){
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m="存在已保存的身份证号："+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaCj2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaCj2(dates);
  infoMsg='';
  }

   
}

function savaCj2(dates){
  $.blockUI();
    $.ajax({
                url: "../xljy/addCjList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     //$('#xybmGrid').datagrid('reload');
                      //queryXygl('');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
                },
                error: function(data){
                   $.unblockUI();
                   errorMsg();

                }
            });
}

 
 //导入文件
 function importCjFuc(){
	$("#addXlFileForm2").ajaxSubmit({
		dataType:"html",
		url : "../xljy/cjUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addXlFileForm2')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			if(result.infoMsg!=''&&result.infoMsg!=null){
			     infoMsg=result.infoMsg;
			 }
			    //展示数据
				 addcjdrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 

function exportcjFuc(){
    window.location.href="../xljy/cjDownload";

} 

function delXyFuc() {
	var selections = $('#xybmGrid').datagrid('getSelections');
    var id='';
    if(selections.length==1){
    id= selections[0].id;
    }else{
    $.messager.alert('提示', '请选择一条记录！', 'info');
    return;
    }
    
	$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
		if (r) {
			$.ajax({
				url: basePath + "xljy/delXybm?id=" + id,
				type: "POST",
				contentType: "application/json;charset=utf-8",
				dataType: "json",
				async: true,
				success: function(data) {

					if (data.flag == true) {
						//$('#xybmGrid').datagrid('reload');
						queryXygl('');
						successMsg();

					} else {
						$.messager.alert('错误', '操作失败！', 'error');
					}
				},
				error: function(data) {

					errorMsg();

				}
			});

		}
	});

}
//导出excel
 function exportFuc(){
    
    window.location.href=basePath+"xljy/xyExport";

} 

 function bbExportFuc(){
 var selections = $('#xybmGrid').datagrid('getSelections');
    var id='';
    if(selections.length>0){
    for(var  i=0;i<selections.length;i++){
       if(i==0){
        id+=selections[i].id;
       }else{
        id+=","+selections[i].id;
       }
    }

    }else{
    $.messager.alert('提示', '请选择一条记录！', 'info');
    return;
    }
  window.location.href=basePath+"xljy/bbExport?id="+id;
 }  
 
 
 function bbPrinterFuc(){
/*     var selections = $('#xybmGrid').datagrid('getSelections');
    var id='';
    if(selections.length>0){
    for(var  i=0;i<selections.length;i++){
       if(i==0){
        id+=selections[i].id;
       }else{
        id+=","+selections[i].id;
       }
    }

    }else{
    $.messager.alert('提示', '请选择一条记录！', 'info');
    return;
    }
  //window.location.href=basePath+"xljy/bbPrinter?id="+id;
 	$.ajax({
				url: basePath + "xljy/bbPrinter?id=" + id,
				type: "POST",
				async: true,
				success: function(data) {
						queryXygl('');
				},
				error: function(data) {
					errorMsg();
				}
			}); */
			
			//$("#bbdy").printPage();
			
			
 }
 

 function  a(){
 var selections = $('#xybmGrid').datagrid('getSelections');
    var id='';
    if(selections.length>0){
    for(var  i=0;i<selections.length;i++){
       if(i==0){
        id+=selections[i].id;
       }else{
        id+=","+selections[i].id;
       }
    }

    }else{
    $.messager.alert('提示', '请选择一条记录！', 'info');
    return;
    }
 $('#xydyViewInfo').dialog({
    title: '打印预览',
    width: 1100,
    height: 450,
    closed: false,
    cache: false,
    href: basePath+"/xljy/bbPrinter?id="+id,
    modal: true,
     buttons:[
      {
				text:'打印',
				iconCls:'icon-print',
				handler:function(){
				 $("#ddd").jqprint();
				 //修改状态为“是”
				$.ajax({
				url: basePath + "xljy/xydyStatus?id=" + id,
				type: "POST",
				async: true,
				success: function(data) {
						queryXygl('');
				},
				error: function(data) {
					errorMsg();
				}
			}); 
				 
				 
				}
			},
        {
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xydyViewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {

                
    } //loadEnd
    

});
}
  
</script>


<body style="margin: 1px;">
<!--  <input type="file" id="dyFile" onchange="a();"> 

<div id="ddd">
    <table>
        <tr>
            <td>test</td>
            <td>test</td>
            <td>test</td>
            <td>test</td>
            <td>test</td>
        </tr>
    </table>
</div>
 -->






     

<div id="tb" style="float: left">
   <form id="addXlFileForm" method="post" enctype="multipart/form-data" >
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
       <a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="importXyFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入学员</a>
        <a id="dcmb" onclick="exportxyFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出学员模板</a>
		<a id="sc" onclick="delXyFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="ck" onclick="addxybmViewFuc('');" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
       	<a id="cx" onclick="searchYgglDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
         <a id="dcmb" onclick="exportcjFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出成绩模板</a>
		<a id="dcmb" onclick="exportFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出excel</a>
	    <a id="dcmb" onclick="bbExportFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出报表</a>
	   <a id="bbdy" onclick="a()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">报表打印</a>
	</div>

  </form>
</div>   
<div style="float: left">
<form id="addXlFileForm2" method="post" enctype="multipart/form-data" style="width: 160px;height: 10px" >
		<a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="importCjFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入成绩</a>
         </form>

</div>
   

<div id="xybmGridDiv">

<table id="xybmGrid"></table> 

 
</div>
<div id="xyglInfo"></div>
<div id="cjglInfo"></div>

<div id="xybmViewInfo"></div>
<div id="xybmEditInfo"></div>

<div id="xybmSearchInfo"></div>
<div id="ygHtInfo"></div>
<div id="xydyViewInfo"></div>



</body>

</html>
