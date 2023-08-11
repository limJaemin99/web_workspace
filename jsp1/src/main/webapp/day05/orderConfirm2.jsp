<%@page import="sample.DAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderConfirm2.jsp</title>
</head>
<body>
	<%-- <jsp:useBean id="order" class="sample.DTO.OrderDTO" /> --%>
	<jsp:useBean id="order" class="sample.DTO.OrderDTO" scope="request"/>
	<jsp:setProperty property="*" name="order" />
	<% 
		OrderDAO dao = OrderDAO.getOrderDAO();
		if(dao.insert(order)==1) {
	%>
	<jsp:forward page="orderResult.jsp" />
	<% 
		}
	%>	
	
</body>
</html>