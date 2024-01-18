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

<script>
	let result = "${msg}";
	if (result === "SUCCESS") {
		alert("An account that already exists. Exit");
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
					<div class="ps-1 pb-2 m-0">입양후기</div>
					<div class="row p-0 m-0 pe-1 " style="height: 800px;">

						<!-- 입양후기 테이블에서 4개 뽑아오기 -->
						<c:forEach items="${PetReviewList}" var="petReview">

							<div class="card col-6 p-1 h-50">
								<a href="/review/getReview?reviewNo=${petReview.reviewNo}"
									class="text-black link-underline link-underline-opacity-0 h-100 ">
									<div class="h-75 overflow-hidden rounded ">
										<img src="reviewPic?reviewNo=${petReview.reviewNo}" alt=""
											class="w-100">
									</div>
									<div class="h-25 overflow-hidden p-1"
										style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 4;">
										${petReview.reviewDesc}</div>
								</a>
							</div>
						</c:forEach>

					</div>

					<div id="itemCarousel" class="carousel slide p-1"
						style="height: 250px;">
						<div class="ps-1 pb-2 m-0">상품</div>
						<div class="carousel-inner h-100 ">
							<!-- 상품 테이블에서 4개 뽑아오기 -->

							<div class="carousel-item active h-100 ">
								<div class="row p-0 m-0 m-auto" style="width:90%;">
									<c:forEach items="${ItemList}" var="item" varStatus="loop">
										<c:if test="${loop.index<4}">
											<div class="card col-3 p-1 border-0 ">
												<a href="/item/getItem?itemNo=${item.itemNo}"
													class="text-black link-underline  link-underline-opacity-0">
													<img class="w-100 h-50"
													src="/item/getItemMainPic?itemNo=${item.itemNo}" alt="">
													<div class="ps-2">
														<span>${item.itemName}</span><br>
														<spanclass="text-warning">별점</span> <span
															class="fw-light fs-6">(댓글수)</span>
													</div>
												</a>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="carousel-item h-100 ">
								<div class="row p-0 m-0 m-auto" style="width:90%;">
								<c:forEach items="${ItemList}" var="item" varStatus="loop">
										<c:if test="${loop.index>=4}">
											<div class="card col-3 p-1 border-0 ">
												<a href="/item/getItem?itemNo=${item.itemNo}"
													class="text-black link-underline  link-underline-opacity-0">
													<img class="w-100 h-50"
													src="/item/getItemMainPic?itemNo=${item.itemNo}" alt="">
													<div class="ps-2">
														<span>${item.itemName}</span><br>
														<spanclass="text-warning">별점</span> <span
															class="fw-light fs-6">(댓글수)</span>
													</div>
												</a>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>

							<button class="carousel-control-prev justify-content-start w-auto"
								type="button" data-bs-target="#itemCarousel"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon bg-dark"
									aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next justify-content-end  w-auto"
								type="button" data-bs-target="#itemCarousel"
								data-bs-slide="next">
								<span class="carousel-control-next-icon bg-dark"
									aria-hidden="true"></span> <span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- end carousel  -->
					</div>
				</div>

				<div class="col-5 p-0 ps-2 m-0 ">
					<div class="ps-1 pb-2 m-0">분양</div>
					<div class="row p-0 m-0" style="height: 600px;">
						<!-- 분양 테이블에서 4개 뽑아오기 -->
						<c:forEach items="${petList}" var="pet">
							<div class="card col-6 p-1 rounded-5 h-50 ">
								<a href="/pet/getPet?petNo=${pet.petNo}"
									class="text-black link-underline link-underline-opacity-0 rounded-5 overflow-hidden ">
									<img src="/pet/getPetMainPic?petNo=${pet.petNo}" alt=""
									class="w-100">
									<div class="card-body card-img-overlay"
										style="text-shadow: 1px 1px white, -1px -1px white, -1px 1px white, 1px -1px white;">
										<span class="card-title fs-2 fw-bold">${pet.petName}</span><br>
										<span class="card-text fs-4">${pet.petType}</span>
									</div>
								</a>
							</div>

						</c:forEach>

					</div>
					<hr>
					<div class="mt-3">
						<p class="text-center fs-5 mt-3">공지사항</p>
						<ul class="list-group list-group-flush">
							<c:forEach items="${noticeList}" var="notice">
								<li class="list-group-item border-0 p-0 m-0"><a
									href="/notice/getNotice?noticeNo=${notice.noticeNo}"
									" class="list-group-item list-group-item-action border-0 text-truncate">
										${notice.noticeTitle} </a></li>
							</c:forEach>
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