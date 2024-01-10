<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/logout" method="post">
		<sec:csrfInput />
		<p>
			principal :
			<sec:authentication property="principal" />
		</p>
		<p>
			Member :
			<sec:authentication property="principal.account" />
		</p>
		<p>
			사용자이름 :
			<sec:authentication property="principal.account.name" />
		</p>
		<p>
			사용자아이디 :
			<sec:authentication property="principal.username" />
		</p>
		<p>
			사용자 권한 리스트 :
			<sec:authentication property="principal.account.authList" />
		</p>
		<div>
			<a href="/">HOME</a>
		</div>
		<button>로그아웃</button>
	</form>
</body>
</html>