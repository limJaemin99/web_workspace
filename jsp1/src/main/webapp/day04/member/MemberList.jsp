<%@page import="sample.DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- <link rel="styleSheet" href="../../hrd/layout.css">
	<link rel="styleSheet" href="../../hrd/list.css"> -->
	
	<!-- 아래 href 의 주소는 애플리케이션 이름(context)를 기준으로 하는 절대주소이다. -->
	<link rel="styleSheet" href="<%= request.getContextPath() %>/hrd/layout.css">
	<!-- el 로 표기할 때는 현재 페이지의 request 를 가져와야 한다(pageContext.request) -->
	<link rel="styleSheet" href="${pageContext.request.contextPath}/hrd/list.css">
</head>
<body>
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
		<h3>회원목록 조회/수정</h3>
		<table>
			<tr>
				<th><strong>회원번호</strong></th>
				<th><strong>회원성명</strong></th>
				<th><strong>전화번호</strong></th>
				<th><strong class="address">주소</strong></th>
				<th><strong>가입일자</strong></th>
				<th><strong>고객등급</strong></th>
				<th><strong>거주지역</strong></th>
			</tr>
			
			<c:forEach items="${list}" var="dto">	
			<tr>
				<td>
					<a href="MemberUpdate.jsp?=custno${dto.custno}">
						<c:out value="${dto.custno}"></c:out>
					</a>
				</td>
				<td><c:out value="${dto.custname}"/></td>
				<td><c:out value="${dto.phone}"/></td>
				<td><c:out value="${dto.address}"/></td>
				<td><c:out value="${dto.joindate}"/></td>
					<c:if test="${dto.grade eq 'VIP'}">		<!-- equal -->
						<td>
							<span style="color:red;">VIP</span>
						</td>
					</c:if>
					<c:if test="${dto.grade ne 'VIP'}">		<!-- not equal -->
						<td>
							<c:out value="${dto.grade}"/>
						</td>
					</c:if>
				<td><c:out value="${dto.city}"/></td>
			</tr>
			</c:forEach>
		</table>
	</section>
		
<!-- footer -->
	<footer>
		<h3>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</h3>
	</footer>
</body>
</html>