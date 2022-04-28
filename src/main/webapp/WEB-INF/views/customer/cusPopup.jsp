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
<meta charset="UTF-8">
<title>고객조회</title>
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
	
	tbody > tr:hover{
		background-color: #c0c0c0;
		cursor: pointer;
	}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<h3>고객조회</h3>
		</div>
		<!-- top row end  -->
		<form action="/customer/cusPopup" method="get" name="customer" id="customer">
			<div class="row row-cols-2" id="middle">
				<div class="col-10">
					<div class="row row-cols-3">				
						<div class="col-4">			
							<label class="form-label">고객이름</label>
				  			<input type="text" class="form-control" id="name" name="name" pattern=".{2,}" title="2 characters minimum" autofocus="autofocus">
						</div>
						<div class="col-4">			
							<label class="form-label">핸드폰번호</label>
				  			<input type="text" class="form-control" id="mbl" name="mbl">
						</div>
						<div class="col-2">
						</div>
					</div>
				</div>
				<div class="col-2">
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
							<th>고객번호</th>
							<th>고객명</th>
							<th>핸드폰번호</th>
							<th>고객상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customer }" var="board">
							<tr ondblclick="transmit(this);">
								<fmt:setLocale value="en_US" scope="session"/>
								<td style="text-align:center;">
									<input class="form-check-input" type="checkbox" value="${board.no }" id="flexCheckDefault" onclick="clickCheck(this)" name="chk">
								</td>
								<td style="text-align:center;">
									<c:out value="${board.no }"/>
								</td>
								<td style="text-align:center;">
									<c:out value="${board.name }"/>
								</td>
								<td style="text-align:center;">
									<c:out value="${board.mbl }"/>
								</td>
								<td style="text-align:center;">
									<c:out value="${board.state }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- table col end -->
		</div>
		<!-- table row end -->
		<div class="row">
			<div class="row" style="background-color: #f0f0f0; text-align: center;">
				<div id="btndiv"><button id="close" onclick="window.close();">닫기</button> <button id="clickme">적용</button></div>
			</div>
		</div>
		<!-- button row end -->
	</div>
	<!-- container end -->
<script type="text/javascript">
	$("#clickme").click(function(){
		var checkbox=$("input[name=chk]:checked");
		var tr = checkbox.parent().parent();
		var td = tr.children('td');
		
		var no = td.eq(1).text().trim();
		var name = td.eq(2).text();
		
		$("#cusname", opener.document).text(name);
		$("input[name=cusno]", opener.document).attr("value", no);
		window.close();
	});
	
	function transmit(e){
		var td=$(e).children('td');
		var no = td.eq(1).text().trim();
		var name = td.eq(2).text();
		
		$("#cusname", opener.document).text(name);
		$("input[name=cusno]", opener.document).attr("value", no);
		window.close();
	}
	
	function clickCheck(target) {
	    document.querySelectorAll('input[type=checkbox]')
	        .forEach(el => el.checked = false);

	    target.checked = true;
	}
</script>
</body>
</html>