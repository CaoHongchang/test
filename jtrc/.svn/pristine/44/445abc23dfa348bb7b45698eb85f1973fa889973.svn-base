<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>派遣统计管理</title>

<script type="text/javascript">
$(function () {
 
	var chart;
	

	$('#query_btn').click( function () {
	 	create_chart();	 	
	 });
	$('#export_btn').click( function () {
	 	export_chart();	 	
	 });
    
	 $('#pqtjGrid').datagrid({    
		    url:'', 
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
			    {field:'index',title:'序列',width : $(this).width() * 0.05,align:'center'},    
		        {field:'name',title:'类型',width : $(this).width() * 0.4,align:'center'},    
		        {field:'y',title:'数量',width : $(this).width() * 0.4,align:'center'}	  
		    ]]    
		});  
			var pager = $('#pqtjGrid').datagrid('getPager');
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
			
	
	
    var colors = Highcharts.getOptions().colors,
        categories = [],
        name = '图表',
        data = [{
                y: 0,
                color: colors[0]
            }];

    function setChart(name, categories, data, color) {
	chart.xAxis[0].setCategories(categories, false);
	chart.series[0].remove(false);
	chart.addSeries({
		name: name,
		data: data,
		color: color || 'white'
	}, false);
	chart.redraw();
    }

    chart = $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            title: {
                text: ''
            }
        },
        plotOptions: {
            column: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function() {
                           /* var drilldown = this.drilldown;
                            if (drilldown) { // drill down
                                setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                            } else { // restore
                                setChart(name, categories, data);
                            }*/
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    color: colors[0],
                    style: {
                        fontWeight: 'bold'
                    },
                    formatter: function() {
                        return this.y ;
                    }
                }
            }
        },
        tooltip: {
            formatter: function() {
                return this.point.y;
            }
        },
        series: [{
            name: name,
            data: data,
            color: 'white'
        }],
        exporting: {
            enabled: false
        }
    }).highcharts(); // return chart
    
	//页面类型
	var _page_type = '${page_type}';

	var _time_type = $('#time_type').combobox("getValue");
	var _t_start = $('#t_start').textbox('getValue');
	var _t_end = $('#t_end').textbox('getValue');
    
  
	
    // 创建图表
	function create_chart() {
 
		_time_type = $('#time_type').combobox("getValue");
		_t_start = $('#t_start').textbox('getValue');
		_t_end = $('#t_end').textbox('getValue');
 
		$.getJSON( "../rckbb/tjbb.json",
				{
					page_type : _page_type,
					time_type: _time_type,
					t_start: _t_start,
					t_end: _t_end
				},
				function(data){
					var xatrnames = [];
					var yvalidators = [];
					
					for (var i = 0; i < data.rows.length; i++) {						
						var _month = ""
						if  (data.rows[i].month)
						{
							_month =  "-" + data.rows[i].month;
						}						
						var _name = data.rows[i].name + _month;
						
						xatrnames.push( _name );
						yvalidators.push({
									index: i+1,
									name:_name,
									y:parseInt(data.rows[i].num),
			                		color: colors[i]
								});			
					}
					var datagrid_data = {
						total:data.rows.length,
						rows: yvalidators
					};
					//填充表格数据
					$('#pqtjGrid').datagrid('loadData',datagrid_data );

					var series= chart.series; 
					if(yvalidators.length){
						if (series){
							//先清除所有x轴 再添加
							while(series.length > 0) {
								series[0].remove(false);
							}
						}
					    //添加数据
						chart.addSeries({
							name: name,
							data: yvalidators,
							color: 'white'
						},false);
						chart.xAxis.categories = xatrnames;
						chart.redraw();//重绘		
					}				
				});
  	}
    
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
	
	
	
	// 导出图表
	function export_chart() {		
		var t = {
					page_type : _page_type,
					time_type: _time_type,
					t_start: _t_start,
					t_end: _t_end
				}
		window.location.href = basePath+"rckbb/tjExport"+"?"+urlEncode(t);
	}
    
	

});

</script>


<body style="margin: 1px;">
 
<div>
统计日期：<input class="easyui-datetimebox" id="t_start" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;-&nbsp;<input class="easyui-datetimebox" id="t_end" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;&nbsp;
<select id="time_type" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="year">年统计</option> 
    <option value="month">月统计</option>     
</select>
&nbsp;&nbsp;
<a id="query_btn" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
<br/>
<a id="export_btn" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">导出</a>

</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
    <div title="统计表" data-options="" style="overflow:auto;">   
            <table id="pqtjGrid"></table>
    </div>   
    
</div>  

</body>
</html>
