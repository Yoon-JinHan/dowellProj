<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>Start Page</title>
<style>
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row" style="text-align: right;">		
			<a href='<c:url value="/login/logInPage"/>' >로그인</a>
		</div>
		<div class="row" style="text-align: center; height: 400px; background-color: #8AE634; line-height: 400px;">
			<p style="font-size : 40px; color: white; font-weight: bold;">관리 시스템</p>
		</div>
	</div>
</body>
</html>