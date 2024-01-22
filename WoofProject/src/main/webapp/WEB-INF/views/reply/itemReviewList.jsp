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
		reviewList('1');
		pagination('1');
	});

	function modifyBtn() {
		var reviewNo = event.target.value;
		alert(reviewNo);
		
	}
	
	
	function deleteBtn(){
		var reviewNo = event.target.value;
		var check = confirm("정말로 삭제?");
		if (check) {
			deleteReview(reviewNo);
			replyList('1');
		}
	}
	
	function pageBtn(){
		 var idx = event.target.value;
	   replyList(idx);
	   pagination(idx);
	}
	
	function deleteReview(reviewNo){
		var review = {
				reviewNo : reviewNo
		};
		
		$.ajax({
					type : "put",
					url : "/review/deleteReviewAjax",
					data : JSON.stringify(review),
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
		$.ajax({
					type : "put",
					url : "/review/getItemReviewPagination",
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
	
	 function reviewList(idx){
		var pageRequest = {
				page : idx
		};
		
		$.ajax({
				type : "put",
				url : "/review/getItemReviewList",
				data : JSON.stringify(pageRequest),
				contentType : "application/json; charset=UTF-8",
				
				success : 
					function(result) {
						let reviewList = ""
						var parsedDate = null;
						var formattedDate = null; 
						for (var i = 0; i < result.length; i++) {
							parsedDate = new Date(result[i].reviewRegDate);
							formattedDate = parsedDate.toLocaleString({ timeZone: 'UTC' });
							reviewList += '<br><form method="post">';
							reviewList += '<input type="hidden" name="reviewNo" value="'+result[i].reviewNo+'"readonly="readonly"> ';
							reviewList += '  <div class="w-100">';
							reviewList += ' <div>';
							reviewList += '  <span>'+result[i].userName+'</span>';
							reviewList += '   <span>'+formattedDate+'</span>';
							reviewList += '   <span>'+result[i].itemName+'</span>';
							reviewList += '  </div>';
							reviewList += '  <div>';
							reviewList += '  <img src="/review/getReviewPic?reviewNo='+result[i].reviewNo+'" style="height:100px">';
							reviewList += ' </div>';
							reviewList += ' <div>';
							reviewList += ' <p class="fs-4">'+result[i].reviewTitle+'</p>';
							reviewList += ' <div class="d-flex">';
							reviewList += ' <textarea class="form-control auto-height-textarea overflow-hidden" readonly="readonly">'+result[i].reviewDesc+'</textarea>';
							reviewList += '<sec:authorize access="hasRole('ROLE_ADMIN')">';
							reviewList += '<button class="btn btn-outline-dark p-0" value="'+result[i].reviewNo+'" onclick="deleteBtn()">삭제</button>';
							reviewList += '</sec:authorize>';
							if(currUsername==result[i].userName){
								reviewList += '<button class="btn btn-outline-dark p-0" value="'+result[i].reviewNo+'" onclick="deleteBtn()">삭제</button>';
							}
							reviewList += ' </div>';
							reviewList += ' </div>';
							reviewList += '</div>';
							reviewList += '<div align="center" class="border-0">';
							reviewList += '<div class="d-flex">';
							reviewList += '</div></div></form>';
						}
						 $("#reviewListSpan").html(reviewList);  
				}
		});
	} 
	
</script>
<style>
        /* 텍스트 영역에 대한 스타일 */
        .auto-height-textarea {
            resize: none; /* 크기 조절을 막음 (선택사항) */
        }
    </style>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- ====================Content Area : <main> 과 </maim> 사이에 콘첸츠 작성 /======================================================== -->
	<main class="pt-2">
		<div class="mt-3 w-75 m-auto">
	<h4>getItemReviewList</h4>
	<a href="/reply/insertItemReviewForm"
				class="btn btn-light btn-outline-secondary text-dark m-2 float-end">Reivew상품평작성하기</a>
				<div id="reviewListSpan">
				</div>
			<div id="pageListSpan" class="d-flex">
			</div>
		</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>