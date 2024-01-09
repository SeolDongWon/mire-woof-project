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
<script>
	$(document).ready(function() {
		var formObj = $("#pet");
		$("#btnRegister").on("click", function() {
			formObj.attr("action", "/pet/insertPet");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/pet/getPetList";
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
	<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
	<menu id="subMenu" class="m-0 p-0">
		<ul class="nav nav-underline nav-justified justify-content-around border-bottom">
    		<li class="menu nav-item"><a href="" class="nav-link text-black">입양견 목록</a></li>
     		<li class="menu nav-item"><a href="" class="nav-link text-black">입양후기</a></li>
    	</ul>
	</menu>
	<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
		<section>
			팻작성 
			<form:form modelAttribute="pet" action="insertPet">
				이름<form:input path="petName" /><br>
				나이<form:input path="petAge" /><br>
				품중<form:input path="petType" /><br>
				성별<form:input path="petGender" /><br>
				설명<form:input path="petDesc" /><br>
				상태<form:input path="petStatus" /><br>
				메인사진<form:input path="petMainPic" /><br>
				사진<form:input path="petSubPic" /><br>

			</form:form>
			<div>
				<button type="submit" id="btnRegister">Register</button>
				<button type="submit" id="btnList">List</button>
			</div>
			<a href="/pet/getPetList">/pet/getPetList</a>

		</section>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>