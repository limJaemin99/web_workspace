package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ★★★★★ 그냥 실행하면 404 오류 발생. ↓아래 주소로 실행해야 정상 실행↓ ★★★★★
 * URL 을 주소창에 http://localhost:8082/jsp3_maven/member/list.do 입력 후 엔터를 치면 실행되는 자바 서블릿
 * ● URL 매핑
 * 		- [방법 1] 어노테이션 사용
 * 		- [방법 2] web.xml 에서 servlet 태그로 설정
 * 		
 */
@WebServlet("/member/list.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		
	}
	
	//service() 가 재정의 메소드로 보이면 doGet() 또는 doPost() 는 실행되지 않는다.
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().print("I am service method!");
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//html 문서는 http 응답으로 전달되므로 출력 스트림은 response 객체로 생성
		PrintWriter out = response.getWriter();	//html 로 보낼 출력 스트림 객체 생성
		out.append("Served at: ").append(request.getContextPath())
			.append("<br>")	//html 태그 안에 있을때만 동작한다 ★
			.append(request.getRequestURL())
			.append("<br>")	//html 태그 안에 있을때만 동작한다 ★
			.append(request.getCharacterEncoding());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
