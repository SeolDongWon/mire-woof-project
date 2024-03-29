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
		<div class="mt-3 w-75 m-auto">
			<h3 class="text-center"><spring:message code="common.announcement"/></h3>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/notice/insertNoticeForm" class="btn btn-light btn-outline-secondary text-dark float-end m-2"><spring:message code="announcement.admin.writeNotice"/></a>
			</sec:authorize>
			<table class="table table-striped table-hover shadow-sm" style="table-layout: fixed;">

				<thead>
					<tr>
						<th class="bg-dark-subtle text-center" style="width: 20px;"><spring:message code="common.no"/></th>
						<th class="bg-dark-subtle text-center" style="width: 100px;"><spring:message code="common.title"/></th>
						<th class="bg-dark-subtle text-center" style="width: 50px;"><spring:message code="common.date"/></th>
					</tr>
				</thead>

				<tbody id="noticeListSpan">
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td align="center">${notice.noticeNo}</td>
							<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
							<td align="left" class="text-break"><a class="text-decoration-none text-black"
								href="/notice/getNotice?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
							<td align="center">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeRegDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- 페이징-->
			<div class="d-flex">
				<form:form modelAttribute="pageRequest"
					action="/notice/getNoticeList" method="get" class="m-auto d-flex align-content-center">
					<form:select path="condition">
						<form:option value="TITLE"><spring:message code="common.title"/></form:option>
						<form:option value="CONTENT"><spring:message code="common.content"/></form:option>
					</form:select>
					<form:input path="keyword" />
					<form:button type="submit" class="btn btn-light btn-outline-secondary text-dark"><spring:message code="common.search"/></form:button>
				</form:form>
			</div>
			
			<div class="d-flex m-1">
				<ul class="pagination m-auto">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Previous</a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage }"
						end="${pagination.endPage }" var="idx">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList${pagination.makeQuery(idx)}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pagination.next && pagination.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/notice/getNoticeList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&condition=${pageRequest.condition}&keyword=${pageRequest.keyword}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>