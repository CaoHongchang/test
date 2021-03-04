<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<head>
<title>档案新增</title>

<body>
<script type="text/javascript">
//工作简历新增
function addgzjlFuc(){
$('#gzjlAddInfo').dialog({
    title: '档案新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/gzjlAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#gzjlAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
    $('#gzjlAddInfo').tabs('select', 0);    

    
    } //loadEnd
    

});


}


//教育培训新增
function addjypxFuc(){
$('#jypxAddInfo').dialog({
    title: '教育培训新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/jypxAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#jypxAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    
    $('#jypxAddInfo').tabs('select', 0);    

    
    } //loadEnd
    

});
}



//职业培训新增
function addzypxFuc(){
$('#zypxAddInfo').dialog({
    title: '职业培训新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/zypxAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zypxAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    

    
    } //loadEnd
    

});
}


//职务职称新增
function addzwzcFuc(){
$('#zwzcAddInfo').dialog({
    title: '职务职称新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/zwzcAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#zwzcAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    

    
    } //loadEnd
    

});
}

//奖励情况新增
function addjlqkFuc(){
$('#jlqkAddInfo').dialog({
    title: '职务职称新增',
    width: 950,
    height: 450,
   
    closed: false,
    cache: false,
    href: '../daxxgl/jlqkAdd.jsp',
    modal: true,
     buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
				
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
				$('#jlqkAddInfo').dialog('close');
				}
			}],
    iconCls: 'icon-save',
    onLoad: function () {
    

    
    } //loadEnd
    

});
}


 $(function(){

	  //工作简历
	   $('#gzjlTableGrid').datagrid({    
    url:'', 
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
        {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code1',title:'起始时间',width:100},    
        {field:'name2',title:'终止时间',width:100},
        {field:'name3',title:'所在单位',width:100},
        {field:'name4',title:'所在部门',width:100},
        {field:'name5',title:'岗位名称',width:100}
         
    
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
    url:'', 
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
        {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code1',title:'教育类别',width:100},    
        {field:'name2',title:'学校名称',width:100},
        {field:'name3',title:'入学日期',width:100},
        {field:'name4',title:'毕业日期',width:100},
        {field:'name5',title:'学历',width:100},
        {field:'name6',title:'学位',width:100},
        {field:'name7',title:'证书名称',width:100}
         
    
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
    url:'', 
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
        {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code1',title:'培训单位',width:100},    
         {field:'name2',title:'培训日期',width:100},
         {field:'name3',title:'结业日期',width:100},
        {field:'name4',title:'证书编号',width:100},
        {field:'name5',title:'发证机关',width:100},
        {field:'name6',title:'发证时间',width:100} 
 
         
    
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
    url:'', 
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
        {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code1',title:'级别',width:100},    
        {field:'name2',title:'评审方式',width:100},
        {field:'name3',title:'专业技术资格名称',width:100},
        {field:'name4',title:'专业名称',width:100},
        {field:'name5',title:'审批部门',width:100},
        {field:'name6',title:'证书编号',width:100},
        {field:'name6',title:'批准日期',width:100}  
 
         
    
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
    url:'', 
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
        {field:'id',title:'选择',checkbox:true,width:100},
        {field:'code1',title:'奖惩名称',width:100},    
        {field:'name2',title:'奖惩批准机关',width:100},
        {field:'name3',title:'奖惩批准日期',width:100},
        {field:'name4',title:'奖惩撤销日期',width:100}
 
         
    
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

<form id="fm" method="post">
   <div id="daxzTab" class="easyui-tabs" style="width:100%;height:400px;">   
    <div title="基本信息" style="">   
        <div id="" class="easyui-accordion" style="height:350px;">   
        <div title="添加档案" data-options="iconCls:'',fit:true,selected:true,collapsible:false" style="overflow:auto;padding:10px;">    
        <table class="table2">
      <tr>
      <td class="left">档案类别</td>
      <td class="right">
       <select id="cc" class="easyui-combobox" name="dept" style="width:135px;">   
	   <option value="">-空-</option>   
	   </select>
	  </td>
      <td class="left">档案编号</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left"></td>
      <td class="right"></td>
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
	    <option value="">-空-</option>  
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
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
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
	    <option value="">-空-</option>   
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
      <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">毕业院校</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">毕业时间</td>
     <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      <td class="left">所学专业</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
       <tr>
      <td class="left">毕业证号</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">报到单位</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">审批时间</td>
      <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">工作年限</td>
     <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      <td class="left">单位地址</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      </tr>
      
      <tr>
      <td class="left">从业工种</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">职业资格证</td>
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
      <td class="left">QQ号</td>
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
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
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
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
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
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
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
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
      </td>
      </tr>
      
       <tr>
      <td class="left">工作单位</td>
      <td class="right"><input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
     <td class="left">工作时间</td>
     <td class="right">
      <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px">
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
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
      <td class="left">退休时间</td>
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
       <td class="left"></td>
      <td class="right"></td>
      </tr>
      
       <tr>
      <td class="left">录入人</td>
      <td class="right"> <input class="easyui-textbox"   size="20" data-options="required:true" style="height:22px"></td>
      <td class="left">录入日</td>
      <td class="right">  <input class="easyui-datetimebox" name="birthday" size="20" data-options="required:true,showSeconds:false" value="" style="height:22px"></td>
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
    <div title="工作简历" data-options="" style="">   
		    <div id="gzjlTool"  style="background-color:#FFFFFF;">
				<a onclick="addgzjlFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增工作简历</a>
				<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改工作简历</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除工作简历</a>
				 <table id="gzjlTableGrid"></table> 
			</div>
			<div id="gzjlAddInfo"></div>
          
    </div>
    <div title="教育培训" data-options="" style="">   
             <div id="jypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addjypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增工作简历</a>
				<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改工作简历</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除工作简历</a>
				 <table id="jypxTableGrid"></table> 
			</div>
			<div id="jypxAddInfo"></div>
    </div>
    <div title="职业培训" data-options="" style="">   
               <div id="zypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addzypxFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增培训经历</a>
				<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改培训经历</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除培训经历</a>
				 <table id="zypxTableGrid"></table> 
			</div>
			<div id="zypxAddInfo"></div>
            
            
    </div> 
    <div title="职务职称" data-options="" style="">   
             <div id="zypxTool"  style="background-color:#FFFFFF;">
				<a onclick="addzwzcFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增职务职称</a>
				<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改职务职称</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除职务职称</a>
				 <table id="zwzcTableGrid"></table> 
			</div>
			<div id="zwzcAddInfo"></div>
       
            
    </div> 
    <div title="奖励情况" data-options="" style="">   
             <div id="jlqkTool"  style="background-color:#FFFFFF;">
				<a onclick="addjlqkFuc();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增奖励情况</a>
				<a onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改奖励情况</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除奖励情况</a>
				 <table id="jlqkTableGrid"></table> 
			</div>
			<div id="jlqkAddInfo"></div>
    </div>   
</div>  
</form>		
</body>

</html>
