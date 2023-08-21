<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리 북카페</title>
	<link rel="styleSheet" href="${pageContext.request.contextPath}/css/community.css?v=3">
</head>
<body>
	<main id="write">
		<h3>북챗 :: 커뮤니티</h3>
		<p>오늘 무슨 책을 읽으셨나요?</p>
		<hr style="color: white;">
		
		<!-- <form name="frm1" method="post" action="writeAction.jsp"> -->
																<!-- ▼ onsubmit 설명은 최하단에 있음 -->
		<form name="frm1" method="post" action="writeAction.jsp" onsubmit="return isValid()">
			<table>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" size="50" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>	<!-- textarea 의 크기 : rows="30" cols="80" -->
					<td>
						<textarea rows="30" cols="80" name="content" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">저장</button>
						<button type="reset">다시쓰기</button>
						<button type="button" onclick="location.href='list.jsp'">목록</button>	 <!-- 현재 페이지 번호 전달 - 순서 5) -->
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	<!-- 유효성검사 스크립트 -->
	<script type="text/javascript">
		//태그의 required 속성을 사용하여 필수 입력을 체크할 수 있지만, 필수 입력 외의 다른 유효성 검사
			//ex) 최소 길이 또는 정규식 패턴 등의 유효성 검사를 위해 함수를 사용한다.
		function isValid() {
			let result = true	//유효성 검사 결과 저장
			const content = document.forms[0].content	//input 요소 지정
			const title = document.forms[0].title	//input 요소 지정
			
			if(title.value == '') {
				alert('글 제목 작성은 필수입니다.')
				result = false
				content.focus()
			}

			if(content.value == '') {
				alert('글 내용 작성은 필수입니다.')
				result = false
				content.focus()
			}
			
			return result
		}
		
		//유효성 검사를 위해 저장 버튼 타입을 submit 으로 설정하는 방법이다.
		//[form 태그]에 onsubmit="return isValid()"
			//▶ isValid() 함수를 실행한 리턴이 true 일 때만 submit 한다.
		
	</script>
</body>
</html>

<!-- 
	이클립스에 IPv4 로 처리되도록 톰캣 설정을 바꾼다.
	request 객체로 remoteAddr 받을 때 기본 설정이 IPv6 로 출력된다.
	
	※ 변경 방법 : Run Configurations ▶ 왼쪽 항목에서 Tomcat Server 클릭 ▶ Arguments 탭에서
				▶ VM argument 문자열 맨 마지막에 다음 내용 작성
					[-Djava.net.preferIPv4Stack=true]
-->
