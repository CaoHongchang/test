<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<title>党员列表</title>

<script type="text/javascript">
var idsArray = new Array();
	$(function(){
		   $('#dyGrid').datagrid({    
			url:'/jtrc/userPartyInfoTrol/queryPartyUserList', 
		    border:true,
			pageSize:20,
			pageList:[10,20,30,40],
			striped:true,
			singleSelect:false,
			checkOnSelect:true,
			selectOnCheck:true,
			collapsible:true,
			fitColumns:true,
			height: wholeHeight,
			toolbar: '#dyTool',
			sortName: '',
			sortOrder: 'desc',
			pagination : true,
			remoteSort: false,  
			onBeforeLoad:function(data){
			addSelectedGoodsIdToArray();
			},
			onUncheck:function(rowIndex,rowData){
			if(idsArray.length == 0){
			}else{
			for(var index=0;index<idsArray.length;index++){
			if(idsArray[index] == rowData.id){
		
			removeArrayValue(idsArray,rowData.id);
			break;
			}
			}
			}
			},
			
			onLoadSuccess:function(data){
				var rowsData = data.rows;
				if(idsArray.length!=0){
				$.each(idsArray,function(i,e){
					for(var index=0;index<rowsData.length;index++){
						if(rowsData[index].id==e){
						  $('#dyGrid').datagrid('selectRow',index);
						}
					}
				});
				}
				},
			  
		    columns:[[    
		              {field:'id',title:'选择',checkbox:true,align:'center'},
		              {field:'pno',title:'党员编码',width:100,align:'center'}, 
		              {field:'pnum',title:'身份证',width:100,align:'center'},   
		              {field:'name',title:'姓名',width:100,align:'center'},    
		              {field:'sex',title:'性别',width:100,align:'center',
		    	    	formatter: function(value,row,index){
		    	    	 if(value==""){
                          return value;
                          }
		      	    	 else if(value == "0" || value == 0){
		      	    		return "女";
		          	      }else if(value=="1"||value==1){
		          	    	return "男";
		              	  }else{
		              		return value;
		              	  }
		   				}   
		 			  },    
		              {field:'is_state',title:'预/正',width:100,align:'center',
		    	    	formatter: function(value,row,index){

                          if(value==""){
                          return value;
                          }
		      	    	  else if(value == "0" || value == 0){
		      	    		return "预";
		          	      }else if(value=="1"||value==1){
		          	    	return "正";
		              	  }else{
		              		return value;
		              	  }
		   				}   
		 			  },
		              {field:'company',title:'工作单位',width:100,align:'center'},
		              {field:'is_in',title:'是否在中心',width:100,align:'center',
		    	    	formatter: function(value,row,index){
		      	    	  if(value==""){
                          return value;
                          }
		      	    	 else if(value == "0" || value == 0){
		      	    		return "否";
		          	      }else if(value=="1"||value==1){
		          	    	return "是";
		              	  }else{
		              		return value;
		              	  }
		   				}   
		 			  },
		              {field:'in_date',title:'转入时间',width:100,align:'center'},
		              {field:'out_date',title:'转出时间',width:100,align:'center'},
		              {title:'操作',field:'uid',width:100,align:'center',
		      	    		formatter: function(value,row,index){
		      				 return "<a href='javascript:viewFuc("+row.id+")' style='color: blue;'  >查看<a>"
		      				 		 +" <a href='javascript:editFuc("+row.id+")' style='color: blue;' >修改</a>"
				      				 +" <a href='javascript:delFuc("+row.id+")' style='color: blue;' >删除</a>";
		      				}   
		      			}
		    ]]    
		});  
		var pager = $('#dyGrid').datagrid('getPager');
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

 
function addSelectedGoodsIdToArray(){
var rows = $('#dyGrid').datagrid('getSelections');
if(rows.length>0){
$.each(rows,function(i,row){
if(idsArray.length == 0){
idsArray.push(row.id);
}else{
for(var index=0;index<idsArray.length;index++){
if(idsArray[index] == row.id){
break;
}
if(index == idsArray.length-1){
idsArray.push(row.id);
break;
}
}
}
});
}
}
function removeArrayValue(arr, val) {
for(var i=0; i<arr.length; i++) {
if(arr[i] == val) {
arr.splice(i, 1);
break;
}
}
}

/*党员新增*/
function addFuc(){
		var zrIndex = undefined;
		var zcIndex = undefined;
		
		$('#dyAddInfo').dialog({
	    title: '党员新增',
	    width: 850,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../rygl/dyAdd.jsp',
	    modal: true,
	    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				
				//zxl begin
				pno       =  $("#pno").textbox("getValue");//党员编码
				name      =  $("#name").textbox("getValue");//党员姓名
				pnum      =  $("#pnum").textbox("getValue");//身份证号码
				jg_name   =  $("#jg_name").textbox("getValue");//籍贯
				da_id     =  $("#da_id").textbox("getValue");//工作地
				company   =  $("#company").textbox("getValue");//工作单位
				party_date=  $("#party_date").textbox("getValue");//入党时间
				j_name1   =  $("#j_name1").textbox("getValue");//介绍人1
				j_name2   =  $("#j_name2").textbox("getValue");//介绍人2
				tel       =  $("#tel").textbox("getValue");//手机号
				qq        =  $("#qq").textbox("getValue");//qq号
				wx        =  $("#wx").textbox("getValue");//微信号
				
				
			if(pno==''){
			   $.messager.alert('系统提示','党员编码不能为空！');
		       return false;
			}
			if(pno.length>50){
			   $.messager.alert('系统提示','党员编码长度不能超过50！');
		       return false;
			}
			
			if(name==''){
			   $.messager.alert('系统提示','党员姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','党员姓名长度不能超过50！');
		       return false;
			}
			
			if(pnum==''){
			   $.messager.alert('系统提示','身份证号不能为空！');
		       return false;
			}
			if(!Card_Validation(pnum.trim())){
			   $.messager.alert('系统提示','身份证号格式错误！');
		       return false;
			}
			
			if(jg_name.length>50){
			   $.messager.alert('系统提示','籍贯长度不能超过50！');
		       return false;
			}
			
			if(company.length>50){
			   $.messager.alert('系统提示','工作单位长度不能超过50！');
		       return false;
			}
			
			if(da_id.length>50){
			   $.messager.alert('系统提示','工作地长度不能超过50！');
		       return false;
			}
			
			if(party_date==''){
			   $.messager.alert('系统提示','入党时间不能为空！');
		       return false;
			}
			
			if(j_name1.length>50){
			   $.messager.alert('系统提示','入党介绍人1长度不能超过50！');
		       return false;
			}
			if(j_name2.length>50){
			   $.messager.alert('系统提示','入党介绍人2长度不能超过50！');
		       return false;
			}
			if(tel!=''&&!Tel_Validation(tel)){
				$.messager.alert('系统提示','手机号码格式错误');
				return false;
			}
			
			if(qq.length>50){
			   $.messager.alert('系统提示','qq长度不能超过50！');
		       return false;
			}
			if(wx.length>50){
			   $.messager.alert('系统提示','微信号长度不能超过50！');
		       return false;
			}
			
				//zxl end
				
				
				
				
			    	accept();
			        acceptZc();
			        var zrRows = $('#zrxxdg').datagrid("getData").rows;
			        var zcRows = $('#zcxxdg').datagrid("getData").rows;
			        var zrInTimes = "";
			        var zrZpnos = "";
			        var zrInPlaces = "";
			        var zcInTimes = "";
			        var zcZpnos = "";
			        var zcInPlaces = "";
			        if(zrRows.length > 0){
			        	for(var i=0;i<zrRows.length;i++){
				        	if(zrInTimes == ""){
				        		zrInTimes = zrRows[i].in_date;
				        		zrZpnos = zrRows[i].zpno;
				        		zrInPlaces = zrRows[i].in_place;
					        }else{
					        	zrInTimes += "," + zrRows[i].in_date;
				        		zrZpnos += "," + zrRows[i].zpno;
				        		zrInPlaces += "," + zrRows[i].in_place;
						    }
					    }
				    }
			        if(zcRows.length > 0){
			        	for(var i=0;i<zcRows.length;i++){
				        	if(zcInTimes == ""){
				        		zcInTimes = zcRows[i].in_date;
				        		zcZpnos = zcRows[i].zpno;
				        		zcInPlaces = zcRows[i].in_place;
					        }else{
					        	zcInTimes += "," + zcRows[i].in_date;
				        		zcZpnos += "," + zcRows[i].zpno;
				        		zcInPlaces += "," + zcRows[i].in_place;
						    }
					    }
				    }
			    	var data=$('#fm').formSerialize() + "&zrInTimes=" + zrInTimes + "&zrZpnos=" + zrZpnos + "&zrInPlaces=" + zrInPlaces + "&zcInTimes=" + zcInTimes + "&zcZpnos=" + zcZpnos + "&zcInPlaces=" + zcInPlaces; 
		            $.ajax({  
						type: "post",  
						cache: false,  
						async: false, 
						url: "../userPartyInfoTrol/save",  
						data: data,  
						success: function (result) {  
						    if(result == 1){
							    alert("您已成功新增党员信息！");
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
				$('#dyAddInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () {
          //党员转出
<%--            $('#dyzcGrid').datagrid({--%>
<%--                url:'',--%>
<%--                title:'',--%>
<%--                border:true,--%>
<%--                striped: true,--%>
<%--                collapsible:false,--%>
<%--                fitColumns:true,--%>
<%--                height: 100,--%>
<%--                idField: 'zcsj',--%>
<%--                singleSelect: true,--%>
<%--                width:'100%',--%>
<%--                toolbar:--%>
<%--                        [--%>
<%--                         { text: '增加', iconCls: 'icon-add', handler: function () {--%>
<%--                                if (zcEditing()){--%>
<%--                                    $('#dyzcGrid').datagrid('appendRow',{status:'P'});--%>
<%--                                    zcIndex = $('#dyzcGrid').datagrid('getRows').length-1;--%>
<%--                                    $('#dyzcGrid').datagrid('selectRow', zcIndex)--%>
<%--                                            .datagrid('beginEdit', zcIndex);--%>
<%--                                }--%>
<%--			                  }--%>
<%--			              },--%>
<%--                        {--%>
<%--                            text: '删除', iconCls: 'icon-remove', handler: function () {--%>
<%--                                        if (zcEditing()){--%>
<%--                                            $('#dyzcGrid').datagrid('appendRow',{status:'P'});--%>
<%--                                            zcIndex = $('#dyzcGrid').datagrid('getRows').length-1;--%>
<%--                                            $('#dyzcGrid').datagrid('selectRow', zcIndex)--%>
<%--                                                    .datagrid('beginEdit', zcIndex);--%>
<%--                                        }--%>
<%--                            }--%>
<%--                        }--%>
<%--                  ],--%>
<%----%>
<%--                onClickRow:function(rowIndex,rowData){--%>
<%--                    if (editIndex != rowIndex){--%>
<%--                        if (endEditing()){--%>
<%--                            $('#dyzcGrid').datagrid('selectRow', rowIndex)--%>
<%--                                    .datagrid('beginEdit', rowIndex);--%>
<%--                            editIndex = rowIndex;--%>
<%--                        } else {--%>
<%--                            $('#dyzcGrid').datagrid('selectRow', editIndex);--%>
<%--                        }--%>
<%--                    }--%>
<%----%>
<%--                },--%>
<%--                sortName: '',--%>
<%--                sortOrder: 'desc',--%>
<%--                remoteSort: false,--%>
<%--                columns:[[--%>
<%--                    {field:'in_date',title:'转出时间',width:"30%",editor: { type: 'text', options: { required: true }}},--%>
<%--                    {field:'zpno',title:'组织介绍信编码',width:"40%",editor: { type: 'text', options: { required: true }}},--%>
<%--                    {field:'in_place',title:'转出地',width:"30%",editor: { type: 'text', options: { required: true }}}--%>
<%--                ]]--%>
<%--            });--%>
	    }  
	});

		function zrEditing(){
	        if (zrIndex == undefined){return true}
	        if ($('#dyzrGrid').datagrid('validateRow', zrIndex)){
	        	zrIndex = undefined;
	            return true;
	        } else {
	            return false;
	        }
	    }
		function zcEditing(){
	        if (zcIndex == undefined){return true}
	        if ($('#dyzcGrid').datagrid('validateRow', zcIndex)){
	        	zcIndex = undefined;
	            return true;
	        } else {
	            return false;
	        }
	    }
}


function editFuc(id){
	var rows = $("#dyGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
	$('#dyEditInfo').dialog({
	    title: '党员修改',
	    width: 850,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../rygl/dyEdit.jsp',
	    modal: true,
	    buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				//zxl begin
				pno       =  $("#pno").textbox("getValue");//党员编码
				name      =  $("#name").textbox("getValue");//党员姓名
				pnum      =  $("#pnum").textbox("getValue");//身份证号码
				jg_name   =  $("#jg_name").textbox("getValue");//籍贯
				da_id     =  $("#da_id").textbox("getValue");//工作地
				company   =  $("#company").textbox("getValue");//工作单位
				party_date=  $("#party_date").textbox("getValue");//入党时间
				j_name1   =  $("#j_name1").textbox("getValue");//介绍人1
				j_name2   =  $("#j_name2").textbox("getValue");//介绍人2
				tel       =  $("#tel").textbox("getValue");//手机号
				qq        =  $("#qq").textbox("getValue");//qq号
				wx        =  $("#wx").textbox("getValue");//微信号
				
				
			if(pno==''){
			   $.messager.alert('系统提示','党员编码不能为空！');
		       return false;
			}
			if(pno.length>50){
			   $.messager.alert('系统提示','党员编码长度不能超过50！');
		       return false;
			}
			
			if(name==''){
			   $.messager.alert('系统提示','党员姓名不能为空！');
		       return false;
			}
			if(name.length>50){
			   $.messager.alert('系统提示','党员姓名长度不能超过50！');
		       return false;
			}
			
			if(pnum==''){
			   $.messager.alert('系统提示','身份证号不能为空！');
		       return false;
			}
			if(!Card_Validation(pnum)){
			   $.messager.alert('系统提示','身份证号格式错误！');
		       return false;
			}
			
			if(jg_name.length>50){
			   $.messager.alert('系统提示','籍贯长度不能超过50！');
		       return false;
			}
			
			if(company.length>50){
			   $.messager.alert('系统提示','工作单位长度不能超过50！');
		       return false;
			}
			
			if(da_id.length>50){
			   $.messager.alert('系统提示','工作地长度不能超过50！');
		       return false;
			}
			
			if(party_date==''){
			   $.messager.alert('系统提示','入党时间不能为空！');
		       return false;
			}
			
			if(j_name1.length>50){
			   $.messager.alert('系统提示','入党介绍人1长度不能超过50！');
		       return false;
			}
			if(j_name2.length>50){
			   $.messager.alert('系统提示','入党介绍人2长度不能超过50！');
		       return false;
			}
			if(tel!=''&&!Tel_Validation(tel)){
				$.messager.alert('系统提示','手机号码格式错误');
				return false;
			}
			
			if(qq.length>50){
			   $.messager.alert('系统提示','qq长度不能超过50！');
		       return false;
			}
			if(wx.length>50){
			   $.messager.alert('系统提示','微信长度不能超过50！');
		       return false;
			}
			
				//zxl end
	    	        accept();
	    	        acceptZc();
			    	var zrRows = $('#zrxxdgEdit').datagrid("getData").rows;
			        var zcRows = $('#zcxxdgEdit').datagrid("getData").rows;
			        var zrInTimes = "";
			        var zrZpnos = "";
			        var zrInPlaces = "";
			        var zcInTimes = "";
			        var zcZpnos = "";
			        var zcInPlaces = "";
			        if(zrRows.length > 0){
			        	for(var i=0;i<zrRows.length;i++){
				        	if(zrInTimes == ""){
				        		zrInTimes = zrRows[i].in_date;
				        		zrZpnos = zrRows[i].zpno;
				        		zrInPlaces = zrRows[i].in_place;
					        }else{
					        	zrInTimes += "," + zrRows[i].in_date;
				        		zrZpnos += "," + zrRows[i].zpno;
				        		zrInPlaces += "," + zrRows[i].in_place;
						    }
					    }
				    }
			        if(zcRows.length > 0){
			        	for(var i=0;i<zcRows.length;i++){
				        	if(zcInTimes == ""){
				        		zcInTimes = zcRows[i].in_date;
				        		zcZpnos = zcRows[i].zpno;
				        		zcInPlaces = zcRows[i].in_place;
					        }else{
					        	zcInTimes += "," + zcRows[i].in_date;
				        		zcZpnos += "," + zcRows[i].zpno;
				        		zcInPlaces += "," + zcRows[i].in_place;
						    }
					    }
				    }
				    
			    	var data=$('#fmEdit').formSerialize() + "&zrInTimes=" + zrInTimes + "&zrZpnos=" + zrZpnos + "&zrInPlaces=" + zrInPlaces + "&zcInTimes=" + zcInTimes + "&zcZpnos=" + zcZpnos + "&zcInPlaces=" + zcInPlaces; 
		            $.ajax({  
						type: "post",  
						cache: false,  
						url: "../userPartyInfoTrol/update",  
						data: data,  
						success: function (result) {  
						    if(result == 1){
							    alert("您已成功修改党员信息！");
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
				$('#dyEditInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () {
		    $("#fmEdit").form("clear"); 
		    $("#fmEdit").form("load",row);
		    var dg = $('#zrxxdgEdit').datagrid( {
				url    :'../userPartyInfoTrol/queryPartyInListByParty?party=' + row.id,
				border : true,
				rownumbers:true,
				singleSelect:true,
				striped : true,
				collapsible : true,
				fitColumns : true,
				fit: false, 
				sortName : '',
				sortOrder : 'desc',
				onDblClickRow: onDblClickRow,
				method: 'get',
				remoteSort : false,
				iconCls: 'icon-edit',
				columns:[[    
		            {field:'in_date',name:'code1',title:'转入时间',width:$(this).width() * 0.01,  editor:{type: 'datebox'}},         
		            {field:'zpno',name:'name1',title:'组织介绍信编码',width:$(this).width() * 0.01,  editor:{type: 'textbox'}},    
		            {field:'in_place',name:'name2',title:'转入地',width:$(this).width() * 0.01,  editor:{type: 'textbox'}}
		        ]]
			});
			var dg = $('#zcxxdgEdit').datagrid( {
				url    :'../userPartyInfoTrol/queryPartyOutListByParty?party=' + row.id,
				border : true,
				rownumbers:true,
				singleSelect:true,
				striped : true,
				collapsible : true,
				fitColumns : true,
				fit: false, 
				sortName : '',
				sortOrder : 'desc',
				onDblClickRow: onDblClickRowZc,
				method: 'get',
				remoteSort : false,
				iconCls: 'icon-edit',
				columns:[[    
		            {field:'in_date',name:'code1',title:'转出时间',width:$(this).width() * 0.01,  editor:{type: 'datebox'}},    
		            {field:'zpno',name:'name1',title:'组织介绍信编码',width:$(this).width() * 0.01,  editor:{type: 'textbox'}},    
		            {field:'in_place',name:'name2',title:'转出地',width:$(this).width() * 0.01,  editor:{type: 'textbox'}}
		        ]]
			});
	    }  
	 });
}

//日期转Str
function toYYYYMMMDD(date) {
	var d = new Date(date.getTime());
	var dd = d.getDate() < 10 ? "0" + d.getDate() : d.getDate().toString();
	var mmm = d.getMonth() + 1 < 10 ? "0" + (d.getMonth() + 1) : (d.getMonth() + 1);
	var yyyy = d.getFullYear().toString(); //2011
		//var YY = YYYY.substr(2);   // 11
	return yyyy + "-" + mmm + "-" + dd;
}

function viewFuc(id){
	var rows = $("#dyGrid").datagrid('getData').rows;
    var length = rows.length;
    var row;
    for (var i = 0; i < length; i++) {
        if (rows[i].id == id) {
            row = rows[i];
            break;
        }
    }
	$('#dyViewInfo').dialog({
	    title: '党员查看',
	    width: 850,
	    height: 450,
	   
	    closed: false,
	    cache: false,
	    href: '../rygl/dyView.jsp',
	    modal: true,
	    buttons:[{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#dyViewInfo').dialog('close');
				}
			}],
	    iconCls: 'icon-save',
	    onLoad: function () {
			$("#fmView").form("clear"); 
		    $("#fmView").form("load",row);
		    var dg = $('#zrxxdgView').datagrid( {
				url    :'../userPartyInfoTrol/queryPartyInListByParty?party=' + row.id,
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
		            {field:'in_date',name:'code1',title:'转入时间',width:$(this).width() * 0.01,  editor:{type: 'datebox'}},         
		            {field:'zpno',name:'name1',title:'组织介绍信编码',width:$(this).width() * 0.01,  editor:{type: 'textbox'}},    
		            {field:'in_place',name:'name2',title:'转入地',width:$(this).width() * 0.01,  editor:{type: 'textbox'}}
		        ]]
			});
			var dg = $('#zcxxdgView').datagrid( {
				url    :'../userPartyInfoTrol/queryPartyOutListByParty?party=' + row.id,
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
		            {field:'in_date',name:'code1',title:'转出时间',width:$(this).width() * 0.01,  editor:{type: 'datebox'}},    
		            {field:'zpno',name:'name1',title:'组织介绍信编码',width:$(this).width() * 0.01,  editor:{type: 'textbox'}},    
		            {field:'in_place',name:'name2',title:'转出地',width:$(this).width() * 0.01,  editor:{type: 'textbox'}}
		        ]]
			});
	    }  
	 });
}

/*删除*/
function delFuc(id){
	var ids = "";
	if('' != id){
		ids = id;
	}else{
		ids = getSelectRowId();
    }
    if(ids != ""){
    	if(confirm("确认删除此数据吗？")){
           	$.ajax({  
           		type: "post",  
           		cache: false,  
           		url: "../userPartyInfoTrol/del?ids=" + ids,  
           		data: '',  
           		success: function (result) {  
           		    if(result == 1){
           			    alert("您已成功删除党员信息！");
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
         else {
         }
	 }else{
		 $.messager.alert('系统提示',"请选择要删除的数据");
     }
}

function getSelectRowId(){
	//var rows = idsArray;//$('#dyGrid').datagrid('getSelections');  
	var ids = "";
	//if (rows.length>0) {  
		//for(var i=0; i<rows.length; i++){
		//	if(ids == ""){
    	//		ids = rows[i].id;
    	//	}else{
    	//		ids += "," + rows[i].id;
        //	}
		//}
	//}
	addSelectedGoodsIdToArray();
	//alert(idsArray.length);
	for(var index=0;index<idsArray.length;index++){
		if(ids == ""){
		
		 	ids = idsArray[index];
		}else{
    			ids += "," + idsArray[index];
       	}
	}
	return ids;
}

 

/*导入党员信息*/
function fileImport(type){
	$('#dyImportInfo').dialog({
    title: '选择文件',
    width: 350,
    height: 150,
    
    closed: false,
    cache: false,
    href: '../rygl/fileImport.jsp',
    modal: true,
     buttons:[{
			text:'上传',
			iconCls:'icon-ok',
			handler:function(){
    	 		uploadExcel(type);
			}
		},{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#dyImportInfo').dialog('close');
			}
		}],
    iconCls: 'icon-save',
    onLoad: function () { 
    }  
});
}

var dataFlag;
var tipMsg;
function uploadExcel(type){     
    //得到上传文件的全路径  
    var fileName= $('#uploadExcel').filebox('getValue');  
    if(fileName !=""){
        var url = "<%=request.getContextPath()%>/userPartyInfoTrol/importExcel?type="+type;   
            //进行基本校验  
            if(fileName==""){     
               $.messager.alert('提示','请选择上传文件！','info');   
            }else{  
                //对文件格式进行校验  
                var d1=/\.[^\.]+$/.exec(fileName);   
                if(d1==".xlsx" || d1==".xls"){  
                     $("#questionTypesManage").form("submit", {
 			        	async: false,
 			            url: url,
 			            method: 'post',             
 			            onSubmit: function () {
 			                return $(this).form("validate");
 			            },
 			            success: function (data) {
 				            var resObj = eval("("+data+")");
 				            dataFlag = resObj.flag;
 				            tipMsg = resObj.cause; 
		            		$('#dyImportInfo').dialog('close');
		            		showImportdyFuc(resObj.rows,type); 
 			            }
 			        });       
               }else{  
                   $.messager.alert('提示','请选择xlsx/xls格式文件！','info');   
                   $('#uploadExcel').filebox('setValue','');   
               }  
            }    
     }else{    
    	 $.messager.alert('提示','请选择上传文件！','info'); 
     }  

 }

/*展示导入的党员信息*/
function showImportdyFuc(dates,type){

	var title = "党员导入";
	var columns = [[    
	            			{field:'name',title:'姓  名',width: $(this).width() *0.1 ,align:'center'},
	            			{field:'pnum',title:'身份证',width: $(this).width() *0.1,align:'center'},
	            			{field:'sex',title:'性别',width: $(this).width() *0.1,align:'center'},
	            			{field:'jgName',title:'籍贯',width: $(this).width() *0.1,align:'center'},
	            			{field:'birthDate',title:'出生年月',width: $(this).width() *0.1,align:'center'},
	            			{field:'degree',title:'学历',width: $(this).width() *0.1,align:'center'},
	            			{field:'daId',title:'工作地',width: $(this).width() *0.1},
	            			{field:'company',title:'工作单位',width: $(this).width() *0.1},
	            			{field:'isState',title:'预正',width: $(this).width() *0.1},
	            			{field:'partyDate',title:'入党时间',width: $(this).width() *0.1},
	            			{field:'fullDate',title:'转正时间',width: $(this).width() *0.1},
	            			{field:'rdName1',title:'入党介绍人1',width: $(this).width() *0.1},
	            			{field:'rdName2',title:'入党介绍人2',width: $(this).width() *0.1},
	            			{field:'tel',title:'手机号码',width: $(this).width() *0.1},
	            			{field:'qq',title:'QQ号',width: $(this).width() *0.1},
	            			{field:'wx',title:'微信号',width: $(this).width() *0.1},
	            			{field:'sqStatus',title:'入党申请书',width: $(this).width() *0.1},
	            			{field:'rdStatus',title:'入党志愿书',width: $(this).width() *0.1},
	            			{field:'zzMtr',title:'政治审查材料',width: $(this).width() *0.1},
	            			{field:'pyMtr',title:'培养教育考察材料',width: $(this).width() *0.1},
	            			{field:'fullRq',title:'转正申请书',width: $(this).width() *0.1},
	            			{field:'remark',title:'备注',width: $(this).width() *0.1},
	            			{field:'hisDate',title:'历史党费缴至',width: $(this).width() *0.1},
	            			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
	                    ]]    ;
    if("in" == type){
        title = "转入时间导入";
        columns = [[    
        			{field:'pnum',title:'身份证',width: $(this).width() *0.2 ,align:'center'},
        			{field:'inDate',title:'转入时间',width: $(this).width() *0.1,align:'center'},
        			{field:'zpno',title:'组织介绍信编码',width: $(this).width() *0.1,align:'center'},
        			{field:'inPlace',title:'转入地',width: $(this).width() *0.2,align:'center'},
        			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
                ]]    ;
    }else if("out" == type){
    	title = "转出时间导入";
    	columns = [[    
        			{field:'pnum',title:'身份证',width: $(this).width() *0.2 ,align:'center'},
        			{field:'outDate',title:'转出时间',width: $(this).width() *0.1,align:'center'},
        			{field:'zpno',title:'组织介绍信编码',width: $(this).width() *0.1,align:'center'},
        			{field:'outPlace',title:'转出地',width: $(this).width() *0.2,align:'center'},
        			{field:'errMsg',nowarp:false,title:'错误信息',width: $(this).width() *0.4}
                ]]    ;
    }
	
	$('#showImportDyInfo').dialog({
    title: title,
    width: 950,
    height: 450,
    closed: false,
    cache: false,
    href: '../rygl/dyxxImport.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
			       if("in" == type){
				       saveDyIn(dates);
				   }else if("out" == type){
					   saveDyOut(dates);
				   }else{
					   saveDy(dates);
				   }
				 //$('#showImportDyInfo').dialog('close');
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#showImportDyInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    $('#dyImportGrid').datagrid({    
	    url:'', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		height: 360,
		nowarp:false,
		toolbar: '',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,    
	    columns:columns
     });  
    $('#dyImportGrid').datagrid('loadData',dates);
    } //loadEnd
});
}

function saveDyIn(dates){
	
	if(dates==undefined){
		$.messager.alert('提示','不能保存空数据！','info');
		return;
   }
	if(dataFlag != true){
       $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
       return;
    }
	$.blockUI();
    $.ajax({
         url: "../userPartyInfoTrol/saveDyIn",
         type: "POST",
         contentType : "application/json;charset=utf-8", 
         data: JSON.stringify(dates),
         async: true,
         success: function(data){
	         $.unblockUI();
	         alert(data);
	         $('#showImportDyInfo').dialog('close');
	         query();
         },
         error: function(data){
             $.unblockUI();
             alert(data);
         }
    });
}

function saveDyOut(dates){
	if(dates==undefined){
		$.messager.alert('提示','不能保存空数据！','info');
		return;
   }
	if(dataFlag != true){
       $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
       return;
    }
	$.blockUI();
    $.ajax({
         url: "../userPartyInfoTrol/saveDyOut",
         type: "POST",
         contentType : "application/json;charset=utf-8", 
         data: JSON.stringify(dates),
         async: true,
         success: function(data){
	         $.unblockUI();
	         alert(data);
	         $('#showImportDyInfo').dialog('close');
	         query();
         },
         error: function(data){
             $.unblockUI();
             alert(data);
         }
    });
}

//党员保存
function saveDy(dates){
	if(dates==undefined){
		$.messager.alert('提示','不能保存空数据！','info');
		return;
   }
   if(dataFlag != true){
     $.messager.alert('错误','保存失败,请核查数据中错误提示 ','error');
     return;
   }
   if(tipMsg != "" && null != tipMsg){
	   if(confirm(tipMsg + "!确认覆盖更新吗？")){
		   $.blockUI();
		    $.ajax({
		         url: "../userPartyInfoTrol/saveDy",
		         type: "POST",
		         contentType : "application/json;charset=utf-8", 
		         data: JSON.stringify(dates),
		         async: true,
		         success: function(data){
			         $.unblockUI();
			         alert(data);
			         $('#showImportDyInfo').dialog('close');
			         query();
		         },
		         error: function(data){
		             $.unblockUI();
		             alert(data);
		         }
		    });
	   }else{
		   return ;
	   }
   }else{
	   $.blockUI();
	    $.ajax({
	         url: "../userPartyInfoTrol/saveDy",
	         type: "POST",
	         contentType : "application/json;charset=utf-8", 
	         data: JSON.stringify(dates),
	         async: true,
	         success: function(data){
		         $.unblockUI();
		         alert(data);
		         $('#showImportDyInfo').dialog('close');
		         query();
	         },
	         error: function(data){
	             $.unblockUI();
	             alert(data);
	         }
	    });
   }
}


/*导出模板*/
function exportFuc(){
	var ids = getSelectRowId();
	/*if(ids == ''){
		$.messager.alert('系统提示','请选党员要导出的数据！');
		return;
	}*/
<%--	if(selectedRows.length > 1){--%>
<%--		$.messager.alert('系统提示','导出操作只能针对一条记录！');--%>
<%--		return;--%>
<%--	}--%>
	var url= "<%=request.getContextPath()%>/userPartyInfoTrol/exportDataInfo?ids="+ids;
	window.location.href= url;
}

/*导出模板*/
function exportModelFuc(){
	$('#dyExportModelInfo').dialog({
        title: '模板导出',
        width: 400,
        height: 250,
        closed: false,
        cache: false,
        href: '../rygl/dymbExport.jsp',
	    modal: true,
	     buttons:[{
					text:'导出',
					iconCls:'icon-ok',
					handler:function(){
	    	            var data=$('#fmExport').formSerialize()
					    var url= "<%=request.getContextPath()%>/userPartyInfoTrol/exportModel?"+data;
						window.location.href= url; 
						$('#dyExportModelInfo').dialog('close');
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
					$('#dyExportModelInfo').dialog('close');
					}
				}],
	    iconCls: 'icon-save'
	});
	}

    function query(){
    	var param = {
			     "pnoSear":$("#pnoSear").val(),
			     "pnumSear":$("#pnumSear").val(),
			     "nameSear":$("#nameSear").val(),
			     "sexSear":$("#sexSear").combobox('getValue'),
			     "isStateSear":$("#isStateSear").combobox('getValue'),
			     "isInSear":$("#isInSear").combobox('getValue'),
			     "companySear":$("#companySear").val()
			    };
	    $("#dyGrid").datagrid("load",param);
    }


/*
 * 身份证号
 */
function Card_Validation(card){
	var re = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	return re.test(card);
}
	/*
 * 手机验证  （11位数字，且1开头）
 */
function Tel_Validation(tel){
	var re =/^1[3|4|7|8|5]\d{9}$/;
	return re.test(tel);
}
</script>


<body style="margin: 1px;">
    <div id="tb">
		<table class="table2">
			<tr>
				<td width="10%" align="right">
					党员编号:
				</td>
				<td width="10%" align="left">
					<input id="pnoSear" name="pnoSear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%" align="right">
					身份证:
				</td>
				<td width="10%" align="left">
				    <input id="pnumSear" name="pnumSear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%" align="right">
					姓名:
				</td>
				<td width="10%" align="left">
					<input id="nameSear" name="nameSear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%" align="right">
					性别:
				</td>
				<td width="10%" align="left">
				    <select id="sexSear" name="sexSear" class="easyui-combobox" style="width:150px;height: 22px">
					    <option value="">请选择</option>
						<option value="0">女</option>
						<option value="1">男</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="10%" align="right">
					预/正:
				</td>
				<td width="10%" align="left">
				     <select id="isStateSear" name="isStateSear" class="easyui-combobox" style="width:150px;height: 22px">
					    <option value="">请选择</option>
						<option value="0">预</option>
						<option value="1">正</option>
					</select>
				</td>
				<td width="10%" align="right">
					工作单位:
				</td>
				<td width="10%" align="left">
					<input id="companySear" name="companySear" class="easyui-textbox" size="20" style="height: 22px">
				</td>
				<td width="10%" align="right">
					是否在中心:
				</td>
				<td width="10%" align="left">
					<select id="isInSear" name="isInSear" class="easyui-combobox" style="width:150px;height: 22px">
					    <option value="">请选择</option>
						<option value="0">否</option>
						<option value="1" >是</option>
					</select>
				</td>
				<td width="10%">
					<a onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
				</td>
			</tr>
		</table>
	</div>
<div id="tb">
	<div id="dyTool"  style="background-color:#FFFFFF;">
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a href="javascript:delFuc('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a>
		<a onclick="fileImport('dy')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导入党员基本信息</a>
		<a onclick="fileImport('in')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导入转入信息</a>
		<a onclick="fileImport('out')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导入转出信息</a>
		<a onclick="exportModelFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导出模板</a>
		<a onclick="exportFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">导出EXCEL</a>
		
	</div>

</div>
<div>
<table id="dyGrid"></table>  
</div>
<div id="dyAddInfo" align="center"></div>
<div id="dyViewInfo" align="center"></div>
<div id="dyEditInfo" align="center"></div>
<div id="dyImportInfo" align="center"></div>
<div id="showImportDyInfo" align="center"></div>
<div id="dyExportModelInfo" align="center"></div>
</body>
</html>
