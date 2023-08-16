package org.iclass.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get 요청 전달된 파라미터를 받음.
		String type= request.getParameter("type");
		String search = request.getParameter("searchtext");
		
		//type과 searchtext를 select SQL 실행해서 List 결과를 받아와서 qna.jsp에 전달합니다.
		//db와 연결될 때에는 type과 searchtext를 select SQL 실행해서 List 결과를 받아와서 qna.jsp 에 전달합니다.
		request.setAttribute("type", type);
		request.setAttribute("search", search);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/shop/qna.jsp");
		dispatcher.forward(request, response);
	}
}
