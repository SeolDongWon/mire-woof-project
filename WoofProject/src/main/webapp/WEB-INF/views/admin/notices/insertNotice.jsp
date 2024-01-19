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
<title>Mire Woof</title>
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
		var formObj = $("#notice");
		$("#btnRegister").on("click", function() {
			/* formObj.attr("action", "/notice/insertNotice");
			formObj.attr("method", "post"); */
			 var check = confirm('등록할까요');
			  
			  if (check) {
						formObj.submit();
			   }
			   else {
			      alert('등록 취소');
			   }
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/getNoticeList";
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
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<div class="mt-3 w-75 m-auto">
	<h1><spring:message code="announcement.admin.writeNotice"/></h1> 
			<form:form modelAttribute="notice" action="/notice/insertNotice" method="post">
				<spring:message code="common.title"/> <form:input path="noticeTitle" class="form-control"/><br>
				<spring:message code="common.description"/> <form:textarea path="noticeDesc"  class="form-control" rows="5" id="comment"/><br>
				
			</form:form>
			<div>
				<button type="submit" id="btnRegister"class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="common.submit"/></button>
				<button type="submit" id="btnList"class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="common.list"/></button>
			</div>
		</div>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>