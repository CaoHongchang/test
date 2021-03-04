<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>技术等级统计</title>

<script type="text/javascript">
$(function () {
	var level;
	var num;

		//获取统计年分、数量
	function statisticalByYear() {
		level = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/officialLevel",
		async:false,
			success:function(result){
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				level[i]=result[i].level;
				num[i]=result[i].num;
				}
	 		},
		});
		statistical();
	}
	statisticalByYear();	
			
		function statistical() {
		    // Build the chart
	        $('#container').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '技术等级统计'
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
	                name: '技术等级统计',
	                data: [[level[0],num[0]],
							[level[1],num[1]],
							[level[2],num[2]],
							[level[3],num[3]],
							[level[4],num[4]]
							]
	            }]
	        });
	    };
	
  
});





</script>


<body style="margin: 1px;">
 
<div>

</div>
<div id="pqtjTab" class="easyui-tabs" style="width:100%;height:95%;">   
    <div title="统计图" style="padding:20px;"><span style="color:red">(如有slice请先点灰)</span>
           <div id="container" style="min-width:400px;height:400px"></div>
    </div>   
    
</div>  

</body>
</html>
