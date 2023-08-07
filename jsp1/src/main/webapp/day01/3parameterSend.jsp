<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요청 파라미터 보내기</title>
</head>
<body>
	<!-- 요청 파라미터 보내는 방법 [1] : a 태그의 쿼리 스트링으로 보내기 -->
	<a href="3parameterReceive.jsp?name=김모모">파라미터 1개 보냅니다.</a>
	<br>
	<a href="3parameterReceive.jsp?name=김모모&age=24">파라미터 2개 보냅니다.</a>
	<br>
	
	
</body>
</html>