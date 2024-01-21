<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<menu class="dropdown mb-5 p-0">
	<ul class="nav nav-justified">
		<li class="navMenu nav-item nav-underline"style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="aboutMenu" style="box-shadow: none;"><spring:message code="common.aboutUs"/></a>
			<nav class="dropdown-menu">
				<ul class=" nav nav-justified">
					<li class="navMenu nav-item ">
						<a href="/notice/getAbout"class="nav-link text-black"><spring:message code="mainMenu.facility"/></a></li>
					<li class="navMenu nav-item">
						<a href="/notice/getLocation" class="nav-link text-black"><spring:message code="mainMenu.location"/></a></li>
					<li class="navMenu nav-item">
						<a href="/notice/getNoticeList" class="nav-link text-black"><spring:message code="mainMenu.announcement"/></a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline"style="position: relative">
			<a href=""class="nav-link text-black " data-bs-toggle="dropdown"aria-expanded="false" id="petMenu"style="box-shadow: none;"><spring:message code="common.pet"/></a>
			<nav class="dropdown-menu">
				<ul class="nav nav-justified "style="left: -300px;">
					<li class="navMenu nav-item">
						<a href="/pet/getPetList"class="nav-link text-black"><spring:message code="mainMenu.petList"/></a></li>
					<li class="navMenu nav-item">
						<a href="/review/getReviewList"class="nav-link text-black"><spring:message code="mainMenu.petReview"/></a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline "style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="itemMenu" style="box-shadow: none;"><spring:message code="common.store"/></a>
			<nav class="dropdown-menu">
				<!-- <ul class=" nav nav-justified "style="left: -600px;">
					<li class="navMenu nav-item">
						<a href="/item/itemList"class="nav-link text-black"><spring:message code="mainMenu.searchShop"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/listItemType?itemType=Clothing"class="nav-link text-black"><spring:message code="mainMenu.itemType1"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/listItemType?itemType=Toy"class="nav-link text-black"><spring:message code="mainMenu.itemType2"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/listItemType?itemType=Food"class="nav-link text-black"><spring:message code="mainMenu.itemType3"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/listItemType?itemType=Accessory"class="nav-link text-black"><spring:message code="mainMenu.itemType4"/></a></li>
				</ul> -->
				<ul class=" nav nav-justified "style="left: -600px;">
					<li class="navMenu nav-item">
						<a href="/item/itemList"class="nav-link text-black"><spring:message code="mainMenu.searchShop"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/itemList?itemType=Clothing"class="nav-link text-black"><spring:message code="mainMenu.itemType1"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/itemList?itemType=Toy"class="nav-link text-black"><spring:message code="mainMenu.itemType2"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/itemList?itemType=Food"class="nav-link text-black"><spring:message code="mainMenu.itemType3"/></a></li>
					<li class="navMenu nav-item">
						<a href="/item/itemList?itemType=Accessory"class="nav-link text-black"><spring:message code="mainMenu.itemType4"/></a></li>
				</ul>
			</nav></li>

		<li class="navMenu nav-item nav-underline"style="position: relative">
		<a href=""class="nav-link text-black" data-bs-toggle="dropdown"aria-expanded="false"id="serviceMenu" style="box-shadow: none;"><spring:message code="common.cs"/></a>
			<nav class="dropdown-menu">
				<ul class=" nav nav-justified"style="left: -900px;">
					<li class="navMenu nav-item">
						<a href="/service/getFAQList" class="nav-link text-black"><spring:message code="common.FAQ"/></a></li>
					<li class="navMenu nav-item">
						<a href="/service/getServiceList" class="nav-link text-black"><spring:message code="mainMenu.inquiries"/></a></li>
				</ul>
			</nav></li>
			
	</ul>
</menu>