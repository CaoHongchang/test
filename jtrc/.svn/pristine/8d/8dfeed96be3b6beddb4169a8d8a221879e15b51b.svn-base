<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%

String sessionUserId = session.getAttribute("uid")==null?"":session.getAttribute("uid").toString(); //session中获取用户id 
String sessionUserName = session.getAttribute("userName")==null?"":session.getAttribute("userName").toString(); //session中获取用户name 
String sessionRealName = session.getAttribute("realName")==null?"":session.getAttribute("realName").toString(); //session中获取用户姓名 


String path = request.getContextPath();
String domainAndPort = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="sys_title" value="交通人才管理系统"></c:set>
