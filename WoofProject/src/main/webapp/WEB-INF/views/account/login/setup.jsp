<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


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
<script>
	$(document).ready(function() {
		let formObj = $("#account");
		$("#btnRegister").on("click", function() {
			alert("test");
			formObj.submit();
		});
		$("#btnHom").on("click", function() {
			alert("btnHom");
			self.location = "/account/login";
		});
	});
</script>


<!-- 내집 주소링크 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Script -->
<%@ include file="/WEB-INF/views/common/accountScript.jsp"%>


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
	<%-- <%@ include file="/WEB-INF/views/common/mainMenu.jsp"%> --%>
	<!-- subMenu Area -->
	<main>
	
	
	
	<form  action="/account/setup" method="post" name="joinform" onsubmit="doSubmit(); return false;">
			<div class="container mt-3" style="width: 750px;">
				<table class="table table-borderless" style="margin-top: 100px;">
					<tr>
						<td colspan='2'><h2>관리자 가입</h2></td>
					</tr>
					<tr>
						<th style="width: 150px">아이디</th>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="username" id="username" class="form-control" placeholder="5~13자리 영,숫자,특수문자( _ )만 입력"  onblur="idCheck()">
							</div>
						</th>
					</tr>

					<tr>
						<td>비밀번호</td>
						<th>
							<div class="input-group mb-3">
								<input type="password" name="password" id="password" class="form-control" placeholder="5~13자리 영문,숫자, 특수문자만 가능"  onblur="pwCheck()">

							</div>
						</th>
					</tr>
					<tr>
						<td>이 름</td>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="name" id="name" class="form-control" placeholder="2~13자리 한,영문만 가능"  onblur="nameCheck()">
							</div>
						</th>
					</tr>
					<tr>
						<td>전화번호</td>
						<th>
							<div class="input-group mb-3">
								<input type="text" name="tel" id="tel" class="form-control" placeholder="11자리 숫자만 가능합니다."  onblur="telCheck()">
							</div>
						</th>
					</tr>
					<tr>
						<td>주 소</td>
						<th>
							<div class="d-flex  justify-content-center">
								<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" name="address1">
					            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: none; background-color: rgb(255, 255, 255);">
					        </div>
					           <input type="text" size="45px" id="sample6_address" placeholder="주소" class="form-control" name="address2">
					           <input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control" name="address3">
					           <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control" name="address4">
					     </th>
					</tr>

					<tr>
						<td colspan='2'>
						<button type="submit"
								class="form-control" style="background: rgb(246, 220, 216); border: none; ">관리자 가입</button>
						
					</tr>
				</table>
			</div>
		</form>
		<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->


	</main>
	<!-- Footer Area -->
	<%-- <%@ include file="/WEB-INF/views/common/footer.jsp"%> --%>
</body>
</html>