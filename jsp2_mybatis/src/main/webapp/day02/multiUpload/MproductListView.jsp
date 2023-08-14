<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
</head>
<body>
	<h3>상품 목록</h3>	
	<hr>
	<a href="MuploadForm.jsp">상품 등록</a>
	<c:forEach items="${list}" var="dto">
		<div style="width: 300px; height: 400px; border: 1px solid black;">
			<c:out value="${dto.pname}" />
			<c:out value="${dto.price}" />
			<c:out value="${dto.picture}" />

			<!-- ▶ picture 파일명이 , 로 구분된 문자열(배열과 유사) ◀ -->
			<c:forTokens items="${dto.picture}" delims="," var="file">	<!-- delims : 구분한 문자 -->
				<img alt="${file}" src="/upload/${file}" style="width: 100%;">
			</c:forTokens>

		</div>
	</c:forEach>
	
	
</body>
</html>