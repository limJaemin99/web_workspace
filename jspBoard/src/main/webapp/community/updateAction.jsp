<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dao.communityDAO"%>
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
	//request.setCharacterEncoding("UTF-8");	//EncodingFilter.java 에서 인코딩 처리
	
	String ip = request.getRemoteAddr();	//클라이언트 ip 가져오기
	
	long idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
		//변수명을 page 로 하면 오류가 나는 이유 : JSP 의 내장객체 page 와 충돌이 발생함
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	communityDAO dao = communityDAO.getCommunityDAO();
	//Community vo = new Community(idx,null,title,content,0,null,ip,null);
	Community vo = Community.builder()
					.idx(idx)
					.title(title)
					.content(content)
					.ip(ip)
					.build();
	
	int result = dao.update(vo);
	if(result == 1) {
		request.setAttribute("message", "글 수정이 완료되었습니다.");
		request.setAttribute("url", "read.jsp?idx=" + idx + "&page=" + pageNo);
		pageContext.forward("alert.jsp");
	}
%>

</body>
</html>
