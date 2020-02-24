package com.diego.mid.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.MemberDAO;
import com.diego.mid.model.member.MemberVO;

@Service
public class MemberService {
	@Inject
	private MemberDAO dao;
	
	//가입
	public int memberInsert(MemberVO memberVO) throws Exception{
		return dao.memberInsert(memberVO);
	}
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return dao.memberLogin(memberVO);
	}
	
	//수정
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return dao.memberUpdate(memberVO);
	}
	
	//탈퇴
	
	public int memberDelete(MemberVO memberVO) throws Exception{
		return dao.memberDelete(memberVO);
	}
	
	//등급
	
	public int memberRankUp(MemberVO memberVO) throws Exception{
		
		Integer total = memberVO.getTotal_pay();
		if (total > 20000 && total <=100000) {
			memberVO.setMem_rank("SILVER");
		}else if(total > 100000 && total <=300000) {
			memberVO.setMem_rank("GOLD");
		}else if(total > 300000 && total <100000000) {
			memberVO.setMem_rank("DIAMOND");
		}else {
			memberVO.setMem_rank("HOGU");
		}
		return dao.memberRankUp(memberVO);
	}
	
	public int getPay(MemberVO memberVO) throws Exception{
		return dao.getPay(memberVO);
	}
	
	public int setPay(MemberVO memberVO) throws Exception{
		return dao.setPay(memberVO);
	}

}
