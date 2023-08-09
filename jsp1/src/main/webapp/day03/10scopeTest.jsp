<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10scopeTest.jsp</title>
</head>
<body>
	<h3>scope 테스트</h3>
	<hr>
	
	<!-- application Scope 에 저장된 appDTO 자바빈을 가져오기 -->
	<h4>application</h4>
	<jsp:useBean id="appDTO" class="sample.DTO.MyUser" scope="application" />
	<% out.println(appDTO); %>
	<hr>
	<ul>
		<li>${appDTO.uname}</li>	<!-- getXXX, getter 대신에 필드 이름만 작성 -->
		<li>${appDTO.age}</li>
		<li>${appDTO.address}</li>
	</ul>

	<hr>
	
	<!-- session Scope 에 저장된 sessionDTO 자바빈을 가져오기 -->
	<h4>session</h4>
	<jsp:useBean id="sessionDTO" class="sample.DTO.MyUser" scope="session" />
	<% out.println(sessionDTO); %>
	<hr>
	<hr>
	<ul>
		<li>${sessionDTO.uname}</li>
		<li>${sessionDTO.age}</li>
		<li>${sessionDTO.address}</li>
	</ul>

	<!-- scope 가 없을 경우 기본 scope="page" -->
	<h4>???</h4> 
	<p>★ jsp:useBean 의 기본 scope="page" 이다 ★</p>
	<p>★ 여기서 page 는 pageContext 이다★</p>
	<p>▶ 자바빈 id dto 는 12useBean.jsp 에서만 사용할 수 있다.</p>
	<jsp:useBean id="DTO" class="sample.DTO.MyUser" />
	<% out.println(DTO); %>
	<hr>
</body>
</html>