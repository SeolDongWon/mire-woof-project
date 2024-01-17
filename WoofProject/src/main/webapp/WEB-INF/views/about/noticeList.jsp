<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mire woof</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css common Area 헤더 푸터에 쓸 css 경로-->
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<!-- script common Area 헤더 푸터에 쓸 script 경로-->
<%@ include file="/WEB-INF/views/common/script.jsp"%>
<!-- css local Area 각 개별페이지 css 경로는 여기다가 쓸 것-->
<%-- <%@ include file="" %> --%>
<!-- script local Area  각 개별페이지 script 경로는 여기다가 쓸 것 -->
<%-- <%@ include file="" %> --%>
<script type="text/javascript">
	/* 	$(document).ready(function() {
	 ajaxPut();

	 $("#ajaxPutBtn").on("click", function() {
	 alert("putBtn");
	 ajaxPut();
	 });
	 });

	 function ajaxPut() {
	 let pageRequest = {
	 condition : $("#condition").val(),
	 keyword : $("#keyword").val(),
	 sizePerPage : $("#sizePerPage").val(),
	 page : $("#page").val()
	
	 };

	 alert(pageRequest.condition+" "+pageRequest.keyword+" "+pageRequest.sizePerPage+" "+pageRequest.page);
	
	 $.ajax({
	 type : "put",
	 url : "/notice/getNoticeListAjaxPut",
	 data : JSON.stringify(pageRequest),
	 contentType : "application/json; charset=UTF-8",

	 success : function(result) {
	 console.log("result.length : " + result.length);
	 let noticeList = "";

	 if (result.length != 0) {

	 for (var i = 0; i < result.length; i++) {
	 noticeList += '<tr style="font-size: 12px;">';
	 noticeList += '<td class=" text-center p-1" style="width: 50px;">';
	 noticeList += result[i].noticeNo + '</td>';
	 noticeList += '<td class="text-truncate p-1">';
	 noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
					noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
	 noticeList += result[i].noticeTitle
	 + '</a></td>';
	 noticeList += '<td class=" text-center p-1" style="width: 130px;">'
	 noticeList += result[i].noticeRegDate + '</td>';
	 noticeList += '</tr>';

	 }
	 } else {
	 alert("검색결과 없음");
	 }

	 $("#noticeListSpan").html(noticeList);

	 if (pageRequest.keyword != "") {
	 let url = "?condition=" + pageRequest.condition
	 + "&keyword=" + pageRequest.keyword;
	 if (typeof (history.pushState) != "undefined") {
	 history.pushState(null, null, url);
	 }
	 }
	 }
	 });
	 } */
	/* 	$(document).ready(function() {
	ajaxPut();

	$("#ajaxPutBtn").on("click", function() {
	alert("putBtn");
	ajaxPut();
	});
	});

	function ajaxPut() {
	let pageRequest = {
	condition : $("#condition").val(),
	keyword : $("#keyword").val(),
	sizePerPage : $("#sizePerPage").val(),
	page : $("#page").val()
	
	};

	alert(pageRequest.condition+" "+pageRequest.keyword+" "+pageRequest.sizePerPage+" "+pageRequest.page);
	
	$.ajax({
	type : "put",
	url : "/notice/getNoticeListAjaxPut",
	data : JSON.stringify(pageRequest),
	contentType : "application/json; charset=UTF-8",

	success : function(result) {
	console.log("result.length : " + result.length);
	let noticeList = "";

	if (result.length != 0) {

	for (var i = 0; i < result.length; i++) {
	noticeList += '<tr style="font-size: 12px;">';
	noticeList += '<td class=" text-center p-1" style="width: 50px;">';
	noticeList += result[i].noticeNo + '</td>';
	noticeList += '<td class="text-truncate p-1">';
	noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
					noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
	noticeList += result[i].noticeTitle
	+ '</a></td>';
	noticeList += '<td class=" text-center p-1" style="width: 130px;">'
	noticeList += result[i].noticeRegDate + '</td>';
	noticeList += '</tr>';

	}
	} else {
	alert("검색결과 없음");
	}

	$("#noticeListSpan").html(noticeList);

	if (pageRequest.keyword != "") {
	let url = "?condition=" + pageRequest.condition
	+ "&keyword=" + pageRequest.keyword;
	if (typeof (history.pushState) != "undefined") {
	history.pushState(null, null, url);
	}
	}
	}
	});
	} */
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<div class="mt-3 w-75 m-auto">
			<h3 class="text-center">NOTICE LIST</h3>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/notice/insertNoticeForm" class="btn btn-outline-dark float-end m-1">공지사항쓰기</a>
			</sec:authorize>
			<table class="table table-striped" style="table-layout: fixed;">

				<thead>
					<tr>
						<th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th>
						<th class="bg-dark-subtle text-center" style="width: 100px;">제목</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
					</tr>
				</thead>

				<tbody id="noticeListSpan">
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td align="center">${notice.noticeNo}</td>
							<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
							<td align="left" class="text-break"><a class="text-decoration-none text-black"
								href="/notice/getNotice?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${notice.noticeRegDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- 페이징-->
			<div class="d-flex">
				<form:form modelAttribute="pageRequest"
					action="/notice/getNoticeList" method="get" class="m-auto d-flex align-content-center">
					<form:select path="condition">
						<form:option value="TITLE" label="제목" />
						<form:option value="CONTENT" label="내용" />
					</form:select>
					<form:input path="keyword" />
					<form:button type="submit" class="btn btn-outline-dark p-1">일반검색</form:button>
				</form:form>
			</div>
			
			<div class="d-flex m-1">
				<ul class="pagination m-auto">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Previous</a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage }"
						end="${pagination.endPage }" var="idx">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList${pagination.makeQuery(idx)}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pagination.next && pagination.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>