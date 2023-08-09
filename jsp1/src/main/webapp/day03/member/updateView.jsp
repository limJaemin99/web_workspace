<%@page import="sample.DTO.MemberDTO"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="styleSheet" href="../../css/layout.css">
	<link rel="styleSheet" href="../../css/Update.css">
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
		<h3>홈쇼핑 회원 정보 수정</h3>
		<%-- ★★★★★ ${} (EL)기호는 반드시 jsp 주석 안에 써야한다 ★★★★★ --%>
		<%-- ${} (EL)기호는 getAttribute() 역할을 한다. --%>
		<%-- <jsp:useBean id="member" class="sample.DTO.MemberDTO" scope="request" /> --%>
		<form action="UpdateSave.jsp" method="post">
		<table>										
			<tr>									
				<th><label for="lblNo"><strong>회원번호(자동발생)</strong></label></th>
				<!-- ★★★ param 은 getParameter() 동작을 하는 EL에서 사용하는 객체 ★★★ -->
				<td><input type="number" id="lblNo" value="${param.custno}" name="custno" disabled>
					<input type="hidden" name="custno" value="${param.custno}">
				</td>
			</tr>
			<tr>
				<th><label for="lblName"><strong>회원성명</strong></label></th>
				<td><input type="text" id="lblName" name="name" placeholder="이름" value="${member.custname}"></td>
			</tr>
			<tr>
				<th><label for="lblTel"><strong>회원전화</strong></label></th>
				<td><input type="text" id="lblTel" name="phone" size="26" placeholder="전화번호" value="${member.phone}"></td>
			</tr>
			<tr>
				<th><label for="lblAddr"><strong>회원주소</strong></label></th>
				<td><input type="text" id="lblAddr" name="address" size="40" placeholder="주소" value="${member.address}"></td>
			</tr>
			<tr>
				<th><label for="lblJoin"><strong>가입일자</strong></label></th>
				<td><input type="text" id="lblJoin" name="joinDate" placeholder="가입일자" value="${member.joindate}" disabled></td>
			</tr>
			<tr>
				<th><label for="lblGrade"><strong>고객등급[A:VIP,B:일반,C:직원]</strong></label></th>
				<td><input type="text" id="lblGrade" name="grade" maxlength="1" placeholder="등급" value="${member.grade}"></td>
			</tr>
			<tr>
				<th><label for="lblCity"><strong>도시코드</strong></label></th>
				<td><input type="text" id="lblCity" name="city" maxlength="2" placeholder="도시코드" value="${member.city}"></td>
			</tr>
			<tr>
				<td colspan="2" class="button">
					<button>수정</button>
					<button type="button" onclick="location.href='MemberList.jsp'">조회</button>
				</td>
			</tr>
		</table>
		</form>
	</section>

<!-- footer -->
	<footer>
		<h3>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</h3>
	</footer>

</body>
</html>
