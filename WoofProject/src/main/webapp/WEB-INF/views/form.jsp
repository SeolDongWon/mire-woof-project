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
<title>Image Shop</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>


	<!-- Content Area -->
	<div align="center">
	
		<h1>
			<!-- 메시지 프로퍼티 파일로부터 메시지 내용을 읽어온다. -->
			<spring:message code="common.homeWelcome" />
		</h1>
		<P>${serverTime}</P>
		
	</div>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>