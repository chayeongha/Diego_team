package com.diego.mid.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.member.Cart;
import com.diego.mid.model.member.MemberVO;
import com.diego.mid.model.member.Point;
import com.diego.mid.service.MemberManageService;
import com.diego.mid.service.MemberService;

@Controller
@RequestMapping(value = "/member/**")
public class MemberCotroller {
	@Inject
	private MemberService service;
	
	@Inject
	private MemberManageService manageService;
	
	@GetMapping("memberInsert")
	public void memberInsert() {
		
	}
	
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:memberLogin";
	}
	
	@PostMapping("memberInsert")
	public ModelAndView memberInsert(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = service.memberInsert(memberVO);
		String msg = "다시 시도해 주세요";
		String path = "#";
		if (result>0) {
			Point point = new Point();
			point.setId(memberVO.getId());
			point.setOrder_num(0);
			point.setPoint_value(5000);
			point.setContents("가입축하 포인트");
			result = manageService.pointInsert(point);
			if (result > 0) {
				msg = "가입을 축하드립니다!";
				path = "/mid/member/memberLogin";
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_msg");
		
		return mv;
	}
	
	@GetMapping("memberLogin")
	public void memberLogin() {
		
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = service.memberLogin(memberVO);
		String msg = "0";
		if (memberVO != null) {
			int ru = service.memberRankUp(memberVO);
			if (ru == 1) {
				memberVO = service.memberLogin(memberVO);
			}
			msg = "1";
			session.setAttribute("member", memberVO);

			int up = 20000;
			int x = 2;
			int ps = 1;
			if (memberVO.getMem_rank().equals("SILVER")) {
				ps =2;
				x = 5;
				up=100000;
			}else if (memberVO.getMem_rank().equals("GOLD")) {
				ps = 5;
				x = 10;
				up=300000;
			}else if (memberVO.getMem_rank().equals("DIAMOND")) {
				ps = 10;
				x = 15;
				up=100000000;
			}
			
			Cart cart = new Cart();
			cart.setId(memberVO.getId());
			List<Integer> cr = manageService.cartOverlapCheck(cart);
			
			session.setAttribute("cc", cr.size());
			if (memberVO.getPhone().length()>2) {				
				session.setAttribute("p1", memberVO.getPhone().substring(0, 3));
				session.setAttribute("p2", memberVO.getPhone().substring(3, 7));
				session.setAttribute("p3", memberVO.getPhone().substring(7));
			}
			session.setAttribute("x", x);
			session.setAttribute("ps", ps);
			session.setAttribute("up", up);
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public void memberUpdate(HttpSession session) {
		
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = service.memberUpdate(memberVO);
		if (result>0) {
			session.removeAttribute("member");
			session.setAttribute("member", service.memberLogin(memberVO));
			mv.addObject("msg", "수정하였습니다");
			mv.addObject("path", "/mid/diego");
			mv.setViewName("common/common_msg");
		}else {
			mv.setViewName("/mid/diego");
		}

		return mv;
	}
	
	
	@GetMapping("memberSelect")
	public void memberSelect(HttpSession session) {

	}
	
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
	int result = service.memberDelete(memberVO);
	String msg = "0";
	if (result>0) {
		msg = "1";
		session.invalidate();
	}
	mv.addObject("msg", msg);
	mv.setViewName("common/common_ajax_result");
	return mv;
	}
	
	
}
