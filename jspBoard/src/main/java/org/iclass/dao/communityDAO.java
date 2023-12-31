package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.Community;

import mybatis.SqlSessionBean;

public class communityDAO {
	private static communityDAO dao = new communityDAO();
	private communityDAO() {}
	public static communityDAO getCommunityDAO() {
		return dao;
	}
	
	
	public List<Community> list() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("community.list");
		mapper.close();
		
		return list;
	}
	
	public List<Community> pagelist(Map<String, Integer> map) {
	    SqlSession mapper = SqlSessionBean.getSession();
	    List<Community> list = mapper.selectList("community.pagelist", map);
	    mapper.close();

	    return list;
	}
	
	
	public int count() {
		SqlSession mapper = SqlSessionBean.getSession();
		int count = mapper.selectOne("community.count");
		mapper.close();
		
		return count;
	}
	
	public Community selectByIdx(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		Community community = mapper.selectOne("community.selectByIdx",idx);
		mapper.close();
		
		return community;
	}
	
	public int setReadCount(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int count = mapper.update("community.setReadCount",idx);
		mapper.commit();
		mapper.close();
		
		return count;
	}
	
	public int update(Community community) {
		SqlSession mapper = SqlSessionBean.getSession();
		int count = mapper.update("community.update",community);
		mapper.commit();
		mapper.close();
		
		return count;
	}
	
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int count = mapper.delete("community.delete",idx);
		mapper.commit();
		mapper.close();
		
		return count;
	}
	
	public long insert(Community vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.insert("community.insert",vo);
		mapper.commit();	//insert,update,delete 는 commit 필수 ★★★★★
		mapper.close();
		
		//매퍼 xml 에서 selectKey 로 시퀀스 값을 vo 객체 idx 프로퍼티에 저장시켰다.
		return vo.getIdx();
	}
	
}
