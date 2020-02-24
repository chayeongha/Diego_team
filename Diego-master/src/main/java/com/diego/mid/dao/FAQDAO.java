package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.board.FAQCategoryVO;
import com.diego.mid.model.board.FAQVO;
import com.diego.mid.util.Pager;

@Repository
public class FAQDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "faqMapper.";
	
	//List
	public List<FAQVO> faqList(Pager pager) throws Exception{
		return session.selectList(NAMESPACE+"faqList", pager);
	}
	
	//selectOne
	public FAQVO faqSelect(FAQVO faqvo) throws Exception{
		
		return session.selectOne(NAMESPACE+"faqSelect", faqvo);
	}
	//write
	public int faqWrite(FAQVO faqvo) throws Exception{
		return session.insert(NAMESPACE+"faqWrite", faqvo);
	}
	
	//update
	public int faqUpdate(FAQVO faqvo)throws Exception{
		return session.update(NAMESPACE+"faqUpdate", faqvo);
	}
	//Delete
	public int faqDelete(FAQVO faqvo)throws Exception{
		return session.delete(NAMESPACE+"faqDelete", faqvo);
	}
	//count
	public int faqCount(Pager pager)throws Exception{
		return session.selectOne(NAMESPACE+"faqCount", pager);
	}
	
	//category List
	public List<FAQCategoryVO> category() throws Exception{
		return session.selectList(NAMESPACE+"category");
	}
	
	//category Select
	public FAQCategoryVO categorySelect(FAQCategoryVO faqCategoryVO)throws Exception{
		return session.selectOne(NAMESPACE+"categorySelect", faqCategoryVO);
	}
}
