package org.iclass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MemberSaveController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(MemberSaveController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getParamet("파라미터이름") 만약에 파라미터가 jsp 파일에 없으면 null
		//getParamet("파라미터이름") 만약에 파라미터가 jsp 파일에 있지만 값을 입력안하면 null
		
		
		request.setCharacterEncoding("UTF-8");
		String func = request.getParameter("func");
		
		int age;
		if(request.getParameter("age").equals("")) age=0;
		else age = Integer.parseInt(request.getParameter("age"));
		User user = new User(request.getParameter("id"), 
				request.getParameter("name"),
				age,
				//Integer.parseInt(request.getParameter("age")),   //Exception 발생가능성 : for input string ""
				request.getParameter("address"));
		
		//할일 : dao 메소드 호출해서 user 객체 insert 또는 update
		logger.info("user insert : {}",user);
		if(func.equals("1"))  {
			//insert sql
			logger.info("::::: insert sql 실행합니다. :::::");
		} else if(func.equals("2")) {
			//update sql
			logger.info("::::: update sql 실행합니다. :::::");
		} else {
			logger.info("::::: 잘못된 기능을 요청했습니다. :::::");
			//아무것도 안함.
		}
		
		//리다이렉트
		response.sendRedirect("../");
	}
}
