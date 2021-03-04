<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>报考层次统计管理</title>

<script type="text/javascript">
$(function () {
    
	var chart;
	var LEVEL;
	var num;
	
	$('#query_btn').click( function () {
	 	create_chart();	 	
	 });
	$('#export_btn').click( function () {
	 	export_chart();	 	
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
	 $('#bktjGrid').datagrid({    
		    url:'<%=request.getContextPath()%>/personInfo/testLevel?year1='+_t_start+'&year2='+_t_end, 
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
			     //{field:'index',title:'序列',width : $(this).width() * 0.05,align:'center'},    
		        {field:'LEVEL',title:'类型',width : $(this).width() * 0.4,align:'center'},    
		        {field:'num',title:'数量',width : $(this).width() * 0.4,align:'center'}
		  
		    ]]    
		});  
			var pager = $('#bktjGrid').datagrid('getPager');
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
			
		//获取统计年分、数量
	function statisticalByYear(_t_start,_t_end) {
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
		LEVEL = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/testLevel",
		async:false,
		data:{year1:_t_start,year2:_t_end},
			success:function(result){
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				LEVEL[i]=result[i].LEVEL;
				num[i]=result[i].num;
				}
	 		},
		});
		statistical();
		ccc();
	};
	statisticalByYear(_t_start,_t_end);		
			
	function statistical() {
		    // Build the chart
	        $('#container').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '报考层次统计'
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
	                name: '报考层次统计',
	                data: [[LEVEL[0],num[0]],
							[LEVEL[1],num[1]]
							]
	            }]
	        });
	    };
	    
	    		
		//页面类型
	var _t_start = $('#t_start').textbox('getValue');
	var _t_end = $('#t_end').textbox('getValue');
    
 	 
	 function create_chart() {
		_t_start = $('#t_start').textbox('getValue');
		_t_end = $('#t_end').textbox('getValue');
 		_t_start =_t_start.substring(0,10);
 		_t_end=_t_end.substring(0,10);
 		statisticalByYear(_t_start,_t_end);
 	
 	}
	
// 导出图表
	function export_chart() {		
		var t = {
					page_type : _page_type,
					time_type: _time_type,
					//file_type: _file_type,
					t_start: _t_start,
					t_end: _t_end
				}
		window.location.href = basePath+"xljy/tjExport"+"?"+urlEncode(t);
	}
	
});

var urlEncode = function (param, key, encode) {
  if(param==null) return '';
  var paramStr = '';
  var t = typeof (param);
  if (t == 'string' || t == 'number' || t == 'boolean') {
    paramStr += '&' + key + '=' + ((encode==null||encode) ? encodeURIComponent(param) : param);
  } else {
    for (var i in param) {
      var k = key == null ? i : key + (param instanceof Array ? '[' + i + ']' : '.' + i);
      paramStr += urlEncode(param[i], k, encode);
    }
  }
  return paramStr;
};
	



</script>


<body style="margin: 1px;">
 
<div>
统计日期：<input class="easyui-datetimebox" id="t_start" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;-&nbsp;<input class="easyui-datetimebox" id="t_end" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;&nbsp;
<!-- <select id="file_type" class="easyui-combobox" name="dept" style="width:100px;">   
     <option value="sj">实际档案</option> 
     <option value="all">全部档案</option>     
</select> -->
<a id="query_btn" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a><span style="color:red">(如有slice请先点灰)</span>
<br/>
<!-- <a id="export_btn" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">导出</a> -->

</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
    <div title="统计表" data-options="" style="overflow:auto;">   
            <table id="bktjGrid"></table>
    </div>   
    
</div>  

</body>
</html>
