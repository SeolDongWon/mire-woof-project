<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
 <script>
    function changeLanguage(language) {
        var langUrl = "/changeLanguage?language=" + language;
        window.location.href = langUrl;
        window.location.reload();
    }
</script>
<div style="width: 1200px; margin: auto;">
	<header>
		<!-- 로그인에 따라 출력이 달라짐 -->
		<div class="row d-flex m-3">
			<div class="col-2 d-flex justify-content-start align-items-center">
				<ul class="nav nav-underline">
					<li class="nav-item"><a href="javascript:void(0);" onclick="changeLanguage('ko');" class="nav-link text-decoration-none text-dark">한국어</a></li>
					<li class="nav-item"><a href="javascript:void(0);" onclick="changeLanguage('en');" class="nav-link text-decoration-none text-dark">ENGLISH</a></li>
				</ul>
			</div>
			
			<div class="col-10 d-flex justify-content-end align-items-center">
				<ul class="nav nav-underline  justify-content-around">
					<!-- 로그인을 하지 않은 경우 -->
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a href="/account/login"
							class="nav-link text-black"><spring:message code="header.login"/></a></li>
						<li class="nav-item"><a href="/account/createAccount"
							class="nav-link text-black"><spring:message code="header.register"/></a></li>
					</sec:authorize>
	
					<!-- 인증된 사용자인 경우 true -->
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<li class="nav-item">
							<a href="/cart/myCart" class="nav-link text-black">
									<spring:message code="header.welcomeEn"/><sec:authentication property="principal.account.name"/><spring:message code="header.welcomeKo"/>
							</a>
						</li>
						<li class="nav-item">
							<a href="/cart/myCart" class="nav-link text-black">장바구니</a>
						</li>
						<li class="nav-item">
							<a href="/account/myAccount" class="nav-link text-black"><spring:message code="header.profile"/></a>
		
							</li>
						<li class="nav-item"><a href="/account/logout"
							class="nav-link text-black"><spring:message code="header.logout"/></a></li>
					</sec:authorize>
	
					<!-- 인증된 사용자이며, 사용자 역할이 'admin'인 경우 -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item"><a href="#" class="nav-link text-black">
								<spring:message code="header.welcomeEn"/><sec:authentication property="principal.account.name" /><spring:message code="header.welcomeKo"/>
						</a></li>
						<li class="nav-item "><a href="/notice/getNoticeList" class="nav-link text-black"><spring:message code="header.admin.manageNotices"/></a></li>
						<li class="nav-item "><a href="/pet/getPetList" class="nav-link text-black"><spring:message code="header.admin.managePets"/></a></li>
						<li class="nav-item "><a href="/item/modifyItem" class="nav-link text-black"><spring:message code="header.admin.manageItems"/></a></li>
						<li class="nav-item "><a href="/account/accountList" class="nav-link text-black"><spring:message code="header.admin.manageAccounts"/></a></li>
						<li class="nav-item "><a href="/account/logout"
							class="nav-link text-black"><spring:message code="header.logout"/></a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
		<div class="text-center mb-3">
			<a href="/"> <img src="/resource/image/header/mirewoof.jpg"
				alt="Logo" style="height: 100px;" id="top">
			</a>
		</div>
	</header>