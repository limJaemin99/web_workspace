<%@page import="sample.DTO.MoneyDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.MoneyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MemberSales.jsp</title>
	<link rel="styleSheet" href="./layout.css">
	<link rel="styleSheet" href="./sales.css">
</head>
<body>
<!-- header -->
	<header>
		<h2>쇼핑몰 회원관리 ver1.0</h2>
	</header>

<!-- nav -->
	<nav>
		<ul>
			<li><a href="MemberRegister.jsp">회원등록</a></li>
			<li><a href="MemberList.jsp">회원목록조회/수정</a></li>
			<li><a href="MemberSales.jsp">회원매출조회</a></li>
			<li><a href="./index.html">홈으로.</a></li>
		</ul>
	</nav>

<!-- section -->
	<section>
		<h3>회원 매출 조회</h3>
			<table>
				<tr>
					<th><strong>회원번호</strong></th>
					<th><strong>회원성명</strong></th>
					<th><strong>고객등급</strong></th>
					<th><strong>매출</strong></th>
				</tr>
				<% 
					MoneyDAO dao = MoneyDAO.getMoneyDAO();
					List<MoneyDTO> list = dao.moneyAll();
					for(MoneyDTO dto : list) {
				%>
				<tr>
					<td><%= dto.getCustno() %></td>
					<td><%= dto.getCustname() %></td>
					<td><%= dto.getGrade() %></td>
					<td><%= dto.getSales() %></td>
				</tr>
				<%
					}	//for end
				%>
			</table>
	</section>

<!-- footer -->
	<footer>
		<h3>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</h3>
	</footer>
		
</body>
</html>