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
<style>
table tr td {
	display: flex;
	align-items: center;
}

table tr td img {
	margin-right: 15rem;
	padding-top: 30px;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<main class="pt-2">
		<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
		<div align="center">

			<table style="width: 80em;">
				<tr>
					<td><img src="getPetMainPic?petNo=${pet.petNo}" width="500"
						height="100%">
						<div class="mt-3 text-center">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row"><spring:message code="common.name" /></th>
										<td>${pet.petName}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="pet.age" /></th>
										<td>${pet.petAge}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="pet.breed" /></th>
										<td>${pet.petType}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="pet.gender" /></th>
										<td>${pet.petGender}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="common.description" /></th>
										<td>${pet.petDesc}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="pet.petStatus" /></th>
										<td>${pet.petStatus}</td>
									</tr>
									<tr>
										<th scope="row"><spring:message code="common.date" /></th>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${pet.petRegDate}" /></td>
									</tr>
								</tbody>
							</table>
							<div class="mt-4">
								<a href="/pet/getPetList"
									class="btn btn-light btn-outline-secondary text-dark"> <spring:message
										code="common.list" />
								</a>
							</div>
						</div></td>
				</tr>
			</table>
			<br>
			<hr>
			<h3>
				<spring:message code="pet.detailedPetInfo" />
			</h3>
			<hr>
			<table>
				<tr>
					<td class="align-middle text-center"><img
						src="getPetSubPic?petNo=${pet.petNo}" width="1200" height="100%"></td>
				</tr>

			</table>

		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>