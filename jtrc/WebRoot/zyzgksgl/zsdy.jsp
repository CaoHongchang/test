<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/system/common.jsp"%>

<html>
  <head>
    <title>证书打印</title>
    <script type="text/javascript">
    var id = "<%=request.getParameter("id").toString()%>";
    $( function() {
    	$.ajax({
			url : "../examCertificateInfo/printInfo?id="+id,
			dataType: "json",   //返回格式为json
		    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		    type: "POST",   //请求方式
			success : function(data) {
    			if (data.flag == true) {
    				if(data.info.certificate_type=='安全三类人员'){
    					$("#print1").show();
    					$("#print2").hide();
    					var content = '<div><ul>';
    					content += '<li>'+ data.info.user_name+'</li>';
    					content += '<li>'+ data.info.sex+'</li>';
    					content += '<li>'+ data.info.birth_date+'</li>';
    					content += '<li>'+ data.info.card_id+'</li>';
        				content += '<li>'+ data.info.work_name+'</li>';
        				content += '<li>'+ data.info.place_name +'</li>';
        				content += '<li>'+ data.info.certificate_num +'</li>';
        				content += '<li>'+ data.info.certificate_time +'</li>';
        				content += '<li>'+ data.info.expiry_date +'</li></ul></div>';
        				$("#print1").html(content);
    				}else if(data.info.certificate_type=='安全考评员'){
    					$("#print2").show();
    					$("#print1").hide();
    					var content = '<div><ul>';
    					content += '<li>'+ data.info.user_name+'</li>';
    					content += '<li>'+ data.info.card_id+'</li>';
        				content += '<li>'+ data.info.certificate_num +'</li>';
        				content += '<li>'+ data.info.certificate_time +' '+ data.info.expiry_date +'</li></ul></div>';
        				$("#print2").html(content);
    				}
    			} else {
    				alert(data.cause);
    			}
    		},
    		error : function() {
    			//请求出错处理
    		}
    	});
    });


    function printFun() {
    	window.document.body.innerHTML=$("#print_div").html();//需要打印的页面 
    	window.print(); 
    }
    </script>
  </head>
  <body>
  	<div id="print_div">
	  	<div id="print1"></div>
	  	<div id="print2"></div>
  	</div>
  </body>
</html>
