<%@page import="sample.DTO.JCustomerDTO"%>
<%@page import="sample.DAO.JCustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>18loginAction.jsp</title>
</head>
<body>
	<% 
		//id 와 password 를 전달 받아서 DAO login 메소드 실행
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		JCustomerDAO dao = new JCustomerDAO();
		JCustomerDTO customer = dao.login(userID, userPW);
		
		
		
		
		if(customer != null) {	//request 는 forward 할 때 사용 ★★★★★★★★★★
			session.setAttribute("user", customer);
		}
		
		
		
		
		out.print("<script>");	//alert() 을 사용하기 위해 script 태그 사용
		
			if(customer != null) {
				out.print("alert('로그인 성공!');");
				out.print("location.href='index.jsp';");
			} else {
				out.print("alert('로그인 실패! \\n- 계정 정보가 올바르지 않습니다.');");
				//alert 안에서 줄바꿈은 html 문서 안에서 실행되어야 하므로 \\n 을 사용해야 한다.
				//만약 \n 을 사용한다면, 자바에서 처리할 수가 없어서 그대로 출력된다.
				//★★★★★ \n ▶ X , \\n ▶ O
				out.print("location.href='17loginView.jsp'");
			}
		
		out.print("</script>");
	%>
	
	
	
	
</body>
</html>