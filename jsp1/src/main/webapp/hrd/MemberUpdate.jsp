<%@page import="sample.DTO.MemberDTO"%>
<%@page import="sample.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="styleSheet" href="./layout.css">
	<link rel="styleSheet" href="./Update.css">
</head>
<body>
<!-- 정보 수정 화면은 현재값을 먼저 보여주고 수정할 수 있게 한다. -->
<!-- custno, 즉 PK 값으로 db에서 select 한 결과를 화면에 표시하는 코드가 필요하다. -->

<!-- memberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장한다. -->
<!-- 그리고 value 에서 출력하기 -->
<% 
	String custno = request.getParameter("custno");
	MemberDAO dao = MemberDAO.getMemberDAO();
	MemberDTO dto = null;
	if(custno != null)	//수정할 데이터를 가져오기(참고 : custno 가 테이블 PK 값)
		dto = dao.selectOne(Integer.parseInt(custno));
%>

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
		<!-- action 은 input 데이터를 전달받고 처리할 URL 이다. 
				▶ memberSave.jsp를 만들기.
				▶ 그리고 전달받은 파라미터로 update를 실행하기.
				※ memberSave.jsp 파일에는 자바코드만 작성하고 태그는 필요없다.
				※ memberUpdate.jsp 에서 보내는 파라미터 이름은 input 태그의 name 속성이다.
		-->
		<form action="UpdateSave.jsp" method="post">
		<!-- 이후 자바코드 작성할 때 가독성, 편리성을 위해 input name 이름은 DTO 클래스 변수명과 동일하게 하기 ★★★★★ 
			 UpdateSave.jsp 의 파라미터 저장 변수도 DTO와 동일하게 하기
		 -->
		<table>										
			<tr>									
				<th><label for="lblNo"><strong>회원번호(자동발생)</strong></label></th>
				<!-- memberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장한다. -->
				<!-- 그리고 value 에서 출력하기 -->
				<td><input type="number" id="lblNo" value="<%= custno %>" name="custno" readonly="readonly"></td>
			</tr>
			<tr>
				<th><label for="lblName"><strong>회원성명</strong></label></th>
				<td><input type="text" id="lblName" name="name" placeholder="이름" value="<%= dto.getCustname() %>"></td>
			</tr>
			<tr>
				<th><label for="lblTel"><strong>회원전화</strong></label></th>
				<td><input type="text" id="lblTel" name="phone" size="26" placeholder="전화번호" value="<%= dto.getPhone() %>"></td>
			</tr>
			<tr>
				<th><label for="lblAddr"><strong>회원주소</strong></label></th>
				<td><input type="text" id="lblAddr" name="address" size="40" placeholder="주소" value="<%= dto.getAddress() %>"></td>
			</tr>
			<tr>
				<th><label for="lblJoin"><strong>가입일자</strong></label></th>
				<td><input type="text" id="lblJoin" name="joinDate" placeholder="가입일자" value="<%= dto.getJoindate() %>" disabled></td>
			</tr>
			<tr>
				<th><label for="lblGrade"><strong>고객등급[A:VIP,B:일반,C:직원]</strong></label></th>
				<td><input type="text" id="lblGrade" name="grade" maxlength="1" placeholder="등급" value="<%= dto.getGrade() %>"></td>
			</tr>
			<tr>
				<th><label for="lblCity"><strong>도시코드</strong></label></th>
				<td><input type="text" id="lblCity" name="city" maxlength="2" placeholder="도시코드" value="<%= dto.getCity() %>"></td>
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