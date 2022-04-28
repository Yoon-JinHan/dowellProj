<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/include/header.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<style type="text/css">
	#logo{
		width:250x;
		height:50px;
	}
</style>
</head>
	<div class="col-lg-2 sidebar" style="height:100%;">
		<a href='/home' class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border"><img id="logo" alt="" src="https://www.dowellcom.co.kr/assets/img/logo.png"></a>
		<div class="bottom-border pb-3" style="text-align: center;">
			<p class="text-white"><sec:authentication property="principal.user.user_nm"/></p>
			<p class="text-white"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link" onclick="document.getElementById('logout').submit();">로그아웃</a></p>
			<form id="logout" action="/logout" method="POST">
		   		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			</form>
		</div>
		<ul class="navbar-nav flex-column mt-4">
			<li class="nav-item">
				<a href='/customer/list?prtcd=<sec:authentication property="principal.user.prt_cd"/>' class="nav-link text-white p-3 mb-2 sidebar-link">고객정보</a>
			</li>
			
			<li class="nav-item">
				<a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">매장정보</a>
			</li>
		</ul>
	</div>
	
</html>