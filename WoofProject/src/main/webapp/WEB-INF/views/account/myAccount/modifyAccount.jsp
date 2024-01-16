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

		
		<div class="d-flex  justify-content-center">

		<form action="/account/modifyAccount" method="post">
			<div class="container mt-3" style="width: 500px">
				<table class="table table-borderless">


					<tr>
						<td colspan='2'><h2>회원정보 수정</h2></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<th>
							<div class="input-group mb-3">
								<input name="username" class="form-control"
									placeholder="Username" value="${account.username}"/>
							</div>
						</th>
					</tr>

					<tr>
						<td>비밀번호</td>
						<th>
							<div class="input-group mb-3">
								<input name="password" class="form-control"
									placeholder="password" value="" />

							</div>
						</th>
					</tr>
					<tr>
						<td>이 름</td>
						<th>
							<div class="input-group mb-3">
								<input name="name" class="form-control" placeholder="name" value="${account.name}" />
							</div>
						</th>
					</tr>
					<tr>
						<td>전화번호</td>
						<th>
							<div class="input-group mb-3">
								<input name="tel" class="form-control" placeholder="tel" value="${account.tel}" />
							</div>
						</th>
					</tr>
					<tr>
						<td>주 소</td>
						<th>
							<div class="input-group mb-3">
								<input name="address" class="form-control" placeholder="address" value="${account.address}" />
							</div>
						</th>
					</tr>

					<tr>
						<td colspan='2'>
							<button type="submit" style="border: none; margin-right: 50px;">내정보
								수정</button> <sec:authorize access="hasRole('ROLE_ADMIN')">
								<form:button type="submit" id="btnList">
										목록
									</form:button>
							</sec:authorize>
						</td>
					</tr>
				</table>
			</div>
		</form>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>