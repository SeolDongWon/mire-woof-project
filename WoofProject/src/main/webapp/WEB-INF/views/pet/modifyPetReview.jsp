<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		var formObj = $("#review");
		$("#btnModify").on("click", function() {
			formObj.attr("action", "/review/modifyReview");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/review/getReviewList";
		});
	});
</script>
<style>
table {
  border-radius: 5px;
}
</style>
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
<!-- subMenu Area -->
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
	<div align="center">
    <form:form modelAttribute="review" action="modifyReview" enctype="multipart/form-data">
        <form:hidden path="reviewNo" />
        <table class="table" border="1">
            <tr>
                <td><spring:message code="common.title" /></td>
                <td><form:input path="reviewTitle" class="form-control" /></td>
                <td><font color="red"><form:errors path="reviewTitle" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="common.description" /></td>
                <td><form:input path="reviewDesc" class="form-control" /></td>
                <td><font color="red"><form:errors path="reviewDesc" /></font></td>
            </tr>
            <tr>
                <td><spring:message code="common.modDate" /></td>
                <td>${review.reviewModDate}</td>
            </tr>
            <tr>
                <td><spring:message code="common.picture" /></td>
                <td><img src="getReviewPic?reviewNo=${review.reviewNo}" width="210" height="240" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="pictures" class="form-control-file" /></td>
            </tr>
        </table>
    </form:form>
</div>
<div align="center">
    <button type="submit" class="btn btn-primary m-2" id="btnModify"><spring:message code="common.modify" /></button>
    <button type="submit" class="btn btn-light btn-outline-secondary text-dark m-2" id="btnList"><spring:message code="common.list" /></button>
</div>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>