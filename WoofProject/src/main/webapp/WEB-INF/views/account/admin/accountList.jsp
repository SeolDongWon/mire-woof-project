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

<script>
	/* $(document).ready(function() {
		var formObj = $("#account");
		console.log(formObj);
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		
	}); */
function accountdelete(form) {
	
	var check = confirm("삭젵네스트");
	if(check){
		form.action='/account/remove';
		form.submit();
	}else{
		
	}
	
	
}	
	
</script>
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
		<h3 class="mb-2">User관리</h3>
		<div class="d-flex  justify-content-center">

			<table class="table" style="table-layout: fixed;">
				<thead>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->
						<th class="text-center" style="width: 70px;">아이디</th>
						<th class="text-center" style="width: 70px;">성명</th>
						<th class="text-center" style="width: 120px;">전화번호</th>
						<th class="text-center">주소</th>
						<th class="text-center" style="width: 100px;">작성일</th>
						<th class="text-center" style="width: 80px;">탈퇴여부</th>
						<th class="text-center" style="width: 100px;">삭제 여/부</th>
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
								<form method="post" name="acconutdelete" >
									<td align="center" name="username">${account.username}</a></td>
									<td align="center">${account.name}</td>
									<td align="center">${account.tel}</td>
									<td align="left">${account.address}</td>
									<td align="center"><fmt:formatDate
											value="${account.regDate}" pattern="yy-MM-dd HH:mm" /></td>
									<td align="center">${account.status}</td>
									<td align="center">
										<button id="btnRemove" onclick="accountdelete(this.form)">삭제</button>
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
						href="/service/getServiceList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<li class="page-item"><a class="page-link"
						href="/service/getServiceList${pagination.makeQuery(idx)}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/service/getServiceList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Next</a></li>
				</c:if>
			</ul>
		</div>


	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>