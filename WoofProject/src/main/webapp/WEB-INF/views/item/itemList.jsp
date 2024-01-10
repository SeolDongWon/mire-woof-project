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
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
<!-- subMenu Area -->
	<main>
<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
<!-- ================================================Content Area======================================================== -->
	<table class="table">
		<thead class="t-head">
			<tr>
				<th class="align-middle text-center">Item name</th>
				<th class="align-middle text-center">Price</th>
				<th class="align-middle text-center">Category</th>
				<th class="align-middle text-center">Main picture</th>
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
					<tr>
						<td class="align-middle text-center">${item.itemName}</td>
						<td class="align-middle text-center">${item.price}</td>
						<td class="align-middle text-center">${item.itemType}</td>
						<td class="align-middle text-center"><img src="getItemMainPic?itemNo=${item.itemNo}" width="175" height="175"></td>
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