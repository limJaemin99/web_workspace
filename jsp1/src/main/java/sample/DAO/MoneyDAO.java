package sample.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.DTO.MoneyDTO;


public class MoneyDAO {
	
	//싱글톤 작성 (day06, 06-19) ------------------------------------------
	private static MoneyDAO dao = new MoneyDAO();
	private MoneyDAO() {}
	public static MoneyDAO getMoneyDAO() {
		return dao;
	}
	
			//메인메소드에서 싱글톤을 이용한 객체 가져오기 (day06, 06-19)---------
			//Check_SalesDAO cDao = Check_SalesDAO.getCheck_SalesDAO();
			//----------------------------------------------------------
	//------------------------------------------------------------------
	
	
	   public List<MoneyDTO> moneyAll() throws SQLException {
		      Connection conn = OracleUtility.getConnection();
		      String sql = "SELECT mt.custno,custname,"
		      			+ "	decode(grade,'A','VIP','B','일반','C','직원') agrade,psum \r\n"
						+ "FROM MEMBER_TBL_02 mt\r\n"
						+ "JOIN  \r\n"
						+ "(	 \r\n"
						+ "	SELECT custno , sum(price) psum     \r\n"
						+ "	FROM MONEY_TBL_02 \r\n"
						+ "	GROUP BY custno\r\n"
						+ ") sale  \r\n"
						+ "ON mt.custno = sale.custno\r\n"
						+ "ORDER BY psum desc";
		      PreparedStatement ps = conn.prepareStatement(sql);
		      
		      List<MoneyDTO> result = new ArrayList<>();
		      ResultSet rs = ps.executeQuery();
		      while(rs.next()) {
		         MoneyDTO total = new MoneyDTO(rs.getInt(1), 
		                              rs.getString(2), 
		                              rs.getString(3), 
		                              rs.getInt(4));
		         result.add(total);
		      }
		      return result;
		   }
	
}//class end
