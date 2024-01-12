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
<title>mire woof</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#account");
		$("#btnRegister").on("click", function() {
			formObj.submit();
		});
		$("#btnHom").on("click", function() {
			alert("btnHom");
			self.location = "/account/login";
		});
	});
</script>

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
	<main>
		<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->


		<div class="container mt-3" style="width: 500px">
			<form:form modelAttribute="account" action="/account/setup">
				<table class="table table-borderless">


					<tr>
						<td colspan='2'><h2>관리자 가입</h2></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<th>
							<div class="input-group mb-3">
								<form:input path="username" class="form-control"
									placeholder="Username" />
								<!-- <input type="text" name="Username" class="form-control"
										placeholder="Username"> -->
							</div>
						</th>
					</tr>

					<tr>
						<td>비밀번호</td>
						<th>
							<div class="input-group mb-3">
								<form:input path="password" class="form-control"
									placeholder="password" />

							</div>
						</th>
					</tr>
					<tr>
						<td>이 름</td>
						<th>
							<div class="input-group mb-3">
								<form:input path="name" class="form-control" placeholder="name" />
							</div>
						</th>
					</tr>
					<tr>
						<td>전화번호</td>
						<th>
							<div class="input-group mb-3">
								<form:input path="tel" class="form-control" placeholder="tel" />
							</div>
						</th>
					</tr>
					<tr>
						<td>주 소</td>
						<th>
							<div class="input-group mb-3">
								<form:input path="address" class="form-control"
									placeholder="address" />
							</div>
						</th>
					</tr>
				</table>

			</form:form>
			<table>
				<tr>
					<td>
						<div class="d-flex justify-content-around " style="width: 500px">
							<button type="submit" id="btnRegister" class="form-control"
								style="background: rgb(246, 220, 216); width: 150px;">회원가입</button>

							<button type="submit" id="btnHom" class="form-control"
								style="background: rgb(246, 220, 216); width: 150px;">목록</button>
						</div>
					</td>
				</tr>
			</table>
		</div>




	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>