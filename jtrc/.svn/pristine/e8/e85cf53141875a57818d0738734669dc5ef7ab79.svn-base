<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>专家组管理</title>

<script type="text/javascript">
var session_uid = "<%=request.getSession().getAttribute("uid")%>";
var session_name = "<%=request.getSession().getAttribute("userName")%>";
	 $(function(){
	 
	 
	 
    $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $("#d").hide();
	   $("#e").hide();
	    $("#f").hide();
	    $("#g").hide();
	    $("#h").hide();
	    $("#i").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==232){
				$("#a").show();
			}else if(value==233){
				$("#b").show();
			}else if(value==234){
				$("#c").show();
			}else if(value==235){
				$("#d").show();
			}else if(value==236){
				$("#e").show();
			}else if(value==237){
				$("#f").show();
			}else if(value==238){
				$("#g").show();
				$("#h").show();
				$("#i").show();
				
			}
	});
    },"json");
    
		 $('#zjGrid').datagrid({    
			    url:'', 
	border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	width:'100%',
	toolbar: '',
	pagination: true, 
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,   
			    columns:[[    
			         {field:'id',title:'选择',checkbox:true,align:'center'},
			        {field:'zpno',title:'专家编码',width : fixWidth(0.2),align:'center'},    
			        {field:'name',title:'专家姓名',width : fixWidth(0.2),align:'center'},   
			        {field:'pnum',title:'身份证号',width: fixWidth(0.2),align:'center'},
			          {field:'sex',title:'性别',width: fixWidth(0.2),align:'center',
        	formatter: function(value,row,index){
            if (value == '1') {
          	    return "男";
			}else if (value == '0') {
          	    return "女";
		    }else{
				return value;
		    }
	     }},
			         {field:'pro_type',title:'专业类别',width:fixWidth(0.2),align:'center'},
			         {field:'zg_level',title:'资格级别',width: fixWidth(0.2),align:'center'},
			         {field:'company',title:'工作单位',width: fixWidth(0.2),align:'center'},
			         {field:'tel',title:'联系电话',width: fixWidth(0.2),align:'center'},
			         {title:'操作',field:'uid',width: fixWidth(0.2),align:'center',
			         formatter: function(value,row,index){
							 return "<a href=\"javascript:zjglShowFuc("+index+")\" style='color: blue;'  >查看<a> <a href=\"javascript:deleteExpert(1,"+row.id+")\" style='color: blue;' >删除</a> <a href=\"javascript:initReviewTime("+index+")\" style='color: blue;'>初始化</a>";
						}
			         }
			  
			    ]]    
			});  
				var pager1 = $('#zjGrid').datagrid('getPager');
				pager1.pagination({
					beforePageText : '第',// 页数文本框前显示的汉字
					afterPageText : '/ {pages} 页',
					displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
					buttons : [ {
						iconCls : 'icon-excel',
						handler : function() {
						}
					} ]
				});
   $('#pshdGrid').datagrid({    
    url:'../zcps/queryShLeftPageList', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: '100%',
	toolbar: '',
	singleSelect: true,
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
    {field:'id',title:'选择',align:'center',checkbox:true},
   {field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
   {field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}    
    ]],
    onClickRow:function(rowIndex, rowData){
        var id = rowData["id"];
       
       
        	$('#zjGrid').datagrid({url:'../zcsb/queryExpertActivityInfos?activityId='+id});
        	$('#zjGrid').datagrid('load',{activityId:id});
    },
   /*
    onLoadSuccess:function(data){
    	if(data.rows.length>0){//为了公用一条sql
    		$('#zjGrid').datagrid({url:'../zcsb/queryExpertActivityInfos?activityId='+data.rows[0].id});
    		$('#zjGrid').datagrid('load',{activityId:data.rows[0].id});
       }
    }
    */
  });  
   
 
	var pager = $('#pshdGrid').datagrid('getPager');
		pager.pagination({
					beforePageText : '第',// 页数文本框前显示的汉字
					afterPageText : '/ {pages} 页',
					displayMsg : '',
					buttons : [ {
						iconCls : 'icon-excel',
						handler : function() {
						}
					} ]
				});
	
	
	
	
	});



function zjglAddFuc(){
	var row=$('#pshdGrid').datagrid('getSelected');
	if(row==null){
		$.messager.alert('系统提示','请选择需要添加专家的活动！','info');
		return;
	}else if(row.enddate.time<new Date().getTime()){
		$.messager.alert('系统提示','该活动已经结束，不能添加专家！','info');
		return;
	}
	$('#zjglAddInfo').dialog({
    title: '专家新增',
    width: 750,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zjglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				   var selections=$('#zjAddGrid').datagrid('getSelections');
				   if(selections.length>0){
					   var expertIds='';
					   $.each(selections,function(index,value){
					       expertIds+=value.id+','; 	
					   });
					   expertIds=expertIds.substring(0,expertIds.length-1);
					   $.post('../zcsb/saveExpertActivityInfos',{activityId:row.id,expertIds:expertIds},function(result){
						   result=eval("("+result+")");
						   if(result.flag){
							   $('#zjglAddInfo').dialog('close');
							   $.messager.alert('系统提示','为活动新增专家成功！','info');
							   $('#zjGrid').datagrid('reload');
						   }else{
							   $.messager.alert('系统提示',result.cause,'info');
						   }
					   });
				   }else{
					   $.messager.alert('系统提示','您尚未选择要添加的专家或者系统中暂不存在专家信息！','info');
				   }
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zjglAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
   //专家列表
    $('#zjAddGrid').datagrid({    
    url:'../zcsb/queryExpertActivityInfos', 
    title:'专家列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	pagination:true,
	fitColumns:true,
	height: 330,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'id',title:'选择',checkbox:true,width:100}, 
        {field:'zpno',title:'专家编码',width:300},    
        {field:'name',title:'专家姓名',width:250},
        {field:'pnum',title:'身份证号',width:350},    
        {field:'sex',title:'性别',width:150},    
        {field:'pro_type',title:'专业类别',width:250},    
        {field:'zg_level',title:'资格级别',width:250},  
        {field:'company',title:'工作单位',width:450},
        {field:'tel',title:'联系电话',width:150}      
    
    ]]    
     });  
	var pager = $('#zjAddGrid').datagrid('getPager');
	pager.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	 

    }  
 
});


}



function zjglShowFuc(index){
   var row='';
    if(index==''){
       row=$('#zjGrid').datagrid('getSelected');
    }else{
       row=$('#zjGrid').datagrid('getRows')[index];
    }
    if(row==''||row==null){
      $.messager.alert('系统提示','请选择您要查看的专家！','info');
      return;
    }
	$('#zjShowInfo').dialog({
    title: '专家查看',
    width: 750,
    height: 330,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zjglShow.jsp',
    modal: true,
     buttons:[
       
			{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zjShowInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
       $('#fm').form('load',row);
    }  
 
});

	

}
 //删除活动专家
 function deleteExpert(type,params){
  if(confirm("确定要删除数据吗？"))   {	
	 if(type==0){
	       var activityRows=$('#pshdGrid').datagrid('getSelections');
	       if(activityRows.length>0){
	    	   $.each(activityRows,function(index,value){
	    		   params+=value.id+","; 
	    	   });
	    	   params="activityIds="+params.substring(0,params.length);
	       }
	 }else{
		 if(params==''){
			 var expertRows=$('#zjGrid').datagrid('getSelections');
			 if(expertRows.length>0){
		    	   $.each(expertRows,function(index,value){
		    		  
		    		      params+=value.id+","; 
		    		 
		    	   });
		    	   params="expertIds="+params.substring(0,params.length);
		     }
		 }else{
			 params="expertIds="+params;
		 }
	 }
	 if(params==''){
		 $.messager.alert('系统提示','请选择活动点击删除所有专家或者选择专家点击删除！','info');
	 }else{
		 $.post('../zcsb/deleteExpertActivitys',params,function(result){
			result=eval("("+result+")"); 
			if(result.flag){
				$('#zjGrid').datagrid('reload');
				$.messager.alert('系统提示','删除活动专家成功！','info');
			}else{
				$.messager.alert('系统提示',result.cause,'info')
			}
		 });
	 }
	 }
 }
 
 function query(){
	  $('#searchInfo').dialog({    
		    title: '',    
		    width: 500,    
		    height: 300,    
		    closed: false,    
		    cache: false,    
		    href: '../zcsbgl/zjzSearch.jsp',    
		    modal: true,
		      buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#searchInfo').dialog('close');
						}
					}]   
		}); 
		
	/* $('#zjGrid').datagrid('load',{
		 
	 });*/
 }
 //初始化所有专家评审时长 
 function initReviewTime(index){
     var ids=[];
     var aid = "";
     if(index==''){
        var rows=$('#zjGrid').datagrid('getSelections');
        $.each(rows,function(i,value){
          ids.push(value.id);
        });
        
        if(ids.length==0){
            $.messager.alert('系统提示','请选择您要初始化评审时长的专家!','info');
	     }else{
	        ids=ids.join(',');
	         $.post('../zcsb/initExpertReviewTime',{ids:ids},function(result){
	             $.messager.alert('系统提示',result.cause,'info');
	             if(result.flag){
	             $('#zjGrid').datagrid('reload');
	             }
	         },'json');
	     }
     }else{
        //var row=$('#zjGrid').datagrid('getRows')[index];
        //ids.push(value.id);
        var row=$('#pshdGrid').datagrid('getSelected');
	    if(row==null){
	        $.messager.alert('系统提示','请选择需要添加专家的活动！','info');
	        return;
	    }
 
        $.post('../zcsb/initExpertReviewTime',{  aid: row.id},function(result){
                 $.messager.alert('系统提示',result.cause,'info');
                 if(result.flag){
                 $('#zjGrid').datagrid('reload');
                 }
             },'json');
     }
     /*
     if(ids.length==0){
        $.messager.alert('系统提示','请选择您要初始化评审时长的专家!','info');
     }else{
        ids=ids.join(',');
         $.post('../zcsb/initExpertReviewTime',{ids:ids},function(result){
             $.messager.alert('系统提示',result.cause,'info');
             if(result.flag){
             $('#zjGrid').datagrid('reload');
             }
         },'json');
     }*/
     
 }
 
 function initReviewTime2(index){
     var ids=[];
   
    $.messager.confirm('确定设置评审时长','确定设置评审时长吗？',function(flag){
                             if(flag){
   
        var rows=$('#zjGrid').datagrid('getData');
       /*  $.each(rows,function(i,value){
          ids.push(value.id);
        }); */
        
       for(var i=0;i<rows.rows.length;i++){
            ids.push(rows.rows[i].id);
       }
    
     if(ids.length==0){
        $.messager.alert('系统提示','请选择您要初始化评审时长的专家!','info');
     }else{
        ids=ids.join(',');
         $.post('../zcsb/initExpertReviewTime',{ids:ids},function(result){
             $.messager.alert('系统提示',result.cause,'info');
             if(result.flag){
             $('#zjGrid').datagrid('reload');
             }
         },'json');
     }
     }});
 }
 
 
 function setReviewTimeAll(index){
 
	  	$('#zjShowInfo1').dialog({
	    title: '设置评审时长',
	    width: 300,
	    height: 150,
	   
	    closed: false,
	    cache: false,
	    href: '../zcsbgl/zjglSetTime.jsp',
	    modal: true,
	     buttons:[
	            {
	               text:'保存',
	               iconCls:'icon-save',
	               handler:function(){
	            	   var rows=$('#zjGrid').datagrid('getData');
	            	   var ids=[];
	                   for(var i=0;i<rows.rows.length;i++){
	                        ids.push(rows.rows[i].id);
	                   }
	                   var init_time=$("#init_time_edit").textbox("getValue");
	                   if(ids.length==0){
	                       $.messager.alert('系统提示','请选择您要设置评审时长的专家!','info');
	                       $('#zjShowInfo1').dialog('close');
	                    }else{
	                   		ids=ids.join(',');
		                   $.post('../zcsb/setReviewTimeAll',{ids:ids,init_time:init_time},function(result){
	                           if(result.flag){
	                               $.messager.alert('系统提示',result.cause,'info');
	                               $('#zjGrid').datagrid('reload');
	                               $('#zjShowInfo1').dialog('close');
	                           }else{
	                              $.messager.alert('系统提示',result.cause,'error');
	                           }
	                       },'json');
	                 }
	               }
	            },
				{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#zjShowInfo1').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    close: function () {
                $(this).dialog("destroy").remove();   
        }
	  });
 }
 
 
 
 
 
 function setReviewTime(){
 console.log("查看评审时长");
    var row=$('#zjGrid').datagrid('getSelected');
    if(row!=null){
  	$('#zjSetTimeInfo').dialog({
    title: '查看评审时长',
    width: 750,
    height: 330,
    closed: false,
    cache: false,
    href: '../zcsbgl/zjglShow.jsp',
    modal: true,
     buttons:[
			{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				    $('#zjSetTimeInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
     close: function () {
                $(this).dialog("destroy").remove();   
        },
    onLoad: function () {
		 $('#fm').form('load',row);
		 $.ajax({
		    url: "../zcsb/getuserExpertInfo",
		    type:"post",
		    data:{id:row.id},
		    dataType: "json",
		    success: function(data){
		      if(data!=''){
				$("#other_time").numberbox('setValue',data.otherTime);
		      }    
		        },
		    error:function(data){
		      alert("网络故障！");
            }
    
        });
     /*  */
       
      
       /*
       
       $('#init_time').numberbox({
          onChange:function(newValue,oldValue){
              $('#other_time').numberbox('setValue',newValue);
          }
       });
      */
    }  
 
});
    }else{
       $.messager.alert('系统提示','请选择您要查看的专家！','info');
    }
 }
 
 
 function exportMbFuc(){
          window.location.href="../zcsb/zjDownload";
  } 
		

//导入专家
    function plExportFuc(){
	$("#addXlFileForm2").ajaxSubmit({
		dataType:"html",
		url : "../zcsb/zjUpload",
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
				 addqydrFuc(result.rows);
				
			}else{
			      $.messager.alert('错误','操作失败！'+result.cause,'error');
			}
		},
		error : function(data) {
			 errorMsg();
		}
	});

} 


function addqydrFuc(dates){
	$('#zjglInfo').dialog({
    title: '专家导入',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../zcsbgl/zjdrAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){ 
				   saveQy(dates);
				   $('#zjglInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zjglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    debugger;
   //专家
    $('#zjdrGrid').datagrid({    
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
        {field:'businessId',title:'活动编码',width: $(this).width() *0.15},
     
        {field:'pnum',title:'身份证',width: $(this).width() *0.15},
        {field:'name',title:'专家',width: $(this).width() *0.15},
       
        {field:'cwts',title:'错误提示',width: $(this).width() *0.5}
        
        ]]    
     });  
	var pager = $('#zjdrGrid').datagrid('getPager');
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
	$('#zjdrGrid').datagrid('loadData',dates);
	

    
    } //loadEnd
    

});

}	


var dateFlag=null;
var infoMsg=null;
//成绩保存
function saveQy(dates){
   if(dateFlag=='true'){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
 
   if(infoMsg!=''&&infoMsg!=null){  
    var m="存在已保存的记录："+infoMsg;
    $.messager.confirm('确认', m+'您确认想要覆盖记录吗？',function(r){    
    if (r){    
         savaQy2(dates);
         infoMsg='';
    }else{
    infoMsg='';
       return;
    }    
   });  
  }else{
  savaQy2(dates);
  infoMsg='';
  }

   
}		
		
	
function savaQy2(dates){
  $.blockUI();
    $.ajax({
                url: "../zcsb/addZjList",
                type: "POST",
                contentType : "application/json;charset=utf-8", 
                dataType:"json",
                data: JSON.stringify(dates),
                  async: true,
                success: function(data){
                  $.unblockUI();
                if(data.flag ==true){
                    
                      successMsg();
                     // $('#tpglGrid').datagrid('reload');
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
		
</script>


<body style="margin: 1px;">
 <div id="zcpshdTool"  style="background-color:#FFFFFF;">
<div style="float:left">
		<a id="a"  class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="zjglAddFuc()">新增</a>
		<a id="b" onclick="zjglShowFuc('');" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
		<a id="c" onclick="deleteExpert(1,'')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="d" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a id="e" onclick="initReviewTime2('')" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">初始化所有专家评审时长</a>
		<a id="f" onclick="deleteExpert(0,'')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除所有专家</a>
		<a id="g"  onclick="setReviewTimeAll();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">设置评审时长</a>
		<a id="h" onclick="exportMbFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出空白专家模板</a>
		<a id="i" onclick="exportZjFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">抽取专家并导出</a>
		<a id="j"  onclick="setReviewTime();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">查看评审时长</a>
		
</div>
 <div style="float:left">
        <form id="addXlFileForm2" method="post" enctype="multipart/form-data" style="width: 160px;height: 10px" >
		<a id="drwj" href="javascript:;"   class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">
        <input  onchange="plExportFuc()" id="ygfile" name= "ygfile" type="file" style="cursor:pointer;filter: alpha(opacity=0);position: absolute;right: 0;top: 5px;opacity: 0;">导入专家</a>
         </form>
       </div>
</div>
	
	
<div id="cc" class="easyui-layout"  data-options="fit:true,border:false">   

    <div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>  
    
    
    </div>   
    <div data-options="region:'center',title:'专家列表',border:false" style="">
         <table id="zjGrid"></table>  
    </div>   
</div>  



<div id="zjglAddInfo"></div> 
<div id="zjShowInfo"></div>
<div id="zjShowInfo1"></div>
<div id="zjSetTimeInfo"></div> 
<div id="zjSetTimeInfo1"></div> 
<div id="zjglInfo"></div> 
<div id="searchInfo"></div>
</body>
</html>
