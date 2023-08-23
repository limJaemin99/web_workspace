package org.iclass.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.dto.BookUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//"*.jsp" 와 같은 URL 형식인 모든 요청에 대해 처리될 필터 ▶ 목적 : session 검사
@SuppressWarnings("serial")
@WebFilter(urlPatterns = {"*.jsp"})
public class SessionFilter extends HttpFilter implements Filter {
	
	//필터 동작을 확인하기 위한 로그 남기기 : getLogger 메소드의 인자는 클래스를 전달
	private static final Logger logger = LoggerFactory.getLogger(SessionFilter.class);
	
	
	//필터 동작을 정의할 메소드
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		//메소드의 인자로 전달된 것이 HttpXXXX 의 부모 인터페이스이므로 캐스팅이 필요
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		//getContextPath() 는 /jspBoard 를 리턴
		//getServletPath() 는 contextPath 뒤에 나오는 URL 요청 주소
		logger.info("::::: 요청 전 Session Filter : {}" , request.getServletPath());
		
		//로그인이 되었을 경우 접근 불가(X) , 로그인이 안된 상태인 경우 접근(O) 되는 URL 경로
			//예시 : 로그인 , 회원가입
		List<String> nosessions = List.of("/login.jsp","/member/join.jsp");
							//▲ servletPath() 로 가져오면 '/' 가 맨 앞에 추가되기 때문에 '/'를 붙였음
		
		HttpSession session = request.getSession();
		BookUser user = (BookUser) session.getAttribute("user");
		
		if(nosessions.contains(request.getServletPath()) && user != null) {
			//요청 경로가 nosessions 중에 하나이고, 로그인이 되었다면(user != null) 접근 불가(X)
			//contextPath() 로 강제 리다이렉트
			response.sendRedirect(request.getContextPath());
			return;	//실행 종료
		}
		
		//로그인이 필수인 요청 경로
		List<String> logins = List.of("/community/write.jsp","/community/writeAction.jsp",
										"/community/update.jsp","/community/updateAction.jsp",
										"/logout.jsp");
		
		if(logins.contains(request.getServletPath()) && user == null) {
			//요청 경로가 logins 중에 하나이고, 로그인 되지 않았다면(user == null) 접근 불가(X)
			//contextPath() 로 강제 리다이렉트
			response.sendRedirect(request.getContextPath());
			return;	//실행 종료
		}
		
		//post 방식 요청에 대한 확인(로그인은 했지만)
			//[예시] http://localhost:8082/jspBoard/updateAction.jsp?idx=742&content=ㅋㅋㅋ&title=asd&page=1 ▶ 링크가 실행되지 않도록 함
		List<String> posts = List.of("/community/writeAction.jsp","/community/updateAction.jsp");
		
		//하나씩 정의하기 번거롭다면
		if (request.getServletPath().contains("Action.jsp") && request.getMethod().equals("GET")) {
			response.sendRedirect("error.jsp");	//리다이렉트를 오류 페이지로 하기
			return;
		}
		
		//다음 필터가 있으면 요청(또는 응답)을 전달하고 없으면 요청(또는 응답)한다.
		chain.doFilter(request, response);
	}

}
