 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <hr>
	
 <footer class="m-0">
      <div class="row">
        <div class="col-1">
        </div>
        <div class="col-4">
          <p class="fs-6 fw-light mb-0"><spring:message code="footer.woofName"/></p>
          <p class="fs-6 fw-light mb-0"><spring:message code="footer.groupNames"/></p>
          <p class="fs-6 fw-light mb-0"><spring:message code="common.woofAddress"/></p>
          <p class="fs-6 fw-light mb-0"><spring:message code="footer.woofEmail"/></p>
          <p class="fs-6 fw-light text-body-secondary mb-0"><spring:message code="footer.copyright"/></p>
        </div>
        <div class="col-6 row text-center">
          <div class="col-3">
            <p class="fs-6 mb-2" id="bottom"><spring:message code="common.aboutUs"/></p>
            <ul class="navbar-nav fs-6 fw-light">
              <li class="nav-item"><a href="/notice/getAbout" class="nav-link link-secondary p-1"><spring:message code="common.facility"/></a></li>
              <li class="nav-item"><a href="/notice/getLocation" class="nav-link link-secondary p-1"><spring:message code="common.location"/></a></li>
              <li class="nav-item"><a href="/notice/getNoticeList" class="nav-link link-secondary p-1"><spring:message code="common.announcement"/></a></li>
            </ul>
          </div>
          <div class="col-3">
            <p class="fs-6 mb-2"><spring:message code="common.pet"/></p>
            <ul class="navbar-nav fs-6 fw-light">
              <li class="nav-item"><a href="/pet/getPetList" class="nav-link link-secondary p-1"><spring:message code="footer.petList"/></a></li>
              <li class="nav-item"><a href="/review/getReviewList" class="nav-link link-secondary p-1"><spring:message code="common.petReview"/></a></li>
            </ul>
          </div>
          <div class="col-3">
            <p class="fs-6 mb-2"><spring:message code="common.store"/></p>
            <ul class="navbar-nav fs-6 fw-light">
              <li class="nav-item"><a href="/item/itemList?itemType=Clothing" class="nav-link link-secondary p-1"><spring:message code="common.itemType1"/></a></li>
              <li class="nav-item"><a href="/item/itemList?itemType=Toy" class="nav-link link-secondary p-1"><spring:message code="common.itemType2"/></a></li>
              <li class="nav-item"><a href="/item/itemList?itemType=Food" class="nav-link link-secondary p-1"><spring:message code="common.itemType3"/></a></li>
              <li class="nav-item"><a href="/item/itemList?itemType=Accessory" class="nav-link link-secondary p-1"><spring:message code="common.itemType4"/></a></li>
            </ul>
          </div>
          <div class="col-3">
            <p class="fs-6 mb-2"><spring:message code="common.cs"/></p>
            <ul class="navbar-nav fs-6 fw-light">
              <li class="nav-item"><a href="/service/getFAQList" class="nav-link link-secondary p-1"><spring:message code="common.FAQ"/></a></li>
              <li class="nav-item"><a href="/service/getServiceList" class="nav-link link-secondary p-1"><spring:message code="footer.inquiries"/></a></li>
            </ul>
          </div>
        </div>
        <div class="col-1">
        </div>
      </div>
      <div id="sidebar" class="position-fixed bottom-50 end-0 mb-3 me-3  text-center rounded-4"
        style="background-color: rgb(246,220,216,0.7); z-index: 1000; width: 100px; ">
        <a href="#top" class="btn border-0">▲</a><br>
        <a href="/service/getServiceList" class="btn border-0">
        <spring:message code="mainMenu.inquiries"/>
        </a><br>
        <a href="https://open.kakao.com/o/gVH04oAf" target='_blank' class="btn border-0">
       <img alt="kakao문의하러가기" src="/resource/image/sidebar/kakao.png" style="width: 70px;">
        </a><br>
        <a href="/notice/getNoticeList" class="btn border-0"><spring:message code="side.notices"/></a><br>
        <a href="#bottom" class="btn border-0">▼</a><br>
      </div>
    </footer>