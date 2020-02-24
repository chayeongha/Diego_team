package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.RevFilesVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.util.MPager;
import com.diego.mid.util.PPager;
import com.diego.mid.util.Pager;

@Repository
public class ReviewDAO {
	
	@Inject SqlSession sqlSession;
	
	private final static String NAMESPACE="reviewMapper.";
	
	//리뷰작성
	public int reviewWrite(ReviewVO reviewVO)throws Exception {
		
		return sqlSession.insert(NAMESPACE+"reviewWrite",reviewVO );
	}
	
	
	//(상품+이미지+리뷰+리뷰파일)리스트
	
	 public List<ProductVO> reviewList(PPager pager)throws Exception{ 

		 return sqlSession.selectList(NAMESPACE+"reviewList",pager); 
		 
	 }
	 
	//리뷰첨부파일가져오기
	 public RevFilesVO photoReview(Integer rev_num)throws Exception{

		 return sqlSession.selectOne(NAMESPACE+"photoReview",rev_num);	
		 
	 }

//	//리뷰카운트 
//	public int reviewCount(Pager pager)throws Exception {
//		
//		return sqlSession.selectOne(NAMESPACE+"reviewCount", pager);
//	}
	
	//프로덕트카운트
	public int productCount(PPager pager)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"productCount",pager);
	}
	
	//별점평균
	public double totalStar(ReviewVO reviewVO)throws Exception {
		 return sqlSession.selectOne(NAMESPACE+"totalStar",reviewVO);
		
	}
	
	//한상품리뷰갯수
	public Integer totalReview(ReviewVO reviewVO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"totalReview", reviewVO);
		
	}
	
	//리뷰 셀렉트
	public ReviewVO selectReview(ReviewVO reviewVO)throws Exception{
		//System.out.println(reviewVO.getRev_num()+"= 디에이오");
		return sqlSession.selectOne(NAMESPACE+"selectReview", reviewVO );
	}
	
}
