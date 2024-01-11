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
<script src="https://kit.fontawesome.com/129ed5580c.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#cartForm").submit(function(event) {
			event.preventDefault();
			var formData = $(this).serialize();
			$.ajax({
				url: $(this).attr("action"),
				type: $(this).attr("method"),
				data: formData,
				success: function(response) {
					console.log("Success", response);
					location.reload();
				},
				error: function(error) {
					console.log("Error", error);
				}
			});
		});
		$("#btnRemoveSelected").on("click", function() {
		
		});
	});
</script>
<script>
	function sendChecked() {
		var selectedItems = [];
		$("input[name='checkStatus']:checked").each(function(){
			selectedItems.push($(this).val());
		});
		
		if(selectedItems.length > 0) {
			console.log("selectedItems length: " + selectedItems.length);
			
			var flatItems = [].concat.apply([], selectedItems);
			$("#selectedItemsInput").val(flatItems);
			
			document.getElementById("cartForm").submit();
		} else {
			alert("Please select at least one item to check out");
		}
	};
</script>

<%-- <%@ include file="" %> --%>
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
<!-- subMenu Area -->
	<main>
<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
<!-- ================================================Content Area======================================================== -->
	<form id="cartForm" action="getOrder" method="post">
		<table class="table">
			<thead class="t-head">
				<tr>
					<th></th>
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
								<input type="checkbox" name="checkStatus" value="${cart.itemNo}"/>
							</td>
							<td class="align-middle text-center">
								<a href="${pageContext.request.contextPath}/item/getItem?itemNo=${cart.itemNo}">
									<img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${cart.itemNo}" width="150" height="150">
								</a>
							</td>
							<td class="align-middle text-center">${cart.itemName}</td>
							<td class="align-middle text-center">${cart.quantity}</td>
							<td class="align-middle text-center">${cart.price}</td>
							<td class="align-middle text-center">
								<a href="removeFromCart?username=${cart.username}&itemNo=${cart.itemNo}" class="text-decoration-none">
									<i class="fa-sharp fa-regular fa-rectangle-xmark text-danger"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<input type="hidden" id="selectedItemsInput" name="selectedItems" value="">
		
		<div class="d-flex flex-row justify-content-end align-items-center">
			<button class="btn btn-light btn-outline-secondary text-dark m-2" id="btnRemoveAll">Remove all items</button>
			<button class="btn btn-light btn-outline-secondary text-dark m-2" id="btnRemoveSelected">Remove selected items</button>
			<button class="btn btn-light btn-outline-secondary text-dark m-2" id="btnCheckout" type="submit" onclick="sendChecked()">Check out</button>
		</div>
	</form>	
	
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>