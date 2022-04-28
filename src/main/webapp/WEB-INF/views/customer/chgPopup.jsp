<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객변경이력</title>
<%@ include file="/WEB-INF/include/header.jspf" %>
<style type="text/css">
	.container-fluid{
		margin: 10px;
	}
	
	#top{
		background-color: #f0f0f0;
		border-style: solid;
		border-width:thin;
		height: 60px;
		width: 100%;
		margin-bottom:20px;
		display: flex;
		align-items: center;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row" id="top">
			<p>고객 <c:out value="${chg[0].cusno }"/> <c:out value="${chg[0].name }"/> </p>
		</div>
		<div class="row">
			<table class="table table-bordered">
				<thead style="text-align:center;">
					<tr>
						<th>변경일자</th>
						<th>변경항목</th>
						<th>변경전</th>
						<th>변경후</th>
						<th>수정자</th>
						<th>수정일시</th>
					</tr>
				</thead>
				<c:if test="${empty chg[0] }">
					<tr>
						<td colspan="6" style="text-align : center;">
							변경사항 없음
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty chg[0] }">
					<c:forEach items="${chg }" var="board">
						<tr>
							<td><c:out value="${board.chgdt }"/></td>
							<td><c:out value="${board.chgnm }"/></td>
							<td><c:out value="${board.before }"/></td>
							<td><c:out value="${board.after }"/></td>
							<td><c:out value="${board.userid }"/>/<c:out value="${board.uname }"/></td>
							<td><fmt:formatDate value="${board.regdt }" pattern="yyyy-MM-dd HHmmss"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>