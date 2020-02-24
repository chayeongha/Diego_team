package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.product.ImagesVO;

@Repository
public class ImagesDAO {

	@Inject SqlSession sqlSession;
	
	private final static String NAMESPACE= "imagesMapper.";


	//insert
	public int imagesInsert(ImagesVO imagesVO)throws Exception {
		
		return sqlSession.insert(NAMESPACE+"imagesInsert", imagesVO);
	}
	
	
	//list
	public List<ImagesVO> imagesList( int pro_num)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"imagesList", pro_num);
	}
	
	//select
	public ImagesVO imagesSelect(ImagesVO imagesVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"imagesSelect", imagesVO);
	}
	
	
	
}
