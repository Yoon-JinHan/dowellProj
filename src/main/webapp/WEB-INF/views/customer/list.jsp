<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/include/header.jspf" %>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom_datepicker.js"></script>
<meta charset="UTF-8">
<style>
	.row-cols-2>.col-2{
		text-align: center;
		vertical-align: middle;
	}
	.wrap{
		height: 720px;
	}

</style>
<title>CustomerList</title>
</head>
<body>
<div class="wrap">
	<div class="container-fluid"  style="height:100%;">
		<div class="row row-cols-2" style="height:100%;">
			<%@include file="/WEB-INF/include/sidebar.jsp" %>
			<div class="col-lg-9" style="margin:20px;">
				<div class="row row-cols-auto">
					<div class="col">
						<h3 class="page-header">고객조회</h3>
					</div>
					<div class="col">
						<h3><a href="/customer/list?prtcd=<sec:authentication property="principal.user.prt_cd"/>"><i class="bi bi-arrow-clockwise"></i></a></h3>
					</div>
				</div>
				<!-- 고객조회 타이틀 row END-->
				<p></p>
				<form action="/customer/list" method="get" name="list" id="list">
					<div class="row row-cols-2 align-items-center" style="border-style:solid; border-width:thin; height: 100px; background-color: #f0f0f0;">
						<div class="col-11" style="margin-bottom: 3px;">			
							<div class="row row-cols-2 align-items-center">
								<div class="col">
									<div class="row row-cols-2">
										<div class="col-3">매장</div>
										<input type="hidden" id="prtcd" name="prtcd" value="${param.prtcd}" >
										<input type="text" id="cusprt" name="cusprt" style="display:none;">
										<div class="col-8">
											<sec:authentication property="principal.user.auth" var="role"/>
											<!-- 권한에 따른 버튼 활성화 -->
											<c:choose>
												<c:when test="${role eq 'ROLE_ADMIN'}">
													<span id="prtcode" style="border-style: solid; display: inline-block; width: 30%; border-width: thin;vertical-align: middle; background-color: #7f7f7f;">
														<sec:authentication property="principal.user.prt_cd"/>
													</span><button id="prtCd" style="vertical-align: middle; width: 28px; height: 28px; text-align: center;"><i class="bi bi-front"></i></button> <span id="prtname" style="border-style: solid; display: inline-block; width: 40%; border-width: thin; vertical-align: middle;"> <sec:authentication property="principal.user.prt_nm"/> </span>												
												</c:when>
												<c:otherwise>												
													<span style="border-style: solid; display: inline-block; width: 30%; border-width: thin;vertical-align: middle; background-color: #7f7f7f;">
														<sec:authentication property="principal.user.prt_cd"/>
													</span><button id="prtCd" style="vertical-align: middle; width: 28px; height: 28px; text-align: center;" disabled="disabled"><i class="bi bi-front"></i></button> <span style="border-style: solid; display: inline-block; width: 40%; border-width: thin; vertical-align: middle;"> <sec:authentication property="principal.user.prt_nm"/> </span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								<!-- 매장 col end-->
								<div class="col">
									<div class="row row-cols-2">
										<div class="col-3">고객번호</div>
										<!-- <input type="hidden" id="cusno" name="cusno"> -->
										<div class="col-8">
											<input type="text" id="cusno" name="cusno" style="border-style: solid; display: inline-block; width: 30%; border-width: thin; vertical-align: middle; background-color: #7f7f7f;" value="" readonly="readonly"><button id="customerSearchBtn" style="width:28px; height:28px; vertical-align: middle; text-align: center;"><i class="bi bi-search"></i></button> <span id="cusname" style="border-style: solid; display: inline-block; width: 40%; border-width: thin;vertical-align: middle;">이름</span>
										</div>
									</div>
								</div>
								<!-- 고객번호 col end -->
							</div>
							<!-- form div 1st row end -->
							<p></p>
							<div class="row row-cols-2 align-items-center">
								<div class="col">
									<div class="row row-cols-2">
										<div class="col-3" style="vertical-align:middle;"><span style="color: red;">&bull;</span>고객상태</div>
										<div class="col-8">
											<div class="row row-cols-4">
												<div class="col">
														<label class="radio-inline">
															<input type="radio" name="state" id="inlineRadio1" value="0" checked="checked">전체
														</label>
												</div>
												<div class="col">
													<label class="radio-inline">
												  		<input type="radio" name="state" id="inlineRadio2" value="10">정상
													</label>
												</div>
												<div class="col">
													<label class="radio-inline">
												 		<input type="radio" name="state" id="inlineRadio3" value="80">중지
													</label>
												</div>
												<div class="col">
													<label class="radio-inline">
														  <input type="radio" name="state" id="inlineRadio4" value="90">해지
													</label>
												</div>
											</div>
										</div>
									</div>
									<!-- 고객상태 col end -->
								</div>
								<div class="col">
									<div class="row row-cols-2">
										<div class="col-3" ><span style="color: red; display:inline-block; vertical-align: midlle;">&bull;</span>가입일자</div>
										<div class="col-8">
											<input type="text" id="sdate" style="width: 30%; vertical-align: middle;" name="start">
											<input type="text" id="edate" style="width: 30%; vertical-align: middle;" name="end">
										</div>
									</div>
								</div>
								<!-- 가입일자 col end -->
							</div>
							<!-- form div 2nd row end -->
						</div>
						<!-- col-10 END -->
						<div class="col-1" style="text-align: right">
							<button id="submitbtn" type="submit"><i class="bi bi-search"></i></button>
						</div>
						<!-- col-2 END -->
					</div>
					<!-- row row-cols-2 END-->
				</form>
				<div class="row">
					<p></p>
					<p style="text-align: right"><button><i class="bi bi-front"></i>신규등록</button></p>
				</div>
				<!-- row END-->
				
				<div class="row" style="overflow: auto; max-height:480px;">
					<table class="table table-bordered">
						<thead style="text-align:center;">
							<tr>
								<th>고객번호</th>
								<th>고객이름</th>
								<th>휴대폰번호</th>
								<th>고객상태</th>
								<th>가입일자</th>
								<th>가입매장</th>
								<th>등록자</th>
								<th>수정일자</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="board">
							<tr>
								<%-- <fmt:setLocale value="en_US" scope="session"/> --%>
								<td style="text-align:left;">
									<div class="row row-col-2">
										<div class="col-6">
											<c:out value="${board.no }"/>
										</div>
										<div class="col-6">										
											<button onclick="cusChgPopup(this);">변경이력</button>
										</div>
									</div>
								</td>
								<td style="text-align:left;">
									<c:set var="nameleng" value="${fn:length(board.name) }"/>
									<c:set var="namecnt" value="${fn:length(board.name)-2 }"/>
									<c:choose>
										<c:when test="${nameleng eq 2 }">${fn:substring(board.name,0,1) }*</c:when>
										<c:otherwise>${fn:substring(board.name,0,1) }<c:forEach begin="1" end="${namecnt }">*</c:forEach>${fn:substring(board.name,nameleng-1,nameleng) }</c:otherwise>
									</c:choose>
									<span style="float:right"><button>상세</button></span>
								</td>
								<c:set var="length" value="${fn:length(board.mbl)}"/>
								<c:choose>
									<c:when test="${length eq 10}"><td style="text-align:center;">${fn:substring(board.mbl,0,3)}-***-${fn:substring(board.mbl,6,10) }</td></c:when>
									<c:otherwise><td style="text-align:center;">${fn:substring(board.mbl,0,3)}-****-${fn:substring(board.mbl,7,11) }</td></c:otherwise>
								</c:choose>
								<td style="text-align:center;"><c:out value="${board.state }"/></td>
								<fmt:parseDate value="${board.joindt}" var="postDate" pattern="yyyyMMdd"/>
								<td style="text-align:center;"><fmt:formatDate value="${postDate }" pattern="yyyy-MM-dd"/></td>
								<td style="text-align:left;"><c:out value="${board.prt }"/></td>
								<td style="text-align:left;"><c:out value="${board.reg }"/></td>
								<td style="text-align:center;"><fmt:formatDate value="${board.upd }" pattern="yyyy-MM-dd HHmmss"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- row END-->
			</div>
		</div>
	</div>
	<!-- container END -->
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var param=getParam('state');
		var startDay=getParam('start');
		var endDay=getParam('end');

		if(param=="0") {
			$("input:radio[name='state']").prop("checked",false);
			$("input:radio[id='inlineRadio1']").prop("checked",true);
		}
		if(param=="10") {
			$("input:radio[name='state']").prop("checked",false);
			$("input:radio[id='inlineRadio2']").prop("checked",true);
		}
		if(param=="80") {
			$("input:radio[name='state']").prop("checked",false);
			$("input:radio[id='inlineRadio3']").prop("checked",true);
		}
		if(param=="90") {
			$("input:radio[name='state']").prop("checked",false);
			$("input:radio[id='inlineRadio4']").prop("checked",true);
		}
		
		if(startDay!=null && startDay!=''){
			$("input:text[name='start']").val(startDay);
		}
		
		if(endDay !=null && endDay!=''){
			$("input:text[name='end']").val(endDay);
		}
	});
	
	$('#customerSearchBtn').on("click",function(e){
		e.preventDefault();
		let url="/customer/cusPopup";
		let option="width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "고객 찾기", option);
	});
	
	$('#prtCd').on("click", function(e){
		e.preventDefault();
		let url="/customer/prtPopup";
		let option="width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "매장 찾기", option);
	});

	function cusChgPopup(e){
		let cusno=$(e).parent().parent().children('div:eq(0)').text();
		var url="/customer/chgPopup?cusno="+cusno;
		let option="width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
		window.open(url, "변경이력", option);
	}
	
	function getParam(name){
		name=name.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");
		var regex= new RegExp("[\\?&]"+name+"=([^&#]*)"), results=regex.exec(location.search);
		return results==null? null:decodeURIComponent(results[1].replace(/\+/g,""));
	}

</script>
</body>
</html>