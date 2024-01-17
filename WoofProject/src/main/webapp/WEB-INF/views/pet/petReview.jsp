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
			<li class="menu nav-item"><a href="/pet/getPetList"
				class="nav-link text-black">입양견 목록</a></li>
			<li class="menu nav-item"><a href="/review/getReviewList"
				class="nav-link text-black">입양후기</a></li>
		</ul>
	</menu>
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<table class="table" id="article-table">
				<thead>
					<tr>
						<th class="hashtag col-2"><a>제목</a></th>
						<th class="title col-2"><a>내용</a></th>
						<th class="user-id"><a>작성자</a></th>
						<th class="created-at"><a>작성일</a></th>
						<th>사진</th>				
						
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td class="title">${review.reviewTitle}</td>
						<td class="hashtag">${review.reviewDesc}</td>
						<td class="user-id">${review.userName}</td>
						<td class="created-at">${review.reviewRegDate}</td>
						<td class="created-at"><img src="reviewPic?reviewNo=${review.reviewNo}"width="120" height="100%"></td>
						
					</tr>	
				</tbody>
				
			</table>
			<a href="/review/getReviewList">리스트</a>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>