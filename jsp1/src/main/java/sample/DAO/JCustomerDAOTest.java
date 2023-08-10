package sample.DAO;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import sample.DTO.JCustomerDTO;

class JCustomerDAOTest {

	@Test
	void daotest() {
		JCustomerDAO dao = new JCustomerDAO();
		assertNotNull(dao);
	}
	
	@Test
	void selectByID() {
		JCustomerDAO dao = new JCustomerDAO();
		try {
			JCustomerDTO dto = dao.selectByID("mina012");
			assertNotNull(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	void login() {
		JCustomerDAO dao = new JCustomerDAO();
		JCustomerDTO dto;
		try {
			dto = dao.login("mina012", "1111");
			assertNotNull(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
