<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mire Woof</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<%@ include file="/WEB-INF/views/common/script.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
<main>
<!-- ================================================Content Area======================================================== -->
	<h3 class="text-center">${item.itemType}</h3>	
	<div class="pt-3 mb-2 w-50 m-auto">
		<form action="/item/itemList" method="get">
	        <div class="input-group">
	            <input type="hidden" name="itemType" readonly="readonly" value="${item.itemType}">
	            <input type="text" name="keyword" class="form-control w-75" placeholder="<spring:message code="common.enterKeyword"/>">
	            <button class="btn btn-outline-secondary text-dark" type="submit"><spring:message code="common.search"/></button>
	        </div>
	    </form>
	</div>
	<table class="table">
		<thead class="t-head">
			<tr>
				<th class="align-middle text-center"></th>
				<th class="align-middle text-center"><spring:message code="item.item"/></th>
				<th class="align-middle text-center"><spring:message code="item.itemType"/></th>
				<th class="align-middle text-center"><spring:message code="common.price"/></th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty itemList}">
				<tr>
					<td colspan="4" style="text-align:center"><spring:message code="item.noItems"/></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${itemList}" var="item">
					<c:if test="${not empty item.itemStatus and item.itemStatus ne 'CLOSED'}">
						<tr>
							<td class="align-middle text-center">
								<a href="getItem?itemNo=${item.itemNo}"><img src="getItemMainPic?itemNo=${item.itemNo}" alt="Item Main Picture" width="175" height="175"></a>
							</td>
							<td class="align-middle text-center"><a href="getItem?itemNo=${item.itemNo}" style="text-decoration: none;color: black">${item.itemName}</a></td>
							<td class="align-middle text-center">${item.itemType}</td>
							<td class="align-middle text-center">₩${item.itemPrice}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="d-flex">
			<ul class="pagination m-auto">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link"
						href="/item/itemList?page=${pagination.startPage - 1}&PageNum=${pageRequest.sizePerPage}&itemType=${item.itemType}&keyword=${pageRequest.keyword}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<li class="page-item"><a class="page-link"
						href="/item/itemList${pagination.makeQuery(idx)}&itemType=${item.itemType}&keyword=${pageRequest.keyword}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/item/itemList?page=${pagination.endPage +1}&PageNum=${pageRequest.sizePerPage}&itemType=${item.itemType}&keyword=${pageRequest.keyword}">Next</a></li>
				</c:if>
			</ul>
		</div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="text-end">
			<a href="/item/admin/insertItem" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="item.insertItem"/></a>
			<a href="/item/modifyItem" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="item.modifyItem"/></a>	
		</div>
	</sec:authorize>
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>