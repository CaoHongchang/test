<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>论文专著鉴定成绩列表</title>

<script type="text/javascript">
	$(function(){
   
   
   
   
   
   $('#pshdGrid').datagrid({    
    url:'../zcps/queryShLeftPageList', 
     border:true,
    pageSize:10,
    pageList:[10,20,30,40],
    striped: true,
    collapsible:true,
    fitColumns:true,
    height: '100%',
    toolbar: '',
    singleSelect:true,
    pagination:true,
    sortName: '',
    sortOrder: 'desc',
    remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'businessId',title:'活动编码',width : $(this).width() * 0.01,align:'center'},    
        {field:'name',title:'评审活动名称',width : $(this).width() * 0.01,align:'center'}   

  
    ]]  ,onClickRow:function( rowIndex, rowData){
        var id=rowData["id"];
        //$('#fpGrid').datagrid({url:'../zcps/queryDissertationAssign?activityId='+id});
        $('#lwzzjdcjGrid').datagrid("load",{"activityId":id});
        currentActivity=rowData;
    },onLoadSuccess:function(data){
        if(data.rows.length>0){
            currentActivity=data.rows[0];
        //$('#fpGrid').datagrid({url:'../zcps/queryDissertationAssign?activityId='+currentActivity.id});
        $('#lwzzjdcjGrid').datagrid("load",{"activityId":currentActivity.id});
        }
    }    
});  
   
   
   
   
   
   
   
   $('#lwzzjdcjGrid').datagrid({    
    url:'../DissScoreTrol/queryPaperScoreList', 
     border:true,
	pageSize:20,
	pageList:[10,20,30,40],
	striped: true,
	collapsible:true,
	fitColumns:true,
	height: wholeHeight,
	toolbar: '#zcpshdTool',
	pagination : true,
	sortName: '',
	sortOrder: 'desc',
	remoteSort: false,    
    columns:[[    
         {field:'id',title:'选择',checkbox:true,align:'center'},
        {field:'p_no',title:'论文编号',width : $(this).width() * 0.01,align:'center'},    
        {field:'name',title:'姓名',width : $(this).width() * 0.01,align:'center'},    
        {field:'pnum',title:'身份证号',width: $(this).width() * 0.01,align:'center'},
         {field:'dissetation_name',title:'论文题目',width: $(this).width() * 0.01,align:'center'},
         {field:'expertname',title:'评审专家',width: $(this).width() * 0.01,align:'center'},
         {field:'zpno',title:'专家编号',width: $(this).width() * 0.01,align:'center'},      
         {field:'add_date',title:'分配时间',width: $(this).width() * 0.01,align:'center'},
         {field:'p_score',title:'论文鉴定成绩',width: $(this).width() * 0.01,align:'center',
        	 formatter: function (value, row, index) { 
        	  //鉴定成绩转换
        	    switch(value){
            case 1:
                  return "优秀";
            break;
            case 2:
            	return "良好";
            break;
            case 3:
            	return "合格";
            break;
            case 4:
            	return "不合格";
            break;
     }
        	 }
         },
         {field:'p_msg',title:'鉴定意见',width: $(this).width() * 0.01,align:'center'},
         {field:'j_date',title:'鉴定时间',width: $(this).width() * 0.01,align:'center'}
  
  
    ]]    
});  
	var pager = $('#lwzzjdcjGrid').datagrid('getPager');
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



	 //导出成绩信息
function queryScore(){
	var ids;
		var selectedRows = $("#lwzzjdcjGrid").datagrid('getSelections');
		if(selectedRows.length == 0){
			//$.messager.alert('系统提示','请选择至少一条要导出的数据！');
			return;
		}
	    var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		ids=strIds.join(",");
  	window.location='<%=request.getContextPath()%>/DissScoreTrol/PaperScoreExport?ids='+ids;
}

//导出成绩信息
function queryScoreall(){
    var ids;
        var selectedRows = $("#pshdGrid").datagrid('getSelections');
        if(selectedRows.length == 0){
            $.messager.alert('系统提示','请选择活动！');
            return;
        }
        var aid  = selectedRows[0].id;
        console.log("xx",aid);
debugger;
    window.location='<%=request.getContextPath()%>/DissScoreTrol/PaperScoreExportAll?aid='+aid;
}


//导出鉴定成绩表
function queryAppraisal(){
    var ids;
        var selectedRows = $("#pshdGrid").datagrid('getSelections');
        if(selectedRows.length == 0){
            $.messager.alert('系统提示','请选择活动！');
            return;
        }
        var aid  = selectedRows[0].id;
    
    window.location='<%=request.getContextPath()%>/DissScoreTrol/ExportAppraisal?aid='+aid;
}

//查询
	function selectSubmit(){
		$('#lwzzjdcjGrid').datagrid('load',{
			name:$("#name").textbox('getValue'),
			pnum:$("#pnum").textbox('getValue'),
			title:$("#title").textbox('getValue'),
			score:$('#score').combobox('getValue')
			
		});
	}
//重置
	function resetSubmit(){
		$("#name").textbox('setValue','');
		$("#pnum").textbox('setValue','');
		$("#title").textbox('setValue','');
		$("#score").combobox('setValue','');
		//selectSubmit();
	}
	
	
	//打印
	/*
	var tableString="<html><head><link rel='stylesheet' type='text/css' href='css/table_print.css'/></head><body><table cellspacing='0'  id='PrintBody' border='1' align='center' >";

 function doPrint(){
  
          
        tableString += "<script language='javascript'>window.print();</s"+"cript>";

     

       win = document.open('','','height=1000,width=1200,scrollbars=yes,status =yes');

       win.document.write(tableString);
       tableString="<html><head><link rel='stylesheet' type='text/css' media='print' href='./css/print.css'/></head><body><table cellspacing='0'  id='PrintBody' border='1' style='font-size:12px' >";

       win.document.close();
      
      
  }


 function CreateFormPage(strPrintName, printDatagrid) {

     var frozenColumns = printDatagrid.datagrid("options").frozenColumns;  // 得到frozenColumns对象

     var columns = printDatagrid.datagrid("options").columns;    // 得到columns对象

  

     // 载入title

     tableString = tableString + "\n<tr>";

     if(frozenColumns != undefined && frozenColumns != '') {

        for(var i = 0;i<frozenColumns[0].length; i++) {

            if(frozenColumns[0][i].hidden != true) {

               tableString = tableString + "\n<th width= '" +frozenColumns[0][i].width  +"'>" + frozenColumns[0][i].title + "</th>";

            }

        }

     }

     if(columns != undefined && columns != '') {

        for(var i = 0;i<columns[0].length; i++) {

            if(columns[0][i].hidden != true) {

               tableString = tableString + "\n<th width= '" +columns[0][i].width  +"'>" + columns[0][i].title + "</th>";

            }

        }

     }

     tableString = tableString + "\n</tr>";

  

     // 载入内容

     var rows = printDatagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行。

     for(var j = 0; j <rows.length;j++) {

        tableString = tableString + "\n<tr>";

        if(frozenColumns != undefined && frozenColumns != '') {

            for(var i = 0;i<frozenColumns[0].length; i++) {

               if(frozenColumns[0][i].hidden != true) {

                   tableString = tableString + "\n<td >" + rows[j][frozenColumns[0][i].field] + "</td>";

               }

            }

        }

        if(columns != undefined && columns != '') {

            for(var i = 0;i<columns[0].length; i++) {

               if(columns[0][i].hidden != true) {

                   tableString = tableString + "\n<td>" + rows[j][columns[0][i].field] + "</td>";

               }
              

            }

        }

        tableString = tableString + "\n</tr>";

     }

     tableString = tableString + "\n</table></body></html>";
    

     doPrint();


}




//网页中直接可以调用//打印报表 章柄交接统计表
  function startPrint(){
      CreateFormPage("gac",$("#lwzzjdcjGrid"));
  }
	*/
</script>


<body style="margin: 1px;">



<div id="cc" class="easyui-layout" data-options="fit:true,border:false">   

    <div data-options="region:'west',title:'评审活动列表',split:true,border:false" style="width:300px;">
        <table id="pshdGrid"></table>  
    
    
    </div>   
    <div data-options="region:'center',title:'成绩列表',border:false" style="">
 <table >
     <tr>
        <td>姓名：</td>
        <td><input id="name" name="name" class="easyui-textbox"/></td>
        <td>身份证：</td>
        <td><input id="pnum" name="pnum" class="easyui-textbox"/></td>
        <td>论文题目：</td>
        <td><input id="title" name="title" class="easyui-textbox"/></td>
         <td>论文成绩：</td>
        <td>
        <!--  <input id="score" name="score" class="easyui-textbox"/>-->
        <select id="score" class="easyui-combobox"  style="width: 100px" name="score" data-options="editable:false,panelHeight:null">
        <option value="" class="selected">请选择</option>
        <option value=1>优秀</option>
        <option value=2>良好</option>
        <option value=3>及格</option>
        <option value=4>不及格</option>
        </select>
        </td>
        <td>
           <a onclick="selectSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
           <a onclick="resetSubmit()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">重置</a>
        </td>
     </tr>
 </table>  
 
 <div id="tb">
   
    <div id="zcpshdTool"  style="background-color:#FFFFFF;">
        <a onclick="queryScore()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出excel</a>
        <a onclick="queryScoreall()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">全部导出excel</a>
        <a onclick="queryAppraisal()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">导出专家鉴定意见</a>
    <!--    <a onclick="startPrint()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">打印鉴定成绩表</a>  -->
    </div>

</div>
<div>
<table id="lwzzjdcjGrid"></table>  
</div>
    </div>   
</div>  

  


<div id="zcpshdAddInfo"></div>


</body>
</html>
