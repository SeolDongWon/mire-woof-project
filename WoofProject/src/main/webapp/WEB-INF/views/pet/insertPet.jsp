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

	<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
		<div align="center">
			<section>
				<h3>펫 등록</h3>
				<div class="card" style="width: 26rem;">
					<div class="card-body">
						<p class="card-text">
							<form:form modelAttribute="pet" action="insertPet" method="post"
								enctype="multipart/form-data">
								<br>
				애칭<form:input path="petName" />
								<br>
				나이<form:input path="petAge" />
								<br>
				품종<form:input path="petType" />
								<br>
									<label for="petGender">성별</label> 
									<input type="radio"
										id="petGender" name="petGender" value="M"> <label
										for="petGender">M</label> <input type="radio" id="petGender2"
										name="petGender" value="F"> <label for="petGender2">F</label>
								<br> 소개
									<form:input path="petDesc" />
								<br>
								<br> 메인사진 <input type="file" name="pictures"
									path="petMainPic" />
								<br> 서브사진 <input type="file" name="pictures"
									path="petSubPic" />
								<br>
							</form:form>
						</p>
						<div>
							<button type="submit" id="btnRegister">Register</button>
							<button type="button" id="btnList">List</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>