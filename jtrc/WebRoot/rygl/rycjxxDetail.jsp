<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>人员采集信息查看</title>

<body>
<script type="text/javascript">
 
var pid = "<%=request.getParameter("pid").toString()%>";
 $(function(){
	 //基本信息
	 $.ajax({
		url:'<%=request.getContextPath()%>/personInfo/qryPersonBasic',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"pid" : pid},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
		    debugger;
            $("#detail_unit_Name").val(data.name);
            $("#detail_person_name").val(data.person_name);
            $("#detail_sex").val(data.sex);
            $("#detail_identity_number").val(data.identity_number);
            $("#detail_ethnic").val(data.ethnic);
            $("#detail_birthday").val(data.birthday);
            $("#detail_political_status").val(data.political_status);
            $("#detail_native_place").val(data.native_place);
            $("#detail_registered_place").val(data.registered_place);
            $("#detail_telephone").val(data.telephone);
            $("#detail_title").val(data.title);
            $("#detail_industry").val(data.industry);
            $("#detail_address").val(data.address);
            $("#detail_wechat").val(data.wechat);
            $("#detail_qq").val(data.qq);
            $("#detail_email").val(data.email);
            $("#detail_train_record").val(data.train_record);
            $("#detail_achievement").val(data.achievement);
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
	 //学历信息
	$('#detail_xlxxTableGrid').datagrid({    
    url : '<%=request.getContextPath()%>/personInfo/qryEducationInfo?pid='+pid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'graduateDate',title:'毕业日期',width:100,align:'center'},    
        {field:'schoolName',title:'学校名称',width:100,align:'center'},
        {field:'education',title:'学历',width:100,align:'center'},
        {field:'degree',title:'学位',width:100,align:'center'},
        {field:'major',title:'专业',width:100,align:'center'}
         
    
    ]]    
     });  
	var pager1 = $('#detail_xlxxTableGrid').datagrid('getPager');
	pager1.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
 
  //享受国务院政府特殊津贴
	$('#detail_gwyjtTableGrid').datagrid({    
    url:'<%=request.getContextPath()%>/personInfo/qryAllowanceInfo?pid='+pid, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
	     {field:'givendate',title:'颁发日期',width:100,align:'center'},    
	     {field:'number',title:'国务院津贴编号',width:100,align:'center'}
    ]]    
     });  
	var pager2 = $('#detail_gwyjtTableGrid').datagrid('getPager');
	pager2.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	});
	
 
  //专业技术职务资格证书
 	$('#detail_zyjsTableGrid').datagrid({    
 	url:'<%=request.getContextPath()%>/personInfo/qryMajorInfo?pid='+pid, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'approvalDate',title:'批准日期',width:100,align:'center'},    
        {field:'approvalNumber',title:'批准文号',width:100,align:'center'},
        {field:'level',title:'评审方式',width:100,align:'center'},
        {field:'level',title:'级别',width:100,align:'center'},
        {field:'qualification',title:'专业技术资格名称',width:100,align:'center'},
        {field:'major',title:'专业名称',width:100,align:'center'},
        {field:'certificateNumber',title:'证书编号',width:100,align:'center'}
    ]]    
     });  
	  var pager3 = $('#detail_zyjsTableGrid').datagrid('getPager');
	 pager3.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	 
	//职业资格证书
 	$('#detail_zyzgTableGrid').datagrid({    
 	url:'<%=request.getContextPath()%>/personInfo/qryProfessionInfo?pid='+pid, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'givenDate',title:'发证日期',width:100,align:'center'},    
        {field:'majorType',title:'专业类别',width:100,align:'center'},
        {field:'certificateNumber',title:'证书编号',width:100,align:'center'},
        {field:'certificateName',title:'证书名称',width:100,align:'center'},
        {field:'approvalDepartment',title:'审批部门',width:100,align:'center'} 
    ]]    
     });  
	  var pager4 = $('#detail_zyzgTableGrid').datagrid('getPager');
	 pager4.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	  //技术等级岗位证书
 	$('#detail_jsdjTableGrid').datagrid({    
 	url:'<%=request.getContextPath()%>/personInfo/qrySkillInfo?pid='+pid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'givenDate',title:'发证日期',width:100,align:'center'},    
        {field:'major',title:'工种专业',width:100,align:'center'},
        {field:'certificateNumber',title:'证书编号',width:100,align:'center'},
        {field:'skillLevel',title:'技术等级',width:100,align:'center'},
        {field:'approvalDepartment',title:'审批部门',width:100,align:'center'}
    ]]    
     });  
	  var pager5 = $('#detail_jsdjTableGrid').datagrid('getPager');
	 pager5.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '/ {pages} 页',
		displayMsg : '当前 {from} - {to} 条记录, 共 {total} 条记录',
		buttons : [ {
			iconCls : 'icon-excel',
			handler : function() {
			}
		} ]
	}); 
	 
	 //奖励情况
    $('#detail_jcqkTableGrid').datagrid({    
    url:'<%=request.getContextPath()%>/personInfo/qryRewardInfo?pid='+pid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 200,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
  columns:[[    
      {field:'approvalDate',title:'奖惩批准日期',width:100,align:'center'},    
      {field:'rewardName',title:'奖惩名称',width:100,align:'center'},
      {field:'rewardLevel',title:'奖惩情况级别',width:100,align:'center'}
  ]]    
   });  
	  var pager5 = $('#detail_jcqkTableGrid').datagrid('getPager');
	 pager5.pagination({
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
</script>

<form id="ryxxDetFm" method="post">
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:auto;">   
    <div title="基本信息" value="1" style="">   
      <div id="" class="easyui-accordion">   
      <table class="table2">
      <tr>
      <td class="left">单位名称</td>
      <td class="right">
          <input class="easyui-textbox" name="detail_unit_Name"  id="detail_unit_Name" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">姓名</td>
      <td class="right">
          <input class="easyui-textbox" name="detail_person_name"  id="detail_person_name" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">性别</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_sex" name="detail_sex" size="20" disabled="disabled" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">身份证号</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_identity_number" name="detail_identity_number" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
       <td class="left">民族</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_ethnic" name="detail_ethnic" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">出生年月</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_birthday" name="detail_birthday" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
     
      <tr>
      <td class="left">政治面貌</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_political_status" name="detail_political_status" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">籍贯</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_native_place" name="detail_native_place" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">户口所在地</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_registered_place" name="detail_registered_place" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">联系电话</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_telephone" name="detail_telephone" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">职务</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_title" name="detail_title" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">从业类别</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_industry" name="detail_industry" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">通讯地址</td>
      <td class="right"> 
          <input class="easyui-textbox" id="detail_address" name="detail_address" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">微信号</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_wechat" name="detail_wechat" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
     <td class="left">QQ</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_qq" name="detail_qq" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">电子邮箱</td>
      <td class="right">
          <input class="easyui-textbox" id="detail_email" name="detail_email" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">参加过的培训学习</td>
      <td class="right" colspan="4">
          <input class="easyui-textbox" disabled="disabled" name="detail_train_record" id="detail_train_record"  size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px">
      </td>
      </tr>
      <tr>
      <td class="left">主要工作业绩</td>
      <td class="right" colspan="4">
          <input class="easyui-textbox" disabled="disabled" name="detail_achievement" id="detail_achievement"  size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px"></td>
      </tr>
      
      </table> 
      </div>   
    </div>   
    
    
    <div title="学历信息" data-options="" style="">   
		    <div id="xlxxTool"  style="background-color:#FFFFFF;">
				 <table id="detail_xlxxTableGrid"></table> 
			</div>
    </div>
    <div title="享受国务院政府特殊津贴" data-options="" style="">   
             <div id="gwyjtTool"  style="background-color:#FFFFFF;">
				 <table id="detail_gwyjtTableGrid"></table> 
			</div>
    </div>
    <div title="专业技术职务资格证书" data-options="" style="">   
            <div id="zyjsTool"  style="background-color:#FFFFFF;">
				 <table id="detail_zyjsTableGrid"></table> 
			</div>
			
    </div> 
    <div title="职业资格证书" data-options="" style="">   
             <div id="zyzgTool"  style="background-color:#FFFFFF;">
				 <table id="detail_zyzgTableGrid"></table> 
			</div>
    </div> 
    <div title="技术等级岗位证书" data-options="" style="">   
             <div id="jsdjTool"  style="background-color:#FFFFFF;">
				 <table id="detail_jsdjTableGrid"></table> 
			</div>
    </div>
    <div title="奖惩情况" data-options="" style="">   
             <div id="jcqkTool"  style="background-color:#FFFFFF;">
				 <table id="detail_jcqkTableGrid"></table> 
			</div>
    </div>   
</div>  
</form>		
</body>

</html>
