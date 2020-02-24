package com.diego.mid.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.member.MemberVO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "memberMapper.";
	
	//가입
	public int memberInsert(MemberVO memberVO) throws Exception{
		return session.insert(NAMESPACE+"memberInsert",memberVO);
	}
	
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return session.selectOne(NAMESPACE+"memberLogin",memberVO);
	}
	
	//수정
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return session.update(NAMESPACE+"memberUpdate",memberVO);
	}
	
	//탈퇴
	public int memberDelete(MemberVO memberVO) throws Exception{
		return session.delete(NAMESPACE+"memberDelete",memberVO);
	}
	
	//회원등급 상승
	public int memberRankUp(MemberVO memberVO) throws Exception{
		return session.update(NAMESPACE+"memberRankUp",memberVO);
	}
	
	public int getPay(MemberVO memberVO) throws Exception{
		return session.selectOne(NAMESPACE+"getPay",memberVO);
	}

	public int setPay(MemberVO memberVO) throws Exception{
		return session.update(NAMESPACE+"setPay",memberVO);
	}
}
