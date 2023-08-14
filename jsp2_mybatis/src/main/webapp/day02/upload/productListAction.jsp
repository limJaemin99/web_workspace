<%@page import="sample.DTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>처리기능</title>
</head>
<body>
<!-- 처리기능 -->
<% 
	ProductDAO dao = ProductDAO.getProductDAO();
	List<ProductDTO> list = dao.getProducts();
	
	/* jsp:useBean(scope='request') 와 jsp:forward 태그와 동일한 명령 */
	request.setAttribute("list", list);
	pageContext.forward("productListView.jsp");
%>

</body>
</html>