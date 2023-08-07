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
%>

<script type="text/javascript">
	alert('수정되었습니다!')
	window.location.href = 'memberList.jsp'
</script>