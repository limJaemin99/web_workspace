package org.iclass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	//개발자가 정의한 메소드 - doGet, doPost 와 동일한 형식으로 정의
	void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException ;
}
