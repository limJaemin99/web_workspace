package sample.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.util.OracleUtility;
import sample.DTO.JCustomerDTO;



public class JCustomerDAO {	// 구매와 관련된 CRUD 실행 SQL
	// 메소드 이름은 insert , update , delete , select , selectByPname 등등으로 이름을 작성하세요. 
	
	
	//1. 회원 로그인 - 간단히 회원아이디를 입력해서 존재하면 로그인 성공
	public JCustomerDTO selectByID(String customid) throws SQLException{
		Connection conn = OracleUtility.getConnection();
		String sql = "select * from j_customer where customer_ID = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, customid);
		
		ResultSet rs = ps.executeQuery();
		JCustomerDTO temp = null;
		if(rs.next()) {
			temp = new JCustomerDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getDate(5));
		} else {
			System.out.println("※ 존재하지 않는 아이디입니다 ※\n");
			//프로그램 종료 메소드
//			System.exit(0);
		}
		
		ps.close();
		conn.close();
		
		return temp;
	}//selectByID end
	
	
	public JCustomerDTO login(String id,String password) throws SQLException {
	      Connection conn = OracleUtility.getConnection();
	      //id 는 customer_id 컬럼값, password 는 password 컬럼값(평문으로 저장됨)
	      String sql = "select customer_id ,name  "
	            + "from j_customer where customer_id =? and password=?";
	      JCustomerDTO result = null;
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ps.setString(1, id);
	      ps.setString(2, password);
	      
	      ResultSet rs = ps.executeQuery();
	      if(rs.next()) {
	         result = JCustomerDTO.builder()
	               .customer_ID(rs.getString(1))
	               .name(rs.getString(2))
	               .build();
	      }
	      
	      conn.close();
	      ps.close();
	      rs.close();
	      
	      return result;      //result 가 null 이 아니면 로그인 성공
	   }
	
	
}//class end
