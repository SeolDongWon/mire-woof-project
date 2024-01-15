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
<script>
	$(document).ready(function() {
		var formObj = $("#pet");
		$("#btnModify").on("click", function() {
			formObj.attr("action", "/pet/modifyPet");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/pet/getPetList";
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
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<main class="pt-2" >
		<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
		<div align="center">
		<h2>수정</h2>
		<form:form modelAttribute="pet" action="modify"
			enctype="multipart/form-data">
			<form:hidden path="petNo"/>
			<%-- <form:hidden path="petName" />
			<form:hidden path="petAge" />
			<form:hidden path="petType" />
			<form:hidden path="petGender" />
			<form:hidden path="petDesc" /> --%>
			<%-- <form:hidden path="petModDate" /> --%>
		    <%-- <form:hidden path="getPetMainPic" />
			<form:hidden path="getPetSubPic" />  --%>
			<table>
				<tr>
					<td>애칭</td>
					<td><form:input path="petName" /></td>
					<td><font color="red"><form:errors path="petName" /></font></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><form:input path="petAge" /></td>
					<td><font color="red"><form:errors path="petAge" /></font></td>
				</tr>
				<tr>
					<td>견종</td>
					<td><form:input path="petType" /></td>
					<td><font color="red"><form:errors path="petType" /></font></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><form:input path="petGender" /></td>
					<td><font color="red"><form:errors path="petGender" /></font></td>
				</tr>
				<tr>
					<td>소개</td>
					<td><form:textarea path="petDesc" /></td>
					<td><font color="red"><form:errors path="petDesc" /></font></td>
				</tr>
				 <tr>
					<td>수정일</td>
					<td><form:input path="petModDate" /></td>
					<td><font color="red"><form:errors path="petModDate" /></font></td>
				</tr> 
				<tr>
					<td>입양유무</td>
					<td><form:input path="petStatus" /></td>
					<td><font color="red"><form:errors path="petStatus" /></font></td>
				</tr>
				 <tr>
					<td>메인사진</td>
					<td><img src="getPetMainPic?petNo=${pet.petNo}" width="210"
						height="240" /></td>
				</tr>
				<tr>
					<td>메인사진</td>
					<td><input type="file" name="pictures" /></td>
				</tr>
				<tr>
					<td>서브사진</td>
					<td><img src="getPetSubPic?petNo=${pet.petNo}" width="210"
						height="240" /></td>
				</tr>
				<tr>
					<td>서브사진</td>
					<td><input type="file" name="pictures" /></td>
				</tr> 
			</table>
		</form:form>
		</div>
	</main>
	<div>
		<button type="submit" id="btnModify">Modify</button>
		<button type="submit" id="btnList">List</button>
	</div>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>