<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2request.jsp</title>
</head>
<body>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>
		<li>요청 URI : <%= request.getRequestURI() %></li>
		<li>컨텍스트(context) : <%= request.getContextPath() %></li>
		
		<!-- 기준이 서버이므로 remote 멀리 떨어진 것이 클라이언트. -->
		<li>클라이언트 IP : <%= request.getRemoteAddr() %></li>
		<li>클라이언트 host : <%= request.getRemoteHost() %></li>
		<li>클라이언트 port : <%= request.getRemotePort() %></li>
		
		<!-- local 이 서버 -->
		<li>서버 IP : <%= request.getLocalAddr() %></li>
		<li>서버 Domain Name : <%= request.getLocalName() %></li>
		<li>서버 port : <%= request.getLocalPort() %></li>
	</ul>
	
	<hr>
	
	<ul>
		<!-- localhost 는 네트워크에 연결될 수 없는 내 컴퓨터에 대한 IP주소 -->
		<!-- URL : 웹 주소 -->
		<li>요청 URL : http://localhost:8082/jsp1/day01/2request.jsp</li>
		<!-- URI : 동일한 서버와 포트 위치 안에서 자원을 식별하는 부분 -->
		<li>요청 URI : /jsp1/day01/2request.jsp</li>
		<!-- 프로젝트 이름이 컨텍스트로 기본값 설정된 상태 -->
		<!-- context : 맥락, 문맥(프로젝트 이름이라 생각하면 됨) -->
		<li>컨텍스트(context) : /jsp1</li>
		
		<!-- 아래의 IP 형식은 IPv6 -->
		<!-- <li>클라이언트 IP : 0:0:0:0:0:0:0:1</li> -->
		<li>클라이언트 host : 0:0:0:0:0:0:0:1</li>
		<li>클라이언트 port : 64887</li>
		
		<li>서버 IP : 0:0:0:0:0:0:0:1</li>
		<li>서버 Domain Name : 0:0:0:0:0:0:0:1</li>
		<li>서버 port : 8082</li>
		
		<!-- 이클립스에서 IPv4 로 표시되게 설정을 바꾸기 -->
		<!-- [Run] ▶ [Run Configurations] ▶ Tomcat v9.0 Server at localhost
					▶ Arguments ▶ 한줄 띄어쓰기 후 다음 내용 복붙 후 [재시작] -Djava.net.preferIPv4Stack=true -->
	</ul>
	
	<hr>
	<h4>브라우저 주소가 http://192.168.0.235:8082/jsp1/day01/2request.jsp</h4>
	<h5>클라이언트 IP는 192.168.0.145</h5>
	
	<ul>
		<!-- 192.168.0.235 는 사설 IP. [i 강의실] 네트워크에만 연결되는 IP -->
		<li>요청 URL : http://localhost:8082/jsp1/day01/2request.jsp</li>
		<li>요청 URI : /jsp1/day01/2request.jsp</li>
		<li>컨텍스트(context) : /jsp1</li>
		
		<!-- 아래의 IP 형식은 IPv6 -->
		<!-- <li>클라이언트 IP : 0:0:0:0:0:0:0:1</li> -->
		<li>클라이언트 host : 0:0:0:0:0:0:0:1</li>
		<li>클라이언트 port : 64887</li>
		
		<li>서버 IP : 0:0:0:0:0:0:0:1</li>
		<li>서버 Domain Name : 0:0:0:0:0:0:0:1</li>
		<li>서버 port : 8082</li>
		
		<!-- 이클립스에서 IPv4 로 표시되게 설정을 바꾸기 -->
		<!-- [Run] ▶ [Run Configurations] ▶ Tomcat v9.0 Server at localhost
					▶ Arguments ▶ 한줄 띄어쓰기 후 다음 내용 복붙 후 [재시작] -Djava.net.preferIPv4Stack=true -->
	</ul>
</body>
</html>