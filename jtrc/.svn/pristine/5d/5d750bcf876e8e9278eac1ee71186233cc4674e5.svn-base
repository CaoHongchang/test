<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
    <title>企业培训审核</title>
    <script type="text/javascript">
    
    
        $(function(){
        	initGrid();

        });

	function initGrid(queryParams){
		var grid = {
	            url:'../safetyProductionConsultController/qrySafetyProductionConsultList?type=1&checkState=1&contractState=1&isTrain=1',
	            singleSelect: false,
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
	                {field:'addDate',title:'申请培训时间',width : $(this).width() * 0.1,align:'center'},
	                {field:'cCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
	                {field:'name',title:'企业名称',width : $(this).width() * 0.1,align:'center'},
	                {field:'trainCheckState',title:'培训审核状态',width : $(this).width() * 0.15,
	               		 formatter: function(value,row,index){
	             					switch (row.trainCheckState) {
									case 1:
										return "审核通过";
									case 2:
										return "审核未通过";
									case 0:
										return "待审核";
									}
	             			},
	             	align:'center'},
	                {field:'trainState',title:'培训状态',width : $(this).width() * 0.15,
	             		 formatter: function(value,row,index){
	         				if (row.trainState=="1"){
	         					return "培训完成";
	         				} else {
	         					return "待培训";
	         				}
	         			},align:'center'},
	                {field:'operat',title:'操作',width : $(this).width() * 0.3,align:'center',formatter: function(value,row,index){
	         		    return '<a href="javascript:sh(\''+row.id+'\')" style="color: blue;">审核</a> <a href="javascript:pxwc(\''+row.id+'\')" style="color: blue;">培训完成</a>'
	         		           +' <a href="javascript:view(\''+row.id+'\')" style="color: blue;">查看</a>';
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
		var trainCheckState = $("#searchForm #trainCheckState").combobox("getValue");
		var trainState = $("#searchForm #trainState").combobox("getValue");
		if(cCode != ""){
			param.cCode = cCode;
	    }
		if(name != ""){
			param.name = name;
	    }
		if(trainCheckState != ""){
			param.trainCheckState = trainCheckState;
	    }
		if(trainState != ""){
			param.trainState = trainState;
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
		if(row.trainCheckState!=0 && null !=row.trainCheckState && "" != row.trainCheckState){
			$.messager.alert('系统提示','当前审核状态，无法进行审核！');
			return;
		}
		
		$('#auditDialog').dialog({
		    title: '企业培训审核',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/qypxAudit.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
		    	            var data=$('#auditForm').formSerialize();
		    	            
		    	            var trainRemark=$("#trainRemark").textbox("getValue");
		    	            if(trainRemark==""){
								$.messager.alert("系统提示","审核说明不能为空");
								return false;
							}
							if(trainRemark.length>150){
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
								url:"../safetyProductionConsultController/pxsh",
								type:"POST",
								cache: false,
								data:data,
								success:function(data){
									if(data == 1){
										$.messager.alert('系统提示','培训审核成功！');
										$("#auditDialog").dialog('close');
										$("#scbmGrid").datagrid("reload");	
									}else{
										$.messager.alert('系统提示',"培训审核失败");
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
		    	loadRow.trainCheckState=1;
		    	$('#auditForm').form('load', loadRow);
		    } //loadEnd
		});
	}
	
	
	/**
	培训完成
	**/
	function pxwc(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		if(row.trainCheckState!=1){
			$.messager.alert('系统提示','当前审核状态没有通过，无法完成！');
			return;
		}
		if(row.trainState == 1){
			$.messager.alert('系统提示','培训已完成');
			return;
		}
		
		if(confirm("确定要确认培训完成？")){
			$.ajax({
				url:"<%=path%>/safetyProductionConsultController/pxwc",
				type:"POST",
				data:"id="+row.id,
				cache: false,
				success:function(data){
					if(data == 1){
						$.messager.alert('系统提示','操作成功！');
						$("#scbmGrid").datagrid("reload");	
					}else{
						$.messager.alert('系统提示',"操作失败");
					}
					
				},
				error:function(e){
					$.messager.alert('错误','系统异常');
				}
				
			});
		}
	}


	/**
	查看
	**/
	function view(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		$('#qypxckDialog').dialog({
		    title: '企业培训查看',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/qypxView.jsp',
		    modal: true,
		    buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#qypxckDialog').dialog('close');
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
		    	$('#viewForm').form('clear');
		    	loadRow.trainCheckState=1;
		    	$('#viewForm').form('load', loadRow);
		    } //loadEnd
		});
	}


	

	function confirmContracts(){
		var rows = $("#scbmGrid").datagrid('getSelections');
        var length = rows.length;
        var ids = "";
        for (var i = 0; i < length; i++) {
            if (rows[i].trainCheckState == 1 && rows[i].trainState != 1) {
                if(ids == ""){
                    ids = rows[i].id;
                }else{
                	ids += "," + rows[i].id;
                }
            }
        }
        if(confirm("确定要确认选择数据的培训完成？")){
	        if(ids == ""){
				$.messager.alert('系统提示','请选择符合条件的数据');
				return;
			}else{
				$.ajax({
					url:"<%=path%>/safetyProductionConsultController/pxwc",
					type:"POST",
					data:"ids="+ids,
					cache: false,
					success:function(data){
						if(data == 1){
							$.messager.alert('系统提示','操作成功！');
							$("#scbmGrid").datagrid("reload");	
						}else{
							$.messager.alert('系统提示',"操作失败");
						}
					},
					error:function(e){
						$.messager.alert('错误','系统异常');
					}
					
				});
			}
		}
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
<div id="zcpshdTool"  style="background-color:#FFFFFF;">
			    <a  class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="confirmContracts();">培训完成</a>
			</div>
			
			
<div id="cc" class="easyui-layout" data-options="fit:true,border:false">

    <div class="easyui-panel" data-options="region:'north',border:false" style="padding:5px">
	<form id="searchForm">
	<table>   
		<tr>
			<td>组织机构代码：</td>
			<td><input class="easyui-textbox"  id="cCode" name="cCode"/></td>
			<td>企业名称：</td>
			<td><input class="easyui-textbox"  id="name" name="name"/></td>
			<td>培训审核状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox"  name="trainCheckState" id="trainCheckState" data-options="editable:false">
                <option value="">所有</option>
                <option value="0">待审核</option>
				<option value="2">审核未通过</option>
				<option value="1">审核通过</option>
			</select>
			</td>
			
			<td>培训状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox" id="trainState" name="trainState" data-options="editable:false">
                <option value="">所有</option>
                <option value="1">已完成</option>
				<option value="0">未完成</option>
			</select>
			</td>
			
			
			<td><a onclick="searchGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
		</tr>
		
	</table>
	</form>	
	</div>

    <div data-options="region:'center',title:'企业培训审核',border:false" style="" >
        <table id="scbmGrid"  singleSelect="true"  >
		
		</table>
    </div>
</div>

<div id="mask" style='position: fixed; width: 100%; height: 100%; top: 0px; filter: alpha(opacity=60); background-color: #777;z-index: 10000; left: 0px;opacity:0.5; -moz-opacity:0.5;display:none;'></div>
<img style="position: absolute;left:30%;top:30%;z-index: 10000; display: none;" width="500px" height="400px" id="showPic" src=""/>
<div id="auditDialog"></div>
<div id="qypxckDialog"></div>

</body>
</html>
