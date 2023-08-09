<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ▲ 외부 라이브러리로 지원되는 태그를 사용하기 위한 import 입니다 ▲ -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>listView.jsp - 화면 출력 페이지</title>
</head>
<body>
	${list}
	<!-- request.getAttribute("list") 실행 + List<MemberDTO> 타입 변환 + 출력 -->
	<!-- 출력을 반복하기 위해 테이블 <tr> 태그에 넣기 : jstl 사용 (Attribute(자바빈)은 java의 for문으로는 사용 불가) -->
	<!-- JSTL : tomcat 사이트 - taglibs - .jar 파일 4개 전부 다운로드 - lib 폴더에 넣기 -->
	<!-- 이후 상단의 import 태그 사용하여 입력 -->
</body>
</html>