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
</script>
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
	<form:form modelAttribute="item" action="${pageContext.request.contextPath}/cart/addToCart" onsubmit="alert('Item added');">
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
							<td colspan="2" class="align-middle text-center">
								<button type="submit" class="btn btn-primary btn-outline-secondary text-white m-2">
									<spring:message code="item.addToCart"/>
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div> 
	</form:form><hr>
	<div class="container-lg d-flex align-items-center">
		<div class="m-3 mx-auto">
			<img src="getItemSubPic?itemNo=${item.itemNo}" width="1000" height="3000">
		</div>
	</div>
		<%@ include file="/replyInclude.jsp"%>

	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>