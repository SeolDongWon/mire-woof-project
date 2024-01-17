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
			<div class="container mt-3" style="width: 750px;">
				<table class="table table-borderless">
					<tr>
						<td colspan="2">
							<h2 class="mb-5">내정보</h2>
						</td>
					</tr>
					<tr>
						<th style="width: ">아이디</th>
						<th >
					<input name="username" class="form-control" value="${account.username}" readonly="readonly"/>
						</tr>
					<tr>
						<td>비밀번호</td>
						<td></td>
					</tr>
					<tr>
						<th style="width: 250px;">이름</th>
						<th>
						<input name="name" class="form-control" value="${account.name}" readonly="readonly"/>
						</th>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
						<input name="address" class="form-control" " value="${account.tel}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input class="form-control" name="address1" value="${account.address1}" readonly="readonly"/>
					        <input class="form-control" name="address2" value="${account.address2}" readonly="readonly"/>
					        <input class="form-control" name="address3" value="${account.address3}" readonly="readonly"/>
					        <input class="form-control" name="address4" value="${account.address4}" readonly="readonly"/>
						</td>
					</tr>

				</table>
			</div>
		</div>

		<div class="d-flex  justify-content-center">
			<table style="width: 270px;">
				<tr>
					<td colspan="2">
						<div class="d-flex  justify-content-around">
							<a href="/account/modifyAccountForm" class="nav-link text-black"  >수정</a>
							<a href="/account/deleteAccountForm" class="nav-link text-black">삭제</a>
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