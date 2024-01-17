<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<menu class="dropdown mb-5 p-0">
	<ul class="nav nav-justified">
		<li class="navMenu nav-item nav-underline"style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="aboutMenu" style="box-shadow: none;">회사소개</a>
			<nav class="dropdown-menu">
				<ul class=" nav nav-justified">
					<li class="navMenu nav-item ">
						<a href="/notice/getAbout"class="nav-link text-black">시설소개</a></li>
					<li class="navMenu nav-item">
						<a href="/notice/getLocation" class="nav-link text-black">오시는 길</a></li>
					<li class="navMenu nav-item">
						<a href="/notice/getNoticeList" class="nav-link text-black">공지사항</a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline"style="position: relative">
			<a href=""class="nav-link text-black " data-bs-toggle="dropdown"aria-expanded="false" id="petMenu"style="box-shadow: none;">분양</a>
			<nav class="dropdown-menu">
				<ul class="nav nav-justified "style="left: -300px;">
					<li class="navMenu nav-item">
					<a href="/pet/getPetList"class="nav-link text-black">입양견 목록</a></li>
					<li class="navMenu nav-item">
					<a href="/review/getReviewList"class="nav-link text-black">입양후기</a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline "style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="itemMenu" style="box-shadow: none;">상품</a>
			<nav class="dropdown-menu">
				<ul class=" nav nav-justified "style="left: -600px;">
					<li class="navMenu nav-item">
					<a href="/item/getList"class="nav-link text-black">상품목록</a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline"style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="serviceMenu" style="box-shadow: none;">고객센터</a>
			<nav class="dropdown-menu">
				<ul class=" nav nav-justified"style="left: -900px;">
					<li class="navMenu nav-item">
						<a href="/service/getFAQList" class="nav-link text-black">자주묻는 질문</a></li>
					<li class="navMenu nav-item">
						<a href="/service/getServiceList" class="nav-link text-black">문의사항</a></li>
				</ul>
			</nav></li>
			
	</ul>
</menu>