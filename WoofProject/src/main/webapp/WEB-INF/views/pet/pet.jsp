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
<title>pet</title>
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
		
			<table style="width: 50em;">
				<tr>
					<td><img src="getPetMainPic?petNo=${pet.petNo}" width="250" height="100%">
						<div>
							애칭:${pet.petName}<br> 나이: ${pet.petAge}<br> (견종:${pet.petType},
							성별:${pet.petGender})<br> 소개: ${pet.petDesc}<br> 입양유무: ${pet.petStatus}<br> 등록일: ${pet.petRegDate}<br><br>
							<a href="/pet/getPetList">리스트</a>
						</div></td>
				</tr>
			</table>
			<br>
			<hr>
			상세정보
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