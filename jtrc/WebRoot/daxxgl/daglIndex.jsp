<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案管理</title>

<script type="text/javascript">
	$(function(){
	//权限设置
	  $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==344){
				$("#a").show();
			}else if(value==345){
				$("#b").show();
			}else if(value==346){
				$("#c").show();
			}
	});
    },"json");
    
init();
	});
function init(){
   $('#daglGrid').datagrid({    
    url:'../archivesBaseInfoTrol/queryArchivesBaseInfoList', 
     border:true,
	pageSize:20,
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
	singleSelect: true,
	queryParams:{
		dept:"daNum",
		key:window.top.cacheArchive.cacheDpno
	},
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
          {field:'p_state',title:'档案状态',width : $(this).width() * 0.1,align:'center',
        	formatter: function(value,row,index){
           if (value == '1') {
          	    return "转入";
			}else if (value == '2') {
          	    return "转出";
		    }else{
				return value;
		    }
	     }},    
         {field:'p_m',title:'档案性质',width : $(this).width() * 0.1,align:'center'},    
         {field:'p_type',title:'身份类别',width: $(this).width() * 0.1,align:'center'},
         {field:'in_point',title:'转入单位',width: $(this).width() * 0.15,align:'center'},
         {field:'in_date',title:'转入日期',width: $(this).width() * 0.1,align:'center'},
          {field:'out_p',title:'转出性质',width: $(this).width() * 0.1,align:'center'},
         {field:'out_point',title:'转出单位',width: $(this).width() * 0.1,align:'center'},
         {field:'out_date',title:'转出日期',width : $(this).width() * 0.1,align:'center'},    
         {field:'out_method',title:'转出方式',width: $(this).width() * 0.1,align:'center'},
         {field:'get_n',title:'转出机要号',width: $(this).width() * 0.15,align:'center'},
         {field:'get_name',title:'档案领走人姓名',width: $(this).width() * 0.1,align:'center'},
         {field:'get_tel',title:'领走人电话',width: $(this).width() * 0.1,align:'center'},
         {field:'stuffName',title:'录入人',width: $(this).width() * 0.1,align:'center'},
         {field:'add_date',title:'录入日期',width: $(this).width() * 0.1,align:'center'},
        {field:'dpno',title:'档案号',width : $(this).width() * 0.1,align:'center',hidden:true},    
        {field:'name',title:'代理人姓名',width: $(this).width() * 0.1,align:'center',hidden:true},
         {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center',hidden:true,
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
         {field:'pnum',title:'身份证号',width: $(this).width() * 0.15,align:'center',hidden:true},
         {field:'tel',title:'联系电话',width: $(this).width() * 0.1,align:'center',hidden:true},
         {field:'is_s',title:'是否派遣',width: $(this).width() * 0.1,align:'center',hidden:true,
        	 formatter: function(value,row,index){
                 if (value == 'on') {
               	    return "是";
     			}else if (value == 'off') {
               	    return "否";
     		    }else{
     				return "否";
     		    }
     	     }},
         {title:'操作',field:'uid12',width: $(this).width() * 0.2,align:'center',
		    		formatter: function(value,row,index){
	    		      var id = row.id;
	    		      if(id != "" && 'null' != id && null != id){
	    		    	  return '<a href="javascript:viewdaglFuc(\''+row.dpno+'\','+row.id+');" style="color: blue;">查看</a>';
	    		      }else{
	    		    	  return '<a href="javascript:viewdaglFuc(\''+row.dpno+'\','+row.id+');" style="color: blue;">查看</a> ';
		    		  }
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
		cache.cacheTel=rowData.userTel;//联系电话
		setArchiveHead();
	},
	onLoadSuccess:function(data){
		$('#daglGrid').datagrid('checkAll');
	}
});  
	var pager = $('#daglGrid').datagrid('getPager');
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





	function adddaglFuc(dpno,pno,id){
<%--	if(id != "" && 'null' != id && null != id){--%>
<%--		alert("该档案已经新增!");--%>
<%--		return ;--%>
<%--	}--%>
	$('#daglInfo').dialog({
    title: '档案新增',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../daxxgl/daglAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					if($("#pM").val().length>30){
					alert("档案性质长度不能超过30位！")
					}
					
			    	 var data=$('#fm').formSerialize();
			    	 var url = "../archivesBaseInfoTrol/save";
			         $.ajax({  
							type: "post",  
							cache: false,  
							async: false, 
							url: url,  
							data: data,  
							success: function (result) {  
							    if(result == 1){
								    alert("您已成功新增档案信息！");
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
				$('#daglInfo').dialog('close');
				  
					//$('#daglInfo').window('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () { 
  
    if(dpno==0)
    dpno=window.top.cacheArchive.cacheDpno;
    
 
	    $("#fm input[name='p_no']").attr("value",dpno);
	    $("#fm input[name='s_code']").attr("value",pno);
		//$("#fm input[name='addDate']").datebox("setValue","2016-6-6");
		
    } //loadEnd
});

}


function editdaglFuc(){debugger;

	var row =$("#daglGrid").datagrid('getSelections');
	if(row==null||row==''){
		$.messager.alert("系统提示","请选择要操作的数据！");
		return;
	}else if(row.length>1){
		$.messager.alert("系统提示","只允许对一条数据进行操作！");
		return;
	}
	row=row[0];
	var id=row.id;
	var dpno=row.dpno;
	
		$('#editInfo').dialog({
	    title: '档案修改',
	    width: 950,
	    height: 450,
	    closed: false,
	    cache: false,
	    href: '../daxxgl/daglEdit.jsp',
	    modal: true,
	     buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
				    	 var data=$('#fmEdit').formSerialize();
				         $.ajax({  
								type: "post",  
								cache: false,  
								async: false, 
								url: "../archivesBaseInfoTrol/update",
								data: data,  
								success: function (result) {  
								    if(result == 1){
									    alert("您已成功修改档案信息！");
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
					$('#editInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save',
	    onLoad: function () {
			$("#fmEdit").form("clear"); 
		//	row.stuffName=rows.stuffName;
			row.stuff = sessionUserId;
			 var myDate = getNowFormatDate();
	        $("#add_date").datebox('setValue',row.add_date);
			$("#fmEdit").form("load",row);
			//$("#add_date").datebox('setValue',myDate);
			//$("#fm input[name='addDate']").datebox("setValue","2016-6-6");
			
	    } //loadEnd
	});

	}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

function viewdaglFuc(dpno,id){
	if(id == "" || 'null' == id || null == id){
		alert("该档案还未新增转入转出信息!");
		return ;
	}
	var rows = $("#daglGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
	$('#viewInfo').dialog({
    title: '档案查看',
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../daxxgl/daglView.jsp',
    modal: true,
     buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#viewInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
		$("#fmView").form("clear"); 
		$("#fmView").form("load",row);
    } //loadEnd
});

}

function query(){
	var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	var pState=$('#pState').combobox('getValue');
	var start=$('#start').datebox('getValue');
	var end=$('#end').datebox('getValue');
	$("#daglGrid").datagrid("load",{
		dept:dept,
		key:key,
		pnum:pnum,
		name:name,
		age:age,
		pState:pState,
		start:start,
		end:end
	});
}
//查看
function viewDaglMsg(){
	var selected=$('#daglGrid').datagrid('getSelected');
	if(!selected){
		alert('请选择您要查看的档案！');
	}else{
		viewdaglFuc(selected.dpno,selected.id);
	}
}
//编辑
function editDaglMsg(){
	var selected=$('#daglGrid').datagrid('getSelected');
	if(!selected){
		alert('请选择您要编辑的档案！');
	}else{
		var id=selected.id;
		 if(id != "" && 'null' != id && null != id){
			 editdaglFuc(selected.dpno,selected.id);
		 }else{
			 adddaglFuc(selected.dpno,selected.pno,selected.id);
		 }
	}
}
function delDaglMsg(){


	    var selectedRows = $("#daglGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要删除的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		 ids=strIds.join(",");
		
		$.messager.confirm("操作提示", "您确定要删除吗？", function (data) {
        if (data) {
        	$.ajax({
        		url:'<%=request.getContextPath()%>/archivesBaseInfoTrol/del',
        	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        	    data: {"ids" : ids},    //参数值
        	    type: "POST",   //请求方式
        		success: function (result) {  
				if(result == 1){
                    	 $.messager.alert('系统提示','删除成功！');
                    	 init();
        	        }else{
        	        	 $.messager.alert('系统提示','删除失败：'+resObj.errMsg);
        		    }
        	    },
        	    error: function() {
        	        //请求出错处理
        	    }
        	});
        }
        else {
            return;
        }
    });
}
</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="viewDaglMsg();" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">查看</a>
	    <a onclick="adddaglFuc(0,0,0);" id="a" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">新增</a>
	     <a onclick="editdaglFuc();" id="b" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">修改</a>
	    
		<a onclick="delDaglMsg();" id="c" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">删除</a>
		<a onclick="init();" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
		<!-- <a onclick="editDaglMsg();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</a>	 -->
	</div>
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
<br/>
  <select class="easyui-combobox" name="pState" id="pState" style="width:135px;"> 
       <option value="">  </option>    
	   <option value="1">转入</option>  
	   <option value="2">转出</option> 
	   </select>
	   <label>从：</label><input class="easyui-datebox"   name="start" id="start" size="20" style="height:22px">
	   <label>到：</label><input class="easyui-datebox"   name="end" id="end" size="20" style="height:22px">
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="daglGrid"></table>  
</div>
<div id="daglInfo"></div>
<div id="viewInfo"></div>
<div id="editInfo"></div>


</body>
</html>
