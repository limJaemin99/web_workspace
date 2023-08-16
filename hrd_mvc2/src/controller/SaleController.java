package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.SaleDao;
import vo.SaleVo;

public class SaleController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleDao dao = SaleDao.getSaleDao();
		List<SaleVo> list = new ArrayList<>();
		
		try {
			list = dao.salesTotal();
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("saleView.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
}
