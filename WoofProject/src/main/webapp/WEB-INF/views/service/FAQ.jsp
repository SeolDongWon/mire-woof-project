<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<div class="accordion w-75 m-auto" id="accordionPanelsStayOpenExample">
			<h3 class="text-center"><spring:message code="common.FAQ"/></h3>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapse1" aria-expanded="false"
						aria-controls="panelsStayOpen-collapse1"><spring:message code="service.FAQ.Q1"/></button>
				</h2>
				<div id="panelsStayOpen-collapse1"
					class="accordion-collapse collapse">
					<div class="accordion-body">
						<spring:message code="service.FAQ.A1"/>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapse2" aria-expanded="false"
						aria-controls="panelsStayOpen-collapse2"><spring:message code="service.FAQ.Q2"/></button>
				</h2>
				<div id="panelsStayOpen-collapse2"
					class="accordion-collapse collapse">
					<div class="accordion-body">
						<spring:message code="service.FAQ.A2"/>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapse3" aria-expanded="false"
						aria-controls="panelsStayOpen-collapse3"><spring:message code="service.FAQ.Q3"/></button>
				</h2>
				<div id="panelsStayOpen-collapse3"
					class="accordion-collapse collapse">
					<div class="accordion-body">
						<spring:message code="service.FAQ.A3"/>
					</div>
				</div>
			</div>
		</div>

	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>