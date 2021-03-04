<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>学位统计管理</title>

<script type="text/javascript">
$(function () {
	var degree;
	var num;
	
	
    		
			
		//获取统计年分、数量
	function statisticalByYear() {
		degree = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/officialDegree",
		async:false,
			success:function(result){
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				degree[i]=result[i].degree;
				num[i]=result[i].num;
				}
	 		},
		});
		console.log(degree);
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
	                text: '学位统计'
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
	                name: '学历统计',
	                data: [[degree[0],num[0]],
							[degree[1],num[1]],
							[degree[2],num[2]],
							[degree[3],num[3]],
							[degree[4],num[4]],
							[degree[5],num[5]],
							[degree[6],num[6]],
							[degree[7],num[7]],
							[degree[8],num[8]],
							[degree[9],num[9]],
							[degree[10],num[10]],
							[degree[11],num[11]]
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
