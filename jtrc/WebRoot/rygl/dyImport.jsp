<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>党员导入</title>

<script type="text/javascript"><%-- 
	$(function(){
   
   $('#drbmhdGrid').datagrid({    
    url:'', 
    border:true,
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'bjbm',title:'序号',width: $(this).width() * 0.015,align:'center'},
         {field:'xm',title:'姓名',width: $(this).width() * 0.01,align:'center'},
         {field:'sfzh',title:'身份证',width: $(this).width() * 0.02,align:'center'},
         {field:'xb',title:'性别',width: $(this).width() * 0.01,align:'center'},
         {field:'mz',title:'籍贯',width: $(this).width() * 0.01,align:'center'},
         {field:'dp',title:'出生年月',width: $(this).width() * 0.01,align:'center'},
         {field:'gzdw',title:'学历',width: $(this).width() * 0.015,align:'center'},
         {field:'bm',title:'工作地',width: $(this).width() * 0.01,align:'center'},
         {field:'zw',title:'工作单位',width: $(this).width() * 0.01,align:'center'},
         {field:'zyjszw',title:'预正',width: $(this).width() * 0.02,align:'center'},
         {field:'csny',title:'入党时间',width: $(this).width() * 0.015,align:'center'},
         {field:'ssdq',title:'转正时间',width: $(this).width() * 0.015,align:'center'},
         {field:'whcd',title:'入党介绍人1',width: $(this).width() * 0.015,align:'center'},
         {field:'dh',title:'入党介绍人2',width: $(this).width() * 0.015,align:'center'},
         {field:'bz',title:'手机号码',width: $(this).width() * 0.008,align:'center'},
         {field:'whcd',title:'QQ号',width: $(this).width() * 0.015,align:'center'},
         {field:'dh',title:'微信号',width: $(this).width() * 0.015,align:'center'},
         {field:'bz',title:'入党申请书',width: $(this).width() * 0.008,align:'center'},
         {field:'whcd',title:'入党志愿书',width: $(this).width() * 0.015,align:'center'},
         {field:'dh',title:'政治审查材料',width: $(this).width() * 0.015,align:'center'},
         {field:'bz',title:'培养教育考察材料',width: $(this).width() * 0.008,align:'center'},
         {field:'dh',title:'转正申请书',width: $(this).width() * 0.015,align:'center'},
         {field:'bz',title:'备注',width: $(this).width() * 0.008,align:'center'},
         {field:'cwts',title:'错误信息',width: $(this).width() * 0.015,align:'center'}
    ]]    
});  
});
 
 
 $('#tt').tabs({
	    border:false,
	    onSelect:function(title){
			alert(title+' is selected');
	    }
	}); 
 
 --%>
 
</script>


<body style="margin: 1px;">
	<div style="padding:7px;" align="left">
	 	<a onclick="exportFun()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导入文件</a>
	</div>
    <div id="tt" class="easyui-tabs" style="width:1000px;height:450px;">
        <div title="党员信息" style="padding:10px;display:none;" >
    		 <div id="aa" class="easyui-accordion" style="height:150px;">  
               <table class="table2" >
    		          <tr style="background-color: #95B8E7">
    		                 <td>序号</td>
					         <td>姓名</td>
					         <td>身份证</td>
					         <td>性别</td>
					         <td>籍贯</td>
					         <td>出生年月</td>
					         <td>学历</td>
					         <td>工作地</td>
					         <td>工作单位</td>
					         <td>预正</td>
					         <td>入党时间</td>
					         <td>转正时间</td>
					         <td>入党介绍人1</td>
					         <td>入党介绍人2</td>
					         <td>手机号码</td>
					         <td>QQ号</td>
					         <td>微信号</td>
					         <td>入党申请书</td>
					         <td>入党志愿书</td>
					         <td>政治审查材料</td>
					         <td>培养教育考察材料</td>
					         <td>转正申请书</td>
					         <td>备注</td>
					         <td>错误信息</td>
    		           </tr>
    		  </table>
        	</div>
        </div>
        <div title="转入信息" data-options="closable:true"  style="overflow:auto;padding:20px;display:none;">
       		 <div id="aa" class="easyui-accordion" style="height:150px;">  
               <table class="table2" >
    		          <tr style="background-color: #95B8E7">
    		               <td>序号</td>
    		               <td>身份证</td>
    		               <td>组织关系介绍信编号</td>
    		               <td>转入时间</td>
    		               <td>转入地</td>
    		               <td>错误信息</td>
    		           </tr>
    		  </table>
        	</div>
        </div>
        <div title="转出信息" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">
           <div id="aa" class="easyui-accordion" style="height:150px;">  
               <table class="table2" >
    		           <tr style="background-color: #95B8E7">
    		               <th>序号</th>
    		               <th>身份证</th>
    		               <th>组织关系介绍信编号</th>
    		               <th>转出时间</th>
    		               <th>转出地</th>
    		               <th>错误信息</th>
    		           </tr>
    		  </table>
        	</div>
        </div>
        <table id="drbmhdGrid"></table> 
    </div> 


--%></body>
</html>
