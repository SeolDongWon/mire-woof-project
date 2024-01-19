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
<!-- css common Area 헤더 푸터에 쓸 css 경로-->
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<!-- script common Area 헤더 푸터에 쓸 script 경로-->
<%@ include file="/WEB-INF/views/common/script.jsp"%>
<!-- css local Area 각 개별페이지 css 경로는 여기다가 쓸 것-->
<%-- <%@ include file="" %> --%>
<!-- script local Area  각 개별페이지 script 경로는 여기다가 쓸 것 -->
<%-- <%@ include file="" %> --%>
<script type="text/javascript">

	function replyAction(actionType, form) {
		switch (actionType) {
		case 'modify':
			form.action = '/service/responseServiceForm';
			break;
		case 'delete':
			var check = confirm("정말로 삭제?");
			if (check) {
				form.action = '/service/deleteService';
			}
			break;
		}
		form.submit();
	}

	//Ajax
	$(document).ready(function() {
		replyList();

		$("#RegisterBtn").on("click", function() {
			replyRegister();
		});
		
		
	  $("[id^='pageBtn']").on("click", function() {
		  var idx = $(this).attr('id').split('_')[1];
	    alert("pageBtn: " + idx);
	    
	    replyList(idx);
	    
	    pagination(idx);
	    
	  });
	  
		
	});
	
	function pagination(idx){
		var pageRequest = {
				page : idx
		};
		
	$.ajax({
				type : "put",
				url : "/reply/getReplyPage",
				data : JSON.stringify(pageRequest),
				contentType : "application/json; charset=UTF-8",
				
				success : 
					function(result) {
							alert("pagination");	
							
							let pageListTest = ""
							
							for (var i = 0; i < result.length; i++) {
								pageListTest += result[i].totalCount + " ";
								pageListTest += result[i].startPage + " ";
								pageListTest += result[i].endPage + " ";
								pageListTest += result[i].prev + " ";
								pageListTest += result[i].next + " ";
								pageListTest += result[i].displayPageNum + " ";
								pageListTest += result[i].pageRequest + " ";
							}
							alert(pageListTest);
							
							/* let pageList = ""
								pageList += '
								<ul class="pagination m-auto">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="">Previous</a></li>
							</c:if>

							<c:forEach begin="${pagination.startPage }"	end="${pagination.endPage }" var="idx">
								<li class="page-item"><button id="pageBtn_${idx}" class="page-link">${idx}</button></li>
							</c:forEach>

							<c:if test="${pagination.next && pagination.endPage > 0}">
								<li class="page-item"><button id="nextPageBtn_${pagination.endPage+1}" class="page-link">Next</a></li>
							</c:if>
						</ul> */
						
						$("#pageListSpan").html(replyList); 
					
		});
		 document.getElementById('reply').value = '';
	}
	
	function replyList(idx){
		var pageRequest = {
				page : idx
		};
		
	$.ajax({
				type : "put",
				url : "/reply/getReplyList",
				data : JSON.stringify(pageRequest),
				contentType : "application/json; charset=UTF-8",
				
				success : 
					function(result) {
	
					 	let replyList = ""
						var parsedDate = null;
						var formattedDate = null; 
						
						 for (var i = 0; i < result.length; i++) {
							parsedDate = new Date(result[i].replyRegDate);
							formattedDate = parsedDate.toLocaleString({ timeZone: 'UTC' });
							
							replyList += '<form method="post">';
							replyList += '<input type="hidden" name="replyNo" value="'+result[i].replyNo+'"readonly="readonly"> ';
							replyList += '<input type="hidden"name="username" value="'+result[i].username+'" readonly="readonly">';
							replyList += '<input type="hidden" name="reply" value="'+result[i].reply+'"readonly="readonly"><tr>';
							replyList += '<td name="username" align="center">'+result[i].username+'</td>';
							replyList += '<td name="reply" align="left" class="text-break">'+result[i].reply+'</td><td align="center">';
							replyList += '<span>'+formattedDate+'</span>';
							replyList += '<td align="center" class="border-0"><sec:authorize access="hasRole('ROLE_ADMIN')">';
							replyList += '<button class="btn btn-outline-dark p-0"onclick="handleAction("delete", this.form)">삭제</button>';
							replyList += '</sec:authorize> <sec:authorize access="hasRole('ROLE_MEMBER')">';
							replyList += '<c:if test="${account.username=='+result[i].username+'}"><div class="d-flex">';
							replyList += '<button class="btn btn-outline-dark p-0"onclick="handleAction("delete", this.form)">삭제</button>';
							replyList += '</div></c:if></sec:authorize></td></tr></form>';
						}
						 
						 $("#replyListSpan").html(replyList); 
					}
		});
		 document.getElementById('reply').value = '';
	}
	
	
	function replyRegister(){
		var reply = {
				username : $("#username").val(),
				reply : $("#reply").val()
		};
		
		$.ajax({
				type : "put",
				url : "/reply/getReplyRegist",
				data : JSON.stringify(reply),
				contentType : "application/json; charset=UTF-8",
				
				success : 
					function(result) {
	
						let replyList = ""
						var parsedDate = null;
						var formattedDate = null;
						
						for (var i = 0; i < result.length; i++) {
							parsedDate = new Date(result[i].replyRegDate);
							formattedDate = parsedDate.toLocaleString({ timeZone: 'UTC' });
							
							replyList += '<form method="post">';
							replyList += '<input type="hidden" name="replyNo" value="'+result[i].replyNo+'"readonly="readonly"> ';
							replyList += '<input type="hidden"name="username" value="'+result[i].username+'" readonly="readonly">';
							replyList += '<input type="hidden" name="reply" value="'+result[i].reply+'"readonly="readonly"><tr>';
							replyList += '<td name="username" align="center">'+result[i].username+'</td>';
							replyList += '<td name="reply" align="left" class="text-break">'+result[i].reply+'</td><td align="center">';
							replyList += '<span>'+formattedDate+'</span>';
							replyList += '<td align="center" class="border-0"><sec:authorize access="hasRole('ROLE_ADMIN')">';
							replyList += '<button class="btn btn-outline-dark p-0"onclick="handleAction("delete", this.form)">삭제</button>';
							replyList += '</sec:authorize> <sec:authorize access="hasRole('ROLE_MEMBER')">';
							replyList += '<c:if test="${account.username=='+result[i].username+'}"><div class="d-flex">';
							replyList += '<button class="btn btn-outline-dark p-0"onclick="handleAction("delete", this.form)">삭제</button>';
							replyList += '</div></c:if></sec:authorize></td></tr></form>';
						}
						
						$("#replyListSpan").html(replyList);
					}
		});
		 document.getElementById('reply').value = '';
}
	
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
	<h4>	reply</h4>

			<form id="serviceForm" action="/reply/insertReply" method="post"
				class="w-75">
				<%-- <input type="hidden" name="username" class="form-control" value="${account.username}" readonly="true"/> --%>
				<input id="username" name="username" class="form-control"value="${account.username}" readonly="true" /> 
				<span>serviceDesc :</span>
				<button type="submit">Register</button>
				<textarea id="reply" name="reply" class="form-control" rows="5"></textarea>
			</form>
				<button id="RegisterBtn">RegisterBtnAjax</button>
			
			<div></div>
			<table class="table" style="table-layout: fixed;">

				<thead>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->
						<th class="bg-dark-subtle text-center" style="width: 20px;">작성자</th>
						<th class="bg-dark-subtle text-center" style="width: 100px;">내용</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
						<th class="border-0" style="width: 20px;"></th>
					</tr>
				</thead>

				<tbody id="replyListSpan">
				</tbody>

			</table>
			
			<div id="pageListSpan" class="d-flex">
				<ul class="pagination m-auto">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
					</c:if>

					<c:forEach begin="${pagination.startPage }"	end="${pagination.endPage }" var="idx">
						<li class="page-item"><button id="pageBtn_${idx}" class="page-link">${idx}</button></li>
					</c:forEach>

					<c:if test="${pagination.next && pagination.endPage > 0}">
						<li class="page-item"><button id="pageBtn_${pagination.endPage+1}" class="page-link">Next</a></li>
					</c:if>
				</ul>
			</div>
			
			
			
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>