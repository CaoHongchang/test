<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<title>档案新增</title>
</head>
<body>
	<script type="text/javascript">
	$(function(){

		//权限设置
	 	$("#a1").hide();$("#a2").hide();$("#a3").hide();$("#a4").hide();$("#a5").hide();
	 	$("#a6").hide();$("#a7").hide();$("#a8").hide();$("#a9").hide();$("#a10").hide();
	 	
	    $("#b1").hide();$("#b2").hide();$("#b3").hide();$("#b4").hide();$("#b5").hide();
	    $("#b6").hide();$("#b7").hide();$("#b8").hide();$("#b9").hide();$("#b10").hide();
	    
	    $("#c1").hide();$("#c2").hide();$("#c3").hide();$("#c4").hide();$("#c5").hide();
	    $("#c6").hide();$("#c7").hide();$("#c8").hide();$("#c9").hide();$("#c10").hide();
	    
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==341){
				$("#a1").show();$("#a2").show();$("#a3").show();$("#a4").show();$("#a5").show();
	 			$("#a6").show();$("#a7").show();$("#a8").show();$("#a9").show();$("#a10").show();
			}else if(value==342){
				$("#b1").show();$("#b2").show();$("#b3").show();$("#b4").show();$("#b5").show();
	    		$("#b6").show();$("#b7").show();$("#b8").show();$("#b9").show();$("#b10").show();
			}else if(value==343){
				$("#c1").show();$("#c2").show();$("#c3").show();$("#c4").show();$("#c5").show();
				$("#c6").show();$("#c7").show();$("#c8").show();$("#c9").show();$("#c10").show();
			}
	});
    },"json");
    });
	
	 

	 var dgs=['llclGrid','zcclGrid','jdkhclGrid','xlhppzyzwGrid','zsclGrid','dyclGrid','jlclGrid','cfclGrid','gzbdclGrid','qtclGrid'];
	 var currentIndex='';//当前的选项卡
	 function initGrid(index){
	 if(index==0){
	      //履历材料
	$('#llclGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	rownumbers:true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	toolbar: '#llclUpload',
	pagination:false,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {field:'sort',type:'hidden',title:'排序字段',},
        {title:'操作',field:'uid',width: $(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
				return operator(row,index,0,'1');
			}   
			}
      ]]    
     });  
	var pager1 = $('#llclGrid').datagrid('getPager');
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
	}
	else if(index==1){
	  //自传材料
	   $('#zcclGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	rownumbers:true,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#zzclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,1,'2');
			}   
			}
         
    
    ]]    
     });  
	var pager2 = $('#zcclGrid').datagrid('getPager');
	pager2.pagination({
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
	else if(index==2){	
	  //鉴定考核考察材料
	   $('#jdkhclGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	rownumbers:true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#jdkhkcclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,2,'3');
			}   
			}
         
    
    ]]    
     });  
	var pager3 = $('#jdkhclGrid').datagrid('getPager');
	pager3.pagination({
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
  else if(index==3){
  //学历和评聘专业职务材料
   $('#xlhppzyzwGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	rownumbers:true,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#xlhppzyzwclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'ptypeName',title:'材料类型',width:$(this).width() * 0.15,formatter:function(value,row,index){
        	if(value=='1'){
        		return '4-1学历学位材料';
        	}else if(value=='2'){
        		return '4-2技术职务材料';
        	}else if(value=='3'){
        		return '4-3科研学术材料';
        	}else if(value=='4'){
        		return '4-4培训材料';
        	}
        }},
      
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width: $(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,3,'4');
			}   
			}
         
    
    ]]    
     });  
	var pager4 = $('#xlhppzyzwGrid').datagrid('getPager');
	pager4.pagination({
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
	else if(index==4){
  //政审材料
   $('#zsclGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	rownumbers:true,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#zsclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,4,'5');
			}   
			}
         
    
    ]]    
     });  
	var pager4 = $('#zsclGrid').datagrid('getPager');
	pager4.pagination({
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
	 else if(index==5){
	  //党员材料
	  
	  $('#dyclGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	rownumbers:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	toolbar: '#dyclUpload',
	sortName: '',
	pagination:false,
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,5,'6');
			}   
			}
         
    
    ]]    
     });  
	var pager5 = $('#dyclGrid').datagrid('getPager');
	pager5.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	  
}else if(index==6){
	  //奖励材料
	  	  $('#jlclGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	rownumbers:true,
	width:'100%',
	pagination:false,
	toolbar: '#jlclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,6,'7');
			}   
			}
         
    
    ]]    
     });  
	var pager6 = $('#jlclGrid').datagrid('getPager');
	pager6.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	}else if(index==7){
  //处分材料
  	  $('#cfclGrid').datagrid({    
    url:'', 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	rownumbers:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#cfclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,7,'8');
			}   
			}
         
    
    ]]    
     });  
	var pager6 = $('#cfclGrid').datagrid('getPager');
	pager6.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
 }else if(index==8){
//工资变动材料

 	  $('#gzbdclGrid').datagrid({    
    url:'',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	rownumbers:true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#gzbdclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'ptypeName',title:'材料类型',width:$(this).width() * 0.05,formatter:function(value,row,index){
        	if(value=='1')
        		return '9-1工资类';
        	else if(value=='2')
        		return '9-2任免类';
        	else if(value=='3')
        		return '9-3出国类';
        	else if(value=='4')
        		return '9-4会议类';
        	
        }},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,8,'9');
			}   
			}
         
    
    ]]    
     });  
	var pager6 = $('#gzbdclGrid').datagrid('getPager');
	pager6.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
 }else if(index==9){
  //其它材料
   	 $('#qtclGrid').datagrid({    
    url:'',
    border:true,
    rownumbers:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	singleSelect: true,
	height: 350,
	width:'100%',
	pagination:false,
	toolbar: '#qtclUpload',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true},
        {field:'pname',title:'材料名称',width: $(this).width() * 0.25},
        {field:'add_date',title:'上传日期',width: $(this).width() * 0.1},
        {field:'userName',title:'录入员',width: $(this).width() * 0.05},
        {field:'pdate',title:'真实时间',width: $(this).width() * 0.1},
        {field:'page_num',title:'页数',width: $(this).width() * 0.05},
        {title:'操作',field:'uid',width:$(this).width() * 0.12,align:'center',
	    		formatter: function(value,row,index){
	    			return operator(row,index,9,'10');
			}   
			}
         
    
    ]]    
     });  
	var pager7 = $('#qtclGrid').datagrid('getPager');
	pager7.pagination({
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
	 }
	 $(function(){
   //当前的档案号
   var currentPno='';
   //选项卡切换加载datagrid
	$('#daxzTab').tabs({
		 onSelect:function(title,index){
		   currentIndex=index;
		   initGrid(index);
		   var urls=['../gdcl/queryArchivesMaterialInfo','../gdcl/queryArchivesMyInfo','../gdcl/queryArchivesKhInfo','../gdcl/queryArchivesProInfo','../gdcl/queryArchivesPoliticalInfo','../gdcl/queryArchivesPtInfo','../gdcl/queryArchivesRewardInfo','../gdcl/queryArchivesDisciplinedInfo','../gdcl/queryArchivesOutInfo','../gdcl/queryArchivesOtherInfo']; 
		   $('#dpno').textbox({
			   //当textbox的发生变化才可以加载到textbox里面的值，否则textbox('getValue') 一直未undefined
			   onChange:function(newValue,oldValue){
				   if(currentPno==''){
					currentPno=newValue;//记录当前的档案号
				    var param="?pno="+currentPno;
				    $('#'+dgs[index]).datagrid({url:urls[index]+param});  
				   }
			   }
		   }); 
		   if(currentPno!=''){
			   var param="?pno="+currentPno;
			   $('#'+dgs[index]).datagrid({url:urls[index]+param});  
		   }
		 } 
	}); 
		
     });

//打开材料上传对话框，
/*
 * title：对话框标题
 * href：对话框窗体链接
   url：材料上传地址
   type：表示
 */
 function openUploadDialog(title,href,url,type,index,ptype,rowindex){
    if(index!=-1){
     var Gridname =  dgs[index];
   	 var selectedRows = $("#"+Gridname).datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}

 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}

 	currentRow = selectedRows[0];
 	type=currentRow.id;
     } 
      
   /*  var row=null;
	if(index==''){
	       if(ptype=='1'){
		     row=$('#llclGrid').datagrid('getSelected');
		   }
		 }  
	if(row==null){
	     var rows='';
	     if(ptype=='1'){
		 rows=$('#llclGrid').datagrid('getRows');
		 }
		 row=rows[index];
	} */
     //currentRow = row[0];
       
    
 	$('#daxxUploadDialog').dialog({
 		  title:title,
 		  width: 850,
 		  height: 500, 
 		  closed: false,
 		  cache:false,
 		  href:href,

 		  modal: true,
 		  resizable:true,
 		  buttons:[{
 						text:'保存',
 						iconCls:'icon-ok',
 						handler:function(){
 						     var fjParam= '';
 						   
 						      fjParam=$("#llfjlbGrid").datagrid("getData");
							 if(fjParam.rows.length>0){
							 	fjParam=JSON.stringify(fjParam.rows); 
							 }else{
							 fjParam=null;
							 }
 						   submitArchiveMsg(ptype,url, {ptype:ptype,type:type,pno:$('#dpno').textbox('getValue')},fjParam); 
 						}
 					},{
 						text:'关闭',
 						iconCls:'icon-cancel',
 						handler:function(){
 						$('#daxxUploadDialog').dialog('close');
 						}
 			}],
 		    iconCls: 'icon-save',
 		    onLoad: function () {debugger;
 		    
 		    	if(type!=''){
 		    		//修改对话框回显数据
 		    		//$('#fm').form('load',{uploadFile:currentRow.file_name});
 		    	    
 		    	    //  $('#fm').form('load',myArray[rowindex]);
                    $('#fm').form('load',currentRow);
                    //$('#uploadFile').filebox('setText',currentRow.file_name);
                    // var aid=myArray[rowindex].id;
                    var aid=currentRow.id;
	                $("#aid").val(aid);
	                $("#ptype").val(ptype);
	                llfjListFuc(aid,ptype,'0'); 
 		    	}
 		    	else{
 		    	llfjListFuc('','','2'); 
 		    	}
                          
                
 		    }
 		
 	 });
 	
 }

//下载、查看
 function openUploadDialogDown(title,href,url,type,index,ptype){
   title='查看/下载';
   
    var Gridname =  dgs[index];
     setTimeout(function(){
    	 if(index!=-1){
    		    var selectedRows = $("#"+Gridname).datagrid('getSelections');
    		 	if(selectedRows.length == 0){
    		 		$.messager.alert('系统提示','请选择一条要操作的数据！');
    		 		return;
    		 	}

    		 	if(selectedRows.length > 1){
    		 		$.messager.alert('系统提示','操作只能针对一条记录！');
    		 		return;
    		 	}

    		 	currentRow = selectedRows[0];
    		     } 
    		      
    		   /*  var row=null;
    			if(index==''){
    			       if(ptype=='1'){
    				     row=$('#llclGrid').datagrid('getSelected');
    				   }
    				 }  
    			if(row==null){
    			     var rows='';
    			     if(ptype=='1'){
    				 rows=$('#llclGrid').datagrid('getRows');
    				 }
    				 row=rows[index];
    			} */
    		     //currentRow = row[0];
    		       
    		    var num="?"+randomNum(10);
    		 	$('#daxxUploadDialog2').dialog({
    		 		  title:title,
    		 		  width: 850,
    		 		  height: 500, 
    		 		  closed: false,
    		 		  cache: false,
    		 		  href:basePath+"daxxgl/daxxView.jsp"+num,
    		 		  modal: true,
    		 		  resizable:true,
    		 		  buttons:[{
    		 						text:'关闭',
    		 						iconCls:'icon-cancel',
    		 						handler:function(){
    		 						$('#daxxUploadDialog2').dialog('close');
    		 						}
    		 			}],
    		 		    iconCls: 'icon-save',
    		 		    onLoad: function () {
    		 		    	
    		                var aid=currentRow.id;
    		                $("#aid").val(aid);
    		                $("#ptype").val(ptype);
    		                llfjListFuc2(aid,ptype,'1');  
    		               
    		 		    }
    		 		
    		 	 });
     }, 10);
     
 	
 }






 //附件列表
    function llfjListFuc(aid,fileType,oType){
    var href='';
    if(aid!='' && aid!=null){
    href=basePath+"gdcl/clfjList?aid="+aid+"&fileType="+fileType;
    }
  
    $('#llfjlbGrid').datagrid({    
    url:href, 
    title:'附件列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	singleSelect: true,
	sortOrder: 'desc',
	remoteSort: false,
	async : true,
	cache: false,
    columns:[[    
      
       {field:'name',title:'文件名称',width:'70%'},
       {field:'url',title:'文件路径',width:450,hidden:true}, 
       {field:'aid',title:'主表id',width:450,hidden:true},    
          
       {title:'操作',field:'id',width: '28%',align:'center',
		    formatter: function(value,row,index){
		    if(value!=''&&value!=null&&typeof(value)!= "undefined"&&oType=='0'){//修改
		    	return ' <a  style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
		     }
		    else if(oType=='1'){//下载
		      return '<a style="color: blue;"  onclick="downFj('+value+')">下载</a> <a style="color: blue;"  onclick="preview('+value+')"  >预览</a>';
		    } 
		     else{
		     return '<a  style="color: blue;" <a style="color: blue;"  onclick="deleteFj('+index+')">删除</a>';
	     } 
		  }   
		}
  
    ]]    
     });
     }
 
  function llfjListFuc2(aid,fileType,oType){
    var href='';
    if(aid!='' && aid!=null){
    href=basePath+"gdcl/clfjList?aid="+aid+"&fileType="+fileType;
    }
    
    $('#llfjlbViewGrid').datagrid({    
    url:href, 
    title:'附件列表',
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:false,
	//fitColumns:true,
	height: '100%',
	width:'100%',
	toolbar: '',
	sortName: '',
	singleSelect: true,
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
       {field:'',title:'选择',checkbox:true,width:100}, 
       {field:'img' , title:'预览',width:300, height:300 ,align:'center',formatter: function(value,row,index){
              return '<div  style="width:300px;height:300px;"  ><img id="stm'+row.id+'" src="/jtrc/'+row.url+'"   style="width:100%;height:100%;"   /></div>';
          }    
       },
       {field:'name',title:'文件名称',width:200},
       {field:'url',title:'文件路径',width:450,hidden:true}, 
       {field:'aid',title:'主表id',width:450,hidden:true},    
          
       {title:'操作',field:'id',width: 150,align:'center',
		    formatter: function(value,row,index){
		      var url = '/jtrc/'+row.url ;
		      return '<a style="color: blue;"  onclick="downFj2('+value+')">下载</a>   <a style="color: blue;"  onclick="preview2(\''+url+'\')"  >预览</a>   <a id="rotate" class="easyui-linkbutton" style="color: blue;" onclick="roate2('+row.id+')">旋转</a>';
		  }   
		}
  
    ]]    
     });
     }

  function openUploadDialogDown1(title,href,url,type,index,ptype){
    
    		$.ajax({
    	   		url:'<%=request.getContextPath()%>/clsort/updatePotho',
    	   	    dataType: 'JSON',
    	   	    data:{"aid":type,"fileType":ptype},
    	   	    type: "POST",   //请求方式
    	   	    success: function(data) {
    	   	    	alert("恢复图片成功");
    	   	 },
    	   	    error: function() {
    	   	        alert('服务器请求异常!');
    	   	    	//请求出错处理
    	   	    }
    	   	});
    	}

	    
	    
	    
	    
	   
 
 
/*
 * 判断文件是否符合要求
 */
function judgeFile(){
	var filename=$('#uploadFile').filebox('getValue');
	if(filename==''){
		$.messager.alert('系统提示','请选择您要上传的文件！','info');
		return false;
	}else{
	    var suffix=filename.substring(filename.lastIndexOf("."),filename.length).toUpperCase();
	    if(suffix!=".JPG"){
	       $.messager.alert('系统提示','文件格式需为JPG!','info');
	       $('#uploadFile').filebox('setValue','');
	       return false;
	    }
			
	}
	return true;
}
var submit=false;
//提交档案信息
function submitArchiveMsg(ptype,url,queryParams,fjParam){

   // if($('#uploadFile').val()=='')
	var result=$('#fm').form('validate');
	if(result){
		var filename=$('#uploadFile').filebox('getValue');
		if(filename!=''){
		filename=filename.substring(filename.lastIndexOf('/')+1);
		filename=filename.substring(filename.lastIndexOf('\\')+1);
		queryParams.uploadFile=filename;
		}
		if(submit){
		return;
		}
		submit=true;
	queryParams.fjParam=fjParam;	
	$('#fm').form('submit',{
		url:url,
		queryParams:queryParams,
		
		success:function(result){
			submit=false;
			result=eval("("+result+")");
			$('#daxxUploadDialog').dialog('close');
			if(result.flag){
				reloadDatagrid(ptype);
				$.messager.alert('系统提示',result.cause,'info');
			}else{
				$.messager.alert('系统提示',result.cause,'info');
			}
			
		}
	});
	}
}
var myArray=new Array()
//var currentRow='';//记录当前要修改的行
//格式化操作列
function operator(row,rowIndex,index,ptype){
	var title=['履历材料修改','自传材料修改','鉴定考核考察材料修改','学历和评聘专业职务材料修改','政审材料修改','党员材料修改','奖励材料修改','处分材料修改','工资、任免、出国、会议材料修改','其他材料修改'];
	var href=['daxxUpload.jsp','daxxUpload.jsp','jdkhkcclAdd.jsp','xlhppzyzwAdd.jsp','daxxUpload.jsp','dyclAdd.jsp','jlclAdd.jsp', 'cfclAdd.jsp','gzbdclAdd.jsp','daxxUpload.jsp'];
	var url=['../gdcl/saveArchivesMaterialInfo','../gdcl/saveArchivesMyInfo','../gdcl/saveArchivesKhInfo','../gdcl/saveArchivesProInfo','../gdcl/saveArchivesPoliticalInfo','../gdcl/saveArchivesPtInfo','../gdcl/saveArchivesRewardInfo','../gdcl/saveArchivesDisciplinedInfo','../gdcl/saveArchivesOutInfo','../gdcl/saveArchivesOtherInfo'];
	var sperator="\'";
	var param=sperator+title[index]+sperator+","+sperator+href[index]+sperator+","+sperator+url[index]+sperator+","+row.id+","+index+","+ptype+","+rowIndex;
	//currentRow=row;
	myArray[rowIndex]=row;
	var downloadUrl='<%=request.getContextPath()%>'+row.p_url;
	/*
	*添加删除按钮 邓祯 2017年3月26日18:56:39
	*/
	return "<a onclick=\"openUploadDialogDown("+param+")\" style=\'color: blue;\'>下载</a>"+ "&nbsp;&nbsp;<a onclick=\"openUploadDialogDown("+param+")\" style=\'color:blue;cursor:pointer\'>预览</a>"+"&nbsp;&nbsp;<a onclick=\"openUploadDialogDown1("+param+")\" style=\'color: blue;\'>图片恢复</a>"+ "&nbsp;&nbsp;";
}

function reloadDatagrid(ptype){
	$('#'+dgs[ptype-1]).datagrid('reload');
}

function downloadFile(rowIndex,index){

var row=$('#'+dgs[index]).datagrid('getRows')[rowIndex];
        var url = '<%=request.getContextPath()%>/gdcl/downFileFromUrlCheck?pname='+encodeURI(row.pname)+'&filename='+row.file_name;
	    $.post(url,null,function(data){
			if(data.flag==1){
				window.location.href='<%=request.getContextPath()%>/gdcl/downFileFromUrl?pname='+encodeURI(row.pname)+'&filename='+row.file_name;
				
			}else if(data.flag==2){
				
				alert("还未上传附件不能下载！");
			}else if(data.flag==3){
				
				alert("还未上传附件不能下载！");
			}
    },"json");
    
	
	
}


function Move(operation,type){debugger;
var selectrow=$(type).datagrid('getSelected');
if(selectrow==null||selectrow.length>1){
$.messager.alert('提示', '请选择要移动的行!', 'warning');
return ;
}  else if(selectrow==null||selectrow.length==0){
$.messager.alert('提示', '暂不支持多行移动!', 'warning');
return ;
}
var rows=$(type).datagrid('getRows');  
var rowlength=rows.length; 
var rowIndex=$(type).datagrid('getRowIndex', selectrow);
if(operation=='up'){
//上移
    if(rowIndex==0){  
            $.messager.alert('提示', '顶行无法上移!', 'warning');  
            return ;
     }else{  
            $(type).datagrid('deleteRow', rowIndex);//删除一行  
            rowIndex--;  
            
            $(type).datagrid('insertRow', {  
                index:rowIndex,  
                row:selectrow  
            });  
            $(type).datagrid('selectRow', rowIndex);  
        }  
   }else if(operation=='down'){
        //下移
            if(rowIndex==rowlength-1){  
            $.messager.alert('提示', '底行无法下移!', 'warning');  
            return;
        }else{  
            $(type).datagrid('deleteRow', rowIndex);//删除一行  
            rowIndex++;  
            $(type).datagrid('insertRow', {  
                index:rowIndex,  
                row:selectrow  
            });  
            $(type).datagrid('selectRow', rowIndex); 
        }  
 }

}
function save(type){debugger;
	var rows=$("#"+dgs[type-1]).datagrid('getRows');
		if(rows==''||rows==null){
		$.messager.alert("提示", "保存成功！");
		return;
	}
		var pager = $("#"+dgs[type-1]).datagrid('getPager');
		  var opts = $("#"+dgs[type-1]).datagrid('options');
		var currSize = opts.pageSize;
		var currNum = opts.pageNumber;
		var queryParam=new Array();
	
	$.each(rows, function(idx, row) {
	   var rowIndex=$("#"+dgs[type-1]).datagrid('getRowIndex', row);
	   var sort;
	   var obj = new Object();
	   obj.id=row.id;
	   if(currNum==1)
	  		sort=rowIndex
	   else
		    sort=((currNum-1)*currSize)+rowIndex;
		    obj.sort=sort;
	   obj.type=type;
	   queryParam.push(obj);
	});
     var param = JSON.stringify(queryParam);
	 $.post("../clsort/save", {row :param}, callbackfunction, "JSON");
}

function callbackfunction(data){
	if(data.flag){
		$.messager.alert("提示", "保存成功！");
		$("#"+dgs[data.type-1]).datagrid('reload');
	}else{
		$.messager.alert("提示", "保存失败请重试！");
	}
}
var t_type;
function Delete(type){debugger;
t_type=type;
 var Gridname =  dgs[type-1];
   	 var selectedRows = $("#"+Gridname).datagrid('getSelections');
 	if(selectedRows.length == 0){
 		$.messager.alert('系统提示','请选择一条要编辑的数据！');
 		return;
 	}

 	if(selectedRows.length > 1){
 		$.messager.alert('系统提示','编辑操作只能针对一条记录！');
 		return;
 	}

 	currentRow = selectedRows[0];
 	var id=currentRow.id;
 var queryParam={};
 $.messager.confirm("操作提示", "您确定要执行删除操作吗？", function (data) {
            if (data) {
                queryParam.id=id;
				queryParam.type=type;
				$.post("../clsort/delete", queryParam, deletecallbackfunction, "JSON");
            }
            else {
                return;
            }
        });
}
function deletecallbackfunction(data){
	var Gridname =  dgs[t_type-1];
	if(data.flag){
//		$("#"+dgs[ptype-1]).datagrid('reload');
		$.messager.alert("提示", "删除成功！");
   		$("#"+Gridname).datagrid('reload');
	}else{
		$.messager.alert("提示", "删除失败！");
		$("#"+Gridname).datagrid('reload');
	}
}


</script>

	<form id="archiveForm" method="post">
		<table class="table2">
			<tr>
				<td class="left">档案号</td>
				<td class="right"><input class="easyui-textbox" id="dpno" name="dpno"
					size="20" data-options="editable:false" style="height:22px">
				</td>
				<td class="left">姓名</td>
				<td class="right"><input class="easyui-textbox" name="name"
					size="20" data-options="editable:false" style="height:22px">
				</td>
				<td class="left">身份证号</td>
				<td class="right"><input class="easyui-textbox" id="pnum" name="pnum"
					size="20" data-options="editable:false" style="height:22px">
				</td>
			</tr>
			<tr>
				<td class="left">毕业院校</td>
				<td class="right"><input class="easyui-textbox" name="school"
					size="20" data-options="editable:false" style="height:22px"></td>
				<td class="left">所学专业</td>
				<td class="right"><input class="easyui-textbox" name="major"
					size="20" data-options="editable:false" style="height:22px">

				</td>
				<td class="left">电话</td>
				<td class="right"><input class="easyui-textbox" name="userTel"
					size="20" data-options="editable:false" style="height:22px">
				</td>
			</tr>
		</table>
		
		<div id="daxzTab" class="easyui-tabs" style="width:100%;height:400px;">
			<div title="一、履历材料">
				<table id="llclGrid"></table>
			</div>
			<div title="二、自传材料">
				<table id="zcclGrid"></table>
			</div>


			<div title="三、鉴定考核材料">
				<table id="jdkhclGrid"></table>
			</div>


			<div title="四、学历职称材料">
				<table id="xlhppzyzwGrid"></table>

			</div>
			<div title="五、政审材料">
				<table id="zsclGrid"></table>
			</div>
			<div title="六、党团材料">
				<table id="dyclGrid"></table>

			</div>

			<div title="七、奖励材料">
				<table id="jlclGrid"></table>
			</div>

			<div title="八、处分材料">
				<table id="cfclGrid"></table>
			</div>

			<div title="九、工资任免材料">
				<table id="gzbdclGrid"></table>
			</div>
			<div title="十、其它材料" >
				<table id="qtclGrid"></table>
			</div>

		</div>
	</form>

		<div id="llclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesMaterialInfo','',-1,'1',0)"
				class="easyui-linkbutton" id="a1" data-options="iconCls:'icon-add',plain:true">履历材料上传</a>
			
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesMaterialInfo','0',0,'1',0)"
				class="easyui-linkbutton" id="b1" data-options="iconCls:'icon-edit',plain:true">履历材料修改</a>
				
			<a onclick="Delete('1')" class="easyui-linkbutton" id="c1" data-options="iconCls:'icon-remove',plain:true">删除</a>		
					
				<!-- 为材料添加上下移动操作按钮     添加人：邓祯    时间 ：2017-01-18 -->
				<a onclick="Move('up','#llclGrid')" class="easyui-linkbutton"  data-options="plain:true">&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#llclGrid')" class="easyui-linkbutton"  data-options="plain:true">&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(1)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
				
		</div>
		<div id="zzclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesMyInfo','',-1,'2',0)"
				class="easyui-linkbutton" id="a2" data-options="iconCls:'icon-add',plain:true">自传材料上传</a>
				
				<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesMyInfo','0',1,'2',0)"
				class="easyui-linkbutton" id="b2" data-options="iconCls:'icon-edit',plain:true">自传材料修改</a>
				
					<a onclick="Delete('2')" class="easyui-linkbutton" id="c2" data-options="iconCls:'icon-remove',plain:true">删除</a>		
				
				<a onclick="Move('up','#zcclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#zcclGrid')" class="easyui-linkbutton"  data-options="plain:true">&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(2)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		</div>
		<div id="jdkhkcclUpload" style="display:none">
			<a
				onclick="openUploadDialog($(this).text(), 'jdkhkcclAdd.jsp','../gdcl/saveArchivesKhInfo','',-1,'3',0)"
				class="easyui-linkbutton" id="a3" data-options="iconCls:'icon-add',plain:true">鉴定考核考察材料上传</a>
			
			<a
				onclick="openUploadDialog($(this).text(), 'jdkhkcclAdd.jsp','../gdcl/saveArchivesKhInfo','0',2,'3',0)"
				class="easyui-linkbutton" id="b3" data-options="iconCls:'icon-edit',plain:true">鉴定考核考察材料修改</a>
			
				<a onclick="Delete('3')" class="easyui-linkbutton" id="c3" data-options="iconCls:'icon-remove',plain:true">删除</a>		
			
				<a onclick="Move('up','#jdkhclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#jdkhclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(3)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>
		<div id="xlhppzyzwclUpload" style="display:none">
			<a
				onclick="openUploadDialog($(this).text(), 'xlhppzyzwAdd.jsp','../gdcl/saveArchivesProInfo','',-1,'4',0)"
				class="easyui-linkbutton" id="a4" data-options="iconCls:'icon-add',plain:true">学历和评聘专业职务材料上传</a>
				
				<a
				onclick="openUploadDialog($(this).text(), 'xlhppzyzwAdd.jsp','../gdcl/saveArchivesProInfo','0',3,'4',0)"
				class="easyui-linkbutton" id="b4" data-options="iconCls:'icon-edit',plain:true">学历和评聘专业职务材料修改</a>
				
					<a onclick="Delete('4')" class="easyui-linkbutton" id="c4" data-options="iconCls:'icon-remove',plain:true">删除</a>		
				
				<a onclick="Move('up','#xlhppzyzwGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#xlhppzyzwGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(4)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>
		<div id="zsclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesPoliticalInfo','',-1,'5',0)"
				class="easyui-linkbutton" id="a5" data-options="iconCls:'icon-add',plain:true">政审材料上传</a>
			
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesPoliticalInfo','0',4,'5',0)"
				class="easyui-linkbutton" id="b5" data-options="iconCls:'icon-edit',plain:true">政审材料修改</a>
			
				<a onclick="Delete('5')" class="easyui-linkbutton" id="c5" data-options="iconCls:'icon-remove',plain:true">删除</a>		
			
				<a onclick="Move('up','#zsclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#zsclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(5)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		</div>
		<div id="dyclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(), 'dyclAdd.jsp','../gdcl/saveArchivesPtInfo','',-1,'6',0)"
				class="easyui-linkbutton" id="a6" data-options="iconCls:'icon-add',plain:true">党员材料上传</a>
			
			<a onclick="openUploadDialog($(this).text(), 'dyclAdd.jsp','../gdcl/saveArchivesPtInfo','0',5,'6',0)"
				class="easyui-linkbutton" id="b6" data-options="iconCls:'icon-edit',plain:true">党员材料修改</a>
			
				<a onclick="Delete('6')" class="easyui-linkbutton" id="c6" data-options="iconCls:'icon-remove',plain:true">删除</a>		
			
				<a onclick="Move('up','#dyclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#dyclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(6)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>
		<div id="jlclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(), 'jlclAdd.jsp','../gdcl/saveArchivesRewardInfo','',-1,'7',0)"
				class="easyui-linkbutton" id="a7" data-options="iconCls:'icon-add',plain:true">奖励材料上传</a>
				
				<a onclick="openUploadDialog($(this).text(), 'jlclAdd.jsp','../gdcl/saveArchivesRewardInfo','0',6,'7',0)"
				class="easyui-linkbutton" id="b7" data-options="iconCls:'icon-edit',plain:true">奖励材料修改</a>
			
				<a onclick="Delete('7')" class="easyui-linkbutton" id="c7" data-options="iconCls:'icon-remove',plain:true">删除</a>		
				
				<a onclick="Move('up','#jlclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#jlclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(7)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>
		<div id="cfclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(), 'cfclAdd.jsp','../gdcl/saveArchivesDisciplinedInfo','',-1,'8',0)"
				class="easyui-linkbutton" id="a8" data-options="iconCls:'icon-add',plain:true">处分材料上传</a>
				
				<a onclick="openUploadDialog($(this).text(), 'cfclAdd.jsp','../gdcl/saveArchivesDisciplinedInfo','0',7,'8',0)"
				class="easyui-linkbutton" id="b8" data-options="iconCls:'icon-add',plain:true">处分材料修改</a>
				
					<a onclick="Delete('8')" class="easyui-linkbutton" id="c8" data-options="iconCls:'icon-remove',plain:true">删除</a>		
				
				<a onclick="Move('up','#cfclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#cfclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(8)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>

		<div id="gzbdclUpload" style="display:none">
			<a
				onclick="openUploadDialog($(this).text(), 'gzbdclAdd.jsp','../gdcl/saveArchivesOutInfo','',-1,'9',0)"
				class="easyui-linkbutton" id="a9" data-options="iconCls:'icon-add',plain:true">工资、任免、出国、会议材料</a>
				
				<a
				onclick="openUploadDialog($(this).text(), 'gzbdclAdd.jsp','../gdcl/saveArchivesOutInfo','0',8,'9',0)"
				class="easyui-linkbutton" id="b9" data-options="iconCls:'icon-edit',plain:true">工资、任免、出国、会议材料修改</a>
				
					<a onclick="Delete('9')" class="easyui-linkbutton" id="c9" data-options="iconCls:'icon-remove',plain:true">删除</a>		
				
				<a onclick="Move('up','#gzbdclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#gzbdclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(9)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>
		<div id="qtclUpload" style="display:none">
			<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesOtherInfo','',-1,'10',0)"
				class="easyui-linkbutton" id="a10" data-options="iconCls:'icon-add',plain:true">其他材料上传</a>
		
		<a onclick="openUploadDialog($(this).text(),'daxxUpload.jsp','../gdcl/saveArchivesOtherInfo','0',9,'10',0)"
				class="easyui-linkbutton" id="b10" data-options="iconCls:'icon-edit',plain:true">其他材料修改</a>
		
			<a onclick="Delete('10')" class="easyui-linkbutton" id="c10" data-options="iconCls:'icon-remove',plain:true">删除</a>		
		
				<a onclick="Move('up','#qtclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;上&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="Move('down','#qtclGrid')" class="easyui-linkbutton" data-options="plain:true" >&nbsp;下&nbsp;&nbsp;移&nbsp;</a>
				<a onclick="save(10)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a>
		
		</div>

	
</body>

</html>
