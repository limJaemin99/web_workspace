<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//메소드 방식이 post일 경우 인코딩이 꼭 필요하다.
	request.setCharacterEncoding("UTF-8");

	String phone = request.getParameter("phone");
	out.print(phone);		//테스트용 출력
	
	String address = request.getParameter("address");
	out.print(address);		//테스트용 출력
%>