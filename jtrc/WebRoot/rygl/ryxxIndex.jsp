<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>人员信息</title>

<script type="text/javascript">
	$(function(){
   
  init();
});
function init(){

 $('#ryxxGrid').datagrid({    
    url:'<%=request.getContextPath()%>/userInfoTrol/queryUserList',
  border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		height: wholeHeight,
		toolbar: '#ryxxTool',
		sortName: '',
		sortOrder: 'desc',
		pagination : true,
		remoteSort: false,   
    columns:[[     
              {field:'ID',title:'',checkbox:true,width:100,align:'center'},
              {field:'MSG_NAME',title:'最初信息来源',width:100,align:'center'},    
              {field:'NAME',title:'姓名',width:100,align:'center'},    
              {field:'PNUM',title:'身份证号',width:100,align:'center'},
              {field:'SEX',title:'性别',width:100,align:'center',
	                formatter: function(value,row,index){
	      	    	  if(value==0){
	      	    		return "女";
	          	      }else if(value==1){
	          	    	return "男";
	              	  }else{
	              	  return value;
	              	  }
	   				}  
	   				},    
              {field:'DY',title:'是否党员',width:100,align:'center'},
              {field:'ZJ',title:'是否专家',width:100,align:'center'},    
          /*    {field:'IS_STATE',title:'审核状态',width:100,align:'center',
            	  formatter: function(value,row,index){
                  if (value == '0') {
                	  return "待审核";
     				}else if (value == '1') {
                	  return "审核成功";
     				}else if (value == '2') {
                	  return "审核失败";
     				}else{
     					return "未知";
     				}
     			}},
              {field:'SMSG',title:'审核说明',width:100,align:'center'},
              */
              {title:'操作',field:'uid',width:150,align:'center',
      	    		formatter: function(value,row,index){
      				 return " <a href='#' style='color: blue;' onclick='lookDet("+row.ID+");'>查看</a>"
		      				 +" <a href='#' style='color: blue;' onclick='editFuc("+row.ID+");' >修改<a>"
		      				 +" <a href='#' style='color: blue;' onclick='delFuc("+row.ID+");'>删除</a>"
		      				 +" <a href='#' style='color: blue;' onclick=\"rePasFuc("+row.ID+",'"+row.PNUM+"');\">重置密码</a>"
		      	//			 +" <a href='#' style='color: blue;' onclick='checkFuc("+row.ID+","+row.IS_STATE+");'>审核</a>";
      				}   
      			}
    ]]    
});  
	var pager = $('#ryxxGrid').datagrid('getPager');
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
 
//查看 
function lookDet(id){
	try{
		$('#ryxxAddFm').form('clear');
		$('#ryxxAddInfo').dialog('clear');
		$('#ryxxEditInfo').dialog('clear');
		$('#ryxxCheckInfo').dialog('clear');
	}catch(e){
	}
    $('#ryxxCheckInfo').dialog({
        title: '人员资料查看',
        width: 650,
        height: 380,
        closed: false,
        cache: false,
        href: '../rygl/ryxxCheck.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
        	saveRyAdd();
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#ryxxCheckInfo').dialog('close');
                $('#ryxxCheckInfo').dialog('clear');
            }
        }],
        onLoad:function(){
        $.ajax( {  
           type : "POST",  
           dataType: "json",
           url : "../userInfoTrol/getUser",  
           data : {id:id},  
           success : function(data){debugger;
           		$("#name").textbox('setValue',data.name);
           		$("#pnum").textbox('setValue',data.pnum);
           		if(data.sex=='男')
           			$(":radio[name='sex'][value='1']").prop("checked", "checked");
           		else if(data.sex=='女')
           			$(":radio[name='sex'][value='0']").prop("checked", "checked");
           		else
           			$(":radio[name='sex'][value='"+data.sex+"']").prop("checked", "checked");
           		$("#birth_date").textbox("setValue", data.birth_date);
           		$("#tel").textbox('setValue',data.tel);
           		$("#mz").combobox('setValue',data.mz);
           		$("#zzmm").combobox('setValue',data.zzmm);
           		$("#school").textbox('setValue',data.school);
           		$("#graduation_time").textbox('setValue',data.graduation_time);
           		$("#major").textbox('setValue',data.major);
           		$("#degree").textbox('setValue',data.degree);
           		$("#adr").textbox('setValue',data.adr);
           		$("#email").textbox('setValue',data.email);
           		$("#qq").textbox('setValue',data.qq);
           		$("#wx").textbox('setValue',data.wx);
           		$("#id").val(id);
            }  
      });  
        }
    })
}
/*选项新增*/
function addFuc(){
	try{
		$('#ryxxAddFm').form('clear');
		$('#ryxxAddInfo').dialog('clear');
		$('#ryxxEditInfo').dialog('clear');
		$('#ryxxCheckInfo').dialog('clear');
	}catch(e){
	}
    $('#ryxxAddInfo').dialog({
        title: '人员资料新增',
        width: 650,
        height: 380,
        closed: false,
        cache: false,
        href: '../rygl/ryxxAddOrUpdate.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
        		var pnum=$("#pnum").textbox("getValue");
	var name=$("#name").textbox("getValue");
	var email=$("#email").textbox("getValue");
	var tel=$("#tel").textbox("getValue");
	var wx=$("#wx").textbox("getValue");
	var qq=$("#qq").textbox("getValue");
	
	//zxl begin
	var school = $("#school").textbox("getValue");
	var major  = $("#major").textbox("getValue");
	var adr    = $("#adr").textbox("getValue");
	if(school.length>50){
		$.messager.alert('系统提示','毕业学校长度不能超过50！');
		return false;
	}
	if(major.length>50){
		$.messager.alert('系统提示','专业长度不能超过50！');
		return false;
	}
	if(adr.length>100){
		$.messager.alert('系统提示','家庭住址长度不能超过50！');
		return false;
	}
	if(wx.length>50){
		$.messager.alert('系统提示','微信长度不能超过50！');
		return false;
	}
	if(qq.length>50){
		$.messager.alert('系统提示','QQ长度不能超过50！');
		return false;
	}
	//zxl end
	
	if(name==''){
		$.messager.alert('系统提示','姓名不能为空！');
		return false;
	}
	if(pnum==''){
		$.messager.alert('系统提示','身份证不能为空！');
		return false;
	}
	
	if(IdentityCodeValid(pnum)){
		$.messager.alert('系统提示',"身份证格式错误");
		return false;
	}
	if(!Name_Validation(name)){
		$.messager.alert('系统提示','姓名只能由中文，数字，字母以及下划线和.组成，且长度不超过15位');
		return false;
	}
	if(email!==''&&!Mail_Validation(email)){
		$.messager.alert('系统提示','邮箱格式错误');
		return false;
	}
	
	if(tel!=''&&!Tel_Validation(tel)){
		$.messager.alert('系统提示','手机号码格式错误');
		return false;
	}
	
	if(wx!=''&&!Wx_Validation(wx)){
		$.messager.alert('系统提示','微信格式错误');
		return false;
	}
	
	if(qq!=''&&!QQ_Validation(qq)){
		$.messager.alert('系统提示','qq格式错误');
		return ;
	}
	  var params = $("#ryxxAddFm").serialize();  
         $.ajax( {  
           type : "POST",  
           dataType: "json",
           url : "../userInfoTrol/addUser",  
           data : params,  
           success : function(data){debugger;
           		if(data.flag){  
              		$.messager.alert('系统提示',data.message);
        			$('#ryxxGrid').datagrid('load');
        			$('#ryxxAddFm').form('clear');
        			$('#ryxxAddInfo').dialog('close');
               		$('#ryxxAddInfo').dialog('clear');
        			return true;
              	}else{
              		$.messager.alert('系统提示',data.message);
              		return false;
              	}
            }  
      });  
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#ryxxAddInfo').dialog('close');
                $('#ryxxAddInfo').dialog('clear');
            }
        }],
        iconCls: 'icon-save' 
    }) 
}
 
/*人员修改*/
function editFuc(id){
	try{
		$('#ryxxAddFm').form('clear');
		$('#ryxxAddInfo').dialog('clear');
		$('#ryxxEditInfo').dialog('clear');
		$('#ryxxCheckInfo').dialog('clear');
	}catch(e){
	}
    $('#ryxxEditInfo').dialog({
        title: '人员资料修改',
        width: 650,
        height: 380,
        closed: false,
        cache: false,
        href: '../rygl/ryxxAddOrUpdate.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
        		var pnum=$("#pnum").textbox("getValue");
	var name=$("#name").textbox("getValue");
	var email=$("#email").textbox("getValue");
	var tel=$("#tel").textbox("getValue");
	var wx=$("#wx").textbox("getValue");
	var qq=$("#qq").textbox("getValue");
	
	
	//zxl begin
	var school = $("#school").textbox("getValue");
	var major  = $("#major").textbox("getValue");
	var adr    = $("#adr").textbox("getValue");
	if(school.length>50){
		$.messager.alert('系统提示','毕业学校长度不能超过50！');
		return false;
	}
	if(major.length>50){
		$.messager.alert('系统提示','专业长度不能超过50！');
		return false;
	}
	if(adr.length>100){
		$.messager.alert('系统提示','家庭住址长度不能超过50！');
		return false;
	}
	if(wx.length>50){
		$.messager.alert('系统提示','微信长度不能超过50！');
		return false;
	}
	if(qq.length>50){
		$.messager.alert('系统提示','QQ长度不能超过50！');
		return false;
	}
	//zxl end
	
	if(name==''){
		$.messager.alert('系统提示','姓名不能为空！');
		return false;
	}
	if(pnum==''){
		$.messager.alert('系统提示','身份证不能为空！');
		return false;
	}
	
	if(IdentityCodeValid(pnum)){
		$.messager.alert('系统提示',"身份证格式错误");
		return false;
	}
	if(!Name_Validation(name)){
		$.messager.alert('系统提示','姓名只能由中文，数字，字母以及下划线和.组成，且长度不超过15位');
		return false;
	}
	if(email!==''&&!Mail_Validation(email)){
		$.messager.alert('系统提示','邮箱格式错误');
		return false;
	}
	
	if(tel!=''&&!Tel_Validation(tel)){
		$.messager.alert('系统提示','手机号码格式错误');
		return false;
	}
	
	if(wx!=''&&!Wx_Validation(wx)){
		$.messager.alert('系统提示','微信格式错误');
		return false;
	}
	
	if(qq!=''&&!QQ_Validation(qq)){
		$.messager.alert('系统提示','qq格式错误');
		return ;
	}
	  var params = $("#ryxxAddFm").serialize();  
         $.ajax( {  
           type : "POST",  
           dataType: "json",
           url : "../userInfoTrol/addUser",  
           data : params,  
           success : function(data){debugger;
           		if(data.flag){  
              		$.messager.alert('系统提示',data.message);
        			$('#ryxxGrid').datagrid('load');
        			$('#ryxxAddFm').form('clear');
        			$('#ryxxEditInfo').dialog('close');
               		$('#ryxxEditInfo').dialog('clear');
              	}else{
              		$.messager.alert('系统提示',data.message);
              		return false;
              	}
            }  
      });  
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#ryxxEditInfo').dialog('close');
                $('#ryxxEditInfo').dialog('clear');
            }
        }],
        onLoad:function(){
        $.ajax( {  
           type : "POST",  
           dataType: "json",
           url : "../userInfoTrol/getUser",  
           data : {id:id},  
           success : function(data){debugger;
           		$("#name").textbox('setValue',data.name);
           		$("#pnum").textbox('setValue',data.pnum);
           		if(data.sex=='男')
           			$(":radio[name='sex'][value='1']").prop("checked", "checked");
           		else if(data.sex=='女')
           			$(":radio[name='sex'][value='0']").prop("checked", "checked");
           		else
           			$(":radio[name='sex'][value='"+data.sex+"']").prop("checked", "checked");
           		$("#birth_date").datebox("setValue", data.birth_date);
           		$("#tel").textbox('setValue',data.tel);
           		$("#mz").combobox('setValue',data.mz);
           		$("#zzmm").combobox('setValue',data.zzmm);
           		$("#school").textbox('setValue',data.school);
           		$("#graduation_time").datebox('setValue',data.graduation_time);
           		$("#major").textbox('setValue',data.major);
           		$("#degree").textbox('setValue',data.degree);
           		$("#adr").textbox('setValue',data.adr);
           		$("#email").textbox('setValue',data.email);
           		$("#qq").textbox('setValue',data.qq);
           		$("#wx").textbox('setValue',data.wx);
           		$("#id").val(id);
            }  
      });  
        }
    })
}

//重置密码
function rePasFuc(id,pnum){
	var ids;
	if(id != ''){
		if(pnum.length<6){
			$.messager.alert('系统提示',"该行的身份证号码存在问题。");
			return;
		}
		ids = id+","+pnum.substr(-6,6);
	}else{
		var selectedRows = $("#ryxxGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要重置的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			if(selectedRows[i].PNUM.length<6){
				$.messager.alert('系统提示',selectedRows[i].NAME+"的身份证存在问题。在选中的第"+(i+1)+"条数据。");
				return;
			}
			strIds.push(selectedRows[i].ID+","+selectedRows[i].PNUM.substr(-6,6));
		}
		 ids=strIds.join(";");
  }
	
	$.ajax({
		url:'<%=request.getContextPath()%>/userInfoTrol/rePswUserInfo',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"ids" : ids},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	var resObj = eval("("+data+")");
            if(resObj.flag == true){
            	 $.messager.alert('系统提示','重置成功！');
            	 init();
	        }else{
	        	 $.messager.alert('系统提示','重置失败：'+resObj.errMsg);
		    }
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
}

//审核
function checkFuc(id,state){debugger 
	var ids;
	if(id != ''){
		if(state == '1' || state == '2'){
			$.messager.alert('系统提示','存在已经审核过的数据，无需再次审核！');
			return;
		}
		ids = id; 
	}else{
		var selectedRows = $("#ryxxGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要审核的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			if(selectedRows[i].IS_STATE == '1' || selectedRows[i].IS_STATE == '2'){
				$.messager.alert('系统提示','存在已经审核过的数据，无需再次审核！');
				return;
			}
			strIds.push(selectedRows[i].ID);
		}
		 ids=strIds.join(",");
  }
	$('#ryxxCheckInfo').dialog({
    title: '审核',
    width: 300,
    height: 200,
    closed: false,
    cache: false,
    href: 'ryCheck.jsp',
    modal: true,
    buttons:[ {
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					    	$.ajax({
					    		url:'<%=request.getContextPath()%>/userInfoTrol/ryxxCheckInfo',
					    	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
					    	    data: {"ids":ids,
						    	      // "checkUserId":$("#checkUserId").val(),
						    	       "checkStatus":$("#checkStatus").combobox('getValue'),
						    	       "checkRemark":$("#checkRemark").val(),
						    	    //   "checkDate":$("#checkDate").val()
						    	       
						    	       },    //参数值
					    	    type: "POST",   //请求方式
					    	    success: function(data) {
					    	    	var resObj = eval("("+data+")");
						            if(resObj.flag == true){
						            	 $.messager.alert('系统提示','审核成功！');
						            	 $("#ryxxGrid").datagrid("reload");
						            	 $('#ryxxCheckInfo').dialog('close');
							        }else{
							        	 $.messager.alert('系统提示','审核失败：'+resObj.errMsg);
								    }
					    	    },
					    	    error: function() {
					    	        //请求出错处理
					    	    }
					    	});
		           
				   
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				 $('#ryxxCheckInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function() { 
    }
});
	
} 
 
//删除
function delFuc(id){

var a=confirm("确认删除吗？");
 if(a==true)
 {
 
 	var ids;
	if(id != ''){
		ids = id; 
	}else{
		var selectedRows = $("#ryxxGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要删除的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].ID);
		}
		 ids=strIds.join(",");
  }
	
	$.ajax({
		url:'<%=request.getContextPath()%>/userInfoTrol/disabledUserInfo',
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"ids" : ids},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
	    	var resObj = eval("("+data+")");
            if(resObj.flag == true){
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

 
	
}
//查询
function selectSubmit(){
	
	$('#ryxxGrid').datagrid('load',{
		s_username_no:$("#s_username_no").textbox('getValue')
	});
}
</script>


<body style="margin: 1px;">
 

<div id="tb">
	<div id="ryxxTool"  style="background-color:#FFFFFF;">
	 <div>
	    <input type="text"  class="easyui-textbox"  
	        name="s_username_no" id="s_username_no" value="输入姓名"
	        size="20" onkeydown="if(event.keyCode==13) clearDefault()"/>
	        
		<a href="#" onclick="selectSubmit()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
		<a onclick="addFuc()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="delFuc('')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a>
	<!--	<a onclick="addOrg()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>-->
		<a onclick="rePasFuc('','')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">重置密码</a>
	<!-- 
		<a onclick="checkFuc('','')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">审核</a>
	 -->
	</div>

</div>
<div>
<table id="ryxxGrid"></table>  
</div>
<div id="ryxxCheckInfo" align="center"></div>
<div id="ryxxDetInfo" align="center"></div>
<div id="ryxxAddInfo" align="center"></div>
<div id="ryxxEditInfo" align="center"></div>

</body>
</html>
