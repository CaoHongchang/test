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
		    $("#check_unit_Name").val(data.name);
            $("#check_person_name").val(data.person_name);
            $("#check_sex").val(data.sex);
            $("#check_identity_number").val(data.identity_number);
            $("#check_ethnic").val(data.ethnic);
            $("#check_birthday").val(data.birthday);
            $("#check_political_status").val(data.political_status);
            $("#check_native_place").val(data.native_place);
            $("#check_registered_place").val(data.registered_place);
            $("#check_telephone").val(data.telephone);
            $("#check_title").val(data.title);
            $("#check_industry").val(data.industry);
            $("#check_address").val(data.address);
            $("#check_wechat").val(data.wechat);
            $("#check_qq").val(data.qq);
            $("#check_email").val(data.email);
            $("#check_train_record").val(data.train_record);
            $("#check_achievement").val(data.achievement);
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
	 //学历信息
	$('#xlxxTableGrid').datagrid({    
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
	var pager1 = $('#xlxxTableGrid').datagrid('getPager');
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
	$('#gwyjtTableGrid').datagrid({    
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
	var pager2 = $('#gwyjtTableGrid').datagrid('getPager');
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
 	$('#zyjsTableGrid').datagrid({    
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
	  var pager3 = $('#zyjsTableGrid').datagrid('getPager');
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
 	$('#zyzgTableGrid').datagrid({    
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
	  var pager4 = $('#zyzgTableGrid').datagrid('getPager');
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
 	$('#jsdjTableGrid').datagrid({    
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
	  var pager5 = $('#jsdjTableGrid').datagrid('getPager');
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
    $('#jcqkTableGrid').datagrid({    
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
	  var pager5 = $('#jcqkTableGrid').datagrid('getPager');
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

<form id="ryxxEditFm" method="post">
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:auto;">   
    <div title="基本信息" value="1" style="">   
      <div id="" class="easyui-accordion">   
      <table class="table2">
      <tr>
      <td class="left">单位名称</td>
      <td class="right">
          <input class="easyui-textbox" name="check_unit_Name"  id="check_unit_Name" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">姓名</td>
      <td class="right">
          <input class="easyui-textbox" name="check_person_name"  id="check_person_name" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">性别</td>
      <td class="right">
          <input class="easyui-textbox" id="check_sex" name="check_sex" size="20" disabled="disabled" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">身份证号</td>
      <td class="right">
          <input class="easyui-textbox" id="check_identity_number" name="check_identity_number" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
       <td class="left">民族</td>
      <td class="right">
          <input class="easyui-textbox" id="check_ethnic" name="check_ethnic" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">出生年月</td>
      <td class="right">
          <input class="easyui-textbox" id="check_birthday" name="check_birthday" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
     
      <tr>
      <td class="left">政治面貌</td>
      <td class="right">
          <input class="easyui-textbox" id="check_political_status" name="check_political_status" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">籍贯</td>
      <td class="right">
          <input class="easyui-textbox" id="check_native_place" name="check_native_place" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">户口所在地</td>
      <td class="right">
          <input class="easyui-textbox" id="check_registered_place" name="check_registered_place" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">联系电话</td>
      <td class="right">
          <input class="easyui-textbox" id="check_telephone" name="check_telephone" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">职务</td>
      <td class="right">
          <input class="easyui-textbox" id="check_title" name="check_title" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">从业类别</td>
      <td class="right">
          <input class="easyui-textbox" id="check_industry" name="check_industry" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">通讯地址</td>
      <td class="right"> 
          <input class="easyui-textbox" id="check_address" name="check_address" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">微信号</td>
      <td class="right">
          <input class="easyui-textbox" id="check_wechat" name="check_wechat" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
     <td class="left">QQ</td>
      <td class="right">
          <input class="easyui-textbox" id="check_qq" name="check_qq" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      </tr>
      
      <tr>
      <td class="left">电子邮箱</td>
      <td class="right">
          <input class="easyui-textbox" id="check_email" name="check_email" disabled="disabled" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
            <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">参加过的培训学习</td>
      <td class="right" colspan="4">
          <input class="easyui-textbox" disabled="disabled" name="check_train_record" id="check_train_record"  size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px">
      </td>
      </tr>
      <tr>
      <td class="left">主要工作业绩</td>
      <td class="right" colspan="4">
          <input class="easyui-textbox" disabled="disabled" name="check_achievement" id="check_achievement"  size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px"></td>
      </tr>
      
      </table>    
      </div>   
    </div>   
    
    
    <div title="学历信息" data-options="" style="">   
		    <div id="xlxxTool"  style="background-color:#FFFFFF;">
				 <table id="xlxxTableGrid"></table> 
			</div>
    </div>
    <div title="享受国务院政府特殊津贴" data-options="" style="">   
             <div id="gwyjtTool"  style="background-color:#FFFFFF;">
				 <table id="gwyjtTableGrid"></table> 
			</div>
    </div>
    <div title="专业技术职务资格证书" data-options="" style="">   
            <div id="zyjsTool"  style="background-color:#FFFFFF;">
				 <table id="zyjsTableGrid"></table> 
			</div>
			
    </div> 
    <div title="职业资格证书" data-options="" style="">   
             <div id="zyzgTool"  style="background-color:#FFFFFF;">
				 <table id="zyzgTableGrid"></table> 
			</div>
    </div> 
    <div title="技术等级岗位证书" data-options="" style="">   
             <div id="jsdjTool"  style="background-color:#FFFFFF;">
				 <table id="jsdjTableGrid"></table> 
			</div>
    </div>
    <div title="奖惩情况" data-options="" style="">   
             <div id="jcqkTool"  style="background-color:#FFFFFF;">
				 <table id="jcqkTableGrid"></table> 
			</div>
    </div>   
</div>  
</form>	
<hr style="height:2px;border:none;border-top:1px solid #555555;" />
<form id="checkBmbFm" method="post">

   <div>
    <table class="table2">
      <tr>
	      <td class="left">审核人</td>
	      <td class="right"><input id="checkUser" name="checkUser"  class="easyui-textbox" size="20"  data-options="required:true" style="height:22px"></td>
	      <td class="left">审核状态</td>
	      <td class="right">
		       <select id="checkStatus" class="easyui-combobox"   name="checkStatus" data-options="required:true,panelHeight:null,editable:false" style="width: 150px">   
			   	  <option value="1">审核通过</option> 
			   	  <option value="2">审核不通过</option>  
			   </select>
	      </td>
      </tr>
      <tr>
                    <td class="left">审核意见</td>
                    <td class="right" colspan="3">
                        <input class="easyui-textbox" id="checkRemark" name="checkRemark" data-options="multiline:true"  style="width:300px;height:100px">
                    </td>
                </tr>
      <tr>
		  <input type="text"  style="display:none" id="checkUserId" name="checkUserId"/>
	  </tr>
      </table>  
    </div>
  </form> 	
</body>

</html>
