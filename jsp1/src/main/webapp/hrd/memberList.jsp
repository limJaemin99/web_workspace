<%@page import="sample.DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="styleSheet" href="./layout.css">
	<link rel="styleSheet" href="./list.css">
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
			<li><a href="./memberRegister.html">회원등록</a></li>
			<li><a href="./memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="./memberSales.html">회원매출조회</a></li>
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
				<!-- for문 사용 -->
<!--				<% MemberDAO dao = MemberDAO.getMemberDAO();
					List<MemberDTO> list = dao.selectAll();
					for(int i=0; i<list.size(); i++) {
				%>
				<tr>
					<td><a href="./memberRegister.html"><%= list.get(i).getCustno() %></a></td>
					<td><%= list.get(i).getCustname() %></td>
					<td><%= list.get(i).getPhone() %></td>
					<td><%= list.get(i).getAddress() %></td>
					<td><%= list.get(i).getJoindate() %></td>
					<td><%= list.get(i).getGrade() %></td>
					<td><%= list.get(i).getCity() %></td>
				</tr>
				<% }	//for end %>
-->				
				<!-- for-each문 사용 -->
				<% for(MemberDTO dto : list) { %>
				<tr>
					<td>
						<a href="./memberUpdate.jsp?custno=<%= dto.getCustno() %>">
							<%= dto.getCustno() %>
						</a>
					</td>
					<td><%= dto.getCustname() %></td>
					<td><%= dto.getPhone() %></td>
					<td><%= dto.getAddress() %></td>
					<td><%= dto.getJoindate() %></td>
					<!-- 스크립트릿, 표현식 등 자바코드 주석기호는 아래와 같다. -->
					<%-- <td><%= dto.getGrade() %></td> --%>
					<!-- 스크립트릿 자바코드 위치는 body 안에서 어디에서 가능하다. -->
					<td>
					<!-- out : jsp 객체. html 문서에 출력 기능을 갖고 텍스트와 태그를 출력한다. -->
						<!-- 따로 선언하지 않고 사용하는 내장(embeded) 객체이다. -->
						<% 
							if(dto.getGrade().equals("VIP"))
								out.println("<span style='color:red;'>VIP</span>");
							else
								out.println(dto.getGrade());
						%>
					</td>
					<td><%= dto.getCity() %></td>
				</tr>
				<% }	//for-each end %>
		</table>
	</section>
		
<!-- footer -->
	<footer>
		<h3>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</h3>
	</footer>
</body>
</html>