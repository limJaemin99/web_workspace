<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈쇼핑 회원 등록</title>
	<link rel="styleSheet" href="./layout.css">
	<link rel="styleSheet" href="./register.css">
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
		<h3>홈쇼핑 회원 등록</h3>
		<form action="RegisterSave.jsp" method="post">
		<%
			MemberDAO dao = MemberDAO.getMemberDAO();
		%>
		<table>										
			<tr>									
				<th><label for="lblNo"><strong>회원번호(자동발생)</strong></label></th>
				<!-- memberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장한다. -->
				<!-- 그리고 value 에서 출력하기 -->
				<td><input type="number" id="lblNo" value="<%= dao.nextCustno() %>" name="custno" readonly></td>
			</tr>
			<tr>
				<th><label for="lblName"><strong>회원성명</strong></label></th>
				<td><input type="text" id="lblName" name="custname" placeholder="이름"></td>
			</tr>
			<tr>
				<th><label for="lblTel"><strong>회원전화</strong></label></th>
				<td><input type="text" id="lblTel" name="phone" size="26" placeholder="전화번호"></td>
			</tr>
			<tr>
				<th><label for="lblAddr"><strong>회원주소</strong></label></th>
				<td><input type="text" id="lblAddr" name="address" size="40" placeholder="주소"></td>
			</tr>
			<tr>
				<th><label for="lblJoin"><strong>가입일자</strong></label></th>
				<td><input type="text" id="lblJoin" name="joinDate" value="" disabled></td>
			</tr>
			<tr>
				<th><label for="lblGrade"><strong>고객등급[A:VIP,B:일반,C:직원]</strong></label></th>
				<td><input type="text" id="lblGrade" name="grade" maxlength="1" placeholder="등급"></td>
			</tr>
			<tr>
				<th><label for="lblCity"><strong>도시코드</strong></label></th>
				<td><input type="text" id="lblCity" name="city" maxlength="2" placeholder="도시코드"></td>
			</tr>
			<tr>
				<td colspan="2" class="button">
					<button>등록</button>
					<button type="button" onclick="location.href='memberList.jsp'">조회</button>
				</td>
			</tr>
		</table>
		</form>
	</section>

<!-- footer -->
	<footer>
		<h3>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</h3>
	</footer>
	
<!-- script -->
	<script type="text/javascript">
		const currentDate = new Date()
		
		const year = currentDate.getFullYear()
		const month = (currentDate.getMonth()+1).toString().padStart(2,'0')
		const date = currentDate.getDate().toString().padStart(2,'0')
		
		let today = [year,month,date].join('-')
		
		document.getElementById('lblJoin').value = today
	</script>
	
</body>
</html>