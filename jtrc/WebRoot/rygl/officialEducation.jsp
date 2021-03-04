<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>学历统计管理</title>

<script type="text/javascript">
$(function () {
	var education;
	var num;

		//获取统计年分、数量
	function statisticalByYear() {
		education = new Array();
		num  = new Array();
		$.ajax({
		type:"POST", 
		url:"/jtrc/personInfo/officialEducation",
		async:false,
			success:function(result){
			console.log(result);
				for(var i = 0 ;i<result.length;i++){
				education[i]=result[i].education;
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
	                text: '学历统计'
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
	                data: [[education[0],num[0]],
							[education[1],num[1]],
							[education[2],num[2]],
							[education[3],num[3]],
							[education[4],num[4]],
							[education[5],num[5]],
							[education[6],num[6]],
							[education[7],num[7]],
							[education[8],num[8]],
							[education[9],num[9]],
							[education[10],num[10]],
							[education[11],num[11]]
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
