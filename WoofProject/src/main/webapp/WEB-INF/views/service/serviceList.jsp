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
<script type="text/javascript">
	if(${msg!=null}){
		alert("${msg}");
	};
	
	function serviceAction(actionType, form) {
        switch (actionType) {
					case 'modify':
						 form.action = '/service/responseServiceForm';  // 수정 액션 주소
						break;
					case 'delete':
						var check = confirm("정말로 삭제?");
			      if(check){
			    	  form.action = '/service/deleteService';
			      }
						break;
				}
        form.submit();
    }
</script>

</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

	<main class="pt-2">
		<div class="mt-3 w-75 m-auto">
			<h3 class="text-center">service LIST</h3>
			<sec:authorize access="isAuthenticated()">
			<a href="/service/insertServiceForm"
				class="btn btn-outline-dark float-end m-1">글쓰기</a>
			</sec:authorize>
						<a href="/reply/getReplyList"
				class="btn btn-outline-dark float-end m-1">리플</a>
			
			
			
			<table class="table" style="table-layout: fixed;">

				<thead>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->
						<th class="bg-dark-subtle text-center" style="width: 20px;">작성자</th>
						<th class="bg-dark-subtle text-center" style="width: 100px;">내용</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
						<th class="border-0" style="width: 20px;"></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${serviceList}" var="service">
						<form method="post">
							<input type="hidden" name="serviceNo" value="${service.serviceNo}" readonly="readonly"> 
							<input type="hidden" name="username" value="${service.username}"readonly="readonly"> 
							<input type="hidden"name="serviceDesc" value="${service.serviceDesc}"readonly="readonly">
							<input type="hidden"name="response" value="${service.response}"readonly="readonly">
						<tr>
							<td name="username" align="center">${service.username}</td>
							<td name="serviceDesc" align="left" class="text-break">${service.serviceDesc}</td>
							<td align="center">
								<fmt:formatDate	pattern="yyyy-MM-dd HH:mm" value="${service.serviceRegDate}" /></td>
							<td align="center" class="border-0">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button class="btn btn-outline-dark p-0"										onclick="serviceAction('modify', this.form)">답변</button>
									<button class="btn btn-outline-dark p-0"										onclick="serviceAction('delete', this.form)">삭제</button>
								</sec:authorize> <sec:authorize access="hasRole('ROLE_MEMBER')">
									<c:if test="${service.username==account.username}">
										<div class="d-flex">
											<button class="btn btn-outline-dark p-0"										onclick="serviceAction('delete', this.form)">삭제</button>
										</div>
									</c:if>
								</sec:authorize></td>
						</tr>
						</form>
						<c:if test="${null!=service.response}">
							<tr>
								<!-- <td class="bg-secondary-subtle" align="right"><span>ㄴ</span></td> -->
								<td class="bg-secondary-subtle" name="username" align="center">ㄴ답변</td>
								<td class="bg-secondary-subtle" align="left">${service.response}</td>
								<td class="bg-secondary-subtle" align="center"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${service.responseRegDate}" /></td>
								<td class="border-0"></td>
							</tr>
						</c:if>

					</c:forEach>

				</tbody>

			</table>

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

		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>