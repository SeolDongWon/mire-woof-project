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
<!-- 내집 주소링크 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- css common Area 헤더 푸터에 쓸 css 경로-->
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<!-- script common Area 헤더 푸터에 쓸 script 경로-->
<%@ include file="/WEB-INF/views/account/login/accountScript.jsp"%>


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
		<form action="createAccount" method="post" name="joinform"
			onsubmit="doSubmit(); return false;">
			<div class="container mt-3" style="width: 750px;">
				<table class="table table-borderless" style="margin-top: 100px;">
					<tr>
						<td colspan='2'>
							<h2>
								<spring:message code="common.signup" />
							</h2>
						</td>
					</tr>
					<tr>
						<td colspan='2'><span> * <spring:message code="account.signUp"/> </span></td>
					</tr>
					<tr>
						<td style="width: 150px"><span style="color: red;">*</span> <spring:message
								code="common.username" /></td>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="username" id="username"
									class="form-control"
									placeholder="<spring:message code="signup.usernamePH"/>"
									onblur="idCheck()">
									 <input type="button" class="btn btn-light text-dark" onclick="checkUsernameBtn()" value="<spring:message code='signup.check'/>" />
							</div>
						</th>
					</tr>
					<tr>
						<td><span style="color: red;">*</span> <spring:message
								code="common.password" /></td>
						<th>
							<div class="input-group mb-3">
								<input type="password" name="password" id="password"
									class="form-control"
									placeholder="<spring:message code="signup.passwordPH"/>"
									onblur="pwCheck()">

							</div>
						</th>
					</tr>
					<tr>
						<td><span style="color: red;">*</span> <spring:message
								code="common.name" /></td>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="name" id="name" class="form-control"
									placeholder="<spring:message code="signup.namePH"/>"
									onblur="nameCheck()">
							</div>
						</th>
					</tr>
					<tr>
						<td><span style="color: red;">*</span> <spring:message
								code="common.phone" /></td>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="tel" id="tel" class="form-control"
									placeholder="<spring:message code="signup.phonePH"/>"
									onblur="telCheck()">
							</div>
						</th>
					</tr>
					<tr>
						<td><span style="color: red;">*</span> <spring:message
								code="common.address" /></td>
						<th>
							<div class="d-flex  justify-content-center">
								<input type="text" id="sample6_postcode" placeholder="<spring:message code="signup.address1PH"/>"
									class="form-control" name="address1" onblur="addressCheck1()" readonly="readonly">
									
								<input type="button"
									class="btn btn-light text-dark"
									onclick="sample6_execDaumPostcode()"
									value="<spring:message code="common.findZipcode"/>"
									style="border: none; background-color: rgb(255, 255, 255);">

							</div> 
							<input type="text" size="45px" id="sample6_address"
							placeholder="<spring:message code="signup.address2PH"/>"
							class="form-control" name="address2" onblur="addressCheck2()" readonly="readonly">
							
							<input type="text" id="sample6_detailAddress"
							placeholder="<spring:message code="signup.address3PH"/>"
							class="form-control" name="address3" onblur="addressCheck3()">
							
							<input type="text" id="sample6_extraAddress"
							placeholder="<spring:message code="signup.address4PH"/>"
							class="form-control" name="address4">
						</th>
					</tr>
					<tr>
						<td colspan='2'><span id="usernameMessage"></span></td>
					</tr>
					<tr>
						<td colspan='2'>
							<button type="submit" class="form-control"
								style="background: rgb(246, 220, 216); border: none;">
								<spring:message code="common.signup" />
							</button>
					</tr>
				</table>
			</div>
		</form>
	</main>
	<!-- Footer Area -->
	<%-- 	<%@ include file="/WEB-INF/views/common/footer.jsp"%> --%>
</body>
</html>