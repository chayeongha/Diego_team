package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.board.NoticeVO;
import com.diego.mid.util.Pager;
@Repository
public class NoticeDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "noticeMapper.";
	
	//List
	public List<NoticeVO> noticeList(Pager pager)throws Exception{
		
		return session.selectList(NAMESPACE+"noticeList", pager);
	}
	
	//selectOne
	public NoticeVO noticeSelect(NoticeVO noticeVO) throws Exception{
		return session.selectOne(NAMESPACE+"noticeSelect", noticeVO);
	}
	
	//write
	public int noticeWrite(NoticeVO noticeVO)throws Exception{
		
		return session.insert(NAMESPACE+"noticeWrite", noticeVO);
	}
	
	//Delete
	public int noticeDelete(NoticeVO noticeVO)throws Exception{
		return session.delete(NAMESPACE+"noticeDelete", noticeVO);
	}
	
	//update
	public int noticeUpdate(NoticeVO noticeVO)throws Exception {
		return session.update(NAMESPACE+"noticeUpdate", noticeVO);
	}
	
	//count
	public int noticeCount(Pager pager)throws Exception{
		return session.selectOne(NAMESPACE+"noticeCount", pager);
	}
}
