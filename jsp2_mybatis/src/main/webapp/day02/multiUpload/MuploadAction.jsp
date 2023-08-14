<%@page import="java.util.Enumeration"%>
<%@page import="sample.DAO.ProductDAO"%>
<%@page import="sample.DTO.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>처리기능</title>
</head>
<body>
<!-- 처리기능 -->
<%
	String path = "d:\\iclass0419\\upload";
	int size = 10*1024*1024;
	
	MultipartRequest multiRequest = new MultipartRequest(
				request,
				path,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()	
			);	
	
	String pname = multiRequest.getParameter("pname");
	String price = multiRequest.getParameter("price");
	//▶ 전달받은 파일이 여러개이다. 파일명을 , 로 구분/나열해서 DB 컬럼에 저장하기 ◀
	//▶ picture 컬럼의 길이가 200 이므로, 최종 문자열이 200 이하고 테스트하기 ◀
	//▶ Enumeration 으로 반복 시키기(iterator 와 비슷한 동작) ◀
	StringBuilder picture = new StringBuilder();
	
	//input 태그의 type="file" 요소를 모두 가져와 ens 로 참조시킨다.
	Enumeration enums = multiRequest.getFileNames();
	
	while(enums.hasMoreElements()) { //가져올 다음 요소가 있다면
		
		//iterator(반복자) 처럼 하나씩 가져오기. 리턴은 요소의 name 속성값
		String input = (String)enums.nextElement();
	
		//해당 속성값의 파일을 업로드. 문자열에 추가
		picture.append(multiRequest.getFilesystemName(input)).append(",");
		
		//테스트. script 태그 주석처리하고 확인
		out.print(picture.toString());
		out.print("<br>");
	}

	
	
	//여기까지 실행된 결과 확인
	out.print(pname);
	out.print("<br>");
	
	out.print(price);
	out.print("<br>");
	
	out.print(picture);
	out.print("<br>");
	
	ProductDTO dto = new ProductDTO(pname,Integer.parseInt(price),null,picture.toString());
	ProductDAO dao = ProductDAO.getProductDAO();						//▲ StringBuilder 를 String 으로 변환
	int result = dao.insert(dto);
%>

	<script type="text/javascript">
		alert('상품 등록이 완료되었습니다.')
		location.href='MproductListAction.jsp'
	</script>

</body>
</html>