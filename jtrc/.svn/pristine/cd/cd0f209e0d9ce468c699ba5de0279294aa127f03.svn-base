<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>奖惩统计</title>

<script type="text/javascript">
$(function () {
	var LEVEL;
	var num;

		//获取统计年分、数量
	function statisticalByYear() {
		LEVEL = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/officialRewardsAndPunishments",
		async:false,
			success:function(result){
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				LEVEL[i]=result[i].LEVEL;
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
	                text: '奖惩统计'
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
	                name: '奖惩统计',
	                data: [[LEVEL[0],num[0]],
							[LEVEL[1],num[1]],
							[LEVEL[2],num[2]],
							[LEVEL[3],num[3]],
							[LEVEL[4],num[4]],
							[LEVEL[5],num[5]],
							[LEVEL[6],num[6]],
							[LEVEL[7],num[7]],
							[LEVEL[8],num[8]],
							[LEVEL[9],num[9]],
							[LEVEL[10],num[10]],
							[LEVEL[11],num[11]],
							[LEVEL[12],num[12]]
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
