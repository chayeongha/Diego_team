package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.admin.AdminVO;
import com.diego.mid.model.admin.ProManageVO;
import com.diego.mid.model.member.MemberVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.QnaVO;
import com.diego.mid.util.Pager;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE="adminMapper.";
	
	
	//adminCheckID
	public AdminVO adminCheckId(AdminVO adminVO)throws Exception{
		return session.selectOne(NAMESPACE+"adminCheckId", adminVO);
	}
	
	//adminJoin
	public int adminJoin(AdminVO adminVO)throws Exception{
		return session.insert(NAMESPACE+"adminJoin", adminVO);
	}
	//adminLogin
	public AdminVO adminLogin(AdminVO adminVO)throws Exception{
		return session.selectOne(NAMESPACE+"adminLogin", adminVO);
	}
	
	//adminUpdate
	public int adminUpdate(AdminVO adminVO)throws Exception{
		return session.update(NAMESPACE+"adminUpdate", adminVO);
	}
	//adminDelete
	public int adminDelete(AdminVO adminVO)throws Exception{
		return session.delete(NAMESPACE+"adminDelete", adminVO);
	}
	
	//memberManage List
	public List<MemberVO> memberList(Pager pager)throws Exception{
		return session.selectList(NAMESPACE+"memberList", pager);
	}
	
	//member Count
	public int memberCount(Pager pager)throws Exception{
		return session.selectOne(NAMESPACE+"memberCount", pager);
	}
	
	//member SelectOne
	public MemberVO memberSelect(MemberVO memberVO)throws Exception{
		return session.selectOne(NAMESPACE+"memberSelect", memberVO);
	}
	//member Update
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return session.update(NAMESPACE+"memberUpdate", memberVO);
	}
	
	//product Count
	public int productCount(Pager pager)throws Exception{
		return session.selectOne(NAMESPACE+"productCount", pager);
	}
	//proManage List
	public List<ProManageVO> proManageList(Pager pager)throws Exception{
		return session.selectList(NAMESPACE+"proManageList", pager);
	}
	
	//product delete
		public int productDelete(ProManageVO proManageVO)throws Exception{
			return session.delete(NAMESPACE+"productDelete", proManageVO);
			
		}
		
////////////////////////////////////////////////////
	//QNA List
		//리스트
		public List<QnaVO> qnaList(Pager pager)throws Exception{
			
			return session.selectList(NAMESPACE+"qnaList", pager);
		}
		
		//페이져카운트
		public int qnaCount(Pager pager)throws Exception{
			
			return session.selectOne(NAMESPACE+"qnaCount", pager);
		}
		
	
}
