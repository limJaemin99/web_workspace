<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리 북카페</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/read.css?v=3">
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
						<pre><c:out value="${vo.content}" /></pre>
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

	<hr>	<!--댓글 목록 시작 -->
	<!-- 댓글 등록/삭제를 위한 form.(댓글 수정은 구현 안한다) -->
	<form action="commentAction.jsp" method="post">
	<!-- 필요한 파라미터. 화면에는 표시 안함 -->
	<input type="hidden" name="mref" value="${vo.idx}">	<!-- 댓글 추가 할 메인글의 idx(댓글 테이블 mref / 고정값) -->
	<input type="hidden" name="idx" value="0">	<!-- 삭제할 댓글의 idx(고정값X)는 executeCmt 함수에서 설정 -->
	<input type="hidden" name="f" value="0">	<!-- value 가 1이면 등록, 2면 삭제 -->
	<input type="hidden" name="page" value="${page}">	<!-- 현재 페이지 번호 전달 -순서8) -->
	<ul>
		<li>
			<ul class="row">
				<li>작성자</li>
				<li><input name="writer" class="input" value="${user.id}" readonly></li>
			</ul>
		</li>
		<li>
			<ul style="display: flex;">
				<li>
					<textarea rows="5" cols="80" name="content"
						style="resize: none; margin-right: 20px;"
						placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
				</li>
				<li style="align-self: center; margin-bottom: 20px;">
					<c:if test="${sessionScope.user != null}">
						<button type="button" onclick="executeCmt(1,0)">저장</button>
							<!-- 2번째 인자는 댓글 등록에서는 필요없음. 아무값 0 -->
					</c:if>
					<c:if test="${sessionScope.user == null }">
						<button type="button" onclick="location.href='../login.jsp'">로그인</button>
					</c:if>
				</li>
			</ul>
		</li>
		<li>
			<span>댓글</span>
			<span>[<c:out value="${vo.commentCount}"/>]</span>	<!-- 댓글 갯수 -->
			<hr>
		</li>
		<!-- 댓글 목록 : cmtlist 애트리뷰트 필요 -->
		<c:forEach var="cmt" items="${cmtlist}">
			<li>
				<ul class="crow">
					<li><c:out value="${cmt.writer}"/></li>
					<li><c:out value="${cmt.ip}"/></li>
					<li><c:out value="${cmt.createdAt}"/></li>
				<!-- session 에 저장된 user 애트리뷰트의 id 와 작성자의 id 가 같으면 삭제 버튼 보이기 -->
				<c:if test="${user.id == cmt.writer}">
					<li><a href="javascript:executeCmt(2,'${cmt.idx}')">삭제</a></li>
							<!-- 함수의 2번째 인자는 삭제할 댓글의 idx -->
				</c:if>
				</ul>
			</li>
			<li>
				<pre class="cmtcontent"><c:out value="${cmt.content}" /></pre>
			</li>
		</c:forEach>
	</ul>
	</form>
   	<hr>
   </div>	<!-- 메인글 출력 끝 -->
   <script type="text/javascript">
   		function executeCmt(fval,cidx) {	//첫번째는 등록 or 삭제 기능	//두번째는 삭제할 댓글 idx
   			const frm = document.forms[0]
   			if(fval === 1) {	//댓글 등록. (== ▶ 값만 검사 | === ▶ 타입까지 검사)	//'1' == 1 (참) | '1' === 1 (거짓/타입체크)
   				if(frm.content.value == '') {
   					alert('글 내용은 필수 입력입니다.')
   					frm.content.focus()
   					return
   				} else {
   					frm.f.value = fval
   					frm.submit()	//댓글 저장
   				}
   			}
   			
   			if(fval === 2) {
   				frm.idx.value = cidx
   				frm.f.value = fval
   				frm.submit()
   			}
   				
		}
   </script>
</main>
</body>
</html>
