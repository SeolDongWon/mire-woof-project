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

</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
			<div class="row p-0 m-0 mb-3">
			<div class="col-2"></div>
				<div class="col-8 d-flex justify-content-center">
					<form id="pageRequest" class="d-flex w-50" action="/pet/getPetList" method="get">
						<input class="form-control me-2"  placeholder="keyword"  id="keyword" name="keyword" type="text" value="" >
						<button class="btn btn-outline-light  text-dark" type="submit" style="background-color: rgb(246, 220, 216)">Search</button>
					</form>
				</div>
				<div class="col-2 float-end">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="insertPet"
								class="btn btn-light btn-outline-secondary text-dark"> <spring:message	code="pet.insert" /></a>
					</sec:authorize>
				</div>				
			</div>
		${pet.petStatus}
		${authList}
		<section style="display: flex; flex-wrap: wrap; gap: 6rem;">
			<c:forEach var="pet" items="${petList}">
				<c:if test="${pet.petStatus=='OPEN' || authList=='[ROLE_ADMIN]'}">
				<div class="card" style="width: 21rem;">
					<a href="getPet?petNo=${pet.petNo}">
					<img src="getPetMainPic?petNo=${pet.petNo}" class="card-img-top"	alt="Pet"></a>
					<div class="card-body" align="center">
						<h5 class="card-title">${pet.petName}</h5>
						<hr>
						<a href="getPet?petNo=${pet.petNo}"	style="text-decoration: none; color: black;">
							<spring:message	code="pet.age" /> : ${pet.petAge} <br> 
							<spring:message	code="pet.breed" /> : ${pet.petType}
						</a>
					</div>
					<c:choose>
						<c:when test="${pet.petStatus=='OPEN'}">
						<div class="text-center"
							style="color: black; background-color: rgb(246, 220, 216)">분양
							신청가능</div>
						</c:when>
							<c:when test="${pet.petStatus=='CLOSED'}">
						<div class="text-center"
							style="color: red; background-color: rgb(246, 220, 216)">분양
							진행중</div>
							</c:when>
						<c:otherwise>
						<div class="text-center"
							style="color: red; background-color: black">분양 완료</div>
						</c:otherwise>
					</c:choose>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="modifyPet?petNo=${pet.petNo}" class="btn btn-primary m-2"><spring:message
								code="common.modify" /></a>
						<a href="deletePet?petNo=${pet.petNo}" class="btn btn-danger m-2"
							onclick="return confirm('정말 삭제하시겠습니까?')"><spring:message
								code="common.delete" /></a>
					</sec:authorize>
				</div>
				</c:if>
			</c:forEach>
		</section>
		<br>
		<div class="d-flex">
			<ul class="pagination m-auto">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link"
						href="/pet/getPetList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&keyword=${pageRequest.keyword}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<li class="page-item"><a class="page-link"
						href="/pet/getPetList${pagination.makeQuery(idx)}&keyword=${pageRequest.keyword}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/pet/getPetList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&keyword=${pageRequest.keyword}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>