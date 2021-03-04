<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
    <title>安全生产标准化咨询审核</title>
    <script type="text/javascript">
    
    
        $(function(){
        	initGrid();

        });

	function initGrid(queryParams){
		var grid = {
	            url:'../safetyProductionConsultController/qrySafetyProductionConsultList?type=1',
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
	                {field:'contractState',title:'合同签订状态',width : $(this).width() * 0.15,
	             		 formatter: function(value,row,index){
	         				if (row.contractState=="1"){
	         					return "已签订";
	         				} else {
	         					return "未签订";
	         				}
	         			},align:'center'},
	                {field:'operat',title:'操作',width : $(this).width() * 0.3,align:'center',formatter: function(value,row,index){
	         		    return '<a href="javascript:sh(\''+row.id+'\')" style="color: blue;">审核</a> <a href="javascript:htqr(\''+row.id+'\')" style="color: blue;">合同确认</a>'
	         		           +' <a href="javascript:pxclsc(\''+row.id+'\')" style="color: blue;">培训材料上传</a> <a href="javascript:htsc(\''+row.id+'\')" style="color: blue;">合同上传</a>'
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
		//var data=$('#searchForm').formSerialize();
		//alert(data);
		//alert(form2Json("searchForm"));
		var param = {};
		var cCode = $("#searchForm #cCode").val();
		var name = $("#searchForm #name").val();
		var checkState = $("#searchForm #checkState").combobox("getValue");
		var contractState = $("#searchForm #contractState").combobox("getValue");
		if(cCode != ""){
			param.cCode = cCode;
	    }
		if(name != ""){
			param.name = name;
	    }
		if(checkState != ""){
			param.checkState = checkState;
	    }
		if(contractState != ""){
			param.contractState = contractState;
	    }
		$('#scbmGrid').datagrid("load",param);
		//form2Json("searchForm");
		//initGrid(form2Json("searchForm"));
		//initGrid(form2Json("searchForm"));
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
	    //var json = JSON.parse(jsonStr)
	    return jsonStr;
	}

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
		$('#viewDialog').dialog({
		    title: '安全生产报名查看',
		    width: 750,
		    height: 450,
		   
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/aqscbzhzxshView.jsp',
		    modal: true,
		    buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#viewDialog').dialog('close');
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
		    	loadRow.checkState=row.checkState;
		    	$('#viewForm').form('load', loadRow);
		    } //loadEnd
		});
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
		    href: '<%=path%>/aqsczxywbl/aqscbzhzxshAudit.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
							var checkRemark=$("#checkRemark").textbox("getValue");
							if(checkRemark==""){
								$.messager.alert("系统提示","审核说明不能为空");
								return false;
							}
							if(checkRemark.length>150){
								$.messager.alert("系统提示","审核说明长度不超过150位");
								return false;
							}
		    	            var data=$('#auditForm').formSerialize();
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
	
	
	/**
	确认合同
	**/
	function htqr(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		if(row.checkState!=1){
			$.messager.alert('系统提示','当前审核状态没有通过，无法确认！');
			return;
		}
		if(row.contractState == 1){
			$.messager.alert('系统提示','合同已确认');
			return;
		}
		
		if(confirm("确定要确认合同？")){
			$.ajax({
				url:"<%=path%>/safetyProductionConsultController/htqr",
				type:"POST",
				data:"id="+row.id,
				cache: false,
				success:function(data){
					if(data == 1){
						$.messager.alert('系统提示','合同确认成功！');
						$("#scbmGrid").datagrid("reload");	
					}else{
						$.messager.alert('系统提示',"合同确认失败");
					}
					
				},
				error:function(e){
					$.messager.alert('错误','系统异常');
				}
				
			});
		}
	}


	/**
	合同上传
	**/
	function htsc(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		if(row.checkState!=1){
			$.messager.alert('系统提示','当前审核状态没有通过，无法上传！');
			return;
		}
		$('#htscDialog').dialog({
		    title: '合同上传',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/htsc.jsp',
		    modal: true,
		    buttons:[{
						text:'提交',
						iconCls:'icon-ok',
						handler:function(){
		    	            var result = $("#htForm").form("validate");
	                        if(result){
								if(judgeFile()){
									$('#htForm').form('submit',{
										url:'../safetyProductionConsultController/htsc?imgSize=5&imgTypes=|doc|docx|',
										queryParams:{
											id:id
										},
										success:function(data){
										  if(data==1){
											$('#htscDialog').dialog('close');
											$('#scbmGrid').datagrid('reload');
										  }else{
											$.messager.alert('系统提示',data);
										   }
										}
										
									});
								}
	                        }
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#htscDialog').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadHtGrid(id,'');
		    } //loadEnd
		});
	}

	//判断附件类型
	function judgeFile(){
		var filename=$('#file').filebox('getValue');
  		if(filename!=""){
	  		var suffix=filename.substring(filename.lastIndexOf("."),filename.length).toUpperCase();
			
			//判断文件类型* PNG ，JPEG ，TIFF，ZIP、RAR、DOC、DOCX、XLS、XLSX
			var ftype=[".DOC",".DOCX"];
			var flag=false;
			for(var i=0;i<ftype.length;i++){
				if(suffix==ftype[i]){
					flag=true;
					break;
				}
			}
			if(!flag){
				$.messager.alert('系统提示',"文件格式需为【DOC,DOCX】");
			}else{
<%--			    var filesize=files[0].size/1024/1024;--%>
<%--				if(filesize>5){--%>
<%--						$.messager.alert('系统提示',"文件大小不能大于5M");--%>
<%--					    flag=false;--%>
<%--				}--%>
			}
			return flag;
  		}else{
  		  return true;
  		 }
		
     }

	/**
	培训材料上传
	**/
	function pxclsc(id){
		var rows = $("#scbmGrid").datagrid('getData').rows;
        var length = rows.length;
        var row;
        for (var i = 0; i < length; i++) {
            if (rows[i].id == id) {
                row = rows[i];
                break;
            }
        }
		if(row.contractState!=1){
			$.messager.alert('系统提示','当前合同签订状态没有通过，无法上传！');
			return;
		}

		$('#pxclDialog').dialog({
		    title: '培训材料列表',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/pxclsc.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
				            if(confirm("确认更改此安全生产咨询材料吗？")){
				            	var rows2 = $("#pxclGrid").datagrid("getRows"); 
						    	var paths = "";
						    	for(var i=0;i<rows2.length;i++){
						    	     if(paths == ""){
							    	     paths = rows2[i].path;
							    	 }else{
							    		 paths += "," + rows2[i].path;
								     }
						    	}
						    	$.ajax({
									url:"../safetyProductionConsultController/updateCl",
									type:"POST",
									cache: false,
									data:"paths=" + paths + "&id=" + id,
									success:function(data){
										if(data == 1){
											$.messager.alert('系统提示','保存材料成功！');
											$('#pxclDialog').dialog('close');
										}else{
											$.messager.alert('系统提示',"保存材料失败");
										}
									},
									error:function(e){
										$.messager.alert('错误','系统异常');
									}
								});
					        }
						}
					},{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						$('#pxclDialog').dialog('close');
						}
					}],
		    iconCls: 'icon-save',
		    onLoad: function () {
		    	loadPxclGrid(id);
		    	$("#pxclscForm").form('load', row);
		    } //loadEnd
		});
		
	}

	function delCl(id,safeId){
		if(confirm("确认删除咨询材料吗？")){
			$.ajax({
				url:"../safetyProductionConsultController/delCl?id=" + id,
				type:"POST",
				cache: false,
				data:'',
				success:function(data){
					if(data == 1){
						$.messager.alert('系统提示','删除材料成功！');
						loadPxclGrid(safeId);
					}else{
						$.messager.alert('系统提示',"删除材料失败");
					}
					
				},
				error:function(e){
					$.messager.alert('错误','系统异常');
				}
			});
	    }
	};

	function loadPxclGrid(id){
		var dg = $('#pxclGrid').datagrid( {
			url    :"../safetyProductionConsultController/pxclList?id=" + id,
			border : true,
			rownumbers:true,
			singleSelect:true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			method: 'get',
			remoteSort : false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'path',title:'文件',width:$(this).width() * 0.5,align:'center'},         
	            {field:'cz',title:'操作',width:$(this).width() * 0.5,
         		 formatter: function(value,row,index){
	            	return '<a href="javascript:delSelectRow()" style="color: blue;">删除</a>';
     				//return '<a href="javascript:delCl(\''+row.id+'\',\''+id+'\')" style="color: blue;">删除</a>';
     			},align:'center'}
	        ]]
		});
	}

	function loadHtGrid(id,key){
		var dg = $('#htGrid').datagrid( {
			url    :"../safetyProductionConsultController/htmbList?id=" + id + "&key=" + key,
			border : true,
			rownumbers:true,
			singleSelect:true,
			striped : true,
			collapsible : true,
			fitColumns : true,
			fit: false, 
			sortName : '',
			sortOrder : 'desc',
			method: 'get',
			remoteSort : false,
			iconCls: 'icon-edit',
			columns:[[    
	            {field:'mid',title:'合同编号',width:$(this).width() * 0.3,align:'center'},  
	            {field:'name',title:'合同名称',width:$(this).width() * 0.3,align:'center'},        
	            {field:'cz',title:'操作',width:$(this).width() * 0.4,
         		 formatter: function(value,row,index){
     				return '<a href="javascript:download(\''+row.path+'\')" style="color: blue;">下载</a>';
     			},align:'center'}
	        ]]
		});
	}

	//查询合同模板
	function searchHtGrid(){
		var key = $("#key").val();
		loadHtGrid('',key);
    }
	
	
	/***
	图片预览
	**/
	function imagePreview(id){
		var path = $("#"+id).val();
		$("#showPic").attr("src","/jt/requestSafetyProduction/getPicByPath?path=" + path);
        $("#showPic").css("display","");
		//showImg("<%=domainAndPort%>"+$("#"+id).textbox("getValue"));
		/**s
		$('#previewDialog').dialog({
		    title: '图片预览',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    modal: true,
		    buttons:[{
						text:'关闭',
						iconCls:'icon-cancel',
						handler:function(){
						  $('#previewDialog').dialog('close');
						}
					}],
		    iconCls: 'icon-image-preview',
		    onLoad: function () {
		    	
		    } 
		});
		**/
	}
	
	
	/**
	显示图片
	**/
	function showImg(src){
	   var prevImg = new Image();
	   if(src){
			prevImg.onload = function(){
			  $("#mask").show();
			  var $prevImg = $(prevImg),
				  winW = $(window).width(),
				  winH = $(window).height(),
				  imgW = parseInt(prevImg.width || "0"),
				  imgH = parseInt(prevImg.height || "0");
			  $prevImg.removeAttr("width")
					  .removeAttr("height")
					  .css({
							position: "fixed",
							top:0,
							left:0,
							width:(winW > imgW ? imgW : winW)+"px",
							height:(winH > imgH ?  imgH  : winH)+"px",
							marginLeft:   (winW > imgW ? (winW - imgW-14)/2 : 0),
							marginTop:  (winH > imgH ? (winH - imgH-14)/2 : 0),
							padding: "5px",
							border: "2px solid #ccc",
							"border-radius" : "5px",
							opacity : 0.2,
							zIndex : 10001,
							cursor: "pointer"
						}).appendTo("body")
						  .animate({
								opacity: 1
							}, 300)
						  .off("click")
						  .on("click", function(){
								$(this).animate({
									opacity: 0.2
								}, 300, function(){
									$(this).hide().remove();
									$("#mask").hide();
								});
							});
			       };
			       
			       prevImg.onerror = function(){
			    	   $.messager.alert('错误','加载图片失败');
			       }
			       
			       prevImg.src = src;
		}else{
			$.messager.alert('错误','无效地址');
		}
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

	function htqrs(){
		var rows = $("#scbmGrid").datagrid('getSelections');
        var length = rows.length;
        var ids = "";
        for (var i = 0; i < length; i++) {
            if (rows[i].checkState == 1 && rows[i].contractState != 1) {
                if(ids == ""){
                    ids = rows[i].id;
                }else{
                	ids += "," + rows[i].id;
                }
            }
        }
        if(confirm("确定要确认选择数据的合同？")){
	        if(ids == ""){
				$.messager.alert('系统提示','请选择符合条件的数据');
				return;
			}else{
				$.ajax({
					url:"<%=path%>/safetyProductionConsultController/htqr",
					type:"POST",
					data:"ids="+ids,
					cache: false,
					success:function(data){
						if(data == 1){
							$.messager.alert('系统提示','合同确认成功！');
							$("#scbmGrid").datagrid("reload");	
						}else{
							$.messager.alert('系统提示',"合同确认失败");
						}
						
					},
					error:function(e){
						$.messager.alert('错误','系统异常');
					}
					
				});
			}
		}
	}


	 //文件上传
	 function importFuc(){
		var id = $("#pxclscForm input[name='id']").val();
		$("#pxclscForm").ajaxSubmit({
			dataType:"html",
			url : "../safetyProductionConsultController/wjUpload?imgSize=2",
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			async : true,
			success : function(data) {
				//if(data == "1" || data == 1){
					//loadPxclGrid(id);
				if(data.indexOf("##") != -1){
					$('#pxclGrid').datagrid('appendRow', {         
		                 path: data.substring(2),
		                 cz: '<a href="javascript:delSelectRow()" style="color: blue;">删除</a>'
		             });
				}else{
					alert(data);
				}
			},
			error : function(data) {
				 errorMsg();
			}
		});

	} 

	function delSelectRow(){
		 var row = $('#pxclGrid').datagrid('getSelected');
		 if (row) {
		       var rowIndex = $('#pxclGrid').datagrid('getRowIndex', row);
		       $('#pxclGrid').datagrid('deleteRow', rowIndex);  
		 }
	}


    function download(path){
    	var url= "<%=request.getContextPath()%>/safetyProductionConsultController/exportModel?path="+encodeURIComponent(path);
		window.location.href= url; 
    }
</script>


<body style="margin: 1px;">
<div id="zcpshdTool"  style="background-color:#FFFFFF;">
			    <a  class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="htqrs();">合同签订确认</a>
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
			<td>咨询审核状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox"  name="checkState" id="checkState" data-options="editable:false">
                <option value="">所有</option>
                <option value="0">待审核</option>
				<option value="2">审核未通过</option>
				<option value="1">审核通过</option>
			</select>
			</td>
			
			<td>合同签订状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox" id="contractState" name="contractState" data-options="editable:false">
                <option value="">所有</option>
                <option value="1">已签订</option>
				<option value="0">未签订</option>
			</select>
			</td>
			
			
			<td><a onclick="searchGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
		</tr>
		
	</table>
	</form>	
	</div>

    <div data-options="region:'center',title:'安全生产标准化咨询报名审核',border:false" style="" >
        <table id="scbmGrid"  singleSelect="true"  >
		
		</table>
    </div>
</div>

<div id="mask" style='position: fixed; width: 100%; height: 100%; top: 0px; filter: alpha(opacity=60); background-color: #777;z-index: 10000; left: 0px;opacity:0.5; -moz-opacity:0.5;display:none;'></div>
<img style="position: absolute;left:30%;top:30%;z-index: 10000; display: none;" width="500px" height="400px" id="showPic" src=""/>
<div id="auditDialog"></div>
<div id="pxclDialog"></div>
<div id="htscDialog"></div>
<div id="viewDialog"></div>
</body>
</html>
