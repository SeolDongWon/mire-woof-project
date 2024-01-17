<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div style="width: 1200px; margin: auto;">
	<header>
		<!-- 로그인에 따라 출력이 달라짐 -->
		<div class="d-flex justify-content-end">
			<ul class="nav nav-underline  justify-content-around">
				<!-- 로그인을 하지 않은 경우 -->
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item"><a href="/account/login"
						class="nav-link text-black">로그인</a></li>
					<li class="nav-item"><a href="/account/createAccount"
						class="nav-link text-black">회원가입</a></li>
				</sec:authorize>

				<!-- 인증된 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li class="nav-item"><a href="#" class="nav-link text-black">
							<sec:authentication property="principal.account.name" />님 환영합니다
					</a></li>
					<li class="nav-item">
						<a href="/account/myAccount" class="nav-link text-black">내정보</a>
	
						</li>
					<li class="nav-item"><a href="/account/logout"
						class="nav-link text-black">로그아웃</a></li>
				</sec:authorize>

				<!-- 인증된 사용자이며, 사용자 역할이 'admin'인 경우 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a href="#" class="nav-link text-black">
							<sec:authentication property="principal.account.name" />님 환영합니다
					</a></li>
					<li class="nav-item "><a href="#" class="nav-link text-black">공지관리</a></li>
					<li class="nav-item "><a href="#" class="nav-link text-black">입양관리</a></li>
					<li class="nav-item "><a href="/item/admin/modifyItem" class="nav-link text-black">제품관리</a></li>
					<li class="nav-item "><a href="#" class="nav-link text-black">유저관리</a></li>
					<li class="nav-item "><a href="/account/logout"
						class="nav-link text-black">로그아웃</a></li>
				</sec:authorize>
			</ul>
		</div>

		<div class="text-center mb-3">
			<a href="/"> <img src="/resource/image/header/mirewoof.jpg"
				alt="적당한 로고 / 클릭하면 메인화면으로" style="height: 100px;" id="top">
			</a>
		</div>
	</header>