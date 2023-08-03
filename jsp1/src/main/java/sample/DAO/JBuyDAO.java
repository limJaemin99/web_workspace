package sample.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.DTO.JBuyDTO;
import sample.DTO.JCustomerDTO;
import sample.DTO.JProductDTO;
import sample.DTO.MyPageBuyDTO;



//DAO : JCustomerDAO , JProductDAO
public class JBuyDAO {	// 구매와 관련된 CRUD 실행 SQL
	// 메소드 이름은 insert , update , delete , select , selectByPname 등등으로 이름을 작성하세요. 
	
	
	//5. 상품 구매(결제)하기 - 장바구니의 데이터를 '구매' 테이블에 입력하기 (여러개 데이터를 INSERT)
	public void buyProduct(JCustomerDTO loginCS,List<JProductDTO> buyCart, List<Integer> productCount) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		
//		String sql = "INSERT INTO J_buy(buy_seq,customid,pcode, quantity,buy_date) VALUES(jbuy_seq , ? , ? , ?)"; 
//		String sql = "INSERT INTO J_buy (buy_seq,customid,pcode, quantity,buy_date) "
//				+ "SELECT Jbuy_seq,?,?,count(*) AS quantity ,? "
//				+ "FROM J_buy "
//				+ "GROUP BY ?";
		String sql = "INSERT INTO J_buy VALUES (Jbuy_seq.nextval , ? , ? , ? , sysdate)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		for (JProductDTO cartList : buyCart) {
//			int quantity = Collections.frequency(buyCart, cartList);
			ps.setString(1, loginCS.getCustomer_ID());
			ps.setString(2, cartList.getPCode());
			for (int i = 0; i < productCount.size(); i++) {
				ps.setInt(3, productCount.get(i));
			}
			
			ps.execute();
		}
		
		
		ps.close();
		conn.close();
		
	}//buyProduct end	
	
	
	public void credit(List<JBuyDTO> cart) {
		Connection conn = OracleUtility.getConnection();
		
		String sql = "insert into J_buy values (Jbuy_seq.nextval , ? , ? , ? , sysdate)";
		
		PreparedStatement ps = null;
		try {
		
		conn.setAutoCommit(false);
		
		ps = conn.prepareStatement(sql);
		
			for (JBuyDTO bDto : cart) {
				ps.setString(1, bDto.getCustomID());
				ps.setString(2, bDto.getPCode());
				ps.setInt(3, bDto.getQuantity());
			
				ps.execute();
			}
			conn.commit();
			conn.setAutoCommit(true);
			ps.close();
			conn.close();
		} catch(SQLException e) {
			System.out.println("장바구니 상품 구매하기 예외 : " + e.getMessage());
			System.out.println("장바구니 상품 구매를 취소합니다.");
			try {
				conn.rollback();
			} catch (SQLException e2) {
				System.out.println("예외 : "+e.getMessage());
			}
			
		}
		
	}//credit end
	
	
	public int history(String customer_ID) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		
		String sql = "select pname, quantity, price, quantity*price total, buy_date\n"
				+ "from j_buy b join j_product p on p.pcode = b.pcode and b.customid = ?\n"
				+ "order by buy_date desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, customer_ID);
		ps.execute();
		
		ResultSet rs = ps.executeQuery();
		
		int count = 0;
		
		while(rs.next()) {
			System.out.println(String.format("▶ 상품명 : %-10s\t┃\t수량 : %-5d\t┃\t가격 : %-10d원\t┃\t가격 총합 : %-10d원\t┃\t구매일자 : %s\t┃"
					, rs.getString(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5)));
			count++;
		}
		
		return count;
	}


	public int insertMany(JBuyDTO buy) {
		return 1;
	}//JBuyDAOTest 를 위해 만든 메소드


	public JBuyDTO selectOne(int buy_seq) throws SQLException {
		//sql 실행을 구현하고 테스트 케이스 확인하기
		Connection conn = OracleUtility.getConnection();
		String sql = "select * from J_buy where buy_seq = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, buy_seq);
		ps.execute();
		
		ResultSet rs = ps.executeQuery();
		
//		JBuyDTO dto = new JBuyDTO();	//기본생성자로 생성시 null값이 안나옴
		JBuyDTO dto = null;
		
		if(rs.next()) dto = new JBuyDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5));
		
		conn.close();
		ps.close();
		rs.close();
		
		return dto;
	}

//  select * from mypage_buy where customid='twice';
  public List<MyPageBuyDTO> MyPageBuyDTO(String customid) throws SQLException{
     Connection conn = OracleUtility.getConnection();
       String sql = "select * from mypage_buy where customid= ?"; 
       PreparedStatement ps = conn.prepareStatement(sql);
       ps.setString(1, customid);
       ResultSet rs = ps.executeQuery();
       
       List<MyPageBuyDTO> list = new ArrayList<>();
       while(rs.next()) {
          list.add(new MyPageBuyDTO(rs.getDate(1), 
                rs.getString(2), 
                rs.getString(3), 
                rs.getString(4), 
                rs.getInt(5), 
                rs.getInt(6),
                rs.getLong(7)));
       }
       return list;
  }
//  select sum(total) from mypage_buy where customid='twice';
  public long myMoney(String customid) throws SQLException {
     Connection conn = OracleUtility.getConnection();
     String sql = "select sum(total) from mypage_buy where customid= ?"; 
     //함수 조회하는 select는 항상 결과행이 1개, 컬럼도 1개
     
     PreparedStatement ps = conn.prepareStatement(sql);
     ps.setString(1, customid);
     ResultSet rs = ps.executeQuery();
     
     rs.next();
     long sum = rs.getLong(1);
     
     return sum;
  }
	
	
	
}//class end
