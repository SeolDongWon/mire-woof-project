<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
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
		var formObj = $("#serviceForm");
		
		$("#btnRegister").on("click", function() {
			  var check = confirm("<spring:message code='common.alert.confirmSubmit'/>");

			  var serviceDescValue = document.getElementById('serviceDesc').value;

			    // serviceDesc 값이 공백인 경우 에러 메시지를 표시하고 제출을 막음
			  if (serviceDescValue.trim() === '') {
				    alert("<spring:message code='common.alert.cancelled'/>");
			    document.getElementById('serviceDesc').placeholder = 'Service Description cannot be empty.';
			  } else if(check){
			    document.getElementById('serviceDesc').placeholder = ''; // 에러 메시지를 초기화
					formObj.submit();
			  }
			  	  
		});
		
		$("#btnList").on("click", function() {
			self.location = "/service/getServiceList";
		});
		
	});
	
     $(document).ready(function() {
         var selectedServiceType = $("#serviceType");
         var orderNoContainer = $("#orderNoContainer");

         selectedServiceType.on("change", function() {
             var selectedValue = selectedServiceType.val();

             if (selectedValue === "Purchases") {
            	 orderNoContainer.show();
             } else {
            	 orderNoContainer.hide();
             }
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
	<main class="pt-2">
<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<div class="mt-3 w-75 m-auto">
	<h4><spring:message code="service.writeService"/></h4>
			<form id="serviceForm" action="/service/insertService" method="post">
				<div class="d-flex row align-items-center justify-content-start m-2">
					<div class="m-2">
						<spring:message code="common.username"/>
						<input name="username" class="form-control" value="${account.username}" readonly="true"/> 
					</div>
					<div class="m-2">
						<spring:message code="service.selectType"/>
						<select class="form-control" name="serviceType" id="serviceType">
							<option value="Other"><spring:message code="service.serviceType2"/></option>
							<option value="Purchases"><spring:message code="service.serviceType1"/></option>
						</select>
					</div>
					
					<div class="m-2" id="orderNoContainer" style="display: none;">
                        <spring:message code="service.orderNo"/>
                        <select name="orderNo" class="form-control" id="orderNo">
					        <c:forEach var="orderHistory" items="${orderHistoryList}">
					            <option value="${orderHistory.orderHistoryNo}">
					                ${orderHistory.orderHistoryNo}
					            </option>
					        </c:forEach>
                        </select>
                    </div>
					
					<div class="m-2">	
						<spring:message code="common.description"/>
						<textarea id="serviceDesc" name="serviceDesc"  class="form-control" rows="5" required="required" placeholder="serviceDesc"></textarea>
					</div>
				</div>
			</form>
			<div>
				<button type="submit" id="btnRegister" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="common.submit"/></button>
				<button type="submit" id="btnList" class="btn btn-light btn-outline-secondary text-dark m-2"><spring:message code="common.list"/></button>
			</div>
		</div>
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>