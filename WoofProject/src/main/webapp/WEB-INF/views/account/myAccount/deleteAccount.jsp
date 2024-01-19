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
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<main class="pt-2">
		<form:form action="/account/deleteAccount" modelAttribute="account">
			<div class="d-flex justify-content-center">
				<div class="container mt-3" style="width: 500px">
					<table class="table table-borderless">
						<tr>
							<td colspan='2'><h2><spring:message code="account.deleteAccount"/></h2></td>
						</tr>
						<tr>
							<td><spring:message code="common.username"/></th>
							<td>
								<div class="input-group mb-3">
									<input name="username" class="form-control"
										placeholder="<spring:message code="common.username"/>" />
								</div>
							</th>
						</tr>
						<tr>
							<td><spring:message code="common.password"/></td>
							<td>
								<div class="input-group mb-3">
									<input name="password" class="form-control"
										placeholder="<spring:message code="common.password"/>" />
								</div>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<form:button type="submit" style="border: none; background-color: rgb(255, 255, 255);"><spring:message code="account.deleteAccount"/></form:button>
			</div>
		</form:form>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>