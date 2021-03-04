<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>班级管理</title>
<script type="text/javascript">
$(function(){


 $("#a").hide();
   
    $.post('../auth/check',null,function(data){
          $.each(data,function(index,value){
			if(value==282){
				$("#a").show();
			}
	});
    },"json");
    
    
	   $('#ndhdGrid').datagrid({    
	    url:'', 
	    border:true,
		pageSize:10,
		pageList:[10,20,30,40],
		striped: true,
		collapsible:true,
		fitColumns:true,
		sortName: '',
		sortOrder: 'desc',
		remoteSort: false, 
	    columns:[[    
	         {field:'xh',title:'序',width: $(this).width() * 0.01,align:'center'},
	         {field:'zbdw',title:'主办单位',width: $(this).width() * 0.01,align:'center'},
	         {field:'pxbmc',title:'培训班名次',width: $(this).width() * 0.01,align:'center'},
	         {field:'pxts',title:'培训天数',width: $(this).width() * 0.01,align:'center'},
	         {field:'pxdd',title:'培训地点',width: $(this).width() * 0.01,align:'center'},
	         {field:'pxmd',title:'培训目的、内容',width: $(this).width() * 0.01,align:'center'},
	         {field:'pxdx',title:'培训对象',width: $(this).width() * 0.01,align:'center'},
	         {field:'zrs',title:'总人数',width: $(this).width() * 0.01,align:'center'},
	         {field:'kbsj',title:'开班时间',width: $(this).width() * 0.01,align:'center'},
	         {field:'bz',title:'备注',width: $(this).width() * 0.01,align:'center'},
	         {field:'bbyy',title:'办班依据',width: $(this).width() * 0.01,align:'center'}
	    ]]    
	});  
		var pager = $('#ndhdGrid').datagrid('getPager');
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
);
/*导出*/
function exportNdhz(){ 
	var year=$('#nd').combobox('getValue');
	var cstate=$('#cstate').combobox('getValue');
	$("#title").html('');
	$("#title").html(year+"福建省交通运输厅继续教育培训班计划汇总表");
	var url= "<%=request.getContextPath()%>/classTrol/exportNdhz?nd="+year+"&cstate="+cstate;
	window.location.href= url;
}
</script>
<body>
 
	<form id="fm" method="post">
      <div id="title" style="text-align: center;">2016福建省交通运输厅继续教育培训班计划汇总表 </div>  
       
    <div id="aa" class="easyui-accordion">   
    	<div align="center" title="" >  
	        <table class="table2" id="ndhdGrid">
	        </table> 
       </div>
    </div>
    
    <div id="aa" class="easyui-accordion" >   
       <div align="center" title="" >    
        <table class="table2">
          <tr>
           <td align="right" width="50px;">年度</td>
           <td align="left" width="140px;">
               <select id="nd" class="easyui-combobox" name="nd" style="width:135px;">   
			   	  <option value="2017">2017</option>  
			   	  <option value="2016">2016</option> 
			   	  <option value="2015">2015</option>  
			   	  <option value="2014">2014</option> 
			   	  <option value="2013">2013</option>  
			   </select>
           </td>
            <td align="right" width="50px;">班级状态</td>
           <td align="left" width="140px;">
               <select id="cstate" class="easyui-combobox" name="cstate" style="width:135px;">   
			   	  <option value="1">待报名</option> 
			   	  <option value="2">成绩录入</option>  
			      <option value="3">执行情况录入</option> 
			   	  <option value="4">结束培训</option>  
			   </select>
           </td>
           <td align="left">
           		<a id="a" onclick="exportNdhz()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">导出</a>
           </td>
          </tr>
        </table>  
      </div>   
    </div>
  </form> 

</body>

</html>
