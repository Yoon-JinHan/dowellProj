<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/include/header.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<head>
<style type="text/css">
	.container-fluid{
		margin: 10px;
	}
	
	#middle{
		background-color: #f0f0f0;
		border-style: solid;
		border-width:thin;
		height: 100px;
		width: 100%;
		margin-bottom:20px;
	}
	
	#middle>div{
		margin : auto;
	}
	
	#btndiv{
		display: inline-block;
		margin: 10px;
	}
	
	#btndiv > button{
		padding : 5px;
		width : 70px;
		height : 50px;
	}
	
	#submitbtn{
		width:50px;
		height:50px;
	}
</style>
<meta charset="UTF-8">
<title>매장조회</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<h3>매장조회</h3>
		</div>
		<!-- top row end  -->
		<form action="/customer/prtPopup" method="get" name="prt" id="prt">
			<div class="row row-cols-2" id="middle">
				<div class="col-10">
					<div class="row row-cols-2">				
						<div class="col-2">			
							<div style="display: inline-block;">매장</div>
						</div>
						<div class="col-4">
					  		<input type="text" class="form-control" id="keyword" name="keyword" autofocus="autofocus">
						</div>
					</div>
				</div>
				<div class="col-2" style="text-align: right;">
					<button id="submitbtn" type="submit"><i class="bi bi-search"></i></button>
				</div>
			</div>
		</form>
		<!-- middle row end  -->
		<div class="row row-cols-2">
			<div class="col-10">
				<table class="table table-bordered">
					<thead style="text-align:center;">
						<tr>
							<th>선택</th>
							<th>매장코드</th>
							<th>매장명</th>
							<th>매장상태</th>
						</tr>
					</thead>
					<c:forEach items="${prt }" var="board">
						<tr>
							<fmt:setLocale value="en_US" scope="session"/>
							<td style="text-align:center;">
								<input class="form-check-input" type="checkbox" value="${board.cd }" name="chk" id="flexCheckDefault" onclick="clickCheck(this)">
							</td>
							<td style="text-align:center;">
								<c:out value="${board.cd }"/>
							</td>
							<td style="text-align:center;">
								<c:out value="${board.name }"/>
							</td>
							<td style="text-align:center;">
								<c:out value="${board.state }"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- table col end -->
		</div>
		<!-- table row end -->
		<div class="row" style="background-color: #f0f0f0; text-align: center;">
			<div id="btndiv"><button id="close" onclick="window.close();">닫기</button> <button id="clickme">적용</button></div>
		</div>
		<!-- button row end -->
		<p id="debug"></p>
	</div>
	<!-- container end -->
<script type="text/javascript">
	$("#clickme").click(function(){
		var checkbox=$("input[name=chk]:checked");
		var tr = checkbox.parent().parent();
		var td = tr.children('td');
		
		var cd = td.eq(1).text().trim();
		var name = td.eq(2).text();
		
		$("#prtcode", opener.document).text(cd);
		$("#prtname", opener.document).text(name);
		$("input[name=cusprt]", opener.document).attr("value", cd);
		window.close();
	});

	function chk_form(){
		document.getElementById('prt').submit();
	}
	
	function clickCheck(target) {
	    document.querySelectorAll('input[type=checkbox]')
	        .forEach(el => el.checked = false);

	    target.checked = true;
	}
</script>
</body>
</html>