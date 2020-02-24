package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.RevFilesDAO;
import com.diego.mid.dao.ReviewDAO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.RevFilesVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.util.MPager;
import com.diego.mid.util.PPager;
import com.diego.mid.util.Pager;

@Service
public class ReviewService {
	
	@Inject 
	private ReviewDAO reviewDAO;
	
	@Inject 
	private RevFilesDAO revFilesDAO;
	//리뷰 인서트
	public int reviewWrite(ReviewVO reviewVO)throws Exception{
		return reviewDAO.reviewWrite(reviewVO);
	}
	
	//(상품+이미지+리뷰+리뷰파일)리스트
	
	 public List<ProductVO> reviewList(PPager pager)throws Exception{
	 pager.makeRow();
	 pager.makePage(reviewDAO.productCount(pager));
	 return reviewDAO.reviewList(pager); 
	 }
	 	
	//리뷰첨부파일가져오기
	public RevFilesVO photoReview(Integer rev_num)throws Exception{
		
		return reviewDAO.photoReview(rev_num);
	} 
	 
	//별점 평균
	public double totalStar(ReviewVO reviewVO)throws Exception {
		
		return reviewDAO.totalStar(reviewVO);
	}
	
	//한상품리뷰갯수
	public Integer totalReview(ReviewVO reviewVO)throws Exception{
		
		return reviewDAO.totalReview(reviewVO);
	}
	
	//리뷰 셀렉트
	public ReviewVO selectReview(ReviewVO reviewVO, RevFilesVO revFilesVO)throws Exception{
		System.out.println(reviewVO.getRev_num()+"= 서비스");
		
		revFilesVO.setRev_num(reviewVO.getRev_num());
		
		List<RevFilesVO> ar = revFilesDAO.fileList(revFilesVO);
		
		reviewVO.setFiles(ar);
		//System.out.println(reviewVO.getRev_num()+"= 서비스2");
		return reviewDAO.selectReview(reviewVO);
	}
	
	
	//리뷰 카운트
//    public int reviewCount(Pager pager)throws Exception {
//    	
//    	return reviewDAO.reviewCount(pager);
//    }

   
}
