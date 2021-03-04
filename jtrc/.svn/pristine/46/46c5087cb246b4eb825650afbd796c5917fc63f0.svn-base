<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
   <title>企业排查审核</title>
    <script type="text/javascript">
        $(function(){
        	initGrid();
        });

        function initGrid(queryParams){
    		var grid = {
    				url:'../safetyProductionConsultController/qrySafetyProductionConsultList?type=1&isChcek=1&trainState=1',
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
        	                    {field:'lastCheckAddDate',title:'申请排查时间',width : $(this).width() * 0.1,align:'center'},
        	                    {field:'cCode',title:'组织机构代码',width : $(this).width() * 0.1,align:'center'},
        	                    {field:'name',title:'企业名称',width : $(this).width() * 0.2,align:'center'},
        	                    {field:'lastCheckState',title:'排查审核状态',width : $(this).width() * 0.1,
        		               		     formatter: function(value,row,index){
        				     					switch (row.lastCheckState) {
        										case 1:
        											return "排查通过";
        										case 2:
        											return "排查未通过";
        										case 0:
        											return "待排查";
        										}
        				     			},
        				     	align:'center'},
        	                    {field:'checkCount',title:'排查次数',width : $(this).width() * 0.2,align:'center'},
        	                    {field:'operat',title:'操作',width : $(this).width() * 0.3,align:'center',formatter: function(value,row,index){
        		         		    return '<a href="javascript:sh(\''+row.id+'\')" style="color: blue;">审核</a>'
        		         		           +' <a href="javascript:view(\''+row.id+'\')" style="color: blue;">查看/打印</a>';
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
    		var lastCheckState = $("#searchForm #lastCheckState").combobox("getValue");
    		if(cCode != ""){
    			param.cCode = cCode;
    	    }
    		if(name != ""){
    			param.name = name;
    	    }
    		if(lastCheckState != ""){
    			param.lastCheckState = lastCheckState;
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
		if(row.lastCheckState!=0){
			$.messager.alert('系统提示','当前审核状态，无法进行审核！');
			return;
		}
		
		$('#auditDialog').dialog({
		    title: '企业排查审核',
		    width: 750,
		    height: 450,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/aqsczxywbl/pcshAudit.jsp',
		    modal: true,
		    buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
		    	            var data=$('#auditForm').formSerialize();
		    	            var trainRemark=$("#pcRemark").textbox("getValue");
		    	            if(trainRemark==""){
								$.messager.alert("系统提示","审核说明不能为空");
								return false;
							}
							if(trainRemark.length>150){
								$.messager.alert("系统提示","审核说明长度不超过150位");
								return false;
							}
							$.ajax({
								url:"../safetyProductionConsultController/pcsh",
								type:"POST",
								cache: false,
								data:data,
								success:function(data){
									if(data == 1){
										$.messager.alert('系统提示','排查审核成功！');
										$("#auditDialog").dialog('close');
										$("#scbmGrid").datagrid("reload");	
									}else{
										$.messager.alert('系统提示',"排查审核失败");
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
		    	loadRow.pcState=1;
		    	$('#auditForm').form('load', loadRow);
		    	loadPcGrid(id);
		    } //loadEnd
		});
	}

    //加载排查情况列表
	function loadPcGrid(id){
		var dg = $('#pcGrid').datagrid( {
			url    :"../safetyProductionConsultController/pcList?id=" + id,
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
	            {field:'addDate',title:'申请排查时间',width:$(this).width() * 0.3,align:'center'}, 
	            {field:'state',title:'排查审核状态',width:$(this).width() * 0.3,
          		     formatter: function(value,row,index){
			 					switch (row.state) {
								case 1:
									return "审核通过";
								case 2:
									return "审核未通过";
								default:
									return "待审核";
								}
			 			},
			 	align:'center'},     
	            {field:'remark',title:'排查反馈',width:$(this).width() * 0.3,align:'center'}
	        ]]
		});
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
            $('#view').dialog({
                title: '查看',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: '../aqsczxywbl/pcshView.jsp',
                modal: true,
                buttons:[{
                    text:'打印',
                    iconCls:'icon-print',
                    handler:function(){
                        window.location.href = "../safetyProductionConsultController/qypcExport?id="+id;
<%--	                	$.ajax({--%>
<%--							url:"../safetyProductionConsultController/qypcExport?id="+id,--%>
<%--							type:"POST",--%>
<%--							cache: false,--%>
<%--							success:function(data){--%>
<%--							},--%>
<%--							error:function(e){--%>
<%--								$.messager.alert('错误','系统异常');--%>
<%--							}--%>
<%--							--%>
<%--						});--%>
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#view').dialog('close');
                    }
                }],
                iconCls: 'icon-save',
                onLoad: function () {
	            	$('#fm').form('clear');
	            	row.projectName = "安全生产标准化咨询";
			    	$('#fm').form('load', row);
                    $('#deptGrid').datagrid({
                        url:"../safetyProductionConsultController/pcList?id=" + id,
                        title:'排查情况列表',
                        border:true,
                        striped: true,
                        rownumbers:true,
                        collapsible:false,
                        fitColumns:true,
                        height: 250,
                        idField: 'id',
                        singleSelect: true,
                        width:"100%",
                        sortName: '',
                        sortOrder: 'desc',
                        remoteSort: false,
                        columns:[[
                            {field:'addDate',title:'申请排查时间',width:$(this).width() * 0.3,align:'center'}, 
				            {field:'state',title:'排查审核状态',width:$(this).width() * 0.3,
			          		     formatter: function(value,row,index){
						 					switch (row.state) {
											case 1:
												return "审核通过";
											case 2:
												return "审核未通过";
											default:
												return "待审核";
											}
						 			},
						 	align:'center'},     
				            {field:'remark',title:'排查反馈',width:$(this).width() * 0.3,align:'center'}
                        ]]
                    });

                }

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
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div class="easyui-panel" data-options="region:'north',border:false" style="padding:5px">
	<form id="searchForm">
	<table>   
		<tr>
			<td>组织机构代码：</td>
			<td><input class="easyui-textbox"  id="cCode" name="cCode"/></td>
			<td>企业名称：</td>
			<td><input class="easyui-textbox"  id="name" name="name"/></td>
			<td>企业排查状态：</td>
			<td>
			<select style="width:160px" class="easyui-combobox"  name="lastCheckState" id="lastCheckState" data-options="editable:false">
                <option value="">所有</option>
                <option value="0">待排查</option>
				<option value="2">排查未通过</option>
				<option value="1">排查通过</option>
			</select>
			</td>
			<td><a onclick="searchGrid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
		</tr>
		
	</table>
	</form>	
	</div>
    <div data-options="region:'center',title:'排查审核列表',border:false" style="">
        <table id="scbmGrid"></table>
    </div>
</div>
<img style="position: absolute;left:30%;top:30%;z-index: 10000; display: none;" width="500px" height="400px" id="showPic" src=""/>
<div id="auditDialog"></div>
<div id="view"></div>

</body>
</html>
