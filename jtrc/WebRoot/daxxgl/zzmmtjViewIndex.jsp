<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>政治面貌统计管理</title>

<script type="text/javascript">
$(function () {
    var zzmm; 
	var num;
	
	
		var _page_type = '${page_type}';

	var _time_type = $('#time_type').combobox("getValue");
	var _file_type = $('#file_type').length >0 ? $('#file_type').combobox("getValue") : "sj";
	var _t_start = $('#t_start').textbox('getValue');
	var _t_end = $('#t_end').textbox('getValue');
    
    $('#query_btn').click( function () {
	 	create_chart();	 	
	 });
	 
	 function ccc(){
	 if(_t_start==null || _t_start==''){
    _t_start="1900-01-01";
    }
    if(_t_end==null ||_t_end==''){
     var myDate = new Date;
    var nian = myDate.getFullYear();//获取当前年
    var yue = myDate.getMonth()+1;//获取当前月
    var ri = myDate.getDate()+1;
    _t_end= nian+"-"+yue+"-"+ri;
    }
    if(_time_type==null || _time_type==''){
    _time_type='year';
    }
    if(_file_type==null || _file_type==''){
    _file_type="sj";
    }
	 $('#zzmmtjGrid').datagrid({    
		    url:'<%=request.getContextPath()%>/archivesBaseInfoTrol/statisticalZzmm?year1='+_t_start+'&year2='+_t_end+'&fileType='+_file_type,  
		     border:true,
			pageSize:10,
			pageList:[10,20,30,40],
			striped: true,
			collapsible:true,
			//fitColumns:true,
			height: wholeHeight,
			toolbar: '',
			
			sortName: '',
			sortOrder: 'desc',
			remoteSort: false,    
		    columns:[[    
		         {field:'id1',title:'选择',checkbox:true,align:'center'},
			     //{field:'code1',title:'序列',width : $(this).width() * 0.05,align:'center'},    
		        {field:'zzmm',title:'类型',width : $(this).width() * 0.4,align:'center'},    
		        {field:'num',title:'人数',width : $(this).width() * 0.4,align:'center'}
		  
		    ]]    
		});  
			var pager = $('#zzmmtjGrid').datagrid('getPager');
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
		 };	
			
		
		//获取统计年分、数量
	function statisticalByYear(_t_start,_t_end,_file_type) {
		debugger;
		if(_t_start==""){
		_t_start="1900-01-01";
		}
		if(_t_end==""){
		var myDate = new Date;
    	var nian = myDate.getFullYear();//获取当前年
    	var yue = myDate.getMonth()+1;//获取当前月
    	var ri = myDate.getDate()+1;
   		 _t_end= nian+"-"+yue+"-"+ri;
		}
		zzmm = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/archivesBaseInfoTrol/statisticalZzmm",
		async:false,
		data:{year1:_t_start,year2:_t_end,fileType:_file_type },
			success:function(result){
			//var data2 = eval(result);
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				zzmm[i]=result[i].zzmm;
				num[i]=result[i].num;
				}
	 		},
		});
		statistical();
		ccc();
	}
	statisticalByYear(_t_start,_t_end,_file_type);		
			function statistical() {
		    // Build the chart
	        $('#container').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '政治面貌'
	            },
	            tooltip: {
	                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false
	                    },
	                    showInLegend: true
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: '政治面貌',
	                data: [
	                    [zzmm[0],num[0]],
	                    [zzmm[1],num[1]],
	                    [zzmm[2],num[2]],
	                    [zzmm[3],num[3]],
	                    [zzmm[4],num[4]],
	                    [zzmm[5],num[5]],
	                    [zzmm[6],num[6]],
	                    [zzmm[7],num[7]],
	                    [zzmm[8],num[8]],
	                    [zzmm[9],num[9]],
	                    [zzmm[10],num[10]],
	                    [zzmm[11],num[11]],
	                    [zzmm[12],num[12]],
	                    [zzmm[13],num[13]],
	                ]
	            }]
	        });
	    };
	    
	    
	    function create_chart() {
 
		_time_type = $('#time_type').combobox("getValue");
		_file_type = $('#file_type').length >0 ? $('#file_type').combobox("getValue") : _file_type;
		_t_start = $('#t_start').textbox('getValue');
		_t_end = $('#t_end').textbox('getValue');
 		_t_start =_t_start.substring(0,10);
 		_t_end=_t_end.substring(0,10);
 		statisticalByYear(_t_start,_t_end,_file_type);
 		
 	}
	
  
});





</script>


<body style="margin: 1px;">
 
<div>
统计日期：<input id="t_start" class="easyui-datetimebox" name="birthday" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;-&nbsp;<input id="t_end" class="easyui-datetimebox" name="birthday" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;&nbsp;
<select id="time_type" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="year">年统计</option> 
     <option value="month">月统计</option>     
</select> 
&nbsp;&nbsp;
<select id="file_type" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="sj">实际档案</option> 
     <option value="all">全部档案</option>     
</select>
<a id="query_btn" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a><span style="color:red">(如有slice请先点灰)</span>

</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
    <div title="统计表" data-options="" style="overflow:auto;">   
            <table id="zzmmtjGrid"></table>
    </div>   
    
</div>  

</body>
</html>
