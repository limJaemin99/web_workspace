package mybatis;

import static org.junit.jupiter.api.Assertions.*;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dao.communityDAO;
import org.iclass.dto.Community;
import org.junit.jupiter.api.Test;

class SqlSessionTest {
	
	@Test
	void connect() {
		SqlSession sqlsession = SqlSessionBean.getSession();
		assertNotNull(sqlsession);
	}
	
	@Test
	void write() {
		communityDAO dao = communityDAO.getCommunityDAO();
		long idx = dao.insert(Community.builder()
				.title("테스트")
				.writer("twice")
				.content("테스트 글 입니다.")
				.build());
		System.out.println("idx = "+idx);
		assertNotEquals(0, idx);
	}
}
