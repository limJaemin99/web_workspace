<%@page import="sample.DAO.MemberDAO"%>
<%@page import="sample.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//메소드 방식이 post일 경우 인코딩이 꼭 필요하다.
	request.setCharacterEncoding("UTF-8");
	
	int custno = Integer.parseInt(request.getParameter("custno"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	MemberDTO dto = new MemberDTO(custno,name,phone,address,null,grade,city);
	MemberDAO dao = MemberDAO.getMemberDAO();
	dao.updateMember(dto);
	
	//<script>태그를 사용하지 않고 alert 사용하는 방법
	/* out.print("<script>");
	out.print("alert('회원 정보 수정이 완료되었습니다.');");
	out.print("location.href='MemberList.jsp';");
	out.print("</script>"); */
%>

<script type="text/javascript">
	alert('수정되었습니다!')
	window.location.href = 'MemberList.jsp'		//window 는 생략이 가능하다
</script>

