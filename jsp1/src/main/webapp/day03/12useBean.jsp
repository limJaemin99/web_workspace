<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>12useBean.jsp</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dto" class="sample.DTO.MyUser" />


	<jsp:setProperty property="uname" name="dto" param="uname"/>
	myuser 이름 : <jsp:getProperty property="uname" name="dto"/>
				 <!-- ↑ getXXX 메소드 역할 -->

	<jsp:setProperty property="age" name="dto" param="age"/>
	myuser 나이 : <jsp:getProperty property="age" name="dto"/>

	<jsp:setProperty property="address" name="dto" param="address"/>
	myuser 주소 : <jsp:getProperty property="address" name="dto"/>
	
	<ul>
		<li>${dto.uname}</li>
		<li>${dto.age}</li>
		<li>${dto.address}</li>
	</ul>
	
	<hr>

<!-- 10scopeTest.jsp 에서도 아래 2개의 자바빈을 가져올 수 있는지 확인해보기 -->
<!-- scope 를 다르게 하여 자바빈즈 2개를 더 만들기 -->
	<jsp:useBean id="appDTO" class="sample.DTO.MyUser" scope="application"/>
	<jsp:setProperty property="*" name="appDTO"/>
	
	<jsp:useBean id="sessionDTO" class="sample.DTO.MyUser" scope="session"/>
	<jsp:setProperty property="*" name="sessionDTO"/>
	
	<% out.print(appDTO); %>
	<% out.print("<br>"); %>
	<% out.print(sessionDTO); %>
	
	<a href="10scopeTest.jsp">10scopeTest.jsp 로 확인하러 가기</a>
	
	
</body>
</html>