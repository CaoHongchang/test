<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>

<html>
<head>
<title>员工管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
	
       var xg=false;
       var sc=false;
	$(function(){

	 $("#ck").show();
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
    },"json");
    
       $('#startBirthday').datebox({  
       showSeconds:false,  
       onFocus:function(){}  
    });  
   
    /*$("#ygglDiv").width(wholeWidth);
      $("#ygglDiv2").width(wholeWidth);*/
    queryYygl('');
  


    
	});
	
function queryYygl(param){
 $('#yyglGrid').datagrid({    
    url:basePath+"yggl/ygView", 
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
         
        {field:'zzjgdm',title:'组织机构代码',width : fixWidth(0.2),align:'center'},    
        {field:'qymc',title:'企业名称',width : fixWidth(0.2),align:'center'},    
        {field:'qyxz',title:'企业性质',width: fixWidth(0.2),align:'center'},
         {field:'sfz',title:'身份证',width: fixWidth(0.3),align:'center'},
         {field:'xm',title:'姓名',width: fixWidth(0.2),align:'center',
         styler: function(value,row,index){
				if (row.color=='blue'){
					return 'background-color:blue;';
				}
				if (row.color=='red'){
					return 'background-color:red;';
				}
				if (row.color=='FF6600'){
					return 'background-color:#FF6600;';
				}
			}
         
         
         },
         {field:'csny',title:'出生年月',width: fixWidth(0.2),align:'center'},
         {field:'xb',title:'性别',width: fixWidth(0.2),align:'center'},
         {field:'ygxs',title:'用工形式',width: fixWidth(0.2),align:'center'},
         {field:'shzt',title:'审核状态',width: fixWidth(0.2),align:'center'},
         {field:'shyj',title:'审核意见',width: fixWidth(0.2),align:'center'},
         {field:'startdate',title:'合同开始时间',width: fixWidth(0.2),align:'center'},
         {field:'enddate',title:'合同结束时间',width: fixWidth(0.2),align:'center',
          styler: function(value,row,index){
              if(row.year==0){
              return 'background-color:yellow;';
              
              }
              if(row.old==true){//过期则使用灰色
              return 'background-color:gray;';
              
              }
          }
         
         },
         {title:'操作',field:'cz',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
		    		  if(xg && sc){
		    		      				      return '<a  href="#" style="color: green;"  onclick="addygxgFuc('+row.id+')">修改</a> <a href="#" id="sc" style="color: blue;"  onclick="delYgFuc('+row.id+')">删除</a>';
		    		     
		    		  }else  if(!xg && sc){
		    		      				      return '<a href="#" id="sc" style="color: blue;"  onclick="delYgFuc('+row.id+')">删除</a>';
		    		     
		    		  }else  if(xg && !sc){
		    		      				     return '<a  href="#" style="color: green;"  onclick="addygxgFuc('+row.id+')">修改</a> ';
		    		     
		    		  }
				}   
				}
  
    ]]    
});  

 $("a[name='xg']").each(function(){ 
 
               $(this).hide(); 
  		}); 
    
	var pager = $('#yyglGrid').datagrid('getPager');
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
    
   // yyglSearchInfo
    
    $('#yyglSearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/hygsgl/ygglSearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#yyglSearchInfo').dialog('close');
				}
			}]   
}); 
    
}


function addygckFuc(){
 if(!isCheckOne("#yyglGrid")){
    return;
  }
    
	$('#yyglViewInfo').dialog({
    title: '员工查看',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygshView.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#yyglViewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   
    } //loadEnd
    

});

}





function addygshFuc(){debugger 
    if(!isCheckOne("#yyglGrid")){
    return;
    }
    var selections = $("#yyglGrid").datagrid('getSelected'); 
    //console.log(selections.shzt);
    if(selections.shzt=='审核通过'||selections.shzt=='审核未通过'){
	alert("该员工已经审核，请不要重复审核！");
	return;
	}
/*	
	var row=$("#addygshFuc").datagrid('getSelect');
	if(row==''||row==null){
	alert("请选择要审核的数据！");
	return;
	}else if(row.shyj=='审核通过'||row.shyj=='审核未通过'){
	alert("该员工已经审核，请不要重复审核！");
	return;
	}
	*/
	$('#yyglViewInfo').dialog({
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
				$('#yyglViewInfo').dialog('close');
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
                url: basePath+"yggl/delYgFuc?id="+id,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
             
                 async: true,
                success: function(data){
                 
                if(data.flag ==true){
                     //$('#yyglGrid').datagrid('reload');
                      queryYygl('');
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

	$('#yyglViewInfo').dialog({
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
				$('#yyglViewInfo').dialog('close');
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


function addygdrFuc(dates){
	$('#yyglInfo').dialog({
    title: '员工导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../hygsgl/ygdrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   saveYg(dates);
				   $('#yyglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#yyglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   
    $('#ygdrGrid').datagrid({    
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
        {field:'zzjgdm',title:'组织机构代码',width: $(this).width() *0.15},
        {field:'dw',title:'单位',width: $(this).width() *0.15},
        {field:'sfz',title:'身份证',width: $(this).width() *0.15},
        {field:'xm',title:'姓名',width: $(this).width() *0.15},
        {field:'csny',title:'出生年月',width: $(this).width() *0.15},
        {field:'xb',title:'性别',width: $(this).width() *0.15},
        {field:'xdaszd',title:'现档案所在地',width: $(this).width() *0.15},
        {field:'cjgzsj',title:'参加工作时间',width: $(this).width() *0.15},
        {field:'mz',title:'民族',width: $(this).width() *0.15},
        {field:'ygxs',title:'用工形式',width: $(this).width() *0.15},
        {field:'zzmm',title:'政治面貌',width: $(this).width() *0.15},
        {field:'byyx',title:'毕业院校',width: $(this).width() *0.15},
        {field:'bysj',title:'毕业时间',width: $(this).width() *0.15},
        {field:'sxzy',title:'所学专业',width: $(this).width() *0.15},
        {field:'whcd',title:'文化程度',width: $(this).width() *0.15},
        {field:'hjd',title:'户籍地',width: $(this).width() *0.15},
        {field:'lxdz',title:'联系地址',width: $(this).width() *0.15},
        {field:'gddh',title:'固定电话',width: $(this).width() *0.15},
        {field:'sjh',title:'手机号码',width: $(this).width() *0.15},
        {field:'dzyx',title:'电子邮箱',width: $(this).width() *0.15},
        {field:'hjxz',title:'户籍性质',width: $(this).width() *0.15},
        {field:'hjszd',title:'户籍所在地',width: $(this).width() *0.15},
        {field:'khyh',title:'开户银行',width: $(this).width() *0.15},
        {field:'yhzh',title:'银行帐号',width: $(this).width() *0.15},
        {field:'jszc',title:'技术职称',width: $(this).width() *0.15},
        {field:'zydj',title:'职业等级',width: $(this).width() *0.15},
        {field:'zyzg',title:'执（职）业资格',width: $(this).width() *0.15},
        {field:'hqsj',title:'获取时间',width: $(this).width() *0.15},
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#ygdrGrid').datagrid('getPager');
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
	
	$('#ygdrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}

var dateFlag=null;
var infoMsg=null;
//员工保存
function saveYg(dates){
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m="存在已保存的身份证号："+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaYg2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaYg2(dates);
  infoMsg='';
  }

   
}

function savaYg2(dates){
  $.blockUI();
    $.ajax({
                url: "../yggl/addYgList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                     //$('#yyglGrid').datagrid('reload');
                      queryYygl('');
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
 function importFuc(){
	$("#addYgFileForm").ajaxSubmit({
		dataType:"html",
		url : "../yggl/ygUpload",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		async : true,
		beforeSend:function(){
          $.blockUI();
        },
		complete: function() { 
           $.unblockUI();
          
            $('input[type="file"]').attr('value',''); 
            $('#addYgFileForm')[0].reset();  
        } ,  
		success : function(data) {
			var result = $.parseJSON(data);  
			if(result.flag ==true){
			     dateFlag=result.dateFlag;
			if(result.infoMsg!=''&&result.infoMsg!=null){
			     infoMsg=result.infoMsg;
			 }
			    //展示数据
				 addygdrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！','error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 

 function exportygFuc(){
    window.location.href="../yggl/ygDownload";

} 

   
</script>


<body style="margin: 1px;">

<form id="addYgFileForm" method="post" action="../yggl/ygUpload" enctype="multipart/form-data" >


<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a id="ck" onclick="addygckFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
       
        <a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="importFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入文件</a>
       
        <a id="dcmb" onclick="exportygFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出模板</a>
		<a id="sh" onclick="addygshFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">审核</a>
		<a id="cx" onclick="searchYgglDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		
	</div>
	<!-- <div id="ygglDiv" class="easyui-accordion" style="display:none;height:100px;margin-bottom: 5px">   
    <div id="ygglDiv2" title="" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">    -->

    </div>   
 
   
  
</form>
<div id="yyglGridDiv">

<table id="yyglGrid"></table>  
<!-- <div style="background-color: red">sss</div> -->
<div style="float: right;">
<table style="width: 80%"> 
<tr>
<td style="width: 80px;">
合同将到期
</td>
<td style="width: 40px;background-color: yellow;">
</td>

<td style="width: 80px;">
女员工50岁
</td>
<td style="width: 40px;background-color: red;">
</td>

<td style="width: 80px;">
女员工55岁
</td>
<td style="width: 40px;background-color: #FF6600;">
</td>

<td style="width: 80px;">
男员工60岁
</td>
<td style="width: 40px;background-color: blue;">
</td>

<td style="width: 80px;">
合同过期
</td>
<td style="width: 40px;background-color: gray;">
</td>

</tr>
</table>
</div>
</div>
<div id="yyglInfo"></div>
<div id="yyglViewInfo"></div>
<div id="yyglSearchInfo"></div>
<div id="ygHtInfo"></div>


</body>

</html>
