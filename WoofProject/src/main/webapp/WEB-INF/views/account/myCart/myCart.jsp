<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mire Woof</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/common/style.jsp"%>
<%@ include file="/WEB-INF/views/common/script.jsp"%>

<script src="https://kit.fontawesome.com/129ed5580c.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#cartForm").submit(function(event) {
			event.preventDefault();
			
			var selectedItems = getSelectedItems();
			console.log("selectedItems: ", selectedItems);
			var requestData = {
				selectedItems: selectedItems,
			};
			
			if(selectedItems.length > 0) {
				$("#selectedItemsInput").val(selectedItems);
				
				var action = $(event.originalEvent.submitter).attr('id') === 'btnCheckout' ? 'getOrder' : 'removeChecked';
				this.action = action;
				
				console.log("action: ", action);
				if(action === 'removeChecked') {
					$.ajax({
					    type: "POST",
					    url: "removeChecked",
					    contentType: "application/json", 
					    data: JSON.stringify(requestData),
					    success: function (data) {
					    	console.log("Items removed successfully")
					        location.reload();
					    },
					    error: function (error) {
					        console.log("Error removing items", error);
					    }
					});
					
				} else {
				this.submit();
				}
			} else {
				alert("<spring:message code='cart.alert.noneSelected'/>");
			}
		});
		
		function getSelectedItems() {
			var selectedItems = [];
			$("input[name='checkStatus']:checked").each(function(){
				selectedItems.push($(this).val());
			});
			return [].concat.apply([], selectedItems);
		}
		
		$(".remove-from-cart-btn").on("click", function(event) {
			event.preventDefault();
			
			var itemNo = $(this).attr("data-itemNo");
			var username = '${pageContext.request.userPrincipal.principal.account.name}';
			console.log("itemNo: ", itemNo)
			console.log("username: ", username)
			
			var requestData = {
				itemNo: itemNo,
				username: username
			};
			
			$.ajax({
				type: "POST",
				url: "removeFromCart",
				contentType: "application/json", 
				data: JSON.stringify(requestData),
				success: function(data) {
					var row = $("input[value='" + itemNo + "']").closest("tr");
					row.remove();
					console.log("Item removed successfully");
				},
				error: function(error) {
					console.log("Error removing item", error);
				}
			});
		});
		
		$(".select-all-btn").on("click", function () {
			var checked = !$(this).data("checked");
			$(this).data("checked", checked);
			$("input[name='checkStatus']").prop("checked", checked);
		});
		
		$(".decrease-quantity-btn").on("click", function() {
			var itemNo = $(this).attr("data-itemNo");
			var selectedElement = $('#quantity-' + itemNo);
			var currentQuantity = parseInt(selectedElement.text());
			console.log("currentQuantity: ", currentQuantity);
			
			if(currentQuantity > 1){ 
				modifyQuantity(itemNo, currentQuantity-1, selectedElement);
			} else {
				alert("<spring:message code='cart.alert.minQuantity'/>");
			}
		});
		
		$(".increase-quantity-btn").on("click", function() {
			var itemNo = $(this).attr("data-itemNo");
			var selectedElement = $('#quantity-' + itemNo);
			var currentQuantity = parseInt(selectedElement.text());
			console.log("currentQuantity: ", currentQuantity);
			
			if(currentQuantity < 10){ 
				modifyQuantity(itemNo, currentQuantity+1, selectedElement);
			} else {
				alert("<spring:message code='cart.alert.maxQuantity'/>");
			}
		});
		
		function modifyQuantity(itemNo, newQuantity, selectedElement) {
			
			var requestData = {
				itemNo: itemNo,
				newQuantity: newQuantity
			};
			console.log("requestData: ", requestData);

			$.ajax({
				type: "POST",
				url: "modifyQuantity",
				contentType: "application/json",
				data: JSON.stringify(requestData),
				
				success: function(data) {
					selectedElement.text(newQuantity);
					console.log("Quantity updated");
				},
				error: function(error) {
					console.log("Error updating quantity", error)	
				}
			});
		}
	});
</script>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

<main>
	<div class="table-responsive">
        <table class="table table-sm table-smaller">
            <thead class="t-head">
                <tr>
                    <td class="align-middle text-center p-3">
                        <h5><b><spring:message code="cart.myCart"/></b></h5>
                    </td>
                </tr>
            </thead>
        </table>
    </div>
	<form id="cartForm" action="#" method="post">
		<table class="table">
			<thead class="t-head">
				<tr>
					<th class="align-middle text-center">
						<button type="button" class="select-all-btn text-decoration-none border-0 bg-transparent">
							<i class="fa-solid fa-check-double text-primary"></i>
						</button>
					</th>
					<th class="align-middle text-center"></th>
					<th class="align-middle text-center"><spring:message code="item.itemName"/></th>
					<th class="align-middle text-center"><spring:message code="common.quantity"/></th>
					<th class="align-middle text-center"><spring:message code="common.price"/></th>
					<th></th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty cartList}">
					<tr>
						<td colspan="5" style="text-align:center"><spring:message code="cart.emptyCart"/></td>
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
							<td class="align-middle text-center">
								<button type="button" class="decrease-quantity-btn text-decoration-none border-0 bg-transparent" data-itemNo="${cart.itemNo}">
									<i class="fa-solid fa-caret-left text-primary"></i>
								</button>
								<span id="quantity-${cart.itemNo}"> ${cart.itemQuantity} </span>
								<button type="button" class="increase-quantity-btn text-decoration-none border-0 bg-transparent" data-itemNo="${cart.itemNo}">
									<i class="fa-solid fa-caret-right text-primary"></i>
								</button>	
							</td>
							<td class="align-middle text-center">₩${cart.itemPrice}</td>
							<td class="align-middle text-center">
								<button type="button" class="remove-from-cart-btn text-decoration-none border-0 bg-transparent" data-username="${cart.username}" data-itemNo="${cart.itemNo}">
									<i class="fa-sharp fa-regular fa-rectangle-xmark text-danger"></i>
								</button>						
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<input type="hidden" id="selectedItemsInput" name="selectedItems" value="">
		
		<div class="d-flex flex-row justify-content-end align-items-center">
			<a href="${pageContext.request.contextPath}/orderHistory/getOrderHistoryList" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="cart.viewOrderHistory"/></a>
			<button class="btn btn-danger m-2" id="btnRemoveSelected" type="submit"><spring:message code="cart.removeSelectedItems"/></button>
			<button class="btn btn-primary m-2" id="btnCheckout" type="submit"><spring:message code="cart.checkOut"/></button>
		</div>
	</form>	
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>