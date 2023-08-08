<%@page import="sample.DAO.MemberDAO"%>
<%@page import="sample.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>	<!-- ★★★★★ 인코딩을 제일 먼저 해줘야 함 ★★★★★ -->
    <jsp:useBean id="member" class="sample.DTO.MemberDTO" />	<!-- member 는 DTO의 객체명이라 생각하면 됨 -->
    <jsp:setProperty property="*" name="member" />
    <jsp:getProperty property="custno" name="member"/>
    <jsp:getProperty property="custname" name="member"/>
    <jsp:getProperty property="phone" name="member"/>
    <jsp:getProperty property="address" name="member"/>
    <jsp:getProperty property="grade" name="member"/>
    <jsp:getProperty property="city" name="member"/>
    
    <%
    	MemberDAO dao = MemberDAO.getMemberDAO();
    	dao.joinMember(member);
    %>
<%
	//메소드 방식이 post일 경우 인코딩이 꼭 필요하다.
	/* request.setCharacterEncoding("UTF-8");
	
	int custno = Integer.parseInt(request.getParameter("custno"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	
	MemberDTO dto = new MemberDTO(custno,name,phone,address,null,grade,city);
	MemberDAO dao = MemberDAO.getMemberDAO();
	dao.joinMember(dto); */
%>
	

<script type="text/javascript">
	alert('등록되었습니다!')
	window.location.href = 'MemberList.jsp'		//window 는 생략이 가능하다
</script>
