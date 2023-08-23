package org.iclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.CommunityComments;
import org.iclass.filter.SessionFilter;

import mybatis.SqlSessionBean;

public class communityCommentsDAO {
	private static communityCommentsDAO dao = new communityCommentsDAO();
	private communityCommentsDAO() {}
	public static communityCommentsDAO getCommunityCommentsDAO() {
		return dao;
	}
	
	
	public int insert(CommunityComments communityComments) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("communityComments.insert",communityComments);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	public int delete(int idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("communityComments.delete",idx);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	public int maxOf() {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("communityComments.maxOf");
		mapper.close();
		
		return result;
	}
	
	public List<CommunityComments> commentsList(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<CommunityComments> list = mapper.selectList("commentsList",idx);
		mapper.close();
		
		return list;
	}
	
	public int setCommentCount(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("setCommentCount",idx);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
}
