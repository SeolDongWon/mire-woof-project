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
		<h1 align="center">분양 후기</h1>
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
		
		<section style="display: flex; flex-wrap: wrap; gap: 3rem;">
			<c:forEach var="review" items="${reviewList}">
				<div class="card" style="width: 16rem; " >
					<a href="getReview?reviewNo=${review.reviewNo}"><img
						src="getReviewPic?reviewNo=${review.reviewNo}" class="card-img-top"
						alt="..."></a>
					<div class="card-body" align="center">
						<p class="card-title">${review.reviewTitle}</p>
						<br>
						<p class="hashtag" style="font-size: 10px">${review.reviewDesc}</p>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="modifyReview?reviewNo=${review.reviewNo}">수정</a> 
					<a href="deleteReview?reviewNo=${review.reviewNo}"onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
					</sec:authorize>
				</div>
			</c:forEach>

		</section>
		<br>
		<div class="row">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/review/insertPetReviewForm"
					class="btn btn-primary me-md-2" role="button" id="write-article">후기작성</a>
			</div>
		</div>

		<div class="row">
			<nav id="pagination" aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
		<hr>
		<div class="row">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>제목</option>
											<option>내용</option>
									
										</select>
									</div>
									<div class="col-lg-8 col-md-6 col-sm-12 p-0">
										<label for="search-value" hidden>검색어</label> <input
											type="text" placeholder="검색어..." class="form-control"
											id="search-value" name="searchValue">
									</div>
									<div class="col-lg-1 col-md-3 col-sm-12 p-0">
										<button type="submit" class="btn btn-base">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-search">
                                            <circle cx="11" cy="11"
													r="8"></circle>
                                            <line x1="21" y1="21"
													x2="16.65" y2="16.65"></line>
                                        </svg>
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>