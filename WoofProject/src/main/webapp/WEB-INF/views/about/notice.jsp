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
<script>
	$(document).ready(function() {
		var formObj = $("#noticeActionForm");

		$("#btnDelete").on("click", function() {
			var check = confirm('삭제할까요');

			if (check) {
				formObj.attr("action", "/notice/deleteNotice");
				formObj.submit();
			} else {
				alert('삭제 취소');
			}
		});

		$("#btnModify").on("click", function() {
			formObj.attr("action", "/notice/modifyNoticeForm");
			formObj.submit();
		});

	});
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<main class="pt-2 w-75 m-auto">
		<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
		<h3 class="text-center">NOTICE</h3>
		<table class="table border border-1" style="table-layout: fixed;">
			<thead>
				<tr>
					<th class="bg-dark-subtle text-center" style="width: 50px;">글번호</th>
					<th class="bg-dark-subtle text-center" style="width: 200px;">제목</th>
					<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
					<th class="bg-dark-subtle text-center" style="width: 50px;">수정일</th>
					<th class="bg-dark-subtle text-center" style="width: 50px;">조회수</th>
				</tr>
			</thead>
			<tbody id="noticeListSpan">
				<tr>
					<td class=" text-center" style="width: 20px;">${notice.noticeNo}</td>
					<td class=" text-center" style="width: 100px;">${notice.noticeTitle}</td>
					<td class=" text-center" style="width: 50px;"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${notice.noticeRegDate}" /></td>
					<td class=" text-center" style="width: 50px;"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${notice.noticeModDate}" /></td>
					<td class=" text-center" style="width: 50px;">${notice.noticeViewCount}</td>
				</tr>
				<tr>
					<td colspan="5" rowspan="5"><textarea
							class="form-control-plaintext " rows="5" readonly="readonly">${notice.noticeDesc}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<form id="noticeActionForm" method="post">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}"
					class="form-control" readonly="true" />
			</form>
			<button id="btnModify" class="btn btn-outline-dark p-1">수정</button>
			<button id="btnDelete" class="btn btn-outline-dark p-1">삭제</button>
		</sec:authorize>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>