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
    <form:form modelAttribute="pet" action="modify" enctype="multipart/form-data">
        <form:hidden path="petNo" />
        <table class="table" border="1px">
            <tr>
                <td><spring:message code="common.name" /></td>
                <td><form:input path="petName" class="form-control" /></td>
                <td><font color="red"><form:errors path="petName" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="pet.age" /></td>
                <td><form:input path="petAge" class="form-control" /></td>
                <td><font color="red"><form:errors path="petAge" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="pet.breed" /></td>
                <td><form:input path="petType" class="form-control" /></td>
                <td><font color="red"><form:errors path="petType" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="pet.gender" /></td>
                <td><form:input path="petGender" class="form-control" /></td>
                <td><font color="red"><form:errors path="petGender" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="common.description" /></td>
                <td><form:textarea path="petDesc" class="form-control" /></td>
                <td><font color="red"><form:errors path="petDesc" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="common.modDate" /></td>
                <td>${pet.petModDate}</td>
            </tr>
            <tr>
                <td><spring:message code="pet.petStatus" /></td>
                <td>
					<select class="form-control" name="petStatus" id="petStatus">
						<option value="OPEN"><spring:message code="common.open"/></option>
						<option value="CLOSED"><spring:message code="common.closed"/></option>
					</select>
				</td>
            </tr>
            <tr>
                <td><spring:message code="common.mainPic" /></td>
                <td><img src="getPetMainPic?petNo=${pet.petNo}" width="210" height="240" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="pictures" class="form-control-file" />
                <input type="hidden" name="petMainPic" value="${pet.petMainPic}" readonly="readonly"> </td>
            </tr>
            <tr>
                <td><spring:message code="common.subPic" /></td>
                <td><img src="getPetSubPic?petNo=${pet.petNo}" width="210" height="240" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="pictures" class="form-control-file" />
                <input type="hidden" name="petSubPic" value="${pet.petSubPic}" readonly="readonly"></td>
            </tr>
        </table>
    </form:form>
	</div>
	<div align="center">
	    <button type="submit" class="btn btn-primary m-2" id="btnModify"><spring:message code="common.modify" /></button>
	    <button type="submit" class="btn btn-light btn-outline-secondary text-dark m-2" id="btnList"><spring:message code="common.list" /></button>
	</div>
</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>