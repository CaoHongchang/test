<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>




<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>学历教育</title>

<script type="text/javascript">

var sx = false;
	$(function(){
	
	/* $("#sygzxz").hide();
    $("#qygzxz").hide();
    $("#dcgz").hide();
    $("#cx").hide(); */
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			/* if(value==177){
				$("#sygzxz").show();
			}else if(value==178){
				$("#qygzxz").show();
			}else if(value==179){
				$("#dcgz").show();
			}else if(value==180){
				$("#cx").show();
			}else if(value==181){
				xg=true;
			}else if(value==182){
				sc=true;
			} */
	});
    },"json");
      queryXljy(null);
  

	
	
	});

function queryXljy(param){
 $('#xljyGrid').datagrid({    
    url:basePath+"xljy/xljyView",
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	pagination: true, 
	fitColumns:true,
	height: wholeHeight,
	width:'100%',
	//singleSelect:true,
	//toolbar: '#ywflglTool',
	queryParams: {
		param: param
		
	},  
	//fit:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
    columns:[[    
         {field:'',title:'选择',checkbox:true,align:'center'},
        {field:'educationNum',title:'教育编号',width : fixWidth(0.2),align:'center'},    
        {field:'registerLevel',title:'报考层次',width : fixWidth(0.2),align:'center'},    
        {field:'learnType',title:'学习形式',width: fixWidth(0.2),align:'center'},
         {field:'educationSchool',title:'报考院校',width: fixWidth(0.2),align:'center'},
         {field:'educationMajor',title:'报考专业',width: fixWidth(0.2),align:'center'},
         {field:'startTime',title:'开始时间',width: fixWidth(0.2),align:'center'},
         {field:'endTime',title:'结束时间',width: fixWidth(0.2),align:'center'},
         {field:'status',title:'有效性',width:fixWidth(0.2),align:'center'},
         {title:'操作',field:'id',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
		    		  //if(sx)
		    		  if(row.status=='有效')
 				      return '<a id="sx" style="color: blue;"  onclick="statusFuc('+value+',1)">失效</a> <a id="sx" style="color: blue;"  onclick="editKtFuc('+value+')">修改</a> <a id="sx" style="color: blue;"  onclick="viewKtFuc('+value+')">查看</a> <a href="#" id="sc" style="color: blue;"  onclick="delxlFuc(\''+row.id+'\',\''+row.educationNum+'\')">删除</a>';
 				      if(row.status=='失效')
 				      return '<a id="sx" style="color: blue;"  onclick="statusFuc('+value+',2)">有效</a>  <a id="sx" style="color: blue;"  onclick="editKtFuc('+value+')">修改</a> <a id="sx" style="color: blue;"  onclick="viewKtFuc('+value+')">查看</a> <a href="#" id="sc" style="color: blue;"  onclick="delxlFuc(\''+row.id+'\',\''+row.educationNum+'\')">删除</a>';
				     
				}   
				}
  
    ]]    
});  
	var pager = $('#xljyGrid').datagrid('getPager');
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


//删除用户
function delxlFuc(id,educationNum){
$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
    if (r){    
       
if(id=='' || id==null){
$.messager.alert('错误','用户id为空，操作失败！','error');
return;
}
$.ajax({
                url: basePath+"xljy/delXljy?id="+id+"&educationNum="+educationNum,
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                 async: true,
                success: function(data){
                if(data.flag ==true){
                     //$('#xybmGrid').datagrid('reload');
                      queryXljy('');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！'+data.cause,'error');
					}	
                },
                error: function(data){
                  
                   errorMsg();

                }
            });
       
    }    
});

}




function statusFuc(id,value){
 $.messager.confirm('确认','您确认想要修改记录吗？',function(r){    
    if (r){   
    var url = basePath+'xljy/editXljy';  
            $.ajax({  
		    type:'post',  
		    url:url,  
		    dataType: 'json', 
		    data: {
                'status': value,
                'id':id
            },
		    success:function(data) {
			if(data.flag ==true){
                     //$('#yyglGrid').datagrid('reload');
                     queryXljy('');
                      successMsg();
                    
					}else{
					   $.messager.alert('错误','操作失败！','error');
					}	
			
			
		    },error : function(data) {
			   errorMsg();
		   }  
	      });
    }
    });
    
       
  
}

function searchxljyDiv(){
   
    $('#xljySearchInfo').dialog({    
    title: '',    
    width: 1000,    
    height: 300,    
    closed: false,    
    cache: false,    
    href: basePath+"/xljygl/xljySearch.jsp",    
    modal: true,
      buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xljySearchInfo').dialog('close');
				}
			}]   
}); 
    
}




function ksktFuc(){
	$('#xljyInfo').dialog({
    title: '开设课程',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xljyAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				 saveKsbjFuc();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xljyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
 var  editor = CKEDITOR.replace('remark1');
    
    } //loadEnd
    

});

}


function editKtFuc(id){
if(id==''&&!isCheckOne("#xljyGrid")){
    return;
  } 
	$('#xljyInfo').dialog({
    title: '修改课程',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xljyEdit.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				 saveKsbjFuc();
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xljyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    var  editor = CKEDITOR.replace('remark1');
   $("#id").val(id);
    //页面表单数据加载
     $.ajax({
                url: basePath+"xljy/kcMsg?id="+id,
                type: "POST",
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
               	    $("#xsbjForm3").form('load', data.rows);//赋值给表单
               	  // alert(data.rows.remark);
                      $("#remark").val(data.rows.remark);
                      $("#remark1").val(data.rows.remark);
                      
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
    
  
    
    } //loadEnd
    

});

}


function viewKtFuc(id){
if(id==''&&!isCheckOne("#xljyGrid")){
    return;
  } 
	$('#xljyInfo').dialog({
    title: '查看课程',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../xljygl/xljyView.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#xljyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    var  editor = CKEDITOR.replace('remark1');
   $("#id").val(id);
    //页面表单数据加载
     $.ajax({
                url: basePath+"xljy/kcMsg?id="+id,
                type: "POST",
                dataType:"json",
                async: false,
                success: function(data){
                if(data.flag ==true){
               	    $("#xsbjForm3").form('load', data.rows);//赋值给表单
               	  // alert(data.rows.remark);
                      $("#remark").val(data.rows.remark);
                      $("#remark1").val(data.rows.remark);
                      
				}else{
					  $.messager.alert('错误','操作失败！','error');
				 }	
                },
                error: function(data){
                   $.messager.alert('错误','操作失败！','error');

                }
            });
    
  
    
    } //loadEnd
    

});

}



</script>


<body style="margin: 1px;">
 

<form id="xljyForm" method="post"  >

<div id="tb">
   
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="ksktFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="sygzxz">开设课程</a>
		<a onclick="searchxljyDiv();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="cx">查询</a>
        <a id="dcmb" onclick="exportgzFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">失效</a>
	</div>

</div>
</form>
<div>
<table id="xljyGrid"></table>  
</div>
<div id="gzglInfo"></div>
<div id="xljySearchInfo"></div>
<div id="xljyInfo"></div>
</body>
</html>
