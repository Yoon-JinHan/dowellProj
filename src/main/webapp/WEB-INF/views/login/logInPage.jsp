<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf" %>
<title>Login</title>

</head>
<body>
      <br><br>
      <div class="container text-center">
          <h1>로그인</h1><br>
      </div>
      <div class="container col-md-4">
	      <form class="px-4 py-3" action="/login" method="post">
	          <div class="form-group">
	              <label for="exampleDropdownFormEmail1">ID</label>
	              <input type="text" class="form-control" name="user_id" placeholder="ID">
	          </div>
	          <div class="form-group">
	              <label for="exampleDropdownFormPassword1">Password</label>
	              <input type="password" class="form-control" name="use_pwd" placeholder="Password">
	          </div>
	          <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	          	<font color="red">
	          		<p>로그인 실패<br>
	          		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
	          		<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
	          	</font>
	          	
	          </c:if>
	          <div class="form-group">
				<p>아이디/비밀번호를 잊으신 경우 관리자에게 문의하세요</p>
	          </div>
	          <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	          <button type="submit" class="btn btn-primary">로그인</button>
	      </form>
	      <div class="dropdown-divider"></div>
	      <!-- 
	      <a class="dropdown-item" href="#">New around here? Sign up</a>
	      <a class="dropdown-item" href="#">Forgot password?</a>
	       -->
	  </div>

</body>
</html>