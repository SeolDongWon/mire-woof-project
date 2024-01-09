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
</head>
<body>
<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
<!-- subMenu Area -->
	<main>
<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->


 <form method="post" action="/account/createAccount">
<div class="container mt-3" style="width: 500px">
  <table class="table table-borderless">
   
       <tr>
        <td colspan='2'><h2>회원가입</h2></td>
      </tr>
      <tr>
        <th>닉네임</th>
        <th>
          <div class="input-group mb-3">
            <input type="text" name="Username" class="form-control" placeholder="Username">
          </div>
       </th>
      </tr>
   
      <tr>
        <td>비밀번호</td>
        <th>
          <div class="input-group mb-3">
            <input type="password" name="password" class="form-control" placeholder="password">
          </div>
       </th>
      </tr>
      <tr>
        <td>이 름</td>
        <th>
          <div class="input-group mb-3">
            <input type="text" name="name" class="form-control" placeholder="name">
          </div>
       </th>
      </tr>
      <tr>
        <td>전화번호</td>
        <th>
          <div class="input-group mb-3">
            <input type="text" name="tel" class="form-control" placeholder="tel">
          </div>
       </th>
      </tr>
      <tr>
        <td>주 소</td>
        <th>
          <div class="input-group mb-3">
            <input type="text" name="address" class="form-control" placeholder="address" >
          </div>
       </th>
      </tr>
      <tr>
        <td colspan='2'><input type="submit" value="회원가입"  class="form-control" style="background: rgb(246, 220, 216)"></td>
      </tr>
    
  </table>
</div>
</form>



	
	</main>
<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>