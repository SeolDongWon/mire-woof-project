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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/common/style.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

<main>
	<form:form modelAttribute="item" action="${pageContext.request.contextPath}/cart/addToCart">
		<input type="hidden" name="itemNo" value="${item.itemNo}"/>
		<input type="hidden" name="itemName" value="${item.itemName}"/>
		<input type="hidden" name="itemType" value="${item.itemType}"/>
		<input type="hidden" name="itemPrice" value="${item.itemPrice}"/>
		<input type="hidden" name="itemMainPic" value="${item.itemMainPic}"/>
		
		<div class="d-flex flex-col align-items-center">
			<div class="d-flex justify-content-center align-items-center">
				<div class="m-3">
					<img src="getItemMainPic?itemNo=${item.itemNo}" width="400" height="400">
				</div>
				<div class="m-3 border rounded p-2">
					<table class="table" style="width:700px">
						<tr>
							<td colspan="2" class="text-end pe-5"><b>${item.itemName}</b></td>
						</tr>
						<tr>
							<td><spring:message code="item.itemType"/></td>
							<td>${item.itemType}</td>
						</tr>
						<tr>
							<td><spring:message code="common.price"/></td>
							<td>₩${item.itemPrice}</td>
						</tr>
						<tr>
							<td><spring:message code="item.date"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item.itemRegDate}" /></td>
						</tr>
						<sec:authorize access="hasRole('ROLE_Admin')">
							<tr>
								<td><spring:message code="item.itemStock"/></td>
								<td>${item.itemStock}</td>
							</tr>
						</sec:authorize>
						<tr>
							<td><spring:message code="item.selectQuantity"/></td>
							<td>
							 <select id="itemQuantity" name="itemQuantity">
			                    <c:forEach var="i" begin="1" end="10">
			                        <option value="${i}">${i}</option>
			                    </c:forEach>
			                </select>
							</td>
						</tr>
						<tr>
							<td colspan="2">${item.itemDesc}</td>
						</tr>
						<tr>
							<td colspan="3" class="align-middle text-center">
								<div class=" row p-0 m-0">
									<div class="col-4">
									</div>
									<sec:authorize access="hasRole('ROLE_MEMBER')">
									<div class="col-4">
										<button type="submit" class="btn btn-primary btn-outline-secondary text-white m-2">
											<spring:message code="item.addToCart"/>
										</button>
									</div>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<div class="col-4">
										<a href="/item/modifyItem?itemNo=${item.itemNo}"  class="btn btn-primary btn-outline-secondary text-white m-2">
											<spring:message code="common.modify"/>
										</a>
									</div>							
									</sec:authorize>
								</div>	
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div> 
	</form:form><hr>
	<div class="container-lg d-flex align-items-center">
		<div class="m-3 mx-auto">
			<img src="getItemSubPic?itemNo=${item.itemNo}" width="1000">
		</div>
	</div>
	<%@ include file="/WEB-INF/views/item/itemReviewInclude.jsp"%>
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>