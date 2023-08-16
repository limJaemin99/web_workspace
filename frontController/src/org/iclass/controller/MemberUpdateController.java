package org.iclass.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateController implements Controller{
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String custno = request.getParameter("custno");		//파라미터 받기
		
		request.setAttribute("custno", custno);			//jsp 에 출력(전달)
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/update.jsp");
		dispatcher.forward(request, response);
		
	}
}
