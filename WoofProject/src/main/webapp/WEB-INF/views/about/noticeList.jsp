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

$(document).ready(function() {
	
	ajaxPutBtn();
	
	$("#putBtn").on("click",function() {
		/* alert("putBtn"); */
		ajaxPutBtn();
	});
	
});

function ajaxPutBtn(){
	//전송할객체를 만든다
	let noticeSearch = {
		searchCondition : $("#searchCondition").val(),
		searchKeyword : $("#searchKeyword").val(),
	};
		
	
		
	//비동기식 처리방식을 요청한다.
	$.ajax({
		type : "put",
		url : "/notice/getNoticeListAjaxPut",
		data : JSON.stringify(noticeSearch),
		contentType : "application/json; charset=UTF-8",
		success : function(result){
			if(result.length!=0){
			/* alert("ajaxPutBtn"); */
				console.log(result.length);
			}else{
				alert("검색결과 없음");
			}
			console.log(typeof result[0].noticeRegDate);
			
			let noticeList = "";
			for (var i = 0;i<result.length;i++){
				noticeList += '<tr style="font-size: 12px;">';
				noticeList += '<td class=" text-center p-1" style="width: 50px;">';
				noticeList += result[i].noticeNo+'</td>';
				noticeList += '<td class="text-truncate p-1">';
				noticeList += '<a	href="/notice/getNotice/'+result[i].noticeNo+'"';
				noticeList += 'class="list-group-item list-group-item-action border-0 text-truncate">';
				noticeList += result[i].noticeTitle+'</a></td>';
				
				noticeList += '<td class=" text-center p-1" style="width: 130px;">'
				noticeList += result[i].noticeRegDate+'</td>';
				
				noticeList += '</tr>';
			}
			$("#noticeListSpan").html(noticeList);
			
			if(noticeSearch.searchKeyword!=""){
				let url ="?searchCondition="+noticeSearch.searchCondition+"&searchKeyword="+noticeSearch.searchKeyword;	
				if(typeof (history.pushState) != "undefined") { 
					history.pushState(null, null, url); 
				}
			}
		}
	});
}
	
	
	
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<!-- 자기가 만든 페이지그룹에 해당하는 서브메뉴만 남길것 -->
	<menu id="subMenu" class="m-0 p-0">
		<ul
			class="nav nav-underline nav-justified justify-content-around border-bottom">
			<li class="menu navMenu nav-item"><a href=""
				class="nav-link text-black">시설소개</a></li>
			<li class="menu navMenu nav-item"><a href=""
				class="nav-link text-black">오시는 길</a></li>
			<li class="menu navMenu nav-item"><a
				href="/notice/getNoticeList" class="nav-link text-black">공지사항</a></li>
		</ul>
	</menu>
	<main class="pt-2">
		<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
		<a href="/notice/insertNoticeForm">insertNoticeForm</a>
		<div class="mt-3">
			<p class="text-center fs-5 mt-3">NOTICE LIST</p>
			

			<!-- <table id="noticeListSpan"></table> -->

			
			<form:form modelAttribute="noticeSearch"
				action="/notice/getNoticeList" method="get">
				<form:select path="searchCondition">
					<form:option value="TITLE" label="제목" />
					<form:option value="CONTENT" label="내용" />
				</form:select>
				<form:input path="searchKeyword" />
				<form:button type="submit">일반검색</form:button>
			</form:form>
			<button id="ajaxput">ajaxput검색</button>
			<button id="ajaxgetPara">ajaxgetPara검색</button>
			<button id="putBtn">putBtn</button>
		<button id="getBtn">요청(get)</button>


			<table class="table table-striped" style="table-layout: fixed;">
				<thead>
					<tr>
						<th class="bg-dark-subtle text-center" style="width: 20px;">글번호</th>
						<th class="bg-dark-subtle text-center" style="width: 100px;">제목</th>
						<th class="bg-dark-subtle text-center" style="width: 50px;">작성일</th>
					</tr>
				</thead>
				<%-- <tbody>
					<c:forEach var="notice" items="${noticeList}">
						<tr style="font-size: 12px;">
							<td class=" text-center p-1" style="width: 50px;">${notice.noticeNo}
							</td>
							<td class="text-truncate p-1"><a
								href="/notice/getNotice/${notice.noticeNo}"
								class="list-group-item list-group-item-action border-0 text-truncate">
									${notice.noticeTitle }</a></td>
							<td class=" text-center p-1" style="width: 130px;"><fmt:formatDate
									value="${notice.noticeRegDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody> --%>
				<tbody id="noticeListSpan">
						
				</tbody>
			</table>


		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>