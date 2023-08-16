package org.iclass.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListController implements Controller{
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("hello", "안녕~!!반가워~~^^");
		
		//jsp 에서 pageContext.forward("/member/list.jsp") 와 동일함.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/list.jsp");
		dispatcher.forward(request, response);
	}
}
