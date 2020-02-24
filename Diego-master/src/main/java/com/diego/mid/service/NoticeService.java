package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.NoticeDAO;
import com.diego.mid.model.board.NoticeVO;
import com.diego.mid.util.Pager;

@Service
public class NoticeService {
	@Inject
	private NoticeDAO noticeDAO;
	//noticeList
	public List<NoticeVO> noticeList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(noticeDAO.noticeCount(pager));
		return noticeDAO.noticeList(pager);
	}
	
	//SelectOne
	public NoticeVO noticeSelect(NoticeVO noticeVO)throws Exception{
		return noticeDAO.noticeSelect(noticeVO);
	}
	
	//Write
	public int noticeWrite(NoticeVO noticeVO)throws Exception{
		int result = noticeDAO.noticeWrite(noticeVO);
		
		return result;
	}
	
	//update
	public int noticeUpdate(NoticeVO noticeVO)throws Exception{
		
		return noticeDAO.noticeUpdate(noticeVO);
	}
	
	//Delete
	public int noticeDelete(NoticeVO noticeVO)throws Exception{
		return noticeDAO.noticeDelete(noticeVO);
	}
	

}
