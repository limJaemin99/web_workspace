<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>14beanForward</title>
</head>
<body>
	<h3>요청을 전달받기</h3>
	<p>13forward.jsp 로부터 요청을 전달 받은 페이지 입니다.</p>
	<p>※ 주의 : 실행은 13forward.jsp 에서 합니다.</p>
	<ul>
		<li>URL 은 무엇인가요? : http://localhost:8082/jsp1/day03/13forward.jsp</li>
		<li>화면에 표시되는 페이지는 무엇인가요? : 14beanForward.jsp</li>
	</ul>
	<p>요청이 전달될 때, URL 은 변경되지 않는다.</p>
	<p>그리고 요청을 전달한 13forward.jsp 의 출력은 버퍼에서 삭제되므로, 웹 페이지에 표시되지 않는다.</p>
	<p>※ 13forward.jsp 에서 jsp:useBean 의 scope="request" 로 하면, 자바빈 데이터가 요청과 함께 전달된다.</p>
	
	<!-- scope="request" 를 작성하지 않으면 pageScope 에서 requestDTO 빈을 찾는다. -->
	<!-- pageScope 에서는 requestDTO 자바빈이 없으므로 null 이다. -->
	<jsp:useBean id="requestDTO" class="sample.DTO.MyUser" scope="request"/>
	<hr>
	<% out.print(requestDTO); %>
	
</body>
</html>