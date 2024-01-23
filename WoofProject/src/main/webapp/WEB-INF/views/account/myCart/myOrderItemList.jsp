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

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

<main class="container mt-4">
	<div class="table-responsive">
    	<table class="table table-sm table-smaller">
        	<thead class="t-head">
            	<tr>
                	<td class="align-middle text-center p-3">
                    	<h5><b><spring:message code="orderHistory.detailedOrderHistory"/></b></h5>
                    </td>
               	</tr>
           	</thead>
       	</table>
  	</div>

 	<div class="row">
    	<c:set var="totalPrice" value="0" />
        	<c:forEach items="${orderItemList}" var="orderItem">
           		<c:set var="itemTotalPrice" value="${orderItem.itemQuantity * orderItem.itemPrice}"/>
           		<c:set var="totalPrice" value="${totalPrice + itemTotalPrice}"/>
           		<div class="col-md-4">
                  	<div class="card shadow-sm">
                      	<a href="${pageContext.request.contextPath}/item/getItem?itemNo=${orderItem.itemNo}">
                          	<img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${orderItem.itemNo}"
                      			class="card-img-top" alt="Item Image" style="height: 250px;">
  	                   	</a>
                       	<div class="card-body">
                           	<h5 class="card-title text-center"><b>${orderItem.itemName}</b></h5>
                           	<div class="row p-2">
					        <div class="col-md-6">
					        	<p class="card-text"><b><spring:message code="common.quantity"/></b></p>
					            <p class="card-text"><b><spring:message code="common.price"/></b></p>
					            <p class="card-text"><b><spring:message code="orderHistory.totalItemPrice"/></b></p>
					        </div>
					        <div class="col-md-6 text-end">
					            <p class="card-text">${orderItem.itemQuantity}</p>
					            <p class="card-text">₩${orderItem.itemPrice}</p>
					            <p class="card-text">₩${itemTotalPrice}</p>
					        </div>
						</div>
                	</div>
              	</div>
              	<form action="/review/insertItemReviewForm" method="post">
                	<input type="hidden" name="itemNo" value="${orderItem.itemNo}" readonly="readonly">
                    <input type="hidden" name="itemName" value="${orderItem.itemName}" readonly="readonly">
               		<button class="btn btn-light btn-outline-secondary text-dark m-2 float-end">
               			<spring:message code="reply.addReview"/>
               		</button>
             	</form>
          	</div>
      	</c:forEach>
   		<div class="row p-2">
  			<div class="col align-center">
       			<sec:authorize access="hasRole('ROLE_MEMBER')">
       				<a href="/orderHistory/getOrderHistoryList" class="btn btn-light btn-outline-secondary text-dark m-2">
       					<spring:message code="orderHistory.returnToOrderHistory"/>
       				</a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
       				<a href="/orderHistory/getOrderHistory?orderHistoryNo=${orderNo}" class="btn btn-light btn-outline-secondary text-dark m-2">
       					<spring:message code="orderHistory.viewOrderHistory"/>
       				</a>
       				<a href="/service/getServiceList" class="btn btn-light btn-outline-secondary text-dark m-2">
       					<spring:message code="orderHistory.returnToService"/>
       				</a>
				</sec:authorize>	
       		</div>
	       	<div class="col align-center text-end">
	       		<b><spring:message code="orderHistory.totalPrice"/> : ₩${totalPrice}</b>
	       	</div>
  		</div>
	</div>
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>