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
<%@ include file="/WEB-INF/views/common/script.jsp"%>
<!-- css local Area 각 개별페이지 css 경로는 여기다가 쓸 것-->
<%-- <%@ include file="" %> --%>
<!-- script local Area  각 개별페이지 script 경로는 여기다가 쓸 것 -->
<%-- <%@ include file="" %> --%>
<script>
	$(document).ready(function() {
		var formObj = $("#serviceForm");
		
		
		$("#btnModify").on("click", function() {
			  var check = confirm("<spring:message code='common.alert.confirmSubmit'/>");
			  
			  if (check) {
				  formObj.attr("action", "/service/modifyService");
					formObj.submit();
			   }
			   else {
			      alert("'<spring:message code='common.alert.cancelled'/>'");
			   }
		});
		
		$("#btnList").on("click", function() {
			self.location = "/service/getServiceList";
		});
		
	});
</script>
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
<!-- subMenu Area -->
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<div class="mt-3 w-75 m-auto">
	<h4><spring:message code="service.modifyService"/></h4>
			<form id="serviceForm" method="post">
				<spring:message code="common.username"/> : <input name="username" class="form-control" value="${service.username}" readonly="true"/> 
				<spring:message code="common.description"/> : <textarea name="serviceDesc"  class="form-control" rows="5">${service.serviceDesc}</textarea>
			</form>
			<div>
				<button type="submit" id="btnModify"><spring:message code="common.modify"/></button>
				<button type="submit" id="btnList"><spring:message code="common.list"/></button>
			</div>
		</div>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>