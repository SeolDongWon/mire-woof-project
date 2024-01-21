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
<script type="text/javascript">
	var currUsername = '${pageContext.request.userPrincipal.principal.account.username}';
	console.log(currUsername);
</script>
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
<!-- subMenu Area -->


	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<div class="w-75 m-auto ">
		<table class="table border">
					<tr>
						<td colspan="2" class="title">${review.reviewTitle}</td>
					</tr>
					<tr>
						<td class="user-id">${review.userName}</td> 
						<td class="text-end "><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegDate}"/></td>
					</tr>
					<tr>
						<td colspan="2" ><img src="getReviewPic?reviewNo=${review.reviewNo}"width="50%" height="100%"></td>
					</tr>
					<tr>
						<td colspan="2">${review.reviewDesc}</td>
					</tr>
			</table>
			<div class="row p-0 m-0">
				<div class="col-6">
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<c:if test="${review.userName==account.username}">
							<a href="modifyReview?reviewNo=${review.reviewNo}" class="btn btn-primary m-2"><spring:message code="common.modify"/></a>
							<a href="deleteReview?reviewNo=${review.reviewNo}" class="btn btn-danger m-2" onclick="return confirm('정말 삭제하시겠습니까?')"><spring:message code="common.delete"/></a> 	
						</c:if>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="deleteReview?reviewNo=${review.reviewNo}" class="btn btn-danger m-2" onclick="return confirm('정말 삭제하시겠습니까?')"><spring:message code="common.delete"/></a>
					</sec:authorize>
				</div>
				<div class="col-6 text-end">
					<a href="/review/getReviewList" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="common.list"/></a>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/replyInclude.jsp"%>
			</div>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>