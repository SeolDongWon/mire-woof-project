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
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<menu id="subMenu" class="m-0 p-0">
		<ul
			class="nav nav-underline nav-justified justify-content-around border-bottom">
			<li class="menu nav-item"><a href="" class="nav-link text-black">입양견
					목록</a></li>
			<li class="menu nav-item"><a href="" class="nav-link text-black">입양후기</a></li>
		</ul>
	</menu>
	<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
		<section>
			<c:forEach var="pet" items="${petList}">
			<div class="card" style="width: 18rem;">
				<a href="getPet?petNo=${pet.petNo}"><img
					src="/resource/image/pet/puppy.png" class="card-img-top" alt="..." ></a>
				<div class="card-body" align="center" >
					<h5 class="card-title">펫 정보</h5>
					<hr>
					<a href="/pet/pet">이름:${pet.petName}/나이:${pet.petAge}/품종:${pet.petType}</a>
				</div>
			</div>
			</c:forEach>

		</section>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>