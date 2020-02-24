package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.util.MPager;

@Repository
public class HomeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="homeMapper.";
	
	public List<ProductVO>productList(MPager pager)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"productList", pager);
	}
	
	//상품등록갯수count
	public int productCount(MPager pager)throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"productCount", pager);
	}
	
	
	public List<ProductVO>newProduct(MPager pager)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"newProduct", pager); 
	}
	
	
	public List<ProductVO>reviewList(MPager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"reviewList",pager );
	}
	
}
