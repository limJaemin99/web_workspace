<%@page import="org.iclass.dto.BookUser"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.iclass.dto.Paging"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dao.communityDAO"%>
<%@page import="java.security.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BookUser user = (BookUser)session.getAttribute("user");
	if(user==null) {	//로그인이 안된 상태
		throw new IllegalAccessException();	//임의로 오류를 발생시킴
		//IllegalAccessException : 일반적으로 임의의 Exception 발생시킬 때 많이 사용한다.
	}

	int idx=0;
	int pageNo=0;
	if(request.getParameter("idx") != null) {
		idx = Integer.parseInt(request.getParameter("idx"));
	}
	
	//글 상세보기를 클릭한 페이지의 번호를 파라미터로 가져오는 이유 : 글 상세보기에서 다시 글 목록으로 돌아갈 때를 위해서.
		//▶ 보고있던 글 목록 페이지로 돌아가기
	
	if(request.getParameter("page") != null) {
		pageNo = Integer.parseInt(request.getParameter("page"));
	}
	
	communityDAO dao = communityDAO.getCommunityDAO();
	Community vo = dao.selectByIdx(idx);	//idx 글 조회하기
	
	if(!user.getId().equals(vo.getWriter()))	//로그인한 사용자와 글쓴이가 다를 때
			throw new IllegalAccessException();
	
//	[1]
	request.setAttribute("vo", vo);
//	[2]
	request.setAttribute("page", pageNo);
	
	pageContext.forward("updateView.jsp");	//화면에 애트리뷰트와 함께 요청 전달
%>

</body>
</html>
