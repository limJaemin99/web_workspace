<%@page import="sample.DTO.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderDetail.jsp</title>
</head>
<body>
	<% 
		String email = request.getParameter("email");
		OrderDAO dao = OrderDAO.getOrderDAO();
		List<OrderDTO> list = dao.selectByEmail(email);
	%>
	<h3><%= email %> 고객 주문 현황</h3>
	<hr>
	<table style="width: 500px;">
		<tr>
			<th style="width: 200px;">상품 코드</th>
			<th style="width: 100px;">수량</th>
			<th style="width: 200px;">주문 날짜</th>
		</tr>
		<% 
			for(OrderDTO dto : list) {
		%>
		<tr>
			<td style="text-align: center;"><%= dto.getPcode() %></td>
			<td style="text-align: center;"><%= dto.getQuantity() %></td>
			<td style="text-align: center;"><%= dto.getOrderdate() %></td>
		</tr>
		<% 
			}
		%>
	</table>
	
	<!-- 문제7 . (7) ? 에 필요한 코드를 작성하세요.  -->
		<!-- ▶ 답7 . request.getParameter("email"); -->
	<!-- 문제8 . (8) ? 에 필요한 코드를 작성하세요. -->
		<!-- ▶ 답8 . for(OrderDTO dto : list) { -->
		
</body>
</html>