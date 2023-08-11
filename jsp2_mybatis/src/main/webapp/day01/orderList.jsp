<%@page import="java.util.List"%>
<%@page import="sample.DAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderList.jsp</title>
</head>
<body>
	<h3>고객 주문 현황</h3>
	<hr>
	<ul>
		<% 
			OrderDAO dao = OrderDAO.getOrderDAO();
			List<String> list = dao.selectOrderByEmail();
			for(String email : list) {
		%>
		<li><a href="orderDetail.jsp?email=<%= email %>"><%= email %></a></li>
		<% 
			}
		%>
	</ul>
	
	<!-- 문제6 . (6) ? 에 공통으로 해당하는 출력 표현식을 쓰세요. -->
		<%-- ▶ 답6 . <%= email %> --%>
	
</body>
</html>