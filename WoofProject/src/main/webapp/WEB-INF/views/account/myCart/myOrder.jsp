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
<script>
	$(document).ready(function() {
	    var formObj = $("#cartForm");
	    $("#btnReturnToCart").on("click", function() {
            formObj.attr("action", "/cart/myCart");
            formObj.attr("method", "get");
            formObj.submit();
	    });

	    $("#btnProceedCheckout").on("click", function() {
	        
	    });
	    
	});
</script>
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
	<form id="cartForm">
		<input type="hidden" name="username" value="${pageContext.request.userPrincipal.principal.account.name}"/>
		<table class="table">
			<thead class="t-head">
				<tr>
					<th class="align-middle text-center">Main picture</th>
					<th class="align-middle text-center">Item name</th>
					<th class="align-middle text-center">Quantity</th>
					<th class="align-middle text-center">Price</th>
					<th></th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty cartList}">
					<tr>
						<td colspan="5" style="text-align:center">There are no items in your cart</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td class="align-middle text-center">
								<a href="${pageContext.request.contextPath}/item/getItem?itemNo=${cart.itemNo}">
									<img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${cart.itemNo}" width="150" height="150">
								</a>
							</td>
							<td class="align-middle text-center">${cart.itemName}</td>
							<td class="align-middle text-center">${cart.itemQuantity}</td>
							<td class="align-middle text-center">${cart.itemPrice}</td>
							<td class="align-middle text-center">
								<a href="removeFromCart?username=${cart.username}&itemNo=${cart.itemNo}" class="text-decoration-none">
									<i class="fa-sharp fa-regular fa-rectangle-xmark"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>	
	<div class="d-flex flex-row justify-content-end align-items-center">
		<button class="btn btn-light btn-outline-secondary text-dark m-2" id="btnReturnToCart">Return to my cart</button>
		<button class="btn btn-success btn-outline-secondary text-light m-2" id="btnProceedCheckout"><b>Proceed checkout</b></button>
	</div>
	<section>
	</section>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>