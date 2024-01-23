<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mire Woof</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/common/style.jsp"%>

<script>
	function goBack() {
	    window.history.back();
	}
</script>

<%@ include file="/WEB-INF/views/common/script.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>

<main class="pt-2">
   	<div style="text-align: center; padding: 50px;">
    	<h1 class="text-danger">
       		<spring:message code="error.sql"/>
       	</h1>
       	<button onclick="goBack()" class="btn btn-success p-2 m-2">
       		<spring:message code="error.goBack"/>
       	</button>
       	<sec:authorize access="hasRole('ROLE_ADMIN')">
	        <hr>
	        <h5 style="text-align:left;">
	        	<b><spring:message code="error.actualError"/></b>
	        </h5>
	        <div style="margin-top: 20px; background-color: #f8d7da; padding: 10px; border: 1px solid #f5c6cb; text-align:left;">
	           	${actualErrorMessage}
	      	</div>
 		</sec:authorize>
  	</div>
</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>