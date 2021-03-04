<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案信息管理</title>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

<script type="text/javascript">
	$(function(){

//权限设置
	  $("#a").hide();
	    $("#b").hide();
	    $("#c").hide();
	    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==338){
				$("#a").show();
			}else if(value==339){
				$("#b").show();
			}else if(value==340){
				$("#c").show();
			}
	});
    },"json");

   $('#daxxglGrid').datagrid({    
    url:'../archivesBaseInfoTrol/querybaseinfolist', 
     border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	height: '80%',
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,
	singleSelect:true,
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'pno',title:'系统编码',width : $(this).width() * 0.1,align:'center'},    
        {field:'dpno',title:'档案号',width : $(this).width() * 0.1,align:'center'},    
        {field:'name',title:'代理人姓名',width: $(this).width() * 0.1,align:'center'},
         {field:'sex',title:'性别',width: $(this).width() * 0.1,align:'center',
        	formatter: function(value,row,index){
            if (value == "") {
          	   return value;
			}
            else if (value == '1') {
          	    return "男";
			}else if (value == '0') {
          	    return "女";
		    }else{
		       return value;
		    }
	     }},
         {field:'pnum',title:'身份证号',width: $(this).width() * 0.2,align:'center'},
         {field:'tel',title:'联系电话',width: $(this).width() * 0.15,align:'center'},
         {field:'is_s',title:'是否派遣',width: $(this).width() * 0.1,align:'center',
        	 formatter: function(value,row,index){
                 if (value == 'on') {
               	    return "是";
     			}else if (value == 'off') {
               	    return "否";
     		    }else{
     				return "否";
     		    }
     	     }	 
         },
         {title:'操作',field:'uid12',width: $(this).width() * 0.1,align:'center',
				formatter: function(value,row,index){
 				 return " <a href='#' style='color: blue;' onclick='check("+row.uid+","+row.id+");' >查看<a>";
 				}  
			}
  
    ]],
    onCheck:function(rowIndex,rowData){
		var cache=window.top.cacheArchive;
		cache.cacheId=rowData.id;//档案id
		cache.cacheDpno=rowData.dpno;//档案编号
		cache.cacheIdnum=rowData.pnum;//身份证
		cache.cacheName=rowData.name;//姓名
		cache.cacheSchool=rowData.school;//毕业院校
		cache.cacheMajor=rowData.major;//所学专业
		cache.cacheTel=rowData.tel;//联系电话
		setArchiveHead();
	}
});  
	var pager = $('#daxxglGrid').datagrid('getPager');
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


function editFuc1(){

		var row =$('#daxxglGrid').datagrid('getSelected');
		if(row==null||row==''||row.length==0){
			$.messager.alert('系统提示','请选择要修改的数据！');
			return ;
		} 
		var uid=row.uid;
		var mid=row.id;
	    $('<div></div>').dialog({
	    	id:'daxxEditInfo',
	        title: '档案资料修改',
	        width: 950,
	        height: 500,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'daxxEdit.jsp?uid='+uid,
	        modal: true,
	        buttons:[{
	            text:'保存',
	            iconCls:'icon-ok',
	            handler:function(){
	           
	            if($("#human_out1").val().length>50){
	            alert("外包单位名称不多于50字！");
	            return;
	            }
	            
	            if(!Name_Validation($("#da_name").val())){
	            alert("姓名只能由数字，字母，中文以及.号组成，且长度不超过15位！");
	            return;
	            }
	            
	            if($("#da_old_name").val()!=''&&!Name_Validation($("#da_old_name").val())){
	            alert("曾用名只能由数字，字母，中文以及.号组成，且长度不超过15位！");
	            return;
	            }
	            
	            if($("#da_jg_name").val().length>50){
	            alert("籍贯不多于50字！");
	            return;
	            }
	            
	            if($("#da_domicile").val().length>50){
	            alert("出生地不多于50字！");
	            return;
	            }
	            
	            if($("#da_domicile_place").val().length>50){
	            alert("户口所在地不多于50字！");
	            return;
	            }
	            
	            if($("#da_is_s1").val().length>50){
	            alert("派遣单位名称不多于50字！");
	            return;
	            }
	            
	            if($("#da_is_dl1").val().length>50){
	            alert("代理单位名称不多于50字！");
	            return;
	            }
	            
	            if($("#da_school").val().length>50){
	            alert("毕业院校不多于50字！");
	            return;
	            }
	            
	            if($("#da_major").val().length>20){
	            alert("所学专业不多于20字！");
	            return;
	            }
	            
	             if($("#da_school").val().length>50){
	            alert("毕业院校不多于50字！");
	            return;
	            }
	            
	            if($("#da_bpno").val()!=''&&!Zno_Validation($("#da_bpno").val())){
	            alert("毕业证号只能由数字和字组成，且长度不超过30位！");
	            return;
	            }
	            
	            if($("#da_bd_unit").val().length>50){
	            alert("报到单位不多于50字！");
	            return;
	            }
	            
	            if($("#da_work_name").val().length>50){
	            alert("工作单位不多于50字！");
	            return;
	            }
	            
	            if($("#da_work_time").val().length>10){
	            alert("工作年限不多于10字！");
	            return;
	            }
	            
	            
	             if($("#da_unit_adr").val().length>50){
	            alert("单位地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_ctype").val().length>15){
	            alert("职务职称级别不多于15字！");
	            return;
	            }
	            
	            if($("#da_license").val().length>25){
	            alert("职业资格证不多于25字！");
	            return;
	            }
	            
	            if($("#da_home_tel").val()!=''&&!HomeTel_Validation($("#da_home_tel").val())){
	            alert("家庭电话输入错误，格式请按照：0597-777777格式输入！");
	            return;
	            }
	            
	             if($("#da_home_adr").val().length>50){
	            alert("家庭地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_home_post").val()!=''&&!Post_Validation($("#da_home_post").val())){
	            alert("家庭地址邮政编码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_tel").val()!=''&&!Tel_Validation($("#da_tel").val())){
	            alert("个人联系电话1格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_tel").val()!=''&&!Tel_Validation($("#da_my_tel").val())){
	            alert("个人联系电话2格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_adr").val().length>50){
	            alert("通讯地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_my_post").val()!=''&&!Post_Validation($("#da_my_post").val())){
	            alert("邮政编码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_qq").val()!=''&&!QQ_Validation($("#da_qq").val())){
	            alert("QQ号码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_post").val()!=''&&!Post_Validation($("#da_my_post").val())){
	            alert("邮政编码错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_wife_name").val()!=''&&!Name_Validation($("#da_wife_name").val())){
	            alert("应急联系人只能由数字，字母，中文以及.号组成，且长度不能超过15位！");
	            return;
	            }
	            
	            if($("#da_wife_tel").val()!=''&&!Tel_Validation($("#da_wife_tel").val())){
	            alert("应急联系人手机格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_remark").val().length>150){
	            alert("备注不多于150字！");
	            return;
	            }
	            
	        	saveRyEdit(mid);
	    		//$('#daxxEditInfo').dialog('close');
	        	 //$('#daxxEditInfo').dialog('close');
	               // window.location.reload();
	            }
	        },{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	             
	             
	                $('#daxxEditInfo').dialog('destroy');
	                window.location.reload();
	            }
	        }],
	        iconCls: 'icon-save',
	        onClose:function(){
	        	$('#daxxEditInfo').dialog('destroy');
	        },
	        onLoad: function () {
             
           
               //档案信息
	 $.ajax({
		url:'<%=request.getContextPath()%>/userInfoTrol/qryUseBaseMs',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"uid" : uid,"mid":mid},    //参数值
	    cache: false,
	    type: "POST",   //请求方式
	    success: function(data) {
 		//	console.log(data.dtype);
           if(data.dtype == 'B'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("临时档案");
            	 $('#da_dtype_name').combobox('setValue',"B"); 
            }else if(data.dtype == 'L'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("临时档案");
            	
            	 $('#da_dtype_name').combobox('setValue',"L"); 
            }else if(data.dtype == 'D'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("代理档案");
                 $('#da_dtype_name').combobox('setValue',"D");
            }else if(data.dtype == 'C'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("单纯档案");
            	 $('#da_dtype_name').combobox('setValue',"C");
            }else if(data.dtype == 'T'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("退休");
            	  $('#da_dtype_name').combobox('setValue',"T");
            }else if(data.dtype == 'W'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("待就业");
            	 $('#da_dtype_name').combobox('setValue',"W");
            }else if(data.dtype == 'Y'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("意向档案");
            	  $('#da_dtype_name').combobox('setValue',"Y");
            } 
            
             $("#ryxxEditFm input[id='da_dtype']").val(data.dtype);
             $('#da_dpno').textbox('setValue',data.dpno);
             $('#da_dpno2').val(data.dpno);//原始值，该值不变
             $('#da_pno').textbox('setValue',data.pno);
             $('#da_name').textbox('setValue',data.name);
             $('#da_old_name').textbox('setValue',data.old_name);
             $('#da_pname').textbox('setValue',data.stuffname);
              $('#da_add_date').textbox('setValue',data.add_date);
              $('#da_add_date').textbox('setValue',data.add_date);
            $("#ryxxEditFm input[name=da_sex][value='"+data.sex+"']").attr("checked",true);
            $("#ryxxEditFm input[name=human_out][value='"+data.human_out+"']").attr("checked",true);
            
           
            if(data.mz=="1")
            	   $('#da_mz').textbox('setValue',"汉");
            else
                   $('#da_mz').textbox('setValue',data.mz);
            $('#da_pnum').textbox('setValue',data.pnum);
           
            $('#da_birthday').datebox('setValue',data.birth_date);
            $('#da_jg_name').textbox('setValue',data.jg_name);
            $('#da_domicile').textbox('setValue',data.domicile);
            $('#da_domicile_place').textbox('setValue',data.domicile_place);
			if(data.zzmm=="0")
            $('#da_zzmm').textbox('setValue',"群众");
			else if(data.zzmm=="0")
				 $('#da_zzmm').textbox('setValue',"中国共产党");
				 else
				  $('#da_zzmm').textbox('setValue',data.zzmm);
            if(data.marital_status=="0")
            $('#da_marital_status').combobox('setValue',"未知");
            else
             $('#da_marital_status').combobox('setValue',data.marital_status);
            if(data.degree=="1")
            $('#da_degree').textbox('setValue',"本科");
            else
              $('#da_degree').textbox('setValue',data.degree);
           
            $("#ryxxEditFm input[name=da_is_s][value='"+data.is_s+"']").attr("checked",true);
            $("#ryxxEditFm input[name=da_is_dl][value='"+data.point_proxy+"']").attr("checked",true);
            
               if(data.human_out=="on"){
			    $("#point" ).css("display", "block");
		
			   }
			    if(data.is_s=="on"){
			      $("#point1" ).css("display", "block");
			   }
			    if(data.point_proxy=="on"){
			     $("#point2" ).css("display", "block");
			   }
			
            $('#da_is_s1').textbox('setValue',data.is_s1);
            $('#da_is_dl1').textbox('setValue',data.point_proxy1);
            //alert(data.human_out1);
            $('#human_out1').textbox('setValue',data.human_out1);
            
            $('#da_school').textbox('setValue',data.school);
            $('#da_graduation_time').datebox('setValue',data.graduation_time);
            $('#da_major').textbox('setValue',data.major);
           
            $('#da_bpno').textbox('setValue',data.bpno);
            $('#da_bd_unit').textbox('setValue',data.bd_unit);
            $('#da_sp_date').datebox('setValue',data.sp_date);
            $('#da_work_name').textbox('setValue',data.work_name);
           
           $('#da_work_time').datebox('setValue',data.work_time);
            
           
            $('#da_unit_adr').textbox('setValue',data.unit_adr);
            $('#da_ctype').textbox('setValue',data.ctype);
            $('#da_license').textbox('setValue',data.license);
            $('#da_home_tel').textbox('setValue',data.home_tel);
            $('#da_home_adr').textbox('setValue',data.home_adr);
            $('#da_home_post').textbox('setValue',data.home_post);
            $('#da_tel').textbox('setValue',data.tel);
            $('#da_my_tel').textbox('setValue',data.my_tel);
            $('#da_my_adr').textbox('setValue',data.my_adr);
            $('#da_my_post').textbox('setValue',data.my_post);
            $('#da_qq').textbox('setValue',data.qq);
            $('#da_email').textbox('setValue',data.email);
            $('#da_wife_name').textbox('setValue',data.wife_name);
            $('#da_create_date').datebox('setValue',data.create_date);
            $('#da_out_date').datebox('setValue',data.out_date);
             $("#ryxxEditFm input[id='pid']").val(data.pid);
            $('#da_wife_tel').textbox('setValue',data.wife_tel);
           
          $('#da_add_date').datebox('setValue',data.add_date);
            $('#da_remark').textbox('setValue',data.remark);//
             
          //  console.log();
            $('#da_pname').textbox('setValue',data.stuffname); 
            $("#ryxxEditFm input[id='img_url']").val(data.img_url);
           
           
           $('#max_school').textbox('setValue',data.max_school);
           $('#max_major').textbox('setValue',data.max_major);
           $('#max_graduation_time').datebox('setValue',data.max_graduation_time);
           $('#max_degree').textbox('setValue',data.max_degree);
	   
            setUrlSrc(data.img_url); 
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
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
		{field:'id',title:'编号',width:100,align:'center'},
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
	height: 410,
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
	     {field:'certificate',title:'证书名称',width:100,align:'center'},
	     {field:'major',title:'专业',width:100,align:'center'}
    
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
	height: 410,
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
    url:'<%=request.getContextPath()%>/userInfoTrol/qryOfficialInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
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
	height: 410,
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
    
    
         } 
	    });
	}

function loadfunc(uid,mid){
 
}

function query(){
	//var dept = $("#dept").combobox("getValue");
	var key = $("#key").val();
	var pnum = $("#searchPnum").val();
	var name=$('#searchName').textbox('getValue');
	var age=$('#searchAge').combobox('getValue');
	var dept=$('#searchAge').combobox('getValue');
	$("#daxxglGrid").datagrid("load",{
		key:key,
		pnum:pnum,
		name:name,
		age:age
	});
}

function addFun(){

    $('<div></div>').dialog({
    	id:'daxxAddInfo',
        title: '档案信息新增',
        width: 950,
        height: 500,
        maximizable:true, 
        resizable:true, 
        closed: false,
        cache: false,
        href: 'daxxAdd.jsp',
        modal: true,
        buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
        		if(!Name_Validation($("#da_name").val())){
	            alert("姓名只能由数字，字母，中文以及.号组成，且长度不超过15位！");
	            return;
	            }
	            
	            if($("#da_old_name").val()!=''&&!Name_Validation($("#da_old_name").val())){
	            alert("曾用名只能由数字，字母，中文以及.号组成，且长度不超过15位！");
	            return;
	            }
	            
	            if($("#da_jg_name").val().length>50){
	            alert("籍贯不多于50字！");
	            return;
	            }
	            
	            if($("#da_domicile").val().length>50){
	            alert("出生地不多于50字！");
	            return;
	            }
	            
	            if($("#da_domicile_place").val().length>50){
	            alert("户口所在地不多于50字！");
	            return;
	            }
	            
	             if($("#human_out1").val().length>50){
	            alert("外包单位名称不多于50字！");
	            return;
	            }
	            
	            if($("#da_is_s1").val()!=''&&$("#da_is_s1").val().length>50){
	            alert("派遣单位名称不多于50字！");
	            return;
	            }
	            
	            if($("#da_is_dl1").val()!=''&&$("#da_is_dl1").val().length>50){
	            alert("代理单位名称不多于50字！");
	            return;
	            }
	            
	            if($("#da_school").val().length>50){
	            alert("毕业院校不多于50字！");
	            return;
	            }
	            
	            if($("#da_major").val().length>20){
	            alert("所学专业不多于20字！");
	            return;
	            }
	            
	             if($("#da_school").val().length>50){
	            alert("毕业院校不多于50字！");
	            return;
	            }
	            
	            if($("#da_bpno").val()!=''&&!Zno_Validation($("#da_bpno").val())){
	            alert("毕业证号只能由数字和字组成，且长度不超过30位！");
	            return;
	            }
	            
	            if($("#da_bd_unit").val().length>50){
	            alert("报到单位不多于50字！");
	            return;
	            }
	            
	            if($("#da_work_name").val().length>50){
	            alert("工作单位不多于50字！");
	            return;
	            }
	            
	            if($("#da_work_time").val().length>10){
	            alert("工作年限不多于10字！");
	            return;
	            }
	            
	            
	             if($("#da_unit_adr").val().length>50){
	            alert("单位地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_ctype").val().length>15){
	            alert("职务职称级别不多于15字！");
	            return;
	            }
	            
	            if($("#da_license").val().length>25){
	            alert("职业资格证不多于25字！");
	            return;
	            }
	            
	            if($("#da_home_tel").val()!=''&&!HomeTel_Validation($("#da_home_tel").val())){
	            alert("家庭电话输入错误，格式请按照：0597-777777格式输入！");
	            return;
	            }
	            
	             if($("#da_home_adr").val().length>50){
	            alert("家庭地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_home_post").val()!=''&&!Post_Validation($("#da_home_post").val())){
	            alert("家庭地址邮政编码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_tel").val()!=''&&!Tel_Validation($("#da_tel").val())){
	            alert("个人联系电话1格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_tel").val()!=''&&!Tel_Validation($("#da_my_tel").val())){
	            alert("个人联系电话2格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_adr").val().length>50){
	            alert("通讯地址不多于50字！");
	            return;
	            }
	            
	            if($("#da_my_post").val()!=''&&!Post_Validation($("#da_my_post").val())){
	            alert("邮政编码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_qq").val()!=''&&!QQ_Validation($("#da_qq").val())){
	            alert("QQ号码格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_my_post").val()!=''&&!Post_Validation($("#da_my_post").val())){
	            alert("邮政编码错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_wife_name").val()!=''&&!Name_Validation($("#da_wife_name").val())){
	            alert("应急联系人只能由数字，字母，中文以及.号组成，且长度不能超过15位！");
	            return;
	            }
	            
	            if($("#da_wife_tel").val()!=''&&!Tel_Validation($("#da_wife_tel").val())){
	            alert("应急联系人手机格式错误，请重新输入！");
	            return;
	            }
	            
	            if($("#da_remark").val().length>150){
	            alert("备注不多于150字！");
	            return;
	            }
        		saveRyAdd();
        	
        		
            }
        },{
            text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){
                $('#daxxAddInfo').dialog('destroy');
                window.location.reload();
            }
        }],
           iconCls: 'icon-save',
           onClose:function(){
	        	$('#daxxAddInfo').dialog('destroy');
	        },
           onLoad: function () {
            /*$("input",$("#da_pnum").next("span")).blur(function(){  
              var birdate=GetBirthdatByIdNo($(this).val()); 
              if(birdate.length==10){
              }
             });
             */

            } 
    }); 
}

//删除
function delFun(id){
	var ids;
	if(id != ''){
		ids = id; 
	}else{
		var selectedRows = $("#daxxglGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			$.messager.alert('系统提示','请选择一条要删除的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].uid);
		}
		 ids=strIds.join(",");
  }
	$.messager.confirm("操作提示", "您确定要删除吗？", function (data) {
        if (data) {
        	$.ajax({
        		url:'<%=request.getContextPath()%>/userInfoTrol/disabledUserInfo',
        	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        	    data: {"ids" : ids},    //参数值
        	    type: "POST",   //请求方式
        	    success: function(data) {
        	    	var resObj = eval("("+data+")");
                    if(resObj.flag == true){
                    	 $.messager.alert('系统提示','删除成功！');
                    	 query();
        	        }else{
        	        	 $.messager.alert('系统提示','删除失败：'+resObj.errMsg);
        		    }
        	    },
        	    error: function() {
        	        //请求出错处理
        	    }
        	});
        }
        else {
            return;
        }
    });
	
}

function check(uid,mid){

	 $('<div></div>').dialog({
		    id:'daxxLookInfo',
	        title: '档案资料查看',
	        width: 950,
	        height: 500,
	        maximizable:true, 
	        resizable:true, 
	        closed: false,
	        cache: false,
	        href: 'daxxCheck.jsp?uid='+uid,
	        modal: true,
	        buttons:[{
	            text:'关闭',
	            iconCls:'icon-cancel',
	            handler:function(){
	                $('#daxxLookInfo').dialog('destroy');
	            }
	        }],
	        iconCls: 'icon-save',
	        onClose:function(){
	        	$('#daxxLookInfo').dialog('destroy');
	        },
	        onLoad: function () {
               //档案信息
	 $.ajax({
		url:'<%=request.getContextPath()%>/userInfoTrol/qryUseBaseMs',
	    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
	    data: {"uid" : uid,"mid":mid},    //参数值
	    cache: false,
	    type: "POST",   //请求方式
	    success: function(data) { 
 			//console.log(data.dtype);
           if(data.dtype == 'B'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("临时档案");
            	 $('#da_dtype_name').combobox('setValue',"B"); 
            }else if(data.dtype == 'L'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("临时档案");
            	
            	 $('#da_dtype_name').combobox('setValue',"L"); 
            }else if(data.dtype == 'D'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("代理档案");
                 $('#da_dtype_name').combobox('setValue',"D");
            }else if(data.dtype == 'C'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("单纯档案");
            	 $('#da_dtype_name').combobox('setValue',"C");
            }else if(data.dtype == 'T'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("退休");
            	  $('#da_dtype_name').combobox('setValue',"T");
            }else if(data.dtype == 'W'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("待就业");
            	 $('#da_dtype_name').combobox('setValue',"W");
            }else if(data.dtype == 'Y'){
            	 //$("#ryxxEditFm input[name='da_dtype_name']").val("意向档案");
            	  $('#da_dtype_name').combobox('setValue',"Y");
            } 
             $("#ryxxEditFm input[id='da_dtype']").val(data.dtype);
             $('#da_dpno').textbox('setValue',data.dpno);
             $('#da_dpno2').val(data.dpno);//原始值，该值不变
             $('#da_pno').textbox('setValue',data.pno);
             $('#da_name').textbox('setValue',data.name);
             $('#da_old_name').textbox('setValue',data.old_name);
             $('#da_pname').textbox('setValue',data.stuffname);
              $('#da_add_date').textbox('setValue',data.add_date);
              $('#da_add_date').textbox('setValue',data.add_date);
            $("#ryxxEditFm input[name=da_sex][value='"+data.sex+"']").attr("checked",true);
            $("#ryxxEditFm input[name=human_out][value='"+data.human_out+"']").attr("checked",true);
            
           
            if(data.mz=="1")
            	   $('#da_mz').textbox('setValue',"汉");
            else
                   $('#da_mz').textbox('setValue',data.mz);
            $('#da_pnum').textbox('setValue',data.pnum);
           
            $('#da_birthday').datebox('setValue',data.birth_date);
            $('#da_jg_name').textbox('setValue',data.jg_name);
            $('#da_domicile').textbox('setValue',data.domicile);
            $('#da_domicile_place').textbox('setValue',data.domicile_place);
			if(data.zzmm=="0")
            $('#da_zzmm').textbox('setValue',"群众");
			else if(data.zzmm=="0")
				 $('#da_zzmm').textbox('setValue',"中国共产党");
				 else
				  $('#da_zzmm').textbox('setValue',data.zzmm);
            if(data.marital_status=="0")
            $('#da_marital_status').combobox('setValue',"未知");
            else
             $('#da_marital_status').combobox('setValue',data.marital_status);
            if(data.degree=="1")
            $('#da_degree').textbox('setValue',"本科");
            else
              $('#da_degree').textbox('setValue',data.degree);
           
            $("#ryxxEditFm input[name=da_is_s][value='"+data.is_s+"']").attr("checked",true);
            $("#ryxxEditFm input[name=da_is_dl][value='"+data.point_proxy+"']").attr("checked",true);
            
               if(data.human_out=="on"){
			    $("#point" ).css("display", "block");
		
			   }
			    if(data.is_s=="on"){
			      $("#point1" ).css("display", "block");
			   }
			    if(data.point_proxy=="on"){
			     $("#point2" ).css("display", "block");
			   }
			
            $('#da_is_s1').textbox('setValue',data.is_s1);
            $('#da_is_dl1').textbox('setValue',data.point_proxy1);
            //alert(data.human_out1);
            $('#human_out1').textbox('setValue',data.human_out1);
            
            $('#da_school').textbox('setValue',data.school);
            $('#da_graduation_time').datebox('setValue',data.graduation_time);
            $('#da_major').textbox('setValue',data.major);
           
            $('#da_bpno').textbox('setValue',data.bpno);
            $('#da_bd_unit').textbox('setValue',data.bd_unit);
            $('#da_sp_date').datebox('setValue',data.sp_date);
            $('#da_work_name').textbox('setValue',data.work_name);
           
           $('#da_work_time').datebox('setValue',data.work_time);
            
           
            $('#da_unit_adr').textbox('setValue',data.unit_adr);
            $('#da_ctype').textbox('setValue',data.ctype);
            $('#da_license').textbox('setValue',data.license);
            $('#da_home_tel').textbox('setValue',data.home_tel);
            $('#da_home_adr').textbox('setValue',data.home_adr);
            $('#da_home_post').textbox('setValue',data.home_post);
            $('#da_tel').textbox('setValue',data.tel);
            $('#da_my_tel').textbox('setValue',data.my_tel);
            $('#da_my_adr').textbox('setValue',data.my_adr);
            $('#da_my_post').textbox('setValue',data.my_post);
            $('#da_qq').textbox('setValue',data.qq);
            $('#da_email').textbox('setValue',data.email);
            $('#da_wife_name').textbox('setValue',data.wife_name);
            $('#da_create_date').datebox('setValue',data.create_date);
            $('#da_out_date').datebox('setValue',data.out_date);
             $("#ryxxEditFm input[id='pid']").val(data.pid);
            $('#da_wife_tel').textbox('setValue',data.wife_tel);
           
          $('#da_add_date').datebox('setValue',data.add_date);
            $('#da_remark').textbox('setValue',data.remark);//
             
            $('#da_pname').textbox('setValue',data.stuffname); 
            $("#ryxxEditFm input[id='img_url']").val(data.img_url);
           // setUrlSrc(data.img_url); 
           $('#max_degree').textbox('setValue',data.max_degree);
           $('#max_graduation_time').textbox('setValue',data.max_graduation_time);
           $('#max_major').textbox('setValue',data.max_major);
           $('#max_school').textbox('setValue',data.max_school);
           
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
	height: 410,
	width:'100%',
	toolbar: '',
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
		{field:'id',title:'编号',width:100,align:'center'},
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
	height: 410,
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
	height: 410,
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
    url:'<%=request.getContextPath()%>/userInfoTrol/qryOfficialInfo?uid='+uid,
    border:true,
	pageSize:10,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: 410,
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
	height: 410,
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
    
    
         } 
	    });
	}
	

	
	

</script>


<body style="margin: 1px;">
<jsp:include page="/system/archiveHead.jsp"></jsp:include>
<div id="tb">
   	<div id="zcpshdTool"  style="background-color:#FFFFFF;">
		<a onclick="addFun();" id="a" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
		<a onclick="editFuc1();" id="b" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a onclick="delFun('');" id="c" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
</div>
<div class="easyui-layout" data-options="fit:true,border:false">
<label>档案号：</label>
<input class="easyui-textbox" value="${sessionUserName}" data-options="iconCls:''" id="key" style="width:150px">
&nbsp;&nbsp;
<label>身份证号：</label> 
<input class="easyui-textbox" value="" name="searchPnum" id="searchPnum" >
&nbsp;&nbsp;
<label>姓名：</label>
<input class="easyui-textbox" value="" name="searchName" id="searchName" >
&nbsp;&nbsp;
<label>年龄：</label>
<select class="easyui-combobox" value="" name="seachAge" id="searchAge" data-options="editable:false,panelHeight:null" style="width:150px;">
  <option value="">所有</option>
  <option value="30">30以下</option>
  <option value="40">31-40岁</option>
  <option value="50">41-50岁</option>
  <option value="60">51岁以上</option>
</select>
<a class="easyui-linkbutton" href="javascript:query();" data-options="iconCls:'icon-search',plain:true">查询</a>

<table id="daxxglGrid" ></table>  
</div>
<div id="daxxglInfo"></div>
<div id="daxxAddInfo1"></div>
<div id="daxxEditInfo1"></div>
<div id="viewInfo"></div>


</body>
</html>
