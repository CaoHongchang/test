<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>人事业务代理审核</title>
</head>

<script type="text/javascript">
	$(function(){
	
	$("#a").hide();
   $("#b").hide();
   $("#c").hide();
   $("#d").hide();
   $("#e").hide();
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==262){
				$("#a").show();
			}else if(value==263){
				$("#b").show();
			}else if(value==264){
				$("#c").show();
			}else if(value==265){
				$("#d").show();
			}else if(value==266){
				$("#e").show();
			}
	});
    },"json");
    
		loadList();
	});

	function view() {
		var rows = $("#ywblGrid").datagrid("getSelections"); 
		if(rows.length == 0){
			$.messager.alert('系统提示',"请选择要查看的业务信息！");
			return false;
		}else if(rows.length > 1){
			$.messager.alert('系统提示',"不能同时查看多条记录！");
			return false;
		}  else{
			var row = rows[0];
			$('#viewInfo').dialog( {
				title : '业务查看',
				width : 650,
				height : 500,
				closed : false,
				cache : false,
				href : '../rsdlgl/ywView.jsp',
				modal : true,
				buttons : [{
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#viewInfo').dialog('close');
					}
				} ],
				onLoad : function() {
					if(null == row.typeName || row.typeName == ""){
						row.typeName = "其他";
				    }
					if(null == row.businessName || row.businessName == ""){
						row.businessName = "其他";
				    }
					$("#fmView").form("load",row);
					if("" != row.pic1){
						var img1 = '<tr>';
						img1 += '<td class="left">图片1：</td>';
						img1 += '<td class="right" colspan="3">';
						img1 += '<img alt="" width="300" height="200" id="pic1" src="/jtrc/typeInfo/getPicByPath?path='+row.pic1+'">';
						img1 += '</td>';
						img1 += '</tr>';
						$("#viewTable").append(img1);
					}
					if("" != row.pic2){
						var img1 = '<tr>';
						img1 += '<td class="left">图片2：</td>';
						img1 += '<td class="right" colspan="3">';
						img1 += '<img alt="" width="300" height="200" id="pic2" src="/jtrc/typeInfo/getPicByPath?path='+row.pic2+'">';
						img1 += '</td>';
						img1 += '</tr>';
						$("#viewTable").append(img1);
					}
					if("" != row.pic3){
						var img1 = '<tr>';
						img1 += '<td class="left">图片3：</td>';
						img1 += '<td class="right" colspan="3">';
						img1 += '<img alt="" width="300" height="200" id="pic3" src="/jtrc/typeInfo/getPicByPath?path='+row.pic3+'">';
						img1 += '</td>';
						img1 += '</tr>';
						$("#viewTable").append(img1);
					}
				}
			});
		}
	}

	function sh() {
		var rows = $("#ywblGrid").datagrid("getSelections"); 
		if(rows.length == 0){
			$.messager.alert('系统提示',"请选择要审核的业务信息！");
			return false;
		}else if(rows.length > 1){
			$.messager.alert('系统提示',"不能同时审核多条记录！");
			return false;
		} else{
			var row = rows[0];
			if(row.sstate != 0){
				$.messager.alert('系统提示',"业务已审核！");
				return false;
		    }
		    
		    else{
				$('#shInfo').dialog( {
					title : '业务审核',
					width : 650,
					height : 500,
					closed : false,
					cache : false,
					href : '../rsdlgl/ywsh.jsp',
					modal : true,
					buttons : [{
						text : '审核',
						iconCls : 'icon-ok',
						handler : function() {debugger
						//console.log("-->>>");
						if($("#sider").textbox('getValue').length>150){
						$.messager.alert("系统提示","审核意见仅限于150字");
						return;
						}
							$.ajax({  
								type: "post",  
								cache: false,  
								url: "../rsBusinessInfo/shBusinessInfo",  
								data: "id=" + $("#id").val() + "&sstate=" + $("#shState").combobox("getValue") + "&sider=" + $("#sider").val(),  
								success: function (result) {  
								    if(result == 1){
										$.messager.alert('系统提示',"操作成功");
										$('#shInfo').dialog('close');
										$('#ywblGrid').datagrid('reload');  
									}else{
										$.messager.alert('系统提示',result);
									}
								}  
							});   
						}
					},{
						text : '关闭',
						iconCls : 'icon-cancel',
						handler : function() {
							$('#shInfo').dialog('close');
						}
					} ],
					onLoad : function() {
						if(null == row.typeName || row.typeName == ""){
							row.typeName = "其他";
					    }
						if(null == row.businessName || row.businessName == ""){
							row.businessName = "其他";
					    }
						$("#fm").form("load",row);
						if("" != row.pic1){
							var img1 = '<tr>';
							img1 += '<td class="left">图片1：</td>';
							img1 += '<td class="right" colspan="3">';
							img1 += '<img alt="" width="300" height="200" id="pic1" src="/jtrc/typeInfo/getPicByPath?path='+row.pic1+'">';
							img1 += '</td>';
							img1 += '</tr>';
							$("#shTable").append(img1);
						}
						if("" != row.pic2){
							var img1 = '<tr>';
							img1 += '<td class="left">图片2：</td>';
							img1 += '<td class="right" colspan="3">';
							img1 += '<img alt="" width="300" height="200" id="pic2" src="/jtrc/typeInfo/getPicByPath?path='+row.pic2+'">';
							img1 += '</td>';
							img1 += '</tr>';
							$("#shTable").append(img1);
						}
						if("" != row.pic3){
							var img1 = '<tr>';
							img1 += '<td class="left">图片3：</td>';
							img1 += '<td class="right" colspan="3">';
							img1 += '<img alt="" width="300" height="200" id="pic3" src="/jtrc/typeInfo/getPicByPath?path='+row.pic3+'">';
							img1 += '</td>';
							img1 += '</tr>';
							$("#shTable").append(img1);
						}
					}
				})
		    }
	    }
	}

	function addKd() {
		var rows = $("#ywblGrid").datagrid("getSelections"); 
		if(rows.length == 0){
			$.messager.alert('系统提示',"请选择要添加快递的业务信息！");
			return false;
		}else if(rows.length > 1){
			$.messager.alert('系统提示',"不能同时给多条记录新增快递！");
			return false;
		} else{
			var row = rows[0];
			if(row.sDirect == '1' || row.sDirect == 1){
                alert('回收业务不允许添加快递');
		    }else if(row.sstate =='2' || row.sstate == 2){
                alert('审核失败状态不允许添加快递');
		    }else if(row.sstate =='3' || row.sstate == 3){
                alert('已办结状态不允许添加快递');
		    }else if(row.sstate =='0' || row.sstate == 0){
                alert('未审核状态不允许添加快递');
		    }else{
				$('#kddhAddInfo').dialog( {
					title : '快递单号',
					width : 350,
					height : 200,
					closed : false,
					cache : false,
					href : '../rsdlgl/kddhAdd.jsp',
					modal : true,
					buttons : [ {
						text : '保存',
						iconCls : 'icon-ok',
						handler : function() {
						var kCompany=$("#kCompany").val();
						if(kCompany.length>20){
						alert("快递公司长度不超过20个字");
						return;
						}
						var kpno =$("#kpno").val();
						/* if(!Kpno_Validation(kpno)){
						alert('快递单号格式错误，快递单号只能由字母和数字组成，且长度在9-50位之间！');
						return;
						} */
						if(kpno.length<9 || kpno.length>50){
						alert('快递单号格式错误，快递单号只能由字母和数字组成，且长度在9-50位之间！');
						return;
						}
							$.ajax({  
								type: "post",  
								cache: false,  
								url: "../rsBusinessInfo/kdAdd",  
								data: "id=" + $("#id").val() + "&kDate=" + $("#kDate").datetimebox('getValue') + "&kCompany=" + $("#kCompany").val() + "&kpno=" + $("#kpno").val(),  
								success: function (result) {  
								    if(result == 1){
										$.messager.alert('系统提示',"添加快递单号成功");
										$('#kddhAddInfo').dialog('close');
										$('#ywblGrid').datagrid('reload');  
									}else{
										$.messager.alert('系统提示',result);
									}
								}  
							}); 
						    //var val = $("#kdgs").textbox('getValue')//取值 
						    //$("#code").textbox('setValue','外星人')//赋值 
						}
					}, {
						text : '关闭',
						iconCls : 'icon-cancel',
						handler : function() {
							$('#kddhAddInfo').dialog('close');
						}
					} ],
					iconCls : 'icon-save',
					onLoad : function() {
						if(row.kDate == "" || null == row.kDate || 'null' == row.kDate){
					    	var myDate = getNowFormatDate();
					    	row.kDate = myDate;
						    //$("#fmAdd kDate").datetimebox("setValue",myDate);
						}
					    $("#fmAdd").form("load",row);
					    
					}
				});
		    }
		}
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
	    var currentdate = year + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	}

	function bj() {
		var rows = $("#ywblGrid").datagrid("getSelections"); 
		if(rows.length == 0){
			$.messager.alert('系统提示',"请选择要办结的业务信息！");
			return false;
		}else if(rows.length > 1){
			$.messager.alert('系统提示',"不能同时给多条记录办结！");
			return false;
		} else{
			var row = rows[0];
			var uid = row.uid;
			var sDirect = row.sDirect;
			if(row.sstate == '3'){
				$.messager.alert('系统提示',"该业务已办结!");
				return false;
			}else if(row.sstate != '1'){
				$.messager.alert('系统提示',"您选择的业务信息未通过审批!不可办结");
				return false;
			}
<%--			else if(row.kpno == ''){--%>
<%--				$.messager.alert('系统提示',"该业务快递单号为空!不可办结");--%>
<%--				return false;--%>
<%--			}--%>
<%--			else if(row.uid != sessionUserId && row.sDirect != 1){--%>
<%--				$.messager.alert('系统提示',"该业务只能由业务申请人自己办结");--%>
<%--				return false;--%>
<%--			}--%>
			else{
				$.ajax({  
					type: "post",  
					cache: false,  
					url: "../rsBusinessInfo/bjBusinessInfo",  
					data: "id=" + row.id,  
					success: function (result) {  
					    if(result == 1){
							$.messager.alert('系统提示',"该业务信息办结成功!");
							$('#ywblGrid').datagrid('reload');  
						}else{
							$.messager.alert('系统提示',result);
						}
					}  
				}); 
			}
		}
	}

	function query(){
		var param = {
			     "userNameSear":$("#userNameSear").val(),
			     "sstateSear":$("#sstateSear").combobox('getValue'),
			     "businessNameSear":$("#businessNameSear").val()
			    };
	    $("#ywblGrid").datagrid("load",param);
	}

	function loadList(){
		$('#ywblGrid').datagrid( {
			url : '../rsBusinessInfo/rsBusinessInfoList',
			border : true,
			pageSize : 20,
			pageList : [ 10, 20, 30, 40 ],
			striped : true,
			collapsible : true,
			fitColumns : true,
			height : wholeHeight,
			toolbar : '#yeblTool',
			sortName : '',
			sortOrder : 'desc',
			pagination : true,
			remoteSort : false,
			queryParams : {
			     sstateSear:"0"
			    },
			columns : [ [ {
				field : 'id',
				title : '选择',
				checkbox : true,
				align : 'center'
			}, {
				field : 'addDate',
				title : '发起时间',
				width : fixWidth(0.15),
				align : 'center'
			}, {
				field : 'pno',
				title : '受理单号',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'userName',
				title : '申请人',
				width : fixWidth(0.1),
				align : 'center'
			}, {
				field : 'typeName',
				title : '业务分类',
				width : fixWidth(0.1),
				align : 'center',
				formatter: function(value,row,index){
				    if(null == value || value == ''){
					    return '其他';
					}else{
						return value;
					}
		        }
			}, {
				field : 'businessName',
				title : '业务名称',
				width : fixWidth(0.1),
				align : 'center',
				formatter: function(value,row,index){
				    if(null == value || value == ''){
					    return '其他';
					}else{
						return value;
					}
		        }
			}, {
				field : 'sstate',
				title : '办理状态',
				width : fixWidth(0.1),
				align : 'center',
				formatter: function(value,row,index){
				    if(row.sstate == '1'){
					    return '已审核';
					}else if(row.sstate == '2'){
						return '审核失败';
					}else if(row.sstate == '3'){
						return '已办结';
					}else{
						return '待审核';
					}
		        }
			}, {
				field : 'sDirect',
				title : '材料递送方向',
				width : fixWidth(0.1),
				align : 'center',
				formatter: function(value,row,index){
				    if(row.sDirect == '1'){
					    return '回收';
					}else{
						return '寄出';
					}
		        }
			}, {
				field : 'kpno',
				title : '快递号',
				width : fixWidth(0.50),
				align : 'center',
				formatter: function(value,row,index){
				    if(value=='请录入快递单号'){
					    return '';
					}else{
						return value;
					}
			}
			}]]
		});
		var pager = $('#ywblGrid').datagrid('getPager');
		pager.pagination( {
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

</script>


<body style="margin: 1px;">
	<div id="tb">
		<table class="table2">
			<tr>
				<td width="10%" align="right">
					姓名:
				</td>
				<td width="10%" align="left">
					<input id="userNameSear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%" align="right">
					办理状态:
				</td>
				<td width="10%" align="left">
					<select id="sstateSear" class="easyui-combobox" style="width:150px;height: 22px">
					    <option value="">请选择</option>
						<option value="0" selected="selected">待审核</option>
						<option value="1">已审核</option>
						<option value="2">审核失败</option>
						<option value="3">已办结</option>
					</select>
				</td>
				<td width="10%" align="right">
					业务名称:
				</td>
				<td width="10%" align="left">
					<input id="businessNameSear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%">
					<a onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
				</td>
			</tr>
		</table>
	</div>
	<div >
		<div id="yeblTool"  style="background-color:#FFFFFF;">
			<a id="a" onclick="sh()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核</a>
			<a id="b" onclick="view()" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">查看</a>
			<a id="c" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
			<a id="d" onclick="addKd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加快递单号</a>
			<a id="e" onclick="bj()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">办结</a>
		</div>
	</div>
	<div>
	    <table id="ywblGrid"></table>  
	</div>
	<div id="shInfo"></div>
	<div id="viewInfo"></div>
	<div id="kddhAddInfo"></div>
</body>
</html>
