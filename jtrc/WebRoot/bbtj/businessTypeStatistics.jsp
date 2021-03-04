<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>业务类型统计</title>

<script type="text/javascript">
$(function () {
    var ss; 
	var num;
	
	$('#query_btn').click( function () {
	 	create_chart();	 	
	 });
	
	var _t_start = $('#t_start').textbox('getValue');
	var _t_end = $('#t_end').textbox('getValue');
	
	
	
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
    
	 $('#sjdasltjGrid').datagrid({    
		    url:'<%=request.getContextPath()%>/typeInfo/businessTypeStatistics?year1='+_t_start+'&year2='+_t_end, 
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
			    // {field:'code1',title:'序列',width : $(this).width() * 0.05,align:'center'},    
		        {field:'ss',title:'类型',width : $(this).width() * 0.4,align:'center'},   
		        {field:'num',title:'人数',width : $(this).width() * 0.4,align:'center'}
		  
		    ]]    
		});  
			var pager = $('#sjdasltjGrid').datagrid('getPager');
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
	function statisticalByYear(_t_start,_t_end) {
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
		ss = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/typeInfo/businessTypeStatistics",
		async:false,
		data:{year1:_t_start,year2:_t_end},
			success:function(result){
				for(var i = 0 ;i<result.length;i++){
				ss[i]=result[i].ss;
				num[i]=result[i].num;
				}
	 		},
		});
		statistical();
		ccc();
	};
	statisticalByYear(_t_start,_t_end);


//统计图
	function statistical() {
    var colors = Highcharts.getOptions().colors,
        categories = ss,
        name = '图表',
        data = [{
                y: 11,
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
            data: num,
            color: '#7cb5ec'
        }],
        exporting: {
            enabled: false
        }
    }).highcharts(); // return chart
  };
  
  
  function create_chart() {
 
		_t_start = $('#t_start').textbox('getValue');
		_t_end = $('#t_end').textbox('getValue');
 		_t_start =_t_start.substring(0,10);
 		_t_end=_t_end.substring(0,10);
 		statisticalByYear(_t_start,_t_end);
 	
 	}
  
  
});


</script>


<body style="margin: 1px;">
 
<div>
统计日期：<input class="easyui-datetimebox" id="t_start" name="birthday" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;-&nbsp;<input class="easyui-datetimebox" id="t_end" name="birthday" size="20" data-options="required:false,showSeconds:false" value="" style="height:22px">
&nbsp;&nbsp;
<!-- <select id="time_type" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="year">年统计</option> 
     <option value="month">月统计</option>     
</select>  -->
&nbsp;&nbsp;
<!-- <select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
    <option value="aa">实际档案</option> 
     <option value="aa">全部档案</option>     
</select> -->
<a id="query_btn" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>

</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
    <div title="统计表" data-options="" style="overflow:auto;">   
            <table id="sjdasltjGrid"></table>
    </div>   
    
</div>  

</body>
</html>
