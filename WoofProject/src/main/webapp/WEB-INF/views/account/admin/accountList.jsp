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
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		
		<div class="d-flex  justify-content-center">

			<table class="table">
				<thead>
					<tr>
						<td colspan="7">
						    <nav class="navbar navbar-light ">
						      <div class="container-fluid">
						       <h3>User관리</h3>
						       
						        <form id="pageRequest" class="d-flex" action="/account/accountList" method="get">
						          <input class="form-control me-2 "  placeholder="username"  id="keyword" name="keyword" type="text" value="" >
						          <button class="btn btn-outline-light  text-dark" type="submit">Search</button>
						        </form>
						      </div>
						    </nav>
						  </td>
					</tr>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->

						<th class="text-center" style="width: 120px;">아이디</th>
						<th class="text-center" style="width: 70px;">성명</th>
						<th class="text-center" style="width: 120px;">전화번호</th>
						<th class="text-center" style="width: 300px;">주소</th>
						<th class="text-center" style="width: 100px;">작성일</th>
						<th class="text-center" style="width: 80px;">탈퇴여부</th>
						<th class="text-center" style="width: 100px;">계정 여/부</th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="6">정보 없음 <%-- <spring:message code="common.listEmpty" /> --%>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="account">
								<tr>
									<form method="post" action="/account/accountStatusSwitch">
										<input type="hidden" name="keyword" value="${pageRequest.keyword}" readonly="readonly">
										<td align="center" >
										<input  type="text" name="username" value="${account.username}"
											style="width: 120px; border: none;" readonly="readonly" />
											</td>
										<td align="center" style="max-width: 70px; word-wrap: break-word;">${account.name}</td>
										<td align="center">${account.tel}</td>
										<td align="left" style="max-width: 300px; word-wrap: break-word;">${account.address}</td>
										<td align="center"><fmt:formatDate
												value="${account.regDate}" pattern="yy-MM-dd HH:mm" /></td>
										<td align="center">${account.status}</td>
										<td align="center">
											<button class="form-control"
												style="background: rgb(246, 220, 216); border: none;">switch</button>
										</td>
									</form>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>

			</table>
			
		</div>
<div class="d-flex">
			<ul class="pagination m-auto">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link"
						href="/account/accountList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&keyword=${pageRequest.keyword}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<li class="page-item"><a class="page-link"
						href="/account/accountList${pagination.makeQuery(idx)}&keyword=${pageRequest.keyword}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/account/accountList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&keyword=${pageRequest.keyword}">Next</a></li>
				</c:if>
			</ul>
		</div>
		





	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>