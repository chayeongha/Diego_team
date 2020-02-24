package com.diego.mid.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.util.MPager;



@Repository
public class ProductDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE="productMapper.";

	//pro_num을가져온다.
	/*
	 * public int getProNum() throws Exception{
	 * 
	 * return sqlSession.selectOne(NAMESPACE+"getProNum"); }
	 */
	

	//list
	public List<ProductVO> productList(MPager pager)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"productList", pager);
	}
	
	
	//insert
	public int productInsert(ProductVO productVO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"productInsert", productVO);
	}	
	
	//상품등록갯수count
	public int productCount(MPager pager)throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"productCount", pager);
	}
	
	
	//delete
	public int productDelete(ProductVO productVO)throws Exception{
		
		return sqlSession.delete(NAMESPACE+"productDelete", productVO);
		
	}
	
	//selectOne
	public ProductVO productSelect(ProductVO productVO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"productSelect", productVO);
	}
	
	
	
	//update
	public int productUpdate(ProductVO productVO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"productUpdate", productVO);
		
	}
	
	//리뷰작성
		public int productReview(ReviewVO reviewVO)throws Exception {
			
			return sqlSession.insert(NAMESPACE+"productReview",reviewVO );
		}
		
	//셀렉트된리뷰리스트
		public List<ReviewVO> reviewList(MPager pager, ProductVO productVO)throws Exception{
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("pro", productVO);
			map.put("pager", pager);
			
			
			//System.out.println(productVO.getPro_num()+"pro_num입니다.");성공
			pager= (MPager)map.get("pager");
			
			//System.out.println(pager.getStartRow());
			//System.out.println(pager.getLastRow());
			return sqlSession.selectList(NAMESPACE+"reviewList", map);
		}
		
	//셀렉트된 리뷰리스트의개수
		public int reviewCount(ProductVO productVO)throws Exception {
			
			return sqlSession.selectOne(NAMESPACE+"reviewCount", productVO);
		}
			
	//리뷰 삭제
		public int reviewDelete(ReviewVO reviewVO)throws Exception {
			return sqlSession.delete(NAMESPACE+"reviewDelete", reviewVO);
			
		}
	//리뷰 업데이트
		public int reviewUpdate(ReviewVO reviewVO)throws Exception {
			
			return sqlSession.update(NAMESPACE+"reviewUpdate", reviewVO);
		}
		
	//상품정보가져오기
	public ProductVO productGetInfo(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"productGetInfo",productVO);
	}
}
