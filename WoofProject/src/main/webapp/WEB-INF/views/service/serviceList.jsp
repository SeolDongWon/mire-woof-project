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
	if(${msg!=null}){
		alert("${msg}");
	};
	
	function serviceAction(actionType, form) {
        switch (actionType) {
			case 'modify':
				form.action = '/service/responseServiceForm';  // 수정 액션 주소
				break;
			case 'delete':
				var check = confirm("<spring:message code='common.alert.confirmDelete'/>");
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
			<h3 class="text-center">
				<spring:message code="service.listTitle" />
			</h3>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<a href="/service/insertServiceForm"
					class="btn btn-light btn-outline-secondary text-dark m-2 float-end"><spring:message	code="service.writeService" /></a>
			</sec:authorize>
			<%-- <a href="/reply/getReplyList"
				class="btn btn-light btn-outline-secondary text-dark m-2 float-end"><spring:message code="service.reply" /></a>
 --%>
			<table class="table" style="table-layout: fixed;background-color: rgb(246, 220, 216)">

				<thead>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->
						<th class="bg-dark-subtle text-center" style="width: 30px;"><spring:message code="common.author" /></th>
						<th class="bg-dark-subtle text-center" style="width: 30px;"><spring:message	code="service.type" /></th>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<th class="bg-dark-subtle text-center" style="width: 50px;"><spring:message	code="service.orderNo" /></th>
						</sec:authorize>
						<th class="bg-dark-subtle text-center" style="width: 100px;"><spring:message code="common.content" /></th>
						<th class="bg-dark-subtle text-center" style="width: 50px;"><spring:message	code="common.date" /></th>
						<th class="border-0" style="width: 20px;"></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${serviceList}" var="service">
						<form method="post">
						<tr>
							<td name="username" align="center">${service.username}</td>
							<td name="serviceType">${service.serviceType}</td>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<td name="orderHistoryNo" align="center">
									<c:if test="${service.serviceType ne 'Other'}">
          						  		<a href="${pageContext.request.contextPath}/orderHistory/getOrderHistory?orderHistoryNo=${service.orderNo}" class="btn btn-light btn-outline-secondary">${service.orderNo}</a>
        							</c:if>
								</td>
							</sec:authorize>
							<td name="serviceDesc" align="left" class="text-break">${service.serviceDesc}</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${service.serviceRegDate}" /></td>
							<td align="center" class="border-0"><sec:authorize access="hasRole('ROLE_ADMIN')">
									<button class="btn btn-primary p-0"	onclick="serviceAction('modify', this.form)">
										<spring:message code="service.reply" />
									</button>
									<button class="btn btn-danger p-0" onclick="serviceAction('delete', this.form)">
										<spring:message code="common.delete" />
									</button>
								</sec:authorize> <sec:authorize access="hasRole('ROLE_MEMBER')">
									<c:if test="${service.username==account.username}">
										<button class="btn btn-danger p-0" onclick="serviceAction('delete', this.form)">
											<spring:message code="common.delete" />
										</button>
									</c:if>
								</sec:authorize></td>
						</tr>
						
						<input type="hidden" name="serviceNo" value="${service.serviceNo}"> 
						<input type="hidden" name="username" value="${service.username}"> 
						<input type="hidden" name="serviceDesc" value="${service.serviceDesc}">
						<input type="hidden" name="response" value="${service.response}">
						<input type="hidden" name="serviceType" value="${service.serviceType}"> 
						<input type="hidden" name="orderHistoryNo" value="${service.orderNo}">
						
						</form>
						<c:if test="${null!=service.response}">
							<tr >
								<!-- <td class="bg-secondary-subtle" align="right"><span>ㄴ</span></td> -->
								<td class="bg-secondary-subtle" name="username" align="center"><spring:message
										code="service.reply" /></td>
								<td class="bg-secondary-subtle"></td>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<td class="bg-secondary-subtle"></td>
								</sec:authorize>
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
				<form name="pageRequest" action="/service/getServiceList" method="get" class="m-auto d-flex align-content-center">
					<input type="text" name="keyword" placeholder="<spring:message code="common.enterKeyword"/>"/>
					<button type="submit" class="btn btn-light btn-outline-secondary text-dark"><spring:message code="common.search"/></button>
				</form>
			</div>
			<div class="d-flex m-1">
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