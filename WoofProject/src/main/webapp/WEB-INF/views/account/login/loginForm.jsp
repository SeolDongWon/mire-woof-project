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
	<%-- <%@ include file="/WEB-INF/views/common/mainMenu.jsp"%> --%>
	<!-- subMenu Area -->
	<main>
		<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
		

		<form method="post" action="/login">


			<div class="d-flex  justify-content-center" style="margin-top: 100px;">
				<div class="container mt-3" style="width: 500px">
					<table class="table table-borderless">
						<tr>
							<td colspan='2'><h2><spring:message code="common.login"/></h2></td>
						</tr>
						<tr>
							<th><spring:message code="common.username"/></th>
							<th>
								<div class="input-group mb-3">
									<input type="text" name="username" class="form-control" value="" />
								</div>
							</th>
						</tr>
						<tr>
							<td><spring:message code="common.password"/></td>
							<th>
								<div class="input-group mb-3">
									<input type="password" name="password" class="form-control" value="" />
								</div>
							</th>
						</tr>
						<tr>
							<td><input type="checkbox" name="remember-me">
							<spring:message code="login.rememberMe"/>
							</td>
							<td>
								<c:if test="error == 'xo'">
								<spring:message code="login.error"/>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan='2'>
							
								<button type="submit" class="form-control" style="background: rgb(246, 220, 216); border: none; "><spring:message code="common.login"/></button>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<sec:csrfInput />
		</form>

	</main>
	<!-- Footer Area -->
	<%-- <%@ include file="/WEB-INF/views/common/footer.jsp"%> --%>
</body>
</html>