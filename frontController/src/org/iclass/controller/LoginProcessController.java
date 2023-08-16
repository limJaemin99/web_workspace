package org.iclass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginProcessController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(LoginProcessController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String message;
		if(password.equals("admin"))
			message ="패스워드 일치합니다.";
		else
			message ="패스워드 불일치 입니다.";
		logger.info(":::::::: id:{}-{} ::::::::",id,message);
		
		//redirect. ▶ alert 띄우지 않고 응답을 바로 새로운 URL / Index 로 보냅니다.
		response.sendRedirect("./index");
	}

}
