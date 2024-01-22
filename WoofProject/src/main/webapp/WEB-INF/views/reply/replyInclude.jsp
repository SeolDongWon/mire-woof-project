<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	var currUsername = '${pageContext.request.userPrincipal.principal.account.username}';
	var reviewNo = '${review.reviewNo}';
	/* alert("currUsername "+currUsername+" reviewNo "+reviewNo); */
	
	$(document).ready(function() {
		replyList('1');
		pagination('1');

	});
	
	function registerBtn() {
		replyRegist();
		replyList('1');
		pagination('1');
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
				page : idx,
				reviewNo : reviewNo
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
				page : idx,
				reviewNo : reviewNo
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
							replyList += '<span style="font-size:13px">'+formattedDate+'</span>';
							replyList += '<td align="center" class="">';
							replyList += '<sec:authorize access="hasRole('ROLE_ADMIN')">';
							replyList += '<button class="btn button-outline-secondary p-0" value="'+result[i].replyNo+'" onclick="deleteBtn()"><spring:message code="common.delete"/></button>';
							replyList += '</sec:authorize>';
							replyList += '<div class="d-flex">';
							if(currUsername==result[i].username){
								//수정은 미완성
								//replyList += '<button class="btn btn-outline-dark p-0" value="'+result[i].replyNo+'" onclick="modifyBtn()">수정</button>';
								replyList += '<button class="btn btn-light button-outline-secondary p-0" value="'+result[i].replyNo+'" onclick="deleteBtn()"><spring:message code="common.modify"/></button>';
							}
							replyList += '</td></tr></form>';
						}
						 $("#replyListSpan").html(replyList); 
					}
		});
	}
	
	
	function replyRegist(){
		var reply = {
				username : $("#username").val(),
				reply : $("#reply").val(),
				reviewNo : reviewNo
		};
		
		$.ajax({
				type : "put",
				url : "/reply/insertReply",
				data : JSON.stringify(reply),
				contentType : "application/json; charset=UTF-8",
				success : 
					function(result) {
					}
		});
		 document.getElementById('reply').value = '';
	}
	
</script>

		<div class="mt-3">
		
			<h4 class="p-2"style="background-color: var(--bs-danger-bg-subtle)"><spring:message code="reply.list"/></h4>

			<sec:authorize access="isAuthenticated()">
				<div class="row p-0 m-0">
					<form id="serviceForm" action="/reply/insertReply" method="post" class="col-10 d-flex">
						<input type="hidden" id="username" name="username" class="form-control"value="<sec:authentication property="principal.username"/>" readonly="true"/>
						<div class="me-2">
						<sec:authentication property="principal.username"/> 
						</div>
						<textarea id="reply" name="reply" class="form-control" rows="5" placeholder="<spring:message code="common.description"/>"></textarea>
					</form>
					<button class="btn btn-light btn-light btn-outline-secondary text-dark col-2 m-auto" id="RegisterBtn"onclick="registerBtn()"><spring:message code="reply.reply"/></button>
				</div>
			</sec:authorize>
			<table class="table table-striped m-auto" style="table-layout: fixed;">

				<thead>
					<tr>
						<!-- <th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th> -->
						<th class="border-0 " style="width: 100px;"></th>
						<th class="border-0 " style="width: auto;"></th>
						<th class="border-0" style="width: 200px; "></th>
						<th class="border-0" style="width: 50px;"></th>
					</tr>
				</thead>

				<tbody id="replyListSpan">
				</tbody>
			</table>
			<div id="pageListSpan" class="d-flex">
			</div>
			
		</div>

