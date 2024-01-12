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
		<ul	class="nav nav-underline nav-justified justify-content-around border-bottom">
			<li class="menu navMenu nav-item"><a href="/notice/getAbout"
				class="nav-link text-black">시설소개</a></li>
			<li class="menu navMenu nav-item"><a href="/notice/getLocation"
				class="nav-link text-black">오시는 길</a></li>
			<li class="menu navMenu nav-item"><a
				href="/notice/getNoticeList" class="nav-link text-black">공지사항</a></li>
		</ul>
	</menu>
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<h1>시설소개</h1>
	<span>이쁜 강아지 많아요</span>
	 <div id="carouselExampleIndicators" class="carousel slide">
      
      <div class="carousel-inner w-50 ">
        <div class="carousel-item active">
          <img src="/resource/image/mainPage/cat1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/resource/image/mainPage/cat3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/resource/image/mainPage/cat5.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" aria-label="Slide 1" style="width: 100px;height: 100px;"class="active" aria-current="true" >
            <img src="/resource/image/mainPage/cat1.jpg" class="d-block w-100 " alt="..."></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" style="width: 100px;height: 100px;">
            <img src="/resource/image/mainPage/cat3.jpg" class="d-block w-100" alt="..."></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" style="width: 100px;height: 100px;">
            <img src="/resource/image/mainPage/cat5.jpg" class="d-block w-100" alt="..."></button>
        </div>
      </div>
    </div>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>