<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
<title>考务材料</title>

<body>
<form id="fm" method="post">
    <div id="print_div">
    <style type="text/css">
	.table4{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#FFFFFF;margin:0 0 0 5;}
	.table4 th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 5px;}
	.table4 th{font-weight:bold;background:#ccc;}
	</style>
		<div style="text-align:center;">
			<label id="title" style="font-size:20px;"></label>
		</div>
	   <table class="table4">
	   		<tbody id="zxbmTbody">
			</tbody>
    	</table> 
    </div>               
    </form> 
<script type="text/javascript">
var id = "<%=request.getParameter("id").toString()%>";
var ksh = "<%=request.getParameter("ksh").toString()%>";
var type = "<%=request.getParameter("type").toString()%>";

$(function(){
	$.ajax({
		url:'../bgActivityUserInfo/userList?id='+id+'&ksh='+ksh,     //请求的url地址
	    dataType: "json",   //返回格式为json
	    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	    type: "POST",   //请求方式
	    success: function(data) {
	    	if(null != data) {
	    		var json = eval(data.rows);
	    		if(type == '1') {
	    			$("#title").html("第"+ksh+"考场考生名单");
		    		$("#zxbmTbody").html("");
		    		var tabObj = $("#zxbmTbody");
		    		var html;
		    			html = "<tr><td style='width:80;' >座位号</td><td style='width:220;' >准考证号</td><td  style='width:150;'>姓名</td><td style='width:80;' >座位号</td><td style='width:220;' >准考证号</td><td  style='width:150;'>姓名</td></tr>";
		    			for(var i = 0; i < Math.round(json.length/2); i++) {
		    				if((Math.round(json.length/2)+i) < json.length) {
		    					html += "<tr><td>"+json[i].zwh+"</td><td>"+json[i].zkzh+"</td><td>"+json[i].xm+"</td><td>"+json[Math.round(json.length/2)+i].zwh+"</td><td>"+json[Math.round(json.length/2)+i].zkzh+"</td><td>"+json[Math.round(json.length/2)+i].xm+"</td></tr>";
		    				} else {
		    					html += "<tr><td>"+json[i].zwh+"</td><td>"+json[i].zkzh+"</td><td>"+json[i].xm+"</td></tr>";
		    				}
			    			
				    	}
		    		
		    		
		    		$("#zxbmTbody").html(html);
	    		} else if(type == '2') {
	    			$("#title").html("第"+ksh+"考场人员信息核对表");
		    		$("#zxbmTbody").html("");
		    		var tabObj = $("#zxbmTbody");
		    		var html = "";
		    		for(var i = 0; i < json.length; i++) {
		    			
		    			if(i != json.length - 1) {
		    				
		    				html += "<tr><td style='width:120;height:120;'><img style='width:120;height:120;' src='<%=basePath%>/"+json[i].tx+"'  border='1'></td>";
			    			html += "<td style='width:180;'>"+json[i].xm+"<br>身份证号："+json[i].sfzh+"<br>准考证号："+json[i].zkzh+"<br>座位号："+json[i].zwh+"</td>";
			    			//html += "<td style='width:5;'></td>";
			    			html += "<td style='width:120;height:120;'><img style='width:120;height:120;' src='<%=basePath%>/"+json[i+1].tx+"'  border='1'></td>";
			    			html += "<td style='width:180;'>"+json[i+1].xm+"<br>身份证号："+json[i+1].sfzh+"<br>准考证号："+json[i+1].zkzh+"<br>座位号："+json[i+1].zwh+"</td>";
			    			//html += "<tr style='height:5%;'><td></td><td></td><td></td><td></td><td></td></tr>"
			    			if(json[i+2]!='' && json[i+2] != null && json[i+2] != 'undefined') {
				    			html += "<td style='width:120;height:120;'><img style='width:120;height:120;' src='<%=basePath%>/"+json[i+2].tx+"'  border='1'></td>";
				    			html += "<td style='width:180;'>"+json[i+2].xm+"<br>身份证号："+json[i+2].sfzh+"<br>准考证号："+json[i+2].zkzh+"<br>座位号："+json[i+2].zwh+"</td></tr>";
			    			}
		    			} else {
		    				html += "<tr><td style='width:120;height:120;'><img style='width:120;height:120;' src='<%=basePath%>/"+json[i].tx+"'  border='1'></td>";
			    			html += "<td style='width:180;'>"+json[i].xm+"<br>身份证号："+json[i].sfzh+"<br>准考证号："+json[i].zkzh+"<br>座位号："+json[i].zwh+"</td></tr>";
		    			}	
		    				
		    			i = i+2;
		    			
			    	}
	    		
	    		$("#zxbmTbody").html(html);
	    		
	    		} else if(type == '3') {
	    			$("#title").html("第"+ksh+"考场桌贴");
		    		$("#zxbmTbody").html("");
		    		var tabObj = $("#zxbmTbody");
		    		var html = "";
		    		
		    		for(var i = 0; i < json.length; i++) {
		    			if(i != json.length - 1) {
		    				html += "<tr><td style='width:310;'>考室号   ：第"+ksh+"考场<br>姓  名   ："+json[i].xm+"<br>座位号   ："+json[i].zwh+"<br>身份证号："+json[i].sfzh+"<br>准考证号："+json[i].zkzh+"</td>";
		    				//html += "<td style='width:50;'></td>";
		    				html += "<td style='width:310;'>考室号   ：第"+ksh+"考场<br>姓  名   ："+json[i+1].xm+"<br>座位号   ："+json[i+1].zwh+"<br>身份证号："+json[i+1].sfzh+"<br>准考证号："+json[i+1].zkzh+"</td>";
		    				//html += "<tr style='height:5%;'><td></td><td></td><td></td></tr>"
		    				if(json[i+2]!='' && json[i+2] != null && json[i+2] != 'undefined') {
			    				html += "<td style='width:310;'>考室号   ：第"+ksh+"考场<br>姓  名   ："+json[i+2].xm+"<br>座位号   ："+json[i+2].zwh+"<br>身份证号："+json[i+2].sfzh+"<br>准考证号："+json[i+2].zkzh+"</td></tr>";
		    				}
		    			} else {
		    				html += "<tr><td style='width:310;'>考室号   ：第"+ksh+"考场<br>姓  名   ："+json[i].xm+"<br>座位号   ："+json[i].zwh+"<br>身份证号："+json[i].sfzh+"<br>准考证号："+json[i].zkzh+"</td></tr>";
		    			}
		    			
		    			i = i+2;
		    			
			    	}
		    		$("#zxbmTbody").html(html);
	    		}
	    		
	    	}
	    	
	    	
	    }
	});
});	
	
	
function printFuc(){
	//var bdhtml=window.document.body.innerHTML;//获取当前页的html代码 
	window.document.body.innerHTML=$("#print_div").html();//需要打印的页面 
	window.print(); 
	location.replace("./kwclglIndex.jsp?id="+id);
	//location.reload();//还原界面 
}
</script>
</body>

</html>
