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
<script type="text/javascript">
	function showThumbnail(input) {
	    var fileInput = input;
	    var file = fileInput.files[0];
	    var fileReader = new FileReader();
	
	    fileReader.onload = function(event) {
	        var thumbnail = document.getElementById('thumbnail');
	        thumbnail.src = event.target.result;
	        thumbnail.style.display = 'block';
	    };
	    fileReader.readAsDataURL(file);
	}
	
	$(document).ready(function() {
		var formObj = $("#review");
		$("#btnRegister").on("click", function() {
			var check = confirm('<spring:message code='common.alert.confirmSubmit'/>');
			
			 var reviewTitle = document.getElementById('reviewTitle').value;
			 var reviewDesc = document.getElementById('reviewDesc').value;
			 var pictures = document.getElementById('pictures').value;
			  
			 
			 if (reviewTitle.trim() === '') {
				    alert("<spring:message code='common.alert.cancelled'/>");
			    document.getElementById('reviewTitle').placeholder = '<spring:message code='reply.alert.enterTitle'/>';
			  } else if(reviewDesc.trim() === ''){
			    document.getElementById('reviewDesc').placeholder = '<spring:message code='reply.alert.enterDescription'/>';
			  } else if(pictures.trim() === ''){
				  alert("<spring:message code='reply.alert.enterPic'/>");
			  }else if(check){
					formObj.attr("action", "/review/insertReview");
					formObj.attr("method", "post");
					formObj.submit();
			  }		
		});
		
		$("#btnList").on("click", function() {
			self.location = "/orderHistory/getOrderHistoryList";
		});
	});
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<div class="mt-3 w-75 m-auto">
			<h4><spring:message code="reply.addReview"/></h4>
			
			<form id="review" action="insertPetReview" method="post" enctype="multipart/form-data">
                    <div class="form-group m-2">
                        <label><spring:message code="common.author"/></label>
                        <input name="username" readonly="readonly" class="form-control" value="${account.username}"/>
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="item.itemName"/></label>
                        <input type="text" name="itemName" class="form-control" value="${review.itemName}" readonly="readonly"/>
                        <input type="text" name="itemNo" class="form-control" value="${review.itemNo}" readonly="readonly"/>
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.title"/></label>
                        <input id="reviewTitle" name="reviewTitle" class="form-control"/>
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.description"/></label>
                        <textarea id="reviewDesc" name="reviewDesc" class="form-control" rows="4"></textarea>
                    </div>
                    <div class="form-group m-2">
                        <label><spring:message code="common.picture"/></label>
                        <input id="pictures" type="file" name="pictures" name="reviewPic" onchange="showThumbnail(this)"/>
                        <img id="thumbnail" alt="thumbnail" style="width:200px; height: 200px;display: none;">
                    </div>
                </form>
                    <div class="form-group d-flex justify-content-center m-2">
                        <button type="submit" class="btn btn-primary m-2" id="btnRegister"><spring:message code="common.submit"/></button>
                        <button type="button" class="btn btn-light btn-outline-secondary text-dark m-2" id="btnList"><spring:message code="common.list"/></button>
                    </div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>