<%@page import="java.net.InetAddress"%>
<%@page import="org.iclass.dto.BookUser"%>
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
	request.setCharacterEncoding("UTF-8");	//인코딩 ★★★★★★★★★★
	
	BookUser writer = (BookUser)session.getAttribute("user");
	//아래 작성자는 문제점을 발견하기 위한 추가 사항이고, 나중에 삭제할 예정	//아래와 같이 하면 세션 비교 코드가 필요함
	//String writer = request.getParameter("writer");

	String ip = request.getRemoteAddr();	//클라이언트 ip 가져오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	communityDAO dao = communityDAO.getCommunityDAO();
	
	long idx = dao.insert(Community.builder()
			.writer(writer.getId())
			//.writer(writer)
			.title(title)
			.content(content)
			.ip(ip)
			//.ip(null)	//community.xml 의 insert 에서 ,jdbc=VARCHAR 로 null 허용했음 ▶ 결과 : () 로 출력됨
			.build());
%>
	<script type="text/javascript">
		alert('글 등록이 완료되었습니다.')
		location.href='list.jsp'
	</script>
</body>
</html>
