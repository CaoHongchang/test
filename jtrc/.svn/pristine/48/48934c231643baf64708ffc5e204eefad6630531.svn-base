<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>专业技术统计</title>

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
		url:"/jtrc/personInfo/officialProfessionalLevel",
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
	                text: '专业技术统计'
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
	                name: '专业技术统计',
	                data: [[LEVEL[0],num[0]],
							[LEVEL[1],num[1]],
							[LEVEL[2],num[2]]
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
