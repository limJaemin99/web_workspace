package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.MemberDao;
import vo.MemberVo;

public class UpdateActionController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int custno = 0;
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String grade = request.getParameter("grade");
		
		MemberDao dao = MemberDao.getMemberDao();
		MemberVo vo = null;
		int result = 0;
		
		try {
			custno = Integer.parseInt(request.getParameter("custno"));
			vo = new MemberVo(custno, null, phone, address, null, grade, city);
			result = dao.update(vo);
		} catch (SQLException | NumberFormatException e) {
			logger.error(e.getMessage());
		}
		
		//response 에 출력할 객체 생성
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		request.setAttribute("result", result);
		
		out.print("<script>");
			if(result == 1) {
				out.print("alert('회원 수정을 완료했습니다.');");
			} else {
				out.print("alert('회원 수정에 문제가 발생했습니다.');");
			}
			out.print("location.href='list.hrd'");
		out.print("</script>");
		
	}
	
}
