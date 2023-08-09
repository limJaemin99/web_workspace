<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>13forward.jsp</title>
</head>
<body>
	
	<!-- 11main.jsp 에서 내용 추가하였으므로 jsp:useBean 생성 -->
	<!-- 11main.jsp ▶ 13forward.jsp ▶ 14beanForward.jsp -->
	<jsp:useBean id="requestDTO" class="sample.DTO.MyUser" scope="request"/>
	<jsp:setProperty property="*" name="requestDTO"/>
	
	<!-- A.jsp 가 받은 요청을 B.jsp 에게 전달해주는 동작이 forward 이다. -->
	<h3>요청을 받아서 전달하기</h3>
	<p>13forward.jsp 가 전달을 보내는 페이지 입니다.</p>
	<jsp:forward page="14beanForward.jsp"/>
	
	
	
</body>
</html>