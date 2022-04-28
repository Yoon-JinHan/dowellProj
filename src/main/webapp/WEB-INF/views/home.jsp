<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<%@ include file="/WEB-INF/include/header.jspf" %>
<head>
	<title>Home</title>
</head>
<style>
	a{
		text-decoration: none;
	}
	
	.wrap{
		height: 720px;
	}
</style>
<body>
<div class="wrap">
	<div class="container-fluid" style="height: 100%;">	
		<div class="row row-cols-2" style="height:100%;">		
			<%@include file="/WEB-INF/include/sidebar.jsp" %>
			<div class="col" style="height: 720px;">			
				<h1>
					메인페이지
				</h1>
			</div>
		</div>
	</div>
</div>
</body>
</html>
