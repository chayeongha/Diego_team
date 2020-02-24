package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.product.ImagesVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.QnaVO;
import com.diego.mid.util.MPager;
import com.diego.mid.util.PPager;


@Repository
public class QnaDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final static String NAMESPACE="qnaMapper.";
	
	//글쓰기
	public int qnaWrite(QnaVO qnaVO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"qnaWrite",qnaVO);
	}
	
	//리스트
	public List<QnaVO> qnaList(PPager pager)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"qnaList", pager);
		
	}
	
	//페이져카운트
	public int qnaCount(PPager pager)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"qnaCount", pager);
	}
	
	//select
	public QnaVO qnaSelect(QnaVO qnaVO)throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"qnaSelect", qnaVO);
		
	}
	
	
	//셀렉트 프로덕트
	public QnaVO productSelect(ProductVO productVO)throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"productSelect", productVO);
	}
	
	//셀렉트 이미지
	public QnaVO imagesSelect(ImagesVO imagesVO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"imagesSelect", imagesVO);
	}
	
	//삭제
	public int qnaDelete(QnaVO qnaVO)throws Exception {
		
		return sqlSession.delete(NAMESPACE+"qnaDelete", qnaVO);
	}
	
	//업데이트
	public int qnaUpdate(QnaVO qnaVO)throws Exception {
		
		return sqlSession.update(NAMESPACE+"qnaUpdate", qnaVO);
	}
	
	//답변달기
	public int qnaReply(QnaVO qnaVO)throws Exception {
		
		return sqlSession.insert(NAMESPACE+"qnaReply", qnaVO);
	}
	
	public int qnaReplyUpdate(QnaVO qnaVO)throws Exception {
		
		return sqlSession.update(NAMESPACE+"qnaReplyUpdate",qnaVO);
	}
}
