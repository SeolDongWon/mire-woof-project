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
			var check = confirm('<spring:message code="common.alert.confirmDelete"/>');

			if (check) {
				formObj.attr("action", "/notice/deleteNotice");
				formObj.submit();
			} else {
				alert('<spring:message code="common.alert.cancelled"/>');
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
		<h3 class="text-center"><spring:message code="announcement.notice"/></h3>
		<table class="table border border-1 shadow-sm" style="table-layout: fixed;">
			<thead>
				<tr>
					<th class="bg-dark-subtle text-center" style="width: 50px;"><spring:message code="common.no"/></th>
					<th class="bg-dark-subtle text-center" style="width: 300px;"><spring:message code="common.title"/></th>
					<th class="bg-dark-subtle text-center" style="width: 100px;"><spring:message code="common.date"/></th>
					<th class="bg-dark-subtle text-center" style="width: 100px;"><spring:message code="common.modDate"/></th>
					<th class="bg-dark-subtle text-center" style="width: 50px;"><spring:message code="common.views"/></th>
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
					<td colspan="5" rowspan="5"><div
							class="form-control-plaintext ">${notice.noticeDesc}</div>
					</td>
				</tr>
			</tbody>
		</table>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<form id="noticeActionForm" method="post">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}"
					class="form-control" readonly="true" />
			</form>
			<div class="text-end">
			<button id="btnDelete" class="btn btn-danger m-2"><spring:message code="common.delete"/></button>
			<button id="btnModify" class="btn btn-primary m-2"><spring:message code="common.modify"/></button>
			</div>
		</sec:authorize>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>