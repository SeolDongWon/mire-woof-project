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
<title>Mire woof</title>
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
	
	$("#btnRegister").on("click", function() {
		var formObj = $("#notice");
		 var check = confirm('<spring:message code="common.alert.confirmDelete"/>');
		 
		 var noticeTitle = document.getElementById('noticeTitle').value;
		 var noticeDesc = document.getElementById('noticeDesc').value;
		  
		 
		 if (noticeTitle.trim() === '') {
			    alert("<spring:message code='common.alert.cancelled'/>");
		    document.getElementById('noticeTitle').placeholder = 'noticeTitle Description cannot be empty.';
		  } else if(noticeDesc.trim() === ''){
		    document.getElementById('noticeDesc').placeholder = 'noticeDesc Description cannot be empty.';
		  }else if(check){
			  formObj.attr("action", "/notice/modifyNotice");
				formObj.attr("method", "post");
				formObj.submit();
		  }
		 
	});
	
	$("#btnList").on("click", function() {
		self.location = "/notice/getNoticeList";
	});
});
/* 
	$(document).ready(function() {
		var formObj = $("#notice");
		
		
		
		$("#btnRegister").on("click", function() {
			 var noticeTitle = document.getElementById('noticeTitle').value;
			 var noticeDesc = document.getElementById('noticeDesc').value;
			
			formObj.attr("action", "/notice/modifyNotice");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		
		
		$("#btnList").on("click", function() {
			self.location = "/notice/getNoticeList";
		});
	}); */
</script>
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
<!-- subMenu Area -->
<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<h1><spring:message code="announcement.admin.modifyNotice"/></h1>
	<section>
			<form:form modelAttribute="notice">
			<spring:message code="announcement.noticeNo"/> : <form:input path="noticeNo" class="form-control" readonly="true"/>
				<spring:message code="common.title"/> : <form:input id="noticeTitle" path="noticeTitle" class="form-control"/><br>
				<spring:message code="common.description"/> : <form:textarea id="noticeDesc" path="noticeDesc"  class="form-control" rows="5"/><br>
				
			</form:form>
			<div>
				<button type="submit" id="btnRegister"><spring:message code="common.submit"/></button>
				<button type="submit" id="btnList"><spring:message code="common.list"/></button>
			</div>
		</section>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>