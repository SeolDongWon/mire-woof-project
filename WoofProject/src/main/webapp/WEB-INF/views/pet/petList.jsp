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

</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->

	<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
		<section style="display: flex; flex-wrap: wrap; gap: 6rem;">
			<c:forEach var="pet" items="${petList}">
				<div class="card" style="width: 21rem;">
					<a href="getPet?petNo=${pet.petNo}"><img
						src="getPetMainPic?petNo=${pet.petNo}" class="card-img-top"
						alt="Pet"></a>
					<div class="card-body" align="center">
						<h5 class="card-title">${pet.petName}</h5>
						<hr>
						<a href="getPet?petNo=${pet.petNo}"
							style="text-decoration: none; color: black;"><spring:message
								code="pet.age" /> : ${pet.petAge} | <spring:message
								code="pet.breed" /> : ${pet.petType}</a>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="modifyPet?petNo=${pet.petNo}" class="btn btn-primary m-2"><spring:message
								code="common.modify" /></a>
						<a href="deletePet?petNo=${pet.petNo}" class="btn btn-danger m-2"
							onclick="return confirm('정말 삭제하시겠습니까?')"><spring:message
								code="common.delete" /></a>
					</sec:authorize>
				</div>
			</c:forEach>
		</section>
		<a href="insertPet" class="btn btn-light text-dark m-6" style="float: right; text-decoration: none;"><spring:message
				code="pet.insert" /></a><br>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>