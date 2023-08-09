<%@page import="sample.DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp - 요청 처리 기능</title>
</head>
<body>
	<% 
		MemberDAO dao = MemberDAO.getMemberDAO();
		List<MemberDTO> list = dao.selectAll();
		
		//list 를 저장하는 Attribute 메소드 실행
		request.setAttribute("list", list);
		
		//요청을 listView.jsp(화면출력)로 전달하기
		pageContext.forward("listView.jsp");
	%>
</body>
</html>