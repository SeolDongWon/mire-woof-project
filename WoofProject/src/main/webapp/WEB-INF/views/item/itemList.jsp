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
<main>
<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
<!-- ================================================Content Area======================================================== -->
	<div class="pt-3 mb-2">
		<form action="/item/searchByKeyword" method="post">
	        <div class="input-group">
	            <select name="condition" class="form-select w-20">
		            <option value="itemName" selected><spring:message code="item.searchCondition1"/></option>
		            <option value="itemType"><spring:message code="item.searchCondition2"/></option>
	            </select>
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
					<td colspan="4" style="text-align:center">There are no items</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${itemList}" var="item">
					<c:if test="${not empty item.itemStatus and item.itemStatus ne 'CLOSED'}">
						<tr>
							<td class="align-middle text-center">
								<a href="getItem?itemNo=${item.itemNo}"><img src="getItemMainPic?itemNo=${item.itemNo}" alt="Item Main Picture" width="175" height="175"></a>
							</td>
							<td class="align-middle text-center">${item.itemName}</td>
							<td class="align-middle text-center">${item.itemType}</td>
							<td class="align-middle text-center">₩${item.itemPrice}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="text-end">
			<a href="/item/admin/insertItem" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="item.insertItem"/></a>
			<a href="/item/modifyItem" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="item.modifyItem"/></a>	
		</div>
	</sec:authorize>
</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>