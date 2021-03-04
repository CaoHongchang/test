<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
    <title>安全类型培训审核</title>
    <script type="text/javascript">
    
    
        $(function(){
        	initGrid();

        });

	function initGrid(queryParams){
		var grid = {
	            url:'../safetyProductionConsultController/qrySafetyProductionConsultList?type=2',
	            border : true,
    			pageSize : 20,
    			pageList : [ 10, 20, 30, 40 ],
    			striped : true,
    			collapsible : true,
    			fitColumns : true,
    			height : wholeHeight,
    			toolbar : '#zcpshdTool',
    			pagination : true,
    			sortName : '',
    			sortOrder : 'desc',
    			remoteSort : false,
	            columns:[[
                    {field:'id',title:'选择',width : $(this).width() * 0.1,checkbox : true,align:'center'},
	                {field:'addDate',title:'申请时间',width : $(this).width() * 0.1,align:'center'},
	                {field:'cCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
	                {field:'parentName',title:'主企业',width : $(this).width() * 0.2,align:'center'},
	                {field:'name',title:'企业名称',width : $(this).width() * 0.1,align:'center'},
	                {field:'type',title:'申请项目',width : $(this).width() * 0.2,
	               	 formatter: function(value,row,index){
	        				if (row.type=="1"){
	        					return "安全生产标准化咨询";
	        				} else {
	        					return "安全类型培训";
	        				}
	        			},
	               	 align:'center'},
	                {field:'checkState',title:'咨询审核状态',width : $(this).width() * 0.15,
	               		 formatter: function(value,row,index){
	             					switch (row.checkState) {
									case 1:
										return "审核通过";
									case 2:
										return "审核未通过";
									default:
										return "待审核";
									}
	             			},
	             	align:'center'},
	                {field:'operat',title:'操作',width : $(this).width() * 0.3,align:'center',formatter: function(value,row,index){
	         		    return '<a href="javascript:sh(\''+row.id+'\')" style="color: blue;">审核</a>';
	         		}}
	            ]]
	        };
		
	   if(queryParams){
			 $('#scbmGrid').datagrid($.extend(true,grid,{queryParams:queryParams}));  
	   }else{
		   $('#scbmGrid').datagrid(grid); 
	   }
        
        var pager = $('#scbmGrid').datagrid('getPager');
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
	
	
	/***
	**
	查询
	**
	**/
	function searchGrid(){
		//initGrid(form2Json("searchForm"));
		var param = {};
		var cCode = $("#searchForm #cCode").val();
		var name = $("#searchForm #name").val();
		var checkState = $("#searchForm #checkState").combobox("getValue");
		if(cCode != ""){
			param.cCode = cCode;
	    }
		if(name != ""){
			param.name = name;
	    }
		if(checkState != ""){
			param.checkState = checkState;
	    }
		$('#scbmGrid').datagrid("load",param);
	}


	//将表单数据转为json
	function form2Json(id) {

	    var arr = $("#" + id).serializeArray()
	    var jsonStr = "";

	    jsonStr += '{';
	    for (var i = 0; i < arr.length; i++) {
	    	if(arr[i].value){
	    		jsonStr += ',"' + arr[i].name + '":"' + arr[i].value+'"';
	    	}
	    }
	    jsonStr = jsonStr.replace(",", "");
	    jsonStr += '}'

	    var json = JSON.parse(jsonStr)
	    return json
	}
	
	
	/**
	     审核
	**/
	function  sh(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		if(row.checkState!=0 && null != row.checkState && "" != row.checkState){
			$.messager.alert('系统提示','当前审核状态，无法进行审核！');
			return;
		}
		
		$('#auditDialog').dialog({
		    title: '安全生产报名审核',
		    width: 750,
		    height: 450,
		   
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/aqlxpxshAudit.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
		    	            var data=$('#auditForm').formSerialize();
		    	            var checkRemark=$("#checkRemark").textbox("getValue");
		    	            if(checkRemark==""){
								$.messager.alert("系统提示","审核说明不能为空");
								return false;
							}
							if(checkRemark.length>150){
								$.messager.alert("系统提示","审核说明长度不超过150位");
								return false;
							}
							var trainMsg=$("#trainMsg").textbox("getValue");
		    	            if(trainMsg==""){
								$.messager.alert("系统提示","培训信息不能为空");
								return false;
							}
							if(trainMsg.length>150){
								$.messager.alert("系统提示","培训信息长度不超过150位");
								return false;
							}
							$.ajax({
								url:"../safetyProductionConsultController/sh",
								type:"POST",
								cache: false,
								data:data,
								success:function(data){
									if(data == 1){
										$.messager.alert('系统提示','报名审核成功！');
										$("#auditDialog").dialog('close');
										$("#scbmGrid").datagrid("reload");	
									}else{
										$.messager.alert('系统提示',"报名审核失败");
									}
									
								},
								error:function(e){
									$.messager.alert('错误','系统异常');
								}
								
							});
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#auditDialog').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	var loadRow = {};
		    	$.extend(true,loadRow,row);
		    	switch (loadRow.proId) {
				case 0:
					loadRow.proId = "私企";
					break;
				case 1:
					loadRow.proId = "国企";
					break;
				case 2:
					loadRow.proId = "外企";
					break;
				case 3:
					loadRow.proId = "合资";
					break;
				default:
					loadRow.proId = "国企";
					break;
				}
		    	$('#auditForm').form('clear');
		    	loadRow.checkState=1;
		    	$('#auditForm').form('load', loadRow);
		    } //loadEnd
		});
	}

	/***
	图片预览
	**/
	function imagePreview(id){
		var path = $("#"+id).val();
		$("#showPic").attr("src","/jt/requestSafetyProduction/getPicByPath?path=" + path);
        $("#showPic").css("display","");
	}

	/***
	下载图片
	**/
	function downloadImage(id){
		var path = $("#"+id).val();
		location.href = "/jt/requestSafetyProduction/downloadPic?path="+path;
	}
	
	$(function(){
		document.onmousedown=function(event){ 
	    	if($("#showPic").css("display") != 'none'){
	    		$("#showPic").css("display","none");
	        }
		};
	});
	
</script>


<body style="margin: 1px;">
			
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">

    <div class="easyui-panel" data-options="region:'north',border:false" style="padding:5px">
	<form id="searchForm">
	<table>   
		<tr>
			<td>组织机构代码：</td>
			<td><input class="easyui-textbox"  id="cCode" name="cCode"/></td>
			<td>企业名称：</td>
			<td><input class="easyui-textbox"  id="name" name="name"/></td>
			<td>咨询审核状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox"  name="checkState" id="checkState" data-options="editable:false">
                <option value="">所有</option>
                <option value="0">待审核</option>
				<option value="2">审核未通过</option>
				<option value="1">审核通过</option>
			</select>
			</td>
			
			
			<td><a onclick="searchGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
		</tr>
		
	</table>
	</form>	
	</div>

    <div data-options="region:'center',title:'安全类型培训审核',border:false" style="" >
        <table id="scbmGrid"  singleSelect="true"  >
		
		</table>
    </div>
</div>

<div id="mask" style='position: fixed; width: 100%; height: 100%; top: 0px; filter: alpha(opacity=60); background-color: #777;z-index: 10000; left: 0px;opacity:0.5; -moz-opacity:0.5;display:none;'></div>
<img style="position: absolute;left:30%;top:30%;z-index: 10000; display: none;" width="500px" height="400px" id="showPic" src=""/>

<div id="auditDialog"></div>

</body>
</html>
