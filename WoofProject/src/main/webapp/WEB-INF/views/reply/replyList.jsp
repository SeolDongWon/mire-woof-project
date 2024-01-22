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
	var currUsername = '${pageContext.request.userPrincipal.principal.account.username}';
	
	$(document).ready(function() {
		replyList('1');
		pagination('1');

		/* $("#RegisterBtn").on("click", function() {
			replyRegister();
			replyList('1');
		}); */
	  
		
	});
	
	function RegisterBtn() {
		replyRegister();
		replyList('1');
	}
	

	function modifyBtn() {
		var replyNo = event.target.value;
		alert(replyNo);
		
	}
	
	
	function deleteBtn(){
		var replyNo = event.target.value;
		var check = confirm("정말로 삭제?");
		if (check) {
			deleteReply(replyNo);
			replyList('1');
		}
	}
	
	function pageBtn(){
		 var idx = event.target.value;
	   replyList(idx);
	   pagination(idx);
	}
	
	function deleteReply(replyNo){
		
		var reply = {
				replyNo : replyNo
		};
		
		$.ajax({
					type : "put",
					url : "/reply/deleteReply",
					data : JSON.stringify(reply),
					contentType : "application/json; charset=UTF-8",
					success : 
						function(result) {
				}
		});
	}
	
	function pagination(idx){
		var pageRequest = {
				page : idx
		};
		/* alert("pageRequest : "+pageRequest.page); */
		$.ajax({
					type : "put",
					url : "/reply/getReplyPage",
					data : JSON.stringify(pageRequest),
					contentType : "application/json; charset=UTF-8",
					success : 
						function(result) {
								let pageList = ""
								pageList += '<ul class="pagination m-auto">';
								if(result[0].prev){
									var startPage = result[0].startPage-1;
									pageList += '<li class="page-item"><button id="pageBtn" value="'+startPage+'"class="page-link" onclick="pageBtn()">Previous</button></li>';
								}							
								for (var idx = result[0].startPage; idx < result[0].endPage+1; idx++) {
									pageList += '<li class="page-item"><button id="pageBtn" value="'+idx+'" class="page-link" onclick="pageBtn()">'+idx+'</button></li>';
								}
								if(result[0].next&&result[0].endPage>0){
									var endpage = result[0].endPage+1;
									pageList += '<li class="page-item"><button id="pageBtn" value="'+endpage+'" class="page-link" onclick="pageBtn()">Next</a></li>';
								}
								pageList += '</ul>';
							$("#pageListSpan").html(pageList);
				}
			});
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
							replyList += '<td align="center" class="border-0">';
							replyList += '<sec:authorize access="hasRole('ROLE_ADMIN')">';
							replyList += '<button class="btn btn-outline-dark p-0" value="'+result[i].replyNo+'" onclick="deleteBtn()">삭제</button>';
							replyList += '</sec:authorize>';
							replyList += '<div class="d-flex">';
							if(currUsername==result[i].username){
								//수정은 미완성
								//replyList += '<button class="btn btn-outline-dark p-0" value="'+result[i].replyNo+'" onclick="modifyBtn()">수정</button>';
								replyList += '<button class="btn btn-outline-dark p-0" value="'+result[i].replyNo+'" onclick="deleteBtn()">삭제</button>';
							}
							replyList += '</td></tr></form>';
						}
						 $("#replyListSpan").html(replyList); 
					}
		});
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
	<h4><spring:messsage code="reply.reply"/></h4>

			<form id="serviceForm" action="/reply/insertReply" method="post"
				class="w-75">
				<input id="username" name="username" class="form-control"value="${account.username}" readonly="readonly" /> 
				<span><spring:message code="common.description"/><spring:message code="common.submit"/></span>
				<button type="submit">Register</button>
				<textarea id="reply" name="reply" class="form-control" rows="5"></textarea>
			</form>
				<button id="RegisterBtn"onclick="RegisterBtn()">RegisterBtnAjax</button>
			
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

			</div>
			
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>