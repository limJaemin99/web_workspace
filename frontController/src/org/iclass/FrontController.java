package org.iclass;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/*  MVC 패턴 : model(데이터) - view(jsp) - controller(요청처리하는 서블릿)   
 *  spring 프레임워크은 mvc 패턴이 잘 구현된 프레임워크
 */ 

@WebServlet(urlPatterns = {"/"})  // 모든 요청을 받아 처리하는 서블릿 (프론트 컨트롤러 구현)
public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@Override   //init() 메소드는 서블릿이 컨테이너에서 실행되기 시작할때 호출
	public void init() throws ServletException {
		RequestControllerMapping.init();   //매핑 초기화 메소드 호출
	}

	@Override
	protected void service(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();		//RequestMap 객체의 필드
		String method = request.getMethod();		//RequestMap 객체의 필드
		
		RequestMap key = new RequestMap(url, method);
		//위의 key 를 이용해서 처리할 controller 를 가져오기
		Controller controller 
		= RequestControllerMapping.getController(key);
		if(controller !=null) {
			logger.info(":::::::::::{}-{}:::::::::",key,controller.getClass());
			//handle 메소드 실행으로 요청 처리
			controller.handle(request, response);
		}else {
			logger.info("::::::::{} 잘못된 요청입니다. :::::::",key);
			
		// 응답으로 보낼 출력 내용.(sendRedirect 와 동일한 동작: location.href) - 출력 객체를 이용하여 document 내용 만듭니다. 			
		// servlet_intro 프로젝트 MemberJoinServlet.java
		// 1) 브라우저 document(문서)에 출력 - 2) document.write()
		// response.getWriter().append("Served at: ").append(request.getContextPath());
			response.setCharacterEncoding("UTF-8");		//응답헤더 설정 : 인코딩, 응답의 내용물 타입
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();  //1) 생성
			out.print("<script>");		//2)출력
			out.print("alert('요청 url,method 와 일치하는 Controller 가 없습니다.');");
			out.print("location.href='/frontController/'");   //url 이동 *)브라우저에서 실행
			out.print("</script>");
		//response.sendRedirect("./");    //상대경로 오류 발생 가능성 있습니다			
		//response.sendRedirect(request.getContextPath());  //*)서버가 클라이언트에게 새로운 url 요청을 보내도록 강제적 동작
		}
	}
}
