<%@page import="sample.DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sample JSP</title>
</head>
<body>
	
	<!-- 에러 발생시 참고 사이트 : https://developer.mozilla.org/ko/docs/Web/HTTP/Status -->
	
	<%	/* ◀ 스크립트릿 : 자바 코드가 들어갈 수 있는 기호 */
		MemberDAO dao = MemberDAO.getMemberDAO();
		List<MemberDTO> list = dao.selectAll();
	%>	
	<h3>회원목록</h3>
	<%= list %>	<!-- ◀ 표현식 : 변수, 수식 등 리턴값이 있는것들 -->
	
</body>
</html>
