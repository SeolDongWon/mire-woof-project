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
		$("#btnRegister").on("click", function() {
			if(notEntered()){
				
			formObj.attr("action", "/pet/insertPet");
			formObj.attr("method", "post");
			formObj.submit();
			}
		});
		$("#btnList").on("click", function() {
			self.location = "/pet/getPetList";
		});
	});
	
	function notEntered() {
		if(document.getElementById("petName").value == ""){
			alert("이름을 입력하세요");
			document.getElementById("petName").focus();
			return;
		}
		if(document.getElementById("petAge").value == "0"){
			alert("나이를 입력하세요");
			document.getElementById("petAge").focus();
			return;
		}
		if(document.getElementById("petType").value == ""){
			alert("품종을 입력하세요");
			document.getElementById("petType").focus();
			return;
		}
		if (document.getElementById("petGender").checked === false &&
			    document.getElementById("petGender").checked === false) {
			    alert("성별을 선택해주세요");
			    document.getElementById("petGender").focus(); 
			    event.preventDefault(); 
			    return;
			}
		if(document.getElementById("petDesc").value == ""){
			alert("내용을 입력해주세요");
			document.getElementById("petDesc").focus();
			return;
		}
		if(document.getElementById("pictures").value == ""){
			alert("사진을 선택해주세요");
			document.getElementById("pictures").focus();
			return;
		}
		return true;
	}

</script>

</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
<main class="pt-2">
		<!-- ================================================Content Area======================================================== -->
<div align="center">
    <section>
        <h3><spring:message code="pet.insert"/></h3>
        <div class="card" style="width: 50rem;">
            <div class="card-body">
                <form:form modelAttribute="pet" action="insertPet" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label for="petName" class="col-sm-3 col-form-label"><spring:message code="common.name"/> :</label>
                        <div class="col-sm-9">
                            <form:input path="petName" name="petName" id="petName" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="petAge" class="col-sm-3 col-form-label"><spring:message code="pet.age"/> :</label>
                        <div class="col-sm-9">
                            <form:input path="petAge" name="petAge" id="petAge" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="petType" class="col-sm-3 col-form-label"><spring:message code="pet.breed"/> :</label>
                        <div class="col-sm-9">
                            <form:input path="petType" name="petType" id="petType" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label"><spring:message code="pet.gender"/></label>
                        <div class="col-sm-9 d-flex align-items-center">
                            <div class="form-check form-check-inline">
                                <input type="radio" id="petGender" name="petGender"  value="M"  class="form-check-input">
                                <label for="petGender" class="form-check-label"><spring:message code="pet.male"/></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" id="petGender" name="petGender" value="F" class="form-check-input">
                                <label for="petGender" class="form-check-label"><spring:message code="pet.female"/></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="petDesc" class="col-sm-3 col-form-label"><spring:message code="common.description"/></label>
                        <div class="col-sm-9">
                            <form:textarea path="petDesc" name="petDesc" id="petDesc" class="form-control" rows="4"></form:textarea>
                        </div>
                    </div>
                    <div class="form-group row d-flex align-items-center">
                        <label class="col-sm-3 col-form-label"><spring:message code="common.mainPic"/></label>
                        <div class="col-sm-9 d-flex">
                            <input type="file" name="pictures" id="pictures" path="petMainPic" />
                        </div>
                    </div>
                    <div class="form-group row d-flex align-items-center">
                        <label class="col-sm-3 col-form-label"><spring:message code="common.subPic"/></label>
                        <div class="col-sm-9 d-flex">
                            <input type="file" name="pictures" id="pictures" path="petSubPic" />
                        </div>
                    </div>
                </form:form>
                    <div class="form-group col d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary m-2" id="btnRegister"><spring:message code="common.submit"/></button>
                        <button type="button" class="btn btn-light btn-outline-secondary text-dark m-2" id="btnList"><spring:message code="common.list"/></button>
                    </div>
            </div>
        </div>
    </section>
</div>

</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>