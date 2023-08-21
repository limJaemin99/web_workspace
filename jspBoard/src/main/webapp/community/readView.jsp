<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리 북카페</title>
	<link rel="styleSheet" href="${pageContext.request.contextPath}/css/read.css?v=3">
</head>
<body>
<main id="read">
	<h3>북챗 :: 커뮤니티</h3>
	<p>오늘 무슨 책을 읽으셨나요?</p>
	<hr style="color: white;">
	<div style="width: 80%; margin: auto; max-width: 760px;">
		<ul id="table">
			<li>
				<ul class="row">
					<li>제목</li>
					<li><c:out value="${vo.title}" /></li>
					<li>조회수</li>
					<li><c:out value="${vo.readCount}"/></li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li><c:out value="${vo.writer}"/>
						<span style="font-size: 70%; padding-left: 30px;">
							(<c:out value="${vo.ip}"/>)
						</span>
					</li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${vo.createdAt}" type="both"/></li>
					<!-- pattern = "yyyy-MM-dd HH:mm:ss" 또는 type = date,time,both 중 하나로 형식 지정하기 -->
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>
					<!-- textarea 에 입력한 엔터는 \n , DB에도 \n 으로 저장된다. ▶ teatarea 는 글쓰기, 글 수정에서 사용할 입력 태그
						 html 문서 출력시 줄바꿈은 <br> 태그로 변경되어야 하는데
						 	[방법 1] pre 태그		[방법 2] \n 을 <br> 로 대치
						 
						 ※ [방법 2] 는 줄바꿈 외에도 여러가지 메타 문자들이 대치되어야 하지만,
						 	[방법 1] 의 pre 태그 안에서는 모든 문자들을 그대로 출력시킨다.
					-->
					<li>
						<pre>
							<c:out value="${vo.content}" />
						</pre>
					</li>
				</ul>
			</li>
		</ul>
		<div style="text-align: center; margin-bottom: 10px;">
			<c:if test="${user.id==vo.writer }">  <!-- session 에 저장된 user애트리뷰트의 id와 작성자가 같은면 보이기 -->
				<a class="button" href="javascript:execute(1)">수정</a>	<!-- 자바스크립트 함수 : 인자값 1은 수정 -->
				<a class="button" href="javascript:execute(2)">삭제</a>	<!-- 자바스크립트 함수 : 인자값 2는 삭제 -->
			</c:if>
				<a class="button" href="list.jsp?page=${page}">목록</a>	<!-- 현재 페이지 번호 전달 - 순서 3 -->
		</div>
		<script type="text/javascript">
      		function execute(f){
         		let url
         		let message
        		if(f===1){         //아래 url 변수와 같이 조건삼항연산자로 변경가능
            		message='글 수정하시겠습니까?'
         		} else if(f===2) {
            		message='글 삭제하시겠습니까?'
         		}
         		
         		const yn = confirm(message)
        		if(yn) {
            		//설명 작성 : 
            		url = (f===1)? 'update.jsp?idx='+${vo.idx} :(f===2)? 'delete.jsp?idx='+${vo.idx}:'#';
            		location.href=url+'&page='+${page};  /* 현재페이지 번호 전달 - 순서3) */
         		} else {
            		alert('취소합니다.')
         		}   
      		}
   		</script>
   		<hr>
   </div>	<!-- 메인글 출력 끝 -->
</main>
   
   <!--댓글 목록 시작 -->
		
		
	
	
	
</body>
</html>
