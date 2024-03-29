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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/common/style.jsp"%>
<%@ include file="/WEB-INF/views/common/script.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

<main class="container-sm mt-4">
	<div class="table-responsive">
    	<table class="table table-sm table-smaller">
        	<thead class="t-head">
            	<tr>
                	<td class="align-middle text-center p-3">
                    	<h5><b><spring:message code="orderHistory.myOrderHistory"/></b></h5>
                   	</td>
               	</tr>
          	</thead>
      	</table>
   	</div>
	<div class="col">
    	<c:choose>
        	<c:when test="${empty orderHistoryList}">
            	<div class="col">
                	<div class="card">
                    	<div class="card-body text-center">
                        	<p class="card-text"><spring:message code="orderHistory.emptyOrderHistory"/></p>
                      	</div>
                  	</div>
              	</div>
         	</c:when>
     	<c:otherwise>
        	<c:forEach items="${orderHistoryList}" var="orderHistory">
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
                            		<b><spring:message code="orderHistory.orderDetails"/></b>
                            	</a>
                        	</div>
                          	</div>
                                <p class="card-text"><spring:message code="orderHistory.orderHistoryNo"/> : ${orderHistory.orderHistoryNo}</p>
                               	<p class="card-text"><spring:message code="orderHistory.totalPrice"/> : ₩${orderHistory.totalPrice}</p>
                             	<p class="card-text"><spring:message code="orderHistory.deliveryAddress"/> : ${orderHistory.address}</p>
                        	</div>
                    	</div>
                	</div>
            	</c:forEach>
        	</c:otherwise>
    	</c:choose>
	</div>
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>