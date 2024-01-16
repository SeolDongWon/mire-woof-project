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
	
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<a href="/service/insertServiceForm">글쓰기</a>
		<div class="mt-3 w-75 m-auto">
			<h3 class="text-center">service LIST</h3>


			<table class="table" style="table-layout: fixed;">

				<thead>
					<tr>
						<th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th>
						<th class="bg-dark-subtle text-center" style="width: 20px;">작성자</th>
						<th class="bg-dark-subtle text-center" style="width: 100px;">내용</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">답변</th>
					</tr>
				</thead>

				<tbody id="serviceListSpan">
					<c:forEach items="${serviceList}" var="service">
						<input name="serviceNo" type="hidden" readonly="readonly" value="${service.serviceNo}">
						<input name="username" type="hidden" readonly="readonly" value="${service.username}">
						<input name="serviceDesc" type="hidden" readonly="readonly" value="${service.serviceDesc}">
						<form action="/service/responseServiceForm" method="post">
							<tr>
							<td name="serviceNo" align="center">${service.serviceNo}</td>
							<td name="username" align="center">${service.username}</td>
							<td name="serviceDesc" align="left" class="text-break">${service.serviceDesc}</td>
							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${service.serviceRegDate}" /></td>
							<td><button>답변1</button>
									<a href="/service/responseServiceForm?serviceNo="${service.serviceNo}>답변2</a>
							</td>
							</tr>
						</form>
						<c:if test="${null!=service.response}">
							<tr>
								<td class="bg-secondary-subtle" align="right"><span>ㄴ</span></td>
								<td class="bg-secondary-subtle"  name="username" align="center">답변</td>
								<td class="bg-secondary-subtle" align="left"><span>
										${service.response}</span></td>
								<td class="bg-secondary-subtle" align="center"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${service.responseRegDate}" /></td>
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