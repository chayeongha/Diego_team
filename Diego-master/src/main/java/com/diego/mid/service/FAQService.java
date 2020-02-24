package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.FAQDAO;
import com.diego.mid.model.board.FAQCategoryVO;
import com.diego.mid.model.board.FAQVO;
import com.diego.mid.util.Pager;

@Service
public class FAQService {
	@Inject
	private FAQDAO faqdao;
	//FAQ List
	public List<FAQVO> faqList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(faqdao.faqCount(pager));
		return faqdao.faqList(pager);	
	}
	//SelectOne
	public FAQVO faqSelect(FAQVO faqvo)throws Exception{
		return faqdao.faqSelect(faqvo);
	}
	//Write
	public int faqWrite(FAQVO faqvo)throws Exception{
		return faqdao.faqWrite(faqvo);
	}
	//Update
	public int faqUpdate(FAQVO faqvo)throws Exception{
		return faqdao.faqUpdate(faqvo);
	}
	//Delete
	public int faqDelete(FAQVO faqvo) throws Exception{
		return faqdao.faqDelete(faqvo);
	}
	//category List
	public List<FAQCategoryVO> categoy()throws Exception{
		return faqdao.category();
	}
	//category Select
	public FAQCategoryVO categorySelect(FAQCategoryVO faqCategoryVO)throws Exception{
		return  faqdao.categorySelect(faqCategoryVO);
	}
}
