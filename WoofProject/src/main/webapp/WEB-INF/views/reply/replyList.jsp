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
			form.action = '/service/responseServiceForm'; // 수정 액션 주소
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
		ajaxReply();

		$("#ajaxReplyBtn").on("click", function() {
			ajaxReply();
		});
		
	});
	
	function ajaxReply(){
		/* alert("ajaxReply"); */
		var username = $("#username").val();
		
		/* alert("username : "+username); */

		let reply = {
				username : $("#username").val(),
				reply : $("#reply").val(),
			};
		
		/* alert(reply.username+reply.reply); */
		$.ajax({
			type : "put",
				url : "/reply/getReplyListAjax",
				data : JSON.stringify(reply),
				contentType : "application/json; charset=UTF-8",
				
				success : 
					function(result) {
					console.log("result.length : " + result.length);
				/* 	let noticeList = "";
						for (var i = 0; i < result.length; i++) {
							noticeList += '<tr style="font-size: 12px;">';
							noticeList += '<td class=" text-center p-1" style="width: 50px;">';
							noticeList += result[i].noticeNo + '</td>';
							noticeList += '<td class="text-truncate p-1">';
							noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
				noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
							noticeList += result[i].noticeTitle
									+ '</a></td>';
							noticeList += '<td class=" text-center p-1" style="width: 130px;">'
							noticeList += result[i].noticeRegDate + '</td>';
							noticeList += '</tr>';
				
						} */
						let noticeList = ""
							for (var i = 0; i < result.length; i++) {
								noticeList += '<form method="post">';
									noticeList += '<input type="hidden" name="replyNo" value="'+result[i].replyNo+'"readonly="readonly"> ';
									noticeList += '<input type="hidden"name="username" value="'+result[i].username+'" readonly="readonly">';
												noticeList += '	<input type="hidden" name="reply" value="'+result[i].reply+'"readonly="readonly">';
													noticeList += '		<tr>';
														noticeList += '	<td name="username" align="center">'+result[i].username+'</td>';
															noticeList += '	<td name="reply" align="left" class="text-break">'+result[i].reply+'</td>';
																noticeList += '	<td align="center">';
																	noticeList += '		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="'+result[i].replyRegDate+'"/></td>';
																		noticeList += '	<td align="center" class="border-0"><sec:authorize access="hasRole(''ROLE_ADMIN'')">';
																		noticeList += '	<button class="btn btn-outline-dark p-0"onclick="handleAction('delete', this.form)">삭제</button>';
																		noticeList += '</sec:authorize> <sec:authorize access="hasRole(''ROLE_MEMBER'')">';
																		noticeList += '	<c:if test="'+result[i].username+'==account.username+'">';
																			noticeList += '	<div class="d-flex">';
																				noticeList += '	<button class="btn btn-outline-dark p-0"';
																					noticeList += '	onclick="handleAction('delete', this.form)">삭제</button>';
									</div>
								</c:if>
							</sec:authorize></td>
					</tr>
					</form>
							}
					}
		});
}

	function ajaxNotice() {
		let pageRequest = {
			condition : $("#condition").val(),
			keyword : $("#keyword").val(),
			sizePerPage : $("#sizePerPage").val(),
			page : $("#page").val()

		};

		alert(pageRequest.condition + " " + pageRequest.keyword + " "
				+ pageRequest.sizePerPage+" "+pageRequest.page);

			$.ajax({
								type : "put",
					url : "/notice/getNoticeListAjaxPut",
					data : JSON.stringify(pageRequest),
					contentType : "application/json; charset=UTF-8",

					success : function(result) {
						console.log("result.length : " + result.length);
						let noticeList = "";

						if (result.length != 0) {

							for (var i = 0; i < result.length; i++) {
								noticeList += '<tr style="font-size: 12px;">';
								noticeList += '<td class=" text-center p-1" style="width: 50px;">';
								noticeList += result[i].noticeNo + '</td>';
								noticeList += '<td class="text-truncate p-1">';
								noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
				noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
								noticeList += result[i].noticeTitle
										+ '</a></td>';
								noticeList += '<td class=" text-center p-1" style="width: 130px;">'
								noticeList += result[i].noticeRegDate + '</td>';
								noticeList += '</tr>';

							}
						} else {
							alert("검색결과 없음");
						}

						$("#noticeListSpan").html(noticeList);

						if (pageRequest.keyword != "") {
							let url = "?condition=" + pageRequest.condition
									+ "&keyword=" + pageRequest.keyword;
							if (typeof (history.pushState) != "undefined") {
								history.pushState(null, null, url);
							}
						}
					}
				});
	}

	/* $(document).ready(function() {
		ajaxPut();

		$("#ajaxPutBtn").on("click", function() {
			alert("putBtn");
			ajaxPut();
		});
	});

	function ajaxPut() {
		let pageRequest = {
			condition : $("#condition").val(),
			keyword : $("#keyword").val(),
			sizePerPage : $("#sizePerPage").val(),
			page : $("#page").val()

		};

		alert(pageRequest.condition + " " + pageRequest.keyword + " "
				+ pageRequest.sizePerPage+" "+pageRequest.page);

$.ajax({
								type : "put",
					url : "/notice/getNoticeListAjaxPut",
					data : JSON.stringify(pageRequest),
					contentType : "application/json; charset=UTF-8",

					success : function(result) {
						console.log("result.length : " + result.length);
						let noticeList = "";

						if (result.length != 0) {

							for (var i = 0; i < result.length; i++) {
								noticeList += '<tr style="font-size: 12px;">';
								noticeList += '<td class=" text-center p-1" style="width: 50px;">';
								noticeList += result[i].noticeNo + '</td>';
								noticeList += '<td class="text-truncate p-1">';
								noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
				noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
								noticeList += result[i].noticeTitle
										+ '</a></td>';
								noticeList += '<td class=" text-center p-1" style="width: 130px;">'
								noticeList += result[i].noticeRegDate + '</td>';
								noticeList += '</tr>';

							}
						} else {
							alert("검색결과 없음");
						}

						$("#noticeListSpan").html(noticeList);

						if (pageRequest.keyword != "") {
							let url = "?condition=" + pageRequest.condition
									+ "&keyword=" + pageRequest.keyword;
							if (typeof (history.pushState) != "undefined") {
								history.pushState(null, null, url);
							}
						}
					}
				});
	} */
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		reply
		<div class="mt-3 w-75 m-auto">

			<form id="serviceForm" action="/reply/insertReply" method="post"
				class="w-75">
				<%-- <input type="hidden" name="username" class="form-control" value="${account.username}" readonly="true"/> --%>
				<input id="username" name="username" class="form-control"value="${account.username}" readonly="true" /> 
				<span>serviceDesc :</span>
				<button type="submit">Register</button>
				<textarea id="reply" name="reply" class="form-control" rows="5"></textarea>
			</form>
				<button id="ajaxReplyBtn">ajaxReplyBtn</button>
			
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

					<c:forEach items="${replyList}" var="reply">
						<form method="post">
							<input type="hidden" name="replyNo" value="${reply.replyNo}"
								readonly="readonly"> <input type="hidden"
								name="username" value="${reply.username}" readonly="readonly">
							<input type="hidden" name="reply" value="${reply.reply}"
								readonly="readonly">
						<tr>
							<td name="username" align="center">${reply.username}</td>
							<td name="reply" align="left" class="text-break">${reply.reply}</td>
							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${reply.replyRegDate}" /></td>
							<td align="center" class="border-0"><sec:authorize
									access="hasRole('ROLE_ADMIN')">
									<button class="btn btn-outline-dark p-0"
										onclick="handleAction('modify', this.form)">답변</button>
									<button class="btn btn-outline-dark p-0"
										onclick="handleAction('delete', this.form)">삭제</button>
								</sec:authorize> <sec:authorize access="hasRole('ROLE_MEMBER')">
									<c:if test="${reply.username==account.username}">
										<div class="d-flex">
											<button class="btn btn-outline-dark p-0"
												onclick="handleAction('delete', this.form)">삭제</button>
										</div>
									</c:if>
								</sec:authorize></td>
						</tr>
						</form>
					</c:forEach>

				</tbody>

			</table>
			<div class="d-flex">
				<ul class="pagination m-auto">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
					</c:if>

					<c:forEach begin="${pagination.startPage }"
						end="${pagination.endPage }" var="idx">
						<li class="page-item"><a class="page-link" href="">${idx}</a></li>
					</c:forEach>

					<c:if test="${pagination.next && pagination.endPage > 0}">
						<li class="page-item"><a class="page-link" href="">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>