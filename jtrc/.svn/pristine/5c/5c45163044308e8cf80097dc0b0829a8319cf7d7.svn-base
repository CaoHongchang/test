<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>人员采集信息审核</title>

<script type="text/javascript">
	$(function(){
   
     $('#cjxxGrid').datagrid({    
	    url:'/jtrc/personInfo/queryPersonList', 
		border:true,
		pageSize:20,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		pagination : true,
		singleSelect: true,
		selectOnCheck: true,
		checkOnSelect: true,
		height: wholeHeight,
		toolbar: '#cjxxTool',
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false,   
        columns:[[    
              {field:'id',title:'',checkbox:true,width:100,align:'center'},
              {field:'person_name',title:'姓名',width:100,align:'center'},    
              {field:'identity_number',title:'身份证号',width:100,align:'center'},    
              {field:'sex',title:'性别',width:100,align:'center'},
              {field:'name',title:'单位名称',width:100,align:'center'},    
              {field:'telephone',title:'联系电话',width:100,align:'center'},
              {field:'status',title:'审核状态',width:100,align:'center',
 				  formatter:function(value,row,index){if(value=='0')return '待审核';else if(value=='1') return '审核通过'; else if(value=='2') return '审核不通过';else return "采集中";}},
              {title:'操作',field:'uid',width:100,align:'center',
      	    		formatter: function(value,row,index){
      				 return " <a href='#' style='color: blue;' onclick='lookDet("+row.id+");'>查看</a>"
		      				 +" <a href='#' style='color: blue;' onclick='checkFuc("+row.id+","+row.status+");'>审核</a>";
      				}   
      			}
		    ]]    
		});  
		var pager = $('#cjxxGrid').datagrid('getPager');
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

	//查看 
	function lookDet(id){
		 $('#ryxxDetInfo').dialog({
		        title: '查看信息',
		        width: 850,
		        height: 'auto',
		        closed: false,
		        cache: false,
		        top:'20%',
		        href: '../rygl/rycjxxDetail.jsp?pid='+id,
		        modal: true,
		        buttons:[ {
		            text:'关闭',
		            iconCls:'icon-cancel',
		            handler:function(){
		                $('#ryxxDetInfo').dialog('close');
		            }
		        }],
		        iconCls: 'icon-save' 
		    }) 
	}
	
	//审核
	function checkFuc(id,status){debugger
		
			if(status=='0'){
		          $('#ryxxCheckInfo').dialog({
		              title: '人员采集信息审核',
		              width: 900,
		              height: 'auto',
		              closed: false,
		              cache: false,
		              top:'20%',
		              href: '../rygl/rycjxxCheck.jsp?pid='+id,
		              modal: true,
		              buttons:[{
		                  text:'审核',
		                  iconCls:'icon-ok',
		                  handler:function(){
		                	  var content = $("#checkRemark").val();
		                	  if(content.length>200){
		                			alert('审核意见不能超过200位');
		                			return ;
		                	  }
		                      var result = $("#checkBmbFm").form("validate");
		                      if(result){
									$.messager.confirm('确定审核','您确定要审核该人员吗？',function(flag){
										if(flag){
											$("#checkBmbFm").form("submit",{
												url:'../personInfo/checkPersonInfo',
												type:'post',
												queryParams:{
													id:id,
													checkUserId:$('#checkUserId').val()
												},success:function(result){
												if(result==1){
												$('#ryxxCheckInfo').dialog('close');
												$.messager.alert('系统提示','人员信息审核成功！');
												$('#cjxxGrid').datagrid('reload');
											     }else{
												$.messager.alert('系统提示',result);
											    }
												}
											});
										}
									});    
		                      }
		                  }
		              }],
		              iconCls: 'icon-save',
						onLoad:function(){
							$('#status').combobox('setValue','1');
				  			$('#checkUser').textbox('setValue','<%=(String)request.getSession().getAttribute("realName")%>');
				  			$('#checkUserId').val('<%=(String)request.getSession().getAttribute("uid")%>');
						}

		          });
			}else{
				$.messager.alert('系统提示','当前状态无法审核！');
			}
	} 

	function searchUser(){

		var key = $("#key").val();
		if(key == "输入姓名或身份证号"){
			key = "";
	    }
		var param = {
			     "is_state":$("#selectCheck").combobox("getValue"),
			     "key":key
			    };
	    $("#cjxxGrid").datagrid("reload",param);
    }
</script>

</head>
<body style="margin: 1px;">
 

<div id="tb">
	<div id="cjxxTool"  style="background-color:#FFFFFF;">
	 <div>
	    <select id="selectCheck" name="selectCheck" class="easyui-combobox" style="width:160px" data-options="editable:false,panelHeight:null" />
				  <option value="3">所有</option>
				  <option value="9">采集中</option>
				  <option value="0">待审核</option>
			      <option value="1">审核通过</option>
				  <option value="2">审核不通过</option>
			   </select>
	    <input type="text"  class="easyui-textbox"  
	        name="key" id="key" value="输入姓名或身份证号"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
	</div>
</div>
<div>
<table id="cjxxGrid"></table>  
</div>
<div id="ryxxDetInfo" align="center"></div>
<div id="ryxxCheckInfo" align="center"></div>
</body>
</html>
