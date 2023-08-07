<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요청 파라미터 받기 : 3parameterReceive.jsp</title>
</head>
<body>
	<!-- 서버를 직접 개발하는중이므로 요청 파라미터를 받고 처리하는 코드를 작성할 수 있다. -->
<% 
	//파라미터값은 request 객체의 getParameter("파라미터 이름")으로 전달받는다.
	//전달받은 파라미터는 모두 String 이다.
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	out.print("이름 : "+name);
	out.print("<br>");
	
	//전달되지 않은 파라미터 이름은 값이 null
	out.print("나이 : "+age);
	out.print("<br>");
	
	//아래 코드 테스트 : age 가 null이면 exception 발생
	//int iage = Integer.parseInt(age);
	if(age != null){
		int iage = Integer.parseInt(age); 
		out.print("int 타입 나이 : "+iage);
		out.print("<br>");
	}
%>
	
</body>
</html>