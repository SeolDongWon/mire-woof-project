<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<div class="table-responsive">
			<table class="table table-sm table-smaller">
				<thead class="t-head">
					<tr>
						<td class="align-middle text-center p-3">
							<h5>
								<b><spring:message code="orderHistory.orderHistoryNo"/> ${orderHistory.orderHistoryNo}</b>
							</h5>
						</td>
					</tr>
				</thead>
			</table>
		</div>
		<div class="col m-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col">
							<h5 class="card-title">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orderHistory.orderDate}" />
							</h5>
						</div>
						<div class="col text-end">
							<a href="/orderItem/getOrderItemList?orderHistoryNo=${orderHistory.orderHistoryNo}" class="btn btn-sm btn-light text-dark m-2">
							<b><spring:message code="orderHistory.orderDetails" /></b></a>
						</div>
					</div>
					<p class="card-text">
						<spring:message code="orderHistory.orderHistoryNo" />
						: ${orderHistory.orderHistoryNo}
					</p>
					<p class="card-text">
						<spring:message code="orderHistory.totalPrice" />
						: ₩${orderHistory.totalPrice}
					</p>
					<p class="card-text">
						<spring:message code="orderHistory.deliveryAddress" />
						: ${orderHistory.address}
					</p>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>