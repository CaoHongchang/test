<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>人员材料查看</title>

<body>
<script type="text/javascript">
 
var uid = "<%=request.getParameter("uid").toString()%>";

 $(function(){
	 //档案信息
	 $.ajax({
		url:'<%=request.getContextPath()%>/userInfoTrol/qryUseBaseMs',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"uid" : uid},    //参数值
	    type: "POST",   //请求方式
	    success: function(data) {
		    debugger;
            $("#da_dtype").val(data.dtype);
            $("#da_dpno").val(data.dpno);
            $("#da_name").val(data.name);
            $("#da_old_name").val(data.old_name);
            $("input[name=da_sex][value='"+data.sex+"']").attr("checked",true);
            $("#da_mz").val(data.mz);
            $("#da_pnum").val(data.pnum);
            $("#da_birthday").val(data.birthday);
            $("#da_jg_name").val(data.jg_name);
            $("#da_domicile").val(data.domicile);
            $("#da_domicile_place").val(data.domicile_place);
            $("#da_zzmm").val(data.zzmm);
            $("#da_marital_status").val(data.marital_status);
            $("#da_degree").val(data.degree);
            $("input[name=da_is_s][value='"+data.is_s+"']").attr("checked",true);
            $("input[name=da_is_dl][value='"+data.is_dl+"']").attr("checked",true);
            $("#da_school").val(data.school);
            $("#da_graduation_time").val(data.graduation_time);
            $("#da_major").val(data.major);
            $("#da_bpno").val(data.da_bpno);
            $("#da_bd_unit").val(data.bd_unit);
            $("#da_sp_date").val(data.sp_date);
            $("#da_work_name").val(data.work_name);
            $("#da_work_time").val(data.work_time);
            $("#da_unit_adr").val(data.unit_adr);
            $("#da_ctype").val(data.ctype);
            $("#da_license").val(data.license);
            $("#da_home_tel").val(data.home_tel);
            $("#da_home_adr").val(data.home_adr);
            $("#da_home_post").val(data.home_post);
            $("#da_tel").val(data.tel);
            $("#da_my_tel").val(data.my_tel);
            $("#da_my_adr").val(data.my_adr);
            $("#da_my_post").val(data.my_post);
            $("#da_qq").val(data.qq);
            $("#da_email").val(data.email);
            $("#da_wife_name").val(data.wife_name);
            $("#da_create_date").val(data.create_date);
            $("#da_out_date").val(data.out_date);
            $("#da_pid").val(data.pid);
            $("#da_add_date").val(data.add_date);
            $("#da_remark").val(data.remark);
	    },
	    error: function() {
	        //请求出错处理
	    }
	});
	 //工作简历
	$('#gzjlTableGrid').datagrid({    
    url : '<%=request.getContextPath()%>/userInfoTrol/qryWorkInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 250,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'startDate',title:'起始时间',width:100,align:'center'},    
        {field:'endDate',title:'终止时间',width:100,align:'center'},
        {field:'enterpriseId',title:'所在单位',width:100,align:'center'},
        {field:'departmentId',title:'所在部门',width:100,align:'center'},
        {field:'placeId',title:'岗位名称',width:100,align:'center'}
         
    
    ]]    
     });  
	var pager1 = $('#gzjlTableGrid').datagrid('getPager');
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
	
 
  //教育培训
	   $('#jypxTableGrid').datagrid({    
    url:'<%=request.getContextPath()%>/userInfoTrol/qryStudyInfo?uid='+uid, 
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 250,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
	     {field:'study_type_id',title:'教育类别',width:100,align:'center'},    
	     {field:'school_name',title:'学校名称',width:100,align:'center'},
	     {field:'in_date',title:'入学日期',width:100,align:'center'},
	     {field:'graduation_date',title:'毕业日期',width:100,align:'center'},
	     {field:'education',title:'学历',width:100,align:'center'},
	     {field:'degree',title:'学位',width:100,align:'center'},
	     {field:'certificate',title:'证书名称',width:100,align:'center'}
    
    ]]    
     });  
	var pager2 = $('#jypxTableGrid').datagrid('getPager');
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
	
 
 
 
 
  //职业培训
 	   $('#zypxTableGrid').datagrid({    
    url:'<%=request.getContextPath()%>/userInfoTrol/qryStudyUpInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 250,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'training_unit',title:'培训单位',width:100,align:'center'},    
        {field:'train_date',title:'培训日期',width:100,align:'center'},
        {field:'out_date',title:'结业日期',width:100,align:'center'},
        {field:'train_no',title:'证书编号',width:100,align:'center'},
        {field:'office',title:'发证机关',width:100,align:'center'},
        {field:'office_date',title:'发证时间',width:100,align:'center'} 
    ]]    
     });  
	  var pager3 = $('#zypxTableGrid').datagrid('getPager');
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
	 
	 
	   //职务职称
 	   $('#zwzcTableGrid').datagrid({    
   // url:'<%=request.getContextPath()%>/userInfoTrol/qryOfficialInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 250,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'p_level',title:'级别',width:100,align:'center'},    
        {field:'p_method',title:'评审方式',width:100,align:'center'},
        {field:'pro_z_name',title:'专业技术资格名称',width:100,align:'center'},
        {field:'pro_name',title:'专业名称',width:100,align:'center'},
        {field:'department_id',title:'审批部门',width:100,align:'center'},
        {field:'pz_no',title:'证书编号',width:100,align:'center'},
        {field:'pz_date1',title:'批准日期',width:100,align:'center'}  
 
         
    
    ]]    
     });  
	  var pager4 = $('#zwzcTableGrid').datagrid('getPager');
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
	 
	  //奖励情况
 	   $('#jlqkTableGrid').datagrid({    
    url:'<%=request.getContextPath()%>/userInfoTrol/qryRewardsInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 250,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
        {field:'reward_name',title:'奖惩名称',width:100,align:'center'},    
        {field:'en_name',title:'奖惩批准机关',width:100,align:'center'},
        {field:'pz_date',title:'奖惩批准日期',width:100,align:'center'},
        {field:'cx_date',title:'奖惩撤销日期',width:100,align:'center'}
 
         
    
    ]]    
     });  
	  var pager5 = $('#jlqkTableGrid').datagrid('getPager');
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
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:400px;">   
    <div title="基本信息" value="1" style="">   
        <div id="" class="easyui-accordion" style="height:350px;">   
        <div title="添加档案" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
        <table class="table2">
      <tr>
      <td class="left">档案类别</td>
      <td class="right">
       <select id="da_dtype" class="easyui-combobox" disabled="disabled" name="da_dtype" style="width:135px;">   
		   <option value="A">-A-</option>  
		   <option value="B">-B-</option> 
	   </select>
	  </td>
      <td class="left">档案编号</td>
      <td class="right"><input class="easyui-textbox" name="da_dpno"  id="da_dpno" disabled="disabled" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right">
       <input class="easyui-textbox" id="da_name" name="da_name" size="20" disabled="disabled" data-options="required:true" style="height:22px"></td>
       <td class="left">曾用名</td>
      <td class="right"><input class="easyui-textbox" id="da_old_name" name="da_old_name" disabled="disabled" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      <tr>
      <td class="left">性别</td>
      <td class="right"><input type="radio" disabled="disabled" name="da_sex" value="1" />男
                        <input type="radio" disabled="disabled" name="da_sex" value="0" />女
      </td>
     <td class="left">名族</td>
     <td class="right">
      <select id="da_mz" class="easyui-combobox" disabled="disabled" name="da_mz" style="width:135px;">   
	    <option value="1">-汉-</option>  
	   </select>
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
     
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_pnum" name="da_pnum" size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">出生日期</td>
     <td class="right">
      <input class="easyui-datebox" id="da_birthday" disabled="disabled" name="da_birthday" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
      <tr>
      <td class="left">籍贯</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_jg_name" name="da_jg_name"  size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">出生地</td>
     <td class="right">
      <input class="easyui-textbox"  id="da_domicile" disabled="disabled" name="da_domicile" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
        <tr>
      <td class="left">户口所在地</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_domicile_place" name="da_domicile_place" size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">政治面貌</td>
     <td class="right">
      <select id="da_name_jg_name" class="easyui-combobox" name="da_zzmm" disabled="disabled" style="width:135px;">   
	    <option value="1">-中国共产党-</option>   
	   </select>
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
      <tr>
      <td class="left">婚姻状况</td>
      <td class="right"> <select id="da_marital_status" disabled="disabled" class="easyui-combobox" name="da_marital_status" style="width:135px;">   
	   <option value="1">未婚</option>   
	   </select></td>
     <td class="left">文化程度</td>
     <td class="right">
      <select id="da_degree" class="easyui-combobox" disabled="disabled" name="da_degree" style="width:135px;">   
	   <option value="1">本科</option>   
	   </select>
      </td>
     <td class="left">选择照片文件</td>
      <td class="right"> </td>
      </tr>
      
      <tr>
      <td class="left">是否派遣</td>
      <td class="right"><input type="radio" name="da_is_s" value="on" disabled="disabled" />是
                        <input type="radio" name="da_is_s" value="off" disabled="disabled"/>否</td>
     <td class="left">单位代理</td>
      <td class="right"><input type="radio" name="da_is_dl" disabled="disabled"/>是
                        <input type="radio" name="da_is_dl" disabled="disabled"/>否</td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox" id="da_school" disabled="disabled" name="da_school"  size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">毕业时间</td>
     <td class="right">
      <input class="easyui-datebox" id="da_graduation_time" disabled="disabled" name="da_graduation_time" size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_major" name="da_major" size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">毕业证号</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_bpno" name="da_bpno"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">报道单位</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_bd_unit" name="da_bd_unit" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">审批时间</td>
      <td class="right">
      <input class="easyui-datebox" id="da_sp_date" disabled="disabled" name="da_sp_date" size="20" data-options="required:true"  style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_work_name"  id="da_work_name" size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">工作时间</td>
     <td class="right">
      <input class="easyui-datebox" id="da_work_time" disabled="disabled" name="da_work_time" size="20" data-options="required:true"  style="height:22px">
      </td>
      <td class="left">单位地址</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_unit_adr" name="da_unit_adr"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">从业工种</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_ctype" name="da_ctype" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">上岗证</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" id="da_license" name="da_license" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">家庭电话</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_home_tel" id="da_home_tel" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">家庭地址</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_home_adr" id="da_home_adr" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">家庭地址邮编</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_home_post"  id="da_home_post"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      
       <tr>
      <td class="left">本人联系电话1</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_tel" id="da_tel"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">本人联系电话2</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_my_tel" id="da_my_tel"  size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_my_adr" id="da_my_adr"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">邮政编码</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_my_post" id="da_my_post"  size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">QQ号</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_qq" id="da_qq" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_email" id="da_email"  size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">配偶姓名</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_wife_name" id="da_wife_name" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">配偶联系电话</td>
      <td class="right"><input class="easyui-textbox" disabled="disabled" name="da_wife_tel" id="da_wife_tel"  size="20" data-options="required:true" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
         <tr>
      <td class="left">建档时间</td>
      <td class="right">  <input class="easyui-datebox" disabled="disabled" name="da_create_date" id="da_create_date" size="20" data-options="required:true"  style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right">  <input class="easyui-datebox" disabled="disabled" name="da_out_date" id="da_out_date" size="20" data-options="required:true" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> <input class="easyui-textbox" disabled="disabled" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datebox" disabled="disabled" size="20" data-options="required:true"  style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="4"> <input class="easyui-textbox" disabled="disabled" name="da_remark" id="da_remark"  size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px"></td>
  
      </tr>
      
      </table>  
      </div>   
   
       </div>
          
    </div>   
    <div title="意向档案" data-options="" style="">   
              <div id="" class="easyui-accordion" style="height:350px;">   
        <div title="添加档案" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
        <table class="table2">
      <tr>
      <td class="left">档案类别</td>
      <td class="right">
       <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
	  </td>
      <td class="left"></td>
      <td class="right"></td>
      <td class="left">系统编号</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      <tr>
      <td class="left">姓名</td>
      <td class="right">
       <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">曾用名</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      <tr>
      <td class="left">性别</td>
      <td class="right"><input type="radio" name="identity" value="学生" checked="checked" />男
                        <input type="radio" name="identity" value="教师" />女</td>
     <td class="left">名族</td>
     <td class="right">
      <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
     
      <tr>
      <td class="left">身份证号</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">出生日期</td>
     <td class="right">
      <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
      <tr>
      <td class="left">籍贯</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">出生地</td>
     <td class="right">
      <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px">
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
        <tr>
      <td class="left">户口所在地</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">政治面貌</td>
     <td class="right">
      <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
      <tr>
      <td class="left">婚姻状况</td>
      <td class="right"> <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select></td>
     <td class="left">文化程度</td>
     <td class="right">
      <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="aa"></option>   
	   </select>
      </td>
     <td class="left">选择照片文件</td>
      <td class="right"><input  data-options="buttonText:'选择文件'" class="easyui-filebox" style="width:135px;"></td>
      </tr>
      
      <tr>
      <td class="left">是否派遣</td>
      <td class="right"><input type="radio" name="identity"  checked="checked" />是
                        <input type="radio" name="identity"/>否</td>
     <td class="left">单位代理</td>
      <td class="right"><input type="radio" name="identity"  checked="checked" />是
                        <input type="radio" name="identity"/>否</td>
      <td class="left">人事外包</td>
      <td class="right"><input type="radio" name="identity"  checked="checked" />是
                        <input type="radio" name="identity"/>否</td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">毕业时间</td>
     <td class="right">
      <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px">
      </td>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">毕业证号</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">报道单位</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">审批时间</td>
      <td class="right">
      <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">工作时间</td>
     <td class="right">
      <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px">
      </td>
      <td class="left">单位地址</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">从业工种</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">上岗证</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">家庭电话</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">家庭地址</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">家庭地址邮编</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      
       <tr>
      <td class="left">本人联系电话1</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">本人联系电话2</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">通讯地址</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">邮政编码</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">QQ号码</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left">电子邮箱</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">配偶姓名</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">配偶联系电话</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
         <tr>
      <td class="left">建档时间</td>
      <td class="right">  <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right">  <input class="easyui-datebox" name="birthday" size="20" data-options="required:true"  style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> <input class="easyui-textbox" id="da_pid" name="da_pid" size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datebox" id="da_add_date" name="da_add_date" size="20" data-options="required:true"  style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">备注</td>
      <td class="right" colspan="4"> <input class="easyui-textbox"   size="20" data-options="required:true,multiline:true" style="height:60px;width: 430px"></td>
  
      </tr>
      
      </table>  
      </div>   
   
       </div>
    </div>   
    <div title="工作简历" data-options="" onclick="qryWorkInfo()" style="">   
		    <div id="gzjlTool"  style="background-color:#FFFFFF;">
				 <table id="gzjlTableGrid"></table> 
			</div>
			<div id="gzjlAddInfo"></div>
			<div id="gzjlEidtInfo"></div>
          
    </div>
    <div title="教育培训" data-options="" style="">   
             <div id="jypxTool"  style="background-color:#FFFFFF;">
				 <table id="jypxTableGrid"></table> 
			</div>
			<div id="jypxAddInfo"></div>
			<div id="jypxEditInfo"></div>
    </div>
    <div title="职业培训" data-options="" style="">   
               <div id="zypxTool"  style="background-color:#FFFFFF;">
				 <table id="zypxTableGrid"></table> 
			</div>
			<div id="zypxAddInfo"></div>
    </div> 
    <div title="职务职称" data-options="" style="">   
             <div id="zwzcTool"  style="background-color:#FFFFFF;">
				 <table id="zwzcTableGrid"></table> 
			</div>
			<div id="zwzcAddInfo"></div>
       		<div id="zwzcEidtInfo"></div>
            
    </div> 
    <div title="奖励情况" data-options="" style="">   
             <div id="jlqkTool"  style="background-color:#FFFFFF;">
				 <table id="jlqkTableGrid"></table> 
			</div>
			<div id="jlqkAddInfo"></div>
    </div>   
</div>  
</form>		
</body>

</html>
