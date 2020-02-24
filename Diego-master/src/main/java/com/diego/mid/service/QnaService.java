package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.diego.mid.dao.ImagesDAO;
import com.diego.mid.dao.ProductDAO;
import com.diego.mid.dao.QnaDAO;
import com.diego.mid.model.product.ImagesVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.QnaVO;
import com.diego.mid.util.PPager;


@Service
public class QnaService {
	
	@Inject
	private QnaDAO qnaDAO;
	
	@Inject
	private ProductDAO productDAO;
	
	@Inject
	private ImagesDAO imagesDAO;
	
	
	
	//글쓰기
	public int qnaWrite(QnaVO qnaVO)throws Exception {
		
		return qnaDAO.qnaWrite(qnaVO);
	}

	//리스트
	public List<QnaVO> qnaList(PPager pager)throws Exception{
		
		pager.makeRow();
		pager.makePage(qnaDAO.qnaCount(pager));
		
		return qnaDAO.qnaList(pager);
		
	}
	//상품카운트
	public int qnaCount(PPager pager )throws Exception{
		
		return qnaDAO.qnaCount(pager);
	}
	
	
	//selectOne
	public QnaVO qnaSelect(QnaVO qnaVO )throws Exception {
		
	
		return qnaDAO.qnaSelect(qnaVO);
	}
	
	
	//selectProduct
	public ProductVO productSelect(ProductVO productVO)throws Exception{
		
		return productDAO.productSelect(productVO);
	}
	
	//selectImages
	public ImagesVO imagesSelect(ImagesVO imagesVO)throws Exception{
		
		return imagesDAO.imagesSelect(imagesVO);
	}
	
	//delete
	public int qnaDelete(QnaVO qnaVO)throws Exception {
		
		return qnaDAO.qnaDelete(qnaVO);
	}
	
	//update
	public int qnaUpdate(QnaVO qnaVO)throws Exception{
		
		return qnaDAO.qnaUpdate(qnaVO);
	}
	
	//reply
	public int qnaReply(QnaVO qnaVO)throws Exception {
		
		QnaVO parent =(QnaVO)qnaDAO.qnaSelect(qnaVO);
		System.out.println(qnaVO.getPro_num());
		System.out.println(qnaVO.getQna_num());
		
		int result = qnaDAO.qnaReplyUpdate(qnaVO);
		//parent.setPro_num(qnaVO.getPro_num());
		//parent.setQna_num(qnaVO.getQna_num());
		parent.setTitle(qnaVO.getTitle());
		parent.setWriter(qnaVO.getWriter());
		parent.setContents(qnaVO.getContents());
		parent.setStep(parent.getStep()+1);
		parent.setDepth(parent.getDepth()+1);
		
		return qnaDAO.qnaReply(parent);
		
	}
}
