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
		var formObj = $("#review");
		$("#btnRegister").on("click", function() {
			formObj.attr("action", "/review/insertPetReview");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/review/getReviewList";
		});
	});
</script>
<style>

textarea {
  width: 100%;
  height: 200px;
}
</style>
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
		<div align="center">
    <section>
        <h5><spring:message code="pet.insertReview"/></h5>
        <div class="card" style="width: 35rem;">
            <div class="card-body">
                <form:form modelAttribute="review" action="insertPetReview" method="post" enctype="multipart/form-data">
                    <div class="form-group m-2">
                        <label><spring:message code="common.title"/></label>
                        <form:input path="reviewTitle" class="form-control" />
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.description"/></label>
                        <form:textarea path="reviewDesc" class="form-control" rows="4"></form:textarea>
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.author"/></label>
                        <form:input path="username" readonly="true" class="form-control" />
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.picture"/></label>
                        <input type="file" name="pictures" path="reviewPic" />
                    </div>
                    <div class="form-group d-flex justify-content-center m-2">
                        <button type="submit" class="btn btn-primary m-2" id="btnRegister"><spring:message code="common.submit"/></button>
                        <button type="button" class="btn btn-light btn-outline-secondary text-dark m-2" id="btnList"><spring:message code="common.list"/></button>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
</div>
</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>