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

<script>
	let result = "${msg}";
	if (result === "SUCCESS") {
		alert("An account that already exists. Exit");
	}
	let result2 = "${msg2}";
	if (result2 === "SUCCESS2") {
		alert("지금까지 이용해 주셔서 감사합니다");
	}
	let result3 = "${msg3}";
	if (result3 === "SUCCESS3") {
		alert("죄송합니다. 본인의 아이디와 비밀번호를 적어주세요.");
	}
</script>

<!-- css common Area 헤더 푸터에 쓸 css 경로-->
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<!-- script common Area 헤더 푸터에 쓸 script 경로-->
<%@ include file="/WEB-INF/views/common/script.jsp"%>
<!-- css local Area 각 개별페이지 css 경로는 여기다가 쓸 것-->
<%@ include file="/WEB-INF/views/common/homewoof/style.jsp"%>
<!-- script local Area  각 개별페이지 script 경로는 여기다가 쓸 것 -->
<%-- <%@ include file="" %> --%>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<main class="pt-2">
		<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
		<!-- ================================================Content Area======================================================== -->
		<section>
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel"
				style="height: 400px;">
				<div class="carousel-inner h-100 text-center">
					<!-- 회전목마 테이블을 만들어서 관리자가 맘대로 가능하게 -->
					<div class="carousel-item active h-100">
						<a href="#"> <img class="w-100 "
							src="/resource/image/mainPage/iu1.jpg" alt="">
						</a>
					</div>
					<div class="carousel-item  h-100">
						<a href="#"> <img class="w-100 "
							src="/resource/image/mainPage/iu2.jpg" alt="">
						</a>
					</div>
					<div class="carousel-item h-100">
						<a href="#"> <img class="w-100 "
							src="/resource/image/mainPage/iu3.jpg" alt="">
						</a>
					</div>
					<div class="carousel-item  h-100">
						<a href="#"> <img class="w-100 "
							src="/resource/image/mainPage/iu4.jpg" alt="">
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

			<hr>

			<div class="row p-0 m-0">
				<div class="col-7 p-0 pe-2 m-0">
					<div class="ps-1 pb-2 m-0"><b><spring:message code="common.petReview"/></b></div>
					<div class="row p-0 m-0 pe-1 " style="height: 800px;">

						<!-- 입양후기 테이블에서 4개 뽑아오기 -->
						<div class="card col-6 p-1 h-50">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 h-100 ">
								<div class="h-75 overflow-hidden rounded ">
									<img src="/resource/image/mainPage/cat1.jpg" alt=""
										class="w-100">
								</div>
								<div class="h-25 overflow-hidden p-1"
									style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 4;">
									<spring:message code="home.petReviewExample1"/></div>
							</a>
						</div>
						<div class="card col-6 p-1 h-50">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 h-100 ">
								<div class="h-75 overflow-hidden rounded ">
									<img src="/resource/image/mainPage/puppy-7.jpg" alt=""
										class="w-100">
								</div>
								<div class="h-25 overflow-hidden p-1"
									style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 4;">
									<spring:message code="home.petReviewExample2"/></div>
							</a>
						</div>
						<div class="card col-6 p-1 h-50">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 h-100 ">
								<div class="h-75 overflow-hidden rounded ">
									<img src="/resource/image/mainPage/cat5.jpg" alt=""
										class="w-100">
								</div>
								<div class="h-25 overflow-hidden p-1"
									style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 4;">
									<spring:message code="home.petReviewExample3"/></div>
							</a>
						</div>
						<div class="card col-6 p-1 h-50">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 h-100 ">
								<div class="h-75 overflow-hidden rounded ">
									<img src="/resource/image/mainPage/cat3.jpg" alt=""
										class="w-100">
								</div>
								<div class="h-25 overflow-hidden p-1"
									style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 4;">
									<spring:message code="home.petReviewExample4"/></div>
							</a>
						</div>
					</div>
					<div id="itemCarousel" class="carousel slide p-1"
						style="height: 250px;">
						<div class="ps-1 pb-2 m-0"><b><spring:message code="common.store"/></b></div>
						<div class="carousel-inner h-100 ">
							<c:forEach var="row" items="${itemList}" varStatus="status" begin="0" end="1">
								<div class="carousel-item ${status.first ? 'active' : ''} h-100 ">
									<div class="row p-0 m-0 ">
									<c:forEach var="innerItem" items="${itemList}" varStatus="innerStatus" begin="${status.index * 4}" end="${(status.index + 1) * 4 - 1}">
				                        <div class="card col-3 p-1 border-0">
				                            <a href="/item/getItem?itemNo=${innerItem.itemNo}" class="text-black link-underline link-underline-opacity-0">
				                                <img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${innerItem.itemNo}" width="150" height="150" alt="Item image">
				                                <div class="ps-2">
				                                    <span>${innerItem.itemName}</span>
				                                </div>
				                            </a>
				                        </div>
				                    </c:forEach>
									</div>
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev justify-content-start"
							type="button" data-bs-target="#itemCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon bg-dark"
								aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next justify-content-end "
							type="button" data-bs-target="#itemCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon bg-dark"
								aria-hidden="true"></span> <span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="col-5 p-0 ps-2 m-0 ">
					<div class="ps-1 pb-2 m-0"><b><spring:message code="common.pet"/></b></div>
					<div class="row p-0 m-0" style="height: 600px;">
						<!-- 분양 테이블에서 4개 뽑아오기 -->
						<div class="card col-6 p-1 rounded-5 h-50 ">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 rounded-5 overflow-hidden ">
								<img src="/resource/image/mainPage/puppy-1.jpg" alt=""
								class="w-100">
								<div class="card-body card-img-overlay"
									style="text-shadow: 1px 1px white, -1px -1px white, -1px 1px white, 1px -1px white;">
									<span class="card-title fs-1 fw-bold">개이름</span><br> <span
										class="card-text fs-3">개혈통</span>
								</div>
							</a>
						</div>
						<div class="card col-6  p-1  rounded-5 h-50 ">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 rounded-5 overflow-hidden ">
								<img src="/resource/image/mainPage/puppy-9.jpg" alt=""
								class="w-100">
								<div class="card-body card-img-overlay"
									style="text-shadow: 1px 1px white, -1px -1px white, -1px 1px white, 1px -1px white;">
									<span class="card-title fs-4 fw-bold">댕멍이</span><br> <span
										class="card-text fs-6">치와와</span>
								</div>
							</a>
						</div>
						<div class="card col-6  p-1 rounded-5 h-50 ">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 rounded-5 overflow-hidden ">
								<img src="/resource/image/mainPage/puppy-8.jpg" alt=""
								class="w-100">
								<div class="card-body card-img-overlay"
									style="text-shadow: 1px 1px white, -1px -1px white, -1px 1px white, 1px -1px white;">
									<span class="card-title fs-3 fw-bold">멍댕이</span><br> <span
										class="card-text fs-5">푸들</span>
								</div>
							</a>
						</div>
						<div class="card col-6  p-1  rounded-5 h-50 ">
							<a href=""
								class="text-black link-underline link-underline-opacity-0 rounded-5 overflow-hidden ">
								<img src="/resource/image/mainPage/puppy-3.jpg" alt=""
								class="w-100">
								<div class="card-body card-img-overlay"
									style="text-shadow: 1px 1px white, -1px -1px white, -1px 1px white, 1px -1px white;">
									<span class="card-title fs-2 fw-bold">멍멍이</span><br> <span
										class="card-text fs-4">골든 리트리버</span>
								</div>
							</a>
						</div>
					</div>
					<hr>
					<div class="mt-3">
						<p class="text-center fs-5 mt-3"><b><spring:message code="common.announcement"/></b></p>
						<ul class="list-group list-group-flush">
							<!-- 공지사항 테이블에서 4개 뽑아오기 -->
							<li class="list-group-item border-0 p-0 m-0"><a href="#"
								class="list-group-item list-group-item-action border-0 text-truncate">
									여기는 공지사항 제목이 들어갈 자리입니다 공지사항 제목을 list로 받아서 c:foreach로 나열합니다 </a></li>
							<li class="list-group-item border-0 p-0 m-0"><a href="#"
								class="list-group-item list-group-item-action border-0 text-truncate">
									제목을 list로 받아서 c:foreach로 나열합니다 제목의 길이가 칸을 넘어가면</a></li>
							<li class="list-group-item border-0 p-0 m-0"><a href="#"
								class="list-group-item list-group-item-action border-0 text-truncate">
									칸을 넘어가면 보이는것과 같이 말줄임표 '...'로 생략합니다</a></li>
							<li class="list-group-item border-0 p-0 m-0"><a href="#"
								class="list-group-item list-group-item-action border-0 text-truncate">
									각 제목은 해당 공지사항으로 링크가 달려있어서 클릭하면 이동합니다</a></li>
							<li class="list-group-item border-0 p-0 m-0"><a href="#"
								class="list-group-item list-group-item-action border-0 text-truncate">
									클릭하면 이동합니다</a></li>

						</ul>
					</div>
				</div>
			</div>
		</section>
	</main>



	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>