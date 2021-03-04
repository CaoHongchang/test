<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>
<%
	request.getSession().getAttribute("uid");
	request.getSession().getAttribute("userName");
%>

<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/lightbox/css/lightbox.css" media="screen"/>
<script src="<%=basePath%>/js/lightbox/lightbox-2.6.min.js"></script>
<title>职称评审申报审核</title>

<script type="text/javascript">
var iamgArr=[];
var session_uid = "<%=request.getSession().getAttribute("uid")%>";
var session_name = "<%=request.getSession().getAttribute("realName")%>";
$(function(){
       $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $("#d").hide();
	    $("#e").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==215){
				$("#a").show();
			}else if(value==216){
				$("#b").show();
			}else if(value==217){
				$("#c").show();
			}else if(value==218){
				$("#d").show();
			}else if(value==219){
				$("#e").show();
			}
	});
    },"json");
   $('#pshdGrid').datagrid({    
    	url:basePath+"zcps/queryShLeftPageList", 
     	border:true,
	 	pageSize:10,
	 	pageList:[10,20,30,40],
	 	striped: true,
	 	singleSelect: true,
	 	collapsible:true,
	 	fitColumns:true,
		height: '100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,    
    	columns:[[    
        	{field:'id',title:'选择',align:'center',hidden:true},
        	{field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
        	{field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}   
    	]],
    	onClickRow:function(rowIndex, rowData){
    		setListDate("",rowData.id);
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
	//setListDate("","");
});
var activityId ;
function setListDate(param,id){
	if (id!= '')
	{
		activityId = id;
	}
	$('#yhsbGrid').datagrid({    
	    url:basePath+"zcps/querySHPageList?id="+activityId, 
	  	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		singleSelect: true,
		fitColumns:true,
		height: wholeHeight,
		width:1600,
		toolbar: '#zcpshdTool',
		// sortName: '',
		// sortOrder: 'desc',
		pagination : true,
		remoteSort: true,    
		queryParams: {
			param: param,
			sType:"职称评审"
		},
	    columns:[[    
	         {field:'id',title:'选择',checkbox:true,align:'center'},
	         {field:'sbDate',title:'申报时间',width : fixWidth(0.2),sortable :true,align:'center'},    
	         {field:'uId',title:'申报人id',width : fixWidth(0.2),align:'center',hidden:true},    
	         {field:'name',title:'姓名',width : fixWidth(0.2),align:'center'},   
	         {field:'pnum',title:'身份证号',width: fixWidth(0.3),align:'center'},
	         {field:'sLevel',title:'申报级别',width: fixWidth(0.2),align:'center'},
	         {field:'sName',title:'申报资格名称',width: fixWidth(0.2),align:'center'},
	         {field:'sPro',title:'申报专业',width: fixWidth(0.2),align:'center'},
	         {field:'sId',title:'申报属性',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'sState',title:'审核状态',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'sStateName',title:'审核状态',width: fixWidth(0.2),align:'center'},
	         {field:'remark_info',title:'审核说明',width: fixWidth(0.2),align:'center'},
	         {field:'s_uid',title:'审核人',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'tel',title:'手机',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'sh_name',title:'审核人',width: fixWidth(0.2),align:'center'},
	         {field:'sDate',title:'审核时间',width: fixWidth(0.2),align:'center'},
	         {field:'prDate',title:'现专业聘任时间',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'zType',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'pTime',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'isOther',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'workNow',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'work_time',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'point',title:'现聘专业类别',width:fixWidth(0.2),align:'center',hidden:true},
	         {field:'yearK',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'url',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'wRemark',title:'现聘专业类别',width: fixWidth(0.2),align:'center',hidden:true},
	         {field:'pstate',title:'评审状态',width: fixWidth(0.2),align:'center',hidden:true},
			 {title:'操作',field:'1',width: fixWidth(0.2),align:'center',
		    		formatter: function(value,row,index){
 				      return "<a  style=\"color: green;\" onclick=\"cz('',"+index+")\" >审核</a> <a  style=\"color: blue;\"  onclick=\"delFuc("+index+")\">删除</a>";
				}   
			 }

	    ]]    
	});  
	var pager = $('#yhsbGrid').datagrid('getPager');
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

function sbshAddView()
{
	cz('view');
}

function sbshAddFuc(){
	cz('');
}

function sbshUpdateFuc(){
	cz1('');
}

 //审核保存
function submitForm(){debugger 		
	var r = $("#fm").form('enableValidation').form('validate');
	if(!r) {
			return false;
	}
	/*
	//$("#").textbox('getValue')zipCode
	if(!Post_Validation($("#zipCode").textbox('getValue'))){
	 $.messager.alert('提示','请输入正确的邮政编码！');
	 return false;
	}
	if(!HomeTel_Validation($("#gTel").numberbox('getValue'))){
	 $.messager.alert('提示','固定电话格式错误，请输入正确的固定电话！');
	 return false;
	}
	if(!QQ_Validation($("#qq").textbox('getValue'))){
	 $.messager.alert('提示','固定电话格式错误，请输入正确的固定电话！');
	 return false;
	}
	*/
	if($("#remark_info").textbox('getValue').length>300){
	$.messager.alert('提示','审核说明输入限制300字！');
	return false;
	}
	 var param=$("#zcpshdForm").serializeArray();
	 param=JSON.stringify(param);
	 $("#fm").ajaxSubmit({ 
			url : basePath+'/zcps/saveGet',
			async : true,
			 data: {
             'param': param
         	},
			success : function(data) {
         	var result = $.parseJSON(data);  
			if(result.flag == 0){
				 $.messager.alert('提示','操作成功');
				 $('#zcpssbshdAddInfo').dialog('close');
				 $("#yhsbGrid").datagrid("reload");
			}else{
				$.messager.alert('提示','操作失败，原因：服务器异常！');
			}
		},
		error : function(data) {
			   
		}
	});
		
}

function delFuc(index){
	var row = $("#yhsbGrid").datagrid("getSelected");
    if(row==null){
      row=$('#yhsbGrid').datagrid('getRows')[index];
    }
	if(row){
	  if(confirm("确定要删除数据吗？"))   {		
		$.ajax({
	   		url:basePath+"zcps/delGetNew",
	   	    dataType: 'JSON',
	   	    data: {id:row.id},
	   	    type: "POST",   //请求方式
	   	    success: function(data) {
	   			if(data.flag == 0){
					 $.messager.alert('提示','删除成功');
					 $("#yhsbGrid").datagrid("reload");
					 $('#zcpssbshdAddInfo').dialog('close'); 
		        } else{
		        	$.messager.alert('提示','删除失败，原因：'+result.errorMsg);
			    }
	   	    }
		});
	}
	}
}

function cz(view , index){
	var row = $("#yhsbGrid").datagrid("getSelected");
	 
    if(row == null ){
      row=$('#yhsbGrid').datagrid('getRows')[index];
    }
	
	if(row){
		if(view == ""){
		
		//alert(row.sState);
		if(row.sState ==1){
			$.messager.alert('提示','申报已审核');
			return;
		}	
		
		if(row.sState !=1&&row.sState !=0){
		$.messager.alert('提示','申报已审核');
			return;
		}
		//if(row.pstate!=1){
			//$.messager.alert('提示','未到申报审核时间');
			//return;
	//	}
		$('#zcpssbshdAddInfo').dialog({
		    title: '审核',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zcsbgl/zcpssbshAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
							submitForm();
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#zcpssbshdAddInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadDate(row);
		    	
		    }
		});
		
		}else{
		$('#zcpssbshdAddInfo').dialog({
		    title: '职称申报查看',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zcsbgl/zcpssbshAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#zcpssbshdAddInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadDate(row);
		    	$("#zcpssbshDiv").hide();
		    }
		});
		}
	}else{
		$.messager.alert('提示','请选择一行');
	}
}
 
function cz1(view , index){
	var row = $("#yhsbGrid").datagrid("getSelected");
	 
    if(row == null ){
      row=$('#yhsbGrid').datagrid('getRows')[index];
    }
	
	if(row){
		if(view == ""){
		
		//if(row.pstate!=1){
			//$.messager.alert('提示','未到申报审核时间');
			//return;
	//	}
		$('#zcpssbshdAddInfo').dialog({
		    title: '审核',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zcsbgl/zcpssbshAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
							submitForm();
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#zcpssbshdAddInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadDate(row);
		    	
		    }
		});
		
		}else{
		$('#zcpssbshdAddInfo').dialog({
		    title: '职称申报查看',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '../zcsbgl/zcpssbshAdd.jsp',
		    modal: true,
		    buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#zcpssbshdAddInfo').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadDate(row);
		    	$("#zcpssbshDiv").hide();
		    }
		});
		}
	}else{
		$.messager.alert('提示','请选择一行');
	}
}
 
function loadDate(row){
	
	if(row.s_uid=="" || row.s_uid=="null" || row.s_uid== null ){
		row.s_uid =  session_uid;
		row.sh_name =  session_name;
	}
	//alert(row.id);
	$('#fm').form('load', row);
	//alert(row.workTime);
	if(row.zType=="非交通专业"){
		 
		
		       $("#xp_pro + .combo").hide();
			    $("#da").show();
			   $('#xp_pro1').textbox('setValue',row.xpPro);
		}else{
		
		 	 $("#xp_pro + .combo").show();
		     $("#da").hide();
		     $('#xp_pro').combobox('setValue',row.xpPro);
		}
		
	   $('#mz').combobox('setValue',row.mz);
	   $('#formPlace').textbox('setValue',row.formPlace);
	   $('#getTime').textbox('setValue',row.getTime);
	   $('#zipCode').textbox('setValue',row.zipCode);
	   $('#gTel').textbox('setValue',row.gTel);
	   $('#qq').textbox('setValue',row.qq);
		/*
	$.ajax({
   		url:basePath+"zcps/getUserInfoById",
   	    dataType: 'JSON',
   	    data: {id:row.uId},
   	    type: "POST",   //请求方式
   	    success: function(data) {
   			if(data.flag == true){
		    	$('#fm').form('load', data.data);
	        } else{
	        	 alert('申请人信息错误：'+ data.cause);
		    }
   	    }
	});*/
	
	
	
		//学习经历
	$('#xxjlGrid').datagrid({    
    	url:basePath+"zcps/queryStudyList?uid="+row.uId+"&activityId="+activityId, 
    	border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: 150,
		width:'100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
    	columns:[[    
      	/*  {field:'id',title:'选择',checkbox:true,width:100}, */
    	{field:'school_name',title:'毕业院校',width:100},    
    	{field:'graduation_date',title:'毕业时间',width:150},
    	{field:'sxzy',title:'所学专业',width:150},    
    	{field:'xz',title:'学制',width:150},    
    	{field:'qdfs',title:'取得方式',width:150},    
    	{field:'education',title:'学历',width:150},  
    	{field:'degree',title:'学位',width:150}       
    
    	]]    
	});  
	var pager = $('#xxjlGrid').datagrid('getPager');
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
 
 	//工作经历
	$('#gzjlGrid').datagrid({    
	    url:basePath+"zcps/queryWorkList?uid="+row.uId+"&activityId="+activityId,  
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: 150,
		width:'100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
		columns:[[    
	      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
	        {field:'work_adr',title:'工作地点',width:100},    
	        {field:'enterprise_id',title:'工作单位',width:150},
	        {field:'work_name',title:'从事工作',width:150},    
	        {field:'place_id',title:'职务',width:150},    
	        {field:'start_date',title:'开始时间',width:150},    
	        {field:'end_date',title:'结束时间',width:150}     
		]]    
 	});  
	var pager2 = $('#gzjlGrid').datagrid('getPager');
	pager2.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
    //继续教育
	$('#xxjyGrid').datagrid({    
		url:basePath+'zcps/queryCEList?uid='+row.uId+"&activityId="+activityId,  
		border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: 150,
		width:'100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:[[    
	      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
	        {field:'study_content',title:'学习内容',width:100},    
	        {field:'study_time',title:'学时',width:150},
	        {field:'study_method',title:'学习形式',width:150},    
	        {field:'train_date',title:'开始时间',width:150},    
	        {field:'out_date',title:'结束时间',width:150}
		]]    
 	});  
	var pager3 = $('#xxjyGrid').datagrid('getPager');
	pager3.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
 
  
 	//申报论文 
	$('#sblwGrid').datagrid({    
	    url:basePath+'zcps/queryPaperList?uid='+row.uId+"&activityId="+activityId,  
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: 150,
		width:'100%',
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:[[    
	      /*  {field:'id',title:'选择',checkbox:true,width:100}, */
	        {field:'dissetation_name',title:'论文题目',width:100},    
	        {field:'j_date',title:'刊出交流时间',width:100},
	        {field:'j_msg',title:'刊出交流情况（刊物及会议名称、刊号等）',width:250},    
	        {field:'is_send',title:'是否送审代表作',width:100,
        	formatter: function(value,row,index){
            if (value == '1') {
          	    return "是";
			}else {
          	    return "否";
		    }
	     }},    
	        {field:'remark',title:'备注',width:200},
	        {field:'imgList',title:'查看上传图片',width:100,
        	formatter: function(value,row,index){
            if (row.is_send == '1') {debugger;
              var images=JSON.stringify(value);
             
              /* for(var i=0;i<value.length;i++){
                    if(i==0)
                    	images=value[i].file_url;
                    else
                    	images+='@@'+value[i].file_url;
                } */
                var arr={};
                arr.id=row.id;
                arr.images=images;
                iamgArr.push(arr);
                
          	    return '<a  href="#"  onclick="ckImg('+row.id+')">查看</a>';
			}else {
          	    return "";
		    }}}
	    ]]    
	});  
	var pager4 = $('#sblwGrid').datagrid('getPager');
	pager4.pagination({
		beforePageText : '第',
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
}

 
  //弹出查询框
function searchDiv(){
	    $('#searchInfo').dialog({    
	    title: '',    
	    width: 1000,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: '../zcsbgl/shSearch.jsp',    
	    modal: true,
	      buttons:[{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#searchInfo').dialog('close');
					}
				}]   
	}); 
} 



//弹出查询框
function ckImg(v){
	    $('#zcpssbimgInfo').dialog({    
	    title: '论文图片',    
	   // width: 250,    
	   // height: 500, 
	    fit: true,   //自适应大小   
	    closed: false,    
	    cache: false,    
	    href: '../zcsbgl/zcpssbimg.jsp',    
	    modal: true,
	      buttons:[{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#zcpssbimgInfo').dialog('close');
					}
				}] ,
		onLoad: function () {

	var arr = '';	
	 for(var j=0;j<iamgArr.length;j++){
		 var arrs=iamgArr[j];
		 if(arrs.id==v){
			 arr=arrs.images;
			 break;
		 }
	 }
		
		var s=JSON.parse(arr);
		var html='';
        for(var i=0;i<s.length;i++){
        	html+='<tr>';
        	html+='<td class="">';
        	html+='<a class="example-image-link" href="'+s[i].file_url+'" data-lightbox="example-1">';
        	html+='<img class="example-image" src="'+s[i].file_url+'" width="'+$("#imgView").width()+'px" />';
        	html+='</a><br/>';         
        	html+='<a style="color:red;font-size:20px" target="_blank" href="'+s[i].file_url+'"  >'+s[i].file_url+'</a>';
        	html+='</td>';
        	html+='</tr>';
        } 
       $("#imgView").html(html);   
        
    } //loadEnd  
	}); 
} 
  
<%-- function exportExcel(){
if(activityId==null||activityId==""||activityId=="undefined"){
alert("你还没有选择要导出的活动！");
return;
}
	window.location.href= "<%=request.getContextPath()%>/zcps/exportGet?pssb=true&id="+activityId;
} --%>

function exportExcel(){
	window.location.href= "<%=request.getContextPath()%>/zcps/exportGet?pssb=true&id="+activityId;
}

</script>


<body style="margin: 1px;">
 <div id="zcpshdTool"  style="background-color:#FFFFFF;">

		<a id="a" onclick="sbshAddView()" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
		<a id="f" onclick="sbshUpdateFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="b" onclick="sbshAddFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核</a>
		<a id="c" onclick="delFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="d" onclick="searchDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
		<a id="e" onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">输出到excel</a>

</div>
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">   

    <div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>  
    
    
    </div>   
    <div data-options="region:'center',title:'用户申报列表',border:false" >
         <table id="yhsbGrid"></table>  
    </div>   
</div>  



<div id="zcpssbshdAddInfo"></div> 
<div id="searchInfo"></div>
<div id="zcpssbimgInfo"></div>
</body>
</html>
