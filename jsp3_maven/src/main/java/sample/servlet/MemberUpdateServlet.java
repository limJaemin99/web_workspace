package sample.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ★★★★★ 그냥 실행하면 404 오류 발생. ↓아래 주소로 실행해야 정상 실행↓ ★★★★★
 * URL 을 주소창에 http://localhost:8082/jsp3_maven/member/update.do 입력 후 엔터를 치면 실행되는 자바 서블릿
 * ● URL 매핑
 * 		- [방법 1] 어노테이션 사용
 * 		- [방법 2] web.xml 에서 servlet 태그로 설정
 * 		
 */
@WebServlet("/member/update.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberUpdateServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
		
	}
    
    //service() 메소드가 구현한 내용이 실행되면(override 메소드로 정의되어 있으면) doGet() 또는 doPost() 는 실행되지 않는다.
    	//▶ 따라서 이 파일에서는 service 를 삭제했다.
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
