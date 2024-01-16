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
	<main>
<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
<!-- ================================================Content Area======================================================== -->
	<table class="table">
		<thead class="t-head">
			<tr>
				<td colspan="5" class="align-middle text-center p-3"><h5><b>Order History</b></h5></td>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty orderHistoryList}">
				<tr>
					<td colspan="5" style="text-align:center">You have not made any orders</td>
				<tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${orderHistoryList}" var="orderHistory">
					<tr>
						<td colspan="5">
							<div class="d-flex justify-content-between">
								<div class="align-middle text-start ps-3">
									<b><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orderHistory.orderDate}" /></b>
								</div>
								<div class="align-middle text-end pe-3">
									<a href="" class="text-decoration-none"><b>Order details</b></a>
								</div>
							</div>
							<div class="ps-4">Total price: ${orderHistory.totalPrice}</div>
							<div class="ps-4">Delivery address: ${orderHistory.address}</div>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>