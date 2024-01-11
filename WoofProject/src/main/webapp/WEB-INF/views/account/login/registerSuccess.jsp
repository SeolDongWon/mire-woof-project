<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		
		<h2 arguments="${username}" >
		</h2>
		<%-- <spring:message code="common.joinMemberSuccess"
			arguments="${username}" /> --%>
		<a href="/">홈</a>
	</div>
</body>
</html>