<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>论文专著鉴定特殊管理</title>

<script type="text/javascript">
   var currentActivity=undefined;
	 $(function(){
   
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
	singleSelect:true,
	pagination:true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
        {field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}   

  
    ]]  ,onClickRow:function( rowIndex, rowData){
    	var id=rowData["id"];
    	$('#fpGrid').datagrid({url:'../zcps/queryDissertationAssign?activityId='+id});
    	currentActivity=rowData;
    },onLoadSuccess:function(data){
        if(data.rows.length>0){
        	currentActivity=data.rows[0];
        $('#fpGrid').datagrid({url:'../zcps/queryDissertationAssign?activityId='+currentActivity.id});
        }
    }    
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
	
	
	$('#fpGrid').datagrid({    
    url:'', 
    	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		singleSelect: true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#zcpshdTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
    columns:[[    
         {field:'lwId',title:'选择',checkbox:true,align:'center'},
        {field:'p_no',title:'论文编号',width : $(this).width() * 0.2,align:'center'},    
        {field:'zpno',title:'专家编号',width : $(this).width() * 0.2,align:'center'},   
        {field:'p_score',title:'成绩',width: $(this).width() * 0.3,align:'center',
        	 formatter: function (value, row, index) { 
        	  //鉴定成绩转换
        	    switch(value){
            case 1:
                  return "优秀";
            break;
            case 2:
            	return "良好";
            break;
            case 3:
            	return "及格";
            break;
            case 4:
            	return "不及格";
            break;
     }
        	 }  
        }
        
  
    ]]    
});  
	var pager = $('#fpGrid').datagrid('getPager');
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


//更改论文分配
function lwfpModifyFuc(){
    var flag=false;
    var errM='';
    var selections=$('#fpGrid').datagrid('getSelections');
    if(selections.length==0){
       $.messager.alert('系统提示','必须先选中至少一篇论文!','info');
       return;
    }
    else{
       if(currentActivity!=undefined&&(!currentActivity.sEndFlag||currentActivity.pEndFlag)){
          $.messager.alert('系统提示','当前状态无法进行专家分配!','info');
         return;
       }
       $.each(selections,function(index,value){
            if(value.id!=null&&(value.init_time!=value.other_time||value.login_data!=null)){
                 errM+='论文编号：'+value.p_no+",专家编号："+value.zpno+";<br>";
                 flag=true;
            }
       });
    }
    if(flag){
        $.messager.alert('系统提示',errM+'专家已启动评审，无法更改分配！','info');
        return;
    }
	$('#lwfpAddInfo').dialog({
    title: '更改论文分配',
    width: 750,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/lwzzjdtsglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			
				    	 var rows=$('#lwfpGrid').datagrid('getRows');
				    	 var lwIds=[],expertIds=[],ids=[];
				    	 var flag=false;
				    	 $.each(rows,function(index,value){
				    		var ed= $('#lwfpGrid').datagrid('getEditor',{index:index,field:'zpno'});
				    		lwIds.push(value.lwId);
				    		ids.push(value.id==null?'0':value.id);
				    		if(ed!=undefined){
				    			expertIds.push($(ed.target).textbox('getValue'));
				    		}else{
				    			expertIds.push(value.zpno==null?'':value.zpno);
				    		}
				    	
				    	 });
				    	 if(rows.length>0){
				    	 lwIds=lwIds.join(',');
				    	 expertIds=expertIds.join(',');
				    	 ids=ids.join(",");
				    	 
				    	 $.post('../zcps/queryDissertationAssignState',{lwIds:lwIds,expertIds:expertIds,length:rows.length,ids:ids},function(result){
				
				    		 if(result.flag){
								 $('#lwfpAddInfo').dialog('close');
				    			 $('#fpGrid').datagrid('reload');
				    			 $.messager.alert('系统提示','保存分配成功！','info');
				    		 }else{
				    			 if(result.cause==''){
				    				 $('#lwfpGrid').datagrid('loadData',result.rows);
				    				 $.messager.alert('系统提示','包含提示错误信息！','error');
				    			 }else{
				    				 $.messager.alert('系统提示',result.cause,'error');
				    			 }
				    		 }
				    	 },'json');
				    	 }
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#lwfpAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   //专家列表
    $('#lwfpGrid').datagrid({    
    url:'', 
    title:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	fitColumns:true,
	height: 330,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'lwId',title:'选择',checkbox:true,width:100}, 
        {field:'p_no',title:'论文编号',width:300},
        {field:'zpno',title:'专家编号',editor:{type:'textbox',options:{required:true}},width:250},
        {field:'errMsg',title:'错误提示',nowrap:false,width:350}
    ]] ,
    onClickRow:function(index,row){
    	$(this).datagrid('beginEdit', index);
    }
    
     });  
	var pager = $('#lwfpGrid').datagrid('getPager');
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
	 $('#lwfpGrid').datagrid('loadData',selections);
	
    } 
	
 
});
	


}
//再次自动分配专家
function autoAsssignExpertAgain(){
	var rows=getSelections();
	if(rows.length==0){
		$.messager.alert('系统提示','请选择要自动分配专家的活动！','info');
		return;
	}
	if(judgeActivityState(rows)){
		$.messager.alert('系统提示','当前状态无法进行专家分配','info');
		
	}else{
	    $.blockUI();
		$.post('../zcps/autoAssignExpertAgain',{activityId:rows[0].id},function(result){
		    $.unblockUI();
		    if(result.flag){
		    	$.messager.alert('系统提示','自动分配专家成功！','info');
		    	$('#fpGrid').datagrid('reload');
		    }else{
		    	$.messager.alert('系统提示',result.cause,'info');
		    }
		},'json');
	}
	
}


// 结束活动论文评审
function cloaseScore(){
    var rows=getSelections();
    if(rows.length==0){
        $.messager.alert('系统提示','请选择要结束评审的活动！','info');
        return;
    }
    if(judgeActivityState(rows)){
        $.messager.alert('系统提示','当前状态无法结束评审','info');
        
    }else{
        $.blockUI();
        $.post('../zcps/cloaseScore',{activityId:rows[0].id},function(result){
            $.unblockUI();
            if(result.flag){
                $.messager.alert('系统提示','结束评审成功！','info');
                $('#fpGrid').datagrid('reload');
            }else{
                $.messager.alert('系统提示',result.cause,'info');
            }
        },'json');
    }   
}

function getSelections(){
	var rows=$('#pshdGrid').datagrid('getSelections');
	return rows;
}

function judgeActivityState(rows){
	var flag=false;
	$.each(rows,function(index,value){
		if(!value.sEndFlag||value.pEndFlag){
			flag=true;
			return true;
		}
	});
	return flag;
}

function query(){
   $('#fpGrid').datagrid('load',{
   });
}

//新增论文分配
function lwfpAddFuc(){
	    var selections=$('#pshdGrid').datagrid('getSelections');
	    if(selections.length==0){
	       $.messager.alert('系统提示','必须先选择一个活动!','info');
	       return;
	    }
	    else{
	       //debugger;
	       if(currentActivity!=undefined&&currentActivity.hEndFlag){
	          $.messager.alert('系统提示','活动状态已办结!','info');
	         return;
	       }
	       if(!currentActivity.sEndFlag||currentActivity.pEndFlag){
	          $.messager.alert('系统提示','当前状态无法进行专家分配!','info');
	         return;
	       }
	 
	    }
	$('#lwfpAddInfo').dialog({
    title: '新增论文分配',
    width: 750,
    height: 450,
    closed: false,
    cache: false,
    href: '../zcsbgl/lwzzjdtsglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					
			    	 if($('#lwAssignForm').form('validate')){
			    		 var rows=$('#lwfpGrid').datagrid('getRows');
				    	 var pnos=[];
				    	 var expertIds=[];
				    	 var flag=false;
			    	 $.each(rows,function(index,value){
			    		
			    		var ed1= $('#lwfpGrid').datagrid('getEditor',{index:index,field:'zpno'});
			    		var ed2= $('#lwfpGrid').datagrid('getEditor',{index:index,field:'p_no'});
			    		if(ed1!=undefined){
				    		pnos.push($(ed2.target).textbox('getValue'));
				    		expertIds.push($(ed1.target).textbox('getValue'));
			    		}else{
			    		   pnos.push(value.p_no!=undefined&&value.p_no!=null?value.p_no:'');
				    	   expertIds.push(value.zpno!=undefined&&value.zpno!=null?value.zpno:'');
			    		}
			    		
			    	 });
			    	 if(rows.length>0){
			    	 		pnos=pnos.join(',');
			    	 		expertIds=expertIds.join(',');
			    	 		$.post('../zcps/queryDissertationAssignState',{pnos:pnos,expertIds:expertIds,activityId:currentActivity.id,length:rows.length},function(result){
			    		 	if(result.flag){
							   $('#lwfpAddInfo').dialog('close');
			    			   $('#fpGrid').datagrid('reload');
			    			   $.messager.alert('系统提示','保存分配成功！','info');
			    			   
			    		    }else{
			    			  if(result.cause==''){
			    				  $('#lwfpGrid').datagrid('loadData',result.rows);
			    				  $.messager.alert('系统提示','包含提示错误信息！','error');
			    			  }else{
			    				 $.messager.alert('系统提示',result.cause,'error');
			    			  }
			    		 }
			    	  },'json');
			    	}
				}
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#lwfpAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
   var editIndex = undefined;
    $('#lwfpGrid').datagrid({    
    url:'', 
    title:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	fitColumns:true,
	height: 330,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
	toolbar:[{
        text: '新增行', iconCls: 'icon-add', handler: function () {
            if (endEditing()){
            	var length=$('#lwfpGrid').datagrid('getRows').length;
            	if(length==0){
                      $('#lwfpGrid').datagrid('appendRow',{status:'P'});
            	}else{
            		var result=$('#lwAssignForm').form('validate');
            		if(result){
            			$('#lwfpGrid').datagrid('appendRow',{status:'P'});
            		}
            	}
                editIndex = $('#lwfpGrid').datagrid('getRows').length;
                $('#lwfpGrid').datagrid('selectRow', editIndex).datagrid('beginEdit', length);
                
            }
			}
    	},{
	text:'删除行',iconCls:'icon-remove',handler:function(){
		if(endEditing()){
		var selections=$('#lwfpGrid').datagrid('getSelections');
		 $.each(selections,function(index,value){
			  $('#lwfpGrid').datagrid('deleteRow',$('#lwfpGrid').datagrid('getRowIndex',value));
		 });
		 editIndex-=selections.length;
		}
	}
}],
    columns:[[    
       {field:'id',title:'选择',checkbox:true,width:100}, 
        {field:'p_no',title:'论文编号',editor:{type:'textbox',options:{required:true}},width:300},    
        {field:'zpno',title:'专家编号',editor:{type:'textbox',options:{required:true}},width:250},
        {field:'errMsg',title:'错误提示',nowrap:false,width:350}
    ]], onClickRow:function(index,row){
    	$(this).datagrid('beginEdit', index);
    }   
     });  
	var pager = $('#lwfpGrid').datagrid('getPager');
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
	 
	function endEditing(){
        if (editIndex == undefined){return true;}
        if ($('#lwfpGrid').datagrid('validateRow', editIndex)){
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
	
    }  
 
});


}
//删除论文分配
function deleteAssign(){
 	var selections=$('#fpGrid').datagrid('getSelections');
 	if(selections.length==0){
 		$.messager.alert('系统提示','请至少选择一条论文删除论文分配！','info');
 	  return; 
 	}
 	var lwIds=[];
 	var expertIds=[];
 	var flag=false;
 	debugger;
 	$.each(selections,function(index,value){
 	    //分配了专家，当专家尚未登录（剩余评审时长等于初始评审时长，或者登录时间为null）
 	    if(value.id!=null&&(value.p_score==null||value.p_score==0)&&(value.init_time==value.other_time||value.login_date!=null)){
 		    lwIds.push(value.lwId);
 		    expertIds.push(value.expert_id);
 		}
 		if(value.p_score!=null||((value.p_score==null||value.p_score==0)&&value.expert_id==null)){//论文成绩不为null或者论文成绩为null且未分配专家
 			flag=true;
 			return true;
 		}
 	});
 	if(!flag){
 		$.messager.alert('系统提示','论文成绩不为空或者论文成绩为空且未分配专家 ,无法删除分配','info');
 		return;
 	}
	lwIds=lwIds.join(",");
 	expertIds=expertIds.join(",");
    if(lwIds!=''){
 	$.messager.confirm('确定删除','确定删除分配？',function(flag){
 		if(flag){
 			$.post('../zcps/deleteDissertationAssign',{lwIds:lwIds,expertIds:expertIds},function(result){
 		 	     if(result.flag){
 		 	    	 $('#pshdGrid').datagrid('reload');
 		 	    	 $('#fpGrid').datagrid('reload');
 		 	        $.messager.alert('系统提示','删除论文分配成功！','info');
 		 	        
 		 	     }else{
 		 	        $.messager.alert('系统提示',result.cause,'error');
 		 	     }
 		 	},'json');
 		}
 		
 	});
 	}else{
 	  $.messager.alert('系统提示','当前没有合适删除的分配！','info');
 	}
 	
}
</script>


<body style="margin: 1px;">
 <div id="zcpshdTool"  style="background-color:#FFFFFF;">
        <a onclick="cloaseScore()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">结束活动论文评审</a> 
		<a onclick="autoAsssignExpertAgain()" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">2次自动分配专家</a> 
		<a onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a  onclick="deleteAssign()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除论文分配</a>
		<a  onclick="lwfpModifyFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">更改论文分配</a>
		<a  onclick="lwfpAddFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >新增论文分配</a>
	
		

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">   

    <div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>  
    
    
    </div>   
    <div data-options="region:'center',title:'专家列表',border:false" style="">
         <table id="fpGrid"></table>  
    </div>   
</div>  



<div id="lwfpAddInfo"></div> 
<div id="zjShowInfo"></div> 


</body>
</html>
