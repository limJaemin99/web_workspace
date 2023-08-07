<%@page import="sample.DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1start.jsp</title>
	<style type="text/css">
		table {
			border: 2px solid black;
			border-collapse: separate;
			border-spacing: 2px;
		}
		th,td{
			border: 1px solid black;
		}
	</style>
</head>
<body>
<%
	//컬렉션 데이터를 반복문으로 태그 안에 넣어주기
	String[] names = {"사나","나연","다현","모모","쯔위"};
	List<String> list = List.of("사나","나연","다현","모모","쯔위");
	MemberDTO dto = new MemberDTO(101111,"김땡땡","010-1111-2222","경기도",null,"A","11");
	
%>
	<h4>배열 names</h4>
	<ul>
<% 
	for(int i=0;i<names.length;i++) {
%>
		<li><%= names[i] %></li>
<% 
	}	//for end
%>
	</ul>
	
	<h4>Member DTO</h4>
	<table>	<!-- 출력 방향 : 세로 -->
		<tr>
			<th>번호</th>
			<td><%= dto.getCustno() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%= dto.getCustname() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%= dto.getPhone() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%= dto.getAddress() %></td>
		</tr>
	</table>
	
	<br>
	
	<table>	<!-- 출력 방향 : 가로 -->
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<tr>
			<td><%= dto.getCustno() %></td>
			<td><%= dto.getCustname() %></td>
			<td><%= dto.getPhone() %></td>
			<td><%= dto.getAddress() %></td>
		</tr>
	</table>
	<!-- 위의 내용을 이용해서 hrd 폴더 중 MemberList.html 을 MemberList.jsp로 완성해보기 -->
	<!-- 파일은 jsp를 새로 만들고, 필요한 태그는 복사하기 -->
</body>
</html>