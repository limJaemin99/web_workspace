<%@page import="sample.DTO.MemberDTO"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>update.jsp</title>
</head>
<body>
	<% 
		String temp = request.getParameter("custno");
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = null;
		if(temp != null)
			dto = dao.selectOne(Integer.parseInt(temp));
		
		//jsp:useBean scope="request" 와 동일한 메소드		//자바빈 id="member"
		request.setAttribute("member",dto);
		
		//jsp:forward page="updateView.jsp" 와 동일한 메소드
		pageContext.forward("updateView.jsp");
	%>
</body>
</html>
