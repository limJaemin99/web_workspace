package org.iclass.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면 출력을 위해 Request, response 를 login.jsp에 전달하기
		//forward를 할수 있는 객체를 생성하기
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");	//jsp 파일
		//요청, 응답 객체를 전달하기
		dispatcher.forward(request, response);
	}

}
