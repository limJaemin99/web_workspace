<%@page import="sample.DTO.OrderDTO"%>
<%@page import="sample.DAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderResult.jsp</title>
</head>
<body>
	<h3>주문 확인</h3>
	<hr>
	<%-- <jsp:useBean id="order" class="sample.DTO.OrderDTO"/>
	<% 
		String email = request.getParameter("email");
		String pcode = request.getParameter("pcode");
		String quantity = request.getParameter("quantity");
		
		OrderDAO dao = OrderDAO.getOrderDAO();
		
		if(quantity != null) {
			OrderDTO dto = new OrderDTO(email,pcode,Integer.parseInt(quantity),null);
			dao.insert(dto);
			
			//order 자바빈에 값 대입
			order.setEmail(email);
			order.setPcode(pcode);
			order.setQuantity(Integer.parseInt(quantity));
		}
	%> --%>
	<jsp:useBean id="order" class="sample.DTO.OrderDTO" scope="request" />
	<ul>
		<li>고객 이메일 : ${order.email}</li>
		<li>상품 코드 : ${order.pcode}</li>
		<li>주문 수량 : ${order.quantity}</li>
	</ul>
	<hr>
	<button onclick="location.href='orderForm.jsp'">추가 주문</button>
	<script type="text/javascript">
		alert('주문이 완료되었습니다.')
	</script>
	
	<!-- 문제9 . orderConfirm.jsp를 아래와 같이 2개의 소스파일 `처리`와 `화면출력`으로분리하였습니다.
	orderConfirm.jsp 와 동일하게 실행되기 위해 필요한 코드는 무엇인가요? -->
		<%-- ▶ 답9 . orderConriem2.jsp 의 useBean 에 scope="request" 를 추가하고,
					현재 페이지에서 해당 useBean을 생성한다.
		 --%>
		
	<%-- 문제10. <jsp:forward page="orderResult.jsp"/> 를 설명하세요. --%>
		<%-- ▶ 답10 . 페이지간의 제어를 orderResult.jsp 로 이동시켜줌 --%>
		
	<!-- 문제11. ${order.email} 를 설명하세요. -->
		<!-- ▶ 답11 . order 자바빈의 email 값을 가져옴 -->
</body>
</html>