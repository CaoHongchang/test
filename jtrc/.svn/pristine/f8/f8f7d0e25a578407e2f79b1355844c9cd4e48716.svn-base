<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案缺失材料管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/uploadify/css/uploadify.css">
<script type="text/javascript">
	$(function(){
   
          init();
	});
function init(){

 $('#daqsclglGrid').datagrid({    
    url:'../residenceQsInfoTrol/queryResidenceQsInfoList', 
    border:true,
	pageSize:10,
	singleSelect:true,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	//fitColumns:true,
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false, 
	queryParams:{
		dept:"daNum",
		key:window.top.cacheArchive.cacheDpno
	},
   columns:[[    
        {field:'id',title:'选择',checkbox:true,align:'center'},
       {field:'pno',title:'系统编码',width : $(this).width() * 0.1,align:'center'},    
       {field:'dpno',title:'档案号',width : $(this).width() * 0.1,align:'center'},    
       {field:'name',title:'代理人姓名',width: $(this).width() * 0.1,align:'center'},
        {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center',
       	formatter: function(value,row,index){
           if (value == "") {
          	   return value;
			}
            else if (value == '1') {
         	    return "男";
			}else if (value == '0') {
         	    return "女";
		    }else{
				return value;
		    }
	     }},
        {field:'pnum',title:'身份证号',width: $(this).width() * 0.15,align:'center'},
        {field:'tel',title:'联系电话',width: $(this).width() * 0.1,align:'center'},
        {field:'is_s',title:'是否派遣',width: $(this).width() * 0.1,align:'center',
        	formatter: function(value,row,index){
                if (value == 'on') {
              	    return "是";
    			}else if (value == 'off') {
              	    return "否";
    		    }else{
    				return "否";
    		    }
    	     }	},
        {title:'操作',field:'uid12',width: $(this).width() * 0.2,align:'center',
		    		formatter: function(value,row,index){
		    		
		    		/*if(row.id != "" && 'null' != row.id && null != row.id){
		    		
		    			 return '<a href="javascript:add(\''+row.mgid+'\','+row.id+');" style="color: gray;">缺少材料新增</a> <a href="javascript:update('+row.id+')" style="color: blue;" >修改</a>';
		    		
		    		}else{
		    		
		    		 return '<a href="javascript:add(\''+row.mgid+'\','+row.id+');" style="color: blue;">缺少材料新增</a> <a href="javascript:update('+row.id+')" style="color: blue;" >修改</a>';
		    		
		    		}*/
		    		return '<a href="javascript:editDaqscl();" style="color: blue;">缺少材料编辑</a> ';
			    		
			}   
				}
 
   ]],
	onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.id;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.name;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.tel;//联系电话
		setArchiveHead();
	} ,
	onLoadSuccess:function(data){
		$('#daqsclglGrid').datagrid('checkAll');
	}   
});  
	var pager = $('#daqsclglGrid').datagrid('getPager');
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





function add(mgid,id){
	if(id != "" && 'null' != id && null != id){
		alert("该档案已经新增缺少材料!");
		return ;
	}
	$('#gdqsclglInfo').dialog({
    title: '档案缺失材料管理新增',
    width: 650,
    height: 450,
    closed: false,
    cache: false,
    href: '../daxxgl/daqsclglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
<%--			         if($("#fm input[name='dNo']").val() == ""){--%>
<%--				         alert("请填写档案函号");--%>
<%--				         return ;--%>
<%--				     }else if($("#fm input[name='m1']").val() == ""){--%>
<%--				    	 alert("请填写档案（缺失）材料1");--%>
<%--				         return ;--%>
<%--					 }else if($("#fm input[name='m2']").val() == ""){--%>
<%--				    	 alert("请填写档案（缺失）材料2");--%>
<%--				         return ;--%>
<%--					 }else if($("#fm input[name='m3']").val() == ""){--%>
<%--				    	 alert("请填写档案（缺失）材料3");--%>
<%--				         return ;--%>
<%--					 }else if($("#fm input[name='remark']").val() == ""){--%>
<%--				    	 alert("请填写备注说明");--%>
<%--				         return ;--%>
<%--					 }--%>
					 if($('#fm').form('validate')){
					 
					     var fjParam= '';
 						      fjParam=$("#daqfjlbGrid").datagrid("getData");
							 if(fjParam.rows.length>0){
							 fjParam=JSON.stringify(fjParam.rows); 
							 }else{
							 fjParam=null;
							 }
						 $("#fjParam").val(fjParam);	 
						 var data=$('#fm').formSerialize();
				         $.ajax({  
								type: "post",  
								cache: false,  
								url: "../residenceQsInfoTrol/save",  
								data: data,  
								success: function (result) {  
								    if(result == 1){
								    	$.messager.alert('提示',"您已成功新增档案缺少材料！",'info');
										//$.messager.alert('系统提示',"您已成功修改业务信息！");
										//$('#ywEditInfo').dialog('close');
										$('#gdqsclglInfo').dialog('close');
										$('#daqsclglEditGrid').datagrid('reload');
										//$('#ywGrid').datagrid('reload');  
									}else{
										$.messager.alert('系统提示',result);
									}
								}  
							});  
					 }
			    	
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gdqsclglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
           $("#fm input[name='dId']").attr("value",mgid);
           //附件列表
    var href='';
   // href=basePath+"gdcl/clfjList?aid="+aid+"&fileType="+fileType;
    $('#daqfjlbGrid').datagrid({    
    url:href, 
    title:'附件列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	fitColumns:true,
	height: 100,
	width:370,
	toolbar: '',
	sortName: '',
	singleSelect: true,
	sortOrder: 'desc',
	remoteSort: false,
	async : true,
	cache: false,
    columns:[[    
       {field:'',title:'选择',checkbox:true,width:100}, 
       {field:'name',title:'文件名称',width:'70%'},
       {field:'url',title:'文件路径',width:450,hidden:true}, 
       {field:'aid',title:'主表id',width:450,hidden:true},    
       {title:'操作',field:'id',width: '28%',align:'center',
		    formatter: function(value,row,index){debugger
		   
		    var url=row.url;
		    	return ' <a href="#"  style="color: blue;"  onclick="down_Fj(\''+url+'\')">查看</a>     <a href="#"  style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		  }   
		}
  
    ]]    
     });
  
           
           
    } //loadEnd
    

});

}

function update(id){
	if(id == "" || 'null' == id || null == id){
		alert("该档案还未新增缺少材料!");
		return ;
	}
	var rows = $("#daqsclglEditGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
	$('#gdqsclglInfo').dialog({
    title: '档案缺失材料管理修改',
    width: 650,
    height: 450,
    closed: false,
    cache: false,
    href: '../daxxgl/daqsclglEdit.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					if($('#fmEdit').form('validate')){
					var fjParam= '';
 						      fjParam=$("#daqfjlbGrid").datagrid("getData");
							 if(fjParam.rows.length>0){
							 fjParam=JSON.stringify(fjParam.rows); 
							 }else{
							 fjParam=null;
							 }
						 $("#fjParam").val(fjParam);	
					
						 var data=$('#fmEdit').formSerialize();
				         $.ajax({  
								type: "post",  
								cache: false,  
								async: false, 
								url: "../residenceQsInfoTrol/update",  
								data: data,  
								success: function (result) {  
								    if(result == 1){
								    	$.messager.alert('提示',"您已成功修改档案缺少材料！",'info');
										//$.messager.alert('系统提示',"您已成功修改业务信息！");
										//$('#ywEditInfo').dialog('close');
										$('#gdqsclglInfo').dialog('close');
										$('#daqsclglEditGrid').datagrid('reload');
										//$('#ywGrid').datagrid('reload');  
									}else{
										$.messager.alert('系统提示',result);
									}
								}  
							});  
					}
			    	
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gdqsclglInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		$("#fmEdit").form("clear"); 
		$("#fmEdit").form("load",row);
		
		       //附件列表
    var href='';
   href=basePath+"gdcl/clfjList?aid="+id+"&fileType="+20;
    $('#daqfjlbGrid').datagrid({    
    url:href, 
    title:'附件列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	fitColumns:true,
	height: 100,
	width:370,
	toolbar: '',
	sortName: '',
	singleSelect: true,
	sortOrder: 'desc',
	remoteSort: false,
	async : true,
	cache: false,
    columns:[[    
       {field:'',title:'选择',checkbox:true,width:100}, 
       {field:'name',title:'文件名称',width:'60%'},
       {field:'url',title:'文件路径',width:450,hidden:true}, 
       {field:'aid',title:'主表id',width:450,hidden:true},    
       {title:'操作',field:'id',width: '38%',align:'center',
		    formatter: function(value,row,index){debugger;
		    
		    	return ' <a href="#"  style="color: blue;"  onclick="downFj('+value+')">查看</a>     <a href="#" style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		  }   
		}
  
    ]]    
     });
  
		
		
    } //loadEnd
    

});

}

function query(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	$("#daqsclglGrid").datagrid("load",{
		dept:dept,
		key:key,
		pnum:pnum,
		name:name,
		age:age
	});
}

//新增
function addQscl(){
	var selected=$('#daqsclglGrid').datagrid('getSelected');
	if(!selected){
		$.messager.alert('提示','请选择您要操作的档案！','info');
	}else{
		add(selected.mgid,selected.id);
	}
}

//编辑
function updateQscl(){
	var selected=$('#daqsclglEditGrid').datagrid('getSelected');
	if(!selected){
		$.messager.alert('提示','请选择您要操作的档案！','info');
	}else{
		var id=selected.id;
		update(id);
	}
}

//删除
function deleteQscl(){
	var selections=$('#daqsclglEditGrid').datagrid('getSelections');
	if(selections.length==0){
		$.messager.alert('提示','请选择您要删除的缺失材料！','info');
	}else{
		var ids=[];
		for(var i=0;i<selections.length;i++){
			ids.push(selections[i].id);
		}
		$.messager.confirm('确认删除', '确定要删除所选择的缺失材料吗？', function(r){
			if (r){
				$.ajax({
					type:'POST',
					url:'../residenceQsInfoTrol/delete',
					data:{ids:ids},
					dataType:'json',
					success:function(result){
						if(result==1){
							$.messager.alert('提示','成功删除！','info');
							$('#daqsclglEditGrid').datagrid('reload');
						}else{
							$.messager.alert('系统提示',result);
						}
					}
				});
			}
		});


		
	}
}

//档案缺失材料编辑
function editDaqscl(){debugger 
	var selected=$('#daqsclglGrid').datagrid('getSelected');
	if(!selected){
		$.messager.alert('提示','请选择您要操作的档案！','info');
		return;
	}
	$('#daqsclglEdit').dialog({
		title: '档案缺失材料编辑',
	    width: 530,
	    height: 400,
	    closed: false,
	    cache: false,
	    href: '../daxxgl/daqsclglEdit1.jsp',
	    modal: true,
	     buttons:[{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
				   		$('#daqsclglEdit').dialog('close'); 	
					}
				}],
	    iconCls: 'icon-edit',
	    onLoad: function () {
			$('#daqsclglEditGrid').datagrid({
				url:'../residenceQsInfoTrol/queryResidenceQsInfoByDid?d_id='+selected.mgid,
				border:true,
				striped: true,
				collapsible:true,
				height: 380,
				width:490,
				nowrap:true,
				toolbar: '#daqsclTool',
				sortName: '',
				sortOrder: 'desc',
				remoteSort: false, 
				title:'缺失材料列表',
			    columns:[[
			        {field:'id',title:'',checkbox:true},
			        {field:'d_no',title:'函调号',width:160},    
			        {field:'m1',title:'材料名称',width:200},    
			        {field:'remark',title:'备注',width:100,align:'center'}  
			    ]]

			});
	    } 
	});
}

</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include> 

<div id="tb">
   	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
   		<a onclick="editDaqscl();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">缺少材料编辑</a>
   		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>
	<!-- >div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">档案缺失材料新增</a>
	</div -->

</div>
<div>
<select id="dept" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="daNum">档案号</option>     
</select> 
&nbsp;&nbsp;
<input class="easyui-textbox" data-options="iconCls:''" id="key" style="width:150px"> 
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >
&nbsp;&nbsp;
<label>年龄：</label>
<select class="easyui-combobox" value="" name="seachAge" id="searchAge" data-options="editable:false,panelHeight:null" style="width:150px;">
  <option value="">所有</option>
  <option value="30">30以下</option>
  <option value="40">31-40岁</option>
  <option value="50">41-50岁</option>
  <option value="60">51岁以上</option>
</select>
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="daqsclglGrid"></table>  
</div>
<div id="daqsclglEdit"></div>
<div id="gdqsclglInfo"></div>
<div id="gdqsclglEdit"></div>

</body>
</html>
