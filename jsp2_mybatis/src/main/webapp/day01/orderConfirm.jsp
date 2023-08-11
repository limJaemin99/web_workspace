<%@page import="sample.DAO.OrderDAO"%>
<%@page import="sample.DTO.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderConfirm.jsp</title>
</head>
<body>
	<h3>주문 확인</h3>
	<hr>
	<jsp:useBean id="order" class="sample.DTO.OrderDTO" />
	<jsp:setProperty property="*" name="order"/>
	<ul>
		<li>고객 이메일 : <jsp:getProperty property="email" name="order"/></li>
		<li>상품 코드 : <jsp:getProperty property="pcode" name="order"/></li>
		<li>주문 수량 : <jsp:getProperty property="quantity" name="order"/></li>
	</ul>
	<hr>
	<button onclick="location.href='orderForm.jsp'">추가 주문</button>
	<% 
		OrderDAO dao = OrderDAO.getOrderDAO();
		if(dao.insert(order)==1) {
	%>
	<script type="text/javascript">
		alert('주문이 완료되었습니다.')
	</script>
	<% 
		}
	%>
	
	<!-- 문제4 . 자바빈즈의 프로퍼티를 설정하고 가져오는 실행을 위해 (4) ? 에 공통으로 들어갈 코드를 작성하세요. -->
		<!-- ▶ 답4 . name="order" -->
	<!-- 문제5 . 추가 주문 버튼 클릭시 <<화면1>> 로 가기 위한 (5) ? 코드를 작성하세요. -->
		<!-- ▶ 답5 . location.href='orderForm.jsp' -->
		
</body>
</html>