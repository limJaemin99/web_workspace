package sample.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.DTO.OrderDTO;

public class OrderDAO {
	
	private static OrderDAO dao = new OrderDAO();
	private OrderDAO() {}
	public static OrderDAO getOrderDAO() {
		return dao;
	}
	
	
	public List<String> selectOrderByEmail() throws SQLException {
		Connection conn = OracleUtility.getConnection();
		String sql = "SELECT DISTINCT email FROM orders";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<String> list = new ArrayList<>();
		
		while(rs.next()) list.add(rs.getString(1));
		
		conn.close();
		ps.close();
		rs.close();
		
		return list;
	}
	
	
	public int insert(OrderDTO order) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		String sql = "INSERT INTO orders VALUES (? , ? , ? , SYSDATE)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, order.getEmail());
		ps.setString(2, order.getPcode());
		ps.setInt(3, order.getQuantity());
	
		int count = ps.executeUpdate();
		
		conn.close();
		ps.close();
		
		return count;
	}
	
	
	public List<OrderDTO> selectByEmail(String email) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		String sql = "SELECT * FROM orders WHERE email = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		List<OrderDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			list.add(new OrderDTO(rs.getString(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getDate(4)));
		}
		
		conn.close();
		ps.close();
		rs.close();
		
		return list;
	}
	
	
	
	
}
