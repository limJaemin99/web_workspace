<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4form.jsp</title>
</head>
<body>
	<h3>파라미터 보내는 폼</h3>
	<form action="5receive.jsp" >
		<h4>회원</h4>
		<input name="name" placeholder="이름" value="김OO" readonly>
		<input name="age" placeholder="나이">
		
		<hr>
		
		<h4>상품</h4>		<!-- disabled : 비활성화 -->
		<input name="pname" placeholder="상품명" value="갤럭시" disabled>
		<input name="pcode" placeholder="상품 코드">
		<input type="hidden" name="pno" value="10111">
		
		<!-- button type="submit" : 폼 태그 안에 있을 경우 기본값 -->
		<button>전송(제출,보내기,저장 등등..)</button>
	</form>
</body>
</html>