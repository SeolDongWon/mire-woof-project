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
.search-form {
	width: 80%;
	margin: 0 auto;
	margin-top: 1rem;
}

.search-form input {
	height: 100%;
	background: transparent;
	border: 0;
	display: block;
	width: 100%;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select {
	background: transparent;
	border: 0;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select:focus {
	border: 0;
}

.search-form button {
	height: 100%;
	width: 100%;
	font-size: 1rem;
}

.search-form button svg {
	width: 24px;
	height: 24px;
}

.card-margin {
	margin-bottom: 1.875rem;
}

@media ( min-width : 992px) {
	.col-lg-2 {
		flex: 0 0 16.66667%;
		max-width: 16.66667%;
	}
}

.card {
	border: 0;
	box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #ffffff;
	background-clip: border-box;
	border: 1px solid #e6e4e9;
	border-radius: 8px;
}
.card-img-top {
    height: 150px; /* Adjust as needed */
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
		<h1 align="center"><spring:message code="common.petReview"/></h1>
		<br>
		

		<%-- <div class="row">
			<table class="table" id="article-table">
				<thead>
					<tr>
						<th class="hashtag col-2"><a>제목</a></th>
						<th class="title col-2"><a>내용</a></th>
						<th class="user-id"><a>작성자</a></th>
						<th class="created-at"><a>작성일</a></th>
						<th class="delete"><a>기능</a></th>
					</tr>
				</thead>
				<c:forEach var="review" items="${reviewList}">
				<tbody>
					<tr>
						
						<td class="title"><a href="getReview?reviewNo=${review.reviewNo}">${review.reviewTitle}</a></td>
						<td class="hashtag">${review.reviewDesc}</td>
						<td class="user-id">${review.userName}</td>
						<td class="created-at">${review.reviewRegDate}</td>
						
						<td><a href="#">삭제</a></td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		</div> --%>
		<div class="row mb-3">
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/review/insertReviewForm"
					class="btn btn-light btn-outline-secondary text-dark me-md-2" role="button" id="write-article"><spring:message code="pet.insertReview"/></a>
			</div>
			</sec:authorize>
		</div>
		
		<section style="display: flex; flex-wrap: wrap; gap: 3rem;">
			<c:forEach var="review" items="${reviewList}">
				<div class="card" style="width: 16rem; " >
					<a href="getReview?reviewNo=${review.reviewNo}" style="text-decoration: none; color: black"><img
						src="getReviewPic?reviewNo=${review.reviewNo}" class="card-img-top"
						alt="...">
					<div class="card-body" align="center">
						<span class="card-title">${review.reviewTitle}</span>
						<br><br>
						<div class="" style="font-size: 10px; height: 100px; overflow: hidden;">${review.reviewDesc}</div>
					</div>
					</a>
					<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/review/modifyReview?reviewNo=${review.reviewNo}" class="btn btn-primary m-2"><spring:message code="common.modify"/></a> 
						<a href="/review/deleteReview?reviewNo=${review.reviewNo}" class="btn btn-danger m-2" onclick="return confirm('정말 삭제하시겠습니까?')"><spring:message code="common.delete"/></a>
					</sec:authorize> --%>
				</div>
			</c:forEach>
		</section>
		<br>
		

		
			<!-- 페이징-->
			<div class="d-flex m-1">
				<ul class="pagination m-auto">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link"
							href="/review/getReviewList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}"><spring:message code="common.previous"/></a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage }"
						end="${pagination.endPage }" var="idx">
						<li class="page-item"><a class="page-link"
							href="/review/getReviewList${pagination.makeQuery(idx)}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pagination.next && pagination.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/review/getReviewList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}"><spring:message code="common.next"/></a></li>
					</c:if>
				</ul>
			</div>
		<hr>
		<div class="d-flex">
				<form:form modelAttribute="pageRequest"
					action="/review/getReviewList" method="get" class="m-auto d-flex align-content-center">
					<form:select path="condition">
						<form:option value="TITLE"><spring:message code="common.title"/></form:option>
						<form:option value="CONTENT"><spring:message code="common.content"/></form:option>
					</form:select>
					<form:input path="keyword" />
					<form:button type="submit" class="btn btn-light btn-outline-secondary text-dark"><spring:message code="common.search"/></form:button>
				</form:form>
			</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>