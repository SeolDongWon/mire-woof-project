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
	<hr>
	<table class="table" id="article-table">
				<thead>
					<tr>
						<td class="title">${review.reviewTitle}</td>
						<td class="user-id">${review.userName}</td> 
						<td align="center" width="100px"><fmt:formatDate  pattern="yyyy-MM-dd" value="${review.reviewRegDate}"/></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td ><img src="getReviewPic?reviewNo=${review.reviewNo}" width="100%" height="auto">
						${review.reviewDesc}</td>
					</tr>
				</tbody>
			</table>
			<a href="/review/getReviewList" class="btn btn-light text-dark m-2"><spring:message code="common.list"/></a>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>