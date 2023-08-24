<%@page import="org.iclass.dao.communityDAO"%>
<%@page import="org.iclass.dto.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	long idx = Long.parseLong(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	communityDAO dao = communityDAO.getCommunityDAO();
	if(dao.delete(idx)==1){
		request.setAttribute("message", "글번호 " + idx +" 삭제되었습니다.");
		request.setAttribute("url", "list.jsp?page="+pageNo);
	}
		pageContext.forward("alert.jsp");	
%>
</body>
</html>