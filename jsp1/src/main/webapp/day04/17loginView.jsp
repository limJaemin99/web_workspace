<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>17loginView.jsp</title>
</head>
<body>
	<!-- 패스워드 인증 방법으로 로그인 : id, password 입력 (제일 단순하고 쉬운 방법)
		 패스워드 평문(입력한 값)을 저장하면 정보보호법 위반
		 첫번째 방법은 평문을 서버가 받으면, 해시함수 만들어서 DB 에 저장
		 두번째 방법은 '클라이언트(자바스크립트)에서 암호화된 것'을 서버로 보내는 방법
		 			ㄴ 해시함수는 단방향(다시 복호화 불가. 평문▶암호만 가능)
		 			ㄴ 공개키 방식(양방향 암호화. 평문▶암호 / 암호▶평문 가능)
		 			
		※ 패스워드 인증 vs 토큰 인증
	-->
	
	<h3>로그인</h3>
	<form action="18loginAction.jsp" method="post">	<!-- 주소창에 파라미터가 보이지 않게 post -->
		<input type="text" name="userID" placeholder="ID를 입력하세요.">
		<br>
		<input type="password" name="userPW" placeholder="PW를 입력하세요.">
		<button>로그인</button>
	</form>
</body>
</html>