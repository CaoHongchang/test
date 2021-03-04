<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp" %>


<html>
<head>
<title>档案类型统计管理</title>

<script type="text/javascript">
$(function () {
		$.ajax({
			url:"<%=path%>/safetyProductionConsultController/countByYear",
			type:"POST",
			cache: false,
			success:function(data){
                 var years = data.years;
                 var values = data.values;
                 alert(data.years);
                 alert(data.values);
              // Build the chart
                 $('#container').highcharts({
                 	chart: {  
         	            renderTo: 'container',  
         	            type: 'column',  
         	            margin: [ 50, 50, 100, 80]  
         	        },  
                     title: {
                         text: '咨询企业统计'
                     },
                     tooltip: {
                         pointFormat: '{series.name}</b>'
                     },
                     xAxis: {  
                         categories: years
                     },  
                     yAxis: {  
                         min: 0,  
                         title: {  
                             text: '总数'  
                         }  
                     },  
                     series: [{  
                         name: '年份',  
                         data: [['上海', 24.25],['上海', 24.25]],
                         dataLabels: {  
                             enabled: true,  
                             rotation: -90,  
                             color: '#FFFFFF',  
                             align: 'right',  
                             x: 4,  
                             y: 10,  
                             style: {  
                                 fontSize: '13px',  
                                 fontFamily: 'Verdana, sans-serif'  
                             }  
                         }  
                     }]  
                 });
			},
			error:function(e){
				$.messager.alert('错误','系统异常');
			}
			
		});
});


    function exportList(){
        window.location.href = "<%=path%>/safetyProductionConsultController/exportList";
    }


</script>


<body style="margin: 1px;">
    <div title="统计图" style="padding:20px;">   
           <div id="container" style="min-width:400px;height:400px"></div>
    </div> 
    <div style="padding:20px;">   
          <span style="align:center;text-align: center;"><a  class="easyui-linkbutton" href="javascript:exportList();"  data-options="iconCls:'icon-print'">导出</a></span>
    </div>  
</body>
</html>
