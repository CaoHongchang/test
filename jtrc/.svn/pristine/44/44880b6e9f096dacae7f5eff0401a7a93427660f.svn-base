<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
<title>欢迎登录后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.tmpl.min.js"></script>
<script language="javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
        $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
var submit = false;
   function login() {
	
	var staffCode = $.trim($("#staffCode").val());
	var password = $.trim($("#password").val());
    var code = $.trim($("#yzcode").val());
	
	if (submit) {
		return false;
	}
	
	submit = true;
	
	
	if (!checkNull(staffCode, password,code)) {
	    changeImg();
		submit = false;
		return;
	}
	$.post('./users/login',{username:staffCode,password:password,code:code},getStaff4loginCallBack,"json");
}
//空串判断
function checkNull(staffCode, password,code) {
	
	if ("" == staffCode) {
		alert("请输入工号！");
		$("#staffCode").focus();
		
		return false;
	}
	
	if ("" == password) {
		alert("请输入密码！");
		$("#password").focus();
		
		return false;
	}
	if ("" == code) {
		alert("请输入验证码！");
		$("#yzcode").focus();
		
		return false;
	}
	return true;
}
//登录回调
function getStaff4loginCallBack(data) {
    submit = false;
/*     if(!data)
    {
        alert("用户已在线，请先退出之前用户!");
        changeImg();
        submit = false;
        return;
    } */
	if (data.flag == 0) {
	
		if(data.userState==2){
		      alert("验证码错误！");
		}else{
			alert("登录失败,请检查用户名和密码是否有误!");
		}	
		changeImg();
		submit = false;
		return;
	}
/* 	else if (data.flag == 2) {
		alert("用户已在线，请先退出之前用户!");
		changeImg();
        submit = false;
		return;
	}  */
	else {	
		//指向首页
		window.location='main.jsp';
	}
}
function changeImg() {
	
	var src = $("#imgObj").attr("src");;
	 $("#imgObj").attr("src", chgUrl(src));
}

 function test() {
	
	
	$.post('./archivesBaseInfoTrol/test',{},df,"json");
}
function df(){
	
}
//时间戳   
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
function chgUrl(url) {
	var timestamp = (new Date()).valueOf();
	url = url.substring(0, 17);
	if ((url.indexOf("&") >= 0)) {
		url = url + "×tamp=" + timestamp;
	} else {
		url = url + "?timestamp=" + timestamp;
	}
	return url;
}
</script> 


<script language="JavaScript">
function keyLogin(){
   if (event.keyCode==13){  //回车键的键值为13
   		document.getElementById("login").click(); //调用登录按钮的登录事件
	}
}
</script>

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <!-- 
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>     -->
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul onkeydown="keyLogin();">
    <li><input id="staffCode" name="staffCode" type="text" class="loginuser" value="" onclick="JavaScript:this.value=''"/></li>
    <li><input id="password" name="password" type="password" class="loginpwd"  onclick="JavaScript:this.value=''"/></li>
    <li style="line-height:30px">验证码：<input id="yzcode" type="text" name=""  value="" onclick="JavaScript:this.value=''" style="height:30px;border:1px solid #aaa;" /><img id="imgObj" alt="验证码" src="xm/code" onclick="changeImg()" style="position: relative;top: 11px;left: 10px;" />
    <li><input id="login"  name="" type="button" class="loginbtn" value="登录"  onclick="login()"  /><!-- <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label> --><label><a href="#">忘记密码？</a></label></li>
    <input id="test"  name="" type="button" class="loginbtn" value="检测"  onclick="test()"  />
    </ul>
    
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有   </div>
	
    
</body>

</html>
