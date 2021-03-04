<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>人事外包统计管理</title>

<script type="text/javascript">
$(function () {
	var num= new Array();

//获取统计年分、数量
	function statisticalByYear() {
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/officialCertificate",
		async:false,
			success:function(result){
				num=result;
	 		},
		});
		statistical();
	}
	statisticalByYear();


//统计图
	function statistical() {
    var colors = Highcharts.getOptions().colors,
        categories = ["奖惩证书","技术等级证书","职业资格证书","专业技术职务资格证书","特殊津贴证书","学历证书","学位证书"],
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
  
  

  
});


</script>


<body style="margin: 1px;">
 
<div>
</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
</div>  

</body>
</html>
